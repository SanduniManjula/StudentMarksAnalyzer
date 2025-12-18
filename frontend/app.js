let students = [];

function addStudent() {
  const name = document.getElementById("name").value;
  const marks = document.getElementById("marks").value.split(",").map(Number);
  students.push({ name, marks });
  alert("Student added!");
}

function submitData() {
  fetch("http://localhost:3000/analyze", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(students),
  })
    .then((res) => res.json())
    .then((data) => {
      document.getElementById("results").innerText = JSON.stringify(
        data,
        null,
        2
      );
      renderChart(data[0]); // ranked results
    });
}

function renderChart(results) {
  const ctx = document.getElementById("chart");
  const names = results.map((s) => s.studentName);
  const scores = results.map((s) => s.finalScore);

  new Chart(ctx, {
    type: "bar",
    data: { labels: names, datasets: [{ label: "Final Score", data: scores }] },
  });
}
