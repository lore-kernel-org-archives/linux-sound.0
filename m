Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D4A445AE5
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433444; cv=none; b=KPipSnqa7kJxPjdYRr73CW0QslIlF6hloA0Tdr7GoCjsZKbvGPFqH4UKscOpCyGyuWSLKeNzJx5SJEjKdZdwZUbOa9t5tiQiaT8g6L4JQwQG24MHCBcbrhs7ZIqcEDjNd0DjQHOttqCMXlSLCehtZoYZjs5EBYV1K/5NozLQdxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433444; c=relaxed/simple;
	bh=xIwj2Le0TpWbMARAcv8JqZtSzDIeB/XmE+9Gn/+ByA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpCCSmXsVg2WTOclZG9VAE75WUb92i1eW8rD6MLWFb3r7FoqNWBcnZeIwbrG2jRa8CJZ3ckTspYgreLFTtMMZ7MK2fCav6QIkYr2DDaY1AXoP1RyvOR7CIkK+yYSPYGyaICHIETEndqJ/ZZdyiRdVbVcF1oXLDwwFkdwsfQu7pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwEVT4nm; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwEVT4nm"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c05dcdf49so490541cf.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433442; x=1786038242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6xuBnm7QqIPf+z6oBGCxObqPUzyYY2G0Zr/94wsQKS4=;
        b=cwEVT4nmUyAB27wodEVJVR+VsUaStiSAP2ys3Smfts8bETYus/qfmXA0eac5FC0HJj
         LpZSkrB2eNfOAT+KwpUyH4A0vMUuyMmZyuS9HSdobV/GEj4dpINONxHd8KTgM5AnXYs5
         DU/cvTtbo6HNSih//Iva1mLBTJf0slHS5XtqxXhimOwLDZBX4l4VNDDoE/2GMfWxnuI+
         Zn0dHgBuSxIn4t95/FyqPKCIMLiRy/3SI9nRlF8lk4UAG4U7hHoWuVC6N5v/0Cr1h3BD
         uvXh/NpBtNSwEEjPgjIqnFWgt8fFXgap/7r2JoVDVlBSNfXudw8yBBtEG9uv3SsWW5/X
         2xDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433442; x=1786038242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6xuBnm7QqIPf+z6oBGCxObqPUzyYY2G0Zr/94wsQKS4=;
        b=TIm+/hz0VXG/eE9WfL7f8iL/ryiYxjjzjAFnXADrSlcJRtvv1X/Go2QzCF0Ovgkv3z
         7lTPBSluFeOlh+XflxiImS82KQFdW2ZP5Z/HmzfrGPRVu70uZLcSesh9v++in5oVJnxY
         pO0LoNEZEZgYTnyFOCeckqcsMNJLGiX7YRbgPaoBTMLynBx812s9GIRhXfcyoAirPZd4
         qeHty0ECsoeQpBCYi+oo9n8mk3QzJAIXR78eqIPDnfcAa6kzaUlFPnzKVmQ4km3WAW0e
         3GPIh+BFbeScxHM3b6SKVkhN1q4s+3AL9iSF113gDl9ttC/HlVBqyje22qmdH5XhoLjm
         2+fQ==
X-Forwarded-Encrypted: i=1; AHgh+RrWsrQG4AwkC+KZA57LLqdqPh6t4Vy8ajyhgZakqQsVeiYKab7hyM5Sjso5RfBj5dtOzh7zP9zcyv5bSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyqEYeNGVE6ZT2BWc3d6notP2KVG+ud4pwa72H6v3UsIdAnDsg
	i9hZK8kByG5LQ7SqriwGLkVlgzAWwy07myNrO2MO+Bl13blJMcJxke2o
X-Gm-Gg: AR+sD12NKVMxtFPB7gTO9g1asU3lhhreufIToZExG9Qu7SPJf+l7SjsPUfZpSzLYmX2
	1beLxgMzbCMqk1CXCYMUZ/dGgqwKuirZyLCyGAJZHVLd+8oMEj1wzS7Y/GfC1kcFPu/DtEQc2lx
	HGbfx34cKPALNfNOU5ncIGZyDS7INYrWnsuqUj/15/Ei/9e6UwgBE1LToCS4SsdmBc//+WyQjhZ
	uu22Zz/syaOQOO1qMl2MLi7nZ6oLeXHdiE7sZSgWEBBpQJwCpQNwggt2AyhjI84vXkMv6C/3806
	kMtpTLmpE/env7qpK3MqAIQeyDkqN/nfnZyGjmi2xmq7cLdHlsL40X3JxFVkFnYiGjXt9N6i3Rp
	tZu076PQRoCZkOS7AaHNptD8KNBm41dVG+d2dd4ZkjVY6wdEzLLC1be8xtmTq71D6+ynFvJH2pf
	KCL0PHmXI/u6zPOkRuKbWQYPVPUFTExlBLMpzZlcLa0yDmqYvSnUrP4qQqgdo=
X-Received: by 2002:a05:622a:248f:b0:51c:1590:8e13 with SMTP id d75a77b69052e-52b38387effmr41392961cf.4.1785433442087;
        Thu, 30 Jul 2026 10:44:02 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529e2d8251asm45437341cf.19.2026.07.30.10.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:44:01 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Thu, 30 Jul 2026 13:43:39 -0400
Message-ID: <20260730174353.108023-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730174353.108023-1-mailingradian@gmail.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.55.0

