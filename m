Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687517;
	b=PdF6jL/dTFXLkIyZy6FZpzjUQ3D+2tv3pG0y8nssGsBFT2POAHolDHT9tzKjNjNTye4X
	 XRN5gNhdcF2Ru4kEA7krcItiS09xrNeARDzg2Gpji5cOP6ALiNLXKBrjg7SNoELYiQ5FC
	 CFsLUgaU+TfBDw9p+1eOVkEPtsQ9V+y9mY9Zk7X+AAP88/S3zfuB8vYVKgTlMn3ZvlqQq
	 vV1vYu2KuSkgCWhMSAjxB14Y12JzBL6uML2YrN2wGN+exWtxt1ITrl1r3Z0YpC2Mh+FAm
	 Nodlp1JnL6KX6/v/ZWjmarbO1CHuD8yiqZwPWWX4Y5PA6UH6TVwUDrqMIBFMK2Ux5jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8m7/EiqjbX4B96wM7VN7+raoFsExq+tmX7IrIO9+WDY=;
	b=u09Tfg1fV1R75Cv6wU2qb5SjPSpCi9uMzntKUgvvdwxzgZUQ9KWb5Dl9VeTxfWEv2OQw
	 JUwgHa0nMqFht/l/4Pzhv36+pbqxxSQpOPInzZ6WCg1fUp6Qnlfe7xIWDZNFizbsfHGTh
	 goYboBiP5LjfzbB+5IA0N7wQ3OUk7HOB8+xN+ZBDJPrPhZvKYJfR889igiHUob0FJQBIJ
	 gSTp58v4S1brPuyChqKMazJgdCHYEqq+ligxVz4j7D9sjprLhbRsyjvhkDDUmszjfCTE+
	 kQzM9JMsy8c+GqXbm7bpldntya2laBzM1+CLHOhFF248kGljIXWpcM3R77cJ/ZO+19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DLm+UlQE;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3203606A31A
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 16:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3203606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DLm+UlQE
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530e75d1ba1so17781821cf.2
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687516; x=1793292316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8m7/EiqjbX4B96wM7VN7+raoFsExq+tmX7IrIO9+WDY=;
        b=DLm+UlQEt1Vi85lbYTRXgNMeVc68/189FbY4F56fg2DGjRaagIOfJcFxYGY4B9XUb1
         XgqP3yQAx1m9EdVh6vcUGhHVzMLWY7ZVNW7b8hfWMu8eBLT7bXaeVizCYLyQdooWz6ta
         H346SrNnvvrMTqA9Oe+Wjz6Kd/B6PWrrgvB4s+mqvqJ/W/gjrNnZZ0SKcvkaCkT63I7A
         0njolmBNTPry+8uPEqljvfUnc0pHclg1WpTnIwDdOalFdXBsfGbHRAnQZFO4/H0+2LX6
         vCOFQNEAU2E6QuVAS8CgsAjXnLuiDOIp+YJ/4YuhIN7USKFGhSxcWd30t9VzzoolZgPJ
         m9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687516; x=1793292316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m7/EiqjbX4B96wM7VN7+raoFsExq+tmX7IrIO9+WDY=;
        b=QeVWQxiDrPwuFNo24DKTPKsm5vJxBVu6BP+0FYLrqb0I5Bo9kQjwOcMpltSvzVownA
         4HMG/Miqzvt+YvjQQOJFX91oLnZ23jLyJm1Hhpg1pKNtd1mJ3ciyZ8obLd8iuTsQ3YTT
         2TqFzZD8Qova5hBeWRJrSSD2w31O2ChZAb4brfRptcE4vWm43NS1eqqco9aUfACTpgAL
         JKO9ibaZQfmmuwc7rcyhBXhsccBt/lQuv7D9lYDj+XXTP1f8giAPCHiW6FLfVESprdCM
         VeF4gbvlz2pX32MARYle7nk9bn0AZ0c0KIGJ3LFjdf5rEIhIHZyZgge0in5kaO/DdjgI
         lOKg==
X-Forwarded-Encrypted: i=1; AKwUvBy1sA8M2ehU37EAFE2bfEKAUBXwfogIcSXrTV+YvJxLJGEgXNUb8hklTyD8q0yT2auphrNyyFUwYnD/PQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLElLdvXd9C+ly006MEkQKzH1iqKzQAcHPrdoVihWRNQSXyCuEi
	Ed+ONaaN/YlyAZVb5v2VuFcSmr2VtSj3gRL9OudjdWMYsYdNHV3QWXs=
X-Gm-Gg: AYBFou2m7kEql45DmJ4GMnEakWxDtZZMbFD/biWTCGeEj12F6ag+chgnTDAnSPj1KBW
	4WMcl7YV6Cv+qQTqx1Emu/aTqsA6HhKfalW+fcHRSz7WUB6QIrssr0ybYnWEggjIuuR1Y2VSKIQ
	1lwvovUnuLYztoOBh3Wd0xT6Nlx/vx2XfmsDxuSep9QDcLcl4QZWK68xpbnLRK97IWPoBJ8DR05
	DTDWGVO+ukJNmGNAvDpVL5qH3c3Db150B5UI/vb8yCyIvxfV9BOLgnarjr95dmo0f9jNrK8FSAp
	dIIX7Xmou67CKgu75aonVik03ltyTKyKXzaRILtjRxG+3BvZnHNlJAtVb7X4V4PB7kbUfMSFPq5
	wOxndsbISEn0WL2gh8SmJA0fOdmPZjUSJzzN9tYXS2Y/akJVvKCcby1/G0n6MERCvPFrduUObNU
	HoRh3LWiD4we42lvoXZ7sZzY11q/Te5rBJ18KxeuzTI2Rn4eVZiVpZRr4/asQ00xveDfqSUOxXi
	gIhdG+uHav+1OQzOUgBJAwIWIkWJ0pzX+dD2gXR2luVM8/j3BrdIBELezF/gOyxsrpz8FBd8UwB
	zuuf0Tbr2bKKzFs98utf5Vb58SyWNmTrJo/JAlOUwPOwAKmmQg==
X-Received: by 2002:a05:622a:8881:b0:532:91f2:dd45 with SMTP id d75a77b69052e-5369b861f84mr90124081cf.44.1792687515699;
        Thu, 22 Oct 2026 09:45:15 -0700 (PDT)
Received: from raincloud ([2600:4040:7e20:9b00:7285:c2ff:fed1:7bde])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c36f0abedsm1768696d6.3.2026.10.22.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:45:15 -0700 (PDT)
Sender: Shawn <rainey.shawn@gmail.com>
From: rainey.shawn+kaudio@gmail.com
To: Ajanesh Lal <ajaneshlal3@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Shawn Rainey <rainey.shawn+kaudio@gmail.com>
Cc: Shawn Rainey <rainey.shawn@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
Date: Thu, 22 Oct 2026 12:43:39 -0400
Message-ID: <20261022164340.78664-1-rainey.shawn+kaudio@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shawn Rainey <rainey.shawn+kaudio@gmail.com>

The device reports vendor-specific class on all interfaces, so the
standard parser rejects it and no card is created.  Add a composite
quirk with fixed audio and raw-MIDI layouts.  The id table entry
matches interface 0 only so that the vendor control interfaces (2/3)
are left unbound for userspace access, mirroring the RME Digiface
entries.

Both isochronous endpoints are marked USB_ENDPOINT_SYNC_SYNC: the
device implements no explicit or implicit feedback, and without the
flag the generic sync-EP detection pairs the capture data endpoint
(0x82) as a feedback endpoint for both directions, stalling capture.

Verified on hardware: audio duplex at both supported rates, raw MIDI
in/out, and complete patch dumps as SysEx on the MIDI endpoints.

Signed-off-by: Shawn Rainey <rainey.shawn@gmail.com>
---
 sound/usb/quirks-table.h | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 6343a50fb..0b8bea76e 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2359,6 +2359,69 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * Novation UltraNova: vendor-specific class descriptors, fixed
+	 * audio and MIDI layouts.  Only the audio and MIDI interfaces
+	 * (0 and 1) are grabbed; the vendor control interfaces (2/3)
+	 * are left unbound for userspace access.
+	 */
+	USB_DEVICE_INTERFACE_NUMBER(0x1235, 0x0011, 0),
+	QUIRK_DRIVER_INFO {
+		.vendor_name = "Novation",
+		.product_name = "UltraNova",
+		QUIRK_DATA_COMPOSITE {
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					/* playback */
+					.formats = SNDRV_PCM_FMTBIT_S16_LE,
+					.channels = 4,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_SYNC,
+					.maxpacksize = 392,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					}
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					/* capture */
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 2,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_SYNC,
+					.maxpacksize = 294,
+					.rates = SNDRV_PCM_RATE_44100 |
+						 SNDRV_PCM_RATE_48000,
+					.rate_min = 44100,
+					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					}
+				}
+			},
+			{ QUIRK_DATA_RAW_BYTES(1) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 {
 	USB_DEVICE(0x1235, 0x001e),
 	QUIRK_DRIVER_INFO {
-- 
2.56.0

