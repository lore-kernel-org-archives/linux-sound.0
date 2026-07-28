Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B868741A569
	for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228819; cv=none; b=NG2S9G3dA2MhfMTHxQT+CKRtGjG2RIwCifmVmCBESr2yx+6FZiNZj4eeCuerlhdZcWVbktXrmPtub4ea+FjC5xXqdAZoLH5PsbYr7kFXvNIMmtxvLOr2abHNwS2nLlnAUOuc8ePHNAaMwwSp4VqpuImM4ddAHieFFu917Avvl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228819; c=relaxed/simple;
	bh=xgbLbY261eWmT6FIt6inTMaDU2FZWFKfaA6jP697Lhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5UBTiMMPDEXbCfiYmbra0PncpIs7lGK8oo3MpRRk9uQcxtfjw1WSz9NlH3k4HDSd82s41GkpEpsg7+hVxU4EqOi92TzxdbG3OEEb9BceCXaksvbIcmEJm0s2K5ojCaf+y7/Lk/VOn/27rL7K1KP5+hMSAVZFwdfFnnc8OhGsgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yHhblysO; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHhblysO"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2022503f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 28 Jul 2026 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228815; x=1785833615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLVjsVAD19u3CTDbNlq5NzTqXbQ0WE8aVC5TNq/eY1Y=;
        b=yHhblysOWU3XPCWwGz7ypl7Qkl950r3XJ8SfNXM9NIhih+jgfme/QiVtv0aKbriOz/
         QI2obVZNeGBwx2ynBD0S40oy2gVWaWMF+tEjFbSDVguZ6j57rMHcJFmnX04bWJvTI8aW
         qqMhkihD7O1RpSpr8fKetRgEYWIHTRk2izDQqEnNzH6qNVMsfsxyNyIbTH53kNXN11N+
         qItRWhQ5dKlEOmN85BbQtXEMGUC19CuInG8O6QvdKXu4mwO8a+bNW5FPvmN3kQrXZOHx
         74qaNRItRUZ3OnjX6u9gmvywcKPDE72zJGFtFZNjhrqs8lAkDtNed/a03j6OY1iGfXpa
         iFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228815; x=1785833615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLVjsVAD19u3CTDbNlq5NzTqXbQ0WE8aVC5TNq/eY1Y=;
        b=gaUEyAlHd0RnHZe/77WsqlqNGTPiiUhAz26Fq9mF2AvaI7MB1YDePaoaHkKTt4LFDK
         kGfGBQA4CbWGLAuvEW/Nmr9gi0szxJWGRczYHJkK+njkWWqI+jb330NSeBV7DTFXKLaz
         NkkbhDbP7szTA0eOBL3JCQMzU11Y34dBp56W6IpbzIIZSYUBUJJd+b1tjUVJ1vmV4sO8
         ShpeQky3mJ6J2HFjuP/3uAs91F0rl/NJiIp21qYHxuKWbHBwtDzRrUWlTKxL8Y3ZDRS2
         07HHy1NA6atQMODP5A700+NJiHS2sTwyDlQkpKK8Dt5dfz973DFC/W/4V6ThaoHgZTb3
         pTTw==
X-Gm-Message-State: AOJu0YyK/XGCpakC4vi2WG5hghwkTUwlBYBsHMt/p8gJG3i4Fk5yVgK2
	61yKlO1UkoucQ4RwDkl6RcxMC1pVllrNkLug4nOSvyBIltuoJCi4E4ecyncyOYuXH6w=
X-Gm-Gg: AR+sD12jpOOZU+5CWot2PRPzibXwbqKdOKJvFRrjZuXErQaet6SUkkpEOGmYCPmDcNH
	Ax3G+p533Ks/dJPdgiaUx1nvr7mQrXNZd+dfkq25O2cVliFGxRdWqwubZaE9GlPzCSGLh2psa2S
	fSR5IHWj44xEwPejlSz4+sPjJ2ePDHwp6QHiQX86XnY01AA4EM/LJ1B6Dt5xqJb0TGnbe8w0uyF
	MiktvQBs04MWFsyYq5eUkTTSFdMqkgy7usQNbeMfhWIouhK/2oR6QsWCrTL3rHgWT0ul3A3dotf
	ZavqWSVClJJXj8QBP1wCNdZwiV2ZhqBJGswlp7hXrKtk61WubqWPAtu3dQbGMYo+V6UqnFE+dhm
	qDNxSgfG9fqy9U55lr7ttSYosyaLz0tmNtmm7vRw1ec9eVULyNrx+cOdsS7wTU3ig15P662me9R
	6CR/VOXO8zsUJ5RDhYvoHKWj5cR4AQPJLfW93vL5AOkc/u
X-Received: by 2002:a5d:584c:0:b0:47f:95ce:6f48 with SMTP id ffacd0b85a97d-47fb1ec9671mr1689487f8f.11.1785228814910;
        Tue, 28 Jul 2026 01:53:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm56430085f8f.8.2026.07.28.01.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:53:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:53:30 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8x50-next-hdk-i2s-v1-3-2393a0fe4aa9@linaro.org>
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
In-Reply-To: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xgbLbY261eWmT6FIt6inTMaDU2FZWFKfaA6jP697Lhs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaG4KYuSen+vy5fb4xpR87fTq2OHAMF/Us6LfpCuX
 ZGk733yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhuCgAKCRB33NvayMhJ0TfUEA
 CYJ1aeFNLvsTlezUPEWuZWUPfc6m/bNBSi5Wl58xQiEfejWhFBoT6jxQYq6o4WMLdBs4d4cDn5/CnM
 Lx488lb8PAvRJwBxttGmX6c8arDjx5sqc6/xwuj42pWK7Lt0hnc5cZR4omTRVT1YBwBBIA8v57MZPD
 BjZ+A3QWJC6zhfP6gksQPFMEV/3Rzt3OIHmYol2lf9eKdlOUF0J1KOWJgMuY7Bq3sARpx3YVEgdlIw
 pvCCelUjeXNH1SYl1B+6Cf6iYFqrqBVuspD49/R0Nz6UjWHihI8z2Jfd7R6gPWMEhosTadY1DAFRY4
 q4aA9rzCIizMniuDbbGiBfn3g8J1RAGRUQH0lZQFsQIOBoA2QWaqcJIdgEXwc1Wn26ZKzR5NJWoxwc
 poYIk51HcnIDe+FjMK3hrjegI9zq+rlJtGYoiZsY8KeZ3Gt9XNreHPvJZFORDQdRV9SmcBbGB0UebR
 GGXmg+GQGq1oWM+W/EnklfGWNxCebFWrJi5QCJReO6TZ3O+rTxZbbgo8ztB/EqSYwKchBBwZ8iDEqs
 6+oxyPX6uhkNiweYqBDeTsB0Q85rrWGSTwS5VxZrA4xWKwCwoFMzXyIBfxgqTCGcQo8k8gluDjbGmk
 aOXjZ70M7xwOJHyrfaeu34Idn8N9jciOFe6JW1mgiOElsAF7/BnJFx25RGWw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..87792fbf3323 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -278,6 +278,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		prim-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	wcn7850-pmu {
@@ -888,9 +904,14 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
+		#sound-dai-cells = <1>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1144,6 +1165,19 @@ pmk8550_sleep_clk: sleep-clk-state {
 	};
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@16 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk",
+			      "bclk";
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 396201905ef2..5a2f88614cbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5526,6 +5526,79 @@ data-pins {
 					drive-strength = <10>;
 				};
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "audio_ext_mclk0";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "i2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "i2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "i2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "i2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			audio_mclk1_default_state: audio-mclk1-default-state {
+				pins = "gpio124";
+				function = "audio_ext_mclk1";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s1_default_state: i2s1-default-state {
+				sck-pins {
+					pins = "gpio121";
+					function = "i2s1_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio122";
+					function = "i2s1_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio123";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		sram@14680000 {

-- 
2.34.1

