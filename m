Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B4394470
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 07:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077318; cv=none; b=OOGRELALY771ZZW6y3QJOX7MeyZw0SK2ako3i6U/olc6A6QoeCoS7yQIk4VqRpFJ7FrmculPyFxWM6o+xElLOTti/uhyOM1YhQsPV6IoGybJhfqaDd59C/u/7br9uRdAB6OMYIEVTH2pxGkO0l8byyJdGxvmpN42r5FWfI9sc78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077318; c=relaxed/simple;
	bh=Qn4TFtKF0zH/YtALFUlzzIs3K59F5uQTYpF2B2pucII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bB3CR6jUPI70tf8yaWc8QlQ950+EjFYhL7r5iIHlrYcWSywHiZ+XltB5NSjjC8yVEtdr9O+q/vvyKtDXRSsYtId06IY5fvPuOHAEqh/Nm3smANlKmosCj5njfI92y2PeUyAphYFI6s7LBydrao5k0C7kQLz6gmC8I4HAwOj4azY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V7omvVh6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V7omvVh6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso53258845e9.1
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781077313; x=1781682113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7eBobhuN0t2F3bxCh2U0niPdbCcCjlL+1oHTHNqL/8=;
        b=V7omvVh6reHfyCPv52PmKWmWzJgpg7npl6GucoBJer8+togLlE2ihtucY1qpGw5l5V
         1t3tXLfNloq52ZMavk0LGg4ywSvkM2043VDy0L5FHWwqBqkevC7ZY48w3Od3XY/towAy
         WVMAISi4iLUMjD+kvJlnna1WdWV7+m7iaCKDjW/sm1nvJOvDWsa2JATADSKqLMew7KKg
         aUTjfykV7qwo8bsnoh6oCifdPDrI+l1QH35epA4ttRiNcqXg5bAPB803svksip22wRbG
         Fw1bv/NbzvCQykPPEaQf5eqkm42m966ccRLujisWHAO0aiyrod2GOxTz7r+rIvHBZNrf
         0Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077313; x=1781682113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b7eBobhuN0t2F3bxCh2U0niPdbCcCjlL+1oHTHNqL/8=;
        b=aGhd/vFXO44VM5PeYVWuODT0B9qFNpfVhfq0/Igg9/cW4g+iy6rHib9wPBqcDlHYVd
         U8fGPFBrUpnjH7mCGvuKTESfQyI68JidpcZtM0nmTYV6WImVcDhHB/W0470I3VepBfvu
         DDqFe6y8KeNSD8rO6A8fdlamQZXCMcJj7z9WSNaixsPb34gf9npY2Bs0UCV7ws9NF30e
         5A2ruS7tXtjLQ6032/eE+N70TAn1u5EyVzuFwslcETaUeRDcOAKxCIbRownTXzOUweCy
         CbJ1rgv+HrDrFOF7CyHgskXXue7b//ZNvXuY/mRGh7Se/skIkqsk3mT6yEkWhlB4kW2S
         0amg==
X-Forwarded-Encrypted: i=1; AFNElJ+15KesozEzZhX6w1Br4qQqe3FdGmaavzlyaKnwQQ0H9LTGSk+X7ByrTWgx0FoLNovHGxExTfQzDQ/D1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWa0SkVjbLvx/b0LjA1EJuhGolH7drObKQ2oa1q9wpVaTVMDG3
	FquNq/I2Lv0m5YxTapLt5giy7UEWd0FebHmoUyrFcKQmYEx8slmSKeA5QMIig/o4eHk=
X-Gm-Gg: Acq92OHepHHqpur6fra0Q3T70LQldShNZXt+EKkx8L4cenJJSTXWUUEzR0zBrx5Enwg
	rAAHZONV8cPcGiJeLU5KVpAt23QeitlBsR7jqx7TBw77wxwO4STzNIIylc/HR3/PistHd2x6waA
	4b24QOU66d9F15wqjqo6vYyS5P5Lciw/NBl3cE36bgpNhomxevA2nZkW9MoJ2pDoUWdduqrqy6m
	iuMEMS4ZwfyEeuje/rY9rJ4VmWQAcLYDGbKQBLsrzhcQznsP8GODVNx2aPMLTJ9TrhOTiMmR/7B
	k3q9zklW6IgDdcx3KauTZ10Xyp4ZmWjgXj21giDLKszjvrhKbTZYjzco8uxfiqJY1hcbqYr8LTM
	pVHaul+/ctWQsl648EbY8A3jWc7djAU15dj+INOT8rCoRbPTVrd+K/wlwDquWA0lXI2OQHD9ry8
	NsDOn0Eg1RJJADyrYeAQsvGW1h5kBxTbOYsz1MPMeUL/fVnNBF3I1s2PKmGjWRQomKjw==
X-Received: by 2002:a05:600c:1552:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490d71fa5a1mr78852405e9.8.1781077312982;
        Wed, 10 Jun 2026 00:41:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm69161344f8f.20.2026.06.10.00.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:41:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 10 Jun 2026 09:41:47 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: switch
 sound card to ayaneo,pocket-s2-sndcard
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-3-18bb19c5ca22@linaro.org>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kancy2333@outlook.com, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Qn4TFtKF0zH/YtALFUlzzIs3K59F5uQTYpF2B2pucII=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqKRU8AV9+r1C54zy/T9xZXXpG3cmS3d8cGw0RxpKx
 G06MVSyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaikVPAAKCRB33NvayMhJ0Xp9D/
 4tXneInCiTYra0b4m2ya7YSBNpbBZDJS7u3Ypi6GWwYsTwBI6Dq99j+omnkbT6c03A0gtj1+7V8yrA
 2NjCZFrXZPk1kMFEmIDYb8vRBJnykRw3MwA6NptmsKjxjeexxECgvzCrkmt9Hd479xgLrbcqTGxbfN
 ygPz/7qGkVmzgYHUZ1p9OB4WheLQhdC3I7NhjLPnoU3ohuyrZ5JctUKXq8TCZguajceMqBsJK3z1B3
 fC/QPgU8cFO+Icct7HdclzZ4LIMh9m04yXkmgipOdhIdBIFlTF2rpl1t9DQj93dtLwUIMxDgYkE+rY
 qtnBvp4ly0T+J2OdZ72tk6LTHjuuA09wUSZNX9xpkP+pb7OUNwiCUposU7WvjXStgGCAgVBmY9iXRz
 c4RNTF8sboANex45CQLu7YIbQGK/Gf1giN6tLOhECH6SDJX0/srdV5LloJDna7SIrh5IFIZHocWgOi
 BtxEZobvtJDxGmqNw1y8zKuBxrFGst5nKnTDHM1/DWVfgWp1cCVsB8lUdswhCXHUhtLMOY3RppD7h+
 ssmDn4SAtC3qURx6lDaQ4Ux54qOAy0I5yZMpZuYqZmRao7WMcP7zEA8FB8euJvj+oepPl7G3Pf398X
 qiWMvxMwyuJBT97fC9erY9f84w96nBQ58sRMTYH3hcokdcDGCXv7qHb06nwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Switch to the ayaneo,pocket-s2-sndcard since the hardware layout
is incompatible with the default SM8650 generic sound card.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..508d1445bf21 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -221,7 +221,7 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
 	};
 
 	sound {
-		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		compatible = "ayaneo,pocket-s2-sndcard";
 		model = "SM8650-APS2";
 		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
 				"SpkrRight IN", "WSA_SPK2 OUT",

-- 
2.34.1

