Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEB1277029
	for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982048; cv=none; b=juncjYxVJO1lfAAi05bH9y7vkL2RUnOPjVCOK4XO66+81Ucj9rZo0XtfMo2BQS5YMty5RY5vkHkg/+ZA74nSWnpW1jAEWE8DdGaTPJDRWWYO4PbaBjX111vcGKTSf87dL1eC0pPVA9lBiYIdnRtkKOk+nQ0+ekw2RwQntZrVMmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982048; c=relaxed/simple;
	bh=m+PMYJAHzPiWvmBUN7s4MjbXhEue3cg4fhj99Fq5amM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Au7Gy0Be+7Yf3IU2KioKok5wPwiD8mi4buIXzEpzknqGNej9W93IT0SXTaG6i5+e37vgzc5Xq/pJSW9+io/ula/qv3d+sz/ubqrICCtMrJa3rkK5sg6X8BAQfIUb26o4dDVaD8op83jhwKIoGgs6pWaJJjQnvNCoNuy4Bpijwnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yO989wWw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yO989wWw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abbb12bea54so284575566b.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Apr 2025 06:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744982043; x=1745586843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCvYbcr7LrU2lgzZsZvyD/7tb6wHoKL1gjL7KsvY9pE=;
        b=yO989wWwaqXWZeANO4cgUBdurOAAhBhva8LIB/3AA0+Jo+/sB53Uf6hbkPjvq38MFS
         XYmEfeW5MBr8xpvXF025xW4ld1DEhVnDDM1/pbDq3sOhetI50ZYISVnuus0KfQM7NoGV
         RA0cwdiUPZEAwfI4E1FRTcOffPqOGC1XdDwWloERpAXwGRqfKDGV/TClbCTjo7pXlfAk
         gadrFufbSHXj+1MvB99P0PmROMvTlYTGmEy/mP5NxbUTHNk429Yt8PZSObOmSZqFzrPk
         nFEqrlRuYuWcwKIQCt+WuSEZnTkfoN3SQGq87gDq0nqwUVzaYHQsI/54C/QVwE1Kr0GY
         T0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982043; x=1745586843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCvYbcr7LrU2lgzZsZvyD/7tb6wHoKL1gjL7KsvY9pE=;
        b=dTOrrtd8j7MyqjDpKhJPCwsIEI7dTCv2miMDNN1UxRHGMa+k+ZytDxcuUAISFvgNUX
         cbn8EHA/EUW8nDeXlJYR69zKCzpZ5dkCc60O3nmKP3oe55BjM1E5TPce0hIVTK7+du7X
         LZ3IXMfhkkrF8CfRyYqR9cVt4EX30g8bJWD3ySu4MGlHFEXNNqzQ/Z/79wxdO0xCbHgL
         MKVTbd6RfHJkNomlbGRV4uwBQWiwhRakqe+IXloUCquvkz9skgeD+Kg/Tecyd0fwjjwG
         jPhcQtCGdcIAQ961X44JozDQIiRBsu/Y3uFIXYik9y9FsOwK/nIrdYSZThd6nv5dm4J/
         L11Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtlekGEHWgUe9QEb52LHXG6jFJYOyPNulxu+ZKnRhKAMgBzXNK3nqpVPI9GTM9UqIY5Z7VMN0GBHUBBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAoGkTOB2JbZe3mJtnwIhBAm8PnO/0Ui26KWXnYVQ7BYqNe1YZ
	R+Pduw7Qmm96u6KFPvVN0J5FeY95ZnFFqvUyGlfYfr+wSAdy56QFPVxnPy+1DAs=
X-Gm-Gg: ASbGncvPJ40U8tJuZVRrdPBPjwRw6mIQXtENaA98tH1mocjfnDn3vGSQrzZj96xFdcQ
	yYJYsX8GIPEU29sUVa1g63k5/6pEsvqEDjyi4rMb+rs3l2BIRCPU4Oi9DNqr1YfQMn8sPE0140a
	jhlG9i87nqmMlhs/2BO/nCGIMmGtZX6O9kx0XngcOf+ULZGa/zMyHUf2w2FfpKOfABRVifuvhwG
	Yrrd9i4XWlNXQI7g+C3tjkpDKD8PYPlziaJeXPDXiv2ZHKOTwy/wxA+lrQMchM7V65EpqNUUzHH
	zN06q/qWq8x9jnbaB+7e1mB9eIXYd1P2Z915fcVFa0VzU03Pmrj1laOiYe2T2DTL2wjM4Hsn3X1
	E8wtsOk1yWvgq1A==
X-Google-Smtp-Source: AGHT+IF9i+qy4bQxvdAhaulCC58fLAGLSGbyOONZRqFPtLgJ+j16vp+WVixcc2FWtwJrg/V/6FPSZA==
X-Received: by 2002:a17:907:9712:b0:ac2:7f28:684e with SMTP id a640c23a62f3a-acb74ad7dcemr235285266b.6.1744982042862;
        Fri, 18 Apr 2025 06:14:02 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm115901966b.124.2025.04.18.06.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:14:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Apr 2025 15:13:45 +0200
Subject: [PATCH v2 4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-fp5-dp-sound-v2-4-05d65f084b05@fairphone.com>
References: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
In-Reply-To: <20250418-fp5-dp-sound-v2-0-05d65f084b05@fairphone.com>
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
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a compatible for the QCM6490-based Fairphone 5 which can use this
machine driver.

As a note, QCM6490 RB3 board is using audioreach architecture while
Fairphone 5 uses pre-audioreach.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index aa3b4bc3fcc7b8a8dccc75ef1309bb26a2a8105a..ec5372e18a9c9bc6a80412adcc5ec473e9730620 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -211,6 +211,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },

-- 
2.49.0

