Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E03D412F
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 14:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831653; cv=none; b=T0DH4oP9HT+7zF8d4zo78ESnvEwO3wD31W1v/+S17BmMWLmSSIcf8sHy7Ke/8IsjE2IwvHPo+urYt1WVq2UhrZbEFhH9Rqc14Dqzp9Tyij4xNLRCkfZ4rdOIq7+gmJOgEZDd/k37M/eb1pomI7kAkxrMXenLcYXQyPOCZ/rFhJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831653; c=relaxed/simple;
	bh=QVJylg6dNpCExsYLETaTOtFkWCAXw7hILfTosqhB0/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnYccUV9uLhqnc/UvmZCghvQ7YA2w+CCK6xRsdKDBPE8LzVGLN2MUaLoe6bU9FdOxrIi8nHAAamIfY4lkwhoPeNhmqkC/0kPwl2TICnqepTu+k8XVdCPOMNi1+2xuaTpjXhBv1q4H7hfzG7erO/Qm5G7u4geOR+VX26QO7Tb6uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oltNrLiO; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oltNrLiO"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c766a95a72dso1416143a12.1
        for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 07:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775831651; x=1776436451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSFMISWQaX90d9anh/Vv99excJcD3WAzoIBbP7o0QE4=;
        b=oltNrLiOALyUg/WsqtqlECv8l8VkdLUqlVREZg9Gl8CK8GoGoDoKtw1tUXx2OJI4hi
         zD9keAKfrmkFj2UNTQO+OTsMeHb4AgBz+3LiYKq0pgJ9tvHHsKdNyyQdcLEbuS5Oe4wT
         v8NXDm1eL1RsXzdzbra0cF6Fql9rTib4zSy07hF8CObGN6g+sX6b8XbRnfL3ciC+FRID
         x2Z+B1C5reEDuEugz3SA3oHy55b7KPw824pqCE94lKlfYSXETpsGbM0xQM2AInoIJxBe
         F9qdjsbPEMqH4lktrcDrqDaDOuGuwYkWZT3DpGE4PlnTq8+/sHyYpj5QKXcjlKXFactD
         4hsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775831651; x=1776436451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSFMISWQaX90d9anh/Vv99excJcD3WAzoIBbP7o0QE4=;
        b=TBbLPtp8boLXQ9Jeao1G1osBrztEyysqOlrWqavLk+K5VdaiPgSj7z4yCebUzcpH6g
         /O7KZcxoAKO1Rmi3MbBdXC2KxbPRKUUoEGuB/G8w90jFSUf95ZtBwpCAToxSOv9I2h3L
         NQdoPZnebLOh638iGx2DzK+2V3dVXCWuGCzFgRuZ6SGvNsgWr2nDqjd8IUGEpNJsE8AT
         cMSxTz4yWjBWtP6+PDQkXXnLYuLX+zM17AeDDLowOtrGsXPrbpOxXo8wGHMzBHyjhIFI
         cHm7DCfievUXFfzWCf1vK5Dt1nj+yntviAXmszN/1W/CawkH9mKu3FI0bOWYIl+Iwfj4
         g4bw==
X-Forwarded-Encrypted: i=1; AJvYcCXw8XehiPnoKMQjiZIt7uZHkD9U4Ls5834aZmWjyPHXVEqbqZF2UZJurUoi+BCzxDGZM9yN/4QV5yMV3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS1pA7uTvRo6ZoAYveiKCKmrMcWuU2gQYGoxwpMm1nRPYgk3bW
	cAR8CzShxuzRAkoT/vfSiIdmkCmDT1E/4Pgmjm2Bqs7ixl0UDGdvdqut
X-Gm-Gg: AeBDiessM8wJiDVFEpp4zPeIoref+7WNalA3uL1r2bLeZ5VQ2+ZpYyi5c0DR3Nx+AQi
	yBPn3j5/7h8RJp0bx/YDV8undk5cHvMo3+5/AaAC1gYuzARMA24BtlgKQ9pChM6HZLkAUMq1B1k
	7IHmHm5p3Ab7Xv3ZDklfFFTFYhMXjD3IW/l7zc/QK49S1+xwmPCbuewthOopoaNShuKe/lzgTRc
	6xPNoVaA0hurCIYZGm2FGiANE4P0/9Wim1CuA6LJBvOcy4m6qMx/kBhgmwenHopZopqVbZCIgSP
	Oq8l7uy0JNxU7xZ5mukj+Wkt4vtDuHc+Casr6c/fI1JdExDDXERpGwkfVwG6dhMLtv/v/9+HcDV
	UrhAWiWLlDCY+FLPhbsWeCSq63EdimwE1UanM9pT85uYByQNBMtSB/Xd2XKezb5Iw99NMJaDeqB
	WO+uSWDlQG184l6nJ1354XVA0Ry7oOUxA7bDbyFEUJLM5I6SHW9tc19m5D1fl5CzQwfxrXU9ayB
	fctRM77xMNi+Fy2Mfi3rsVCpaRzVZe7OEXt1eQHqaqY
X-Received: by 2002:a05:6a20:6a23:b0:398:9b6e:339a with SMTP id adf61e73a8af0-39fe3c90fa2mr4454090637.6.1775831651074;
        Fri, 10 Apr 2026 07:34:11 -0700 (PDT)
Received: from abhinav-victus.tailde2db8.ts.net ([2401:4900:882c:6ba9:ba24:2757:bc7a:6feb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79219c625esm2564472a12.20.2026.04.10.07.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:34:10 -0700 (PDT)
From: Abhinav Mahadevan <abhi220204@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Mahadevan <abhi220204@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add quirk for PreSonus AudioBox USB
Date: Fri, 10 Apr 2026 20:03:35 +0530
Message-ID: <20260410143335.5974-1-abhi220204@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PreSonus AudioBox USB (0x194f:0x0301) only supports S24_3LE
format for both playback and capture. It does not support S16_LE
despite being a USB full-speed device. Add explicit format quirks
for both the playback (interface 2) and capture (interface 3)
interfaces to ensure correct format negotiation.

Signed-off-by: Abhinav Mahadevan  <abhi220204@gmail.com>
---
 sound/usb/quirks-table.h | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index b6dfe3b63..803e03d4d 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2652,6 +2652,54 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * The AudioBox USB advertises S24_3LE as the only supported format
+	 * for both playback and capture. It does not support S16_LE despite
+	 * being a USB full-speed device.
+	 */
+	USB_DEVICE(0x194f, 0x0301),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "PreSonus",
+		.product_name = "AudioBox USB",
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_IGNORE(0) },
+			{
+				QUIRK_DATA_AUDIOFORMAT(2) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 2,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(3) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 2,
+					.iface = 3,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = 0,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+				}
+			},
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 #endif /* disabled */
 
 {
-- 
2.43.0

