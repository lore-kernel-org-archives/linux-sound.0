Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845FE3909B9
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784109379; cv=none; b=M0liCMDBgI1zyTYIx2/fxSt101fsyWXoHrNu+p87OfxHOmJtNt+qOwDS/M5Dx8pBEJ03R0t12/X9bcAwOykDKdPGWOYmuZVSO+HDzkL0dBn/ycfFSHvyjSWv7oNf8S5zOMQO+cQ3CeuW+88aivPBjvj6HHfIpNaOyIIOEHa4jmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784109379; c=relaxed/simple;
	bh=rWAveW84L3R2k6Dr0kk7jzU9NyiQbaV6M5iGKNhBiKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beun6vS7cqLckoP0dkMF5tEziSmSW7tza/sRzTHbhhuGXDrjCcTSYHMn6JxTFEvmeGc6sOnUsbbe2eG88ppmxcoOEfIQ78wh/sMiPR4/0wuyFo+KE77mNxTpbDcJH6hwlYnOzkXfBCK1flDGvg1awW1lYAeS5/vMdK+E/lejkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZ5o6f/Q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZ5o6f/Q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8487b7b4066so5239853b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109378; x=1784714178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oH3dvIiif6Ezut/x+NGlXGEkxyluaoU8qD8m7W6CWsI=;
        b=pZ5o6f/QZSTQAKvdkHFJiSGFYev+BZnUKyp3NrDJaOB4ddaDTZLpClor3CyGkvpbgN
         3KsYo6lAlR7GyOVYAZ9B7SjFzsBFWWDgH5yF1AwNuy69AuIjFKYHFfLaPJZx8WZes0V6
         TLqQ+9I/6FVgPlZK5NDebdpf/AcUzQrbNI7ijWt1RJm5yUFhzx7bA7DZg4aa75myFxUX
         nxomHaAT12KVHjYOUpF8md2iZtQtNtFuIcAhVvELpiCvMJaURlNLVoEgxe1Jgyw7TFVt
         QaLYgGjV9SRW4ezTTbXQnDem5CgZiUDqbuggWwxFNR+5Z3KJfsOsxiryM/sLiTr1CdAT
         kMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109378; x=1784714178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oH3dvIiif6Ezut/x+NGlXGEkxyluaoU8qD8m7W6CWsI=;
        b=pfD0sWd1XweKD0BXvsalfUdGRNKiPpcHyOGPPU2zYa7ooDgwzmzY9lxjEbfd0Ed/RR
         f7ypUcmWBJlLQfgoBK67W1rOBqxioJpvl79GO5cQiWLDTuSziHc9E98orVzfzsfPA4Su
         bg9cZlrZ9VGg7mCIYgwvFK3iVNJP/AI4MsO8y8JJoClZBFz9jYZ/xGZGRv9YbedVLZuV
         4XnrkYgJ09nWTAKyEjZkdcyUP9VOrkTBHl9//oYp6V0RjlBBFvmINTiEgFHy6x9ZxCLj
         6Rcpk+SZcSmkfZTCai+qo41CEi1qKhGQNRmBz7RNLD947fdv9EJ89T/ILR87Plsv1BKa
         X8ig==
X-Forwarded-Encrypted: i=1; AHgh+RrBltIqfAroXZeFc6w5Mm3Ei399SGPjDmulWa45AcQmJ7XehlRLyi17KoticY5b4Dwxi019hoDOZSBhhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9bX42/Ec82Ku1+WVvaZj2xDeSXRYx50Hkl/jCGEAUiu7Fgn83
	xP0A4g4iOrJ0IXeHgF6DFbd/w8xrbqkgKZ7deqwByrLEhualiaUOl1sU
X-Gm-Gg: AfdE7ckP6W6T9Sboxgj6Stf1OvIu4k8ArJG9tsgd+12DLQVQw9apIUUOxF2KsRjPiWb
	HUt24unK1s5DgzzbgOep746divIi8YOl1/CsLtoo4jgqcVB5ZpV0XmV5c/TJ+EECpyq6pj5tKWg
	wjUDZUo/RZp/snlDYN/ktiFHHrQfbNhNWSKGU11XF1Szwj7XALiWm/5RITHn79vi9sUFazllJ95
	CrZS2mfMG0+KCjhNDll33PQ8R5cU567IKy68GdzqPRTcA9f3bff83u5PnV1oTE2Y7BxNq/eaDLy
	3ScOaDx6C0jlhqfNjZPFY9onHrKcDs3ozPhC6GYOZ7Jh8STmjNfVLgrsucCjR1gnmSwi464/NfP
	uua99RCWMAB7YFYcPgEB3c1VJHZd5OgZnC0Czey1sRJAZz7175lLWXP/HDtlPwgM03wAF13VhnY
	6IJ0dnoRxy5vBMY5VFgwGo2u+DKf2zcGAE5pv8VkXHutK6T48=
X-Received: by 2002:aa7:8891:0:b0:847:b2e4:9f68 with SMTP id d2e1a72fcca58-84a671da3aamr1648721b3a.9.1784109377872;
        Wed, 15 Jul 2026 02:56:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:56:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/6] ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
Date: Wed, 15 Jul 2026 16:55:24 +0700
Message-ID: <20260715095525.40668-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715095525.40668-1-phucduc.bui@gmail.com>
References: <20260715095525.40668-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Drop the redundant error message after devm_platform_ioremap_resource(),
which already reports failures, and use dev_err_probe() for regmap
initialization errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun50i-codec-analog.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index 9f5b067a8ccc..50c0dee8c433 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -551,16 +551,13 @@ static int sun50i_codec_analog_probe(struct platform_device *pdev)
 	bool enable;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	regmap = sun8i_adda_pr_regmap_init(&pdev->dev, base);
-	if (IS_ERR(regmap)) {
-		dev_err(&pdev->dev, "Failed to create regmap\n");
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "Failed to create regmap\n");
 
 	enable = device_property_read_bool(&pdev->dev,
 					   "allwinner,internal-bias-resistor");
-- 
2.43.0

