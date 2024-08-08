Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A413FD86
	for <linux-sound@vger.kernel.org>; Thu,  8 Aug 2024 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723124954; cv=none; b=oAZ4aHOFsiIC1gntDbskCcfVEg6VfUN3+w9GCs7mxZbJDk8Mzy8H4LSec4UFv9twfH7jE1qDW09roOy6qd3xHGBtnd0TgXL/E2LZjwh7CxVwbUosQZfyplgNG87/jOjPwudJJQTzedOUYSDkqBUCXb8pT+TXrShRkwKhJ7DuZ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723124954; c=relaxed/simple;
	bh=oHdPwKkQME8bYOR30ePg4GS9XEv348EDstUr6EWkBh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVgHeFHOAl9jsDHH+TvkYkt/JMl8+J2PLSLxF9r4XMRi1ql8WTfPUPAf/GWW7RkN0vCW9TrXUKWa8BZqu1SefWPlAE9yca2Wi5jMPodfDcGUaWg/kxFpH60I7/mRs5OKkQheQmRRW2A8DFuVHe56GEHnsJZjRBfyaKO+t56GZNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KpgQ6Ujs; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KpgQ6Ujs"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428178fc07eso6539555e9.3
        for <linux-sound@vger.kernel.org>; Thu, 08 Aug 2024 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723124949; x=1723729749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oc2kb4MfKvFjP/ZDE0bQ/8gyXH0Djs1sAmNuVFX31oE=;
        b=KpgQ6UjsBX8KIyVZmMIvMpgbegJi29G6gp6IKRdTkgAaNhddQLE9AMpYJ+FYs9TTnl
         LszS05B4tGwq77Lrg1PE2U2CKOj3pcircVdR5cmfnX0D/I9kHOc6WQcHhhHG9g5HdWrA
         WMNwNbHIS3Eo2TO5VNwE6dgXAJoxg7QeOos++IuQhq8OgZx5hD2H2tlu4DhqJQs+M1Dk
         GGBvetaZMJ+FJCmWP06TIRnD95uo+Jsj7utOnO/5jSRBkpJfecgacYLnRaYxU0TQN5eN
         TDE7RAnAlO61cBBsdMy6xHwFeeivEKqNsMLwPE5e9XzLQ6ctyuoAyL/Vlz/V0m4NLKR9
         yV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723124949; x=1723729749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oc2kb4MfKvFjP/ZDE0bQ/8gyXH0Djs1sAmNuVFX31oE=;
        b=YcZ4h1UDt4ejpae8wpy1/XAgJ3zfSc91LiBm3nJCOFyVR8Dgo20P2zM+Xh0gE15c5a
         EyyI5JxVGr5Ryo/3KfNn55BIxF4KwD5EmK4brZOQcMw+cy8OdzxmJX/qkbi5e4oZFFDv
         xMPFLqX5+NAR41SQAqSaHy+372sPHs1bo0qT2xXIsmb9bTsnwUiqsfLgyeuamXX6vjI2
         kgtjqAMAVjGgjFnhHqjDzBIo0HMs9CWAzp26ceNchCCpQB8O5L74mlHczrsW67VsWFsK
         H+XBb0v4ulRgp5yyVfmFBX4eIBcL0DNV3MrqIcIzdkwlYyzY3bTz5aq9jxXgHL71mIgs
         5PBA==
X-Forwarded-Encrypted: i=1; AJvYcCW5Dv2Zo2gOljyOqnbiK5HNx9eCeaVlG+0xHuTFjeOwVTed6vbhFILRsJxgSDs4gCl0id66giyO6TwjqZeX2NHsUg5oFScfLWEAyoE=
X-Gm-Message-State: AOJu0YzGG26Blwk4Ma3ROzjF8YlhVHtOSHUO3MH70zsEDLOal3GUBtmc
	R/HANYHAMLMix2cRXl9siExt4p64+7wpU8++m62U+PEwdZiPHTfhtgmizn/eNbg=
X-Google-Smtp-Source: AGHT+IGwNL0A36cUPhEaS/8r+wLSddqefAckjIQj+NsXha0hO1eaMKAfQzEMYgvHPb0aqA3AIXNXag==
X-Received: by 2002:adf:e782:0:b0:368:3751:de3 with SMTP id ffacd0b85a97d-36d274ed73cmr1472917f8f.31.1723124949209;
        Thu, 08 Aug 2024 06:49:09 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:13e0:cfeb:f041:89ed])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d271572cdsm2037735f8f.1.2024.08.08.06.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 06:49:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Daniel Mack <zonque@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: snd-usb-caiaq: use snd_pcm_rate_to_rate_bit
Date: Thu,  8 Aug 2024 15:48:54 +0200
Message-ID: <20240808134857.86749-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Use snd_pcm_rate_to_rate_bit() helper provided by Alsa instead
re-implementing it. This reduce code duplication and helps when
changing some Alsa definition is necessary.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/usb/caiaq/audio.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 4981753652a7..e62a4ea1d19c 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -174,14 +174,6 @@ static int snd_usb_caiaq_pcm_hw_free(struct snd_pcm_substream *sub)
 	return 0;
 }
 
-/* this should probably go upstream */
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
-#error "Change this table"
-#endif
-
-static const unsigned int rates[] = { 5512, 8000, 11025, 16000, 22050, 32000, 44100,
-				48000, 64000, 88200, 96000, 176400, 192000 };
-
 static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	int bytes_per_sample, bpp, ret, i;
@@ -233,10 +225,7 @@ static int snd_usb_caiaq_pcm_prepare(struct snd_pcm_substream *substream)
 
 	/* the first client that opens a stream defines the sample rate
 	 * setting for all subsequent calls, until the last client closed. */
-	for (i=0; i < ARRAY_SIZE(rates); i++)
-		if (runtime->rate == rates[i])
-			cdev->pcm_info.rates = 1 << i;
-
+	cdev->pcm_info.rates = snd_pcm_rate_to_rate_bit(runtime->rate);
 	snd_pcm_limit_hw_rates(runtime);
 
 	bytes_per_sample = BYTES_PER_SAMPLE;
-- 
2.43.0

