Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9CD29ACF1
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 17:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935674; cv=none; b=rBhL8OV3LLVIEQW72q+OecpLPDyLFlrTamCrvolECYnRlgoC4Em+p4iVwFwSNm0sec+a4uGpq9mIgtazZ8+TA3xzJb3ZB027Wk+1gnqtdjjy8hs4OXCz5EmmZd/11mN1Z2c2qKE/+iZfZ3ZPRkNhK41LJvIoWRxk7BE64o6wZIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935674; c=relaxed/simple;
	bh=lhEc6CmxoeqjBbJ8Pm6+cHPF11xa+fHx4k1bho3h33w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KwzQ5xmkuw7d/Z5UaqAb/pQL+67KnOMRLGGLp41vGD5KjmheYr2AKTtwgn7oN7ko0+sESuzAXLOcG0Oy2OX/6prhHl4PdSd7Ivwd6BQT1b44NMYDZavuukEGxYhCe7Wr1e0bhC4A7o3C0ve6I7YhSZIiZJty0xpV6isfwnpl2+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KgeLvx+O; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KgeLvx+O"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe574976so61180865e9.1
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935668; x=1748540468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEEzJQh+mi4rzI2yTuNmUyI1HaStAMzjYAaHLCvcS3s=;
        b=KgeLvx+OI+jG+o6JN/k0nt7mU7lmKxFh+tO9GjHoHGMwxJL/ggYaa3SCDqYJj/gLZ1
         nhD72yfmRxBhtCZCshuTyiyug2BBSBr1T5UY9/5F9tagYqU2mgAVRA4DbUBkRaVJ9NWp
         psp/aZ6OwaNmhF4z1LQSrTsCTC/W46VScNc+Z67JU4mX7FvplFjvxZ+Zx+UETFtp4H4G
         AKVnVQjgeFmBreKOhVcO0t5XN+mWY+WnWWOzNfqqXZl6BkmUblF3Rh08/sYAj/pDy1Rn
         s7BsIfN94WV1nUPqDBMN2jpbv1efjeta9BbRCV24F+2O+j+YBUO1QmbJ47ePjVWUvjoI
         OQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935668; x=1748540468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BEEzJQh+mi4rzI2yTuNmUyI1HaStAMzjYAaHLCvcS3s=;
        b=FfEsCn0us4rCFV9I+Cbh0h5Ol23pRoPlm8G+fGT+ct+EkPNurIdHlHqxS4CcEPVJnV
         BfTvhnIWVbR1SuNjaN7LmoaPbKhPIIJeAEW6gc6pOfknABauzGgJK4tMjj7mMOHl0Uqf
         SF7T7CdU7XnOIGV73w1sv1ytA4mIzPGOSe8ow6Wx7Sr1vDtPwQabIa4ijMqr7OSRbj5e
         qYm9/Ne7XjO97PJ6YzN/4Ux7mbpCQ5zdhaKca6t69eRf0uoT/snm+6yMmo6xeD9dKo6U
         vjk29IRkMRRrmCHFS7KfXO3QXOCxwUh6zFeNFIJ+d7lpPEQAbYoX9C6S3EIchw1eRjeZ
         cT4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVeUexIhX2ywvZ5T430u+mCR+EjVwetXyACNZ+l5HPORckxdzuFxD+BeUZ2lAQ7sz+lQhZPaEpoGMCUAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUCqL/72pIBUp7OdQVpsvPyQgqlG/QxYd0uNBEHxuGrg58Jvuc
	2uRe3RQDMNlylbIuoYZhmwH2BYFZsi+HAJvrUaahRQB4dL17LFQHy2ptU/Fk4eqB1Dc=
X-Gm-Gg: ASbGncveY3VvoVrNRr8KTP9KT16ZD3VqcE7XOZQey02f4TQyv64j8+mFv5ZhZJNIBPr
	zif/erzY7dP2DGdnWkGJOkLQnf0+7sZxLUawSqLDthgbOGMAR5GMtcTupJ4h8dKHyANlwc8CTcC
	7moD7T62a5xO6krPXKSpxZG/jj49j57ULMLz5NrBEDhabUJAYzOgRoxkOal4YapA/ciN06nRGVE
	zQ/ZWfqVyKSKzqK0P3ylawAS5w3ffhHIQT3pcl+Ag+Cix8KCJiFPOpI155e4vZUtjFfcywLIqoO
	bAYXVG2J1mWnQrtLNeJ21W6K9OvCUZ4f8sL5L5CpBVD8G5A30f9ClEEPJwA=
X-Google-Smtp-Source: AGHT+IGgojgkTlxJMrB0QdTOFW9DwcjfnE2HsPWKTiCh2DyT3aGjZFJfYpsdBpxBzniyJBoPRyM8gg==
X-Received: by 2002:a05:600c:a369:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-442fd678b83mr295575445e9.30.1747935668030;
        Thu, 22 May 2025 10:41:08 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:41:07 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:41:02 +0100
Subject: [PATCH v3 12/12] arm64: dts: qcom: qrb4210-rb2: add VA capture
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Add support for audio capture using onboard DMIC. It is directly
connected to vamacro and txmacro without any soundwire interfaces.

The capture was verified using the following commands:

amixer -c0 cset iface=MIXER,name='MultiMedia3 Mixer VA_CODEC_DMA_TX_0' 1
amixer -c0 cset iface=MIXER,name='VA_AIF1_CAP Mixer DEC0' 1
amixer -c0 cset iface=MIXER,name='VA_DEC0 Volume' 110
amixer -c0 cset iface=MIXER,name='VA DMIC MUX0' 2

arecord -D hw:0,2 -f S16_LE -c 2 -r 48000 -d 5 record.wav

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1e2b9d2516b62e2e80c40ed6c3a0c4548a02630c..1c125ae4e2f3eb4f715bd0aac42a60b9132ecfbc 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -169,6 +169,22 @@ platform {
 				sound-dai = <&q6routing>;
 			};
 		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
 	};
 
 	wcd937x: codec {
@@ -833,6 +849,12 @@ &usb_qmpphy_out {
 	remote-endpoint = <&pmi632_ss_in>;
 };
 
+&vamacro {
+	pinctrl-0 = <&lpass_dmic01_active>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <2400000>;
+};
+
 &wifi {
 	vdd-0.8-cx-mx-supply = <&vreg_l8a_0p664>;
 	vdd-1.8-xo-supply = <&vreg_l16a_1p3>;

-- 
2.47.2

