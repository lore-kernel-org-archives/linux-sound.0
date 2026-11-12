Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480714;
	b=IEwJOkld9d3zq2UWMQkGqfLrLOhJL5Z5EInG+uAOLgZEhhkWV2HcRRfl2em+EfdaUe7n
	 EKEFaEXdSZKiluw+8ILjNIWg3pgSElLTnJQ+DxF/9WL6Qjakupenf+CzcKYGMZXxaf4a4
	 PXqMCibPRRhXfd4wh9pz3M5FZUJa/iDUYeKr0t1/TVZwTtBtkD0sl5/VhJwJzrnFdce0v
	 3lWT405tRcZ1jO9VwVg3lgLhhf2mRiKKlHPJBVvNofwVzGV/DWV6YBUKVlkVP1CzXaDwD
	 +438ubl6ObaD+miqpeVqSa7Dfvf3O7drANb2EAGXcrcMbI4O71+PV14aGlB+wbCMmIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A0pfUkfSu9+4b7u0lMR40b3rWHEvr3iCbrzCpdtLRdw=;
	b=trq40I161HAChqEUoHOd8IHg1YWzdVp4CkJcs+j4bxyIs0LROEn7pFZOLIM4qAoC/tOb
	 cnIxy4QbfweiKQTd5kx4oaY3l2qhdJ3LbfRfkjmdXWN1479qU0Bm5JVv96sSR+aVz9Xvy
	 KAdhn9OK9lDHi0sReUi5H9rn5PB8vU+BjuasXATtgBE7SHXVW+aK0sDHjJyAIwuJP61+n
	 eGkhf91zYCDeD1ME1VRN/L6OITdbs5Pb9NhZ6GEfDh3aph3TBf1Iq3zXtBjSvBq2rr7T2
	 5CQB2uVv1BSFrx10rn92wpSbRnoaRtylS6w+QywoRpQLxya+jbkC/A5EHss8RvvEGjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUKvQnDF;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FF9606A339
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74FF9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AUKvQnDF
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso6189388eec.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480713; x=1795085513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0pfUkfSu9+4b7u0lMR40b3rWHEvr3iCbrzCpdtLRdw=;
        b=AUKvQnDFpFo7qSL0nyxBNCRwtKVVPcdB98BfAreJmJ+WreD+VXcSORdynoJ0mGJyvK
         SBIwNTnKJqoxvtp/OrRmCsKEVTTmwaaGw/02Z4NGAMzIjAATeglbx2wbXR6DNBeh6sTZ
         QpmvIZQfCkbdh0Mw5ptHrhl3mYpakak6jk+FQVh3daMP/mcOZaA/Eoo4NCHkw0fUtcmn
         oFalHoO5JRoOZ4Y25jXOIB3ZN/PAgsrxzGidFt4hLWXrg8s5VIwmYVoyzjwZGhOnvO0Y
         Nw/xmq9wGf+UUl9vrqaVoJeteRP3BaukyzzH5qUsizc42ExKIYd5YvMTwpeMyihe+xXq
         TF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480713; x=1795085513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0pfUkfSu9+4b7u0lMR40b3rWHEvr3iCbrzCpdtLRdw=;
        b=ftb0qOF/ZftkXFNpHouotTP+pvKjICX1hSbTx0vhry5KGHxt//q+2yIv1Kzhof/yxU
         cZbE5MFZdykg5w5S/6tF+LhcutvMG+i9FUsdwYgskaeesc2p2NX3q9ABoT3X0BvhTszC
         lCp+Wl/2Q+udnRRGFurFNWU5fXfteaaBUrKDCgO9NcqJw+cHV2ph119YpXDzn2dsocnX
         lnhh6RpS4Dyn34/PLfEBoTGCYiYYojlY2+skvpb1QPt7FgNUKsxPq75mr2wMaMz6Ns+C
         i0GWEJT+6tWce5ZLF8ec1LaupTFIqiS/i8ZmJV6K9WbxjFBbu1PmALXfF9Xyy566SjJj
         fUbA==
X-Forwarded-Encrypted: i=1; AL+hErEtGp9ZoqCqpMZvyCjzueWdDaLWvaVrPel0xc6zG3Sk1aQUdcIrK6clG5hKt0dCLISESXSgEL/yc3e8Wg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/bbTB2RXskgSg+RW+kYsM6WgYCSeTRtiP2ikCFmugR9dSQgt3e
	CjolBvaj7b4HzOtpRoRXh6h4Q0fZl73nawEIqcsBj1SBktEFTNwA82by
X-Gm-Gg: AYBFou053qSMTs2rvlXAvHeKFO3T3hFuRPPXIvkvZ9cbukNAE0Br0yRuxwbqx6Bcpe0
	8iH7GYaL9geZ5rchDXJULqIaQutJf+fzc5krjDsiFs6kDQp4UUwSymVjEpn6PY9e0T1zD5Jr2iu
	4t4/QQl3w4AziXF638meivZlGFb9CU5yHYgyUAO3xatokmIx3uCnVBa9qCXaReZRCXJ+xf49nLk
	5qFTYSqwchBw6Oglgn4zJUOartrnUmPmsl3rAB2R4zHVCK+PuGMD30+2KhydL+bIATb1ioXy3Nm
	Ou6pkbfahMVRdRXtCW8OfBWd4UkdvKoyFtJHMeKcaPMtea8634HZCTjxrIrSB2w0IWs8YW8XO23
	Cv2tooFtXYp3hDjysPUCsfP63VIQ8iTutWTxJ1r+bbCS+DfsReYL9UqeXsgTwQf9hOIOZFIEN1a
	pbS/4ZzBluQqYBIJmXQ3D5Cey/fkJ3QNv5UBJ581wvKZCjUUJYah7TLM4N+S9vpcZB6iVl1iCov
	Fn6pvzS1WZR3h0P+FUIBIgaf0Kp3IbH7YmLYhbCjJbmXB0+zyj5wwey2JY5NamZZfIrxyT/9Pqs
	xfulU5BDm3fDKaUd55fILIaEN4P8oX3er9RFCgXmkYBW78RpDm+wTXUYbot/LCqfRwE/VPYG6IR
	GF2QX8DB5k7765l6jNvV56o5sNuQqKEaGucasnNQu32gh
X-Received: by 2002:a05:7300:d709:b0:376:37a2:87f3 with SMTP id 5a478bee46e88-37686b43109mr6989721eec.31.1794480713499;
        Thu, 12 Nov 2026 02:51:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:53 -0800 (PST)
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
Subject: [PATCH 5/5] ASoC: fsl_asrc: Use devm for runtime PM cleanup
Date: Thu, 12 Nov 2026 17:51:16 +0700
Message-ID: <20261112105116.32274-6-phucduc.bui@gmail.com>
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

On unbind, fsl_asrc_remove() gates the clocks before devres
unregisters the component and frees the IRQ, while the component
may still be in use.

Move the cleanup to devm. The action that disables the clocks is
registered before devm_pm_runtime_enable(), so it runs last, after
runtime PM is disabled, as in fsl_asrc_remove().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 48 ++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c97f814d7358..09e09164a106 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1258,6 +1258,15 @@ static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
+/* devm action: runtime suspend the device if it is not runtime suspended yet */
+static void fsl_asrc_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		fsl_asrc_runtime_suspend(dev);
+}
+
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1413,22 +1422,34 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, asrc);
 	spin_lock_init(&asrc->lock);
-	pm_runtime_enable(&pdev->dev);
+
+	/*
+	 * Ensure the device is suspended after the IRQ and component
+	 * have been released.
+	 */
+	ret = devm_add_action(&pdev->dev, fsl_asrc_runtime_suspend_action,
+			      &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = fsl_asrc_runtime_resume(&pdev->dev);
 		if (ret)
-			goto err_pm_disable;
+			return ret;
 	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
 		pm_runtime_put_noidle(&pdev->dev);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	/* Request the IRQ only once the device is initialized */
@@ -1436,32 +1457,25 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), asrc);
 	if (ret) {
 		pm_runtime_put_noidle(&pdev->dev);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	ret = pm_runtime_put_sync(&pdev->dev);
 	if (ret < 0 && ret != -ENOSYS)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
 	if (ret)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = fsl_asrc_m2m_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	return 0;
-
-err_pm_get_sync:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_asrc_runtime_suspend(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	return ret;
 }
 
 static void fsl_asrc_remove(struct platform_device *pdev)
@@ -1469,10 +1483,6 @@ static void fsl_asrc_remove(struct platform_device *pdev)
 	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
 
 	fsl_asrc_m2m_exit(asrc);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_asrc_runtime_suspend(&pdev->dev);
 }
 
 static int fsl_asrc_runtime_resume(struct device *dev)
-- 
2.43.0

