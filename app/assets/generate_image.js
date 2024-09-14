document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("generate_goal_image").addEventListener("click", function() {
    const goal = document.getElementById("goal").value;

    if (goal) {
      fetch("/generate_image", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
        },
        body: JSON.stringify({ goal: goal })
      })
      .then(response => response.json())
      .then(data => {
        if (data.image_url) {
          const imgContainer = document.getElementById("goal_image_container");
          imgContainer.innerHTML = `<img src="${data.image_url}" alt="Goal Image" />`;
        }
      })
      .catch(error => {
        console.error("Error generating image:", error);
      });
    } else {
      alert("ゴールを入力してください！");
    }
  });
});
