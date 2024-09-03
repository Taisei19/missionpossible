document.getElementById('generate_goal_image').addEventListener('click', function() {
  const goal = document.getElementById('goal').value;

  if (goal.trim() === '') {
    alert('ゴールを入力してください。');
    return;
  }

  // 画像生成リクエストを送信
  fetch('/generate_goal_image', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content
    },
    body: JSON.stringify({ goal: goal })
  })
  .then(response => response.json())
  .then(data => {
    if (data.image_url) {
      // 画像を表示
      const img = document.createElement('img');
      img.src = data.image_url;
      img.alt = 'Goal Image';
      img.style.maxWidth = '100%';

      const container = document.getElementById('goal_image_container');
      container.innerHTML = ''; // 既存の画像をクリア
      container.appendChild(img);
    } else {
      alert('画像の生成に失敗しました。');
    }
  });
});