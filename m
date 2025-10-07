Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C82135B8
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 02:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802626; cv=none; b=MhIYr5qZy35SKwdYZBrEKOliDL+SThpVN73lYBvR+DSw1AqyqqCpa5dsRoCli5jI1nC8NQTPnowYq6QMk+/GF4PgXPSq3H8lXrbyshWKxoL6wwmSdtcmGBz0oEJCOZfYImaTVzufe5VfMergFgg7MImCL3MScyniqZDYeBpyw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802626; c=relaxed/simple;
	bh=mzm8zjzGXa3bcj2hI1nuVqjf+8xVLhv71Tv/OMlTJC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+caTzhpIDBhhfNOAEUtBgVeRW7nr6s+Yz1H32Sc7ul7ZXKq9lYJ/V0KlLYlvfAt/SkKOrFAqt5Wxt22MdpnA5OaztTtd1EFh/vw8aOWTzwuGormYa6FXA7vFx5NkcjBUuWLSB/c3WZtrje1QDIXRuFUz+GwE43IiOjWdqLciAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6bqFfaO; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6bqFfaO"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3612c38b902so59297651fa.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 19:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802623; x=1760407423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=g6bqFfaOYJ7ZSkuQhlCZaUGoXNKvF1XSUh0oKEh4m9MNbTFf35fuYkSbdl3z1nhlot
         WALWuMa//rD1r2ASBZk6lSf3iCIj3MeJSlBBjJQtSE4atB4D3OdLM4rgalnJtX0lwPNf
         FJ4AxnWRO8kDryyNZIe+m0lfzI4HUGuFy1R/5eUxDAmDYTjgL8SFBY8rNjSYl3vRClWh
         b45bAinUL2NLgMrYPBeP2uuK+8zDPHOfG2GACFJYiu5oTNEw2Li+Y3d2KaKgVnH2pYmB
         hwNjiMRQpgVmllt4q7/grEJiR+8D6sxXKUFGl5BWY01YHJRZnGMht2U269Tzg5WNaQmR
         cang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802623; x=1760407423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGUtKwd70bSCJqEqH6YRK5k2F3XmhHRzuE4jsE9R33M=;
        b=tRVWovifdhsvz77FVSu5xDuhsuZ/aIMsmoFo8ttO6zd4tKTdZcPQqZP2Wo9yYKt8fu
         qpX8ogvCg2K4HswfPPNM+hxhPjX1uGobm+5naA3hO/3+DtoJZdI6YzukjTfBbzKn3wBv
         ggWpQy83lE9BCsH2/I60l9ZY19tQlJJobZttKYVXRKpTgYmG2NBnIp5cX2dD9kJSCbNw
         yJfuVpe/i1Yo7pWYsUCmuTPBFvAcsQjhiym+31LuLHUppUbpudcBGBpp1f/cPdeu1qVc
         cBJguCjjVDU0Ba14XcxP9ipSOY/X/yVeIHB6tImb/cr/dx/q6FSJ6Q2ghEWCxCjMNovY
         wsug==
X-Forwarded-Encrypted: i=1; AJvYcCV+rREm9jyIlsbhMHZMLOO7v/sOsPadWzV2OE2AckfVIcqlscTFrLSYoJ/1HBbiUPqni8O0CIadqZdxdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTZvBl5srpOJa372s8ZW0Axr/CkcE/lkKt7gIWNl2Dbzy+8dJ1
	c+6nXNhjEA85NACWtoZntJNPO2oty6IxEgNsr9fYPviNHDy4MAZ6odWJxWpVr9uHcjk=
X-Gm-Gg: ASbGnctxuu7vG6SVdjx1m/6UfqqasNJ7Vv8dS1AL7UxXuVN4JmUtrqoHp2pcXU0ySA/
	9e3SCvytTJKRPc5PBo67x0n5r/EeG50NXebiCTcgTn9Vpb132Ssc8l0eaQi2ul1hqi+VGb6aMp7
	hUUtp6nZK5gNGP2jS++hTXgkq22fI3m8NNkvOxq1B7hIPKGfJDmLI8hM/AOkgB/uBP9P2xcOysu
	V2rThTzB+CrCAyMRpygLlWnooWQfuxxkaqmBu33A4U5oohQ8r7AshJjGYBpunV0YPetE8z6iEUa
	autAscnGLW+z9zwQOiSimL195twyK2CjCcZdie64eTXXmJIG//piDi0tKTKXenjrkScMMTWP+FC
	z8KRM6Gbrw5wslvV4ClGCiP+Mp4GyCLSun8gue1YJGdXVU/Uix0iSDloN
X-Google-Smtp-Source: AGHT+IE4HQVkFdlKGXrY6xYmCUgYIpVGDsuz28td854iUk9lX9wCkBz74qKY5/pdVWTQuPzyDebo+A==
X-Received: by 2002:a2e:bd85:0:b0:36b:3a21:9c28 with SMTP id 38308e7fff4ca-374c38370fbmr41203691fa.26.1759802622931;
        Mon, 06 Oct 2025 19:03:42 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:41 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:30 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: qcm2290: add APR and its services
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-2-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2

Add APR (asynchronous packet router) node and its associated services
required to enable audio on QRB2210 RB1 board.

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 08141b41de2462ce91896fd84644413fa46ac047..7303aff33814f256a2ea09a71a640db466370eff 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -17,6 +17,8 @@
 #include <dt-bindings/interconnect/qcom,qcm2290.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2077,6 +2079,76 @@ glink-edge {
 				label = "lpass";
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.47.3

