Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884034;
	b=OPyaKY+KWaVhHQPHtggr9d344rYejekdpMjXnkC3s816dFzjcKe0D3ekRIk5gHuXe8Wf
	 0Mv1gmze7oYzkL4G29AQuuLQIR3aCWcUbrOmOsuHEVkSNO97PFKBE4Gf0ik78dmlVMm/7
	 dtrhsOeL5iXCQPyzWSFnwS6wq8NZ2E+KSZQQw/4x2/GHJCqECEIxRY3N6RJtQpUhrZsiF
	 UK7QJ1TrmUu00sJ8hOOtjyz6oRFG3L6UM+ViHASCqIPoVOBui7XoiaOktqChFsBOLkn1L
	 dzZD5bhERmXybWz1QMt6UemRzqNWYODMLR1SbwMdRN4MaGppSwQ9dCCzrlZTJaNQOZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqsCvJ92VufH7QScYx+SYRb182Pj4ug+Xkrpv5KX0ug=;
	b=zgrn4EjcZmD8PgybOZk35JLd3nI9Am4f28XAkKdUekYVPmUE4iSQu8kFGObTqsGc9bEo
	 OADXM3qaS/e+Cwp5BupVKwIu6ebTrk0beWPDlJuwUO7MlVk+9lXxHlFFQtiLVtfn2DSAH
	 1xlbr2wc8KLbseQjrqQCy3nd6krMoH4LhdId2ix5G7XeFwJnKvvxcm8G7jucfbKf2eM93
	 Yl3sM+cCS6D9f60myhkbYmTPAa15lewZ2eLI8e8f6VIpD9bHaiVRBWs34IEkfF+MVHM9S
	 CjoCrlWo3IG/2FnqeclLuPgZRq09RLG8KyXarnURshitk4ncO1FEr1+eY1wb8wJ1frQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgtitiFv;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCA606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 02:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFCA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgtitiFv
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so10722360eec.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 18:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884033; x=1795488833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqsCvJ92VufH7QScYx+SYRb182Pj4ug+Xkrpv5KX0ug=;
        b=jgtitiFvqsDtVIvsq3fc37pauSfLdcqiYqgTstR8hzuc411RWrSfBIMEwJlJfDwoPR
         PgKg9Yxjb3xuXdF6vEg2PFWhMVNfmAko1JLN7md9fz4adifAOGhxBGGveqk2xk32VDdY
         pieFlegVOII+59SQfLHrQAnrXID/Ih5TSpBeog7ZlnJO1RzgfXSf4jNtW7v3kO88++0z
         QcPoVXJjiLbukuilHSF/WdutsulwKs9ReEzQupH5HuvHubbT52UnJO8gbsN6zPiRmleJ
         eoffK2MBQDdZ1dpWUXW0qsPdObiXO39B3NBC8hlPw2YBrCJHGzVCsfTyglz0Fd1INsUJ
         nY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884033; x=1795488833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqsCvJ92VufH7QScYx+SYRb182Pj4ug+Xkrpv5KX0ug=;
        b=C1OLDeAfJmUPvBGgHU9VysJj/cZt8S4apiU4ELvTzbd6Ix6zQ4mZkD8JZTclOtpBnZ
         YSOtMcihRbWVdIpnqIPSjMqqGXRe9IXv7+nS0YsndK1CrGc4JNUZvlGfVSLasqNZdlgm
         272k8rheg0KCLxCPuOBM3B59Dop4Y0GmgzwUF1nc/TIblvjWkQ6ueCn4o6d7Yvvmsv0X
         IUWW4PPNeDEV9zJksd85kn9v4SJ7oBucYEXpP7/70CRqUhyspAR9x4TxZ9G608FVdqX3
         3/skPonXUXNUny/29Yn6oMGJ+TcTTSJ1c2sz5x4GqecuOA65LMlmB/Y2Cazlj6QTfLDU
         MlCw==
X-Forwarded-Encrypted: i=1; AL+hErGU0af95ZqR6SuBaQpl044N7y7n/xmT2Ggl+gq4H6qTPVucwHTeeUbXzXjp87jbBVHf17KIPLPDTx9kBg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VlsKIiA9pSuBH7mYpDAPKkH34dpFGFehfgiDOkKVxOcxKXic1
	aaYZ6qZ4Y9wC/IBREUqUxUcqzMWQgd6oRuw192Ft9FwFcjmABD77Ax39
X-Gm-Gg: AZFdTZcFWnGoTZF816+JYsdmk5+QTlAQdZ4mhBQ9zTOcRn1kAg69PDAjCCEE74dWQZt
	UBoq80/lxdPWK4Vu7d3LM+BiVv4hsT0U1AnPUBNiCYBjIQfVbGeFcJHt6nRrv1p2dxSGdPgSLxE
	PDqzmWz9RSCdXIJJskMZw3j4i9MPLIelzXR9CNsuiJp7Jwb2Xp67wmHHYCzmQGS5dSoU5P5VTq8
	L6zlSrAKbDqD8QYvbHBgsX8AwNxTH2FWinc4sGxbfxFRA+HFLIG+mfLI7z5Y+tLEAtrU4j6cRnZ
	HDeAX4YLgiTSvPEE6p8qthIkL8RWOQL56LoR/pF5FzxAC/Dz2F5iBZKJVsbF22NS531xdafSJl7
	5oZ1mV6+UtEsTndUMRWh4C3k2TV8UHdW037+y8ERDagFZOVLR3Ttu/WHklkG3N+JdNvPhMguwpc
	MnTNlh8fLwisMuh95Z6JSbMNNbQtt+hLY+gtAuB0TzCw3WBmLGLt7iN7yEo+8giAU19pIEBSc6r
	d4fovRhiS+CcFiJhn6q4EKzoeauzD4NBeifUCCZ0s8UjSAazd5VLP55O5eSyIA/CYJLQyDSwnTG
	t6CllvdMFezx3Bwuq3zAXBcnblL2gtvfCGHujT1H0c5l1A40vkZR9Pbm/doAcxfQ5vz5Bb7CC09
	lSEqxKgVRL1ysZuSOoueFFq9zh1/1Sbs5E29b85L/3PEutfeFRVUWUaie5kyLGPZVUg==
X-Received: by 2002:a05:7301:11b:b0:36d:2b50:4eb9 with SMTP id 5a478bee46e88-37967316395mr13958034eec.25.1794884032993;
        Mon, 16 Nov 2026 18:53:52 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm39357368eec.15.2026.11.16.18.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:53:52 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: adi: axi-i2s: Use devm_clk_get_enabled()
Date: Tue, 17 Nov 2026 09:53:34 +0700
Message-ID: <20261117025335.7455-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117025335.7455-1-phucduc.bui@gmail.com>
References: <20261117025335.7455-1-phucduc.bui@gmail.com>
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

The AXI clock is enabled once in probe() and only disabled in
remove(). Use devm_clk_get_enabled() to let devres handle this
automatically, and drop the now unnecessary remove() callback.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/adi/axi-i2s.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index 2c4035ff6c2d..1eeb96b7fd60 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -208,7 +208,7 @@ static int axi_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->regmap))
 		return PTR_ERR(i2s->regmap);
 
-	i2s->clk = devm_clk_get(&pdev->dev, "axi");
+	i2s->clk = devm_clk_get_enabled(&pdev->dev, "axi");
 	if (IS_ERR(i2s->clk))
 		return PTR_ERR(i2s->clk);
 
@@ -216,10 +216,6 @@ static int axi_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(i2s->clk_ref))
 		return PTR_ERR(i2s->clk_ref);
 
-	ret = clk_prepare_enable(i2s->clk);
-	if (ret)
-		return ret;
-
 	if (i2s->has_playback) {
 		axi_i2s_dai.playback.channels_min = 2;
 		axi_i2s_dai.playback.channels_max = 2;
@@ -257,28 +253,17 @@ static int axi_i2s_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(&pdev->dev, &axi_i2s_component,
 					 &axi_i2s_dai, 1);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
 	if (ret)
-		goto err_clk_disable;
+		return ret;
 
 	dev_info(&pdev->dev, "probed, capture %s, playback %s\n",
 		 str_enabled_disabled(i2s->has_capture),
 		 str_enabled_disabled(i2s->has_playback));
 
 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(i2s->clk);
-	return ret;
-}
-
-static void axi_i2s_dev_remove(struct platform_device *pdev)
-{
-	struct axi_i2s *i2s = platform_get_drvdata(pdev);
-
-	clk_disable_unprepare(i2s->clk);
 }
 
 static const struct of_device_id axi_i2s_of_match[] = {
@@ -293,7 +278,6 @@ static struct platform_driver axi_i2s_driver = {
 		.of_match_table = axi_i2s_of_match,
 	},
 	.probe = axi_i2s_probe,
-	.remove = axi_i2s_dev_remove,
 };
 module_platform_driver(axi_i2s_driver);
 
-- 
2.43.0

