Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E214A8FD8
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551645; cv=none; b=U0cxLU8RDqd6tqJGj8gKHwzzIz8beBS/sviNUCcjP6a+ZYFqyD4ico0MLyVHfhx7hjgK/ask/jnFDS7QPzIZZjhEmlRNeNhdLjQ5LWiLRfCyZNYCkF071rvXASyW4m+ERZ/JXjRPz4QoaNXC5p6tFQiN8dDGqrYPrn+6pPRjyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551645; c=relaxed/simple;
	bh=0BwYFsUGvhV1ukvG7oNNQBcKUzIkdDHy2xDOs9Zgzoo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/aqiokvennW52Gkqn9kIeFXYFog/OpGHCvRjjyXx5/SCej5pNxdafiX3D+NbVzpxL3wd4Xzn400/fbqnJhwKUuLKQ1L0PFpIwcAy5XIKjaDC+YcVWx600k9WtL3KIA2dTmHUnXaybroc8VGVbIB8obxOpM5RiaXuGejXdpPIXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkvNbT+P; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkvNbT+P"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so8267275ad.3
        for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789551632; x=1790156432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fM73VnuFZuTPcoMVOXLILsNnW/aM7z64LAY6lfOcaCE=;
        b=ZkvNbT+PIp8OV2r0K+9DhXB6MdXYrUtJyOaoriucXQOp8UpvU1k7jJVAN2W2DfcwL+
         +Ohh+dWogRbEUcMkhBHzHQBwxzIm+I1D2wIBgqu8ftdJI7Z8TS0mQOdBhmGzqxkb9TGa
         EOCOSSPAndRV1oDZiNDJGF//QLCSA7yfHWCR60RF4t+qjLG7ymHMcGfZyDiLuRtyD6S2
         wu7zUTCVPfNYguWehQGWegsEzwniCB74mN0esMmyNO3FPSch9a2IvY0lSeXJWhOcnuEE
         qlDdLsOhEGEx4rd/Cbj74Xy6OLNKeOQLkN83u7Lsni1jlSUzd46kSClBlPBtrZhMzRou
         mwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789551632; x=1790156432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fM73VnuFZuTPcoMVOXLILsNnW/aM7z64LAY6lfOcaCE=;
        b=jKxhCU1gzpp+2UlgqTaA3cLFWemWIS2yHcGzu9HlXJsEmbJ58b0no69LSLrO5Zk8sf
         hSxC55d5z9fctZMf2HsOgwQ/C9SblM+Wogy14m6/UVbEJVSxRlSAM6b8bViuIYPKZKYb
         aC3tbtrtA5FWLqFXhoHGDUadr2Gysdz7xXCCzEB8+CRAqnYaXcHhkT8nfTlP+3jkeeFo
         h4ioRfCuqmft1yYBtqGnXwbE8krWT0hrBPXQlA8l0q06VtEcD80xuLJ7phWOdtk430B5
         WCLS31znRr1WLiEFrNh5ho5yWaKi1Q2aoz8gvNsbkb18iCrUOW5hwtJRvt1iQIX17ZJz
         9WVg==
X-Forwarded-Encrypted: i=1; AKwUvBwtMAB7o3gjYBXsEHvqd6r0GZr5k6O4PGg9L4g+MQNc9dQAYgzgsCnWwUogbq2tZhycar87FylzgzZDVw==@vger.kernel.org
X-Gm-Message-State: AFuF++lJccFWvzICDAxCYravCp0xyJ+minm6ujBLTxz50uTKlPbfh3Tw
	Eui+oy7f/Qb9clWobofuymlzywi3v0j/UJ1RrowGYiVCZ0o18dJJHvVa
X-Gm-Gg: AYBFou3PEFRxtkU5uBAWxqx/zRH5j/nj2Ofc0OxQWaa36ZSCEieJoSlt1ENBcrlZHp6
	XOPy+bxD2FP0USFLVJAUyBKcEuiuXvRZxJv/WioeExApUqBcfBIWGD+ue99Z/DiBV/7fnad5J/Z
	9x9d1vyPE9+S+ZQEALI7DCQ617CGDJYVIs3eE6pTnD3o/jMcOMmX+59oG2FrL2dhKsHMHNO7nmn
	hWNVggtt/4yE7tHswX+5lwpYzcT+YLb9mvduAMhpSHsfnfZOKby2lNqEEUyWWogxHbAIwzRq4BR
	Y+op6PlaXejwNUr/BEpAfEg1ZvSdozeYwzUhs3jy31Nc9EG4Mnx8TMDEjAMDr57myW3UZO3H2YN
	swZIpHZFBMuh7S1V8V1u78YdtmTgbR3PyB8g+6OK7wNNQ/7Jwr8r9tNkPusxZ/PZ7dXdDAT5b5S
	oJlkqdpG49OH9096hYHk7Bem/JZljgNcIhrHHOAKKXLC/LmZdMTKgKldCLHPwwuJObuORmSG4tr
	votsphv249VhxQD985u1NRl+7swsaD26EGLIuVK+xf59RB4HKALaZNWU/xXUpxaO2ObFV9Qf3kT
	9jyMrDdHeuIRTrI=
X-Received: by 2002:a17:902:c40d:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2dd8e6368a5mr40284535ad.18.1789551631564;
        Wed, 16 Sep 2026 02:40:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89e92ecasm8622865ad.29.2026.09.16.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:40:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Cen Zhang <zzzccc427@gmail.com>,
	Yilin Zhang <yilinzhang@moonshot.ai>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: pcm: Propagate snd_pcm_stop() errors in snd_pcm_drop()
Date: Wed, 16 Sep 2026 16:40:14 +0700
Message-ID: <20260916094014.33609-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_drop() currently ignores the return value of
snd_pcm_stop() and returns a pre-initialized zero instead.

Store the return value of snd_pcm_stop() in 'result' so that any
error is propagated to the caller.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 000e926a1e6a..74054b9ca712 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2267,7 +2267,7 @@ static int snd_pcm_drain(struct snd_pcm_substream *substream,
 static int snd_pcm_drop(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime;
-	int result = 0;
+	int result;
 	
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
@@ -2282,7 +2282,7 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
 		snd_pcm_pause(substream, false);
 
-	snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
+	result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
 	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
 
 	return result;
-- 
2.43.0

