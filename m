Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9126219048F
	for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611630; cv=none; b=AD+LtIfb0Hw0JOBet/WoyprEGzx6ipC6Z1TEEz/+RWxgaaaf5CrUIUq/mNSIVyHI+nUYR0Nj5h3c3cJ03MdNeQQuo0qM3gYs8wcADpJLosK3EHPJAQ2VLqjaprCoMCJpsdLvn80NPP/swoZkHYW9jX0FhNG5ClBp0t7OUZ+U2Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611630; c=relaxed/simple;
	bh=GyHNGl6crgejPZUcF5UFfU1I2URJ1GXezzYJiwmUt7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dUEe6TsSlUX7W/iF+BR7dKQ2m9zIfTOVECJ1n4WmJEyn2kL9WqN9EhVBEub3i43gVVQhVJe8J0L5YmUVbFQnva5NXCTtG75I8cn92yiaA3iR+ekJRsYQ83i0lMr6R/DqoG7bk/HVBOsz3sx+QrlLHye0PbFNxdAD/Fvqa8cIjsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RanwNmgT; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RanwNmgT"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52caebc6137so4541187e87.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Jul 2024 04:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720611627; x=1721216427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tndFt/m+6Xi7iQuvvSvyVqsOQaEsWMefArV1oOIs2Gs=;
        b=RanwNmgTHyC34emBZYi9JCSk4QxUy1jb9sK3o6cKzyXtbBegHeUzKty1vY5t1JYAnw
         v/mHrwlb8vY0H5K2jblyNUfetQH+pWqv0BGgIffaDNWZeF5ir0CAgP6Dsn9S/eWyFqa4
         TO59p7RqlXGmqO6ETae/KRO8NLfH/qY4r0f6WY8RYlYrA+PGUtMKUxQW26qgtZI6mT+r
         9wA9mydkPky4Xtz13RliR2USaVa5dN9BMnmytbwGQDzEGWMJplFMQ0Irck0GUNQk+b+1
         YfIRtcAgHIFLzhIhhleiFbsn+9tPHd+WskozmWQUtS/+MmOU2Ynub7hnZHRGcmJ5B8hn
         MOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720611627; x=1721216427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tndFt/m+6Xi7iQuvvSvyVqsOQaEsWMefArV1oOIs2Gs=;
        b=F7VC2TSNPKqdKlXWgA1qkE9YiHsYAuRpYhondPdfFLt3+CR5h1XZhBWEmtiLAHUyRn
         Xu70/v2zCHYfEnxDIAy5V4Iy7cNUnK9TX8Efi+r6rT+p4NDNSNqPuv1MHRy4GDGNtCpC
         T2ZI4Z/7bMl6yzk36km0LusgxhsG3dorLZ78ZbcUFYyPKOLNDMiToMUc0aStWzW5U+On
         Ejn9MM1qJkEIFir8rYO+jEVfz000B0ZHJT3aNUHHJg781ZygnvHKLoCSXzDOgB84R9Hk
         SPRsR65tYPjLBj2Bd2ZRm0vrY4jf0ThrDEjiIxB+k4Qr+ykzw1XEGWYovcW2ZHdxDAob
         GDCg==
X-Forwarded-Encrypted: i=1; AJvYcCUnSE4j/K4rnNRSaJ0TwVwQ9gZR6njyWyDakWWeAf0/MQH6KA7CExuCGik/5MepUFylwhb4L6VPRca5NqpDaHEhhWnUCp//owCLcYk=
X-Gm-Message-State: AOJu0Yzfwg4EPoESA3MKCPKswLzZ2pmZzmWzQAqSlBUW1CzWlOJwT5tV
	Vm7gExAxyCS4GuRUAwf2XbxCQquukNluKwmVWkrslX7fGXdC1cYky4TEPpvIBjc=
X-Google-Smtp-Source: AGHT+IGWe2HWZsTajp3UFPHR9qdU81qRPqrHF9w7b7rKpMjUZoKdSVUGVh8iPNoyMohT9TfK8GN/3g==
X-Received: by 2002:a05:6512:238e:b0:52e:bf53:1c13 with SMTP id 2adb3069b0e04-52ebf5325c5mr1174068e87.7.1720611626810;
        Wed, 10 Jul 2024 04:40:26 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f7361b5sm78602875e9.29.2024.07.10.04.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 04:40:26 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	alsa-devel@alsa-project.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema
Date: Wed, 10 Jul 2024 12:36:08 +0100
Message-ID: <20240710113833.39859-4-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove old txt bindings and add apq8096 soundcard entry to existing
dt schema.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v1 -> v2: added r-b tag to commit message

 .../bindings/sound/qcom,apq8096.txt           | 128 ------------------
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 2 files changed, 1 insertion(+), 128 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8096.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt b/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
deleted file mode 100644
index e1b9fa8a5bf8..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,apq8096.txt
+++ /dev/null
@@ -1,128 +0,0 @@
-* Qualcomm Technologies APQ8096 ASoC sound card driver
-
-This binding describes the APQ8096 sound card, which uses qdsp for audio.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,apq8096-sndcard"
-
-- audio-routing:
-	Usage: Optional
-	Value type: <stringlist>
-	Definition:  A list of the connections between audio components.
-		  Each entry is a pair of strings, the first being the
-		  connection's sink, the second being the connection's
-		  source. Valid names could be power supplies, MicBias
-		  of codec and the jacks on the board:
-		  Valid names include:
-
-		Board Connectors:
-			"Headphone Left"
-			"Headphone Right"
-			"Earphone"
-			"Line Out1"
-			"Line Out2"
-			"Line Out3"
-			"Line Out4"
-			"Analog Mic1"
-			"Analog Mic2"
-			"Analog Mic3"
-			"Analog Mic4"
-			"Analog Mic5"
-			"Analog Mic6"
-			"Digital Mic2"
-			"Digital Mic3"
-
-		Audio pins and MicBias on WCD9335 Codec:
-			"MIC_BIAS1"
-			"MIC_BIAS2"
-			"MIC_BIAS3"
-			"MIC_BIAS4"
-			"AMIC1"
-			"AMIC2"
-			"AMIC3"
-			"AMIC4"
-			"AMIC5"
-			"AMIC6"
-			"AMIC6"
-			"DMIC1"
-			"DMIC2"
-			"DMIC3"
-
-- model:
-	Usage: required
-	Value type: <stringlist>
-	Definition: The user-visible name of this sound card.
-
-- aux-devs
-	Usage: optional
-	Value type: <array of phandles>
-	Definition: A list of phandles for auxiliary devices (e.g. analog
-		    amplifiers) that do not appear directly within the DAI
-		    links. Should be connected to another audio component
-		    using "audio-routing".
-
-= dailinks
-Each subnode of sndcard represents either a dailink, and subnodes of each
-dailinks would be cpu/codec/platform dais.
-
-- link-name:
-	Usage: required
-	Value type: <string>
-	Definition: User friendly name for dai link
-
-= CPU, PLATFORM, CODEC dais subnodes
-- cpu:
-	Usage: required
-	Value type: <subnode>
-	Definition: cpu dai sub-node
-
-- codec:
-	Usage: Optional
-	Value type: <subnode>
-	Definition: codec dai sub-node
-
-- platform:
-	Usage: Optional
-	Value type: <subnode>
-	Definition: platform dai sub-node
-
-- sound-dai:
-	Usage: required
-	Value type: <phandle with arguments>
-	Definition: dai phandle/s and port of CPU/CODEC/PLATFORM node.
-
-Obsolete:
-	qcom,model: String for soundcard name (Use model instead)
-	qcom,audio-routing: A list of the connections between audio components.
-			    (Use audio-routing instead)
-
-Example:
-
-audio {
-	compatible = "qcom,apq8096-sndcard";
-	model = "DB820c";
-
-	mm1-dai-link {
-		link-name = "MultiMedia1";
-		cpu {
-			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
-		};
-	};
-
-	hdmi-dai-link {
-		link-name = "HDMI Playback";
-		cpu {
-			sound-dai = <&q6afe HDMI_RX>;
-		};
-
-		platform {
-			sound-dai = <&q6adm>;
-		};
-
-		codec {
-			sound-dai = <&hdmi 0>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index b2e15ebbd1bc..c9076dcd44c1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
           - const: qcom,sm8450-sndcard
       - enum:
           - qcom,apq8016-sbc-sndcard
+          - qcom,apq8096-sndcard
           - qcom,msm8916-qdsp6-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
-- 
2.45.2

