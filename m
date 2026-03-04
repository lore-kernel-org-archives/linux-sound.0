Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01F3DFC68
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654279; cv=none; b=HJLz2xfIiraI96SfG1eaRgaLk8bh2OmcjY9QIkMRFlbyFVJEQ+rVC7gi3XpH5hpNfF4SEcdUxQ0kRowreLY7h+4bR7IT0bXeZ1Kgiq0LCL9Hinkt1Ys525y0kkMbaDHTuCaGW1LthzI56K6VekR+t6Mnz0l4t79p7VvQFFgZ+sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654279; c=relaxed/simple;
	bh=zwt+8cIg7fX5j5y0FoEWq599AjOfiWLzzstgXb/2Yt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMn7K14BqWMLnrmwWd+G6eu9rpxIQAnJhOGm3TXT8DIf0JWnRESefFZSRX9jyOqmAp2uVStVfQgsrSAnRIVVTNxmvSGLcQiNlANx9CsgQsRFWS17ojeDgqY1bgKZrJlaIJ3zv/Gz279ZxuW4ssXSCyyzp58pdXPiTrBApQ3wDIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9qkHqNj; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9qkHqNj"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c70ab3b5fcso999489385a.2
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654277; x=1773259077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b9FLFJOtAoLLddwDw5EYyl3BLOK61boxgEGp9nBc1w=;
        b=W9qkHqNj0cNzMyrm+/g3a0nMPz8hdt+RWJ9bJQhBn6DwdY4fUM/LPUqQP2Jud8bDgQ
         YsguplmH5sOQaQHnYqjwIWkZWEI+tYneAm5U7OlIZz2D5is+yrEHeqJgg3KSsLURvZN6
         nQexByPsXG2j1JwTCJED6nNLeIJCdgFJ0JoLad8qdoaTyxqwEkNpl/FzonR92hWBTaWq
         BobVNrM0ncP4Hl1dgloAR9/Is69FP3seG1JmGrFLLGyDQ/p46sWNKO4s2psbmktk3/at
         JXxA14cqgNh8bKW1RqNjCaiafdWO8rIkrUKImN1bVqsUGVf4KfEQgmcadLIYKCLwLROC
         jR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654277; x=1773259077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1b9FLFJOtAoLLddwDw5EYyl3BLOK61boxgEGp9nBc1w=;
        b=W1jbjWkS2dVNEhhFqrRF2mHGDgtYL3XG4ddj3jNQk/2tj6ryg8ceXPM2X2ubbFGcss
         VtT/bdoE7qpWYvWgorku5eOxjmuQuqyhPuhstWKC/Qfcl6ymvr+luo+YPjF+i7Brevbw
         lyjLu3ik+ifKpPTV+yRXAGuAoxvM+OS5zMEIw3RZb/Ytstxn+uLviDgawMEiQeUvMTjj
         a5Yii3SdVlGnOrpIU1pVuHxkspVmCV6py7vbwt9kgXvwoBVeERJCz4KSqFfyJj6cK3vP
         2CVu1VnUk3lofhO2JYM/NGhxP/AXnCzMLT3mQ8GisU6FMELaMxAgYjax3nFePohtlHfD
         togg==
X-Forwarded-Encrypted: i=1; AJvYcCXjnVFbhHV31XBQaB+laKpHyM7QM5DraM+MlObc+ZFBEXi5XfLHeIBEJXSoFw6POJVp9O6J1MdEOL2NRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/UeQpfPsOmmvKmpms2bVRN6ZOvS4wQRmR1TfOV++geqXOFJ2k
	wFuwDuqbnawOatQN2X2pan3WO/3h6iwDf+g34jIiq4N5bd/uZ8xKv/Hh
X-Gm-Gg: ATEYQzwQ4XT3VBNo3WdiwY9/7w88i5SntNtcMMKAOv5mo25KWXG1uSCsUILVf9uM/d/
	LZN40bnTa2iGPKKlvZbl8Nx1Q+bftroQ2+FMKG+L5wcaYifUzWEEzBTQCpxmyl49F8Vs0ep919n
	f/HivRT1hZWmeoxF+yYpp4qBJ0ioQkJKr7uT3vPzsYBNd/tNsrcYrODhSC/XxF0m1duwV31sECG
	OspwhRXCKbcWfEjJxqUyMqsnyIv38/tMleDtF0VhPxJrxstI0HQIdzd36PJvAHpBSHp4oLZCb7K
	ps5mU9To5yBHfNHsMqyqJHthmPa6NMYJEPmcR5Lsy6sUTJarK5YxDGoZv3rW/hqdiUHUjOpZLBS
	P9qnKBaCjTsdrC5VlUmLhb3fKdQlYw5F7XXXyGsmFij1AujkxPfAOcBf9sOYxtFcaIwzVBR0m56
	l3lJTrlRQhnC9Qb85+mIjb9FgBTA==
X-Received: by 2002:a05:620a:199c:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd5afcb9c4mr406353085a.76.1772654276950;
        Wed, 04 Mar 2026 11:57:56 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a0485ca0asm65014246d6.11.2026.03.04.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:57:56 -0800 (PST)
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
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 01/11] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Wed,  4 Mar 2026 14:58:05 -0500
Message-ID: <20260304195815.52347-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
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
2.53.0

