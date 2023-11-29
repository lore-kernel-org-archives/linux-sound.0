Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IE7f1Po2"
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F4710FC
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 03:30:24 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50bc57d81f4so630183e87.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 03:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257422; x=1701862222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE0OrQYvQYRAIUylzroozgbQ3n66QF638bXEaP+4RcU=;
        b=IE7f1Po2Pg7mgrNh/eOkXBgPJkVU0fKpBfYO/8X85vdu24AuAJBqj5FWRNGj8cf53e
         iyqyC0rdwFheZmR7MBWeXzV75SAyE9MP7sEWFwYrHK1CYHfiWHaPIGgf9Ca3PuZJonXS
         q5crqDO2pdYeJ7CPvJZycqZ5jmZ5hsI7BPwyMUqafYdAruP6abBcXKs8IOZzK6V+kvKz
         EVkWEQs3olt83Xj+5zVqpT9uDom0TFij7NToLdxfPEFFcHxJ4uGsIpytNte7fQKNKY1+
         Eb12k0a0lG/3BKAuKEai9L0ubbcNL1HimvHnM8/KYIfbNFkBayzHE7r61Q9POfe+XP8S
         ++yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257422; x=1701862222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sE0OrQYvQYRAIUylzroozgbQ3n66QF638bXEaP+4RcU=;
        b=kr6YCWXKMCmNt5KTiihnLxSE1X31/Xr4pH+zzJS2r/k9zduZlmuAIcO5J0HN4SabS0
         xmmPEsFZXrBFn19nbeDTBOYTHfPLwqGV7Lg447DWpxy+ETGIpuVolXFNxvReSvL0hotd
         LIznYQpxSSaf1MQrZvbwSHwgEbLaG5fw2r0ywStY3+DbU4sMkwEEToag+ev0DlCntTKS
         3vMtCuajc6QW0dncQ9dxupbcPmBXCcpapPZjEoV+iZtV16ZXriofD/X1Rs8R9sJdLb/z
         Q3pESi0sV7umYoMzRP+dp56R+Oy0bpUleIBIT7JtAu81QGBERXsyUH/EIJDCnTNJteXx
         h2iw==
X-Gm-Message-State: AOJu0Yw+3yp07LjJzmjAF19MgHx8YWffr97Qg3fLEdIaGL0o+6p4fnu2
	f6eggrYpay0I/vdwvX0pAORY3g==
X-Google-Smtp-Source: AGHT+IFx/OuqHsBK+hMJdr07SQLkr3EDAgk7jXr5RH/RO4THw8pSPYhX8UDYDwx4TsNQj6H27OYWkw==
X-Received: by 2002:a05:6512:2002:b0:50b:b918:8065 with SMTP id a2-20020a056512200200b0050bb9188065mr2958530lfb.34.1701257422475;
        Wed, 29 Nov 2023 03:30:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8650 LPASS VA
Date: Wed, 29 Nov 2023 12:30:13 +0100
Message-Id: <20231129113014.38837-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) VA
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 4a56108c444b..ca6b07d5826d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-va-macro
-      - qcom,sm8250-lpass-va-macro
-      - qcom,sm8450-lpass-va-macro
-      - qcom,sm8550-lpass-va-macro
-      - qcom,sc8280xp-lpass-va-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-va-macro
+          - qcom,sm8250-lpass-va-macro
+          - qcom,sm8450-lpass-va-macro
+          - qcom,sm8550-lpass-va-macro
+          - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - const: qcom,sm8650-lpass-va-macro
+          - const: qcom,sm8550-lpass-va-macro
 
   reg:
     maxItems: 1
@@ -115,8 +119,9 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - qcom,sm8550-lpass-va-macro
+            contains:
+              enum:
+                - qcom,sm8550-lpass-va-macro
     then:
       properties:
         clocks:
-- 
2.34.1

