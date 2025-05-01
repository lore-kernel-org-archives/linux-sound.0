Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E526F463
	for <linux-sound@vger.kernel.org>; Thu,  1 May 2025 06:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082161; cv=none; b=Of21ULjdUME2O6GSdNnvrUiJuNCu599rODx/8cNY0FzLwZEmasdnRgVHw7VXllTvkM6wuV+OSZCR4JCFrktfI+Cult6aRaN0FGCKWVqbp4rk/UiBi3X0SUy5Fqj0VsWFipw8DJgDjeafd2dBAwIzMV2TwdA9qdq/qspGRwIGz2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082161; c=relaxed/simple;
	bh=j6c00ET8Nxx+FPWVkkikQOyolQ/2oogumLYl1rwobr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aAUm3PJGqGu6OTM2uKFeP8smAGC2ylueZkOHOHuc2BVQB9o+m+3a4zUkhm4Ty5rig3vKSQBAWk0MrYeOJJI06LsF8viEIxaxSrhq5veDbnM5T6Udo19ZQowLNIp1wlo5W9yob0hju/A8FX38JWKIsmazu4W7VHQ2icGS1Fb/Ono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=NkvQCWE6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="NkvQCWE6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac34257295dso97847966b.2
        for <linux-sound@vger.kernel.org>; Wed, 30 Apr 2025 23:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1746082157; x=1746686957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lUWQcPoDjPlS4TbnEJ+VKcF2YrS6UcuvK/GRv4EP14=;
        b=NkvQCWE6QdxGUOdyFCgTLho63TOEuRrokB/EvKZ1f5PyPzP08LKxXq98axHw/ek58U
         e47GM/mvup5I4yG9owU1t2oOBJcYWXJ/MfMTu5RgQhO4Jvtc7MS5WRwAxnRU0egNAAsj
         4b68VnNC/rtgSWl3JyIu+1ZT6BoxDVhP8Z49xIu9PJDaffBuwh8LfP6ODkIG8FZ5rQe9
         8Cjo/IqoOnh6hgxyFPNGm2mCMFPoo+Oqdunvxe6qWdwKTwRZa8YY2VtQ9kCg6Wfa70z2
         awqrZUm4gHGTCcQFrlMFJOOLOTlRo+y4JwMALOTlmLQFmDdrOVx4rQViBI/TgKRgfj6Q
         pJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746082157; x=1746686957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lUWQcPoDjPlS4TbnEJ+VKcF2YrS6UcuvK/GRv4EP14=;
        b=ieo8GE4Q8boyOxQa8t4U/v14gsLDdLnWhM6ttGTpy6Pa7Wv68vTlRY4JYV5sOaRcsd
         Kz8cGqogRQN/MQeBNZBLbxhPfa98QErRCIzA2l3qKvTrxjUcW+LvbqeJVJN/SFad4NpV
         cTNh1s1HRyGZnNrc2GHxePlgIvhrmGM1SoNBvcAE+edZA95a0YGX0M8shwI/o287N+d5
         cdOFjAJNgPAUbUV83vWIbFvnjJQVaTRSNfd3zzCf2X5UQHMyEk7xQfG3NL5OPLYfajxg
         12I7GEIRJHFOH1FhS2ClBpbpffmOXH1q/633nyvjlpMBQuKX9NMdPyat/OppddOzdDIf
         Tyew==
X-Forwarded-Encrypted: i=1; AJvYcCU0mS4mBgPdMYvieI4PC5i2SxPysrrqIH+lC+HlBFuaT1i7bIgObKt+WfA1mIfQTFPfLRBT/xJ0HhRTtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX3Kl3oQdbWAAIgIfIi4VYfvdQBboLBL/UxPejs9an6Sjohd8f
	GTZl+XtOAmEKjFt19cWG3Kr+VrpA6YNMG2MOorgj0adNvVfQY4WQGEiCllZHbKxiHkTW4RkOrwN
	t
X-Gm-Gg: ASbGncveHNV/nkojsmgSt+Yl/YqXiGoc4A65aT4WPIdRL6KLkJPFrY0AdtJv2TmOW/h
	yc0LiFsYV1I7uHKNSVYeWI8v29OvNmmdiyfx8aHEvD4mxHRKK8fusoMETkAfF+xBsAELFY/6qtR
	ROBfjlPO6o/Lgsjaf6S29Gbh16yF+J0VcsYjZAAKqo/2we4LA3a1UF2y563zKDqlib6JpsaQQpd
	uAjjkoe9iNuBL+SZe7MEhGPfIV1f/4tRh3P8wV1Bwj51JjAsGyCFWX2PG22NNNyHbCAGXdG0+AZ
	Xw/zWzb7JH27KOYRfzvIg1H2b2efuCbv8HMrcHzLcKCWMgWrckDTMxXbAYP13LGlXV2/+kwHrA6
	xYFs=
X-Google-Smtp-Source: AGHT+IG63RNYN4HNO9Ko5hFY2UpicLAgom7xY0lbRX66pdh+OA4P68D6+HAwzHg7Vtk5TsYdejiLEA==
X-Received: by 2002:a17:907:d0a:b0:ace:6a10:6bf with SMTP id a640c23a62f3a-acefbfa083cmr147786366b.44.1746082156726;
        Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
Received: from [100.64.0.4] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8cc1sm1005486066b.89.2025.04.30.23.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:49:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 01 May 2025 08:48:49 +0200
Subject: [PATCH v2 3/5] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-fp4-usb-audio-offload-v2-3-30f4596281cd@fairphone.com>
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
In-Reply-To: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a compatible for the SM7225-based Fairphone 4 which can use this
machine driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 43c93e24d77259f232062c7e4182a39151111c59..0025c8957abddf54d0aab6eb68acc79f031917f9 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },

-- 
2.49.0

