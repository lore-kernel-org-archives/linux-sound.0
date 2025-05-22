Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5161A314F
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935663; cv=none; b=d9v5N0xBLG1cNos0gutlGLwoDjel8MsuSJ4cA4HWpcBTOvNMQuM2RyE2HIqL06UqTICZGImYx5wVjC6+QzbILe221R0Wi5rX0WoruM9yAY4/l4WMRa78twxWxawn0dUT+22IRdp8tAi+W63nsPaIm2IkaHxptVz/17FX661D0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935663; c=relaxed/simple;
	bh=aSSdjHrrQmluhjdKxBq1rycaxTM3YZu9EjkuFLbPokc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UQuOrO2/t6hUzbNzyiE/A+0ju8b+jbS/Ul1kmXXiCDfj49bpbQOkobNctvr0MyZcxv58Db/NZJ2AUE+L06TLZctvLtPUP3OhNDiP48WcZ6pYidmKiCwRj4rvVQkxqrNi6CWWdz04Y+t/7Lq+fUqWS/Judg44XvqleJjwCQLKeZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrAwFJTM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrAwFJTM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso58421955e9.3
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935658; x=1748540458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rug7xCiRe21CglTuJ62KRbiGHO52dyiYXtq9MKbjX2U=;
        b=RrAwFJTMQLocOma6E9sQmzbbIAxNgpCghY4qbNMVZz9kuabuOKd/c90NApiTYIArgx
         +kr01kzZMFtydwrFVsn9gdp037xDLrJ++0CA+rX10bHRpPPkcf+sBH+fRQr+axOSWOra
         S4BP/ydc94WSRqVXtjPtFlWY7f11EN1y2Ot3Ifehl0vD+qkj+3jwXj7j8BxqEPhfgi6S
         gM14EDdgb8pvwYEYsNciqtcIwvKuRpL2KWuxYP7JgQ3pOKTFCsuHtxY/NuxJKtlaYy+C
         /s89KhRxFu2HvtAperhHs38z/AuJ4qp/KgzgJ8V78102pCSCmMOBnu6NL6mc+skprQfV
         kxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935658; x=1748540458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rug7xCiRe21CglTuJ62KRbiGHO52dyiYXtq9MKbjX2U=;
        b=wqa8oFqr2DX4LBxlvEOv/+ora9tCkjS+b570mhDTadDGUvci3yT9UCLIJKwjwebd1T
         ei0S8lGClJtKILP3kJgm3Mef0eIJ0RpkgmAmHkwiZKhrwCa5tqEAm+BF8ese2keKzrxw
         uwTgMlJqhrhs81Sqf0pbf4yhf4/kVh93vtXTn4D7DpNQyudNwrlVjSMdRQ7NqzyTCc50
         Qb4Ht4vdJrB1gf1NTtX5Mt5BXhqHoKoNCX75E/fw8hChNjlutYx9CRqX3/bz2UbGH8GP
         FEWpLqs369ZRlph5jIwm1BQYofJy93LSOPvIRSGytxtxTk9Jjfso6UXzP1DafddznNgM
         OSgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj9MEqazmV5qYtL65GKfWMS6fcoDEg2GP6enmoaa9+CylVbUuE12kODtO6T5uFdHMOTTfMk9TXJ96PYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yytc9QbvdvbEhbzLVweMqf1m2IU2vwZvJiwH/vdXeOg95lX7ica
	lsTa8Wfre9IJ/Pzhx+5eRbXklS/Q69yMp5Lq2jRgJq1Eu+TaLZKxEB3IMNMVABx+j5uMC530RNK
	GYzSq
X-Gm-Gg: ASbGncsbD7eINE480Q1l82bf1YewxwpSLrnbvF0Dm0yiOXubnyXjptq+cRjJrkQfSOz
	xGVi8NhLFjm+jt9qD/FVkQsaWxYXcVyHHdgqtdirykyz6of7CiaG88oWiqXPkdi2/eCFJpD9s8n
	Fo/JnNG+ZoG8erlBhrrX75zoAGYHrLFQMRl1j/yYHGihu0wuDKYW9gW7/PSnG3mR/r/2fKUT81J
	wKZmwJIdS0bqxREXWmbXelcP7jQyswJe/31YXgtX/kRAHK1GNyGEU514rq/6d3uUUm8rMwtgR7W
	TyNmD+oncS63C0JVJ1Rrs3P3aT3m+etHK3sN68wqr9CVQz46rqWgwhbzMN8=
X-Google-Smtp-Source: AGHT+IEQ6/iKMVU24aJMoLqOXxLbhZL7C0KXFrDMArF8ok4GGZf8FXJBiXkIhzqyqj4QCOms+GXpzA==
X-Received: by 2002:a05:600c:5305:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-442fd62733amr247120525e9.11.1747935658292;
        Thu, 22 May 2025 10:40:58 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:57 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:54 +0100
Subject: [PATCH v3 04/12] ASoC: codecs: lpass-rx-macro: add sm6115
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-4-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2

Add rxmacro compatible for sm6115.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 45a6b83808b277344f17d35a70cd1e3bb89cbaea..3ce7ad758df9fb0b7845a1dfef46cdf0ecf3b8c8 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3946,7 +3946,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
 	{
 		.compatible = "qcom,sc7280-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
-
+	}, {
+		.compatible = "qcom,sm6115-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8250-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,

-- 
2.47.2

