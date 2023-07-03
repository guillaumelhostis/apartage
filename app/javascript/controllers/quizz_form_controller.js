import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["video", "fileInput"];

  mediaRecorder = null;
  recordedChunks = [];

  connect() {
  navigator.mediaDevices.getUserMedia({ video: true, audio:true })
    .then((stream) => {
      this.videoTarget.srcObject = stream;
      this.initializeMediaRecorder(stream);
    })
    .catch((error) => {
      console.error("Error accessing webcam:", error);
    });
  }

  initializeMediaRecorder(stream) {
    if (stream instanceof MediaStream) {
      this.mediaRecorder = new MediaRecorder(stream);
      this.mediaRecorder.addEventListener("dataavailable", (event) => {
        this.recordedChunks.push(event.data);
      });
    } else {
      console.error("Invalid media stream:", stream);
    }
  }

  startRecording(event) {
    event.preventDefault();
    this.recordedChunks = [];
    this.mediaRecorder = new MediaRecorder(this.videoTarget.srcObject);
    this.mediaRecorder.addEventListener("dataavailable", (event) => {
      this.recordedChunks.push(event.data);
    });
    this.mediaRecorder.start();
    this.videoTarget.play();
  }

  stopRecording(event) {
  event.preventDefault();
  this.mediaRecorder.stop();
  this.mediaRecorder.addEventListener("stop", () => {
    const recordedBlob = new Blob(this.recordedChunks, { type: "video/webm" });
    const recordedFile = new File([recordedBlob], "recorded-video.webm", { type: "video/webm" });

    // Create a new FileList using DataTransfer
    const dataTransfer = new DataTransfer();
    dataTransfer.items.add(recordedFile);

    // Set the created FileList to the files attribute of fileInputTarget
    this.fileInputTarget.files = dataTransfer.files;
  });
  this.videoTarget.pause();
}
}
