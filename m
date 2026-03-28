Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E7E2C21DD
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774686277; cv=none; b=HsZcpZwefc+EoPGWJdlA0eN3jG4aGAwVOCkBhTvpp4WwPIWOqQVj8VYBaV8M1EwnYt8/40mB0rstASkSHmLgMbtPdjThFwu3Bh2gomi8F4Ab+uLRcyYYsrfiZqafnf4x+XwIYqYeIeeVP6sIrV1FO4b46YGSugVaptYcuR9RyUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774686277; c=relaxed/simple;
	bh=nzKNXyKs/0GIuhiTRt2fGnb+z7LCxgPusW1bWpY/HqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+89ExL/ZUe2eQXOPu61AtPgwnNjNtZPRtUjoNpwRx0flxsC41Ft7iiefAKy/n02pY9fBgWbgYLIKLaLNllCaPOiJr3fDQKZ6YIiPL9hhVu1l4o9o6zJeJhXR30oEkKQ3eSBaqE7Oi46YSno0RoMt3bd12PM8x2dRFfvIouW5pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/3f4Vc+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/3f4Vc+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso1020217f8f.2
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 01:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774686274; x=1775291074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hb9E9Z0TxkJA3GQB3C9fH8w5wns5uzUWC4CAjt+w/Yc=;
        b=B/3f4Vc+SbroVj1oUl/0Au3JW2VdACgUMjpyxPBpdFiPLPpgdkeiX01X6lCT5NwS+u
         fD2q6PJfJFQbvIo6nf/uNJg+sIWFkSuxCiTdLzEzljcjlzFSTbguAai5ci2jqhDJApbZ
         qggLA4vY+siZJZMNJOHSeYxxfPDo71xKuzgMEmjC9/ZPmJt9TRpn9LuH+DnZxb5zlfXs
         LApxYpxpvMECHLfIfveD9u6afCgiod+AOSRSPWOq+JTeIOekkiDz6eKIYvwa/ViS4B6x
         6gBD++SFzrEkOagkJIC8HtEGnutRobUektE5zIPyZCXdLroZ2O5lIT8VL1kwYufvzsJ+
         SA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774686274; x=1775291074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb9E9Z0TxkJA3GQB3C9fH8w5wns5uzUWC4CAjt+w/Yc=;
        b=bGJbpAN0HLmNciS7aFIhIXqY1T9lSP/6geFtEbIPm2uJjYtBrALxDl6/0ydc3aYbCk
         /kZpVxA7AQHsWiKRndBPM2kqoucyWoCumaGkDUTfh59pNByP8QcstbpTLE4fApFdOZFr
         H4si1j+eh6xkgv1B/ksQ5BpiPp9Y408GTy+ZTXa8sYk/N0BTdwijB+7qiBqLQGXQGJf2
         l0MLpEMgeWQ1mVI5NjP4w5NCXUCM1VUUSZKGN08NwNV3UgibeKIPsagOzy2mnrfLMw0g
         fZ9JErTWZF5yW9EpnVH/dTM+PzGL225CXIsVYl75X+jyqDO2LVCwzNJq40HTEh5mCT7n
         WV4g==
X-Gm-Message-State: AOJu0YzEWNgytzYo6jtg97dtw877qv0IazTstnNCS5u7NmI/aD2D6zeo
	RPb6f1k2hLYMDGc9aGEj0z9FZ53W+Pf2RuUi03IK4kue8OUY6os+xNV04ILfRFYPLvo=
X-Gm-Gg: ATEYQzxlKNvMbh2z8OPZhuhWkV1UNuFHdCrvC4h2TscgXfBs2Dkb/rozc0hgYs5L/Zj
	mBhHjzZ/j66Ij1N/4fu2KuAHzjmLaVxLuI1aeYc78XYDs15ndmZP5VJ2wHpG6G9MZ0a7BXjTdVg
	sNOp8WGHPwyrVr+V4muCvVoNEkORj4i9Q7S5x3TeDvS3YDZmHNW4NCovK6u7I6Nin9CF5EXJLJC
	uHG8gIz4ZQZOxfrl3A7sEx4hwv/isHI8Yf0vcWTqptk4vyFWP/wC+dR71nBfJo+1xFRHtA59qh7
	mAb3AIgCdLFxy9I2rsa4U5B2kdQLhYpTolpAMZSXBgJdWj40tkF4GVQa1Vh6NxhyqSivpE4St0v
	2UiQTKpjr+jMpK3nJjf88K7IXndrSaI4ZCPH2VyyySnz3tLDOJFtUu2mTcm5ynU+PlL4H+WYWIF
	NnIBdE0I8AJU/YK2sywI41NcEKqShOEpfRJ46dMF9g
X-Received: by 2002:a05:6000:2284:b0:43b:5b25:67fa with SMTP id ffacd0b85a97d-43b9e9e8d26mr9093247f8f.18.1774686274019;
        Sat, 28 Mar 2026 01:24:34 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e29b1sm3588402f8f.8.2026.03.28.01.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:24:33 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3] ALSA: usb-audio: Add support for Arturia AF16Rig
Date: Sat, 28 Mar 2026 08:22:40 +0000
Message-ID: <20260328082431.4935-1-willerz@gmail.com>
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
Tested-By: Phil Willoughby <willerz@gmail.com>
Signed-off-by: Phil Willoughby <willerz@gmail.com>
---
Removed the change to clock.c as that code path isn't used when the
quirks table is filled-in.

 sound/usb/quirks-table.h | 165 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

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

