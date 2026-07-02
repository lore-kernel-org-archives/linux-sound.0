Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F0734B1B4
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 03:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964642; cv=none; b=AzGI+GQqHxbgd9I3XVEj9ypR1PVkoR07iaP6paAtNBd20Ax5K/l8xVesQZ1dnV73TwqtQyXaYa0d3q84IOLAoDkjLDuzIiSxBMOZ+K9fBDFLD6YqJcn/CFDExZf4U+VhfHYTWjiafZO6Ikq/Q6OxLjSHz2cM820g7fomciR++ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964642; c=relaxed/simple;
	bh=Dea0npz6HPZLl0DOuyuNssrfQBzDEQWoBZO0gFRkntA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQFBYJBskMYjf6FHEbBm+tP66RjuinxwqU8DChDRmBYDCjnHrVr/TmsEmz685n2NPq0gieTMxKXP4aMBQR1g2L5tTAORyH16bvHYCWIevVIxDVUxWQi/vn9ObqwVjI5rhZm7K7RWZ6oPSfoTYyRmGkQihf71oSTzlvyXSxr4ClY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8F9KJpx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8F9KJpx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845eb7b96feso897763b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 20:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782964639; x=1783569439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ShZJ2sm5lR2QN8PCgV20vECR5rK36eWk9DejWlPzgM=;
        b=p8F9KJpxy5caDa4D72S5giB5/8xz7N4b93I9JU80rzUg35V5gyGjXcG6adO9+TgM7u
         0lZTPCpiXmqCKMkR6cjKQMfHSMcL48sWs1jd1LhRxh9rRJrDgPaYab0uzWjFEWSEGTBX
         qLbskxxN7B31t+CdWynQd5as0tArRf/5HpAlSYx52H2McbR5BhhSIFJqnWxVM42OMB02
         AY/X+oIy/kZbIluuONJwoy1Wm/GRmqARbRdB7NZCqULkKSa0iZPHz2W6mhzLz8eeWJqc
         /vZWrXK7rPk/QLrdDdeL43IBCjjUTrBVmgNcCRgnsKpoZwPHFpkW7flapWJ9Eu7dosAs
         JCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782964639; x=1783569439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ShZJ2sm5lR2QN8PCgV20vECR5rK36eWk9DejWlPzgM=;
        b=e4rzvKm26XpzLmqAb7DPlkn1w8Sl76/6ycCOXR5hH2ZWrxZBPM2lPIXzm8R8BfnAta
         pR5DhMHQMlok9+cn/iNZExAZnYmY6n0da9KSav7z0xt/t7GHY6ZHYKmzxzki7So9fmjO
         hTSColhGs1JT/myOuYuQd16qaeWhuLvlwo2NvOi3EVT/W6g2rsmyI/xZxoeFHou2dnT9
         gozAoe7Igde3j3GaOvmkKpsVTqc8Mq/T2xXoOLB9KbFzFfDmFdy7ZYahFjsOQMwjBLVF
         nRlDUlbA92o5uSooS9Vuft4JR7xdmGDAo10S771iWLeBP5h/EtH5wD/20ycjr29qkmqq
         GRiA==
X-Forwarded-Encrypted: i=1; AFNElJ/jpnRgySGF1k7Gi8jF0Xa3NsldGzR87qv4fz7pg/lKD+nVuWtvf9Lkm3Bt90gpYxXO8ApAICpMN9GOYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYH1n49xyGWXVxp7e6i50hZhPdQ6bFNcwfP+ZWCVesISy4myQl
	dmhsgONNYtde3Sb/NwghrU4cII15r4tPTY5slsmBEVBNizQj46KK8Q5C
X-Gm-Gg: AfdE7ckvpb08lt9l1x/7II/mOrOycnSuh9mC8n8cE1HUsUtU73VuaLExpGqm/KMOqsi
	wU/PWpgNYAUJ+GtVQmLVLgT03gojF5ivTQYXCnDRRdHfn4Y6e3SsTdUgtv6iinKYQF7HXjU6OOp
	G8r4hFJYL/IXOeTpFJKAGm5V1hApEMbh7iJEhVvYAro6HBUmGeOJ0ztg+kpmhDOBVFZNenImxVB
	Dvc/JfnhOsVtL8EHjuX7OsTeYSzr2nGeRSvWheXzmA1XQP1DrTwnywL8Fa3bVwzD7VG2Ao80X+v
	YFqkXWjAyrGWsa+knOLcPjrWI9Ql6efC3WeVCUXARIeBf4NXqRPKa3LJ88f7NKyrhXJWJcAiyr4
	uRRlsUqoKsO+g4gIxRDIXem+sqtVVdfFpz5lNNDCwVzX89cDtqyjFzDmswpiNqAtpYl6Sg5BNj+
	VcXzfjeZRIgsSPFDJP32mKcCVc1KjA7lmbYVHncjTHzMiWnEk=
X-Received: by 2002:a05:6a21:4d92:b0:3b2:8685:118b with SMTP id adf61e73a8af0-3bfed16993cmr4852957637.20.1782964639077;
        Wed, 01 Jul 2026 20:57:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0ef50sm678879a12.6.2026.07.01.20.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 20:57:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cen Zhang <zzzccc427@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Mehul Rao <mehulrao@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	eilaimemedsnaimel@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: pcm: Drop reduntant nonseekable_open() return check
Date: Thu,  2 Jul 2026 10:57:04 +0700
Message-ID: <20260702035704.27092-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

nonseekable_open() always returns 0, so the error check is unnecessary.
Remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/pcm_native.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 7dc0060617f1..b245b596d95a 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2874,8 +2874,7 @@ static int snd_pcm_playback_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
 	int err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
+
 	pcm = snd_lookup_minor_data(iminor(inode),
 				    SNDRV_DEVICE_TYPE_PCM_PLAYBACK);
 	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_PLAYBACK);
@@ -2888,8 +2887,7 @@ static int snd_pcm_capture_open(struct inode *inode, struct file *file)
 {
 	struct snd_pcm *pcm;
 	int err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
+
 	pcm = snd_lookup_minor_data(iminor(inode),
 				    SNDRV_DEVICE_TYPE_PCM_CAPTURE);
 	err = snd_pcm_open(file, pcm, SNDRV_PCM_STREAM_CAPTURE);
-- 
2.43.0

