glide.autocmds.create(
  "UrlEnter",
  {
    hostname: "mail.google.com",
  },
  async () => {
    await glide.excmds.execute("mode_change ignore");
    return () => glide.excmds.execute("mode_change normal");
  },
);
