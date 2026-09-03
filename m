Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C9323E25B
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477444; cv=none; b=GnBpFH29IXFp1c7ofSfCcex7WZkrRz1GGymXgzSrGxuv/rhZMLgJiodj0JhczYUFEDYx7TZtWJL4vpenTRIISLPqM0KJhmDMx+g8QRfzfhH3RtWbHJslrLNUgW4oDbhF3KGeBVYAS4Q5eDUeubXBCRlacQz16KsdxWgCkkbdRyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477444; c=relaxed/simple;
	bh=2gfvM5RuYUvtDsXo945J8ygSVYYnP2P9eEs513EGLro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KmAx0g+8Gg6a6Xp04kYQEpoW8js2R4NKYXGcSp8v1Y3la9diGoI0hmn2tIZhC4RzBIxytGrbLr2HameaIgpgxfkyz1APVgbFuFE0uxCPGhgv37uFi6n8S5ToWJ4/iL8CpSqW2e/7YBiXwjvfE+lYU2EyAEd5yUOyKU28msiV2Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyzELWtO; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyzELWtO"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39675172593so291874a91.2
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 16:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788477442; x=1789082242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uIfe5s7ZFcdqKOOrAIL/cJfuy5I0dWNvdDFRtudxhJU=;
        b=WyzELWtOyg+yUFxqBQjOElBaTF/GEzeBqvKoALO0gUlaQW4oqJrnHWkZWizavmtwhb
         J+fgd548qAMxBUdEWelMMFfRzHMp9EgBgeYL1FkZtduqO4iLJbHu1ZUeww/T+RJPoDrP
         myQ5Yqosk3+rPiicr9cxuhZBinThKAKf9U88eoNe0dat2fRoRDXNNd6SRRb8MpGKGZlV
         QG4Ctv2UFipI5tkll8isPOOqCGnpWO1ubCh9wP83fY5gsZed6l9wsAf1VOMa++LlifIO
         sZb88AFC7D2Zug3rrBQEqGb0YR8Kck0JV+Otc+p48/lJOfbiQfnKns0TYwsPEhhWlhys
         2V/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477442; x=1789082242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uIfe5s7ZFcdqKOOrAIL/cJfuy5I0dWNvdDFRtudxhJU=;
        b=cKEfozzKNsxBpIOAacskDYtT9TIPeIFzYFMjjHF3xr7YUbBZ4Fm2rA09b1/shpK1e7
         wGIRW7VhNJan1PGhkSenZkQuNd+SlixBhsO49baeZIK9hi/x0AbBqAct0qFJVE+30pVW
         kls0D+nXGdqu5va6zOglaaKi/OeZ1eW9hXSP4QPu1wkWJBW6GRiZ+CMafVIMgf+Y0QYY
         o3J3FehLclvZMWSyyrp6W2UOTMiVebMebrkuBTRc+gmygEMnNZg1dfpjVL4zDrMSQ0k0
         ZvldGbyVlCgd+CZP9cBEraKWeKVA3FcPAoJ7nw9K6yVtP0kg2UJf9El4UmWw9KxMZC0i
         N9Bg==
X-Gm-Message-State: AFuF++nDu+HUv8oR2RhaIWFDW44ngYW82LPggHpfYChiJ1bJ6aIb4sKK
	Da7QJndQZPJzM9Qpnh2pM/DpCt1eAay3O+r2YOxunBdKfkFa6NcBBaw06v153quE
X-Gm-Gg: AYBFou0+lE4P7DPYyno66jhz/Y6+5+0vEq82ALZSKiAh4cpLCwKXff9jz2K/U8OhGqR
	v/te0O5TWp6wOvagA9LMqB4xf/K/PP6aruJxu0nV62D1nQ+dLZIMt5wQE9ZP14omVnxZKBReYce
	zmWYm3A0hO0KSMFL0iNxpHbPcRu4WENUhWKg5yFc32nDG/2vjG/gXZEhnxL3Vf6yE0bkb6g/fi4
	D63bzPf2GLSwZlDMdh9ky/rV1g4UprK9H/sBeUSSxrhkCDU2EHkjr4LbjrTZCs0ncgz//ZVIeeG
	S0hjWm6v4eBWDGaBDsr7TeU5pG2fNfOadoeXODoIAgsQFS7x+j1EThTkM9Sb3ch42t4IHAmcwkp
	IWOp4IbdSiGhgeJ1hcdxnPRqnky5Gy34MwAeyIrkRB+zDssxIuVHJ1GxbaLdvsR8YwimjegPUix
	Qr5Oxbxr0jWIGvtgFbNY6FnQ3uM918JXMNd5BCUJjjCHGT6Czwjr/mu0bcD/psRCE5GJcaSkWuW
	w==
X-Received: by 2002:a17:90a:51c6:b0:39b:29ca:3d23 with SMTP id 98e67ed59e1d1-39b29ca41d5mr539417a91.17.1788477441778;
        Thu, 03 Sep 2026 16:17:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:1960:1401:126c:876e:d154:517e:4c6f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm2072759eec.7.2026.09.03.16.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:17:21 -0700 (PDT)
From: Hanh Kieu <hhkieu@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
Date: Thu,  3 Sep 2026 16:16:41 -0700
Message-ID: <20260903231641.18536-1-hhkieu@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Pioneer DJ DDJ-SZ exposes its audio interface as USB vendor-specific
class (0xFF) rather than USB Audio Class, so it needs a quirks-table
entry like its sibling Pioneer devices (DJM-750, DJM-850, DJM-900NXS2,
DJM-450, DJM-V10) already have.

The device presents 10 channels of S24_3LE audio in both directions,
fixed at 44.1kHz, on interface 0 altsetting 1: playback on endpoint
0x01, capture on endpoint 0x82. The unit contains its own analog mixer,
and each playback channel pair feeds one of its physical channel strips:
0/1, 2/3, 4/5 and 6/7 feed strips 1-4 respectively, and 8/9 feed the
booth output. The master output is produced in analog by that mixer and
is not carried over USB at all. On the capture side, channels 8/9 are
the mic input; capture channels 0-7 are not yet mapped to specific
physical inputs.

Implicit feedback needs no quirk flag here: is_pioneer_implicit_fb() in
implicit.c already covers vendor 0x08e4 with a vendor-spec class
interface and two endpoints, and the driver duly reports endpoint 0x82
as the playback sync endpoint.

Activation reuses the existing pioneer_djm_set_format_quirk() used by
the DJM-750/850/900NXS2/450/V10 (SET_INTERFACE to altsetting 1, then a
UAC-shaped SET_CUR sample-rate control transfer) with this device's own
captured wIndex (0x0082). Unlike those devices, the DDJ-SZ additionally
needs a vendor "arm" sequence before its capture path produces real
audio -- without it, capture opens and runs with no USB/ALSA errors
but delivers silence (a hard zero on every channel) rather than any
error, so this is easy to miss. The arm sequence is six vendor control
transfers (bmRequestType=0x40, bRequest=3, varying wValue/wIndex, each
followed by a bmRequestType=0xc0, bRequest=0 status read), replicated
byte-for-byte from a USB capture of the official Windows driver.

All of the above -- endpoint numbers, format, channel mapping, and the
arm sequence bytes -- were determined by capturing and decoding real USB
traffic from the Windows driver (USBPcap + Wireshark) during
enumeration, playback, and mic recording, then verifying the format
hypothesis against actual de-interleaved payload data rather than
packet-size arithmetic alone. Both playback and capture have been
verified working with real audio, not just clean enumeration.

Signed-off-by: Hanh Kieu <hhkieu@gmail.com>
---
 sound/usb/quirks-table.h | 47 +++++++++++++++++++++++++++++++
 sound/usb/quirks.c       | 60 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index a1a33f11d..2da8cbe3e 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3731,6 +3731,53 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * Pioneer DJ DDJ-SZ
+	 * 10 channels playback & 10 channels capture @ 44.1kHz S24LE
+	 */
+	USB_DEVICE_VENDOR_SPEC(0x08e4, 0x0191),
+	QUIRK_DRIVER_INFO {
+		QUIRK_DATA_COMPOSITE {
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 10,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(0) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 10,
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_idx = 1,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_44100,
+					.rate_min = 44100,
+					.rate_max = 44100,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 44100 }
+				}
+			},
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 {
 	/*
 	 * Pioneer DJ DJM-750MK2
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4936d66f9..f09599c0d 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1767,6 +1767,62 @@ static void set_format_emu_quirk(struct snd_usb_substream *subs,
 	subs->pkt_offset_adj = (emu_samplerate_id >= EMU_QUIRK_SR_176400HZ) ? 4 : 0;
 }
 
+/*
+ * The DDJ-SZ needs a vendor "arm" sequence before its capture path
+ * produces real audio; without it capture runs with no USB or ALSA error
+ * but delivers a hard zero on every channel. The sequence is replicated
+ * byte-for-byte from a USB capture of the Windows driver: each write is
+ * followed by a status read whose content is a fixed value regardless of
+ * what was written, but the read is replicated too, since it is unclear
+ * whether the device requires it to process the preceding write.
+ *
+ * This runs from snd_usb_set_format_quirk(), i.e. on every format setup
+ * rather than once per device. Re-arming is harmless in practice and
+ * keeps the device armed if it is reset behind our back.
+ */
+static void ddj_sz_arm_quirk(struct usb_device *dev)
+{
+	static const struct {
+		u16 value;
+		u16 index;
+		u8 read_len;
+	} cmds[] = {
+		{ 0x0100, 0x8002, 6 },
+		{ 0x0200, 0x8002, 6 },
+		{ 0x0303, 0x8002, 6 },
+		{ 0x0403, 0x8002, 6 },
+		{ 0x050a, 0x8002, 6 },
+		{ 0x0000, 0x8003, 2 },
+	};
+	u8 buf[6];
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < ARRAY_SIZE(cmds); i++) {
+		err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), 3,
+				      USB_DIR_OUT | USB_TYPE_VENDOR |
+				      USB_RECIP_DEVICE,
+				      cmds[i].value, cmds[i].index, NULL, 0);
+		if (err < 0)
+			goto err_out;
+
+		err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), 0,
+				      USB_DIR_IN | USB_TYPE_VENDOR |
+				      USB_RECIP_DEVICE,
+				      0x0000, cmds[i].index, buf,
+				      cmds[i].read_len);
+		if (err < 0)
+			goto err_out;
+	}
+
+	return;
+
+err_out:
+	dev_warn(&dev->dev,
+		 "DDJ-SZ: arm sequence step %u failed (%d), capture may be silent\n",
+		 i, err);
+}
+
 static int pioneer_djm_set_format_quirk(struct snd_usb_substream *subs,
 					u16 windex)
 {
@@ -1948,6 +2004,10 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 	case USB_ID(0x08e4, 0x0163): /* Pioneer DJM-850 */
 		pioneer_djm_set_format_quirk(subs, 0x0086);
 		break;
+	case USB_ID(0x08e4, 0x0191): /* Pioneer DDJ-SZ */
+		ddj_sz_arm_quirk(subs->dev);
+		pioneer_djm_set_format_quirk(subs, 0x0082);
+		break;
 	case USB_ID(0x0dba, 0x5000):
 		mbox3_set_format_quirk(subs, fmt); /* Digidesign Mbox 3 */
 		break;

base-commit: 4c4e4be4edd5dbf5f7f6a3ef4fc0c243f2d01b3c
-- 
2.47.3

