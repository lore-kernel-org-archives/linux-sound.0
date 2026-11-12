Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480696;
	b=vMGpZgUZRR2TA1JMfMPZTd7ZcmNGM0o//0lujEZoJEhBR58aP1A0KLbIehtP7ihqUU20
	 9F9ih/iwhSy107VXvVDGg/yGCJgnI7alk5e+I3Y7dSLrl5dZERk88krU3MxNr2jLGAzsJ
	 i74+9/TlSVURCXOfbe5jPW5vecH6zIAB9+ybRupRNkS5i8cc/gqlDyWKGBczaYnBbcWkO
	 MBnOOk7XFUU9PQKtBYjnAeR8wnxFVJngWnePoleTP5iAGIu59h0SPocBYwpbNgCpYZR/n
	 1Nt23zaaZqTGhvdL6BIYEJvNDKVZ1l26f50LiKPsx1RSdINBFLwx8LRFh1BCITccClQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
	b=ahKuoOWrUJ6tEV9KJTs4y+KHF7jEoJqmWeYo73Cdr/Z9lJ8WPAZeUuPBZ5Krds9UyYCI
	 pUCNS/q+8RJ4vMVwoggg90FNHFpmFN4zqSEoYvdj0y2WIRnbXIjwZfXhL7SGE5DeKzgO+
	 f0yHIqJygrjXRDmWiBS+hOMNmWgnlzMbS/84hOWNUDCs3eEMc1R4RgMNjM6HoKkVUEEQw
	 JpgLXTJpUF1oE8DWXMKOslY6E3Iv8UaVdSeziOUZG6vOTh2AGflJcZf6UJOCdIfztii1H
	 LN+mhxLh7rpDqQIJL2bxDACvIRKOrQcvS9uBU1HUQfmWiUIswldTet5Rdm2pIS0vuMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fg59wiqe;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE84606A89A
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE84606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fg59wiqe
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f6295304dso4828863eec.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480695; x=1795085495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=fg59wiqeg7Q0aIzVHhz4wCBDfvnFspDptttCoVNGA/TSWuXB0mOS8hPUZcT7WTbs/s
         L+X0REVw933oVMDB2gQqa36DvamtkbGjJQpE3CxVAuFjCaqX9kEfUaYXm0/0gCHOc+5Z
         eveZm3WO715MR0py8L/DfrzdUC48QMfwm9uCAXb2wc/6nI4YpvZF47t5k6T6aFVg42xo
         wgRc5E9RGZUI6CMLh+PLZELK619qB2ToDBakkheT7AcUzZYCpYzi3fVnjiXuq0jsfIgk
         blN43kKIxuD7alqaAgG8VS0Si27o5jvR0oF2ISkTbBVD96lNOgH8FpftEmYTl1OavmY+
         q8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480695; x=1795085495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=DPzVbTPTmMaulR3pLyrpVY43H6BPp+lXW11bFFxXje82KlQE4gzQ0xXMUX8O2K+Ume
         GtzgQM15TF6SmnrpSjm/FW/mm+DVm+uBn9s2v+7ctdHW0x36qrvWk82ibHivQZ76ciN5
         xIqw/BsFpU2YJhGbP8T0ZQH6V2DLhTjNtxU3+CCyuUYjn2kfRbkMCkzqOHSCwj1LUlSQ
         aMfRYd89kLmJrUXw4A40ZAR/ri6rKnlRNieAeiGrkLz6CA+49STk/e/H6xmKGEM7vfBJ
         CFlUFaHaJ9NE2+ePIulmm7SxsnlC5+o6eANur+vF32YNnrhgY+qQsHVpr7yot/RfPOoX
         6ZCw==
X-Forwarded-Encrypted: i=1; AL+hErEgLeQx6RfS+r+IhtbzviYtu3b15ZSiolXtXlApyLAyrAZr0MW98ou76YlOlVESTu8fSxhWrUv2vahY/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bBzwAJC6ntcfREoDupEDV6pedy3nEd7HNRo285ZKXrr6BhQEw
	VBxOEPYAb1S/Duj8Zxz/9jKa4eLOb2uzqHOoxAUQLxYxONpAxMlgzmWV
X-Gm-Gg: AYBFou37bFHxrqhLopl+dU4QTwSeTBn+uPpsB+35NmCcL4xH4S0LaDlHR0jBw+WZxRz
	AersQyoYgYl5fZd17MJC25zK0PHGhmiFQQE7M617YdX9NzRWf2If4+FZe1f3LmLz0r5zEMankMI
	542IvRypdzcZ6n000LsCNCMSKeR/xYD1Py5fGrULIL4ucbUsce2ICgHrbK+YuejtVeYdzDNhH+h
	RlbuF5HAGSgxj11W29sQXfmpYH12BEMpm/8ck2KDapzxV42TiGeDtmNwG1/BXlJEaA2M/hatC8T
	ahC1pNN596+wZqrzN4osE2PN6jktAOtksgj9qKMtu2IvzO41K3WzThrF6HU9qhoiOIDzSd+7fLB
	AIJpIQwsxGq9Ufim9FgT9L5r7VE2k4uRSoy28mfzb3T1lZvKIP0TgzIaCCfKFfIoKNNorzr7Kq8
	DSMT1A1gnKCOx+HmwwF4iGk936Dz2T51jemas5HkSikcPUfmiu/Mcainj5psBs49CQIVbwzgT+G
	lYGTS8DWV6O2spU+liZFDRrRjnmTRuSex49s4NqFu8enbUv8yu8RqG8Xq7FlSUKv0PGlSrQlvHY
	LdRhChws/Kf/wLwB3PI24qw51wBq5wYpt0CKPyjTEs5XowMOWQQnbA8jlygzPkT97l70xTYkXkW
	mJsuDjR8mRZKZEtlyQjG/TCkTwiQFcsWjITPOpyX5TZiH
X-Received: by 2002:a05:693c:41d0:10b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3768617d395mr5904378eec.19.1794480695079;
        Thu, 12 Nov 2026 02:51:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:34 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/5] ASoC: fsl_asrc: Improve probe error handling
Date: Thu, 12 Nov 2026 17:51:12 +0700
Message-ID: <20261112105116.32274-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105116.32274-1-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes. Also remove redundant error messages from
the probe function when failures are already reported deeper in
the call chain.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index faf348dd582d..055593d5d37b 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1301,22 +1301,18 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
 			       dev_name(&pdev->dev), asrc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to claim irq %u: %d\n", irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
-	if (IS_ERR(asrc->mem_clk)) {
-		dev_err(&pdev->dev, "failed to get mem clock\n");
-		return PTR_ERR(asrc->mem_clk);
-	}
+	if (IS_ERR(asrc->mem_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
+				     "failed to get mem clock\n");
 
 	asrc->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
-	if (IS_ERR(asrc->ipg_clk)) {
-		dev_err(&pdev->dev, "failed to get ipg clock\n");
-		return PTR_ERR(asrc->ipg_clk);
-	}
+	if (IS_ERR(asrc->ipg_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->ipg_clk),
+				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
 	if (IS_ERR(asrc->spba_clk))
@@ -1325,10 +1321,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
 		asrc_priv->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
-		if (IS_ERR(asrc_priv->asrck_clk[i])) {
-			dev_err(&pdev->dev, "failed to get %s clock\n", tmp);
-			return PTR_ERR(asrc_priv->asrck_clk[i]);
-		}
+		if (IS_ERR(asrc_priv->asrck_clk[i]))
+			return dev_err_probe(&pdev->dev, PTR_ERR(asrc_priv->asrck_clk[i]),
+					     "failed to get %s clock\n", tmp);
 	}
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
@@ -1443,10 +1438,8 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_asrc_m2m_init(asrc);
 	if (ret) {
-- 
2.43.0

