Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EC2D3733
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635663; cv=none; b=c5BiVVSAi/HR3bLOYMoXuvcGSOFCkdr3qcofFXmB94YfMQELOKEMNkwXlXJl7Bi/csyWVpz0FZv7y89KO0RgmsvR199mAdPfNSW9Fweni1S6CGseL+0/dM3rjHuh+kgsS7/J/HT9YZrb3Ej7tjJe8X81XOBq8qcq5uxDmpxb+2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635663; c=relaxed/simple;
	bh=a8g760ykbirRsSRWuBjx9v9gazgiOz3e3VvkL/zbTWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ob2KZicD8EqpQfm95cRHt/Q6ZS2qADgR/gQp/fTMzJWzhFUvZ0gLZQKu/pWSxVxrbU5ln9eKktqBwRVd+5TH4B/kJbZd818U2LPQN3o8fFWY1iGN45YEq+/qYuc0RdqiGpwdOvAp47ua+0HKqkBT2pylutOgN6Iw7V95e/o6KZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cszO7v5Y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cszO7v5Y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48374014a77so29270105e9.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774635658; x=1775240458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucRwtGLQbkik36aIDDNBAOldr7FJ56+ywnT/X/giBc4=;
        b=cszO7v5Yn2MDJLcFfwpML84CV65URbmqmBv4QaV0npFeMzdGPEO11zueqJn2mn47D9
         ZNF9+NGde9YrziXJjeujwO0wtl0r3B0jz7eLWs7djFtk1C5pNwBDb9l01YSntukEX79Y
         VOWnDyJS/VvTJYph7Vy+3WzMSukHzQ3W3AaYPDgsvQEJ6yvDFKBSw+1trU9VTl2EYaHj
         yFDf/6gtuZgEp3s1B5ifptp54BctJpgAgr3oWYqToBTD0EIIXpkwih+8G3FRN9kQ7NE/
         2F+sWgkdSHE0VpstGIKZKpyv9RypKqPiFgQ7ZNEP5UsFrSPcnBO4ZDtkWhp8MPKDv4aB
         ezLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774635658; x=1775240458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucRwtGLQbkik36aIDDNBAOldr7FJ56+ywnT/X/giBc4=;
        b=nxqnO6AIB6Mbzgx3HnKaofbguQ5T+TwEMNTjlep4P7fNeX7J/Xazv5dBMkY7vt1g2b
         CzucLqGtLHY5ljjMXgNxGKaJKX1c5Z/NpyO6FiWMeKYZVxPJg5Lh+jBhgOGP7GsF8AkY
         pgXtDr+/J0XFNgRmSv9fyuph7CZCTUjmG2tbU9AiOSRryJ2kHYpdgsOk+lWwzsdv4Yr0
         hPDCKrrsm4+94CTUQ/UDG4a+djGmYeG8p9Z3VcyafYH8OgfB0M12ZH7knmdZmtTFzqeG
         WVEo49ZJ81DGj4RxymBmofzHn+2ju9YtNb/RMrNxp80gBhFnGgcZMSY3PuU/u3X77JD7
         LE7A==
X-Gm-Message-State: AOJu0YzVY7ojPqktmQquIlgxVeEiRDlCzlV+DFpXUfIOoKAUw0sU2AKj
	J+Wlu047ZMT2uMiCfLJgcG51NxknwmfqB23Ss8kBoHB2MjiEjG6X4i6E8whGXCnH
X-Gm-Gg: ATEYQzxqvYJc43X8JF7752IXHmaDK4UXdJXDzg4umyHtNolb3nudm8Y3eZPKyAYPk7G
	xi6wPkketK1blURMaHq8pK/k7wGPRQg7gXe3NWaXQ+qGdxK4LRgqruGRuS4uhZm7SSJCw4aco5Y
	7+Ht/W9VZ9WcLXvS3alM0dnA9oCXoFkjv3fOLsAbnPqUILRt/6ds6zwW29+8w6Lyq+SfcxJBky8
	rWFqxogdj2yWvxtSquOQCroKpujeSx3+Rqa60LiVbyGy03JoPvxXB7ovTZPvjXrJTLrdAdl+73/
	SZv+3hnXTA806DcWrvvd/yvYAfW5Z8dDgWq9OvgO1fB8SDNLBIWMIgTAOKyO4zBiGZSUOhJMTeL
	xaWtiwLVEw+Jf/ErzbIwUXyOj9QT13E3GKjrwysYxlqjR1A85v7+CMAKCiLjJrxOFhAFJrMK63S
	im0pxBpXjk/AFZ8BhpqIzjUNKYE5Y7AA==
X-Received: by 2002:a05:600c:1d1f:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-48727eb81bbmr65978665e9.17.1774635657550;
        Fri, 27 Mar 2026 11:20:57 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d4d884sm146327375e9.15.2026.03.27.11.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 11:20:57 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>
Subject: [PATCH] Add support for Arturia AF16Rig
Date: Fri, 27 Mar 2026 18:19:24 +0000
Message-ID: <20260327182052.13364-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

