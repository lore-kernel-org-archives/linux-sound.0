Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10D8191479
	for <linux-sound@vger.kernel.org>; Fri,  9 Aug 2024 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723192456; cv=none; b=AVWUs1+im71OgLFBzVMN4qq/UFeHZE1NNEotgLolDqX7ttXF7NKWvePCA78ksDdc7e6p2J4/lSbosNuTErF+yrDRt//1ZkHu51YGxHy9NxEfjgA0rdt24rt/Oh68JG4nZrKzoKfjfIan0c2eITM07tnxeHrGdr+y9jY/btuAzII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723192456; c=relaxed/simple;
	bh=6QJ2T7K5t8dnL1cUxpMGwsGVpEL0ZBUMr9mtcKTcoUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6+Ls8sHpMbJmbAo5xf5oX4no6caygO6t9XLZSKwd+H5hJLI0ldReiPot9DfRozynzMxRS3hseLBZlJYi0ZNEXOdVBr5yHZc3KzPPv7BL3w0SFTHDNUaUBhiJ7dl1jtWrZ5m1i0LDftBsTmI7AyXdPgx0TEWq26GIA5eA/TtrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=lh0OlfWM; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="lh0OlfWM"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6135dso2325076a12.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Aug 2024 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723192452; x=1723797252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTOapbhsSh2iPDvdrkY7GqTcvxUdYMzOhi4gx0LwDTs=;
        b=lh0OlfWMaRTJ9W00ku7lw7gtX5ChYd9/mIU83hpxTFVIDOCm2MpgSMSdSlzN5iJOsO
         lJ5vNfQFbwIuk8o8AfDSThQEfXUOliiZlcv+UJaQ0REUjUeec3dVrQsgwnIHuZoVyq+8
         ZarleEE2DXPU1jkM/8A4wvhZ9e/+ICa1aLLRibaSXjqSmOBPKAMX1z60FXP8aPWyBG0A
         tZgKyZK3QE0LTVyvYBu8fz25xEQLQfzMNmC1DVNWTLxGOL1pj94rVG3X90Mxd9srQCMM
         4yGaPMVs7qXi0+LNJP9bisNszOHZMTQUuFuzgzuHLBCVd5P6vWWJ8waujJCVreNMYI4g
         9zuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192452; x=1723797252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTOapbhsSh2iPDvdrkY7GqTcvxUdYMzOhi4gx0LwDTs=;
        b=hYjCkwt4GovocmvXs7xa4KpJAzid6P1QtiuA2EzsKTYgpnfmaZUuuR7u5vnKJcydco
         yMg+eGlOnpSld6EHGIXQxvT31CtqF7Fq893/kvE9YiyQ8ZALzojKhVIh9MDUQ8u3zn/9
         eT3JSnzJjL/auCCztga4YvcVHbPHND2UMoAvZLMQnmPUqQIP3n04Zutnjz1FK4pxB0xm
         RJQQGlT9bxmGbTFLIScY04PDPrhEuDLZaJfZ0PlodzdnDWgiFrAPUIpxTppXg8I62/Dw
         QecxjnXBQhXIvHXSCJen/JrFZ9SlM7zQ9FQZq5OvTRmlJZzP/OYxM3W3Z1Sh4VP4Qyri
         9Yyw==
X-Forwarded-Encrypted: i=1; AJvYcCUS2n4saV1JmNJ6jKBZ7TZ1EKbnU1EudihAD7PS1Z5VZiLbEntrZJuojvQgLFub4SDB9k9Sf4b3BT8dPgWRiJ7eH4vDmpVbxZ+ACKs=
X-Gm-Message-State: AOJu0YzGmepAkrnFISmZN5W1A9gzVn0OOmJS4XXR0NfdhQM4NRg/Wtsb
	OyyldHAGL2b9kDEuClqUO15X/CKTa6t6IVSiaD9emOSG/Z4op0LpnIAzxciey1U=
X-Google-Smtp-Source: AGHT+IFiDy9k54HEGxK1zO78LfIscSKahK5f+32thKpNVMqGdYYVC41qcymWbEmBTFDakPWayhpGMQ==
X-Received: by 2002:a05:6402:34d6:b0:5a2:9683:2bb6 with SMTP id 4fb4d7f45d1cf-5bd0a50df2dmr535009a12.1.1723192451945;
        Fri, 09 Aug 2024 01:34:11 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c41916sm1336288a12.41.2024.08.09.01.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:34:10 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Aug 2024 10:33:57 +0200
Subject: [PATCH 1/3] ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-fp5-dp-sound-v1-1-d7ba2c24f6b9@fairphone.com>
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
In-Reply-To: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
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
X-Mailer: b4 0.14.1

Document the bindings for the Qualcomm QCM6490 sound card.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index c9076dcd44c1..0a31be6d917f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,msm8916-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
+          - qcom,qcm6490-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard

-- 
2.46.0

