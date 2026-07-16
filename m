Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729863F4DF0
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192938; cv=none; b=sd+xMubxdiwf+hlOTlQEReczGAnIvSetF2fX/3hzJMoZx82Mk+fWL74BmK5XU9ie1QCzQlnd9eWbJNxoCKdSlZQD+ZTiO+LcKchCAef5ym0Wd3VPmiDEJGlEdQ23lvT6RYZ+lQb4aYPS8X3W3++sUdQ+B57kZlQknHFnvlyzYAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192938; c=relaxed/simple;
	bh=bly5g/vrF4ctQv0fYWIQy5hsDFKEKRsbvFXr7VSnXeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E2Yx3fATzwRK+5epV7YV9zF6mgryUqyW9YlhXragdZKhm7sW4YH+d3hMolYnldxXEVqlx7ATSCyV/On93w6xVuKsq68BOblh5o+/pvJf/wJ4dp7/+Q8TcDprafjG4Q+Ctc5oE/rQ8idRT67HF7+QFyC2PNGIz3C3k5PwufVyqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0sgALZ7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0sgALZ7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8485ef63b68so5940524b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 02:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784192933; x=1784797733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yEt6Uvr9Ac4AHA1sp4pMgGGdcdpdh8Mxz+CChY0s25Q=;
        b=E0sgALZ7k4NTsQOoWRFyZWdErZyX6dIAPflc6KnehuFV7T4Mk1Z0aXyLl9Zov5SOHW
         744JbBMlSVeyz0+U4yC3R30bfBPq1r0SO7Zyh1e5u6T2jGt0tdD7QjvD43QZBg6de5mn
         8TJuMFGiCWByd2mRIbHjPUoMV+LPqMbJ5s3jcNPiXksxkzCI7g50CxNEu/0oDlmYVql+
         UC6cQ6xvKB9w6yLZIEZUIl05z92tEYIVTl4vvzGtXmCx8YmVZJXRl45NpOFJiXX2MP3C
         svWaSXit0JnMYdb/njPML74j5YRZeo2AZQo7ldnFLJCwAgmcbj9sbR143ONiJXvHu2oZ
         lleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192933; x=1784797733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yEt6Uvr9Ac4AHA1sp4pMgGGdcdpdh8Mxz+CChY0s25Q=;
        b=msai8p+2l13PIWlsMxt8Xe69Qa0reRNKwpAWPbb8sHzlJSobHS3PVmGp/ZupYWCRY1
         Yk+IcDmDE7UmK8c7DMFjTifgrO9mFflo8K+c6YdVytBHu4/muK7ONWr0+NBjp2Yl4I2b
         wGhTUVaqIfm8tID0mdTgcJnEhmxnDWLPt4Dx1rhUVQlUPSuY+9yGVBQ5oStE4IvurXtB
         YGctL75DeL1Qhuk0223js3nssJ7aXXy3Imqlrtmmz3RozdGCQr9RXhaavPsPdZ5CPUlA
         ueneF3ON7DPmTv7R/ssAseT3tNgajQRlmXm2kN6ga9Z0/JbowrwPKwOtl0JXic1i97Gs
         orlA==
X-Forwarded-Encrypted: i=1; AHgh+RqIhDGLp5GVRymJUCUvW9O/e6FY5dZpd4pCP8ZPL37sZQR66fihtSziyq/EeeL48g6nP9GLw7X8Lakr1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfzcRxJteNRn8beVwaOAHoY4e/BgGis8rWMBd7pILkwDHvll1
	VKxUGv2OPPkZYITC5HMEcbqv/gQ73RXEhhrwaVT3oPGmqIaKyTnz/Ski
X-Gm-Gg: AfdE7cnxsJRGQdNqWxeXJwnnOWiWlJ+fXKcIqPKNrFo7qLDqx/9uQMvVXlR7QnDYyJZ
	q3HI9NxQSwEHyMHFTLJRI0EWYMEpLhHZnBCW6JCnoHnmkskD63kYRimkJ8nLZUwUGTVuyYEAUdn
	gENIRd6e/MQTfeXxLy8H+lJQC5E1I+x2ZINu9VPZzksynoUtwu/7KHGQcMvzPLV2DzCC37XK0xo
	JMyNMiEp4TlbjAc4eUgaj+eTQpOJ9M9WE86dwTq01NT1TBkDYb/WX/U+mIfa8kAlY58ry589B69
	F9N4itWkGp8ULQq2mjQA+l++FvUzmtWWEY6yh8ZSkFYL2tLQAbvoi1cJBsiGPXHWjeTTrWi/CmT
	gZEdfCtReSaDGHDK4dYG4PhyLrzZ1j3CGwVDlkWCxdiS2je4npOEM4GUUiC1xVsH2sQl/2uF1Rv
	WGl+9007Z/a+G3TQODLtZwkuEHAzKRV/jI2lN05vPlenX3T9Y=
X-Received: by 2002:a05:6a00:1495:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-84a554fa572mr9058478b3a.1.1784192933594;
        Thu, 16 Jul 2026 02:08:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bf5ecsm4511800b3a.29.2026.07.16.02.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:08:53 -0700 (PDT)
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
Subject: [PATCH v2 02/10] ASoC: ti: davinci-evm: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 16:08:21 +0700
Message-ID: <20260716090829.72082-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716090829.72082-1-phucduc.bui@gmail.com>
References: <20260716090829.72082-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Add missing parentheses to `snd_soc_register_card()` (Christophe).
 - Remove an extra blank line (Christophe).

 sound/soc/ti/davinci-evm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index ad514c2e5a25..3156d87a3a12 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -245,9 +245,8 @@ static int davinci_evm_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(&evm_soc_card, drvdata);
 	ret = devm_snd_soc_register_card(&pdev->dev, &evm_soc_card);
-
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card() failed\n");
 		goto err_put;
 	}
 
-- 
2.43.0

