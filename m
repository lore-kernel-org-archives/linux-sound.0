Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13AB32AAD4
	for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 23:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371712; cv=none; b=Jusil+sXV5Zb3QZncjpiEmjr6StH1Gd7qJLroQohR3yubXbTh4vItbIeAqkkAVrr5G0/2ist1kzpK3CFV12Ch4q0LOVnzHDa4+7baaC8dyY3MK5y69fB9S8mY9YHsisLIvAW6YGt1F90VlH+rHqXy9mlS/c8i78inUcMsHDGJzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371712; c=relaxed/simple;
	bh=4hfn3PBi7I/B19iPKHgTjONPmeWwo5KecgL0TyrkDK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MXfF11FTTe8TenPTpfsXFUkQpeYSjmRqFaKZ/7hrNF4s24xp1CKsretCSGflzxqIhl0gZ20Jo+j1cnI6Zy92+HL6/aXJBO7u+ICJPzE0YOVVE30jwx5muvma0tSoF4oeejlaycset47q9j5GJ/w4IsJ/bi53ahim+ieVY2yXqNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id sT4rvkzapipkCsUhNvjKFu; Tue, 17 Feb 2026 23:41:45 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id sUhMvstTiK8vzsUhMvGf4i; Tue, 17 Feb 2026 23:41:45 +0000
X-Authority-Analysis: v=2.4 cv=cJDgskeN c=1 sm=1 tr=0 ts=6994fcb9
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=DynsBFSEUln9YBO7LhAA:9
 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=34728 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vsUhG-000000013Ug-2Bes;
	Tue, 17 Feb 2026 16:41:38 -0700
From: Tim Bird <tim.bird@sony.com>
To: perex@perex.cz,
	tiwai@suse.com,
	clemens@ladisch.de
Cc: linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH v2] ALSA: usb-audio: Add SPDX id to midi.c
Date: Tue, 17 Feb 2026 16:41:24 -0700
Message-ID: <20260217234124.242053-1-tim.bird@sony.com>
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
X-Exim-ID: 1vsUhG-000000013Ug-2Bes
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:34728
X-Source-Auth: tim@bird.org
X-Email-Count: 12
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfGhcKf4fjuJ3m450AGPx0ss/SVsRPIlkBsESEiXlkHInzyc8SH0pkbLs2nh7sKVbeovy2SnlfB1WZEU3yDzh7WAxiGBs87ZqLyd2qpGYTdjEh0Oexkrd
 5UuBh1Fcqz7Xg5f4X7815OIzbTdc2Zx/ZxIaGYefO7OE0Y8X5OUeR2LiSx9zTYChtGjwIZ6uQEc1OpMG+Vi0fa1fQmNYWUt9f/o=

Add an SPDX-License-Identifier line to sound/usb/midi.c
Use 'BSD-Source-Code' as part of the OR for the
license id.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
This patch depends on the one for opl4 sound driver, as that
one adds the BSD-Source-Code license for the LICENSES directory.

V1 -> V2
 - Change to use BSD-Source-Code, from the weird LicenseRef variant
   thing I was doing before.  This is a supported SPDX ID.
 - Use better subject prefix (ALSA: usb-audio:)
---
 sound/usb/midi.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index dd8249e75970..e6e8618a232a 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-Source-Code
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

