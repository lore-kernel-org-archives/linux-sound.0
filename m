Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1075341660
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774685683; cv=none; b=nkK/8b7udQtmWTDRJfnxWKfDZf6Vzmv2hOPjBVHJ5hVDyiBRPt2CiPGIi0auK5KwREw0iTHdLOCIfaP9Ny9FRjCJYO9hcPczN04iVqIMe2hodX+8ghjNMcvvx5bVA6+1t94iaqZKc5+Zjli5MZFqmPApJRnGSUNHdzjw5Zx4ZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774685683; c=relaxed/simple;
	bh=o3Sv26e2qxnjz/mQiDfpSsaL0a/f6MAaLMrLaGbdofc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DyPtv30ZHEmv3KT72Vga3+q/U1sColEQbXzYRuwphRAIJ0PQ85IIq3nVSLXFRfACANXVq6Kz9DLP9WJEVdb0UeOEEAdOFXUCLpS4KYkEJ+w6xtzlLlq9vmbDCrZmokYWQLCiR+SRi300umXpYy7nYDcL0QVQ6fVfC4b7MpDUXJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaxLKlKG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaxLKlKG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so2311195f8f.1
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 01:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774685680; x=1775290480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTWJPfZp+ojDZyiRKiG9eg0Bu0/EUKGO+xgXXnG4waY=;
        b=DaxLKlKGE9EfjwUBbIeQWXnngwLoet0Ye0q0OxAdW2Ndk2PhGiOR5GuEnt/2DKltfj
         53c2vEZf0jSOa1bmAEtd9fD+hm2T/2ZNINguYM/Ph/cPIZ1aQ4+WnpK3VCjuV39HSDLs
         7piJbdJOuozZ3dkB7UiwMcaG2zqTXgna7vYjjwA+JpE0IeKi5wIWXaXKfz/+9USXpfUF
         Jo1Fsceehj0T5CRQzifaTzv/kiQ0FcFYqqXdigwcHZqaeMDr2cdx3mbKmA9oRKI0g2Oa
         1UiNS8yM1DGAW2Ply0CUKLAFX/nsRnr57CYUszqM89BzgZHuN9h1qmywtBklxquoj3sp
         qX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774685680; x=1775290480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTWJPfZp+ojDZyiRKiG9eg0Bu0/EUKGO+xgXXnG4waY=;
        b=DOI/w+iSLvRzeEpBzK5ka1JbbiLt05NQRqyTo8vqPQcYw8BKRmKZ8BthZWfggNoQtQ
         72ouKdthiuQhCUgEFpgCBc6iWctI2uBUYaTjBUFobFx9fkaqEoD2olsidUuIeVdRBEzc
         gRqLpx8vi9H1+kjS0EEjCBdqXpmyKdClyEtbJaYpMPe9i0F+FPGyKiCXUjNh0wfe8U8k
         wTV6Nw0lsNU9cxw0Y145ULD3eWIb72oOjlmf1wyF6GEKcTwHlb5km3GBkbz0uzwOD5kk
         gpUvtqrAdqFw/gO/klZY9wBgxX5CgMjn1zk85ctxBf3vZHYS6cXezbhXhSVS/hrm7yc2
         OsLQ==
X-Gm-Message-State: AOJu0YyaHLj5hPRjSce0JkEzVtQA4Wg2myUN0c11QKWCcIYezn2+Ch6m
	Ibn9yDrgD391KyYQh61u+M0RQfdBWLmdP8Kdw84xFSxLvS/dr3UNHKaSRypAMsmKzgw=
X-Gm-Gg: ATEYQzyzV5wVITNFiOuP8IpMB9Tm4zq10pnOnMyjZx03pH2KS0JB3PFRyFWv+G4oFTz
	S/Sy7pC+341KilaUVkwJLsGaojo3gNba0AF5sT33CRIxXE2yt8+BI2lzLhKLxIbIJmAZNk1ygAC
	L4Btf+JvykgSLTQN6FaIr4YZnG9FrPWjjMycqUVMfejwReEKpixzSBC57mq238+rUI8+AJP36HQ
	JH3xOn5jve7lk5Jr8eZrHr7yW6U6knJZL7pCaa+xhV/LPwA7RALEOcLOfnKAK6gWfsk52kLf6dh
	MTRalG2Whq1NOAtZ7g6y4ykNFu+1eSi+miaK6igW+41FGIHO+WDXNaI1l7829exocUwLYSsgRQB
	OR3zFQU3KpDN1zAuL7PBk/adp7ZE/oe/3dQKM5Gs+CBKkeNHGN8k2GuZa3vBWEWaLlGSjE7YHs2
	0K6edg7rSyZt6D2PzGJaZdshWGtQnaVg==
X-Received: by 2002:a05:6000:1a85:b0:43b:3d44:6624 with SMTP id ffacd0b85a97d-43b9e987decmr9419014f8f.2.1774685676697;
        Sat, 28 Mar 2026 01:14:36 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf2580168sm3975049f8f.36.2026.03.28.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:14:36 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ALSA: usb-audio: Add support for Arturia AF16Rig
Date: Sat, 28 Mar 2026 08:11:32 +0000
Message-ID: <20260328081426.3532-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Tested-by: Phil Willoughby <willerz@gmail.com>
Signed-off-by: Phil Willoughby <willerz@gmail.com>
---
 sound/usb/clock.c        |   4 +
 sound/usb/quirks-table.h | 165 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 842ba5b801ea..3e597976ae9d 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -266,6 +266,10 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip,
 				      UAC2_CS_CONTROL_CLOCK_VALID))
 		return true;
 
+	/* The Arturia AF16Rig reports that its clock is readable when it isn't */
+	if (chip->usb_id == USB_ID(0x1c75, 0xaf20))
+		return true;
+
 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_CUR,
 			      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
 			      UAC2_CS_CONTROL_CLOCK_VALID << 8,
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index eafc0d73cca1..8f79a15055a6 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3900,5 +3900,170 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 QUIRK_RME_DIGIFACE(0x3f8c),
 QUIRK_RME_DIGIFACE(0x3fa0),
 
+/* Arturia AudioFuse 16Rig Audio */
+/* AF16Rig MIDI has USB PID 0xaf21 and appears to work OK without quirks */
+{
+	USB_DEVICE(0x1c75, 0xaf20),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "Arturia",
+		.product_name = "AF16Rig",
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_STANDARD_MIXER(0) },
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 34,
+					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
+					.fmt_bits = 24,
+					.fmt_sz = 4,
+					.iface = 1,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.datainterval = 1,
+					.protocol = UAC_VERSION_2,
+					.maxpacksize = 0x03b8,
+					.rates = SNDRV_PCM_RATE_44100|
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 44100, 48000 },
+					.clock = 41,
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 18,
+					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
+					.fmt_bits = 24,
+					.fmt_sz = 4,
+					.iface = 1,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.datainterval = 1,
+					.protocol = UAC_VERSION_2,
+					.maxpacksize = 0x03a8,
+					.rates = SNDRV_PCM_RATE_88200|
+						 SNDRV_PCM_RATE_96000,
+					.rate_min = 88200,
+					.rate_max = 96000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 88200, 96000 },
+					.clock = 41,
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 10,
+					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
+					.fmt_bits = 24,
+					.fmt_sz = 4,
+					.iface = 1,
+					.altsetting = 3,
+					.altset_idx = 3,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.datainterval = 1,
+					.protocol = UAC_VERSION_2,
+					.maxpacksize = 0x03e8,
+					.rates = SNDRV_PCM_RATE_176400|
+						 SNDRV_PCM_RATE_192000,
+					.rate_min = 176400,
+					.rate_max = 192000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 176400, 192000 },
+					.clock = 41,
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 34,
+					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
+					.fmt_bits = 24,
+					.fmt_sz = 4,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x81,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.datainterval = 1,
+					.protocol = UAC_VERSION_2,
+					.maxpacksize = 0x03b8,
+					.rates = SNDRV_PCM_RATE_44100|
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 44100, 48000 },
+					.clock = 41,
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 18,
+					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
+					.fmt_bits = 24,
+					.fmt_sz = 4,
+					.iface = 2,
+					.altsetting = 2,
+					.altset_idx = 2,
+					.endpoint = 0x81,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.datainterval = 1,
+					.protocol = UAC_VERSION_2,
+					.maxpacksize = 0x03a8,
+					.rates = SNDRV_PCM_RATE_88200|
+						 SNDRV_PCM_RATE_96000,
+					.rate_min = 88200,
+					.rate_max = 96000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 88200, 96000 },
+					.clock = 41,
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
+					.formats = SNDRV_PCM_FMTBIT_S32_LE,
+					.channels = 10,
+					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
+					.fmt_bits = 24,
+					.fmt_sz = 4,
+					.iface = 2,
+					.altsetting = 3,
+					.altset_idx = 3,
+					.endpoint = 0x81,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.datainterval = 1,
+					.protocol = UAC_VERSION_2,
+					.maxpacksize = 0x03e8,
+					.rates = SNDRV_PCM_RATE_176400|
+						 SNDRV_PCM_RATE_192000,
+					.rate_min = 176400,
+					.rate_max = 192000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) { 176400, 192000 },
+					.clock = 41,
+				}
+			},
+			{ QUIRK_DATA_IGNORE(3) }, /* Firmware update */
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
+
 #undef USB_DEVICE_VENDOR_SPEC
 #undef USB_AUDIO_DEVICE
-- 
2.53.0

