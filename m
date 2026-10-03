Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E434A8A25
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050245; cv=none; b=OCOtIWu99TtNw7xIr08OiW8QLsRG7gMsV77D0QtawzK3ZlpA+CuxEH8eQIgp+5aWH2uEvihn23PD/sY/FWYt8FbiAdr84gAmCfMqmOy4s4qicy/Oj1plavm58ZjIi9gS1qqMXhZmvXdEMHG5bokWELkOM3LhhwV0OK+EAYH+Uos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050245; c=relaxed/simple;
	bh=xHotjqAGKY0BfEaoc5/VHSKIpt7goITnesNH+tjV+xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efR32AmobtJEqLPgP9YfoZB8W4WDi/5Mw5lQZrDH3sfEoSuU6DQ1w9722YgRz6nDbRZv97NNE+EaX/tKXp/wEhZbxBcM3QK5FaqTxBpQTn3Gd3iUzM3Tr9BXFmLFhaG1g8syYYdLTalQFn+I6camQwttU/akul/Pf+bC/IZpuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hj2u4bxw; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hj2u4bxw"
Received: by mail-qk2-f42.google.com with SMTP id af79cd13be357-93c56f7c1c8so41361885a.3
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050242; x=1791655042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6QjYAswNnM/54XR4wboKDCX2rmH70bPtkOCGiylTQc=;
        b=hj2u4bxwbyxdqlWjlhh+nPwS6Et2Ih7tsJA5B7OuwKzP6Z4M0ydBJx5X9YFHiB+HT2
         p1A4wCN5+UfMYUt56n5DrWMSeAqvd3BzNP4dSOwekYcr4kRwiuz32H2hjxTSp+hVD+0H
         6hH1zDtnvTbwCCbMZglIot/nsawXNrESh+gDPo7ybl4cNpLzgrgQYr4dEhaVIPiLj6Mk
         1Q8KBielWVn6WvtD4Wn45AyiL8I6nU8ZcHuCqeqhJ2dIKB/ntaXLITaeJAkHpKyX5A2z
         C0aUZYMKOO25GW6C7iqhUWE4lnH6GZExCAof1wbPAj0M9j3Hgosn+ZcCsebO1c793bM5
         hJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050242; x=1791655042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6QjYAswNnM/54XR4wboKDCX2rmH70bPtkOCGiylTQc=;
        b=eQ0rzyjuXVv3Le1V8Bvm2R5A7W0HwRMcvOZdOIGodTs9qdGkO6GIgGfZDjyBfk1ku7
         ud1Gp+YB/5uO+IHgxViqYTUicZUvFXJ2q8IgbblfvQSKB4ZBAYFSZ60WLs7ANLheZdr8
         GLbuvGcMlXzANA1g3qvnDx7xHjGFuRnltZU++em+e9HEKANAW1P9wkREm7vFZzNPVdXg
         EHh4/rAiSmJbEoHvhOslzDeSXkj3exIAFHenFdlPYkiGQyG4ZG5lcbjUOFCc9i1HqJgs
         66E2Wujp4KZR4x2m8r3pHfov11xbecstkLRHVeB6PHTd3FCDhLrzi+2IxW4NX/wrSfQS
         j5Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwkJGoLF95na/VjcUgZsuxwCPiPW5Wp4Y0hS+VE4BFY6IAakjtbUswk4dfLEyFugTesNhtc7NNj+SNzxg==@vger.kernel.org
X-Gm-Message-State: AFuF++mYh2skCyr1/5MlSPiGpCLTUxqrJavVxdiVHi5tZOLTSyF+0TP9
	w5ArLYm5OtLdZ8hGDmnBHClJqCR54ev8WWDgllpP0tNoA2Esjvi/ebJ5
X-Gm-Gg: AYBFou3VFL0VMdinky845V6nqQhKokuW2oHe/X/+tAz2tvYSgptrSRsEKNhrnUHT4ou
	XKHZxOjdNH+eIqiys6NZY6p8Vh3klfTlK7SNMC8+SibVGndg3cKGeIYFxehgh4xVZRzFKKFMekS
	uN+d9doZ5QkPl2hybcbdfq9TTzIUMFeNC6c4oqU7K9NMIObbonXe4bn2+GxG2Vrki8TQI7XShAa
	6Rky9SNskcnjg26dQZIoUEbnJxyKemFRyFydJ4KBfjw1Z4N0pDroi3Fw2vZH55Stv/tLITxT08s
	L1Bqz317wDoEcMNXxzItODvzGsdvC/0L6Zsad2oDEqieJAeRXBQv+xzcaDxpN1UGjqKqFQaEOpa
	jnUwzuCTjP0AYc/XOLuFMmttpxAKkhG2y4c7BmFLWgC8b8nCL3rJ9fyzCMkEQ8sdrR/YTkH/i70
	oUHYgMlQYnFnzSv4+n2CW/ADAjy08NYNY7wqv1fxxBEokDAqHTp6gbn+jYtRBLWkWsp5WpyOSFw
	A==
X-Received: by 2002:a05:620a:a0db:20b0:93c:c90d:a116 with SMTP id af79cd13be357-93cf174b109mr820351485a.37.1791050241827;
        Sat, 03 Oct 2026 10:57:21 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e54eb2asm283924085a.28.2026.10.03.10.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:21 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio codec
Date: Sat,  3 Oct 2026 13:56:58 -0400
Message-ID: <20261003175659.23536-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the digital WCD audio codec to the SDM670 device tree.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 038ef0f73ea9..91188acd16b1 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2541,5 +2542,19 @@ data2-pins {
 				};
 			};
 		};
+
+		lpass_codec: audio-codec@62ec0000 {
+			compatible = "qcom,sdm670-wcd-digital-codec",
+				     "qcom,msm8916-wcd-digital-codec";
+			reg = <0 0x62ec0000 0 0x400>;
+
+			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk";
+
+			sound-name-prefix = "Digital";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
 	};
 };
-- 
2.56.0

