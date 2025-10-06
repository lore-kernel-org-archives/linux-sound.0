Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF7B22C339
	for <linux-sound@vger.kernel.org>; Mon,  6 Oct 2025 18:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775849; cv=none; b=WAOQ/dZd8uEJrLxdDzOpOzwE4PMRLJejOomIJVyazJ+p9C6xwJevW0UUzdDagZoAzNtWnsEzt/08UyekOy1jWlj+WBjGByGLVCfnV0SGHBo2qFVzL/SD8CTN3qavUx4Ou/VarQ4rAUTNZG7SEoGIgBpq993ltwX8ykAanks/VXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775849; c=relaxed/simple;
	bh=5wsM5LebMkcZgbjiXILXd0ARkDCBtVHtSsfSQKGRUu8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C/jcnbV4DT6RjpI1EOUuiXljuKeW8WNH7TB1jGf7VO1P94MEpPTUhRTFzgV2k3UPMWFMmnfc/dLPNLV1OIR9HNcPojlpS4j5RnO2hIpUgMW+65Pg8BP6XelimqbCkvU8VcEKdkSEDLR5esgaplhVbgyLDex6OJqyXqS+Z3UacP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FB9pwUFB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FB9pwUFB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so51444565e9.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759775846; x=1760380646; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqKVD0TJShzCJ/c8DJ47gqXoMP4jBRHFIfpasBYTRgk=;
        b=FB9pwUFBIKPAsXb+/tIMfAoq9con/2bkAbL9NAXh1kwv6EyUzXxgBKUCVL7zuhnkn+
         bvzIQd+Ru58cy9RYvR3ShUQ2IpOHzF0hff5ikX+2/JNE7v4EelRAHWJVLEGpFwplHyGH
         FEEirM460feH6yAMPfoduIw4a8kFOPBdh/JdlHyLG3NCApQJ//zrNoJWtybzAK2zHZBk
         /c3zjuW16EAfmh8ii96dTc7sWFng9Uk1cXxNa0H63puRPR4AROujr9Q0p60sSXjlsULe
         /0+gFanwOcQYJAyVp8w1ZQxyGTILVmlfn5kDcKq8IUyLkASrn6KjpIBkVti7LXMC0Zzw
         JW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775846; x=1760380646;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqKVD0TJShzCJ/c8DJ47gqXoMP4jBRHFIfpasBYTRgk=;
        b=u4C8VlsE2obekaBQzF+7LGB5O9PEnmSV0MLp6yliqSMcSqESW/YTslANJJ8kjI5Fz9
         cSrawqLzSQd1VBTHQdhuvcnp5n6gBt6Ki1CKEMzW8TgpaLr+6YxFZP29WO1jSn0JLGFO
         5ENnz63ELPC/fVKFV1rFWEeA+oTHr8g/fM8xAxa/rcdNHYFaJqOz2P86yz8yquJJnpSp
         fv9zfKSzaG9XNRGr4ngmWWxr7bPcedya0IrCQn41DTXxko69x74p7aBYngX32uBf1P4N
         CCq7fbIQs/WtBPFZ13BWm41C9TpaERMSH20yokm1RJYw6Ry6tTASk5VtEPpq2wiuz7p6
         d2pQ==
X-Gm-Message-State: AOJu0Yxc1zuuA6ntojtHVzRzAd9KMr6lJM+6jqAwe+yGuNh69IfFVvMi
	TPGUa5ja6LE0HCqboymV2Tmwgxl4J4j6scgT3lyCDIbZFsU8uBuv0DsfDR6oWhb52YQ=
X-Gm-Gg: ASbGncu+UYz+pcdU25Q89neZYaOHq0aDIKNxDdG/3S492utZd7lTjAWK1QuMaXM3qPv
	tqMazRsUdK9WgAP58sdYfVueEBOaaWj/MwriR47DUOO+eJK+6clGg8lVZWJSwrM8xcRZO/IWVJi
	79qZ0Bz7/+Dqb+dtXndwn4GD1PVyhLgREhID1cmcnAMqskEAk/Jmryz3K2nwOy3bTJTa6uy/UGh
	mHlMQUuF2B4u5TTipWbQWS74uFvfanb99eFVrmTfAHn9hl9hiL+A6gUK450QAIJ6sZQkLKGAPHC
	dufSPRuFsEzDx6eGzxB28kQlVTXvKnAnGlwQKBuZH3afpXkbmehHyviR872ah8OWdapbSVyfi+d
	Q9NkrRW16LH3oyMRmFySerxE+cXje4dlVGsAZUIGVYptT9pAi9B83+sWwAeH3fTuJUjG1jQA=
X-Google-Smtp-Source: AGHT+IHL3z2V7QcvdglZc+TKevKizgY6323yo5vQNfxVrjx3QeZLmTEe9Yq701nbY4ow/ZAHuz9Gow==
X-Received: by 2002:a05:600c:4fd3:b0:46e:477a:16cc with SMTP id 5b1f17b1804b1-46e7113ebe5mr99977585e9.24.1759775845796;
        Mon, 06 Oct 2025 11:37:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a022d8sm254997085e9.12.2025.10.06.11.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 11:37:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/6] ASoC: qcom: enable HDMI audio on SM8[456]50 HDK
 boards
Date: Mon, 06 Oct 2025 20:37:13 +0200
Message-Id: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkM5GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwMz3ZL8gsxk3eJciwpTA9281IoS3YyUbN1Mo2JdMzMLY4u0VEszw5Q
 kJaD+gqLUtMwKsNnRSkFuzkqxtbUAY8uonHAAAAA=
X-Change-ID: 20251006-topic-sm8x50-next-hdk-i2s-66838fe961db
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5wsM5LebMkcZgbjiXILXd0ARkDCBtVHtSsfSQKGRUu8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5AxhDpU3tII7hgllOW+aBuKRKJcpr8xCL9xKPUwE
 LraOxoeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOQMYQAKCRB33NvayMhJ0ZCsD/
 9pssBcYE+Tl5o2xV4QAg98eRT0spllfy38vMmFwpyoytKTIYPEXIZDkABQhnLLL9ibw0HtHZKbb/ww
 lLtLB8O7ycugOja7s9vIUauZWbf9LkY2/V4ZuLmlpWu6xvxKczF8uH3l/k1HeCVsF5itSRZFYKUtHg
 DiZx6IHvzH41ImMUDOHIqZ/Usx2yUYZCmjtRFApEcN05Dbcf5MuN9RQR0iLJawEGZN+L29dcEENNB1
 hkPChkRHwNu1M8c5g4kSxcphJQ7DXWE55rUx+N6UeRTqRdFqyB8DhWF0W+vru5HAk2PEADZeWWPaoF
 0hRAYQJJNUFoxxIA5zEuZC5bNQ9BwSDVRniidtPkaOJxvD2MREbuzRzcA2QHJ2peEMTJxAKqlsIgUN
 LNpdiWyTVL4vIDtlbSbXObeThx+aY31ecbJQtOBpmu+7ibOSGZcYlYZCLpK9D+GOm9lzgocDxKQ5RS
 4CHHf1T132QjnXTD/ovMY/EN0z7REMMuDyfqj0zZ6u6h3mzwMwTadHrtTYbTz18nWiC73U09jLQd3B
 uRmUDWVVpYm9fmYR4NooefmL4EnClJG5jH8MnaKcvRzEb0NMfOF8yT8ufcUXlncviCbNgGbfWnDvwl
 uxikkMDp+enZHlyS/1RNkig6hWEnt4omHxtx0uONTpvKJoCe9CQhYFuXncMg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now the I2S interface is working on AudioReach platforms,
add the required plumbing and DT nodes to allow playing
audio via the on-board DSI-HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (6):
      ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
      ASoC: dt-bindings: qcom,sm8250: Add clocks properties for I2S
      ASoC: soc: qcom: sc8280xp: add support for I2S clocks
      sm8650-hdk: Enable I2S for HDMI
      sm8550-hdk: Enable I2S for HDMI
      sm8450-hdk: Enable I2S for HDMI

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  18 ++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  30 ++++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  40 ++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |  30 ++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  73 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |  30 ++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  40 ++++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                       |  11 +++
 sound/soc/qcom/sc8280xp.c                          | 104 ++++++++++++++++++++-
 10 files changed, 380 insertions(+), 1 deletion(-)
---
base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
change-id: 20251006-topic-sm8x50-next-hdk-i2s-66838fe961db

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

