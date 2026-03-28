Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344E22882CD
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774710824; cv=none; b=QcB/bcNT04jV5R0MClR6xcEXrSxTES3gQXGfifR+3WUzKfEmKG7PvQnvpNxgXdHBIoZk1x+/j03J2ktOa7xvle17yqblJlr9gghAy9Kiu0pLELLNhCwIDpz25t4ds90TwkAejF9ogMZCV1NywEXdHI9vkVxph3Gk7h5r7KRYEGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774710824; c=relaxed/simple;
	bh=KQN+Q+0XEcT3YfnJq+Bf1s4VsYz+7Jxdknmd8rC89Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ReAwjpSbQ6kblhfDdk1T34JKNmhoLLauPRLfEl2hSS7k+nNBhx9VdfDpLPqi7w9NRUslym2WJaKw+EsM5vMy/9jt1VzS1at/5X1nXqUFzjNy/dSLhivkBowJ+XQkzg8XDnWQDtFWht3knCFxRn+yYyFhOarrAcayQcYvz1XUYqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdSJ2bh0; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdSJ2bh0"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dea72099eso3800210e87.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774710821; x=1775315621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3zjdgb2UOyz+S1hvF40mn6SDMvZ4eb11HryCIsJckk=;
        b=MdSJ2bh0PwKZ1IifDGY4Py8zMCimsXQr0vdJnnw55XXtmBHRQ8dH/3w958CdUCtTVi
         h6OjYjRNXW9VzldHPwucl35UvqLPiYUY4pMlCDJA14q5YriZxMmE8njUc1PqbgToK3eJ
         NNDtoG8LQPm4AgfB/oHPivo1J4fCIILvcrx7eW595xyslEUEPriVtXnJtYd/0GsqaVXy
         E9NB/wl3T/jKFclvzcS5MYHdiqEEIjIAw9CYi/c+6KROxsVD7skYtT8owXFaM4ESg9KE
         07CNsfCWCXPZt500XV4D/OYKSVUq+qbC5f7ao/ltk7XQV173zI8/Hw8cLCsqJeA89HmR
         uWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774710821; x=1775315621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3zjdgb2UOyz+S1hvF40mn6SDMvZ4eb11HryCIsJckk=;
        b=VqNQ3IsokjSBtLwp08+LrtY6JGAXZl6en50JXM/Fu33KfxhP8pNSKaGBD59yfTkhH0
         IYDlES8gj3aqcJxWtTIEPCqh6X3rnsQ+tFN/5NcpmhCiXYrTYmxHsSUQI0X8yV8ltvPW
         +O0sVZTQB9q2Z3DXuqo1jQlBz/23pFKVunB/cDdnczJ3Fp7yU9yPhrxA4YZh41OBJlwg
         RqBFec4oeIDc7HXbOapiO5kUmYd1T+Wfx4yoNpT54ISGjK0aw/AW/v4nQjonYDJG/Zjx
         /G7+W2XDUHifkQHR7zW/AvanzEGNCN/mNOKGJr2IlItkxC9tZlFz7cKS/5kzkOg+0EHp
         qsdg==
X-Gm-Message-State: AOJu0YxOhdwdqYtFjaDBZyAL0lkJUvvDvGQ9cpgqGc10g7GyLr5SmkmE
	oI+fH0Jac5786GqlVgonfc5RBQrUfZv0/yBROJnt19EbiqPTZCnXqr1ZxIJf9jLoofM=
X-Gm-Gg: ATEYQzwBv2WdO+V8QZQwqd5KdiKYDENVTiz81mBYFFfjy8d+hGtyd0bh9wexkl9cxWx
	h3GTV8TGtjP37KlC9USN4wwsShdYbsEuGQlI9Rl7/btULZebyF7Rm84MkUelnWJUL6WKEc0Ufx3
	aFMCEaudhq+SyLEsTduR+G9tsE5bWdczX5zXztt90kxR2BciQ2Gduyti/6ebtTv/08AXFC011bV
	4h1DnnBUHDArsNb4RBNT+hx6eY3L4fRJS7YZs8LIy3nIhj3P0jqmOih6sPtHWaP7Wvb2i7tKmCX
	QfyvlTOcxYMPezdcN4USeqBW9J9vdjY/fw06p/R6dx9YGzx6WA288+SHQ/vJlUlApPK1U6++vcD
	9T6aiwiVHins0GpPZmgNFjcS2p+15fzUTcXLjkUzNHGsSdupuFa8Nd+ENeZsYJFkv93v9ZJs0OC
	u2B2b1NCJvlpcNgWBVVZQ07VkLYTYYEA==
X-Received: by 2002:a05:6000:2003:b0:43b:495a:a760 with SMTP id ffacd0b85a97d-43b9e9d8c74mr9608411f8f.5.1774697070452;
        Sat, 28 Mar 2026 04:24:30 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eb95fsm4828075f8f.12.2026.03.28.04.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 04:24:29 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4] ALSA: usb-audio: Add quirks for Arturia AF16Rig
Date: Sat, 28 Mar 2026 11:08:41 +0000
Message-ID: <20260328112426.14816-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AF16Rig supports 34 channels at 44.1k/48k, 18 channels at 88.2k/96k
and 10 channels at 176.4k/192k.

This quirks is necessary because the automatic probing process we would
otherwise use fails. The root cause of that is that the AF16Rig clock is
not readable (its descriptor says that it is but the reads fail).

Except as described below, the values in the audio format quirks were
copied from the USB descriptors of the device. The rate information is
from the datasheet of the device. The clock is the internal clock of the
AF16Rig.

Tested-By: Phil Willoughby <willerz@gmail.com>
I have tested all the configurations enabled by this patch.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Phil Willoughby <willerz@gmail.com>
---
Thank you all for your time and considered feedback.

There are two other clock sources the AF16Rig can use: an ADAT clock and
a BNC word clock. In theory the correct support for those would be
copies of these audioformat quirks with the clock changed to 43 (ADAT)
or 44 (BNC). The reason that I did not include those quirks in this
patch is that I cannot test them (because I do not have any other device
that can act as an ADAT or BNC clock source).

I think that what I want to do is:
1. Macro-ise these quirks so the common stuff isn't repeated as much.
This will be v5 of this patch.

Then a separate patch where I:
2. Add the external clock quirks and locally test that it doesn't break
anything for people who don't have the external clocks
3. Wrap the external clock quirks in #if 0 and a comment that they are
disabled because they haven't been tested.
4. This will be marked signed-off but not tested-by me.

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

