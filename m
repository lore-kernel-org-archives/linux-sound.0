Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8782D275861
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 20:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770927553; cv=none; b=HvFmqpTUURN+tK4hFh3Z9u3gLvTBi4JHVPsCR6PXNWkaw3X1OfiPbhsl8ZQnxYGMLfL9emb5PGJknzNVx2Ck0MCkmAI/zQVmE2Rrta6KGZDmiMwb3MUfQBpx/MdfPcAks9JqeBTpFluKpJ1qJ5w/x7lOv3RDU9o+Y0THjlX6sPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770927553; c=relaxed/simple;
	bh=i+qvj9x6VmcRalaZgd32+nLkCSr+wOgBIK1nP+mebPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rd5LQnLBELg5uH+UkmOwEUauf/aUXudwHEJ2mPbJFFnghuP1WUnw40zkCDnJFmLfFxTCAJSa9k88V5P5Ts0ch+VH7fWB8RvTGAGLJwS27M3NW+CREpYp8Td1l5P6stGB3t3l69YVZfvGFT2BMZJJTh7STXEW2f3Ezn6Km4jQoEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id qaKJvdqH2Skcfqd9avVlff; Thu, 12 Feb 2026 20:19:10 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id qd9ZvOOvxHSQMqd9aviuQd; Thu, 12 Feb 2026 20:19:10 +0000
X-Authority-Analysis: v=2.4 cv=GIQIEvNK c=1 sm=1 tr=0 ts=698e35be
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=DynsBFSEUln9YBO7LhAA:9
 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=47758 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vqd9X-0000000026J-0EYL;
	Thu, 12 Feb 2026 13:19:07 -0700
From: Tim Bird <tim.bird@sony.com>
To: perex@perex.cz,
	tiwai@suse.com,
	clemens@ladisch.de,
	tglx@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH] sound: usb: Add SPDX id to midi.c
Date: Thu, 12 Feb 2026 13:18:59 -0700
Message-ID: <20260212201859.3727133-1-tim.bird@sony.com>
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
X-Exim-ID: 1vqd9X-0000000026J-0EYL
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:47758
X-Source-Auth: tim@bird.org
X-Email-Count: 3
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfIYUOyd/MTtdUPib7u5odHl0TYVeJf+iRHijkj7el3emkwJOwFd4itpsL514ZwJeUT8xf2q/rqqgVB1w36Wh1Cj0zMpTp6fTso5BqM7VO99lamtGcYwp
 7L9pligh+o8eyGwmIkYiOtn7hqZnGTrvbsCqJxCbOk/FoR1bObTv3hGwvqkIS63319F+kjUqAkWaFQtfTYjoRw06e0t3+2/bpoU=

Add an SPDX-License-Identifier line to sound/usb/midi.c
Use the 'Ladisch' BSD variant (BSD-variant1) as part of the OR for the
license id.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 sound/usb/midi.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index dd8249e75970..44546f027941 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR LicenseRef-BSD-variant1
 /*
  * usbmidi.c - ALSA USB MIDI driver
  *
@@ -7,32 +8,6 @@
  * Based on the OSS usb-midi driver by NAGANO Daisuke,
  *          NetBSD's umidi driver by Takuya SHIOZAKI,
  *          the "USB Device Class Definition for MIDI Devices" by Roland
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions, and the following disclaimer,
- *    without modification.
- * 2. The name of the author may not be used to endorse or promote products
- *    derived from this software without specific prior written permission.
- *
- * Alternatively, this software may be distributed and/or modified under the
- * terms of the GNU General Public License as published by the Free Software
- * Foundation; either version 2 of the License, or (at your option) any later
- * version.
- *
- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE FOR
- * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
  */
 
 #include <linux/kernel.h>
-- 
2.43.0

