Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E067938399B
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784030503; cv=none; b=achuqlQ1eWmHohp9n8ZCljSVBIxMMzqai3Ff0LMYsfegRtRo32jtfEuYtsREPodZ+WNTZAXpakMunO/A6yPe6kKu0+2FOf055g0lt+Ugsq7NYPT/K58ppHO8dt5dVaiq3Dw0P+ozHv5UOZ2aVg6RcCOSn9nDctujpW+IKMuoyF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784030503; c=relaxed/simple;
	bh=M/Z00Ke3yA1+9MMYqSqHiOnhjV5+iqJfuV5rIzAEClw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=otdfMAsQmSfJ9/03USBsduhjbYwZpEXWYyAi4qi/YTIGyWjib1L0xkajMnrWOB506r7sSKCgX/I8j4nPyg5M7PvPszEMdf4/CHOnaLVeLnup3Qe8gcjS+p+E/nJZ+AuKwqswXiJpl6RRRRwKC5ZkPDGfBoxQURhKpxGKjnnNkLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cy1ysrJ2; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cy1ysrJ2"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-381ed661712so4718259a91.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030501; x=1784635301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urodHme3YpZA6FdePUZQkhb9Ku6VHGO5pVP1oYHnDDg=;
        b=cy1ysrJ2UYXKSjJ/fUfRCRY51hEHLdujz6PaNpx4CA+Mzs5csN6PRcSZhWSLr4rIVj
         V9jdyiiHyF8YjV9Gv1EV2Mi426N7+s+mRG8/aEFq8MW2Rwm+ecx94p9PLmfrTRhsh8pU
         5ASKUeIDqAAuw8DGl7kYqA0KEFDi+1/AsJoxY9059Xb3mXGJTvOTRhw7fAdZpuTbTWiX
         BeoxQ4h/Mb2ZMWqXKkKG7S9nyFppxXRHsAut+7/zL4lNzMWiAFRESWjtr3Milvup3wcj
         eiJTJd2wybLmP1UFKSdzhIFXzkXjNbaGZ/VI5wctPsu2LMrUu9hpsKhPl36Xqj6VnKq9
         J5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030501; x=1784635301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=urodHme3YpZA6FdePUZQkhb9Ku6VHGO5pVP1oYHnDDg=;
        b=bC5oacLf7ErBuYJq0Ly2vB01/x9SQWzHPbCxx0y+7f2Owqrw0hiXunpbezJV6G1TOY
         o/mXIU3Z5uR/ggeAydjD+VlaSC65l/psG1OyWhh0SC4mvU5ds6w+PxL1q4Vm7LpREDi4
         ezYqiC8HCu+KEgt76spsHg6FoJZM0EoPjaHR39wJkbPw/NV2hGE0+pVVHoXfnFC8V9hi
         5xQq50k96dgHOc8cGZ1KKXbqmLyZSprvB6S+ih8QBq777PgbuqG0Sxzkd6fA5D4z3lGR
         EV3a+m/XY+PT+CJceMjPMfDhdU/051b8BVjsK3ZIT7Db8iUmxmOuZNtoIhgfA5xxO9c6
         RmwA==
X-Forwarded-Encrypted: i=1; AHgh+Roqz7HcIwnaasybaLVPmdtK7N9AKuUOwhVZ4oh74UMqPk84hfyJdbsY26jUUUVpwgtn4NcCyWclY17f0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YySwy+EumBwJ0kO/BQim5a5ofOapAPJ0V3nag+RUKJPhmPGtCrz
	8ykCwCePI8A7uwzsgP5Ah6jZS0AaBA7z66eZuNDgRxgyRG0SR0pxVMgd
X-Gm-Gg: AfdE7clxXNLXzanPh788PHW2bUU9InayXbOY9UkTx2RwbvVmlsnkMF2HSu7aFg4vJ2U
	SXl/E2ASoT1kR4ah1jgZiWQxh8MFFzO5cq/3Fl4sCjEYK1asDFRJsZOj2VK+pyVBLw0/hgTglY2
	NdraYCyfqD0Zgk5F3M0Pvb57KmtZ5hKg82cNe64p15xf6nrtDxtv0GDUVq5XRuSZKWkCCzQB+Bd
	Zr2g8CQZkEExAG6Pct9KXcuFV00E+B92Pye2zQZzIgOzmTJWyj08+Qns1T25600kAasO61+PtwJ
	vxM8p5BLQxsxvV8ckwaQEcRwJH2bLt4IrnRmiPMnA8ibNLEz7Hj81EwjTLeX65CR5PMKpWYyKuh
	aaH0X1s1euuq3KOl5dXRth21/MjexIo2aiQZ+pDjCUxuDoUccTSCGyQ/Pkl8JvLwxrBAYA6k1cJ
	KFDEhZBlJ62/9pCLg7tVhdhsAvrJk+FDxP3imgAtTxepypoyE=
X-Received: by 2002:a17:90b:3b8b:b0:380:a568:cc4e with SMTP id 98e67ed59e1d1-38e1add8e69mr2181907a91.9.1784030501158;
        Tue, 14 Jul 2026 05:01:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm86725093eec.19.2026.07.14.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:01:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 02/10] ASoC: ti: davinci-evm: Use dev_err_probe() for error handling
Date: Tue, 14 Jul 2026 19:00:34 +0700
Message-ID: <20260714120042.491712-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714120042.491712-1-phucduc.bui@gmail.com>
References: <20260714120042.491712-1-phucduc.bui@gmail.com>
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
 sound/soc/ti/davinci-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index ad514c2e5a25..7bcbb0067e25 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -247,7 +247,7 @@ static int davinci_evm_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_card(&pdev->dev, &evm_soc_card);
 
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 		goto err_put;
 	}
 
-- 
2.43.0

