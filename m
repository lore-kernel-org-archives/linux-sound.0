Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B542124C
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529698; cv=none; b=ny4Xgaw0uXrdmeN4Ltqg+azGs1o9sFckWVySLD+nwXVsuRb6MifO0PYwWwE70FFawQV4EqBLEafO1vTRv407QnCRVqAp9YWVlxs58Twr8OBKWHrNKCYQFd1yykK2/F7uihr1SZ08O3oK0PqrrYxvlLIlRKELHMh5Irs0AE5tUFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529698; c=relaxed/simple;
	bh=Ux4bCOBYVGBrqL2r/R2tCBb2b8i1x4Gdjs+9pr0KioY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjxoSnCitVCNX+1jGMCoBHDPQJafLOhgoDfc33hi46ztxkkdfNh5Th5xEjSgQ/NvrNMz77d9lxKUKbxYY82+xfjHEKsKVvPnCqWj4Ts5jRkn5+LNXY7+nC6rFYthUTBrVFeGmL8gImTwj3g7FolquknTFqOvNInhBKOo1N20Res=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvHbGD03; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvHbGD03"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38deea72eebso902323a91.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529696; x=1787134496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QjQRdpjgs+LH9OPR1KHqpvjYOEdNhIXBhMpxvHX/HHY=;
        b=pvHbGD03oaLuaXKGSUGhJkAn6c2GB1ylb1NugpFP6ECQkth1qeaC+XCvf8VhQFnF/z
         515Jt0ucSAFg7fpmk0gaGAXzn73O7S5zsktiNpdYfpMMOTLL8RIVeHS+GzV3TNbuprIA
         P3FedPQit1wdHqZaoAT5jZUcrIQJYPf2+2rv2NuQvTBdUsu6/jBKK5+1weh2PGJjiKuZ
         IW0wUfyhi5DrXjFe9XWISozq1qFGbQSMmomasjVmwY2ttRYo1nCt0+PXOJMDeIoC1yKp
         iuyU9g9cxew8D3kSHiW6zYu7sFPmfr/rHivc6v2JCUJyUk10gL06mWXpNkqRJNsgDwXY
         Bzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529696; x=1787134496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QjQRdpjgs+LH9OPR1KHqpvjYOEdNhIXBhMpxvHX/HHY=;
        b=TRprN24pkX9ma7tHkNzc/7maIdIRCdH/KuoeukyzgZxcUvhBKFa6pamN3feBHk91LS
         YqRKHILKFcw7OTSfZ7eHTwFeHAOflX1aq43LzrIizanQVT0Vx6g7vjlnJyZAxDGjbSwV
         9GeAK6l/CBxVDyBmFpcxxBYxJjcc2puVZC0cGyx5bW2E50DfMJFiJQF5WsjYXLVKQq8K
         EfgxJfDr9RslTYOU5HDaciK5/oGtArzZV2xU4W7eCNOLLINiVtE7Gv9FxPm0+LviUcAj
         1NcwudeaSB7xeFYY9Cdqv8wKosMLqEmhWWI4M370Lal1/FoVtP+x+D/OvmcoAzuzckEo
         k0xw==
X-Forwarded-Encrypted: i=1; AHgh+RpAjOW1i4JXCjQ0k8Wjc+p6mCn6LA0t7Qk63ufClJWZX81ZF6dcpyIQOIi3k18nIXS9NgA647xCOTb8qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIVKWWJztB4w2ULzqh8hhXywXRr5RYlVQV4nbptA4PUFanSOiJ
	riqnHRA1CTcoxTxdx5Sis4Ne68QQ60HpRtwDMAas735rw5CbC4o4RKAl
X-Gm-Gg: AR+sD100hd1tv/WLp+SbFuXbwLXsxK4gYZ7YlSWKVWl0DtP4CQJRWMzmCRTExWEYRW7
	I3Ut5YufCLN/gojwgXdr6/nP8dLvqCWqj5aS0SkVZa3SktphrcQNshP5UMhaEfHQX+A5AfAEbHu
	SQuILbVCiD/3vxwmp0HcqIlv8zJABVaL4Ic9iTT3uFNPgsFDVbWkbD5ztMFu/T5b0fxqcLK28da
	IbaNs95fGH0WQhFH9P3cGDXVNNQ1862H5PkXcSjHvhT42sPxS1o7489bi7wjJZAQF7Nit3DEqlN
	k8O35edYiqtDSSa6kWU/4D4iyhplCjrKbiqIc10wzfFAllRW7ABAM55M2AhmgOtWqIB0uBBWChn
	n4xfj0X5oOklveFren+7jwl7YgKUqQjVZBhIcRghVdgM0Vuee++OqTXNU8Nv9TFKf/c/rqwtXGp
	eDxWDkn9KkDgP2KjSP+jLX//lvs3y15qsVdgxlrVPlaHfuD03BYVh0h7LqkG/WNYTR+oaDHxMNs
	9V4nnAwpG+iYpJ+sfCJaauIIJqdp8y6cu45X0EQZdS/QXVf6MQGPXSY9+z8mKyXlpeuaJc6DPdx
	WE5x
X-Received: by 2002:a17:90a:d610:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-393014be1eamr4231403a91.10.1786529696244;
        Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:14:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 17:14:17 +0700
Message-ID: <20260812101418.37966-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The functions called here don't log the error themselves, but the
error is already reported deeper in the call chain, so the dev_err()
calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-saif.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index b877c978a04c..a77cd516a1bf 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -841,10 +841,8 @@ static int mxs_saif_probe(struct platform_device *pdev)
 	saif->dev = &pdev->dev;
 	ret = devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
 			       dev_name(&pdev->dev), saif);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request irq\n");
+	if (ret)
 		return ret;
-	}
 
 	platform_set_drvdata(pdev, saif);
 
@@ -857,16 +855,12 @@ static int mxs_saif_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mxs_saif_component,
 					      &mxs_saif_dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "register DAI failed\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = mxs_pcm_platform_register(&pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.43.0

