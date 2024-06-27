Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB71993A9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719499497; cv=none; b=oYNJHanRsCUrH08MOjhxHhGrvYVh0SrYu2QIdLHKXpt31iwjc9zvqMoyLs0F4yjBVxIs7kTGzeYHvBdw8LrShjPR62e85QzICNJknpKP4Osn6yVbusfAa3KrlJknuUhhyw8LSDCoyZ1nwXjGcsSOVPCoCpB5YWnoH348NPwFCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719499497; c=relaxed/simple;
	bh=bMFgCtwFkYJijaWBVrk925QYLyPp0DOg1MhfjncrkzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GQ1u+FKDC3H2dmIUHRRuC9HIZvZAm8VkebmGFHEhSzMgAA23YWODernWlTqHJMn0I7OPze+jkZyxrxG42WvWWHFty+fqTuGFGn5qcO44u/f+hy4fE5wAX7jtmoL3P8eZh1LUQypkGaFxlzkLmBaBvYYf8t7gVsMaxyIAjrkjytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDzKBfzR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDzKBfzR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424ad289912so16659105e9.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 07:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499494; x=1720104294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPvgc1Cco3SnaS+ergB6X4Qiw2lTWzLcT3q27EN/3+0=;
        b=IDzKBfzR+dvb77soX2mQEMi6yYgtp3uxXsCtlI92mPAWiFq2NQwEqZgMj2Gy00i2mp
         2xq6lYaKM3Euk1r8rL2q20AhxkxRBX2iiGzajHlqADEL+uW/KEx6huZYa8BiUqPLpLYG
         bvTQM1j/v5ApMGkoZqje5gXtemdRWQ1EmXGIM75hngo98RKOMigtO+/nRq9LqlF8d8qs
         lMNW+VQuUHqcuS1S+m5QS3lfeaeYhYDjLAikNorsLHEfmNpkb5n4kUkUbBuf5DA5FwKr
         f6D9+ujI6JYGOYXwS5IZ1zWqdLz1TAH/P76cdSHWVocAkv7h1S0ufhYiK1JIE6WPiMFg
         5Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499494; x=1720104294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPvgc1Cco3SnaS+ergB6X4Qiw2lTWzLcT3q27EN/3+0=;
        b=HDU+X71wJs0DUFEeLfeIBja2MzWdcF5HBTC2pG6n8yJ5MgIkReN/fp+ejm5p0coM9B
         MlGIciVVJpRZUjdWl9l9tQez5IqrbNv9szyI3AHj4jBlFwBhGFSm0CdHD68Ua772FW3g
         hzsWVF/S/ZkEyMz+8uC7835v8jwBdoe0iGc0f7bUz9w3Eayyu+2CKcrxRnFrj32BFnrQ
         +Z+x2cEXe+s7/bpME8PRZQMQYzxlGeuT/0fvivQJp8D2qnupPCLLJJc06HMlge5LaWD1
         G4wM3EorUMrV8Hf37gRx4bZV/6imE0uwmY6cRgx+C9bhltJVEXOZF9iQ98FQnb6H36Sn
         hdLw==
X-Forwarded-Encrypted: i=1; AJvYcCVq7jrE5R2W0mElz6N7GxoNNOLA1zmzNEOFjTqJNPmeechuI0kpgTU89aIa3JvAEKK5F9t8It5lUX/xu8dK4ycUSa975S+E9GnhENA=
X-Gm-Message-State: AOJu0YyHdeVBahtjEZZdSXQ+XkY4lY9072yFCTK9xropTCoo9Cg0iuip
	rO8IDjihSLVfn3tEtHEzIqPayMjIn8nu/NymJBn49aVw176GPA4OnnUghBiLMjk=
X-Google-Smtp-Source: AGHT+IF6BIJRXTjP8xtoo7unU6Qn7gBQTh9iTGx3OOn8MnJjixs8Ql7ftO+NIPhHBCL4ETpldyN5Lw==
X-Received: by 2002:a05:600c:1789:b0:424:a403:565f with SMTP id 5b1f17b1804b1-424a4035701mr55384855e9.11.1719499494056;
        Thu, 27 Jun 2024 07:44:54 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:42 +0100
Subject: [PATCH v2 5/6] arm64: dts: x1e80100-crd: fix wsa soundwire port
 mapping
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-5-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=bMFgCtwFkYJijaWBVrk925QYLyPp0DOg1MhfjncrkzQ=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYm25KsOdMgKu5bWCuwyAfo4Q9joBXCroZH
 BQvZiqS91SJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 NxggB/9Tzz50ODbNc3ZTbTTAV3ZN5q6sAUxAlyZH0c1WWSRRVNpLc8c0CUWkdrIag/mczavgW1u
 a0Z5/BbP5vG6SZygRnjg22ZC4UNKIwMI3b/X4D4OulwXbWcNkqTzhrQaGQXXLOUPOujE1FtZkw4
 cP2eqgA5Qvk5Fjym5Naje+oh2J5tVWrrbpmD/ApB3Q0Y23Eo10I2Kbl3/jtGFjUVUonA3QVt6Ga
 fRo/uhgiJNVqFnK0X5iNrlyaSOCuCw4KO0VK2Ykx4kDrxFwzLnPfGcGxRXsSR65Zr114mJKHt9d
 8LT+c+UZktbXogp0r1YeENF4dprUWfEnUQWKAn+fWpIriBDE
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Existing way of allocating ports dynamically is linear starting from 1 to
MAX_PORTS. This will not work for x1e80100 as the master ports are
are not mapped in the same order.

Without this fix only one speaker in a pair of speakers will function.

After this fix along with WSA codec changes both the speakers starts
working.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index ce80119d798d..67c5cd89b925 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -841,6 +841,7 @@ left_woofer: speaker@0,0 {
 		sound-name-prefix = "WooferLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Left Tweeter */
@@ -852,6 +853,7 @@ left_tweeter: speaker@0,1 {
 		sound-name-prefix = "TwitterLeft";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 
@@ -892,6 +894,7 @@ right_woofer: speaker@0,0 {
 		sound-name-prefix = "WooferRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <1 2 3 7 10 13>;
 	};
 
 	/* WSA8845, Right Tweeter */
@@ -903,6 +906,7 @@ right_tweeter: speaker@0,1 {
 		sound-name-prefix = "TwitterRight";
 		vdd-1p8-supply = <&vreg_l15b_1p8>;
 		vdd-io-supply = <&vreg_l12b_1p2>;
+		qcom,port-mapping = <4 5 6 7 11 13>;
 	};
 };
 

-- 
2.25.1

