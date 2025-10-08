Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCDC2C0F7B
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 18:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949817; cv=none; b=PYR2SEIlPXuTnJFp2asePGOEOgwMJaLEO4zRwQ6WaS4hk2fnLqrh2ULTnj+lFiPdYM0jBHTbNtddRaRstbCfWfqy0Ze5ADG/xR19okI0KeHBXuAJQ66StVGKsKm9ZZT6kpFiG6aVu52dar/m+JAof5svZhDFx+bsOa2AJKgrOXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949817; c=relaxed/simple;
	bh=bizbubVRMT2tLz50uf4vCXrtjqnMF37yJFdARA55YO4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Dn2fyAJU+RpT0S9v8cGC9wIlbUfkAGXyBYzhD07oTDqHDfgWbaYyAbm7VpGQxFD5Gc1Kb2OtZEXudBSGv/do0+D/PzSf1Eii2CODJM7iTGK4zEt5HdeL5Ztbl+OwHip1JQM4dhaWtkQjdLrQfqa4uWUIAuJPBrvDsG0atuWkYP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWf6kBI1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWf6kBI1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so169068f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759949814; x=1760554614; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M+f4Ab/H543K+KtcAIFFIj0xMMQTOuYhxb3COx0E3Fc=;
        b=PWf6kBI1Zda3VaVRVWXT6emMW2D46OXE2NwLklA80XAc+NC9UEs1AyGoX8RFc0AXHo
         siLuzkoToOl2gX9rqz76RUFMUe6ako1fAUXIKv985dZRAOo4LrdyoziqpchpXjjrERxL
         Mfa1XjMUyqGvnm3BYbeNS+HrW9o5LxOBi9dL4XuFxG/Q/cuQHHu3/7yKfWvhzkeOMg+3
         jPldYGn9nC5hH9OFS/6NOrB1peHCsZ+rdbSncwTSckdF3GaBb8jPoQIyFAs8X0ZLOx3t
         q/kpDRiXWaWJvLupt92CqNt6adXrsQ1prytoK8ONJmn8z6qXglKQbyWcdyeFueoAdsoX
         F8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949814; x=1760554614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+f4Ab/H543K+KtcAIFFIj0xMMQTOuYhxb3COx0E3Fc=;
        b=MvGjCoR5YwOrBJ7tlskJ7Ox6pCG9PjHnHGqyPM18Ue+EC8BK/ARUVBu7tId+yZYcOd
         bb6/EtjLTAOXpDv6yzgFWeHZmR5ewBNWpLJu8TSxuO8YLhjTvrAsegucjwPMAj6u5yJ+
         lnlYHcIaSkFBEhVJheTQ4k7HzhQ2oDO7Xp0qBCjLVLSzNaQUV9jY8+Gtabb1OAySnJi9
         NU4X+l8xtO32Gw9uhmrAoRt9QPyTNSzfLWI1/kC1aAWzwvK0Y0Sty5oxr/MP5MG1XwHr
         0uC6wJD/3yFTrf98Y1/FHNN9hiOrIOJULEYl4j/08MxOjJFPW7ubB72s2lzcYjXL+8GM
         5m1g==
X-Gm-Message-State: AOJu0YxSrH+BgElYwoJatXrEUZgXbIoWMk4Zt+PBsQzVTyaXVpSlokpO
	lt/ps+XkJBKbGCLGnZJbM/NRt0hz7oV5xo7VaCWEyGimmhJB0kimIQVtrOd3h749Bmw=
X-Gm-Gg: ASbGnctMV1V96DuCx6ZlDskYEg/o79xaMiuuvmpTFRtxXP3JLfcJF+b1BLVhKjhykUG
	sj+OykePTNmAXt0T1KL0fvLGcar1dVYKF6AgQu9RQCw3D48PNRSaZAIktcGQcJ9z3zB0l57rTGk
	t0b1Pm2Ma0pOOsUJtNLP92AiNQUacm8p+P3z1EUma6ka5x9sxpLJK+kba/CYVQ78KJUslXwwFuP
	hZahxtRDQjL5W+RTqNCyCSRy3U/sY63jqOTABBtScQjLI4aOqomXuulnWP6a/ZiqlcgeDM6LW4Z
	XjWQ2jUXN5HBnCsSZ/cLL6yiv6zmjqoD+ydu1JiAJhTqSKkBumjzlcgPuNgEvGz+nZVpZj1lja7
	90+7Os0TGcsizRHrtnAyR95IHOzzkBW/05QqnAY7kmOQbVpMWiiJfq72dnn9zOLJCyraniJQ=
X-Google-Smtp-Source: AGHT+IEts5c5yPiKoS68W/iyUs6BKt7pQ5nnnl0KYwaWTk4HQYO1CJbAcLx7xJ71l3KQM7U2jNMBOQ==
X-Received: by 2002:a5d:5f83:0:b0:425:8125:78fd with SMTP id ffacd0b85a97d-4266e8d8b1dmr3131827f8f.48.1759949814244;
        Wed, 08 Oct 2025 11:56:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm31029735f8f.33.2025.10.08.11.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:56:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC v2 0/6] ASoC: qcom: enable HDMI audio on SM8[456]50 HDK
 boards
Date: Wed, 08 Oct 2025 20:56:47 +0200
Message-Id: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO+z5mgC/42NQQ6CMBBFr0Jm7Zi2Sq2uTEw8gFvDosAAE7UlL
 SEY0rvbcAKX7//891eIFJgiXIoVAs0c2bsMaldAM1jXE3KbGZRQpRRC4+RHbjB+zFIKdLRMOLQ
 vZBVRa3MwHZ21bGvI+zFQx8vmfsLjfoMqhwPHyYfv9jfLrfpDPUsUKM2xlqU1JxL2+mZng9/70
 EOVUvoBF4gka8gAAAA=
X-Change-ID: 20251006-topic-sm8x50-next-hdk-i2s-66838fe961db
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1806;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bizbubVRMT2tLz50uf4vCXrtjqnMF37yJFdARA55YO4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5rPyeTJDUCqVYdxwX+n9/KkATX3chzM7TEbZ3bUw
 fLrRoOeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOaz8gAKCRB33NvayMhJ0fFwD/
 4kC8CITQilqkuQlOnmz/sGtbl2oFzz2Ll3GFPQFvq48DXeWVFW0G60pwfaS9zDAjRlF82HZwZ7FThg
 UWe0uyeKpqc3p+DNxlDLGcVULEsJcd+moFhCtsoUvuRVt/bpdrcs4vVVf3rxm83ueq/KQtBvVDiJQu
 pGiij8FqVQrvTQnJX6rsptAj8FpwsPtpM3UoZe5YovG+dRiaYYLhv4wuNX1daJQBR4WKZvIMuUm7Qm
 YFYL3phJgydOzOPzs+MqzoxnhNG4nN4prEVhu8ZOrS+8awuIKuJVHeiNDI9ispy1PeoZ99du5fH9zN
 tCqgmewCwV/p/urlatnoy1AzwMWAKCMu7+TnMilGZci6ypRmxVUfz7AHdKL9AGPpjDPeomraGkO6KO
 LkxtQ7/xdjwRJ7oaOg5yh5fXemoUCh/EV3qgbRzJ1H82VxIgicDljkss+Ucx+hYh4YzBhb5add0r41
 42IQmUGc6oomUPA1MUTKy79Az3TRMhgLlej9KhQM7/ds3n45PnKLOxyGrgVcwYTYTVvv0XFf67Fyj/
 yMLyWMQd12LAIUiqL54W/zFZYvgSmCfaQ1Qn/PYVhvsZ85TwpQeO/P8HNF/wYFuGp2Njum4y9xhV+s
 dv1Krf+wDKs1olTzchtE/pi+AoAzqx4Xv5R/DonQ5sQUQv6ylpCE+qmwe0tQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now the I2S interface is working on AudioReach platforms,
add the required plumbing and DT nodes to allow playing
audio via the on-board DSI-HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Fixed MCLK_5 id
- Moved clk set in card code, using calculation from rate
- Removed clock rate from DT
- Renamed dai link
- Fixed DT patchs subject prefix
- Link to v1: https://lore.kernel.org/r/20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org

---
Neil Armstrong (6):
      ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs
      ASoC: dt-bindings: qcom,sm8250: Add clocks properties for I2S
      ASoC: soc: qcom: sc8280xp: add support for I2S clocks
      arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
      arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI

 .../devicetree/bindings/sound/qcom,sm8250.yaml     |  21 ++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  26 ++++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  40 +++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |  26 ++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  73 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |  25 ++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  40 +++++++
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                       |  11 ++
 sound/soc/qcom/sc8280xp.c                          | 132 ++++++++++++++++++++-
 10 files changed, 398 insertions(+), 1 deletion(-)
---
base-commit: 7c3ba4249a3604477ea9c077e10089ba7ddcaa03
change-id: 20251006-topic-sm8x50-next-hdk-i2s-66838fe961db

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

