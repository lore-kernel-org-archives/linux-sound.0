Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD491F4601
	for <linux-sound@vger.kernel.org>; Mon, 26 May 2025 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252838; cv=none; b=Ue6dr4SgQKDH5tINGG4UA+dDZj2OeWS3PyHA+gxlHSGTPIvoXKTVGtpIKaUomBeV7eOEcgLotHtmy+DptScE4q3GROJxSAL8qLZ1EabkV4gjPhmHAJl3nBxVIIzaDEZLDe+gv96K1qbu5iMaITE4jaX7vcmCTk53O4tEe4T8NUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252838; c=relaxed/simple;
	bh=JFqzsTfm9DdoRKLGO7u+iVRbtQ2IB4LCND0J4CbvlC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1wjUKq6sxQ9C4Yvs3RmZfs+ZEfsoCTu2q0DNQlBeU/eC3DIsyi0SWTjsplbYTaKFVk8dlO7hj95260g7d1j87p6kHOm2SvPzPaqtGKFHeLNoDB51k1mNrPdR1qVZrzCzBvfX2qwyLBzzGMIWR4qScCSB09eQeCU6Nna+WYoolo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hN62oGW8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hN62oGW8"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60472d90787so207443a12.1
        for <linux-sound@vger.kernel.org>; Mon, 26 May 2025 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748252834; x=1748857634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSZZR0qMZkVAUpEjFq17SeucbREofsX6jeLhn+A+x9c=;
        b=hN62oGW8jcD5k9dcQnE57f7awlc/z/N01Xa9aE4iCkblAPmUKbxW8+6SSqD05N8o/Z
         6g3pwrW5guDhwaLhVbqEvnd8GPyJYf+FdAuiVrNIh6BPuZXPZdtrYa6KBfXuENIDrTxL
         LtLXqD72FDqQZpd0sqSasT40VyhaqrhhcjUPS2YTMbns6i2kTtk6v/mOQk3fVF2RThAs
         vGEB95PgAQH2qWygttgacRM5fIQBg1FhfIfP2O6xPDRNCZzUbPoAmBvz0rQ939IxaJO9
         L1DGlTTiKC0z+k4+uOx1bJmzCWF/Di5Xez5y1kKno2XFzw4eMYWy7paOODw5m3nN/c7w
         sN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252834; x=1748857634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSZZR0qMZkVAUpEjFq17SeucbREofsX6jeLhn+A+x9c=;
        b=g+fLR2B0OoyLzgwx9zZgKjKH2+66W+u7H03SISkiPgR3hzkUJjU6OWjRr1t3cZ2lbz
         znEZy0U+RFI8RduTYckCUmF0aT/Dyx2x4+oEoHKEetxypR3MmFsXII1h6BA9MPEoQGHs
         QZ9qHKrQbsMkft5SnWxt8sQoFgdoE4PtVPie1scY8pJDTLWwmSi3EBrV4EjNH4lNGaip
         tmKmyu1fGD26QG/WXVaAJvQYBEN1Bxa9942tIO/HyUgfZCEJzaWoMJrlDOkrz3vEEUhF
         c/2IbWAeZwsmOpzqhoswO0c5acQU60patTMNvMwJbBqoWwo+nwxze4ymWn0/KwtRZfwn
         iD9g==
X-Gm-Message-State: AOJu0Yy3/85ZqUCuO7s3DWh52XyrAZmoNjmE3nv8QINlEU3vkJ07WQ3F
	TeBSKVdtVPBUhr+4wxtSlw4P10CVQjxW3JyHwTfCPNonyDrGSDJSuToLNXyF5MpU+i0=
X-Gm-Gg: ASbGnctIG5IQWG0AkMeEvQ+p628dGl57tPVbiKvA1wouwKew5mX7zOodInZr8FGYvs/
	BwsYV7j+h32V3DasIiPe3DcxmItfjE1jEXzWAOSrbyXjPk2h1G0UDVz1KqVbMx093V6wPdwtCKr
	X4yAJA+AgSyn3l9BS86Dwysld8M7xv0+2alMrS7lXDFu9+6TCDFURj9QBJlY3DIA15m4GFyKXDg
	h6S86LXsoXBo99xxl2v4Xzc5SKovEiBqoRu4ys5kgoCQcjDrHKjV/u1SMRE6ZFbJQwshKMsJiD2
	HrUTzKt9K8dHKb6C6zwjKjYk+bIl7NHmshDfrSudNVmsYu3Hf6XKMfgrKghIjY/TqPLa4nA=
X-Google-Smtp-Source: AGHT+IE1rLSqoI6VnW/NLYoSivs2MuuZWDVumnm9UU8M7AtHBTKkJd/NjnzZ8iSRnfZzOFIqVY6fmg==
X-Received: by 2002:a05:6402:2742:b0:602:a0:1f47 with SMTP id 4fb4d7f45d1cf-602daeb6a85mr2510849a12.8.1748252834261;
        Mon, 26 May 2025 02:47:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049d482cc7sm1486427a12.19.2025.05.26.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:47:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 11:47:03 +0200
Subject: [PATCH 3/3] ASoC: codecs: wcd9375: Fix double free of regulator
 supplies
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-3-0b8a2993b7d3@linaro.org>
References: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
In-Reply-To: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Vinod Koul <vkoul@kernel.org>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JFqzsTfm9DdoRKLGO7u+iVRbtQ2IB4LCND0J4CbvlC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNDibdl94YMZwfVYjatgUDK/f/MsGw7A+4YxeR
 4h2FKW1fSeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDQ4mwAKCRDBN2bmhouD
 1xdCD/9vbaZu8P3oo43OAFrxr0vkTiREG8aTp5vpTZPLskJ+htHbnhA044cu38T+qsQF9RQc34s
 MH9ZhhXXdTkJPECc+RyRkdOO6CV41gQOlhzV8ucdoTYo7EBwzHXx9/QkGxcFEU6EJH278hhCBfG
 8SEZJdrdNHri6a2MavtaOl3ZSaTkmJZXfM+wT8hiVYi7Cc17b4ZFpH5IyyZg/UczuXuCu8ghOJu
 GAaN+AqBcxVtOVGR2p9OLksELtTp5ico4csmbo/fdx/jNKa9VcxKfq8jseZSFi/4o0mf5rI/c3t
 uUwWjes6UcL6Lumzlh1pMm5I7+kjY40avjkF2POvtPtN85MuwDPqZCI2RVA98Os1YlvR43YSs65
 02JVU7LboKXWH5cmviFsAHsdJJT7LYW+AYMBK7VVxjey4cPYvkJ/YwBZ1ywIOLr8Z8DbTzYotSS
 +L+9FQtWWS6EU8D09M9A5rOh8bqUT1Dt0nDwZfArDBvTx2Sl4QUJlZPGX/QawbtigbAfdI0CAWu
 eEfou2JRH9F5d7Hve/pnDQSGrAKxqwfdmC3wCDqBvq9ng438hcxrZY1aM8gVde6d9rkb9Z28Kpl
 AZFaVOu0Nulq9n3Ad0lJqPqqTGaxR4queZIllBjl0EztEW5IDmYw87McvXlvQTdKcqS+ToPILj1
 f+4LnRh+j9PDAHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver gets regulator supplies in probe path with
devm_regulator_bulk_get(), so should not call regulator_bulk_free() in
error and remove paths to avoid double free.

Fixes: 216d04139a6d ("ASoC: codecs: wcd937x: Remove separate handling for vdd-buck supply")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index a3a4b1f53e88e7ade13455387a65de736b1f0bec..b9df58b86ce953427e01ffb8c7eb7e52f9c2392a 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2944,10 +2944,8 @@ static int wcd937x_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to get supplies\n");
 
 	ret = regulator_bulk_enable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-	if (ret) {
-		regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
-	}
 
 	wcd937x_dt_parse_micbias_info(dev, wcd937x);
 
@@ -2983,7 +2981,6 @@ static int wcd937x_probe(struct platform_device *pdev)
 
 err_disable_regulators:
 	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-	regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
 
 	return ret;
 }
@@ -3000,7 +2997,6 @@ static void wcd937x_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 
 	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-	regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
 }
 
 #if defined(CONFIG_OF)

-- 
2.45.2

