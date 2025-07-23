Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608892F2C5C
	for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279453; cv=none; b=PY9Mq69+GKd1aGHu42N8QGrcer3SKILPdUcsUu9v15IT527MZR33m6snfjaK3pNXLGkUOn3eOUCFsmd+jo31diP/encwg4vbUKVFMWWtgG7ukO1urVAxk6cwFmEpGHltSz3u11oz/sYQLyflw+NcfMy4paOyhAcjT2HSEmT17Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279453; c=relaxed/simple;
	bh=K3gtrR3v4rNtKDNvKdClFiel5VFa8vRDNJ20QQ4SphA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCwM6DvsGxLgkTiVkfIeiCGq2Xp6/axNlHVqR1XU62424WeEXNSaUCACcSpviyplsVCEhRCxXHgsDUD3VeJ/aUYrynzcSTvNU6pIaTpginVHQz53e5lh0d/bWlFTSnMqYH0rWQuISyw2jKjqdzXXIocoiaGmSlGTbobzcdtLXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bFJx3pyp; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bFJx3pyp"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so1817604a12.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753279449; x=1753884249; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXlxvRgPYFg9fM2x6/GWerbP72ZITNzRraeJqeDjrNA=;
        b=bFJx3pypXBbA2nTmNKryX3i3H65cON9v6hFI+t1tiSpmHuTO+m55vtTfy8B5h8Xrlr
         GZkjk/bqR2/KaEmRP6gVgUG/ONMi6reTbyzxloFlrMPc1gurmei11+Da27qBxOt1Wyxo
         3UakZ7CxK19ncJN3qJwRZEZYA0sFfVyGCkeZCvggc6q3Ma3KoWqAS/RN9eaRE0a996z7
         VTgOTHcwNpnnaLUwrHFLD34ZNGVjQzJtYMVoW+Ti4waD7wAwcBpLYYovAlSXhDd096wR
         ABhWQqy5W5iV5/b0hqVMbTePWoO3ezh1nyOcVj8y5UpqaAO2lRWUlRhaH7qoq2/VzeLp
         RBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753279449; x=1753884249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXlxvRgPYFg9fM2x6/GWerbP72ZITNzRraeJqeDjrNA=;
        b=c7WKclOryzcqQVeJ9A1NgobXExBIPQtrb93QfdcOhLQAMeecTMANpFx/OCk2cYjMmv
         gd7aOtk1h+E4QQacnKqPwJzKotUA0pxwXKnfIMzTwVFK7Zl8w5IHXyotAOkgfFNV1KmL
         uEC4jpcoVG8/5v4Q7HgILUmjj5cIJZyIveWR6gREQ5AfCtxZib1Tvg+iLYDb52vNaIir
         1BYcK1IBPEJ8PGy18cn3T6+vLxNdwLPL58YAFJ+rSfl/8llGwicWet8A67soxsZxUy9a
         pG+5SDDX3wK8p0wRu6p35Mv9ftfdRDCCEvecp9miDIPMtM5zeuvvk4wLUiFfdyrkSQ4s
         5OlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYp0IrVgOPzTZHgXBSK4bqxm/0ZTFcnVDigrP6/8foM66l7KrjWXBBxRHWUhSgghSHXUMCjDY5ZAlWkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxItnWkOwqVL/hXYa31OinQ67ijvzcnItbvDSIsbEJMjUwm7YtO
	t7Ci/K0q7MvH7UXIOgDHgoyJAMPkD0Xl61CtQ5JlOygPja+3m7RpFMAkJM/mme+cuuk=
X-Gm-Gg: ASbGncsioLMcmCg93TOkLKjNq9TsnKda2pVgGh+LIKwBbTrxKySisG7Scj2G++fCnv/
	5f7aNPr0aqiNpJBXhUW2unctUVc2Pnj5O/kj6hf66IX8Q+3y6USLCQYObPS1f32ipTMWdpAKhTJ
	YkRMB8hXQsDXC2RihVjBiAy4VdQdhJqtnNhoUNp/iqh1CLLwFg3/9VrxscuyVNWd5qkUBZrka9C
	BTMoOdedOGwl5l3POwZ5qp6eDn6kbaaE7EhHL1CKFvrqiCTMb9wvfcaSiR5fG5OQ/4Up2wAFzyx
	LzEQkwzxpKVB3P5kha1AlZulY+PtoT44/ywJwJaSrglm2okWyuCzf4TY4Otz8ieWsnABkdhm+q6
	TDknhf5EdslGpr7o7fpVvb0RqhXb0s3H/pybXQpIBaPVMrcfGK58AfCz4wltDoGrXX0UQ
X-Google-Smtp-Source: AGHT+IGJGZmYrnT/1eIcps4zEtfRffsyNpErine6pa3/KnG4ZDXSEe2fO8WjG7ZAL71V+qvcwdTRmw==
X-Received: by 2002:a17:906:fe44:b0:ae6:f669:e196 with SMTP id a640c23a62f3a-af1523a8218mr765817466b.4.1753279447795;
        Wed, 23 Jul 2025 07:04:07 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d46ffsm1054830466b.42.2025.07.23.07.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:04:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 23 Jul 2025 16:03:39 +0200
Subject: [PATCH v3 2/3] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4
 sound card
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-fp4-usb-audio-offload-v3-2-6be84ed4fc39@fairphone.com>
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
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753279445; l=981;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K3gtrR3v4rNtKDNvKdClFiel5VFa8vRDNJ20QQ4SphA=;
 b=RxD1ziU5OIOKTII+q9x4YZiC1mt53vPsRJbI7UT/HuvqOa++VYLlXajoqgtm3uE+N460AjULV
 Jr+0M5tBARMDwyyxoCrF3bCiebDBN2hZnab1ExzL1hturZGzNpOcxH4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 6b4a8dbdaf615b3254fcbe5f34dee512bf58fc96..5d3dbb6cb1ae89d9f0c376be580129e08a8126d1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.50.1

