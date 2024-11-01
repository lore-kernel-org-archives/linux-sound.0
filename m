Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3928614A4EB
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 05:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439124; cv=none; b=W8Z4G3pOTw5NV+tTlirBMsP8wG1kisnyIyQo/xS6hl7qUDYUQz4OAwva6zkLtPBuNUXdWB9DFqMsFlCdJieJVbGe8VdqvQQ+d0oCup8ToIiWoTdxzpU2c6ZnsdAXJXqtjWif68QPDWzKf1joOR/bj3JK5DVsXfuA0CMykI6l5zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439124; c=relaxed/simple;
	bh=6c0ImAxpls+T5z2bpQ9Yl4ZdWHui8yMGQ0RY/fek5lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kIkHwLmHvyd63Yz8VqCYGjepjEV3Wls0/T+vB9G+7ef0S+ylIw/123K58NNLiha5I4MniZbryyVQtJlzFzl+IgIVbTaS9iI7uqIolpwjnTlOnEO9j5AVR0VnP4bH+QuHkF5r3Er4ecrThZ30CgsZbimmF+2SkXT+rRrAZ/WmG5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2BFlKow; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2BFlKow"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso14150085e9.0
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 22:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439119; x=1731043919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AagxMQSTeepIIRbJkNHGMYKTNJijkgoWpQ4x2Maii6E=;
        b=z2BFlKow3SzRncajDgWooC/DTyPN3MbU+2BUgT4t3JnJphPdhkl5tDrAe5lRsPouLC
         sfAyaB7UAev4A7B6U4hAUBPtoIIphlXWApQu9pd+ioPb3xfV04xfSam0TAHu6SMCMlnC
         5PHdMxG8b6YRxZj9eIq6rtEME17T1ke1mRZ1EhedSQp2N/otTmvt5W9uibxMBZ/c5MI9
         9/Wr9W9DfmDpWs/u0ZMWckAiya9egKCD2FeJnCCzsdp6WaTJQJDo8j7kM49YAbzWZcnY
         Vr4jJYnDYV+tYu4YDrYXYc4BgZlwNmhEaq6MKg91dzIO0ukZlMWDGWHA4vmRDQJj37P6
         mt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439119; x=1731043919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AagxMQSTeepIIRbJkNHGMYKTNJijkgoWpQ4x2Maii6E=;
        b=n+pEQ7mlYqdWOessuJTvrL/BrsuVpPOo8/WX+ojIYMXCY2bN0u6W5+73e7xj4x0F8k
         xWg6UM9WxLqOD7jqwhihtRYA+2Lhrh52yLFIpsaqKT65LBk5lRhN3dYIOa/7vpWm9+Xu
         10nannhWKu+SgNtuL5ZxcdvpkbM+9tj56NAge3vf3t3NIw79dSC/SX2erWoeXyz+Jnfo
         awRAXiebad0KY/oa5zlWW89IR+TlVjCr7Zw7GE1Gc5YsHjQM0p+vuWVydzntcgTlDaYq
         cZ8wLn034TrlLxY7Ga5IjttCUUW17XRFNZj5Vfr6eSYFxkFxRhVHeLwRxV0o7NhXALjs
         4zww==
X-Forwarded-Encrypted: i=1; AJvYcCXEv8O2BHD4U/qe82gb0xh+9dNL6tfLTwJZFIGmZ5BwSgvTPcs1ERbaywwGvEdjZn3YGASZMZke/VOPow==@vger.kernel.org
X-Gm-Message-State: AOJu0YysS8HSUU1mmk8hq65nx9MYrcmjdAlInISiwOgfJw37eL2/uDqH
	w+aqnY55UnRbj4oK0csgo+F1IvnZCr4hB72zlGGSX0r7V8fp2ttOdVAJGc5hQBQ=
X-Google-Smtp-Source: AGHT+IENmFZ2CH0DtPNo/eS9oAo1+rJXuWpBueUsCl0BOJBXfwA7xhWdqjWkh69ceSQdQ5+HnDh0+g==
X-Received: by 2002:a5d:5847:0:b0:37d:4d3f:51e9 with SMTP id ffacd0b85a97d-381c7aa451dmr1773039f8f.40.1730439119587;
        Thu, 31 Oct 2024 22:31:59 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:31:59 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] arm64: dts: qcom: sm4250: add description of soundwire pins
Date: Fri,  1 Nov 2024 05:31:46 +0000
Message-ID: <20241101053154.497550-3-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101053154.497550-1-alexey.klimov@linaro.org>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds data and clock pins description (their active state)
of soundwire masters.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index 1b9983ab122e..8873015c05b9 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -37,6 +37,16 @@ &cpu7 {
 	compatible = "qcom,kryo240";
 };
 
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+};
+
 &lpass_tlmm {
 	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
 	gpio-ranges = <&lpass_tlmm 0 0 26>;
@@ -74,4 +84,40 @@ ext-mclk1-pins {
 			output-high;
 		};
 	};
+
+	lpass_tx_swr_active: lpass-tx-swr-active-state {
+		clk-pins {
+			pins = "gpio0";
+			function = "swr_tx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio1", "gpio2";
+			function = "swr_tx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
+
+	lpass_rx_swr_active: lpass-rx-swr-active-state {
+		clk-pins {
+			pins = "gpio3";
+			function = "swr_rx_clk";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio4", "gpio5";
+			function = "swr_rx_data";
+			drive-strength = <10>;
+			slew-rate = <3>;
+			bias-bus-hold;
+		};
+	};
 };
-- 
2.45.2

