Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413E2E633
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 17:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="tb1sscCU"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 141F8604B9F7; Wed, 20 Dec 2023 04:08:42 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 141F8604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007522; bh=NHjcjEOW30LqDt4IfDXMQ9aPNo751eyY/StHwOP1mLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tb1sscCUykSPgoRHHihX2OnSiwKUlM4LfDpvrTM051ia1FS8gbOhavuqhCSA5ntM2
	 yTVn7+GHII6JVFG0GhvPMIUBenDodRJLJ8oIrp0auU2hvTTKr74qkEnG7wHKvxaGVa
	 EmPZ17k1Jx1/Lu4e8dDehEHI5+6AJTrA5lcT1CuPeDculRlxbQ7kFDR1K87c9asAgt
	 yJ79e9ldGlDQE057gNlGeYuo9alfHvwgeYvLa4XpxfE6bZ6bErxR9Zp0d4KMADjcz5
	 CCKH6Vnyf+Z2lJcGviZl0sMf2oUBVRg0SbW8XAPFbjWkzWFDKeJqzCBTBVJmZxHjBN
	 ge5JBCR2l3bTg==
Date: Wed, 20 Dec 2023 04:08:42 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 07/11] ALSA: scarlett2: Add #defines for firmware upgrade
Message-ID: <3077651c21bc8d4f046c68b79ec387aa16fcc5e4.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>

Add #defines for SCARLETT2_USB_* needed for firmware upgrade:
reboot, info-flash, info-segment, erase-segment, get-erase, and
write-segment.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 73f5badceb19..129b9c97871a 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1137,17 +1137,23 @@ static int scarlett2_get_port_start_num(
 #define SCARLETT2_USB_CMD_REQ  2
 #define SCARLETT2_USB_CMD_RESP 3
 
-#define SCARLETT2_USB_INIT_1    0x00000000
-#define SCARLETT2_USB_INIT_2    0x00000002
-#define SCARLETT2_USB_GET_METER 0x00001001
-#define SCARLETT2_USB_GET_MIX   0x00002001
-#define SCARLETT2_USB_SET_MIX   0x00002002
-#define SCARLETT2_USB_GET_MUX   0x00003001
-#define SCARLETT2_USB_SET_MUX   0x00003002
-#define SCARLETT2_USB_GET_SYNC  0x00006004
-#define SCARLETT2_USB_GET_DATA  0x00800000
-#define SCARLETT2_USB_SET_DATA  0x00800001
-#define SCARLETT2_USB_DATA_CMD  0x00800002
+#define SCARLETT2_USB_INIT_1        0x00000000
+#define SCARLETT2_USB_INIT_2        0x00000002
+#define SCARLETT2_USB_REBOOT        0x00000003
+#define SCARLETT2_USB_GET_METER     0x00001001
+#define SCARLETT2_USB_GET_MIX       0x00002001
+#define SCARLETT2_USB_SET_MIX       0x00002002
+#define SCARLETT2_USB_GET_MUX       0x00003001
+#define SCARLETT2_USB_SET_MUX       0x00003002
+#define SCARLETT2_USB_INFO_FLASH    0x00004000
+#define SCARLETT2_USB_INFO_SEGMENT  0x00004001
+#define SCARLETT2_USB_ERASE_SEGMENT 0x00004002
+#define SCARLETT2_USB_GET_ERASE     0x00004003
+#define SCARLETT2_USB_WRITE_SEGMENT 0x00004004
+#define SCARLETT2_USB_GET_SYNC      0x00006004
+#define SCARLETT2_USB_GET_DATA      0x00800000
+#define SCARLETT2_USB_SET_DATA      0x00800001
+#define SCARLETT2_USB_DATA_CMD      0x00800002
 
 #define SCARLETT2_USB_CONFIG_SAVE 6
 
-- 
2.43.0

