Received: from mail-wr2-f41.google.com (mail-wr2-f41.google.com [74.125.225.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAC947D94E
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141689; cv=none; b=kezrSMTnomnJIhYSdh80GJPH6m5d2l7W17A6gJRr2LZBLDiE7KFUX56pavxZSwMYM1AC0kYEnV/PhL0Fyj2ydLnEubtBuRGGXHktfDJlFUBETeLHGf3i/KcMhZPVMSAUS5T8fPPAc0K2v9yIVajlo8MJk8iqgAU1YwFaEX2EezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141689; c=relaxed/simple;
	bh=YCAodK/FAz1rIBCK4IS9rFfjuQJLSzopv/TZu5DO01Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grshacashvYDKaQrAE5JtRNXELX9DGUC/rL6IIKt5p4UdZVk/B7VyRg0UxofXCF5aXFreXV5fymobWm8L9+rw2e067t0ebA2lI2YHbSiBnVTqCgZZfbb9DwLLM18f/bHd1WyJLnJZ2I446TBzvO2QwJD75n2yPoczRDfXW1/t3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skYjMbMw; arc=none smtp.client-ip=74.125.225.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skYjMbMw"
Received: by mail-wr2-f41.google.com with SMTP id ffacd0b85a97d-4834977ae75so484545f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 04 Oct 2026 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141686; x=1791746486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSQsqc7OQj6X9qWeXJjPEqGWCcpu1RKTa9c8Z4J+GXA=;
        b=skYjMbMwqCXyBd5CLkGJhtX95csnZ7htu9vL2tWD4ZgwTTpVLzb9PUS2TxwWy60N5H
         /mmDjPwtan6Y1oYks4i1d1hcb9yrx6S8aWG0dkYHfxzntzzV9MDuHo8gfzBR7n7v1x50
         6MQbSCebDK07QIdoBDbLk85lLLjVJamet7snD2FARbHlR7RY2RADhjb9g6+XaKW8hUNv
         X2XtpsyZsP093PUTMkL7Scc+MHLZHO6OCkXTAZX7CETQ4Xu5BqNcMbATokQcSXV+3csb
         t8z+luiUiIIrNoFsyuVkbTTvsf+T5ld+4jCERXYeZfZWCZcVwwJ3NbFSZ/5bebbph1Cl
         u3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141686; x=1791746486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSQsqc7OQj6X9qWeXJjPEqGWCcpu1RKTa9c8Z4J+GXA=;
        b=ReV/Yqvt4gJuELBHcTetY7kc8XPdZg35c/XZo88aa7aR6qO8g5u4OloNXB7xWHQrGM
         ujvyhfxz43faFPSmbCOJb3jOPrmhKuoBbBxCpGzX/gSc6R+cPcblv7RIZ5tRIP7PygfN
         eqyqVEiBVk4/V+lV3Y/mEzeFvVYYlDu0/z6QW+KKNMZ/wItybIxyRvz6iprhqgxmkPKH
         3K4TAI/1j94Yu08QUHcAsewznrZaw+lb3RxtIE+9hnoYzCTrXY498Ky//quiPwKt/2/X
         hE0ERwpw6XBqsnYeBhirQ08Hd4Jow3IW4zqbEVTEOet32e45CrLBJ02+jjyXV7/qeWFo
         LKmA==
X-Gm-Message-State: AFq9FYLMGITduhwyc6BZo5rCzbXTaC9W9zoI1/TZGpSo18qwtfYFRRzz
	iKJuptXLBhhXRusIsr9TuxZ8bpEfRoulGh4Ep4x837Dq9wPfqgHwtZpV
X-Gm-Gg: AYBFou1/ioV3qOcnsm5crDcJhZ1PfZ0CQTJSeIOrlJ9R1DbtvOoEhnQuDmRFLNAgOHW
	OZIPg6Vx5g308CFTFjWRtzob1vkkw4Jt972y+hqGKqBy94XR1jw/akLLAv8JlL90OZmh9W/WsPn
	EWyKdgbDUzvpx67Y1NbzjMT5LFqOjeF20yi8GwvfCaizdPPftEbnPzEP3hllPK2CwBi6kZYINXi
	fCKjIFjHnnTYJ8wPRal/mTB2OUiUVLCs/5EOS4ejYmdmA8VTWSoFjij+Ox1sus9dbA/E+G2M7gz
	pwVhA7bSLRo/pkfkrkYEfkLPh9mEfHTPWIVDtoGGqUgAnQGoziD6xm75XkZ1nIoOgbjguc+9sdq
	bDT5mJ7016yUjD9kQYnT5R1qK2K4rLKxkxgU8KV/dqY0HDXgBiL33WTuemfsNqkNQXVT+2HZMXE
	jJFf75Bm5Ht+NZJcZNAZ2z+eb/C/OhI55QBZIU8dc0xx219q463VYJFlynpLejbEDbXCVaWQwf5
	+/FL0QFJZcr0fICe97dNkjkZD4Q6G0Lch9swKwzUcoH52yMkvXwqYnrme0pb1oxmJm/4pbD2nX0
	qLB3
X-Received: by 2002:a5d:5f05:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48b126f5423mr15762115f8f.1.1791141685838;
        Sun, 04 Oct 2026 12:21:25 -0700 (PDT)
Received: from jjj-x570pro4 ([2a01:e0a:9d5:4a60:d60f:fd1a:fad6:a587])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm18771733f8f.31.2026.10.04.12.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:21:25 -0700 (PDT)
From: Justin Bacle <justin.bacle@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Bacle <justin.bacle@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: add sample-rate quirk for Yamaha 01V96i
Date: Sun,  4 Oct 2026 21:20:50 +0200
Message-ID: <20261004192102.59312-1-justin.bacle@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yamaha 01V96i exposes its audio streaming interfaces as
vendor-specific USB class 0xff and ships no class-specific endpoint
descriptor.  parse_uac_endpoint_attributes() therefore returns no
attributes for the device, and without UAC_EP_CS_ATTR_SAMPLE_RATE the
driver never issues the SET_CUR sampling-frequency request the hardware
needs to start its USB audio stream.  The playback and capture PCMs are
reported as RUNNING and their pointers advance, but the mixer passes no
audio in either direction.

The vendor (Yamaha Steinberg) driver on Windows sends this request at
startup; the generic driver does not.  Add the 01V96i to
snd_usb_audioformat_attributes_quirk() to force the attribute on, so the
stream is initialised the same way.

Confirmed against a usbmon capture of the Windows vendor driver: SET_CUR
CS_SAMPLING_FREQ_CONTROL to endpoints 0x07 and 0x86 is the only
non-standard control transfer it issues that completes successfully.

Verified on a mainline 7.2.9 kernel with a loopback test: playing a
440 Hz tone on USB channels 1/2 and recording USB channels 9/10 returns
the tone unchanged at 44100, 48000, 88200 and 96000 Hz.

Tested-by: Justin Bacle <justin.bacle@gmail.com>
Signed-off-by: Justin Bacle <justin.bacle@gmail.com>
---
Changes in v2:
- Describe the change and its verification.

 sound/usb/quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6176acc04..9a5ea295e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2332,6 +2332,21 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 					  int stream)
 {
 	switch (chip->usb_id) {
+	case USB_ID(0x0499, 0x5500): /* Yamaha 01V96i */
+		/*
+		 * The 01V96i declares its audio streaming interfaces as
+		 * vendor-specific (class 0xff) and provides no class-specific
+		 * endpoint descriptor.  parse_uac_endpoint_attributes() therefore
+		 * returns no attributes, and the driver never issues the SET_CUR
+		 * sampling-frequency request the hardware needs to engage its USB
+		 * stream: playback and capture PCMs report RUNNING, but the desk
+		 * passes no audio.
+		 *
+		 * Force the attribute on so the stream is initialised the same way
+		 * the Windows driver does it.
+		 */
+		fp->attributes |= UAC_EP_CS_ATTR_SAMPLE_RATE;
+		break;
 	case USB_ID(0x0a92, 0x0053): /* AudioTrak Optoplay */
 		/* Optoplay sets the sample rate attribute although
 		 * it seems not supporting it in fact.
-- 
2.53.0

