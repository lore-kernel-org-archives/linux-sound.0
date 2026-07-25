Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FD43ED11B
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784995444; cv=none; b=jtvTTl5qlLCUM9AO7HNdLwBN0VSCuqGR/Ieu/uQkzoV6oMKM9LY2qtrGyHkhn8pEpM2RV93ZIJ6VsV1iied8gD/saFmgCmqnthMHr+uYoPeltgqAeKPdcsICWZRC2efFUx5Bn/lh4EwkL5TPs9p5VLmEdaiAXuQj5cwERzYHLyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784995444; c=relaxed/simple;
	bh=FC9Si0uPPr1XyKEd9Z6ohJTjR0BlMG0IJd/jIR1+g8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cI+Ve94lZ44YdIsF9sx1DgZ/6QV68KJB46AnlNnexldlFVtCAz+mFmhN75Pbw3nEZ5sdKEJnRwiDZmOLYEp2Wn6l0jOIcW3N4NW1NMXlqs6RxpivFi7LxbtIczPqIZQIDTg1sDhhq7TQPfzt/g67XV4TSNQP+OkC7c8MaUZ1AMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlzijihC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlzijihC"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so1461757b3a.2
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784995439; x=1785600239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpIY+Z4VZEdhobice922ahK6cihaoEnhEKDT9ENM6EM=;
        b=IlzijihCPmhS0ogDaEaYIGzZDQnWHjidwG1ixXpzrse7qjdqTRHlFBlB+qtFayH0QT
         +Ftnerzu8E+EFp6BJQdQF1E3QPzw/Vx62gP2bisRThqBq7TT3k7YcuNIGSHACugcZjP6
         auMWFPtm1ew9XIiGyqkeflHnWeldlMkhE4yXYKl+UnwczT2VmVxRL2mAQplDM0nfrdHh
         lZqXbLFTTOy2OfM9nBqkJu772QwhLV2yV8ZHX3qe5XUWj5c1VPYn43b2uXkr/0reKrlQ
         ixjhf+PkDM1bFcEdeyAeiXTl0qXrefqNv2sNxdcxVIJDzY456x6lO1UwhbK5Ug8HsiwC
         IX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784995439; x=1785600239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TpIY+Z4VZEdhobice922ahK6cihaoEnhEKDT9ENM6EM=;
        b=no/pLIHrGrUvq4X/VoI3OnlQDgfEPHQoTMWnjcLCSjVVcpfPW7HJ5KvbURfQZ4MD32
         /qRfwxvHBBH9bpz6koQM5EQI5k/k+ki/eEo7WoZQcE6186rDCI/qUngmnlHfk2lu7Ogb
         yJHP47KCrN4NTtG0r1r3SxCnsHaBIZVcElGhDeNhEtsG3jfGAlSrfLkoKY08Nnn9Vruh
         JoNSKfDlQLKJDbfRNbxDjGOqDM/on+/8GDz+cTPwBS3cMbReXIqgVWdL9cHQjof9Re9Q
         MYlmXPDtAmxHpEjsreBsfJammfVpi/065wfI5PRa83urNYx6/A0XV4OnO0d9+wjtN6sT
         435g==
X-Forwarded-Encrypted: i=1; AHgh+RqSTvOKYHKan0gvT/0bT1D8FuNuUCOkN/gtieDYHn92+faJQEY3FWF0NIiV4rPX0qdGNUCV5t4lNMerIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVjBmOCwGDP7tPJ4khbYxFjbQ4ak6iQZT5pRoXqmowVxO91rqA
	EzHmUHcAJWQj8kxJ1eIbJGHN/WIafvKDT8p9acPrldCtYGNNjqvmekse
X-Gm-Gg: AR+sD13B4ISiwrR2XwoRzYK4T0ekrTcbEhxE6YpbcBTKehXqG0AiUxDy80MVhClerRU
	c+tImKWsA2nZC9X9nphmvW6gZ96cXPHcUqstOZz8bvTj5rLlvE1wZsdy8J0zrVNyV5R2tedYfel
	oJdtBHB1BledTdvEBSbtYIWZ7rwMPJRAPESKul3JoVaqGAi5eW6QyzF1cWuZ99goUkR8mbyzkRD
	xzKP6p0/zSPAAMiX4mm08gga5rW23fd656X5OkT6as6kjdnZ1txqqZY5DRcmc0/LlW3G7ZNLia/
	Jb97ihT4Qhk4elcs67oXeZdCVOOrbshyWza//x/fdmPFe4vQSmT9x3QMNm1OMhG/V9XEILtxA3E
	7gxBn00KqCByYXnoqhCe27LLtPvjqpbhh0m3sPQLRU+Y8TGbVfsM+y/4Y2c5gCayJa9JzsrCp
X-Received: by 2002:a05:6a00:2d0d:b0:848:6ef8:c95a with SMTP id d2e1a72fcca58-84e595dae60mr1921392b3a.76.1784995439262;
        Sat, 25 Jul 2026 09:03:59 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm1171554b3a.44.2026.07.25.09.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 09:03:58 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: [PATCH v2 1/4] ASoC: amd: acp: remove conditional return with no effect
Date: Sun, 26 Jul 2026 01:03:40 +0900
Message-ID: <20260725160344.916838-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725160344.916838-1-ekffu200098@gmail.com>
References: <20260725160344.916838-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index ef784cca13f2..01a0aaa60246 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -938,15 +938,10 @@ static int acp_max98388_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai =
 			snd_soc_card_get_codec_dai(card,
 						   MAX98388_CODEC_DAI);
-	int ret;
 
-	ret = snd_soc_dai_set_fmt(codec_dai,
-				  SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
-				  SND_SOC_DAIFMT_NB_NF);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return snd_soc_dai_set_fmt(codec_dai,
+				   SND_SOC_DAIFMT_CBC_CFC | SND_SOC_DAIFMT_I2S |
+				   SND_SOC_DAIFMT_NB_NF);
 }
 
 static const struct snd_soc_ops acp_max98388_ops = {
-- 
2.43.0

