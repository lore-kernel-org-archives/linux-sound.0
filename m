Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE642D29C8
	for <linux-sound@vger.kernel.org>; Mon,  6 Oct 2025 18:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775851; cv=none; b=RAdqkYg5jjFFEo+MqjYrXgo6w1U79+OZTJj0D8uTf9gbvZ36pJemEspPA5YV/msJgJyzcJuYrap/koFwNE04bRhSZC1K3GHWebMmlGBx4qyxvCRlhNqSpcRBAc4fk5sHorUwbeACoWi+57+jVQkOKcoRAUk6mdTYkRLyBS3nXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775851; c=relaxed/simple;
	bh=Ab4sB+Gy9bByQ3KMwViBWKs43ahwrX4X82dPExLVPMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RXdERV6QAVGirPx5BE/jdqgPC5qcD7DMe/9eH5nxeYVdcAvit95a81e07v9Ulv/E9OeC/L9AbDMVVS6Po1JL90vSVKe04gMQ+EvZFGnX8b/XaPuu9kZVJqipIK2AP/wk/Vf4Vngw/vLYg4AwUCfDEvZGLoKQR0HdRzC6FDXt2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDDr1mH1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDDr1mH1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e61ebddd6so50523485e9.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759775848; x=1760380648; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsvdBaXnMo9ZV1t6Nz72zBmLT24LbwFczkk6xaDii9c=;
        b=vDDr1mH160NaU5i1wHtn/W4o71xCgILLPTtiGiiETnadwA8Fp0qNKUyY6FSqZB6RXj
         fJX87glsjikyW05LkJtGkRGVUS2JIlI/nSmUCWr/efk+m0NGuBIQjPy6yG55xGM64s0q
         lCxGg3ibXGUHFJ2T7GkR30ySLSPSn3D1SI+LxWf+wgJrtCoVXdpBis71zXFH2HAWdzex
         8YMov7SPUQWOmLtKNDNMIQt6hcM+dszVVWEPNznLdZKEqqIFigDL8ieFmsOl1uY0tZng
         fLhzJ6iDe0maE6cmYRvM8JTzxYV4pOQ0f1/Ymt5XHV9cO4czfS58M4zfcc0CZfhO3ybo
         w2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775848; x=1760380648;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsvdBaXnMo9ZV1t6Nz72zBmLT24LbwFczkk6xaDii9c=;
        b=EfGMMyTkZpNV9675zP2XZ1XsUMj5dg+rJZoK+AnPmDwcNs6htNLD0YYFPbdtx7ZP82
         hYPuROJqzSt6suExnYwrmlB5QkhKgBhVAeJL8rneYlTlQfGryiKzPP4jZ9snEwoVjS60
         fU1l0GqD5VMwcP+3k5YvEhaRFUnvCsqKT/Tjusilbp1DG2aZ4n6LL2F9OsS99hOo+IVr
         hTsUJgzFurT5o8kD9UvfcZJf9TcgAO3ci5QABEA/liQfDw/ROGFNRlauVKPjeXH8LdqE
         7y8O3zNhsnL3Q8Z1tv7yyeSGPA9wgs49x4j8WVOO1DCg+dDQWpEV/GIXrGqyD+xLooqC
         UHeQ==
X-Gm-Message-State: AOJu0YybzJyGTnxJ5xr2xPmOra8Boj+oexrvhZJyjZ80HuhO3N4VWoGT
	/rFACTD6lnbmQTDtDkDPHdPWmR82ioWjabf+PeVwYLO05VuwzYxwGWcf3ZvdyFxUlY4=
X-Gm-Gg: ASbGncttYOiCVbc233lymJFvicXjLK5YoC1mdYGZSQ3nVUCzm8YwnSHIXqzZnbfiKUT
	iANlfuSKpFk2WLSyL1wFxGg37Z8YEHjfcHCOHveRKsd3d/1cXfvuhRikSVl7pWyZdaEy6Ptl3t3
	YWqnZPNct+LXu4nRjBQOgp8OnH1moINLty2L0aWafYXL9xZqvg/uF4G+i5CwAbhFh/QcpyuV5Kv
	w6QFZObtmS5DRLpEOAqp5Yn/8ImV/hnM9rMoZ5riF1KuKtMBAwQ8dR0eUHa3LjM1277QLKw7pfn
	Vz9Y2unOQpNFfL4ZhvO+F5+7LMUrVLWvnoR1nwNIuqh6W06KvdmDnph8uBoV+ifTPp5C7nVDyFg
	yrFFJ0xDicGAz49oOlUw4Ken4QViqVxZR+s2aT+O2i35viPXvcdJwWDL1eUAXLbLXBUKmkO0h+w
	Wp/WvbOg==
X-Google-Smtp-Source: AGHT+IE8HtaEmxZKyVDB8Fe6Wo9kldEjY3g8C0S4sDI5wHSp5Y21Sr1sIfnUCeq+V+Crm5qgopPFpQ==
X-Received: by 2002:a05:600c:1389:b0:45d:f83b:96aa with SMTP id 5b1f17b1804b1-46e710fe329mr100728725e9.7.1759775847435;
        Mon, 06 Oct 2025 11:37:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a022d8sm254997085e9.12.2025.10.06.11.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:37:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 06 Oct 2025 20:37:15 +0200
Subject: [PATCH RFC 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-topic-sm8x50-next-hdk-i2s-v1-2-184b15a87e0a@linaro.org>
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1730;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Ab4sB+Gy9bByQ3KMwViBWKs43ahwrX4X82dPExLVPMs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5AxiziWYdGMoTESpubxvDryul8gi4WsZdIme2OVK
 mPg8POuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOQMYgAKCRB33NvayMhJ0V5XD/
 0U+nmQUnhJSG3oRTPxiXV2QGarF9uJWYOrfOdSXphsNhz7y7bQ3eY1qfSiLGnVhl+OJw3y4ouKejZ4
 4uJoQFTFF9Ad5rubdEnEYB364qY2NdpNPh2N+SG/1PBtaDcVcnlQxktoai1Rsusy+D07XZ6vu+7POh
 xHK7kjGgOGwMxUogo/NLEbkj7zzwEBxV/ErNevylowH8t8rKNrEJ89TEkUh173dEiuBIzxd+3/O78O
 xOPNicQ7Y1V3vMmSDLQ/ET889xYD0s4EThQJAAphiK0YdqT4vqa8Jl4HmB8lERKG0Yd+9IQnOTa464
 a3jiJNIQtxF/96xzkuV229ZWohIldS6Hfn7TSTqOR6Yq3O20+V73hywffNJHbbut+FUhPjgwUIyLWF
 yQz1+kos4YKLhnpxN2L09chr/wjdgbqEGt7q18LSwtBKH560yBeO7sTc3XwJ2h+eOODItc3v6Ughaa
 SLcXq2c3NLbE0L0tv5cJGmsEWyosoiM1mRRlUB2/sKKqfvROAgzz3UYUcO2ODy9py7WtXBOqPr73vG
 GmpN24Bfs6pEXhyi3TuoxAuD6Y74q9jwu4OEqzGjw73mWqQmIPnVyR9MlQOMd+woXjqzz4v6XLE+fp
 VooVGucdgqNFcVW9wsycQbZVyzrnIVytFKQlTT/F4q42ne+dFaXWUTbMX4Og==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In order to describe the block and master clock of each I2S bus, add
the first 5 I2S busses clock entries.

The names (primary, secondary, tertiarty, quaternary, quinary) uses
the LPASS clock naming which were used for a long time on Qualcomm
LPASS firmware interfaces.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/qcom,sm8250.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..fd0d7a7ddc7b363a66e1e7bd72c7290666efb511 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -64,6 +64,24 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
+  clocks:
+    minItems: 2
+    maxItems: 10
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: primary-mi2s    # Primary I2S Bit Clock
+      - const: primary-mclk    # Primary I2S Master Clock
+      - const: secondary-mi2s  # Secondary I2S Bit Clock
+      - const: secondary-mclk  # Secondary I2S Master Clock
+      - const: tertiary-mi2s   # Tertiary I2S Bit Clock
+      - const: tertiary-mclk   # Tertiary I2S Master Clock
+      - const: quaternary-mi2s # Quaternary I2S Bit Clock
+      - const: quaternary-mclk # Quaternary I2S Master Clock
+      - const: quinary-mi2s    # Quinary I2S Bit Clock
+      - const: quinary-mclk    # Quinary I2S Master Clock
+
 patternProperties:
   ".*-dai-link$":
     description:

-- 
2.34.1

