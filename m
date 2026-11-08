Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143053;
	b=q01WKBf4D9bqDLZ2jNHnlbRpELCgSy6b1IdncllKQj/Pc1m/T8VX09H4+F4iKQ3M0pVl
	 B/RUjObmvA4Da/AsDKi93BsbQXNFysM2sehRdsYUrEP2EFOKMk+xPnhE0P8UZVsVbNpZb
	 njDrqUOzg4DFCNssZlzhk2DS9PuOwhpBkipWymR2rLNXuL8dV5ynJk7EdUS+Dgr/iL5En
	 jpgRKiOFYgystQDbvrek0ZxQIhonCYkvO3BQdhHSqIMV79Epss5Ui9RDHc+YAFT1coxsb
	 Ek+Mt2S56BEPfz3eZz5flLj4oJxWiN+A10Ni5KFBBLyvEi7Irz0MF+FN4rQIgc9uSNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=InYgRJ41cVKCCq2fRJBS+cyeKW5AIrUjS76ncVBusC8=;
	b=JQlOIAVU2zvlFqaT5fD595Ep4bXGdHmZM5Nf52jdJUxX9cLbYP4f0AlmaU+lzrb+eWhw
	 l2ySgsgdEMfEXTwe0DD4/ORd1Qq58YYcO8OQMq5QZcDuoCTho0T7u5MqYMJ2TQNBpUtVh
	 3cfLRu+zd/shp+WUHs8II3m3BwZRBC8rSw4bUETxWwlJKXSZ5FqXIZxp1qdlUqM4yx/13
	 jVRE+vuqALsoA/feMMoWPCWaGzmHVOhJfyQ0GTyZTmIvKvfrQ9hchnsPvvxfQ5evJvxWx
	 5/0A8Ndyy+LZrzhklzc40Cuh9e4YV4GDA6Z7ZBamrsawDcm1RGlFjXv1A891E3Z6n4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O/rbTePz";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFD8606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 13:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFD8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O/rbTePz
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-372bdb942dbso120941eec.1
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 05:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794143052; x=1794747852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InYgRJ41cVKCCq2fRJBS+cyeKW5AIrUjS76ncVBusC8=;
        b=O/rbTePzGPpPhRz0Gzzhtf3+kbKy5+wDvHn6RLJ6sqVhiDdGg+9cBGPMZ6Y5ggeb1w
         FJF2RMfiSpZ3pijdRJVSOT9LI4tYqUmRpmw+faXSCGwDXdWyq7Rc/NJhSxad6lxc1q54
         EI+g+D/KghZ3hk27QYausNUFibd6KscTyHM8tE8THLkSJLaj0AWWKv+dwq/Qg0rA9KUr
         cqu/QRepnKiEcjy/liru1EWXDZoTaHMMTjoakNTMqJM5FU6PzIXzL1ggfM94x6SDharw
         fjo26jhTYetwTc8e7M47iD79Mv2OLejjOOitpdiiFsquo2eC4TfSIS1hKWVcRBSgpD2t
         LIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143052; x=1794747852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=InYgRJ41cVKCCq2fRJBS+cyeKW5AIrUjS76ncVBusC8=;
        b=UWTAP1s16aIn6F/UWFtduMnYJNBVGVRa0faVmFJ2DKa/bCC/KNcJhPuCkEsCQWmThh
         SEOmUZxg6lzHTpDKE0926jLghN8IrJX8KL9DpkRc3TJHLQWhMFQMctTuuJspiIp8lwXJ
         LV1gqFEYQjgr/Y7JpC/Lk3XYtfmSzD5VaWNKGqTmkTPg60nXFGUobmLDW5flQ7GmfgUi
         c15fifMc2ZA4vvlzLRBnqd330b984Vqshqb1xlF8L9OnBM8rj2/pdq9zmtcAr4K4g3A6
         xxA4jvj3H2Af3TCnnpEmB32rlhdY0ZZvMKgN4fM9iXE4cr2Q6bwmYk7+shbvi+nwR+QL
         sB1g==
X-Forwarded-Encrypted: i=1; AL+hErHhEDpPa8MhI9bH0PrESMl76qaxrbrLmb2lyzo1GIIY9+OKY3d8ZSmtW3bc4H+RBx8pFOdzRPzon8Foig==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MbQ5TyvqjIufBJYmMTutxutYXKXRT0TzQjVpl1SN0XASxFthN
	bx/XmEaxvjef2HhUUKcsmlosVa0UAQ5udF6kJj09VSZx0F0veQSF1PQW
X-Gm-Gg: AYBFou3CZU7BlQaqmidiZ4hp0jMg0tDiAuqq1a3uks53hp/+sXuL2uzL8ffvjXrpO51
	UpQs+AB6rlV04qPS9kzWB89lwJGiy9QwMp+Flzqaqc99mMyIkbzkpfhzTPCF4C1t6sDwspj7Wkf
	TqYSLx/PhbEUJ0cEoAQjAHSxCLtFc4Vc89UsfVVDEOO30X+sHl2UgYHThWiF4/VOxVrRE+tjB2i
	k6ZCEbchKuwaghj7axp/9+E+KdYbA1/8h3tn3hoCqD+mME0+sjvnGgl2KZCI4iJytiUCephf7AW
	a7tqjgM0/lTtmuI42mzEPMhma1ir3iI2vNaQfg7wrLUNme/Zj6WD8yN55eBluvDKIJN4WszB0oP
	gzBU7AsUYsmqvqx771/DrixO/oSSWEcu9DTl6y571wzEfmaqnNbyorBqSPkRS7utzTNbmiZMUDW
	qRrDY5VhLmo5zijDLQ3BeTBgD6fJ3+0CS+ucFb6r8kIF88FStAzm3IYx54wTiRbuzB1ksgj/imS
	ZgionQCRgCAR7A7y0k7tXFYLCmSvQpNOokmpSXuQsrQeAHv9uWcvAe8wKZoMkZXatw2li4mjVa+
	be/EZQbMnq9jB3KoAq/8BBB64Xs65MZrlROmywWh5VcfA+L8AZFuQVQ=
X-Received: by 2002:a05:701b:4508:10b0:1b3:755a:ec49 with SMTP id a92af1059eb24-1b39fed077amr1921739c88.40.1794143052168;
        Sun, 08 Nov 2026 05:04:12 -0800 (PST)
Received: from prts ([103.156.242.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e936bsm6603194c88.6.2026.11.08.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:04:11 -0800 (PST)
From: Xinyu Wei <xinyuwei1024@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Cc: Xinyu Wei <xinyuwei1024@gmail.com>
Subject: [PATCH 1/2] ALSA: usb-audio: name the interfaces of the Steinberg UR22C
Date: Sun,  8 Nov 2026 21:03:02 +0800
Message-ID: <20261108130303.387288-2-xinyuwei1024@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108130303.387288-1-xinyuwei1024@gmail.com>
References: <20261108130303.387288-1-xinyuwei1024@gmail.com>
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

Configuration 2 of the Steinberg UR22C (0499:172f) exposes 6 playback
and 8 capture channels over standard UAC2 descriptors with
bInterfaceClass set to 0xFF.

Because the interfaces are vendor-class, they fall into the Yamaha
catch-all entry and QUIRK_AUTODETECT fails to set them up:
create_auto_pcm_quirk() rejects 6-byte UAC2 format descriptors, and
interface 0 (audiocontrol, 1 altsetting, 0 endpoints) is rejected by
both auto-PCM and auto-MIDI paths, leaving interfaces 0-2 unbound with
no PCM registered.

Add a USB_DEVICE_VENDOR_SPEC composite entry before the Yamaha catch-all:
 - interface 0: QUIRK_DATA_STANDARD_MIXER
 - interfaces 1, 2: QUIRK_DATA_STANDARD_AUDIO (6-ch playback, 8-ch capture)
 - interfaces 3, 4: QUIRK_DATA_MIDI_YAMAHA (DIN MIDI and DSP mixer
   control; both carry Yamaha-style CS_INTERFACE jack descriptors with
   no CS_ENDPOINT descriptor)

Configuration 1 uses bInterfaceClass 0x01 and is unaffected.  The
existing IMPLICIT_FB_FIXED_DEV(0x0499, 0x172f, 0x81, 2) entry in
implicit.c applies to both configurations unchanged.

Signed-off-by: Xinyu Wei <xinyuwei1024@gmail.com>
---
 sound/usb/quirks-table.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index e85eeb536..cc2c1317a 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -455,6 +455,20 @@ YAMAHA_DEVICE(0x7000, "DTX"),
 YAMAHA_DEVICE(0x7010, "UB99"),
 #undef YAMAHA_DEVICE
 #undef YAMAHA_INTERFACE
+/* Steinberg UR22C (configuration 2) */
+{
+	USB_DEVICE_VENDOR_SPEC(0x0499, 0x172f),
+	QUIRK_DRIVER_INFO {
+		QUIRK_DATA_COMPOSITE {
+			{ QUIRK_DATA_STANDARD_MIXER(0) },
+			{ QUIRK_DATA_STANDARD_AUDIO(1) },
+			{ QUIRK_DATA_STANDARD_AUDIO(2) },
+			{ QUIRK_DATA_MIDI_YAMAHA(3) },
+			{ QUIRK_DATA_MIDI_YAMAHA(4) },
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 /* this catches most recent vendor-specific Yamaha devices */
 {
 	.match_flags = USB_DEVICE_ID_MATCH_VENDOR |
-- 
2.56.0

