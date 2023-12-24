Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C14BD2FA
	for <linux-sound@vger.kernel.org>; Sun, 24 Dec 2023 19:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="ka3SErqh"
Received: by m.b4.vu (Postfix, from userid 1000)
	id A537A604B9CB; Mon, 25 Dec 2023 05:58:07 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu A537A604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446087; bh=bmNM1ND3vfad5XE2niTPvlky+2mjYuCyMeKzrMFpkgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka3SErqhlyDDRuqAodbhYQcmw4v19gdRpBuqHpCeTKTmEc9jpF3Z+j65aI13Aew1/
	 2HBt2y3CGwVu90kJSsNux9hl7T6vKgutaQhdwVAfrQn9hVmeFCOwWBtgZSNKAIZ0wz
	 iJqvALvlf4/XmOpSvfUkl4uO6eVU7cOzkImt3iwE1r8HCXDWlqmmkywxxXVfVws3B6
	 0QP5xmHG0YjwecrA/qXf6vsvKWTil9+e37Q952dB62Tfp42ussDvhMprNRvwoy07Ja
	 ghQw4BHvYHshzLD/I5MMn157lWcEPuZjTuXTj/nrwhsC98rcc56vykSF0jCEWPmQ7x
	 TNutmmlpBxgYQ==
Date: Mon, 25 Dec 2023 05:58:07 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 13/23] ALSA: scarlett2: Change num_mux_* from int to u8
Message-ID: <886fbd9ce7f06b13c6dbf36f64e6b2d107d16a83.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>

num_mux_srcs and num_mux_dsts will fit into a u8, so change the type.
More similar counts are coming soon.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 64476922eee8..341f23d448bc 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -607,8 +607,8 @@ struct scarlett2_data {
 	__u8 bEndpointAddress;
 	__u16 wMaxPacketSize;
 	__u8 bInterval;
-	int num_mux_srcs;
-	int num_mux_dsts;
+	u8 num_mux_srcs;
+	u8 num_mux_dsts;
 	u32 firmware_version;
 	u8 flash_segment_nums[SCARLETT2_SEGMENT_ID_COUNT];
 	u8 flash_segment_blocks[SCARLETT2_SEGMENT_ID_COUNT];
-- 
2.43.0

