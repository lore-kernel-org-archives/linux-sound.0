Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C942528EE
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 09:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375878; cv=none; b=UdX9huh+H+UQLISD6bDUb9qBZM6MfB+sDBBeF34do6YKXgRuxKx2WDV5CaEFP/zaiL+RqG8xmF9uR27VJuIfT5qPumoH90ktfK+k6xnhQKzybInhZ79zJWNRn9PMW1md9KbjqtuGE5jkdqUE53Qj1Rt8PYIh4lcxdx3Tmgm9Q48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375878; c=relaxed/simple;
	bh=G/PQgzYwrYLYsv/3Tx21aVxfqG3KRo86XzpWAbXD6Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UV1n7BmIMngNlFpids56lngTSIhroEariWJGWboBBEx2+GK26OdQIOp6qtqSMXWjc/l0xM/Mc2qOrEqH3GRl642F1eNXODxgF3GwP0PPXkmZd9cZZoVwig25UZ9XsObPvA0j9UIFJhNMmiwjDWrLfJFgi4HetJ5wXuk2fmK3DXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fqvb9XcT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fqvb9XcT"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so4242076f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375874; x=1742980674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MatIsPF8IuzJGTj4rqzD5SEaynR7KV/+RlpqBdYnhsQ=;
        b=Fqvb9XcTfRzkbiNj7uB2sd1ZrN6eRfgSSOON3qcypf101Ons81bD8YEM8P7fFkJ+vv
         Dr/inQ4V6bcHc/bSBZ84L6lDcyYqdv7jXDQ4VNN2Unn/YQpaOEmATo+DBH9+RNPFz8bU
         ZteylGpRguI1b/1xiBL12YoM5SIOaRL51uVqkLKvjpeaAdK6aRnb7rHBQ6LsNUHAooAs
         PQHmecUOutNRbF4Z9SPLBbhnCSvp1NT2KXA4ob7emNTSb45kvhdkasbKok0PDU6Djk5G
         Svb52qxVJf2rjyXt/kCqdz8amF6Bq5k9EqrUBhxUFH6k9OEIHy/nE79/Vd50GqyvBp4e
         MYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375874; x=1742980674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MatIsPF8IuzJGTj4rqzD5SEaynR7KV/+RlpqBdYnhsQ=;
        b=HTPytFOs3R/OEi+wF9bu0aJkSpb+DxCBkJfZ9GC2hKGqieJ0DE4WkGuIs4udYRqCLs
         mHUogSZNOnx2bYHJr53PvP9dBHdI7Aifn2QDhwQihPuTaZtiSQoSbtjny3qGNJDGJVye
         88SaDW4c/6BZQTskRq8aisIkoJP5msqxBEMuHNQnIeWCOO8EGtjrfEE77faEhIOVscPG
         9lFNfGsx5eX044F0yAa6+qokuEdcTsxDRLT/K/rJfoe/HqxFT5cGCqmak1n3ytXqywQj
         ZJ0KBMUlI8YVcgdq2+oEqtlx8ptVe43JF0vDN3k8Dm/FU/J4RGeb3vyXeGT82z5GcRRd
         SIew==
X-Forwarded-Encrypted: i=1; AJvYcCUxWOzxlgOLHY5Hpk50G59aCM5vLrW6xbMGX32d5kIR9VaYSnb/5im/GzwLlFQ4ifR8rRqZxnSb7oJRbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0QQ8BJkg0Bw1aiTJHqvWC7cpV4brpcyjzd2u0HC8pb1Kja75
	UeDTv11fRrg2Vm6fjgrumQcy/2wnyjJumEOm36MFZk2XnJPV8USvITmF8QkEgn4=
X-Gm-Gg: ASbGncurFB2C6dfbX2TYEFizRuJCSfa051Rul09hlPL+gv5hiZItxtpi6fXGsqbVFKv
	ihZBQww7DlZS6MI8NBpMaYYR0ghtQ5k99oggTeLxpu6KoIWser8sEy5rDDQrlYj5rhFHSuGzX0E
	0mXZmTyn2nS/1ZuBWCB5nRSAmYdQaoyrrqMFHDMGxXfRjgayIk8zCSBCiiQX+4ccYmyKYunsbUV
	NIaWycbSxxKBcYILZ9EXM9dYX85lS3FnaFv1/a6WsaPiqT0PgVzCNgrpHfxDs1cGLwnIWejtMb4
	pUHfhF2v5w101i+wIrnphzyfrDI8sQuDS6S5hiROzGwiJo0OEqdIzuIR9JpTYsnExV9uFQ==
X-Google-Smtp-Source: AGHT+IF2OI4R8vpQRvrvPUiz9MYuf6mjmby8aJEe+xnR6Wn2dDxTXW6xtohznPik5sEd2lnjFnvXNQ==
X-Received: by 2002:a05:6000:2c7:b0:391:4674:b10f with SMTP id ffacd0b85a97d-39973af9236mr1231112f8f.36.1742375873640;
        Wed, 19 Mar 2025 02:17:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:52 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: x1e78100-t14s: Enable audio headset support
Date: Wed, 19 Mar 2025 09:16:37 +0000
Message-Id: <20250319091637.4505-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Lenovo ThinkPad T14s, the headset is connected via a HiFi Switch to
support CTIA and OMTP headsets. This switch is used to minimise pop and
click during headset type switching.

Enable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this, headset audio will be very noisy and might see headset
detection errors.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index b2c2347f54fa..f39c51c809e8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -22,7 +22,7 @@ / {
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
-		pinctrl-0 = <&wcd_default>;
+		pinctrl-0 = <&wcd_default>, <&us_euro_hs_sel>;
 		pinctrl-names = "default";
 
 		qcom,micbias1-microvolt = <1800000>;
@@ -36,11 +36,13 @@ wcd938x: audio-codec {
 		qcom,tx-device = <&wcd_tx>;
 
 		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
+		us-euro-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
 
 		vdd-buck-supply = <&vreg_l15b_1p8>;
 		vdd-rxtx-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l15b_1p8>;
 		vdd-mic-bias-supply = <&vreg_bob1>;
+		vdd-hp-switch-supply = <&vreg_l16b_2p5>;
 
 		#sound-dai-cells = <1>;
 	};
@@ -367,6 +369,13 @@ vreg_l15b_1p8: ldo15 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l16b_2p5: ldo16 {
+			regulator-name = "vreg_l6b_2p5";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l17b_2p5: ldo17 {
 			regulator-name = "vreg_l17b_2p5";
 			regulator-min-microvolt = <2504000>;
@@ -942,6 +951,13 @@ int-n-pins {
 		};
 	};
 
+	us_euro_hs_sel: us-euro-hs-sel-state {
+		pins = "gpio68";
+		function = "gpio";
+		bias-pull-down;
+		drive-strength = <2>;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";
-- 
2.39.5

