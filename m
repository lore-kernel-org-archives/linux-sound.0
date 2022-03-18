From: Elijah Harding <eharding830@gmail.com>
Date: Fri, 18 Mar 2022 01:52:01 +0000
Subject: [PATCH] sound: core: Fix typo in 'PCM Timer Interface' help
Message-Id: <20220318015201.30871-1-eharding830@gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Signed-off-by: Elijah Harding <eharding830@gmail.com>
---
 sound/core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index db2e3c63ff41..dd7b40734723 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -84,7 +84,7 @@ config SND_PCM_TIMER
 	help
 	  If you disable this option, pcm timer will be unavailable, so
 	  those stubs that use pcm timer (e.g. dmix, dsnoop & co) may work
-	  incorrectlly.
+	  incorrectly.
 
 	  For some embedded devices, we may disable it to reduce memory
 	  footprint, about 20KB on x86_64 platform.
-- 
2.34.0
