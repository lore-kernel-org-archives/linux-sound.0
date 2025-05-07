Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80703221263
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 08:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604933; cv=none; b=lZo2yrxkHE3kMNk8Wrq/PaiIUTH2k58DsqjV/Ixzdx/kzo/Go9rFa9Unfa6XdN5+RbwO2JI2dwz20YclvW72knxy5xwcdjjwugBduWHvK2im30KL7yqaAmExSLlcU/5wCTRTQS7lIa95DIFdbU21v9PonVpWA+uGf3Hs6m54vzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604933; c=relaxed/simple;
	bh=uXV98Zrpl4il+ECjXyEhMPhF7ON9sgsXksffGaRdVHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TD4+4gJeiAhZLu3kTWNxyDcStlZfAPxYN60vmW/gA8z7drj5uuyBGtabgnfrHbuRAZ0HxE4wxfasVhcpEudw1WCRECGpRBquWum2ptKUvssfh1RPneacgS0LATRzd6JucwhuVi7w1cokcV08Mx4JHqWHNn2Ihr2dBskTll15P6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ko17DMo6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ko17DMo6"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad1a87d93f7so605974266b.0
        for <linux-sound@vger.kernel.org>; Wed, 07 May 2025 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746604928; x=1747209728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdSfmOpjUf+n+Gt/wFek20I3+645i1PcH5llUxC+XYk=;
        b=ko17DMo6O+JSSVkFQO3Q0E+eIKhkfFGP/URYLW+dNHcqLVoH291C4djxftBeDjWJmj
         A8/5L7gZc6r/6/P5zYwjUAAf1TVd1TdRpHgXKt15I9stZ1X0wKYNkm8nXHVdC7ONDZ3Y
         zFpHFAG04ZIH52lEeK+iF2AnN6GuFPBv+xoRve+62/iLuZqNDvJwySGD/PumPWCSqFPA
         M6A8K6jhseTDOJn80AQhE9yvjnuDOSk6VtpU3ebQjirBjMq/CztibZTAmjWovWBoXdxs
         FPaQvWmPrarAHALQAYaVNlD7IPGRKoj9zkdErp/j1l0zZlOiqmZXYH0GhfcE2LNp1hfX
         AsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746604928; x=1747209728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdSfmOpjUf+n+Gt/wFek20I3+645i1PcH5llUxC+XYk=;
        b=xVHdAHcESbsvqPXrhblrIAcwU4HF4rnArmLVUIs7+9WPmm/pD+cKSwE8CvFLpXpyp5
         fAghGwmLHtbDKZRNPcMtX0SUIGa4Ltk4She282/ISNOW0yA6uQcPJryhYn3jFEVpOdYb
         FP9/64GQVidi65TKWYVaEe4CR6scgaQfv8D2z2XzqSkkjTb+CDNxa1RD7YTgqjTRdJ4W
         +3YzpegpToKn4U8KOxLx/0VnLUPvwMYMS5u03YISxs8jiouVGftz/QHVzq2TTLrKvOkm
         0oon+8b6qhK/w1MDMoDfG6AmCz6ELrb58BL6ai2cJKrK+xJGHUyrj3NQ2Rjgb0K7BhpR
         SlGA==
X-Forwarded-Encrypted: i=1; AJvYcCXdEmkLyePVHSnhhphzk7TpmLhRWM9LCfHxLWsOsC1tar6oiL8IpXCsl9NkzFsjjF7H90Pn1zhzd0TVQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMVq7Qz/Px/PkIaR9f6wzDn6qYKNsX7WQZBnvdEnrjxixJ0QmU
	SX/4a1csny8ebd4TvZZRVIZKpbV6apPnY7C2sLk/sVH0m7lfqnnvCUOAifrtV1c=
X-Gm-Gg: ASbGncvB6Qpzcfm0Of5cLNsg0Ala8uC1ZUSplEL+xWZ/KSMgNZm+g+xHJDVCqQU6U7V
	K/XE//kU72Ci0Fk+gNdbRhPijpcoqXsz6Zp3Vw8VAXr0VbZQsT1e2fRKtHDcLRtUJ4E4GJQOX0S
	yppRsVUR1SPH0/BW+HF/HYCioYqyqT73NbnGsD2FhtzEAjJZ1rpJO8humZ4uGjvnfqdw6dVNZ3L
	MUHtyH/hDtQ7fcYyGBas//snVWDIn9TfyS1aOv68yGrBQIeNkEFyMGy97ze+LquRQRTI3FdBflC
	F4mcz/ru0YmMRqCnk0VbWnO67MwK2xPTwjRNXczs7QBYHc62/yZ/j93dj31OiE+YCa3hEU43MBY
	v9OXFYo8mJ4A7Rw==
X-Google-Smtp-Source: AGHT+IGAPRmQLx7xnwBq815f2zYCjZM2sBf1I1fFBdjt+vGkM/lX/FAon8S0MIUZj4B3CeheWCktWg==
X-Received: by 2002:a17:907:6e94:b0:acb:5f9a:7303 with SMTP id a640c23a62f3a-ad1e8c93689mr249348866b.35.1746604928202;
        Wed, 07 May 2025 01:02:08 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0310sm855236066b.88.2025.05.07.01.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 01:02:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 07 May 2025 10:01:40 +0200
Subject: [PATCH v4 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-fp5-dp-sound-v4-4-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 2317fe285ee7d41689d7fac453164fbe706744ff..69c514fad0b1babafae4b61bb5ac944c6b4906dd 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0

