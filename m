Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E193A1BA
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 00:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422781; cv=none; b=OxHQ64qyGAc2uw0Vswejp0YVzaJNkFzqxmz2VLALAY2EH9UliVGjtVLYppcXOrZJ9ga9VgecBxZLdU1f+5xnMF27j1UbcXNuvp4aHEGbWvel+XTMW7Hn6FPfUCXPPNqMtsvtRnrfL9rUKXmbdljF9cPlbc4U2x8zpLBEPaM2WDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422781; c=relaxed/simple;
	bh=j94jq3vGJcIrOguDPhFtJsy9iuNY//3T5GgkTscKZyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LhZgx8CvzaoUAKKcm2t5njasq9pEgicKn7Zi/xNomNh1skmNarE1pyLFSgvU1x/nfdWF1OY4hc0I14wK5FgPLOyjw76HKwUIPCvwBP2+kxcyg9thWeZ2AJ9ET9WDr8BSNx50A8YWxLpdNtRsHMQX3uFxQHdN63w3W1xD++isIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FuShoqND; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FuShoqND"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315eac969aso9230075e9.1
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 17:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422771; x=1731027571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Pnag8ISnHry4lkix9pSW6/v+Tf+7fphW3qIjWj70mo=;
        b=FuShoqNDBGp/vxPYCvidh4Q3QGS/6FPixklxvA5UqKd7Myi1OSppkgT2SqPIolqARk
         K7R48v0QIbF2qtitk/XVHI4fMdY5spm5rrenVjEcv9HMycFtXVXAxn6DqIbf6ftFUJp7
         +f1vy0doBDZnGbZjBxiSARiJ5pwJQ4Vll2BQWRm0Sqs8t2oUsWymUbBg9+H7WvyX17Js
         zHaP/rOamFGjLBqhZaoDCO4hxjQjA4IkWGU/XZ9mnj8N3sVcjfFdggfcvGRc8AY8RcEb
         anO64VcC9bnBtUFnL/6q3trDZXbZOatA15aHgm1tRVajjUxkBl8fhfeOIQ8A5w1JBysg
         7CNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422771; x=1731027571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Pnag8ISnHry4lkix9pSW6/v+Tf+7fphW3qIjWj70mo=;
        b=IEqF63AV16PpVvppP1K3EHYyv2lsNlj4NVUp4dA54fCRCskuIdQMSr9aj5wyImfBLN
         QeiFZv8ZkJ8KFfoFMeGObssq9MnIn5e054x3x+C20f3cC0VvXXMGTWl0BFZu+NHGaL5F
         cFtIsdAW3CMJPbfPeg8qD7It4cvckOHhXvroN3YDtcsc2GSpYR/Su6hEJhKiHxN5Aw1g
         VXbjDE4TuBQEjCG2/rEh/bvQQTHnGFoKcfFYcxI67ObpEVa6//1kjCx7Txf3LS9nqz2V
         2sffvKR29EJ/RY/Or6tFBcNWrNMYYS2KjYL8hi2Q5V7qmhvmLa8yqjUOKF7lvapYv4f+
         7FgQ==
X-Gm-Message-State: AOJu0Yw0fJPbhpdqhQsCtGVUYC+/P2lhxGyPcj/06qoa3EOX3EBJb5MP
	0qNGgZ20c7gm2U3FWg80mNbB8kbSx6RdWjnRBO+8MzkEqC2SsPnsrzavDeA/gHOHXmmbe8QtSOd
	teIg=
X-Google-Smtp-Source: AGHT+IFPJ0LubzZHrwzpNHQoqzbxQbgOtCnxU+OXToXETbFqBbBJ3rL3HRCpuGdl9gwIdN5pJsLoxw==
X-Received: by 2002:a05:600c:1c26:b0:42c:b603:422 with SMTP id 5b1f17b1804b1-4327daa3649mr36215135e9.8.1730422771388;
        Thu, 31 Oct 2024 17:59:31 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm74208035e9.22.2024.10.31.17.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:59:30 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm4250: add LPASS LPI pin controller
Date: Fri,  1 Nov 2024 00:59:24 +0000
Message-ID: <20241101005925.186696-5-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101005925.186696-1-alexey.klimov@linaro.org>
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB4210 RB2. QRB4210 is based on sm4250 which has a slightly different
lpass pin controller comparing to sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm4250.dtsi | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts/qcom/sm4250.dtsi
index a0ed61925e12..1b9983ab122e 100644
--- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
@@ -36,3 +36,42 @@ &cpu6 {
 &cpu7 {
 	compatible = "qcom,kryo240";
 };
+
+&lpass_tlmm {
+	compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+	gpio-ranges = <&lpass_tlmm 0 0 26>;
+
+	lpi_i2s2_active: lpi-i2s2-active-state {
+		sck-pins {
+			pins = "gpio10";
+			function = "i2s2_clk";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ws-pins {
+			pins = "gpio11";
+			function = "i2s2_ws";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		data-pins {
+			pins = "gpio12";
+			function = "i2s2_data";
+			bias-disable;
+			drive-strength = <8>;
+			output-high;
+		};
+
+		ext-mclk1-pins {
+			pins = "gpio18";
+			function = "ext_mclk1_a";
+			bias-disable;
+			drive-strength = <16>;
+			output-high;
+		};
+	};
+};
-- 
2.45.2

