Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5AE3932FF
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198389; cv=none; b=Yt+iFt9gT1C4hTDcFc1PbYc2ggfGL3TdymBJM3vkV1dkbYnUhsgfZs5wDQLpGprfORDEwklxIXwCgQ7Ns1UDjeMoDJzTeI+JgUKXe2eX+osdJDVsdhM3WHjEr43iWfkD+XcfyciB2nKsiWPkk57UjgwEHRvDD2JgI48IxXJY0Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198389; c=relaxed/simple;
	bh=CoOWwx3COYYV6QKb4PIOurNZuXUVvz9Dj5UwRk88Cfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSVmi+fPnY0jtRMhm+y8oqS3jRdPIADgnxS5ZQGsHK6WZv7v14sy8UFsrEypuLNTkkeKAR4SOxcdskz/4Zz39KeoRpYQJjtOg4bc7vHAusdu6zchgNqpCPSdLMYZ76xS1p7unFzS/dRYxAqIheb6H0U7zOtZKgVQX8s3CjcngsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jdqDD6Ww; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jdqDD6Ww"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so6190079b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198386; x=1784803186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RPHamdnITVkuNj/ZkeTHvpdSQod9yZXbGMbztdv1oI=;
        b=jdqDD6WwqHh085l4TM67AqBHSiQqvps8LR0ymxrZ6l4IJlrJl4q/BUEoH0c33GplAC
         M0RMnjrpaJMP3iENjGGELu+NQEl5b2x9Khk65HHm+2zLWBk+a6xcARB/DER8Iy0zdxZP
         aqfXDgWzxlMjUHouGw5RE/3/B9Sm3qgfpenLZn8BAifxzxIKQ37erWGLZhaIdYvsT9gT
         iM2sum+8COuXcMSHBaBOxdJzJjhHs1GM7mBrpTnzvs8a74kWD5jHzmvqExtP29rNOUjx
         fBXF5aoscoLBgiK7pgQcVpV1n5uzLjvjLokzbmpLF7KFU0OPnUEI0wIKpQRq1ql8t1gz
         o2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198386; x=1784803186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8RPHamdnITVkuNj/ZkeTHvpdSQod9yZXbGMbztdv1oI=;
        b=D134l2JwPIZN1Ps6srBmrrA/gwzzSD6ptIZloZrVlDQNGBgPezARe7GbMLioGNv0ze
         9tuZ0c/Ni0nbVLBpJc4T1op4G0DNFXy7lb96MIUI8oJpoFR8fjCryJh1Gk5O2mxlpciw
         lCfvzJGJg0Bz4WXbYfVyr00W8pNkPA/eLq8J3ZknmUeO9x8CwnllBSaa2NwgtVyZHW7y
         vPiNSH+vyZHm3yxAHtDpH3rHspmPWNVWi4Rdmo2s0E1c+eL2A3v+oins6oHyKUi1agNx
         XDScX3TYJbOaX1T6M+/bXDsPLfH/O9MSuR40YBsoE+Wr7SwR7hOnp7SaRcx9BTjG8STG
         Sfug==
X-Forwarded-Encrypted: i=1; AHgh+RrnibWJLPiuTvMn8woBFfpqcSYOazyLM1bOHu7jKKJr69lk0fvZ/YWzB3MbIFOqWsV0fURP6XYc0qF+gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaWpZBx3IWOKW9HVX1zXSuA1/KNCbNEgCFvX/oDQh4NRDdCemS
	jlDCJjA9D+AVzRcf6l5frFCB0pLG3Nqrx3IOg+EbKb//KfkVBH6IkkS9
X-Gm-Gg: AfdE7cnktMqBEYM7tkVQS4RnA0V+5nRpogE7KVe53Tv5k09YTiR+fxuCl8/fud462SV
	xxj7R00mD+AS2coAO6iqAlMJItxtaY2yLRErsRw5PR1kkZB1KSahJ2ZnCKLFMGFgqFqyyyIyHkY
	OFbBtCoiYs2xhW9eYX3A84AyaFxVoAaGOlSGmXGoNdoPKUjiabSNE9SPHa0Zlt61Ew6AlXE6l4h
	3n+ZPBSOgKZMI2e00lKLPIq/3l23Vzr532EvCgXvfUMDejC8SZI8e/kmqtTSUZ6LHKjXKHWSFJE
	y8+pwOc82Q5bd4A7RbA7VI3CRNLw3hPxyw0HZHerluWvRGgUX0zpvvp8KeodFerFo+wJxbz2/rv
	Ifej5d0mjVGT9/2BGKtWte/OxEJiaWMkR9g3V9iG/T/RcVlscZQ9gWdY/pe2bTOaqmNjqqG0cY2
	b4vzzzKGPj/gqrwVoA2RCRwNwlUoyYTaGtn3JT
X-Received: by 2002:a05:6a00:1492:b0:848:727f:2c90 with SMTP id d2e1a72fcca58-84a5163090amr11894976b3a.64.1784198386606;
        Thu, 16 Jul 2026 03:39:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:39:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 05/10] ASoC: ti: omap-abe-twl6040: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 17:39:06 +0700
Message-ID: <20260716103911.77652-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716103911.77652-1-phucduc.bui@gmail.com>
References: <20260716103911.77652-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when reporting
devm_snd_soc_register_card() failures. This suppresses
unnecessary log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-abe-twl6040.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index dfa931071d81..05239ccc1f41 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -296,8 +296,8 @@ static int omap_abe_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
-		dev_err(&pdev->dev, "devm_snd_soc_register_card() failed: %d\n",
-			ret);
+		dev_err_probe(&pdev->dev, ret,
+			      "devm_snd_soc_register_card() failed\n");
 
 	return ret;
 }
-- 
2.43.0

