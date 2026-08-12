Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25AC4028E8
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786524748; cv=none; b=ReXNA5yGFAuJA8MUUuLmpgzRNrc0a7o5SQCWF9pkknOmNdEH4F4vYuvMRsaCcFW2l9yp9qfQwI4CudEamfBK23loCncbZeX5jnpS/i4sV5EnytUBq7d3Sxh7lMTcthMWxSdvH03FbJBwFIlhMn8+lUq13S1V4H+WTZJVAfL37AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786524748; c=relaxed/simple;
	bh=6cNiENYFBKbqUwsv2G8+gBfYkuwyflZwGvXYv0IGXNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eOaOsKhPdv+l3T916lZW9kOIVtLBcf+aDHmEjrYz08PW2v7F5X35ivmuaTUao+tUGAbSD5I8gkSV3TrQWjlw++UgXq/cnr9r9PdbTl4w87HOl0curjwVUGMEk6q6FiaON7BWbURirJ3R2ucjegKXWYSqtD99x+Xu+APmLnXA2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2F2pUhO; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2F2pUhO"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38511175ad3so595711a91.2
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786524746; x=1787129546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNWpn+WAlaVre4gvCr/WeLyDTlvNNiQEtMb3bfvk9HI=;
        b=I2F2pUhOdOqzPWFdu+dvyPNP5j8zzw9ncSVDSiJVoOM4jIPVTlY6abWpjsNu6Ha8/R
         ijwgXMvWY0uGJTGA11KokEgQzzy90oWTlXK0iLh9vLomiINydQ3p+nKTquu89d6A+GQ+
         S0+PoRs2xWUVJx4gQuMHTUDvEePb5sXhQ6PCDNvt6XJeiqMdC1vZnOJlJdqV1a8ct5pK
         GUymUUZvU6LccrOi5Y1R2PYe/545ALBIM6/0SE+lUllX3t/k4H+okf80BH1CoLjEMY7e
         szo9L9uLjKWln7FqKm46DcoW2cenWOY+dFUa67pRWicYOlM08w5kWjV9nC/gbFw+C/Gz
         +B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786524746; x=1787129546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNWpn+WAlaVre4gvCr/WeLyDTlvNNiQEtMb3bfvk9HI=;
        b=TeGAEuU/xv9yi0Zv5HbkmPHQ/fWwv5WeWrbl62+ETdd/wnXRnczRoOsa/dOpns6VuU
         pKtr3GKoDCQFaFIGBchdAvM0Rzc0bBWrdGE7DD2kqb6siTSlAXeiN0tZd/ckQSTCFHoX
         inyIdoEuLjjZQbC+Q4oO0enK0DWF12rIDUMgkkr5na2LvDr1FQ1lGOYNNci8OFVomP+S
         Hy688B1U/2McV9/RwWciCs6BbSIFxek3cFQP5qOEq6YFpyXxha6GOLNpUoSdoMtpSltT
         e+no+GPMvvLMCbNtP4MvA2ZZTuBHHW+bGN8UblPax/Dkj2XIJU4Uhloi673slRMnAVpR
         eCjw==
X-Gm-Message-State: AOJu0YwVp+NvfyBgO0irlG+TKTY+qIavDw4yenUhoN5eX3LtFAuPMzkx
	rmtpOOUZ5UpZLQHT2QB3/mYpi0V4iEZn7LgdMrdvSB87/YUJKcTI9eNF
X-Gm-Gg: AR+sD11q88GWU5SvJr07w2Glcrr7egbIsAsvPLHKuxTzkjvrorDkwg+3u2LbCrip6dw
	d0iSLQmc6ZbQYLMOzolz2vKCjN/mgMIHTbmxc6Ahkr1eCauif3krzreQPnj9rfzAem0liG3yzKH
	HXEtpKjIJn7nT8aJT74SNnTO/hUbmFaVwdRwaSweUJfjJ5JRrqGhJ1fJhtqRUSeE4z9RWOetaT4
	13oeKuKfesYBWvxdn0xMJt4AKTuRoEtsg38zR9cXVGmcQ4w8H/53YPb6a4iblsurhSp6izqXZvz
	jNltdKs0c83oX/17BlM+9kmBmn2fnY3tSa7NjCfYIHd3hyi+fTcsMh3dpIUP6gCakkThlnnAcwX
	u5uD7qacZsC3Q2nwzvVg35pJ5XQIaO1J5wD54yqb9gsxN88tFoC7QuvRap2ZBpbfoJw8frI1+0w
	FqDhi8J2KQgxfWj6IXiEma6fJgoZC9nQq/USmktKd6yA2x1l7g9tFCcWc7OtPskxQwQ3yGmbIJm
	82nXdUUYFarkZM8DmS/yUlpIy/7w1pr6L8t5bNjDlPLXfh/mAuPE8xufbifSyzvV8BlQ8CEHaAX
	tXAN
X-Received: by 2002:a17:90b:4b0b:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-3930151d3camr3603942a91.12.1786524746243;
        Wed, 12 Aug 2026 01:52:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94d30f4sm2916303a91.14.2026.08.12.01.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:52:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/6] ASoC: samsung: pcm: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 15:51:31 +0700
Message-ID: <20260812085133.29658-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812085133.29658-1-phucduc.bui@gmail.com>
References: <20260812085133.29658-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Update the commit message.

 sound/soc/samsung/pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 7e7284125c3e..8430686760d7 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -534,19 +534,15 @@ static int s3c_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = samsung_asoc_dma_platform_register(&pdev->dev, filter,
 						 NULL, NULL, NULL);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get register DMA: %d\n", ret);
+	if (ret)
 		goto err_dis_pclk;
-	}
 
 	pm_runtime_enable(&pdev->dev);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &s3c_pcm_component,
 					 &s3c_pcm_dai[pdev->id], 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "failed to get register DAI: %d\n", ret);
+	if (ret != 0)
 		goto err_dis_pm;
-	}
 
 	return 0;
 
-- 
2.43.0

