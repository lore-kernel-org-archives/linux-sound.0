Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087D2340A63
	for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765986813; cv=none; b=LoR073DLvfvqfvLOOngcXter3k7wVVvE0HV+zB4UjIyoPR99NMNrkiueDRUs7gTBM4Wwzig4wRlZtaM9bVLvC1FJCmf25+kCJWuGhom96NIFkel4MN8gNRx16rjr6DEjc/2GIHJNvi07jtACPosdG3EdhQTrfmr7gjBQ4WjQ3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765986813; c=relaxed/simple;
	bh=raArNfn+5jVxig+57g61GxweQu1Zzkp9Vp70ndyLG6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UtOpSj4ypeixQseakCc84E5/RvUNPCcJTH3DpNP+b1IjYmADcNtLLXiHMYdXE2plY+/cY0SssoTVZOMKwMmS3ZiWtqyNIxBg/80U778b1sZHXcVzHYdIsL7IPpYpDM/t0pRcYJncvYY+Ey1fl/eMwofLBH2g23xzyglfFxo2rfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1OVBxjg; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1OVBxjg"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37bbb36c990so6373211fa.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Dec 2025 07:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765986808; x=1766591608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kTqmxHCCOaFPZcA3iNtWwS/oLP5afbjZUhekq6ohTgs=;
        b=X1OVBxjgUTxkVFpyDSS5L0yfrfqSNDQWFeRrzRwYn8dj+kHGPiqiU++r+c3SH/FAhD
         eucq0XU4mOZ9o3ZdWAsASuW4gDdVv30zcJrom3KYdj/TlxbZ+dmAy6eYlRtkUSb/CG8Y
         Ad2tZjbWBrlCGi/qpRTJloOs8wJntCt1XuSdvpSNKQfyUQF52VR6jK1YS6MJYq2hBs3z
         Ri5cmflrvOlFXkN/BCIoi5fAUyGfaiqsQBHPfzJse8XY4KJaqmYImOtauN++CfIBQdXk
         9sE6hP7aGVrkQHuM0MrMtZrFGZmg+JXyOud5UbawcylBYjXTWU0BtWIO94usIV6nBmpD
         lSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986808; x=1766591608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTqmxHCCOaFPZcA3iNtWwS/oLP5afbjZUhekq6ohTgs=;
        b=u9W77mSQLLK2jbQYEhmEd2pvdgcdGatXLr63OpB+fT6nMEYHPeN70b23aNvKYqtzjS
         PxFbc7If+iw4Wj/+iC4TYsS5Z06ipun2jZCLf7J0mdZ0vmyCJrPdfo7amlaV8amfr0Dg
         ZUQdoHo1N6RMQnAhiovqCEZMf355Cj2lMYUb3LIrwz3bgB/QE73OIdvZsL9tgKAjyDvp
         Tsn9gsnAEpqGRRKdyWLya+rkNiZrodKYmS+2MU733wGq3x3AgAVtTkQdwcaDapiRODwX
         jjz5heDY/i/AWOJH064RDKVHYBwUiwhpgHcxhoyxpN7J6QAX21+zrXu9dNkje8Ddx8dX
         bypg==
X-Forwarded-Encrypted: i=1; AJvYcCVvgsK5G891vpfoaN+ie6w4BKKitLu3u4dG31K7Tp6hh9Gk/TPAM3jTlU5hNP6H2s4pzY6cCmiA4fGaZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFekCI/ZTqrj/ANeGblSPG/xUCoLQogVh65cfSMqabw2V1P88Y
	/MG2Ml/mDkp4/08dk1MavgSBsa3uMcJ4bEaNJuG46aLo/HEXoyz+INdx
X-Gm-Gg: AY/fxX6fYSYz/Ccc8K09wlsBhKIPRlaP6s8wamYR0YJqOGTTkoxrmRHyQgijt9bhcve
	MbzFEz6/rU6I2HThVT6rwflupd19WOzVVjHuBH1mHVL8+gqlN07dZrBqvxkSfJK0u+lm8Uk000s
	o3+yFjnsaDBXGkCyH9CLUA+StXaR0PiNQCBncV2j8/5rHnAeSdEW+PBdvrgUkInBMdmzAW8bk4Y
	4zPkwFLtRb/DwYERAGKsYMB+dsYWD6+kXj051mPfWeK6nSUfxOdw2JLraIA753RnOflLdFoBOqb
	2kZyfHtUkO8sYydC5UhVLSHhNJPYeik40nA7bChdGQL63J91E91C7xopQRPFcRHjProtmFKXSLx
	/k22DeOM1+bWRNdC8bnOJdOzpnB7CqWHmnp1niMAKK2m/06/Bo/lGblDvl/lai+FINXdLGL31YY
	wpuq8=
X-Google-Smtp-Source: AGHT+IEua4XwwwWr3YSEKdUMxFGtqesFBRMfMecObVCZ5ywike85V2R9q3kNBhmjaCHuo8z9u0Ocjg==
X-Received: by 2002:a05:651c:1502:b0:336:b891:18db with SMTP id 38308e7fff4ca-37fd087a8bamr62870921fa.2.1765986808074;
        Wed, 17 Dec 2025 07:53:28 -0800 (PST)
Received: from fedora ([45.85.105.21])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fdea793ccsm50483491fa.0.2025.12.17.07.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:53:27 -0800 (PST)
From: Tagir Garaev <tgaraev653@gmail.com>
To: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org
Cc: liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tagir Garaev <tgaraev653@gmail.com>
Subject: [PATCH] ASoC: Intel: sof_es8336: Fix headphone GPIO inversion logic
Date: Wed, 17 Dec 2025 18:51:39 +0300
Message-ID: <20251217155139.185006-1-tgaraev653@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headphone GPIO should be set to the inverse of speaker_en.
When speakers are enabled, headphones should be disabled and vice versa.

Currently both GPIOs are set to the same value (speaker_en), causing
audio to play through both speakers and headphones simultaneously
when headphones are plugged in.

Tested on Huawei Matebook (BOD-WXX9) with ES8336 codec.

Fixes: commit_sha ("ASoC: Intel: sof_es8336: add headphone GPIO
support")
Signed-off-by: Tagir Garaev <tgaraev653@gmail.com>
---
 sound/soc/intel/boards/sof_es8336.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 774fff58d..fce50fd9f 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -120,7 +120,7 @@ static void pcm_pop_work_events(struct work_struct *work)
 	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_en);
 
 	if (quirk & SOF_ES8336_HEADPHONE_GPIO)
-		gpiod_set_value_cansleep(priv->gpio_headphone, priv->speaker_en);
+		gpiod_set_value_cansleep(priv->gpio_headphone, !priv->speaker_en);
 
 }
 
-- 
2.52.0

