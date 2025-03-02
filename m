Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA72940F
	for <linux-sound@vger.kernel.org>; Sun,  2 Mar 2025 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740883806; cv=none; b=MB1Hk5uGd3Yi8Up+eVztsxPBiqN80TtzcK/n6L3AT0RMOIlfAp0WoOi/YuToJzNl299oW/XtuG3xRWZhIpH9Fp1+KMgcPv04cPDC4PNAwsR+6hyDTrPS0kNSKt2lAPMv+cUQmVE4lNKbL3tBL01jabqIb46eoXxeDx5CYM1Vg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740883806; c=relaxed/simple;
	bh=/IqzU/n63BAdW4SOmKEtnTe2FypNMZ+jDWC1G57xNmQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t0DswJ69eA8dCogMfqnILrqZu5CAW33YCFOUAVyXCWIrbsJwv+qWTXhmO7/DeUhgJ5snK3/ZURQwL4uYbLzK1BgdIvD1KfcklKjxEZWvHhvomWIVMOZMny3cbmn5lJkJjFMGVUBEwBCPE21XDOUyBAOi90zingzsBQ+0XgoH4p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K4eq/F5+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K4eq/F5+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so294155e9.0
        for <linux-sound@vger.kernel.org>; Sat, 01 Mar 2025 18:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740883802; x=1741488602; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iYec184ApMWFnwTMKcyq5mapVYraXn+V3R5ndkdcYqg=;
        b=K4eq/F5+J4L/GAyrgb5kigsQnQzRvsbkUYJnBMWqJwXCvnkisvd5EqZJ8IbdplnHAq
         PtALVZuxwDEafQAzBr4/yiEwRnSbwq7m62Y5w20ywIBIlStviaS6ihd8b6LEfDDdb9UF
         23zgzN/DlLZ8ooi01iFqv6KXenv2C0baLX7QILkFO5egJoArrwnbSvKKl6ebw/iUs/m/
         +f7mYO7CRCZ612OcGFUWh8Ag5w3eWGb3GDKsn8VwNbcHM9QTImrzlakV2dze1kPOztsr
         5AmMYdPlKPBZtyi5C20RBbcmEzTt9dcO6GxblOVaQ0Orr1/Wh+WllHUPdlp+wGl/ueiG
         Py/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740883802; x=1741488602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYec184ApMWFnwTMKcyq5mapVYraXn+V3R5ndkdcYqg=;
        b=giktqabFMT+Sh1J3gBc7TXwvsppGlQW5PdN92MGUqaMqt5UhxbbNhYkTzpLMyINNzp
         iKLoW7Iy6Eg13VvBPtpK3Pzl/IeTPl9HdTxVmcmr3YihiuSu9KdCvXLb/Agtm2uiSVgA
         PuTrjahOCFq+hKIsImjiWpFG8e9iTJcZkQJbvSnHlqPJqcw3UE7l0r0rrPdwcumFPote
         7gYrUCJpiZRCmINmjBuwXRiEAaqwQxuZGAYsXeOEynWqeP9UyFnxSsXBBCexcs0wnNak
         bofd2bo6eyNAOMCr42W8ko52dDuyjLD2QOTTJj+eLuZr9tLKQpG2pRat1CvT0+aHJyxt
         BL7A==
X-Forwarded-Encrypted: i=1; AJvYcCUFZSp1Gd4UhdpdfzrwyhZYs/tZCj215kSVbYgPsPE88RZNv0IL4PIiCERNBd4bgKbBam/TAHci/SW43g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFgF0TwCc7qZCnRZxtQpjpxbibXOkAvXmynrTj7GrS71sUOIVV
	3ZuOUjdxPIgeqSUoxwfniOvJtraBWM96I0EotbBZ8OmhsXMwOU/eqmgIwICFdDg=
X-Gm-Gg: ASbGnct570N5P6PGxWuclpJywCOe0nciYng3yGkpW7HNGwNd5dCQeGhbfvcU85874xi
	DOj/uPIece6VS+iEHCZnorOv9IlnjLiERQxzjsie003LMGStSqFQ4q0NxAiT7rPvhYyAfF+wmCv
	EHLFD5D720imZKNgbo9wIBjC/4Fd6WzH369rTLoYijK8DC7ulbJvJQ6UECeI7J+OBTqqOKEBvS5
	5FlyvxHIIyIXIt9H8wKV46z2QVau35AiWRRDVmbv8NkUnkaC7JKbnJSnYLz2H4Ksoxt2zZ8Of/V
	s9RGIBxNqSVRDRM0R0BOHKRNKE7iCPg6mvJqOePmOdPBVWxrrmB3Bg==
X-Google-Smtp-Source: AGHT+IGR5NlYEda30KBCY59v51iXTJ0sUgnzU+5tKf2Kw28XxjXtlDeFK9A3nguMlEjVQ5MSzY/kPQ==
X-Received: by 2002:a05:600c:1990:b0:439:9b80:ca6f with SMTP id 5b1f17b1804b1-43bad205987mr69215705e9.5.1740883802036;
        Sat, 01 Mar 2025 18:50:02 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b0dsm137845975e9.13.2025.03.01.18.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 18:50:01 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/5] qrb2210-rb1: HDMI/I2S audio playback support
Date: Sun, 02 Mar 2025 02:49:50 +0000
Message-Id: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE7Hw2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMj3aIkw/iMlNzM+OL80ryU+LTMouISXTNT40QzE0tjw8RUUyWg1oK
 i1LTMCrCx0bG1tQCSv5qFZgAAAA==
X-Change-ID: 20250302-rb1_hdmi_sound_first-653a64931ae5
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

This series adds a feature to playback/output audio via HDMI
on the Qualcomm RB1 board. Since RB1 and RB2 are very similar
to each and other and most likely use the same mainboard therefore
this series is a rework of the similar patchset for RB2.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (5):
      dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add QCM2290 compatible
      dt-bindings: sound: qcom,sm8250: add RB1 (QCM2290) soundcard
      arm64: dts: qcom: qcm2290: add apr and its services
      arm64: dts: qcom: qcm2290: add LPASS LPI pin controller
      arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio playback support

 .../pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml     |   8 +-
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   4 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              | 113 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  49 +++++++++
 4 files changed, 173 insertions(+), 1 deletion(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250302-rb1_hdmi_sound_first-653a64931ae5

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

