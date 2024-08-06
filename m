Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F91BF30D
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 11:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944982; cv=none; b=r5+4U3V+XQNelFR0HhnOHj4+gN6nv64+klv1SQ6zbdMIWCunih9qwWj+YBNmfdC7pIvk+NhzYmvf7IAVvT3M88z7oI2qQpJ/GMSL/ZckdrQUj33H7L1C/k8EThe/9+pLcdXwDkHKKT2+vQaNqNUQEGTHqWMEUzHF8OQ1kzvNl+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944982; c=relaxed/simple;
	bh=c3lLdrRtY4V+BRsUGT6/6tMSRh9ZQZeDQGE6aMuniG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d4s/8UxL+QesuTebmpTdIrxx4a6UbEU2+ofdOjJTUQr2Egmo/Kfdt/qJTj0f82XoTN8TsoRp4N275YHe3uDB29s8TsrjJsphQDnjRfNmWiMIRroD2YJyYsnwo2YRES1LQlenzE1KQwEN6sb3OF/evS6ilcMPlCa7RhoNmACeNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GvWXNBzZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GvWXNBzZ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428178fc07eso3486215e9.3
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944978; x=1723549778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV0Yieskmet+YpNp74afVHBUJdlYUWak9w5VSG2Hzvo=;
        b=GvWXNBzZ2Ov2nPfkZSiNXJuKk+1nWm+s8MAvw9aeN6+Ue0wnAxYjnGmYAd0Jtwjw/P
         7y4VYhOOKLnG4AdyHch9c+o6+jvkPdCp4I7KSyTp0M8RGYt6R4I/u/pHRwVZR13axMxw
         4STkcNe3/wMjAyN+/YkGKejvs2fzptm5nWM/KFDGLe1ageYBGq9T1f/6ArN0F0cNjNmp
         E2iXpn5Wr+4qF0qyQUJ8BU9nZbfZttAC/4HhgKBhdKyv6QBAw29oK2NQTIIMOqQPmwU6
         RN/zpktzEJOynZwnWUe92aQihXWRAVGhYKv/A6XJdIZsGN3rh4tP4XzdNAeNyCFv9KKt
         D+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944978; x=1723549778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV0Yieskmet+YpNp74afVHBUJdlYUWak9w5VSG2Hzvo=;
        b=kIbeaYs2hpmXCm8PKAY+pC6BnoSxGneDwYNuL0xCoIrgMlxzivmDE0FRofh6eTeWYH
         Hbba29LD35Ba0vAb/Gx2V1Lu3aDC8HnavEze3/mb1o92dK+H3kIlIaiiX6ek9fZA31fW
         cgZusD6T1X1Qj2k6oIr5UbfnX/cRgBXyJ1avZ5Q84H/TlcmGosUsGH5QkE0CeGcSMeaa
         02++MUzZINuffSuJtrpoZCaUwxrBb/Nw4AFOsC6NcNSgr4oJFiqHhtzNU7bE0v4sXZgT
         anLRvuLUBkDySzyQbILNP6FJJzvGLPMK/Yab8H6QshzZ/gSbXfWr1pQ+UWJQOjwa75Eu
         YjTw==
X-Forwarded-Encrypted: i=1; AJvYcCUCBjlB8/O0aOTRBUFxI6wsHgDn828/M3BlxH33kcACOu8LHRNYpPmuso2/NWvmzGHmGvFnP7o8p1EhKxLCrDbYqnA+01na4cmlC+w=
X-Gm-Message-State: AOJu0YxQuX+wY36BTQI/KmS99DqTR4iG9JEvMU6DGCMQRLNKoWoLYm5E
	okR2/f6027fld8ZvBb6szz3CwGricrc1z6LAJRuXJOYcaqihX2UkS8mN7+YPM6w=
X-Google-Smtp-Source: AGHT+IG6f1zuYkR8BiWbt1DwVLwptX02kZYv79SfSpx5HpKdmiMF2N9rQ48DNHj2wxnv0s2vMhHcaw==
X-Received: by 2002:a05:600c:524e:b0:426:51ce:bb14 with SMTP id 5b1f17b1804b1-428e6b7f4abmr94039055e9.30.1722944977757;
        Tue, 06 Aug 2024 04:49:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 1/4] ASoC: dt-bindings: qcom,wcd937x: Correct reset GPIO polarity in example
Date: Tue,  6 Aug 2024 13:49:28 +0200
Message-ID: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset GPIO of WCD9370/WCD9375 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index de397d879acc..f94203798f24 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -42,7 +42,7 @@ examples:
         pinctrl-names = "default", "sleep";
         pinctrl-0 = <&wcd_reset_n>;
         pinctrl-1 = <&wcd_reset_n_sleep>;
-        reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
         vdd-buck-supply = <&vreg_l17b_1p8>;
         vdd-rxtx-supply = <&vreg_l18b_1p8>;
         vdd-px-supply = <&vreg_l18b_1p8>;
-- 
2.43.0

