Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AF038B135
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785993789; cv=none; b=sgWoUBjolnh5LotQdFo2k2izWKVQUcIXWs4Z2/skmPWSDlv3xOzJNhf3DrttGjewJumbMz4s3pxhrYTQ6CEkxLFzs8QB/TbRAQ8BEz5KyW+vQhkThqyMd2YNTOWoyE8BthoxIaLpOLVyIwtFNAejgEEo9tocy1guUDWCNxFrWHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785993789; c=relaxed/simple;
	bh=9x7/N0DyiD4BxS4+aIJAxVJ5PjBthzbB8em/M/0p6iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1LWVuquKGgPg89daZdeTxo8TUUABIY1o/4m+DRdFdaI8/evi5p/DlqjtJHZTXCLQICoqZ+p1oYHrIM7vTMCNnpQslzK90sIqTePXndi0++gwvTbkqvA0t7bW/XxgACd7QOIUIROo3kTizAbEBjsUQwDZ8EfxapnDTT6GUkhxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXhpkFYs; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXhpkFYs"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84864086bfeso1464512b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993788; x=1786598588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ex53QN8qUaM4ezvj3nywtUMeXIR5OlcqRfF6FOJ3bY=;
        b=bXhpkFYszGrV3dNzouIXyup/ldndg/q6tlM5PyTP5tCHXcHFpSYTq27JQPpoGvDm9A
         szvMeHqAG3ccpKiRJCghevYTEn+beocJtJkMo67L51H2z0F40kRl3WmB237fcXgndgQt
         JnQdptMEQ3BVZT83d2kwBGk7EnfSGFg4MXc/z+cTOJKxKlv5YwxE+pcGpUfbXKsi5FRM
         aO9kYEX0WZqeyb8IWNLr6PXaHPPj7SymJZ9RxRSgaV5S94IWNOX8e/fX50yjXCBIYy6m
         VudE76jKlhDPgf22gcZZcEk8QUK2aGUyxbbwKe5sv5RUnjX+ijjVx0Z/9B3fwEOtvl+g
         hhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993788; x=1786598588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Ex53QN8qUaM4ezvj3nywtUMeXIR5OlcqRfF6FOJ3bY=;
        b=eg9q2okH3tMJnKwYhI5sACo3wTnUNVQ7a81k0QLPiZhbZOdcJML4/OIACqBLFYsk8x
         j8ySfHnGxYW51qwGw/VOCHTySV4vd12M4GPnp+cK2XbuqC5t1y4gEhjDvO9XiFAO/qJO
         QgYLrQpIkiduCv7SnncsHN1+aw6kKlZ6nkyDbMQH7AtDRUYmEk0QA9vxCrSwV5+247Qp
         ytiNAhooCGkwS8nWKnIVwFXcoaBCN+4l+kDyLSpIYoexwkP36+d69A7nulUE86GOIywY
         A04oCfP7FctDwnt9slKpfevaNdbUPjyjpmq3JiOqL6TobMVgtxzUdhVdd2H1B5y+hzPh
         Tq8w==
X-Forwarded-Encrypted: i=1; AHgh+RpozSVyqrV2WEBiH0e72Jw8ZjbBebJtb55TRiWhWJrjawJpjVSXcdmaC03OWDLMB5JoBJtRdOJ4iEt23Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YznDMlonZqOY2luwcdVByZ+RqVU0JKEblLRaU6585KPgOS2vVir
	xUcZNlzrTacDUoi0vXjaUVF8YNTAMRpvg5uNLTCuRNtlhRYMbXluSoaR
X-Gm-Gg: AR+sD10M8MqoKHTbX7WhehXAl7TKA4ObOw2M/Olzaw6WBvsFmzYdtRYJciohWa4CWHg
	NFgvpbX66bqg8We4glx/1sbefcdWgsRY+nRCaePL9UDtiUwtXRB8ZXhXbdLC9FJqDlO1CFg9cdF
	O8D5fGcW8LMHz2ZBaJpf3HUBzb2qJjCTEG0uN0bbc/Q2gnWBywy1JZRTZ2D1OOcmd2AbDjlEUl/
	2czppDPUmNKs1Xx+ZVucilvTNO3YPE3caNhU2QgR78MRTim/8OnKQZff8TM8khTd7cLJPQJWOKN
	JJfJnK6Y2bnSyYIorqIWn/fYxAv9lvOJJiVn6xKRFOL1ghmmOeDMPx9seX52iN+hZEMpJGom1sm
	cJ4nwQGPXAZaDo+WtlACQxtq/IOzGeY3YEQ5a2KgNUJnoRS91rRGl94V3NfIySLYXjtCVcBCVs1
	WyCdzb8K6JEXA+M/+yDiw9dVvhnj4V1CqGKyGUBguZqggGu4OMpv1cPmMDXNgvYuJAI5DxCIToJ
	IBWsDryaMd+nT2bBTzEDljvJmqLvYI0+nTZ32yQke+LHh9cpJ/dUcWTEZIAvyOKGKIwIPyrBmSd
	Doem
X-Received: by 2002:a05:6a00:3c89:b0:848:7f56:1e44 with SMTP id d2e1a72fcca58-84f2dfcfcfbmr13260578b3a.7.1785993787706;
        Wed, 05 Aug 2026 22:23:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45bc9cffsm554279b3a.59.2026.08.05.22.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:23:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 13/14] ASoC: rockchip: rockchip_sai: Drop redundant probe error messages
Date: Thu,  6 Aug 2026 12:21:35 +0700
Message-ID: <20260806052136.21034-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806052136.21034-1-phucduc.bui@gmail.com>
References: <20260806052136.21034-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_sai.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
index 1fdec12a0d4e..30b5e71d0937 100644
--- a/sound/soc/rockchip/rockchip_sai.c
+++ b/sound/soc/rockchip/rockchip_sai.c
@@ -1472,18 +1472,14 @@ static int rockchip_sai_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret, "Failed to resume device\n");
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register PCM: %d\n", ret);
+	if (ret)
 		goto err_runtime_suspend;
-	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_sai_component,
 					      dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register component: %d\n", ret);
+	if (ret)
 		goto err_runtime_suspend;
-	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
-- 
2.43.0

