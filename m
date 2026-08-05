Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8F3DE447
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 06:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785912249; cv=none; b=O9lLl68+AM3mDpoU59S4l3lmbNCGqbya/GZZnr2AuYzd7rsDVQcDUDBr6PGqgCqudIgvlputBkVAeFzFIErTavrT0ESQUP1rQge+IxHrlWaLxUsZAqRPrFwuV3+ogwq6D2qho+LkqcxYhwjsMNZW+t9UeGH1EDTYO2kzn7AX6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785912249; c=relaxed/simple;
	bh=ONk4+ySJ6/04rtJi3tnz+Bcm2WtGNmnRsdHa+ACx5DI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIryKe2Q4K0MVLeFCePuDknsYbp77hAgIPj4FHv3ODLLR9uzfmFVkLZiUmyY5SM7JHkxgHn9p4Bla3J09psTpV0zdwT070pnP2R2N35uIVToLgAqw9cqMDdKsN+jO/emBM1BW6llDwTzQyCvpb0AY2d0p3bIZYYHy0x6fznwajY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEgdldOh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEgdldOh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caced6038eso8441855ad.0
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785912247; x=1786517047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFfF9vOjPIRrYjKrW5dKD1o7wgpldgxBl11pAMSS8hY=;
        b=GEgdldOhYKqcrx0dYUvS/UBHI7MAQn8Sw/KQfUB9nhRezwg4XsyfyGWtlhrcP+e9z8
         /iteFJ79WQ3bEr2M6TLuIwICmieZvIERba9YeE4vI3JsIVoYWsTZu8UfIeEkbXhmkMe/
         1wqXOTBSVYhyjxwjVQt47nbwEhhXNn0gMddfQHn1P+dbf4w904XLjTgFXx/7cyjCv5t6
         PxUwGAixwTjpKh0n986yBDU2LGg2k/RfqY3pqEKSMmhVkYDlam9yU0rK+Ux/H5yU1Oap
         ZkdfykuAxu7Ws6MYOkrTyfq57AtV7oEz84rKbRVHPtk/b/GlJIMtJlRBzCBTY+iclJg0
         mfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785912247; x=1786517047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFfF9vOjPIRrYjKrW5dKD1o7wgpldgxBl11pAMSS8hY=;
        b=aGcYw2S030USHf2YHI80uxxlKcanuem+F4keg7k+j8aa8uaWQQkbYcE0ZKrYZ+MfKG
         W+2KbnFl9qU5d3fYlIlOVxUtZi3QE9ntMd6mXzn7USZhdhYHTTpiKZBDhdl23/7HY95g
         lzMWpenZMgkheciOL6Q9Xm48pqwIHVv/mg3QfIwnorQBYUBA74U0EgOgzcbDHNuo1cxV
         tXjnx8f8JMWXAmcHbG/9i4t4dZWLuTf+ne7QHAq+UA1FDnMYgelNL/SbLmSyJwA+2eZi
         hkuZH8DIf3eEzi47p7f5MnN86FeNCta34uA+Zy54YNg4gqdUfe+oHTJZmdFWg7j4VERE
         4aRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKzmxDuCl4hONRhRy5D6Nde8vy5E3UxZWFJWnIZnBJWjI8NsZT87iooEmPaxv89J8yja9XTnjXYBx3wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiD4H8PBbdpcG25KAQBqrZegBI8MDe8tLicQtemMAli9/EmrqC
	4Ge6qe8Zii9pTBcBfgn2J7hpSAPuSsL5uKb0D0n/7K6DMkC2ij4njY8j
X-Gm-Gg: AR+sD13ZgKV4eGf3MONceTPKPA2NYsuhQIolH4lIsMuUVf1uVWbyF0NEEjJg4Rn/EiB
	r/eul/Q/wm96hnY+64GAqv+/UKMrc0BGyoTi6CWvQwnuZhKMsFhI1NJBwSbUaaHqfGYBIHd/1op
	bSBVaSU9szdjDzjqmRlM/sB9jm/BILG5e1Syw3J9dFXukEDtlmK346oWY249pOP2oXffusnycvb
	UtmZ4tc9PTsLL5pyjY95gbcp/uAJvo/+tdT+FEZHrM8w71lk8Dhh931PDBbkuesoGVfRX5UFkQi
	r1wxI7O7+u3GFQnVNF7AmBvKqj/v0NIC7h9n5sy4x8yXRQF5Yq9cS66KvKK5eatMTG7bRBtQ0kT
	cb+L9qcCmt+sdTylinuZ+XG+1HYBqcNpMiXBChDjuyyb1J79CstOSCL/oO1Y9c1U1hoSC++VLYf
	/Oh/XzS7T2+iyXxSrlhQkyAksfBtosUPuj0CjTqmfXgmG30ojYo73DKn3kNkUPSpS9w57ZOsC7B
	kDIqIKCToKGqQ5lbK35kUqSBm+O9+SaMAt/vP2VjtXDzBmo5nrSM0Ks9wrOVTAba0hpNQY9lOoO
	lRpDiQ==
X-Received: by 2002:a17:902:e551:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2d08aa1c85bmr95025355ad.1.1785912247199;
        Tue, 04 Aug 2026 23:44:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa491747sm14094435ad.39.2026.08.04.23.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 23:44:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Yixun Lan <dlan@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Goko Mell <goku.sonxin626@gmail.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2] ASoC: spacemit: advertise only DMA-backed DAI streams
Date: Wed,  5 Aug 2026 13:43:48 +0700
Message-ID: <20260805064348.44283-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The static DAI template initializes both playback and capture stream
capabilities before dma-names is examined. As a result,
snd_soc_dai_stream_valid() considers both directions valid even when the
device only provides a single DMA channel.

Move the playback and capture capability initialization into
spacemit_i2s_init_dai(), where it is performed only for the stream
directions backed by a corresponding DMA channel. This preserves the
existing capabilities for devices with both "tx" and "rx" DMA channels,
while preventing unsupported stream directions from being advertised.

Initialize rate_min and rate_max together with the other stream
capabilities to preserve the existing rate constraints.

Fixes: fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the commit message to describe the functional fix as 
   suggested by Troy.

Link v1 : 
  https://lore.kernel.org/all/20260804043036.22065-1-phucduc.bui@gmail.com/

 sound/soc/spacemit/k1_i2s.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
index 2d5ea1fd5d49..28a762769253 100644
--- a/sound/soc/spacemit/k1_i2s.c
+++ b/sound/soc/spacemit/k1_i2s.c
@@ -354,22 +354,6 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver spacemit_i2s_dai = {
 	.ops = &spacemit_i2s_dai_ops,
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SPACEMIT_PCM_RATES,
-		.rate_min = SNDRV_PCM_RATE_8000,
-		.rate_max = SNDRV_PCM_RATE_48000,
-		.formats = SPACEMIT_PCM_FORMATS,
-	},
 	.symmetric_rate = 1,
 };
 
@@ -399,6 +383,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->playback.channels_min = 1;
 		dai->playback.channels_max = 2;
 		dai->playback.rates = SPACEMIT_PCM_RATES;
+		dai->playback.rate_min = SNDRV_PCM_RATE_8000;
+		dai->playback.rate_max = SNDRV_PCM_RATE_48000;
 		dai->playback.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -411,6 +397,8 @@ static int spacemit_i2s_init_dai(struct spacemit_i2s_dev *i2s,
 		dai->capture.channels_min = 1;
 		dai->capture.channels_max = 2;
 		dai->capture.rates = SPACEMIT_PCM_RATES;
+		dai->capture.rate_min = SNDRV_PCM_RATE_8000;
+		dai->capture.rate_max = SNDRV_PCM_RATE_48000;
 		dai->capture.formats = SPACEMIT_PCM_FORMATS;
 
 		i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
-- 
2.43.0

