Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C6F1A9FBA
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 18:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770921085; cv=none; b=dlUPN+actHNWJfEJa0OFAnOwbRpsgfCzkStjM5E4+eeTjRyQLxC6dVKlN0uyaQSy2r+x6lKWuMpc0aZRwfd3pdSCPn33XjhD8jpSJ2RIsOO1VIyKCFu7wrOuWOibupl3YWeTJTrkeSb8VL0HyY4qL2uXPsPKf5dAb7jGQcoo3aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770921085; c=relaxed/simple;
	bh=ZvfsJllkKu+Pbf4uWXJo/Xj6tsq8n6O+CzE9psDE/Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GCq2GOQhzSHLjVlYmMJCrvn/xL4RejIMqEoNz+o3DRmyrngaiC+1vJDp3W/CHqneEd9H0F0pgbva5J94SWjIY7L70ZfjlvjwYSuaTIaNev1cuKnqqBd86hIQxOHwIHks3Zb+fyHFP6Ft0bMjsVRpQZ5YpUr6tu0h9Fred+dSB28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id qVMbvAjBZCxrGqbTAv0ifv; Thu, 12 Feb 2026 18:31:16 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id qbT9vxt3aV6WMqbTAv3ORr; Thu, 12 Feb 2026 18:31:16 +0000
X-Authority-Analysis: v=2.4 cv=E//Npbdl c=1 sm=1 tr=0 ts=698e1c74
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=foHCeV_ZAAAA:8 a=nttIoOZdAhEHGoIFS30A:9
 a=h8a9FgHX5U4dIE3jaWyr:22 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=36044 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vqbT8-00000002M3F-1QSe;
	Thu, 12 Feb 2026 11:31:14 -0700
From: Tim Bird <tim.bird@sony.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH] sound: core: Add SPDX license id to files
Date: Thu, 12 Feb 2026 11:31:03 -0700
Message-ID: <20260212183103.3720788-1-tim.bird@sony.com>
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
X-Exim-ID: 1vqbT8-00000002M3F-1QSe
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:36044
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfILz9iN17yxFu+OjFESZWsIYFVo49mGVUGj7LjOSd6hS/Tt1Cwq2ZXB+VNeCYlv8IFns1duISRHDRclMbN/tUt23SCsVO3WXM7dm+TrnKW7KuR/q2VNn
 HtqP9QO6OR48AP1bFE+tPu//GzmoiYwEAdrPdk17CG01y3L6feM1cBJEhPsAlG33gHNglBdGt7PeJqAzr5hdX9NeP3gQsmqhQjE=

Add an SPDX id of LGPL-2.0+ to files in the
sound core sub-system that are missing ids.  Remove
boilerplate text.

These files were originally submitted in a big commit
for the ALSA sound system for kernel version 2.5.4,
by Jaroslav Kysela, in Feb 2002.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 sound/core/oss/copy.c       | 17 +----------------
 sound/core/oss/io.c         | 17 +----------------
 sound/core/oss/linear.c     | 17 +----------------
 sound/core/oss/mulaw.c      | 16 +---------------
 sound/core/oss/pcm_plugin.c | 17 +----------------
 sound/core/oss/rate.c       | 17 +----------------
 sound/core/oss/route.c      | 17 +----------------
 sound/core/pcm_misc.c       | 19 ++-----------------
 8 files changed, 9 insertions(+), 128 deletions(-)

diff --git a/sound/core/oss/copy.c b/sound/core/oss/copy.c
index 05b58d4fc2b7..467fc6847bc9 100644
--- a/sound/core/oss/copy.c
+++ b/sound/core/oss/copy.c
@@ -1,22 +1,7 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  Linear conversion Plug-In
  *  Copyright (c) 2000 by Abramo Bagnara <abramo@alsa-project.org>
- *
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
 
 #include <linux/time.h>
diff --git a/sound/core/oss/io.c b/sound/core/oss/io.c
index d870b2d93135..9317f971a0d3 100644
--- a/sound/core/oss/io.c
+++ b/sound/core/oss/io.c
@@ -1,22 +1,7 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  PCM I/O Plug-In Interface
  *  Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>
- *
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
   
 #include <linux/time.h>
diff --git a/sound/core/oss/linear.c b/sound/core/oss/linear.c
index 797d838a2f9e..6e51cfdca238 100644
--- a/sound/core/oss/linear.c
+++ b/sound/core/oss/linear.c
@@ -1,23 +1,8 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  Linear conversion Plug-In
  *  Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>,
  *			  Abramo Bagnara <abramo@alsa-project.org>
- *
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
 
 #include <linux/time.h>
diff --git a/sound/core/oss/mulaw.c b/sound/core/oss/mulaw.c
index fe27034f2846..a95386e55fa1 100644
--- a/sound/core/oss/mulaw.c
+++ b/sound/core/oss/mulaw.c
@@ -1,24 +1,10 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  Mu-Law conversion Plug-In Interface
  *  Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>
  *                        Uros Bizjak <uros@kss-loka.si>
  *
  *  Based on reference implementation by Sun Microsystems, Inc.
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
   
 #include <linux/time.h>
diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
index 82e180c776ae..a4c8c9f538f1 100644
--- a/sound/core/oss/pcm_plugin.c
+++ b/sound/core/oss/pcm_plugin.c
@@ -1,23 +1,8 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  PCM Plug-In shared (kernel/library) code
  *  Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>
  *  Copyright (c) 2000 by Abramo Bagnara <abramo@alsa-project.org>
- *
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
   
 #if 0
diff --git a/sound/core/oss/rate.c b/sound/core/oss/rate.c
index b56eeda5e30e..68711ad251ee 100644
--- a/sound/core/oss/rate.c
+++ b/sound/core/oss/rate.c
@@ -1,22 +1,7 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  Rate conversion Plug-In
  *  Copyright (c) 1999 by Jaroslav Kysela <perex@perex.cz>
- *
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
   
 #include <linux/time.h>
diff --git a/sound/core/oss/route.c b/sound/core/oss/route.c
index 72dea04197ef..20f7032d12bb 100644
--- a/sound/core/oss/route.c
+++ b/sound/core/oss/route.c
@@ -1,22 +1,7 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  Route Plug-In
  *  Copyright (c) 2000 by Abramo Bagnara <abramo@alsa-project.org>
- *
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
 
 #include <linux/time.h>
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 71eec32a7a0a..180b6b64a448 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -1,24 +1,9 @@
+// SPDX-License-Identifier: LGPL-2.0+
 /*
  *  PCM Interface - misc routines
  *  Copyright (c) 1998 by Jaroslav Kysela <perex@perex.cz>
- *
- *
- *   This library is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU Library General Public License as
- *   published by the Free Software Foundation; either version 2 of
- *   the License, or (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU Library General Public License for more details.
- *
- *   You should have received a copy of the GNU Library General Public
- *   License along with this library; if not, write to the Free Software
- *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA
- *
  */
-  
+
 #include <linux/time.h>
 #include <linux/export.h>
 #include <sound/core.h>
-- 
2.43.0

