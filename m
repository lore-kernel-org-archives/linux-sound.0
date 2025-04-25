Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37B924A06E
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 10:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577989; cv=none; b=fAaZmvQlCiH34jywe6aK8jojY4DLr3Lfv2eHNuUrOGwDMX3d0Crkc3ikvXOMLBIpCM0PIArurv4NINd5RYP5wpfOW7pirsZd6dWbRYggk+C5rE8sZ6q03dbr+O7wWjHFq4YLkBSWXSn4ZFxG8mgFerLrsPOT6ldZHlKgQbl5r8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577989; c=relaxed/simple;
	bh=RHZ+nVQR4jYnFcM+6sz6/jx39wA7buQUvA89B+ozHbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAbqhSOeov8CDwH1cyboEyy4kDkmaUzhdStPIQEmLTL2ItuhtK00bzzYHQKxBYX/ZN4kq1vmrLkBA+o6jK1ckpDZ11xKN4FWCU8slHPoh5aNeMyNfll1MntbI3sn+V3NZDiPPDTbC1YQgeRaAmKKAKVSyFGBcd7eLYUSEv4LR9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mrudBh0s; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mrudBh0s"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2c663a3daso398131966b.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 03:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577985; x=1746182785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=75uO0qnYhcwp/9Ctw5vuVScHSNK7KyN/uUVAzxbVZk0=;
        b=mrudBh0sff7oKJ0LpIKCnqAWZuJl10v1fkjVnQ4/C/5WNlTsZiR7+zLL7Dvqrh4yXz
         mB/s+RNKjRySQN9FrGONStrVkBzw4g54yhgLRlmxjwP1vZ/VyYWd8Th0qxZjB6ZvnWHr
         Bh1+JDX1f1diYAS+D3GZ8kRj0YBkllFJmUqZazlwUzJgrtPygcjoKeMnwaOQSiGKo5mM
         Ynmn5hvyc67wVOuzN9N3k4JuaWHY5YskKsav4O8m4+3k3UlM5XeVJq1lMaFofJ68ef++
         OUOJgZoS5y99zPwLLH2KMx1TXoulKbpIDefwteXMohkkqdS8pqazsLmj+ZKYLoLYcLz4
         o01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577985; x=1746182785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75uO0qnYhcwp/9Ctw5vuVScHSNK7KyN/uUVAzxbVZk0=;
        b=iCFqwxYfPD6l0jlweYK6JOLBqpSOZpbCaGibrYHF17ZxH8su6+R2yG3VsfoVdpEQZe
         RfF+oTpCR6cARAVme99I0yakU2ZI5fprYVV9B1L4+ZJnovZcPhE+iyLcY6p2djXts7g6
         5RJ/Dtu9ANbcDVKSRPOw+XnyrPjpw6JXsL9jILC4BC+KkB/C8z5riQzAvhNGbCVnWZ5m
         IL38mDotWe2er9hR13KthRrzxAjN984MsdqazPuGM6mV0P12faeE9mu8n+GU/9Ov8ZCl
         ytaTLPCNK0o3Ab0VdMvRh7guN0K9uOdjbvLh9f6Bg8HQUrUXiLgDde7qJqQL/f6MJRof
         e+EA==
X-Forwarded-Encrypted: i=1; AJvYcCVOdZABaNDUCN9e/eDwj+iTZu+o/isGWOlzhFPok38P+/KRTkR7clOLrRFoeYUKUX2EongWTsvIoocN3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWOtnu9/WbiVXqoPOn2q5ZMOaC7XYymrJglkA6wlicqpQ86hij
	br+Denpr6Ba1VMqEifE3mbAXR8Bqa/kPAZv4OEXdaDg1niIcXzrQa3A4VxgfuyU=
X-Gm-Gg: ASbGncugp4E/GjPPWRYNZnzgNX6ugnzrI2kqIGow52kSWHHtV4q0DwksmnagOqmmK/U
	uclQ6lmWoGpmOhs5SrBJC41p1aEYx+zWVnPxoPYhU6vRpYEaE71zjuRwvQSmQaCivJI/uavLqjy
	XIWskHpTtu9pqRjXF0Z1pqDPSvY6tyz/+Z9+kFfk5KKk6yi1mk+oCVI2I1uWackNMt2YQsJ8L8d
	jiLrls1dkNYuXrNKQAWL8eLq6ls0yJYbBidK8QeysG4PL/kABdgkxncaalzDovhe6Nu/EbMxsTc
	PIb1s6WIyoQseC9QcYLb6A8JYBDlqp16ymeDZnhd0o57jGBdFBPkBNdlm3vBbaZGnUni/IItNRl
	HK1Qy6NfRwo/2y1X7rpi7YUHQW9iWrzZcEhpO+HGurg7dmSQXGQ6H0PV/
X-Google-Smtp-Source: AGHT+IHVMEndxh0XKCZm79DiwrttbUOJ0EeVVGzRFO8YMZeacxUM0z2X0Q0OP58ATSu1eJXn4Hqq4A==
X-Received: by 2002:a17:906:6a0a:b0:ac7:9712:d11a with SMTP id a640c23a62f3a-ace710f03e9mr179888566b.32.1745577985179;
        Fri, 25 Apr 2025 03:46:25 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:24 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:54 +0200
Subject: [PATCH 4/6] ASoC: qcom: sm8250: Add Fairphone 4 soundcard
 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-4-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a compatible for the SM7225-based Fairphone 4 which can use this
machine driver.

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

