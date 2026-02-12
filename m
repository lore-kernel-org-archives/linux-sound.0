Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB132F069E
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 19:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770926361; cv=none; b=jQUwzQHrDUCgOHxNCEORkzZHIUoLOThdoeE5TEWbMmsBy9Y4oMbR8Zl5BIQbnJ/ZctgI0sj4tY1oSImPM4Z3cYx5gvo1NhTqwJpbwVP/Z4HzNbCfllgNrLidUWYSWTPKmeMhnV1kfu/nweRRT0soTeSUaGmg3JD12yj7ZWuVPHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770926361; c=relaxed/simple;
	bh=tg2EwCUTVZmfOhOwKjzaTGoOA0y/UYUyE6Jwkwlp/8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ur03uj6jOOiPbcX7aRYhycfzv9zvnclK4JkbQ0jfHtQSwWy0aTOxc26TAg07z2Pws5MOWvHgpPSHubYDPCklxi7K2KWv61zGZzBBIurxlpXvxkag9TG7ll8VOrOFDIdto7md7rsbllfAYun7h6tQhOHyQ5r/hY0ihjhH0onITQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=35.89.44.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id qaJiviPgBKjfoqcqHv4OXq; Thu, 12 Feb 2026 19:59:13 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id qcqGviR34qfpWqcqGvaU6B; Thu, 12 Feb 2026 19:59:13 +0000
X-Authority-Analysis: v=2.4 cv=A55sP7WG c=1 sm=1 tr=0 ts=698e3111
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=Xv3QmfCZVje3vF-VhOsA:9
 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=34080 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vqcqE-000000042TO-3FB4;
	Thu, 12 Feb 2026 12:59:10 -0700
From: Tim Bird <tim.bird@sony.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH] sound: isa: Add SPDX id lines to some files
Date: Thu, 12 Feb 2026 12:59:05 -0700
Message-ID: <20260212195905.3726149-1-tim.bird@sony.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2044.hostmonster.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sony.com
X-BWhitelist: no
X-Source-IP: 66.118.46.62
X-Source-L: No
X-Exim-ID: 1vqcqE-000000042TO-3FB4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:34080
X-Source-Auth: tim@bird.org
X-Email-Count: 20
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfAFlQvBJ+eqSy4GwEGzbnSrjz7q/Cd89jdBbEuoFMqfBaxL1ThrKLvaejryziXYS2tCtJfoBsXp6m6xWaN2oJ1YVAMwqM8TFBDVVo06rhzOlzphbmxzx
 JS4dh03qsAjtrASx43xWhKJThu93EM4RZ3C37kBqgOFSl1p07JrMFJknc/h7k5Z6sdm5teMS4QzpnxO/uUiT4MLwlrMw6jRP29U=

Add SPDX-License-Identifier lines to several files where
they are missing, mostly in the sound/isa subdir.
Use GPL-2.0 as the id.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 sound/hda/core/trace.c             | 1 +
 sound/isa/gus/interwave-stb.c      | 1 +
 sound/isa/msnd/msnd_classic.c      | 1 +
 sound/isa/opti9xx/opti92x-cs4231.c | 1 +
 sound/isa/opti9xx/opti93x.c        | 1 +
 sound/isa/sb/jazz16.c              | 7 +------
 sound/isa/sb/sbawe.c               | 1 +
 7 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/hda/core/trace.c b/sound/hda/core/trace.c
index ca2d6bd94518..c18759ca48ea 100644
--- a/sound/hda/core/trace.c
+++ b/sound/hda/core/trace.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * tracepoint definitions for HD-audio core drivers
  */
diff --git a/sound/isa/gus/interwave-stb.c b/sound/isa/gus/interwave-stb.c
index dbe4f48a9846..9b3468c8bc43 100644
--- a/sound/isa/gus/interwave-stb.c
+++ b/sound/isa/gus/interwave-stb.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
 #define SNDRV_STB
 #include "interwave.c"
diff --git a/sound/isa/msnd/msnd_classic.c b/sound/isa/msnd/msnd_classic.c
index 3b23a096fa4e..9c37c9fb94ab 100644
--- a/sound/isa/msnd/msnd_classic.c
+++ b/sound/isa/msnd/msnd_classic.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* The work is in msnd_pinnacle.c, just define MSND_CLASSIC before it. */
 #define MSND_CLASSIC
 #include "msnd_pinnacle.c"
diff --git a/sound/isa/opti9xx/opti92x-cs4231.c b/sound/isa/opti9xx/opti92x-cs4231.c
index b17ab19f6d81..e27dc9093c02 100644
--- a/sound/isa/opti9xx/opti92x-cs4231.c
+++ b/sound/isa/opti9xx/opti92x-cs4231.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
 #define CS4231
 #include "opti92x-ad1848.c"
diff --git a/sound/isa/opti9xx/opti93x.c b/sound/isa/opti9xx/opti93x.c
index bad9da521bf9..cd1fa4635b26 100644
--- a/sound/isa/opti9xx/opti93x.c
+++ b/sound/isa/opti9xx/opti93x.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 #define OPTi93X
 #include "opti92x-ad1848.c"
 
diff --git a/sound/isa/sb/jazz16.c b/sound/isa/sb/jazz16.c
index 69d9bfb6c14c..3f2a5c4e47a7 100644
--- a/sound/isa/sb/jazz16.c
+++ b/sound/isa/sb/jazz16.c
@@ -1,14 +1,9 @@
-
+// SPDX-License-Identifier: GPL-2.0
 /*
  * jazz16.c - driver for Media Vision Jazz16 based soundcards.
  * Copyright (C) 2009 Krzysztof Helt <krzysztof.h1@wp.pl>
  * Based on patches posted by Rask Ingemann Lambertsen and Rene Herman.
  * Based on OSS Sound Blaster driver.
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file COPYING in the main directory of this archive for
- * more details.
- *
  */
 
 #include <linux/init.h>
diff --git a/sound/isa/sb/sbawe.c b/sound/isa/sb/sbawe.c
index 2ec52a3473a2..1e00a6b4a1bd 100644
--- a/sound/isa/sb/sbawe.c
+++ b/sound/isa/sb/sbawe.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
 #define SNDRV_SBAWE
 #include "sb16.c"
-- 
2.43.0

