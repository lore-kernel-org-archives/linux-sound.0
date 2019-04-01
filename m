From: Matteo Croce <mcroce@redhat.com>
Date: Mon, 01 Apr 2019 10:24:55 +0000
Subject: [PATCH 4/4] oops: use the aural error reporting framework to report oopses
Message-Id: <20190401102456.11162-5-mcroce@redhat.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20190401102456.11162-1-mcroce@redhat.com>
In-Reply-To: <20190401102456.11162-1-mcroce@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org, platform-driver-x86@vger.kernel.org

Use the new aural error reporting framework when reporting an oops. The
sound is emitted at the end of oops_exit(), to avoid interfering with other
oops actions, like stack dump.

Signed-off-by: Matteo Croce <mcroce@redhat.com>
---
 kernel/panic.c    | 18 ++++++++++++++++++
 lib/Kconfig.debug | 10 ++++++++++
 2 files changed, 28 insertions(+)

diff --git a/kernel/panic.c b/kernel/panic.c
index b87c4403924d..ea34f93ce410 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -97,6 +97,23 @@ static struct note warn_sound[] = {
 };
 #endif
 
+#ifdef CONFIG_AUDIBLE_OOPS
+static struct note oops_sound[] = {
+	{ 494, 100 },
+	{ 698, 100 },
+	{   0, 100 },
+	{ 698, 100 },
+	{ 698, 133 },
+	{ 659, 133 },
+	{ 587, 133 },
+	{ 523, 100 },
+	{ 330, 100 },
+	{ 262, 100 },
+	{ 330, 100 },
+	{ 262, 100 },
+};
+#endif
+
 static long no_blink(int state)
 {
 	return 0;
@@ -575,6 +592,7 @@ void oops_exit(void)
 	do_oops_enter_exit();
 	print_oops_end_marker();
 	kmsg_dump(KMSG_DUMP_OOPS);
+	play(oops_sound, ARRAY_SIZE(oops_sound));
 }
 
 struct warn_args {
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 909c271d283b..74745ef386ce 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1017,6 +1017,16 @@ config AUDIBLE_WARN
 	  the system buzzer and not via any soundcard.
 	  Not available on all platforms.
 
+config AUDIBLE_OOPS
+	bool "Aural oops"
+	select PLAY_LIB
+	default n
+	help
+	  If you say Y here, oops will play a sound just
+	  after the stacktrace and registers dump. The sound is played via
+	  the system buzzer and not via any soundcard.
+	  Not available on all platforms.
+
 config SCHED_DEBUG
 	bool "Collect scheduler debugging info"
 	depends on DEBUG_KERNEL && PROC_FS
-- 
2.20.1
