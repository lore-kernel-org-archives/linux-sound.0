Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391608;
	b=tbIgFyFdLWLXXNzdwFEcLaAHmLReJ2veBzvMa2xgCZnNvMSeubooNuOX1jwr2nlop1SG
	 s41qVV5c1WESBNptSMmgZ9eIqf965yrqYdvoZj3Fz8RO+8nPYTi0lUVnFM3/ir4GsQCzG
	 pqh9lxHYnMqigKGQFm/OdRkyJbs9gVkRMQwMimRNYXLJo5KoFGl7vYFLV8V+EBsWJjvPs
	 CIFgPgMwtuwwVy2mtOscyqX3Al7bxMQAj+CH1acqx2WUhNpLk+0WT/T2tbjrCHSqamcm0
	 sFLzlFJeAJbFXxTHPmnjsralOiOYxhdocv9qkbfagAPiIYd04U6hsIb1tuUGLITYl6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
	b=o9z5ykudKNj2jQkgY1ePNJ1R+WUdj48Gs+w7k5RTTQBmGNIDO0y7BZZFzGvmh1p0ZBEj
	 BXLNAcUTaNAXfFMVThAV9Od+Lsz5QjEUQ6a/BTY0EyWo5G+eEnq6DtQLtuECfCe0pij6Y
	 kqDXr5lNk7oGFzxu1kFYVTXrTXZs5XBlLXV6Skz57hw28prKrAWn1HmYmqZZgozFxCWzQ
	 7rrdud4bA38ii9PsTAAZeMqgSrw48wplqMn3gOoSmSoYbfosQq/3AAAsUaAbkq6Br9vYn
	 SkG5ZRBjvt/U6cSaEVO1nYGVsNyuZA4C/cRr0MkVYJACZwez7V15tGtqRU50EYvL5dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYvMDd0G;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D404606A33B
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D404606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYvMDd0G
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37628596783so1983958eec.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794391607; x=1794996407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
        b=uYvMDd0GBsLTJHSnn2sYsMI5EGdcAiHlXmubqKa5UygquPqeJK6AoV3mZBCHyHIOg2
         soJaqSZuvFHSTdApDLhyJyQD4GERLNl/rqZOiRr3Y521GEPTIiM2fA1iVIDVAOBio4Sc
         N6gqfVHMBlfJKPIIcPLeFQxwqqFi9UXrKBQZFDbJVAV39T5LVJcdrELXOhmK+9HJBglr
         6i4U0V64dzCYJEFSdmOvD4bORXbGz2+922lGKvoDIdNqjUOX33sF0w8fENU4Cs+p+YBL
         RxVlW6LV97+n9wY2P1e9GhrGmMi52NrI9LRR1WdeZ+lDK3YinwpQccrNW3g5MOkMZRw0
         q0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391607; x=1794996407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3fdl99wflmpgOQFz3rP4SGWHHNVvKJz4CW8AnVydfWM=;
        b=IlCVH6Jk3XOyMLEkclorL86iBPDHGPnIXtBIpTDyAutemTMFCEiHZI2KAj2mJYPdLh
         AOe51VHrNx+P4tAAq3rLlmwJRNC5hFhs4VO0VnvtsS43EDWc0+RaxN5embaAMoka5L8u
         hA9f5BM+onwX2q5Ic3mQr9hGaMW0ZrlYkugSde7AGK9FEstSd2HPlk759lGmUHMCzZ1u
         4ebnIv1M8RtyL9yriJ3taL52Aq6nI6VClh3K9vuNTPrX+HZgaMbAQEmJa3Ln2nuKLtOX
         w5mfbaM7GfcQVd8IyNJXn1yqB6VuYYm8mEaBlfN6jWs089B24C9PqvtujS96Ok8237Xf
         /Euw==
X-Forwarded-Encrypted: i=1; AL+hErE8lSf4q97AL2DfqYvS3IMq6FtZ+PGWQy4opuziC1QwNW9zBZ9A++R2jAOW1WdQh1RtAtlOcWSn+UNvTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O8M0p5T/9tvse/zygX4+MboN23TUaRwVSNdmutlDijceb4CAH
	Zx6gyGWNe0nAfKgNitphleq3tidLlumA3hVBDMbejv+7nEcCd/PzHTHg
X-Gm-Gg: AYBFou3cKjkOUlJyMzunNZC9JW8Bz03i/I+W51SXeaBxkSpgepTbDQcUUiCo7iVTb7E
	KX8uj20gQ3Ft3OmXpPTj/VPCdXBC60gPbaFUhaIpocMQD22e8uBr/vgZ3kNt/rveu8+MdvrhBYO
	Zih2taTYNTcDBdwvO9dfqnSQAQa05Oy0UzJjQK2sZRhjs/8wIep/8Pd1zi/lOB86mcY0wKrLprE
	ucxFzG6LCS8gypr0N1pGGcDOUd152VRFkDvJJfI4Asd0mSVrMfvQvyenVDgZr5kJU0XIQWZ2Z8T
	j5N6Y0dKCLZjUqDgspC8We8iCUPLeGKK8IR3LPVX3AKQo/U3reRv+w6B9na3IHH3LqypWFR5ExB
	a/h2NaIqHbNUeFpg3si7a7IDDD9dwa53SUH9vk7PPXmIiqIYQ5xzaclNIjDb0teMVOh1mjEvdCz
	byX5UrJM7Cdfl4sl6036vpqJ94pjc102fV3xPJAjQsuq3G4471OOE96TLgrmvCVBrW/tERtxuWw
	S3Lz38u8W4kgHRCHfGVOXHXY9yhLLzDYXLr/CYvp8lllKvkTR4Eqogp7imQ+11GTZPZsq5qyjd3
	fFe66pP764DmOtBkvi4bimXIQCe+OA/Y/TSiFwdjTqpvyosGWjmIdDyUbHIqo6fD7quMYF/eDeJ
	2ioWSufC/C1DGGM+AXoylyDUCpSJCzw0sulBXUKqkgV1i
X-Received: by 2002:a05:701b:4301:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b3c0362b3cmr1960965c88.39.1794391607537;
        Wed, 11 Nov 2026 02:06:47 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm15778025c88.3.2026.11.11.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:06:47 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] ASoC: atmel-i2s: Fix I2SC_WS slot width configuration
Date: Wed, 11 Nov 2026 17:06:16 +0700
Message-ID: <20261111100616.31211-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100616.31211-1-phucduc.bui@gmail.com>
References: <20261111100616.31211-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The atmel_i2s_hw_params() function configures the PCM formats
S18_3LE, S20_3LE and S24_3LE, which require a 24-bit I2SC_WS
slot width.

However, ATMEL_I2SC_MR_IWS is missing from the mask passed to
regmap_update_bits() when updating ATMEL_I2SC_MR. As a result,
the IWS bit is never updated, potentially leaving the slot width
at 32 bits.

Add ATMEL_I2SC_MR_IWS to the mask to ensure the slot width is
configured correctly.

Fixes: 3b7961a326f8 ("ASoC: atmel-i2s: Fix usage of capture and playback at the same time")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/atmel-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 60e885980f4c..d23ac43590d8 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -329,7 +329,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	mr_mask = ATMEL_I2SC_MR_FORMAT_MASK | ATMEL_I2SC_MR_MODE_MASK |
-		ATMEL_I2SC_MR_DATALENGTH_MASK;
+		  ATMEL_I2SC_MR_DATALENGTH_MASK | ATMEL_I2SC_MR_IWS;
 	if (is_playback)
 		mr_mask |= ATMEL_I2SC_MR_TXMONO;
 	else
-- 
2.43.0

