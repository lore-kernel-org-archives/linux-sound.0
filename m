Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD2367B93
	for <linux-sound@vger.kernel.org>; Sun,  7 Jun 2026 07:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780818147; cv=none; b=fAP9FpkpHKy9t4adcnU6kyqVsJeTb6Cn/NOT7TT7RAUxEkTlDgVsU10YZ/XoFU9SQiavjTRw8A7M04sTHlOSkxls2I+HAnnk808sceKt2VsXDTvfY6ZJP7P8A0huwK+Z087yjF/Eyw7vrxsa883Jwm7+cWaFmHJ651h0mUwaLCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780818147; c=relaxed/simple;
	bh=cETSxH6N8k4VJKEnZYyODhK/zPaA0KGxM0AkYi35j+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q2lzw08QkCyEbbjMusp+0UnsGY+ZF2WmqD725oOUzRF0Xr9/kQMzEj+UuoeoJHiTCfXvTfrhDRVM7fZ+yeY3V/IxQh6QTI4RHXGbTkP1Zy8A3KCRu8aKhTTa3RpsC1CtjKQFfWOMkvKH95GsEGse8KDNi6iWIVMEMBv7KWkn6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdzAVg/g; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdzAVg/g"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso2924351a91.3
        for <linux-sound@vger.kernel.org>; Sun, 07 Jun 2026 00:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780818145; x=1781422945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szQBTLMM+ErJ/0yB+n97U9OvndRfVdMRJeYj292RBIY=;
        b=mdzAVg/gi1c1HHzkgYHZrQUn0KSAPCDku47hh6a2zMSJGVX6pv0YkSc8W4Gt17Fort
         utLuWXFuCjUnmXQ5sKzwWvCUcc7vW0IdkWIkc6Tb8WyvToLNPT4o4VNFMkSR0YklqHcE
         i3WdrjAQ+fiXotAs3ekwltJChr4JhTW+PQ8QlFdEvwdX7t8GVPZOqM0yHhew/CrkOSaS
         4zSR1z8GqEPXiS3ys4RVu1E0atlKHY2zSGiiNGxEiAdEiMWq0izE8RjjrH9wNwV0WwKz
         lTCrlW2y+H9O7s1cGSUgJidmZBvPP5c55gvBRm6PNcg4X9N3Ii8oqRtUXFNN8ineX90r
         bu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780818145; x=1781422945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szQBTLMM+ErJ/0yB+n97U9OvndRfVdMRJeYj292RBIY=;
        b=YFfLAbgHg8IMtB/ZvEvLKPvLv4UjqQf5rfSMd6JZMXPmZsAyD/zzOvZNLLfTHBzqVh
         cbRKi84XQhVMESkVhz27L6cA4rW2/uNSYaAp+BoJpa6c0zV/U6GgdG5vm13+wZzhn/01
         hC7q3gZV0Ez9JbGOHqsoG4BNxWitghkTWwNlHuSetkP1qnMtTVxe1S3KkjOFdLRP7XHX
         osNxIytgeFV4I9cd+zJNZatiLw84fT8NJ0K0+wNc6hhwB4OGasMV7OCb8ARix2Dt8MuH
         9cVEwq5cUO5MukDoNtXJbtC0+oG69VcNMHE9IZRndwWfj74un/5Z9juC4/kTF88dY5PD
         c9PQ==
X-Gm-Message-State: AOJu0YwEbah/vpH6SCKyRcqwITHltXcqNI7Ka0GNJxv757CGadY6wL6R
	6FBDVh6f1a41woE82MMJQorKaGquGC33sXJ36NSIXoueta172A++tV4C
X-Gm-Gg: Acq92OGX8lGU/vW9k6KzLbuSr58zFiBhNYpL+plAqXMd4TvHfygBVmTMwqQmyirqE0x
	U4IutFnPNqWGUjGJ2KvVaO7+RmvziAUen8rXkLX3CunuhK6wFzCZu5nd1vDgCQ+dGF8T5VGxFmc
	iainxND3q3Z7PRxvjiEgh3+ehnJlEfxq0KZ4FtEhwObFrwrIh9BdExr4j99DtjkENFRa5S779fM
	jAjnVARHL2fDSY/M9pe0f8pLZmJfg7E2v1hli/6UNLCi5OJefOi2vwPKz7M2s0dXOjQVxwNmCzW
	D9uXaQVM8o6y9rYejBk7xtKOrEKRLSo+PMSKar6T+/tWBgkjzEbaU2rUqOEGdkPI17S6bEhHTN5
	7Pk98CEEDQi4lInLyQR8ca/6Xdu2zZsEpcN5Zat57R5Rt3HI2tMMGcmYz2yQDf3q5MFikO/K5il
	Adg57NxtTKXzq5V9MhWv2izqgH4R48IEesebUSL7Etv4Ykapo2Ruty
X-Received: by 2002:a17:90b:390b:b0:36b:3ecd:88d2 with SMTP id 98e67ed59e1d1-370eeb1bebamr11537085a91.3.1780818144906;
        Sun, 07 Jun 2026 00:42:24 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:5d57:2cec:64ac:50a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6ea172b8sm11903157a91.17.2026.06.07.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 00:42:24 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2] ALSA: es18xx: check control allocation before private data setup
Date: Sun,  7 Jun 2026 15:42:19 +0800
Message-ID: <20260607074219.3-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_es18xx_mixer() creates controls with snd_ctl_new1() and then stores
bookkeeping pointers or sets private_free before calling snd_ctl_add().
snd_ctl_new1() can return NULL on allocation failure, so those writes
can dereference a NULL control pointer.

Check the returned control pointers before using them and return -ENOMEM
on allocation failure.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
v2:
- Rebase on sound.git for-next.
- Resend only es18xx; the other v1 patches are already in for-next.

 sound/isa/es18xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index df88d91e0fb..1a02da1679d 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -1762,6 +1762,8 @@ static int snd_es18xx_mixer(struct snd_card *card)
 	for (idx = 0; idx < ARRAY_SIZE(snd_es18xx_base_controls); idx++) {
 		struct snd_kcontrol *kctl;
 		kctl = snd_ctl_new1(&snd_es18xx_base_controls[idx], chip);
+		if (!kctl)
+			return -ENOMEM;
 		if (chip->caps & ES18XX_HWV) {
 			switch (idx) {
 			case 0:
@@ -1823,6 +1825,8 @@ static int snd_es18xx_mixer(struct snd_card *card)
 		for (idx = 0; idx < ARRAY_SIZE(snd_es18xx_hw_volume_controls); idx++) {
 			struct snd_kcontrol *kctl;
 			kctl = snd_ctl_new1(&snd_es18xx_hw_volume_controls[idx], chip);
+			if (!kctl)
+				return -ENOMEM;
 			if (idx == 0)
 				chip->hw_volume = kctl;
 			else
-- 
2.51.0

