Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964632;
	b=AlYwFvJhajQW5MBlIFAwkr30Km501CfpdaBB6Re08IwWno//al0DwR+HbQYdI/LBc7Ab
	 YqM6utx54R3GbitFVrlKkKw2I5cjsZH8vuZ1n9sXfR/eqOSoBVUSsoKF4P5SR1VpkIUda
	 5WsK6B97lxjeq+u0dT480m3PpjxEZZ/2FpkU6vvcb8pCN/3+xMWynNCRQoogpL7X2KPEq
	 EsmW6GxDJkNSXB/nMC9fJyM0gwTLKKO46xqdMfP1dtkAgPpzp2/SFWAkCjolgQ7iiXvb/
	 LOqPqztbGBljkzfRzLm72fVj5KJKDxItrmNC/60jBichkZvHxv80DJGHTd61R3vHuBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7QJ0pMD2KSaBCSqKDJ78bUqyjF/YJ29dt4+3JDNLfSo=;
	b=tKgXljXhxnKO96faf9C5Y7iBBG9wjU3g3a0Zf5bv4G2Tdu9SEMRcPBnbMEh2qwgDewGP
	 87llcbrv0UGvos3+r+x4nGAYvNrhJKz3rn/IEWkhX3oToz4qvzflyytIiTWOpM0gDnldu
	 gDjShGAxEAYvgp/0fmnPYup3W1wEXXi+pVUfKm5WzKuDQUb7F28WQ3CnJZohABb1V25Sf
	 51HBEoK6kSdLjwSDC8VDKxfH/j0SiDqmJNK13AObSVUVzoLQB5fOJu9Kj2CuGmZwgpodA
	 dKkeoEu2O3vTDkJ+U5MpkrW14UQYIstdiZ2MVzXStCtd0JyqdfoFdNm6zA76ewa5zWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxFYnAYy;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80C5606D80D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A80C5606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxFYnAYy
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so304882a91.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 03:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964631; x=1794569431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QJ0pMD2KSaBCSqKDJ78bUqyjF/YJ29dt4+3JDNLfSo=;
        b=lxFYnAYyNDcW3fSzyyCufVKkDdVXqCzjBDNr8z/M254zshsejxv33zEJ+F3HoFchfz
         4Amh3eMBOdtNyHqHpJEry2UPggAof5Rm6ixdXYjYJEj/QY/WuNx0Mk7uhLGKnoELE3Fh
         hl60RpqlQNMAesSB1bD9GCUhYREbX5zhB71MPegIvAb4fJeLYclZZZrVQqo3G4NBIghU
         I/oKtZ4CHFOUTNZj4/aATCR79O6GXE/piw2mTGeJ4d4ac8dlbicBImu//PAZ7q7O/ijI
         ROjVKiZiVX0O02NO3c+gdpaFaK1l2vPFOB1DdbUAfW55HmneCjAcSrffAZj/5YCdkga7
         pJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964631; x=1794569431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QJ0pMD2KSaBCSqKDJ78bUqyjF/YJ29dt4+3JDNLfSo=;
        b=PTorfpCjAPd7eZUwhGYQ/tMfWzyp6rfw7YtJgn1oZydskOwqQ31yNwFcZG+NKt3IOy
         Gm4/h/qg3n/IZdJFldC8XsFtbM2D9J+j4M90mmWgR3D5Ycjchp9k0FASgnCFc7jHA6w2
         vBj7SwP4MkhAtBQ27cxgWjh/FOSb8o2QKXBHScsMDKuL82qqpxEI2/XcMPb2gJye6yaf
         HJ6y1uQpEcXUNphE+48+UwBmLtOZX4yjN7b3bNNAwoG1zylwWwbDvmdSQ6w0yNx/Njqw
         lVyqooBI/jMqiwlGuJjxwrb4oK/FByN4P02AbvwBWhFjluc1h4xkmvVpeJNn115ctj+Y
         NpsA==
X-Forwarded-Encrypted: i=1; AL+hErF5jQtReAe/AgdAIGcNPJ/rQ4Sx35qkAjBA9nWOxCRwM/zRAw8aWzZuWP3Pam4bjG5lhHWwlmCJVk0hRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SIq0qBchzndivToGOEqSYbA7tmXLWiskEG/tYK5GK7dE6Zbor
	BUr2j69HiaN2HbaxRMV69aELgg+ZnahO/nzgEBUD+TE3acThyDcqtKcl
X-Gm-Gg: AYBFou16JCxmbvw7ENMDgviDSm06Ogiz0GCiuOqNNPshic5UnJYPXc5s6LBmWRUozLt
	cxSBgop6T5QnmEjhhdtWyimOdMVvIvMHxybCHYEVRYKQpb5+AM/MyyVX2z3mAQW1683c3PJJ9vl
	2kZhZAepSHYzYDWDqigAS+Pb/NoLbvQvVC9I7bJYsjPK3R8J/ZL+os2EarvFAfkWmHvFtCrYMOy
	twtKWLjz8kxltfqJc9HEYrCqvm0blP6vH6+BQoNWgeaG3X/eGtGa+1jAQHMvfbUsQnq0v5AP2TC
	ZvT5qXlFG/8aK1L1Cvb/do7p5yYCBA9wwqYKXb+5TvqeI8rsqccHU8QXzLSh0oWUl2r6rzxxKb8
	+Eq5j/u/WOCdN4S11+4XoEy9qMDEiFoFqtcb+NGv7Ft30amFbgTco8XKauy4I/EpSs/C/Rg3GNJ
	mYQo8lMySZoOdG8lNg/y2cIlN6P7p0EAFzNIeQZsCTcWQGUpz+BJKFj3E83gi5IcWg//qUnkaXY
	1Cl08/aFcKNKpUB87isWn1jzEDxOA8OKmuT45ug3SRe/jHowz++8rigFWbSvg7JJlfVBF7WTcqM
	kCPloZfx2qlUbRskgavOO8m00mGFlx899BSGFBGF2+KNR76U/PElWntPuQZbS6oPEmx6BEu7yBO
	lKHGpIKDqkm6KLyHiFdHOHz2PL1orgdpWy9l3I19W0App
X-Received: by 2002:a17:90b:1a82:b0:3aa:f875:3385 with SMTP id 98e67ed59e1d1-3b0db6ebd46mr2073524a91.26.1793964630960;
        Fri, 06 Nov 2026 03:30:30 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:30 -0800 (PST)
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
Subject: [PATCH 3/5] ASoC: dwc: Fix channels_max derived from COMP_PARAM_1
Date: Fri,  6 Nov 2026 18:29:38 +0700
Message-ID: <20261106112940.53550-4-phucduc.bui@gmail.com>
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

The I2S_TX_CHANNELS (bits 10:9) and I2S_RX_CHANNELS (bits 8:7) fields
of I2S_COMP_PARAM_1 encode the number of hardware channels minus one,
i.e. values 0..3 mean 1..4 channels. In I2S mode each hardware channel
is one serial data line carrying a left/right pair, so the maximum
number of audio channels is 2 * (N + 1).

The current code uses 1 << (N + 1), which only produces the correct
result for N < 2. For N >= 2, it overestimates the maximum number of
audio channels.

Use 2 * (N + 1) for both playback and capture.

Fixes: b226efe5818b ("ASoC: dwc: Read I2S block configuration from registers")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 6dc84c55db0f..0de7bcb2d0c5 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -605,7 +605,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->playback.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->playback.channels_max =
-				1 << (COMP1_TX_CHANNELS(comp1) + 1);
+				2 * (COMP1_TX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->playback.formats = formats[idx];
 		dw_i2s_dai->playback.rates = rates;
 	}
@@ -619,7 +619,7 @@ static int dw_configure_dai(struct dw_i2s_dev *dev,
 			idx = 1;
 		dw_i2s_dai->capture.channels_min = MIN_CHANNEL_NUM;
 		dw_i2s_dai->capture.channels_max =
-				1 << (COMP1_RX_CHANNELS(comp1) + 1);
+				2 * (COMP1_RX_CHANNELS(comp1) + 1);
 		dw_i2s_dai->capture.formats = formats[idx];
 		dw_i2s_dai->capture.rates = rates;
 	}
-- 
2.43.0

