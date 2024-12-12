Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DF0288DA
	for <linux-sound@vger.kernel.org>; Thu, 12 Dec 2024 00:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733964457; cv=none; b=gkxFGuM5K+q0TGS0lxKENiFlK+MoRE1tbNgZlrmNIWA1FlxdFq+byslS0o3EZmUD0EbUy/zQCmbXN665R3D/c5fTGW8aHMKoct8R/zKcZQADxfcfAglulbFJ3+EVSQmp7MtU8dR3QrObkocTLJRxbnmrjxNwSzLj1iis1vpJqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733964457; c=relaxed/simple;
	bh=gI7279BFVBU24wfEPp4Je1wvSfa/qbfIzJF36p2a+iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Re4OFblvhLO6bYI6u5wCJNIq+VlTuBawgwJEfOjM9Z7b4NNa8IBURMQrvq48ZvkogE1yJndmAsvYc6UYrLHEcp75jZzsqizW2kfBRrnPhCumHpqOM7FjiXzW6ufBQw6X4ar/QeYXhr8Sl1Pdhn86Qf71OABgGsbeVHG2QnSKeKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JaR+0hBT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JaR+0hBT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436249df846so224265e9.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Dec 2024 16:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733964454; x=1734569254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mDzWrPswVqL2jIJMPNBr5jz29qiE8AhUOmE7OcegD8=;
        b=JaR+0hBTtMGmbIEsp+WxtNuDFrT8Kv9vNaNG9AwbBP6dYXDXZabiu4B5KFqzDTAgED
         /NnLUnDWHp5+dtbv067qMk9RuA3t3Ft2EljzBO846rJ+xTctrbA2hHOHpLN1vuf/pONX
         HR64ldA6sm9vI41rKCy44S6Vs31LCU5Gf177isG3XUDKny9b1eJbU8FGu0xIkc2X4Swf
         x4U69Rmj+J9cxogf/iU9mQ6P6JPpTL/JY5ICHJQcgKp5ZlCCt8SWHJKaUcQoGI9tzcpG
         8govD1HvrpuvkQ/biL2e3Qc0wrptgCLzMMZhSrGN+smg+UFXXj3hZX6P2dBNfrVAzWzY
         M2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733964454; x=1734569254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mDzWrPswVqL2jIJMPNBr5jz29qiE8AhUOmE7OcegD8=;
        b=Wc7/xe+ma6ATr2JdL8BhNXDMZezgRp4bo5bmp5pT+pb+4Jx3z+sk0eW/T/FeOxlQhZ
         4eqoIKE7uuhXB8Yd3faf4nLsZVOnLVKBufLFgbOCYG3JlvghRL2AResx6rvmq+EPEFon
         sIZeCHW3abgD0R8nUfDNzOdlDorRVz3nUGr4gZAEYCIZ6LO1QttRWl3wRuWqxDrRAQ7w
         HW7OktsnYHkL6eUoPKUy1jCmxtIaXY9a6eLr9DJ8Sm+dcij0WbJIjQ+2BAXZA0Wlv/n/
         j2DkYtg1t+ScrE36P/bj6IgDW3+PqaaoWY4DYlzBdhjBe2jXUaL557M3p01sym/VrOHO
         km7A==
X-Forwarded-Encrypted: i=1; AJvYcCWAHXywz21rBulR26P9Nel87zZ8DAx8tmVKlx6phr1T1GvEDU3+jYgCn3WDMF1bSk1IEViXKlRFRffcWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzvod1h8c3/KBVY62nCe1epbJhz0V8QbpM1lapZ37v4Wd7lB3w
	sssbssqEuRg3G5phnziD6Q95j0bFZRpQg1566vFAIR1sNPfsX9bMSPliWR3B8pQ=
X-Gm-Gg: ASbGncvDlEbp4BXw+8O48hOCuWFHYikCgMcAMcmPysV3IOtCrVXNE9fV3T8wqcLE4hO
	IY9+Cn1L8C2y4uYbg9ty7yjiUGd6WQyG8SRwQ506DkgzN5Uvazyr5cgBpcWKbOOLaPiMm4n6TOk
	S2G6VRImNkj0E0yBMlxJVQVjlsdQR4y68qgCzKTrpg59SX3D5xf5gFcSwRgXky3nC4KNCo4g/BK
	Buv85RssZxPnh4G1MBjQRecHbBiX/gVIlwCiEmoGhj1DFELx2WJmxm1BG+j4+ZwapSzeuYh
X-Google-Smtp-Source: AGHT+IE7vuVokWsKA+OSg/kSc554NchXd8bbNr3lBMdwH/A0uq3kq3gqrXVPdiGpvQAMDioUQZG3+g==
X-Received: by 2002:a5d:584a:0:b0:386:4a0c:fe17 with SMTP id ffacd0b85a97d-3864ce602femr3957618f8f.27.1733964454139;
        Wed, 11 Dec 2024 16:47:34 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4ef4sm2459660f8f.39.2024.12.11.16.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 16:47:33 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/14] ASoC: codecs: va-macro: add sm6115 compatible
Date: Thu, 12 Dec 2024 00:47:15 +0000
Message-ID: <20241212004727.2903846-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241212004727.2903846-1-alexey.klimov@linaro.org>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vamacro compatible for sm6115.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index c781da476240..443dd4dd9b19 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1722,6 +1722,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
 
 static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
+	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
-- 
2.45.2

