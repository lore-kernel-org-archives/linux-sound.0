Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F02F273A
	for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279452; cv=none; b=B3K/YyDxG2drdUVpkUP7yU05wK08379fcCJpZCcDZ6UkhZ1Oo1Z1GLAf13V1bI2a39G4hNuxhAHbiy8kryGZ9bDA4qz54oRXJJSvTjYAhAC8/SOF0lmTqOd2fvg6eRL4c/4TkTO3U22wFdWRMh72iY6RVmm2tXnxxkVdThDzWIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279452; c=relaxed/simple;
	bh=0DEgaxktWtylE9tS47CHiAD37SUMRWPVx+JL0++K0w4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DT8W7zsvNRj7oQqScf2ZMkaL1DNQtq5PTQgsEpj9TC9A94S8y1hrS4PXdOMseGpGHY0FJo5wua/t7189f//3FtAYuuRB3Us2VfIgdKCZyYBmXLxdth3A9blwqIPah0ThXN2aMORDdFjAoQeeEehk/xojz6VEKZEPLAxeY05AxRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=j/Mx/3+x; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="j/Mx/3+x"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aec46b50f33so1156535366b.3
        for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279449; x=1753884249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBk3e+ZeNvt/w69kQtejS7uDHZHCYnTulCyNIFzv8gY=;
        b=j/Mx/3+xc/XSy5nydHMfiBdlGr7U38LNfvKfdufoxuXRNy5/pvHa/sTcLcN3HU8j3L
         UFdH3pQwEGMDh4e2L0NukJJ/Lym1TSPKzcZnj8pgfyb5YJrPQpNCk/WATy47ebJtVhs3
         K2Ln9tXAXbv3imWTEg4myxpgFAxEoyWbwjobRdRX2xG8aM95TAWkQh3gi4MLNui6PdYz
         LgM7hAPOcZ8ejCyzbCmwtMTcfiwdFHec7BwRCzg8WgKxfZ8LjV16Jwfvd0WHeLvnutXy
         OL4Xw4UXh4z4G7PnsznF06MM2H3ShvFoUCf0N3m2lNUaBoETGYNOWGymixRrI32RhdiL
         fN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279449; x=1753884249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBk3e+ZeNvt/w69kQtejS7uDHZHCYnTulCyNIFzv8gY=;
        b=Os/UWq1jOTHEI0cqRBcj1QVme68tW875TPgRlvTtQ1p/91O4ekJFBmMElPJOv2Kd2Y
         G+jqHfRunWGyiNY4sVfsZGY/KrKAhE8cojdX8t/YkyiT/F/VgysJrsDKLSwmoRl5Ux9T
         F7yM/BvPHjW1w8fGd1DfrqrkDSVKh1nKY8wwA1gf8q684Z2NbYVFlo5NwNAV24/4rEly
         cZCkMUF6qDAdoM4aLweLCEXBcDKANa6/G3Y2Rwpn8Ymo9bm1Tu6sTHwmdyFBr5ipSgY9
         yhdgqfQB6OQiQVC73fXif5pdFGh8O2SczNnT7MqeujKoJVRU+cwcKGIJQFkOLL6ZmIqS
         Lyfg==
X-Forwarded-Encrypted: i=1; AJvYcCU7+vSKTjJmf98D3gWGp2vv/DtQWNNnMKJa4mHnOiOzlB1i9HK0LqowWJijiEMXlw/uDpWXvSXpQDyH8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6J6O/doAkoIyt1KtYsbI+Jo+rtOaQKcYhQEUP2XcPB4GlWah/
	UbniLAKz7vdDS7GGp8j3u89Okvr2Tn+CvslqrOZXLD5dv0/pvesC6nY2DRDtdaSNVq4=
X-Gm-Gg: ASbGncv+E4aA3ElJf8EKgbrBqKM0hREehCNiwoguU1Kf8bPMgvoNwnMz6NfjPCpB3xh
	9/z9aexr5DP7llqqBU1e8v6FfcFh6TEeRId2jzngiWYzh9Zc3lfvQZIGF03ffLMsigbDdfmt8wh
	ZL4m+M8RcCwzhOhGrkWn0gA7GGZV+oDx+ioAk2cYp7Bjg/HoUt2zI7bfS1gqrIO1spX8jBLPeS9
	OrWDOq4FicW87GIn81odaLcZ1INg3V2bpchbFXjKBM1jU0sP15b8j6r0QJingOqBKAaC0VCb9sE
	EEG384zM+V4CW+Pbgn5/Htixih4PPIwPhxdol+iXJIq3BTmoOrv9uz2To1A9O9lv49UYpBlkNiy
	jA5VSf6lvrvansjSphKm4d+DtT0+x5pGjHI8Yp4QdOZUSFpTnQvWbudi0ldlvUIvdjIui
X-Google-Smtp-Source: AGHT+IFIf87TC3ZSe5JBmPzIIxrTRzYL4zD8nVpLsuTYwJfJNPVnPKmaSJbEvn9fuMpNBzzUCHRPOw==
X-Received: by 2002:a17:907:3ea6:b0:ae0:be38:64bf with SMTP id a640c23a62f3a-af2f9178962mr309369766b.58.1753279448707;
        Wed, 23 Jul 2025 07:04:08 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:03:40 +0200
Subject: [PATCH v3 3/3] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-fp4-usb-audio-offload-v3-3-6be84ed4fc39@fairphone.com>
References: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
In-Reply-To: <20250723-fp4-usb-audio-offload-v3-0-6be84ed4fc39@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=935;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0DEgaxktWtylE9tS47CHiAD37SUMRWPVx+JL0++K0w4=;
 b=hPyNXoVJuPYBMO+z6fAdDJs+EMudff8F0d7QdXv5K9C7/1HEfTM0wMp+5A3PFEbn7KuJ2hALH
 IImnnwDdPE8A7AM4nyhN1JunBzXdF5RT/1FdCq0Vv2juqAMDtAEm055
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a compatible for the SM7225-based Fairphone 4 which can use this
machine driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 69c514fad0b1babafae4b61bb5ac944c6b4906dd..f5b75a06e5bd20e00874f4cd29d1b947ee89d79f 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -208,6 +208,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snd_sm8250_dt_match[] = {
+	{ .compatible = "fairphone,fp4-sndcard", .data = "sm7225" },
 	{ .compatible = "fairphone,fp5-sndcard", .data = "qcm6490" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },

-- 
2.50.1

