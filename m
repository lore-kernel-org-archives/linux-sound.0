Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964627;
	b=nA77KO8rKh3V1ABECISUwkpEIgb2eZ/1zyHqwtd/qxq2Veu0+5BN5E5fVmoRY/ghk2ME
	 JSOeJC/26LYkjwElaQNpMsfC7gdf9/VSbjCoD3kPJBPoYjX4PasY9yCRMC/hDHxTX9FGT
	 Jmd7HWrdT8SkLebvuTj5w1zLTdCEi/KQhdoOk80bZmLUMi3dCkmHoBYYwUTP1b+9/Zfl0
	 lLXbzp6EpiEKor3RQkki8NcnuuLIRDkqP5D0TxODTxGCMlv6wz9LLyuCVYyetJ7XaG+On
	 IRMdOuUREwSpJqVVDMQRLx1cZA5owt4ehNb1YUs3ipKoP7mfCI987qRZIGBqpOcdpjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QJV/UUfKOJWZ3kfekY4y8FQrXVFTAnfNUP2ocF8McY4=;
	b=0+rx6+LQzi8I8qhaIcAFu1h+VUtaQFEsqpPyBgN4KTCjV843L0Fc1Uk9/RkONlPLlIaa
	 3XRWpz1pdeMDxOdDXOacoEiQXJBfLmvz77RtlBB6bsxw0hlsRa62pI9DyVM4HOulsinuA
	 3mPz15Oibvx7VwRbzN7meM6NIS+NaWYN2ZFV78fgvbI3pnea4poYaBThXaxzgfaG8PjDH
	 MW/x7cpRNdL2vWNH1lYE2Zc1ua3hJRAQu8rUyYm7FRxLqmxmPEZMzbpfCUERINrXVC1yC
	 ycOEVFLlJKFJvRbMpEUXcSOdXRSp7+7fx63aTHm6ECyksz9ap1mV5T0K9pmOqSoLDCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCCiasZ8;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696BA606A33C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 696BA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCCiasZ8
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so419118a91.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964627; x=1794569427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJV/UUfKOJWZ3kfekY4y8FQrXVFTAnfNUP2ocF8McY4=;
        b=XCCiasZ8V5IN48xWbXsGsvzmZJMqJ6u+ZnTtkUiJ0BdC7B38ji/vczBreoPeOg8LMZ
         cHNyOUzRBSwwRgFKuitMUb+nWbSC+xjO3FCHqYtMAfMB4VJMpGR+uHyvOqkSMuHWB4Nz
         /zRw8FVXk6kR0OG3JKGHzEFPQek+igQsCZ7SfxNP/VZEKbTPyqtxILXekbrbWkEmFlRo
         6CqbxPHihh2tpwLshy39wRfRs5ua+qjmiczpeSbi4IhhceBpMLFv+qacU+04A46QqxFU
         au0QPG9N+Z8BwM888L/QJ7gLC9DIENvfOrpbhoEmnfMf385knZTDcIWQBslXNCaZ6ThF
         N37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964627; x=1794569427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJV/UUfKOJWZ3kfekY4y8FQrXVFTAnfNUP2ocF8McY4=;
        b=VPzmZtOK58kScptc8QrBZNo3n8p2b44FguiDdaaDatsCkZX5mu9/68rjkGpoFuV+7u
         kov9uz+f5KzzErgyXNH2u1P7nZ/Ip3PK2Zjw9Ze02c8ToIK8FcKLpQRtyQPK3Km8ZkZW
         9Ve3/Uz4+scBqZPxr5KTFyfsWAkR3yV1mRFsHEzcJd2cW62U9dIQ/PL1eL/CWHfIHKsp
         SIeLJpFLUmcaaOe3fOfUSNHRR0Xi/7BpWNhK9EScAKBIEl+RWEETRMY8YbS96h4H6ek5
         7Z/U54UtmYZxENgvormD1Fa2jf5zeQtuV7IauFanrAkS8SdUXIzLxz4GwKaU3GMXIPV9
         uU5Q==
X-Forwarded-Encrypted: i=1; AL+hErGVB3nVWqJsscAHa5w12w7NQbUPoov7TMB1JNdPvlQ/J26ecSkpzNDTNm1wOgkmRT/eD2garg39nTsQjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i+kawixDM/lwAIiQPSex/RpxsoQKLIs74NTO8AaKbjAUkcCW5
	eiZ0jNlF5YbJ38fe2kPK0h8Xtyza/ZxC87Lh3ws8DExeIAfmE+tadt+S
X-Gm-Gg: AYBFou2flVKBa6LXiNwFbjU4+sJ65oVHd9JSG980CydcMlIdYCqXsvaCUtNPltXzety
	TWbzKI5untG69hiTbQEk/mJrPgMPZYvw8Ndna2ORJxevZvyQhq2PUxg35R2DA2RyHtvl91bnqtX
	/k4aRpk1mUVhygQP4Z0SZGvcUAvR2fs4sKIj3bSJlKu+ZWZzTRJB7gbHBWamJs138Ze2OXaGHj5
	QKJwaXokw5kn/TJFv0JgZl9E99b3sux9ygh2XNil6VPYUAc4Ci0JzXQ3nTaZbFPeOY5W+x/XeOD
	oajRpTsnDNKdmQIwYjjiU88L5U+o6OfyVUB1GkZ7f7S8BjdZs5BOx9/4Qj5f7EyHfv1Mb4i8ebH
	R6ZfJMXaCbnVmbmHQ5r1J+sTiqeX1T/vhjrFS9m4fLFSRP64Bg/HjQBLFY5a8tYL8oPutok/0Or
	rloZIFrBh64vgMnjOPJ7YiUeiLQcv/yYVXEK3pU+A+QoEmWTFADEEh5HWiuOm71ArTEdOVkqkVq
	p8DzqrFrLB31p13CNOz6vM6pAoNoTxboJpQsTNayFFxzRECFd9TxHWnDVAgqPy8cZceYZfvWZNq
	aswiADBWPAjK5+DktlX+MbIAO4Uo/nRlpEPC5dMJsDSdxTsIdUHaH8pq72fJGQWPj0KGTJcn9Cn
	Wpt1Fd8/x56zPdcrBfMQKWhXJAGPE1cRqRqaBw+cS0XBm
X-Received: by 2002:a17:90a:c2c7:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3b0db6f8012mr2028668a91.52.1793964626622;
        Fri, 06 Nov 2026 03:30:26 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:26 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
Date: Fri,  6 Nov 2026 18:29:37 +0700
Message-ID: <20261106112940.53550-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106112940.53550-1-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
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

Return early when an unsupported clock provider format is
encountered, preventing the function from updating frame_offset
before returning an error.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 9007ba1157ac..6dc84c55db0f 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -390,29 +390,19 @@ static int dw_i2s_trigger(struct snd_pcm_substream *substream,
 static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
-	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BC_FC:
-		if (dev->capability & DW_I2S_SLAVE)
-			ret = 0;
-		else
-			ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_SLAVE))
+			return -EINVAL;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
-		if (dev->capability & DW_I2S_MASTER)
-			ret = 0;
-		else
-			ret = -EINVAL;
-		break;
-	case SND_SOC_DAIFMT_BC_FP:
-	case SND_SOC_DAIFMT_BP_FC:
-		ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_MASTER))
+			return -EINVAL;
 		break;
 	default:
 		dev_dbg(dev->dev, "dwc : Invalid clock provider format\n");
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -427,11 +417,11 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		dev->frame_offset = 0;
 		break;
 	default:
-		dev_err(dev->dev, "DAI format unsupported");
+		dev_err(dev->dev, "DAI format unsupported\n");
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask,
-- 
2.43.0

