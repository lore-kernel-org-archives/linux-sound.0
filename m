Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B71FF1BF
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 01:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800378; cv=none; b=fXoOO/F+xnyBZfjzP+tfimdVKqzqNvxy9LrMwMRz0Ff2VGt3Q8CdqRUfozc3kkWNEi5QznQyyQQV7IxWlL0E6r7kGsFV8sFEOnUzpXSqQTGt/og/nna9qmLEju1Ds+svOrY1CIvYFutWFXrerUa6uS9NMcoKICR2E+vla2/dwDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800378; c=relaxed/simple;
	bh=6ffmg2XA9jcgewH/j6PAyG0UVV/H+4UiGg8CzD2bW8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pu848hipfiE7kqIWBDzBTYfqfSdd+0heCDVEEKqSQWDangkxgLnt3zJzxKBDlQWCDexEONFKeLtw8apYcQW1SBv4Np1kGhhfB+2mHYOs5u//28QtOZP3ZTEasWgQV6oMWpqnnRZTh4mAgetkXUdWLoIdPFBIzhxkGO/wunx5SNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Znpi7wxs; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Znpi7wxs"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42568669606so2999495f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 18:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759800374; x=1760405174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J22zbKLN45yOF238j0MViKbz+/v5EiBK0GTdWMuYd70=;
        b=Znpi7wxs2kbcUaWQ+jFgaL4N6Hn5p5tavSJ1MRaNg5J9cMW/DbqoHQe9xUFgBkWwBh
         +21cE3mbGYvS+tU40+98yzwcaFbC7V3Gfj6qXrvqB5xmgsxLD5fJu0/cfMrXu+dBgujN
         Jt35kOvL26skg4cI5BxJ9rfmwlZ+7y150E3XzlhvJef20ITlcCZztJi6bykLFj8tJdR4
         1Kt8DHDObmq6vQauBgEqcQ+ncdxtnVvKmPu7WA+RkrAaFkkBVmFKF3JV0x4uMKmG3ok8
         rUrcr959dg4qbaQgJYIf08Kj4YtOW6LvYJA2Np5GbafOMdc0kUGZ+jJg17TxsDAUKVe7
         4KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800374; x=1760405174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J22zbKLN45yOF238j0MViKbz+/v5EiBK0GTdWMuYd70=;
        b=QS2LLm5uEFbs9iDpw9ktst9Xk8Hu/hIpg4/OcBnZgYU3SYepD4Z2pDa0y5vxMy4lzT
         3QNpGOUg+PV/sIlS6iKdSUIfT+uqOAUljJDA5pkiWan1I1O0JMle7zLkRLdMo2KqGxET
         R8LdxsnYc1YQnhOf3vLCO1ZX/eGD4ngTlrivAz8n7Q/Z5fPynJtCEgQwJ51uyIDz+jd2
         cVlz9od2jte+ag4eWkUSQQbafztOCPOTxVne7O2Ts49OaDtKONl8bWW6qZLo2Jqffmie
         LOsUUmLOg4ipCxEIZPMYhMAw6xeuOaiH8NX5qqTy3imayKNThSJk9Ov5EfjJVUmwDvp0
         Sbgg==
X-Forwarded-Encrypted: i=1; AJvYcCXYC9oCKNJTIYOnSw2PSp8dnHJez/SqKWVcVSWWMTmxY5VKkGjOIKywQfUC4prwVVpklYoMCCL52xfKPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ypBw2B75h/1hhPgXawc8Ez7BApj5VnlIlhqveYz6sGgC/YuG
	XUkHSD5wqSa4o35kv+NHUt0ntopRd8HpHpROMiUXox1tEcBNikK0ZDTZBKQuevKOmBU=
X-Gm-Gg: ASbGncuT+csr/W3GVOCOk0sFrpB2DvWa1QGoHIjgUs7rbrGyz91fcuNQ/G+5IGb0btW
	Flkg8wMRZzyW9S5vI843pDMeE4Cq3LxGXkbD3PFtir5xQTBRvQC6JieLehV2rJE3udkuNbIKFPn
	tMUJ4vRH35gyirUp0WagLYfe+eDL3m3FyNGGdgNnRnFeSpZ6E1uboYEXq65S+GWZS5FHU1cCuZg
	NznEVE8D2gfp8YrogO4fSlav4wkt7GjfMjk29qb+8eGNCvomCsjP4ydAeWAmhcoqcFJbaHeYJeo
	kfLkTXtQlSGjOJZIGu6JKyczZ0jeVeOosa4FVqFfSFRTPuy8hPMix1piyTaBx5hXgN/H+3Q7526
	p9Vn1iXln+aiiAETZpkgX1WQJYeHHpRtcBaWGt+mWt49p+h8qpO3m+w1XYcCXTlKaj5FVIaOCLO
	QLzw==
X-Google-Smtp-Source: AGHT+IEiz856XiSIMY0NkShrDp6YxZCYEJvBvhcMBG4LXiiI67BJKwpsD2QzWSuAygSdYHT/mIao1A==
X-Received: by 2002:a05:6000:2082:b0:407:7a7:1cb6 with SMTP id ffacd0b85a97d-425671c612cmr9480955f8f.55.1759800374073;
        Mon, 06 Oct 2025 18:26:14 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa2d52a71sm7410915e9.1.2025.10.06.18.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 18:26:12 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 02:26:08 +0100
Subject: [PATCH 2/2] ASoC: qcom: sm8250: add qrb2210-sndcard compatible
 string
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-qrb2210-qcm2290-sndcard-v1-2-8222141bca79@linaro.org>
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
In-Reply-To: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add "qcom,qrb2210-sndcard" to the list of recognizable devices.
Use "qcm2290" as name to let UCM to use it later. QRB2210 RB1
and other QCM2290-based boards can use this sndcard compatible.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index f5b75a06e5bd20e00874f4cd29d1b947ee89d79f..bf71d9e4128873fd956750e71311a357d60099a8 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -210,6 +210,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
+	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.47.3

