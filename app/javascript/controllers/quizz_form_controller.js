import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["video", "fileInput"];

  mediaRecorder = null;
  recordedChunks = [];
  mediaStream = null;

  connect() {
    console.log("on webcam pas ns ?");
    navigator.mediaDevices.getUserMedia({ video: true, audio: true })
      .then((stream) => {
        this.mediaStream = stream;
        this.videoTarget.srcObject = stream;
        this.initializeMediaRecorder(stream);
      })
      .catch((error) => {
        console.error("Error accessing webcam:", error);
      });
  }

  disconnect() {
    console.log("disconnect");
    if (this.mediaRecorder && this.mediaRecorder.state !== "inactive") {
      this.mediaRecorder.stop();
    }
    if (this.mediaStream) {
      this.mediaStream.getTracks().forEach((track) => {
        track.stop();
      });
    }
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

      const dataTransfer = new DataTransfer();
      dataTransfer.items.add(recordedFile);

      this.fileInputTarget.files = dataTransfer.files;
    });
    this.videoTarget.pause();
    this.mediaRecorder.stop();
    this.mediaStream.stop();
  }
}
