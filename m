Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TD1HTmbm"
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F6F21A8
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 03:30:26 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-54acdd65c88so7228049a12.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 03:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257424; x=1701862224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuoTW5fNts47GPp/zz/U4BPEMqSdOcRJOpgotFGXLGo=;
        b=TD1HTmbmVOmkmbeL7NASVcgXpk+ouNAYhqa6M04Du+3uMpzxq4maeXwhqrsClgsVip
         N4dhPKaWFz/ZYa1y73bmk77rxI2WyyluvtwZRuji/YYtxlWdws4Bi5awxWtdjVYD5TaT
         hYMsV8xZfXc8e4I0ZEu+Oo5wU91ODbqZDCk430YmGFyb+qmcc32vyCbnMNdvhx2bFt2O
         ikgMm0zAQXctXztxAVol+sSJQq9shT7vReFFORbaEwpIP8E9q4SlMY6K6IQucb/2u4CP
         n4ZVVkhTdYWom/IRELsQggGZzp3kJ3oluv/JJ43JzndDPmcAYfb7f6bce9ZEHeW8R6Dy
         Gupw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257424; x=1701862224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuoTW5fNts47GPp/zz/U4BPEMqSdOcRJOpgotFGXLGo=;
        b=OoRN0aMC2aJJ7ft1ZlfgknKTAF9K3kinilmn8Qm4N4YtyaNdjxDhOSWmykBvvxLaLJ
         IV9ei50tJ0xC9ZijbhSrtBwO8fhdXD8uETNGkjtZL+ftbXRXbk5z0WFGfjP2w39f0TVg
         CGqv15BpmQexTofl3fvAZCg/lr3/VdRrklqTZNJsitIEdvC8LAqarBmma7v8ELdi65xN
         1awHn6AkWDrLh5bJnPhrMjJBxVkozguee+WofsQAKxIE24CRUSaMz8ae0HYJQJjvIEkt
         Zgid4Gq8k8t5wIddZwq/+W1wshQ/A0A/9uiSRxNWSSJV4Hajs8avLeUQVQt2JydVcWMA
         oZXw==
X-Gm-Message-State: AOJu0YysCbim9ZS33YJMKk69vvBcHBelT8mUJHd6hGNjRUytmfa+ABtE
	HGYjevnT7dWstXe81kvbmKlcIR/t8cbi7u2yVVk=
X-Google-Smtp-Source: AGHT+IEHx5bvhNh2IGOAE7PXOlw27mYMxj7q8yRLiaQc1GYWBHE0clKsOrSLO7MzxHMzKLVRVjkuPw==
X-Received: by 2002:aa7:df0c:0:b0:54b:52c4:68a5 with SMTP id c12-20020aa7df0c000000b0054b52c468a5mr7456394edy.39.1701257424378;
        Wed, 29 Nov 2023 03:30:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:24 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8650 LPASS WSA
Date: Wed, 29 Nov 2023 12:30:14 +0100
Message-Id: <20231129113014.38837-4-krzysztof.kozlowski@linaro.org>
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

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) WSA
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index eea7609d1b33..5fb39d35c8ec 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-wsa-macro
-      - qcom,sm8250-lpass-wsa-macro
-      - qcom,sm8450-lpass-wsa-macro
-      - qcom,sm8550-lpass-wsa-macro
-      - qcom,sc8280xp-lpass-wsa-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-wsa-macro
+          - qcom,sm8250-lpass-wsa-macro
+          - qcom,sm8450-lpass-wsa-macro
+          - qcom,sm8550-lpass-wsa-macro
+          - qcom,sc8280xp-lpass-wsa-macro
+      - items:
+          - const: qcom,sm8650-lpass-wsa-macro
+          - const: qcom,sm8550-lpass-wsa-macro
 
   reg:
     maxItems: 1
@@ -94,8 +98,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-lpass-wsa-macro
+          contains:
+            enum:
+              - qcom,sm8550-lpass-wsa-macro
     then:
       properties:
         clocks:
-- 
2.34.1

