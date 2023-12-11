Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vxupRBh7"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9EDC4
	for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 04:31:12 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33349b3f99aso4075144f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 04:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702297871; x=1702902671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RN91HNt5gkaIzgOq9vwezVCDXB7gy5tWKyJ+X5HCihA=;
        b=vxupRBh7oWaVum5aI/uqEZr806fwfYVCJbKUZO/I3zPkWBWDAmzKDb4uTtVXlNpI7X
         J1AMwupmvG8qoxCn6xN9FX41zbmSbeR8b1n3V1T6+Nr6Zpiu0quObzAi3YrEFH2aDB81
         gc1EYa0zcGArRzZgm+EaL7f3ZKPo4QOWYMHHXv1w3rWLGzUEk6Gix+0UtEk/60U7m8oW
         3iBK/UUBhrDbj6tHFlcWoNczROKI/EgVdTgrGP79j+sPc1x5Kc72f7IBN1ATrcxScmJU
         8FNGSFGkRsDOlfOKkXYAe4/9xjvLf6iBfnR4RNigN4xnUU2lyhLnpR1fw72YqTjjoxrs
         PIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702297871; x=1702902671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RN91HNt5gkaIzgOq9vwezVCDXB7gy5tWKyJ+X5HCihA=;
        b=xDIemsvgYSCiVMeJ7igrNYRACRJ1YPsR7zkU146tBbY1OoDQJ6dmq9seEEDiXlBQ70
         Zrb2G3iXH0xC9J4R85GZvdG/LC99WfnYzmxGvGCWr4jQ9KNrRpvuJRu+mg5qoRocNX8S
         WZ32HOYB9lYWm+ShajnU3An6TfX575ta37VMGtTOvYhAD4dWl3y+jYO55DHxNF9/Ue5j
         LEZeZpve5Y0Q+l3uFXThFkemBAei81psr3e173cT1f1qvLDBnrXXSMQZ8ys6gCKuDuL5
         j9SJIsFvhAMg1x/WSCIar498Pk7PmsNw0b78vdDC58Q6mvFl0dMWwU/lvB6GtONrzfPB
         Cvtg==
X-Gm-Message-State: AOJu0YzAo0xZSdfk3jJW0vLLhDn2v66UkxwAX8xNQIikyxIWmey7y4qu
	MNejFB0cOQE/RgsQwc5GEGIQSg==
X-Google-Smtp-Source: AGHT+IGe0TsF6kU3cIp8ndlWh7qt+klx3I1j7J1zNAl229HSG1N5Cw5CH8QU9alImW7ATLvT821E1g==
X-Received: by 2002:a7b:c389:0:b0:40c:3820:f004 with SMTP id s9-20020a7bc389000000b0040c3820f004mr2353363wmj.132.1702297870759;
        Mon, 11 Dec 2023 04:31:10 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s5-20020a05600c384500b0040b632f31d2sm12932313wmr.5.2023.12.11.04.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 04:31:10 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add X1E80100 LPASS TX
Date: Mon, 11 Dec 2023 13:31:02 +0100
Message-Id: <20231211123104.72963-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
References: <20231211123104.72963-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for Qualcomm X1E80100 SoC Low Power Audio SubSystem (LPASS)
TX macro codec, which looks like compatible with earlier SM8550.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-tx-macro.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index cee79ac42a33..3e2ae16c6aba 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -20,7 +20,9 @@ properties:
           - qcom,sm8550-lpass-tx-macro
           - qcom,sc8280xp-lpass-tx-macro
       - items:
-          - const: qcom,sm8650-lpass-tx-macro
+          - enum:
+              - qcom,sm8650-lpass-tx-macro
+              - qcom,x1e80100-lpass-tx-macro
           - const: qcom,sm8550-lpass-tx-macro
 
   reg:
-- 
2.34.1

