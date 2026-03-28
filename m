Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4981DD889
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774713814; cv=none; b=emI42riamNsgj+iCAHYhrKm8DivakGU/f1Jt5V53LQ9x8SvvvnRiDtmzjikUD8uzwbfA8IxLLZD40Gt+EruyG4C/mKlHTkk1pNNDM5ct5PsWJ1xTDzV751shR6pAHTwEDsV8WQqMOH1fY/52hkRPSC5Ez3PbPjTrOo7fX1RbqBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774713814; c=relaxed/simple;
	bh=3cwF4Q4KIDx0DcJDJCeF1s77I1rPqqEK5ZOt8sOYiBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DgXHEXDQk8B0DH1qJpJw4Ktd54db3tvY7kL1Eeu1dmdmNhxxPPTyad54fkznOjWzYM++BNN818l4RGVkITaLoDf1M+EKnKv2JCijWnQIIhBY7YR90c9VR+updJanRW7Ur7SCEGxKt7JOQkfanSiWa54+zRrCKRBsv6EjFfy9zQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LihiYvgh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LihiYvgh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso38706085e9.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774713810; x=1775318610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tM8nyAb36TDlVz2eHYKR8w1zVfASylfx6Rps12w2FI=;
        b=LihiYvghfAcaoF8BHyEEYSyFshyi5tvCY1xGSqUQDzpIMK/zPesuYLkpSdvsad8pMF
         19sbxMXd3Z9haqjTBKr6T/SnlOEq+/sRdFKilaN0MXESo/Idxof/rP29CoR/Owy+b02u
         NFuK2I2DFT/nx186XCLv5doy1c9Jck+6Uq6lQ5Yhoi3LXptxKnIlVa01up9JmxPQ/RbV
         fMLRmoFXkosuxJCvlsv7ZuehirNpXrmfyFGdjIUHGFbv/4tHR+cHaKp5rkRKxd+9WJA/
         gw4mbyUI5nWA9ZzGQgpjAUQhHaiAhzqY2UppXCOuBcdYEIxlsFFiuZGXsvuWssKdkCkU
         kVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713810; x=1775318610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tM8nyAb36TDlVz2eHYKR8w1zVfASylfx6Rps12w2FI=;
        b=Bp5F/uWtZ449S/maTLPcWuTQd6GxsTyd0mILyBxPC6/FnkXOnIEbp4albFojEc1JmQ
         H1GqJCpW4JWyy7T2FHdQGfqo9SdYsARnG3tewKV4LXyhHeAgc3f8VmbOzva93V5e2xzD
         7oQ+BjuBg/2gRS2x/XwqkW5UCGN9QtobIkh8ytewLPaqfM2DUYa9zEhJdZt15rYNHLP8
         emiU5S1XpxMbW0IbDxDzt9EPgu5rxdB62fkTgKtZYCwlBrpZuOn1HVkIUGAuECh49uaN
         BlMNller0axQUC/Rf5OobLyuoSZUPc9dk3VGjCRGF+bdwRNOHVKhHFPP/VWkdmn6oQMH
         dm1A==
X-Gm-Message-State: AOJu0Yxvk2FbmsG3Jn5/xIcy5+FcAfe59oGLp8QDAHEcVj9nz6oOLVFQ
	3/IK5CVuMhmiK/U+wsN8sW7rO769oG3Cp0QnkIpsIGhqB87STcx/cUYwWMbPiSDopmY=
X-Gm-Gg: ATEYQzxrjC3V8Y4DueBuiexIQWRFIg5qAVbAW9l3s/4tNY7cs4smQQju2Qa2dzK3l+f
	g/Hi5juJweZgWS4AqI3ddPO7PKsp6hpvuGM31JnK146TTEH6l6UYZBkbJixiSQNtieKWnvucf62
	HjEFWwJOBiq2R69dFu4rhfw1Y0ZyRONS4P7HFPG5kcbdV6wHqMkTDPWbokymrLXdq7N7Lrl/Mj2
	qoXGrxfelPHYGO1VWsyhlzSu6s84hJ6jmeChS0uvdFXHqj6MhymYpUq92/p7HMTPL+Xe+SCuDcU
	HA81UUD8LQDPj32Gng+FsTvmev7rNx0rJ7/clZw5a4rpj6P1u2Z5z17Dxz32Vsq5cKwIVJblrMf
	o+qTxuHJGpxQ49uM+3wrTVeq8bfYYFo7FsP5usto5ycjXfKw7lQyjX1NhSGUoFN8JIk70SNmFI+
	M5S4g3eS12fi7hqX2/5mXK1depZx44Dw==
X-Received: by 2002:a05:600c:6986:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48729109c35mr90032995e9.11.1774713810359;
        Sat, 28 Mar 2026 09:03:30 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061f44csm55543455e9.1.2026.03.28.09.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 09:03:29 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: usb-audio: tidy up the AF16Rig quirks
Date: Sat, 28 Mar 2026 16:02:58 +0000
Message-ID: <20260328160326.23665-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use macros to make the AF16Rig quirk table smaller.

Add a disabled block containing the theoretical quirks for the other
clock sources that the AF16Rig has. It's disabled because I cannot test
it.

Tested-By: Phil Willoughby <willerz@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Phil Willoughby <willerz@gmail.com>
---
 sound/usb/quirks-table.h | 200 ++++++++++-----------------------------
 1 file changed, 50 insertions(+), 150 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 8f79a15055a6..b6dfe3b63c67 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3900,6 +3900,44 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 QUIRK_RME_DIGIFACE(0x3f8c),
 QUIRK_RME_DIGIFACE(0x3fa0),
 
+#define QUIRK_AF16RIG(channel_count_, alt_setting_,			\
+	              low_rate_, high_rate_, pack_size_,		\
+		      clock_, interface_, endpoint_)			\
+	{ 								\
+		QUIRK_DATA_AUDIOFORMAT(interface_) {			\
+			.formats = SNDRV_PCM_FMTBIT_S32_LE,   		\
+			.channels = channel_count_,			\
+			.fmt_type = UAC_FORMAT_TYPE_I_PCM,		\
+			.fmt_bits = 24,					\
+			.fmt_sz = 4,					\
+			.iface = interface_,				\
+			.altsetting = alt_setting_,			\
+			.altset_idx = alt_setting_,			\
+			.endpoint = endpoint_,				\
+			.ep_attr = USB_ENDPOINT_XFER_ISOC |		\
+					USB_ENDPOINT_SYNC_ASYNC,	\
+			.datainterval = 1,				\
+			.protocol = UAC_VERSION_2,			\
+			.maxpacksize = pack_size_,			\
+			.rates = SNDRV_PCM_RATE_##low_rate_ |		\
+					SNDRV_PCM_RATE_##high_rate_,	\
+			.rate_min = low_rate_,				\
+			.rate_max = high_rate_,				\
+			.nr_rates = 2,					\
+			.rate_table = (unsigned int[]) {		\
+					low_rate_, high_rate_ },	\
+			.clock = clock_,				\
+		}							\
+	}
+
+#define QUIRK_AF16RIG_CLOCK(clock)					\
+	QUIRK_AF16RIG(34, 1,  44100,  48000, 0x3b8, clock, 1, 0x01),	\
+	QUIRK_AF16RIG(34, 1,  44100,  48000, 0x3b8, clock, 2, 0x81),	\
+	QUIRK_AF16RIG(18, 2,  88200,  96000, 0x3a8, clock, 1, 0x01),	\
+	QUIRK_AF16RIG(18, 2,  88200,  96000, 0x3a8, clock, 2, 0x81),	\
+	QUIRK_AF16RIG(10, 3, 176400, 192000, 0x3e8, clock, 1, 0x01),	\
+	QUIRK_AF16RIG(10, 3, 176400, 192000, 0x3e8, clock, 2, 0x81)
+
 /* Arturia AudioFuse 16Rig Audio */
 /* AF16Rig MIDI has USB PID 0xaf21 and appears to work OK without quirks */
 {
@@ -3909,161 +3947,23 @@ QUIRK_RME_DIGIFACE(0x3fa0),
 		.product_name = "AF16Rig",
 		QUIRK_DATA_COMPOSITE {
 			{ QUIRK_DATA_STANDARD_MIXER(0) },
-			{
-				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 34,
-					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
-					.fmt_bits = 24,
-					.fmt_sz = 4,
-					.iface = 1,
-					.altsetting = 1,
-					.altset_idx = 1,
-					.endpoint = 0x01,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC|
-						   USB_ENDPOINT_SYNC_ASYNC,
-					.datainterval = 1,
-					.protocol = UAC_VERSION_2,
-					.maxpacksize = 0x03b8,
-					.rates = SNDRV_PCM_RATE_44100|
-						 SNDRV_PCM_RATE_48000,
-					.rate_min = 44100,
-					.rate_max = 48000,
-					.nr_rates = 2,
-					.rate_table = (unsigned int[]) { 44100, 48000 },
-					.clock = 41,
-				}
-			},
-			{
-				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 18,
-					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
-					.fmt_bits = 24,
-					.fmt_sz = 4,
-					.iface = 1,
-					.altsetting = 1,
-					.altset_idx = 1,
-					.endpoint = 0x01,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC|
-						   USB_ENDPOINT_SYNC_ASYNC,
-					.datainterval = 1,
-					.protocol = UAC_VERSION_2,
-					.maxpacksize = 0x03a8,
-					.rates = SNDRV_PCM_RATE_88200|
-						 SNDRV_PCM_RATE_96000,
-					.rate_min = 88200,
-					.rate_max = 96000,
-					.nr_rates = 2,
-					.rate_table = (unsigned int[]) { 88200, 96000 },
-					.clock = 41,
-				}
-			},
-			{
-				QUIRK_DATA_AUDIOFORMAT(1) { /* Playback */
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 10,
-					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
-					.fmt_bits = 24,
-					.fmt_sz = 4,
-					.iface = 1,
-					.altsetting = 3,
-					.altset_idx = 3,
-					.endpoint = 0x01,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC|
-						   USB_ENDPOINT_SYNC_ASYNC,
-					.datainterval = 1,
-					.protocol = UAC_VERSION_2,
-					.maxpacksize = 0x03e8,
-					.rates = SNDRV_PCM_RATE_176400|
-						 SNDRV_PCM_RATE_192000,
-					.rate_min = 176400,
-					.rate_max = 192000,
-					.nr_rates = 2,
-					.rate_table = (unsigned int[]) { 176400, 192000 },
-					.clock = 41,
-				}
-			},
-			{
-				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 34,
-					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
-					.fmt_bits = 24,
-					.fmt_sz = 4,
-					.iface = 2,
-					.altsetting = 1,
-					.altset_idx = 1,
-					.endpoint = 0x81,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC|
-						   USB_ENDPOINT_SYNC_ASYNC,
-					.datainterval = 1,
-					.protocol = UAC_VERSION_2,
-					.maxpacksize = 0x03b8,
-					.rates = SNDRV_PCM_RATE_44100|
-						 SNDRV_PCM_RATE_48000,
-					.rate_min = 44100,
-					.rate_max = 48000,
-					.nr_rates = 2,
-					.rate_table = (unsigned int[]) { 44100, 48000 },
-					.clock = 41,
-				}
-			},
-			{
-				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 18,
-					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
-					.fmt_bits = 24,
-					.fmt_sz = 4,
-					.iface = 2,
-					.altsetting = 2,
-					.altset_idx = 2,
-					.endpoint = 0x81,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC|
-						   USB_ENDPOINT_SYNC_ASYNC,
-					.datainterval = 1,
-					.protocol = UAC_VERSION_2,
-					.maxpacksize = 0x03a8,
-					.rates = SNDRV_PCM_RATE_88200|
-						 SNDRV_PCM_RATE_96000,
-					.rate_min = 88200,
-					.rate_max = 96000,
-					.nr_rates = 2,
-					.rate_table = (unsigned int[]) { 88200, 96000 },
-					.clock = 41,
-				}
-			},
-			{
-				QUIRK_DATA_AUDIOFORMAT(2) { /* Capture */
-					.formats = SNDRV_PCM_FMTBIT_S32_LE,
-					.channels = 10,
-					.fmt_type = UAC_FORMAT_TYPE_I_PCM,
-					.fmt_bits = 24,
-					.fmt_sz = 4,
-					.iface = 2,
-					.altsetting = 3,
-					.altset_idx = 3,
-					.endpoint = 0x81,
-					.ep_attr = USB_ENDPOINT_XFER_ISOC|
-						   USB_ENDPOINT_SYNC_ASYNC,
-					.datainterval = 1,
-					.protocol = UAC_VERSION_2,
-					.maxpacksize = 0x03e8,
-					.rates = SNDRV_PCM_RATE_176400|
-						 SNDRV_PCM_RATE_192000,
-					.rate_min = 176400,
-					.rate_max = 192000,
-					.nr_rates = 2,
-					.rate_table = (unsigned int[]) { 176400, 192000 },
-					.clock = 41,
-				}
-			},
+			QUIRK_AF16RIG_CLOCK(41), /* Internal clock */
+#if 0
+/* These are disabled because I don't have the required hardware to test
+ * them. I suspect that the ADAT clock might not follow 176400 or 192000
+ * because the AF16Rig won't accept ADAT audio data at those rates.
+ */
+			QUIRK_AF16RIG_CLOCK(43), /* ADAT clock */
+			QUIRK_AF16RIG_CLOCK(44), /* BNC word clock */
+#endif
 			{ QUIRK_DATA_IGNORE(3) }, /* Firmware update */
 			QUIRK_COMPOSITE_END
 		}
 	}
 },
 
+#undef QUIRK_AF16RIG_CLOCK
+#undef QUIRK_AF16RIG
+
 #undef USB_DEVICE_VENDOR_SPEC
 #undef USB_AUDIO_DEVICE
-- 
2.53.0

