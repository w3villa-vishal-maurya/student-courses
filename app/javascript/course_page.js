const contentBars = document.querySelectorAll('.content-bar');

contentBars.forEach((contentBar) => {
  contentBar.addEventListener('click', () => {
    const contentId = contentBar.dataset.contentId;
    const detailsDiv = document.getElementById(`content-details-${contentId}`);

    if (detailsDiv) {
      detailsDiv.classList.toggle('hidden');
    }
  });
});