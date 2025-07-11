{

  autoCmd = [
    {
      event = [
        "BufEnter"
        "BufWinEnter"
      ];
      pattern = [
        "*.css"
        "*.html"
      ];
      command = "<CMD>ColorizerToggle<CR>";
    }
  ];
}
