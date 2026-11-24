Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541544;
	b=pt74e3SpyMMw1lKyQVaL/4SW/daUIfs4dFr0jTxuKqUp5hYk4i8fJ0qBL77eKj6sc7Q9
	 DvnyFCgDdyeH4gon8asp2W2EBGWBgHheRXEhazFE57zbmdFMc8+ShGJXsp5puhrvvvp9s
	 bzhPCj0qOtaYWipyPVjSspmZ1r/ETLfOm34BlQGozoFDaEywt5hyyzKarXt5BOY9dq8MV
	 aE5h9PdyoCO59si6d6kM3tzQOo+emRjD8v+WqzlhwR9N+cyKZgXWv5yAk94ixIeWMqZZo
	 3bgBkjuvBkhkAxkHapYgZhT9Zoh7fXsJRhisrhrqLeRYr3gjLAU+5vN3jBcPM7XVerA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=s1azRMWLpG4NyK3G2APpIsgZDDXxyzylBu8YLqP38kU=;
	b=JFG6OZz/v3+SR3Eze9OSePg6jiL49jftuR1Z1siW8/mhX4PgkHnW/BDjwBmETbEA/23N
	 By6eXij/w1DAxsGSarsMRqRCMelV3AkV9SAjLO6X0zaeC3lCTxILNkyGJCnHe8e95yVea
	 sBFFZ2hdnaRipBbFfigu5AejpFUKwcN2aKvQjfH1fa1BQwrI7QZ/Zu0j1BLAlIpuWl9ON
	 nSn+KjU20aC5m5xp9KmTgwgcQhWLBnvRtb+VQK2Gco5yhhdcydpJSxgaIJ3eqREoVULB1
	 s59IZrbdaqDhvayNYC14JK44paxQ06d0qlw9BPB8e709AYba2H2nk6It9OlQ8DKpo+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eZlA0T5O;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A40606A32E
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 17:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A40606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eZlA0T5O
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so3711605f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541541; x=1796146341; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s1azRMWLpG4NyK3G2APpIsgZDDXxyzylBu8YLqP38kU=;
        b=eZlA0T5OLr8mCTgtbQ2f6F/NCjrKgzSwWfk0Py8tAiX4sC5T/I5CsDVAKlkpYEQVfj
         EBk51tpP21LEXyV7BGFPSKv2cKv9I3nERWu94o2Gxw3KkTkPLSZlRhmBKQFwMkjY9cOb
         /A2rsKR4oODiHtPeYERuwi4J8anEvPpYLPIYsZwsXA3fOBkXsblYLvANI/WmXgtq5kkJ
         6R3NoASFRcpOolHleKXeUzExuf20L3ajUs5i6X83HVmQ0Z/X9x6ZkDLX4q2eXJZC9B/A
         HKjqOJSo72vZzkINdDQ9nkKTCd64T4fWNMdL1Kp9ZwnMnzG8ZJbESbAjBy6DKd0RQtRS
         ocRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541541; x=1796146341;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1azRMWLpG4NyK3G2APpIsgZDDXxyzylBu8YLqP38kU=;
        b=F/0JcCdBu8vG+bkWBhyxGGFg//J7L5LIsODqg+ZN3UWv4DV0jNmzON21joDSJ3ws7e
         sen02afq8fDkGFcsCfQ3jevA2609cNKtjSY1f81rdH7w6DaVSakLwR/tWYsLBl6e5nzs
         oIM+zOyRnaE3y9hxNePDzSbJBgVWA/RpeoDXL41HnyldjGpGvmGfyoOORsBU1BtONiNn
         7TIVS0eHE2rGiNSGvfUDIaNNRC2GjL3hPI81qLXHBv/bGMRu+F0aoJNn1yyNBz1agT1c
         gh4ncgsyyfzXlRISpU1soxaGOgStgiqFS2FDLAIlc2KZtK5G2+l/o05rLV+kM0sPlh94
         u+iA==
X-Gm-Message-State: APuU4Z97le7JA1aALhwYWR/j5o0YdEcLfL4JgUB7U2/aWvk6JNd7SLPL
	lqNibGBMGfCbULkeozCjnbFF+IyIAY++HSG9nps2LXfAjacbOqdNQSZOyHCmcE+6kLQ=
X-Gm-Gg: AZFdTZeWESXzGkQa73FLwQK3okY1ZnLIyQrmL+sy2MakJojZSBkaQpDHDqyKF3DfQz9
	vCFHeh6hM/hi+QB5M02w7UtJzqN6IEXJZrYS701nLd7mCtz3tpqQN3AvRdZXG4HzTr4HnOsH6Rq
	XKBA29OtFHoXw01gbf6d2vjcslW5WTV8+14qAmf6DTPnhpsntaiHsJtIaR9HmuStrwWZo08mQrh
	M3hOZBTZAO9rJUbvOqwcChhz1cEIbx68GpMhRNZFgqSaNz4lht8L49KWhsY0mM5H862QWnIliGM
	KAxjdyk/4QfkV3XkcJdkEV86GlO0t7otEF6FLsg6k4CZRXKkBsljmTCqrJIwmn5gfF2e5Fkkah+
	8jQDsmxNp5LUG+FltlbX/MwpWVSZs+R48ANL/OMSkGzFw6WT8byPPQwox7gG5hLNguN3u0EipjV
	x06ZuzWADGzHP5LloEkE8jYvIU9yIfY4s+mHIF+Ts59Wk/7U2fMdLByu4o1+65s1+SC5QZd3n6P
	vd/xjaT8B37xDbDZGeocEZAMQ3iWfms2nsV161FI8icPQkOH8vLjbdrVDIL4r/qxJ377gEIwkTt
	FUPir5oAeBdWvrQu1am8wzAqgweT/tZfoQvkz3LaTWdHlmHwcQ==
X-Received: by 2002:a5d:6f1b:0:b0:4b9:15d1:46c9 with SMTP id ffacd0b85a97d-4b915d146fbmr468809f8f.5.1795541541132;
        Tue, 24 Nov 2026 09:32:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 00/19] arm64: qcom: enable SM8650 audio without ADSP
 firmware
Date: Tue, 24 Nov 2026 18:32:07 +0100
Message-Id: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABfKBWsC/32NQQ6CMBBFr0Jm7RhapKAr72FYlHEKY5CSFomGc
 HcB9y5f8v77M0QOwhEuyQyBJ4ni+xX0IQFqbd8wyn1l0Kk2SqkMRz8IYXyWJk+RO41kyLqTzgq
 yBayzIbCT9568VT+Or/rBNG6dzWgljj589s9Jbd6f/KQwxVyVmTPW1mdH1056G/zRhwaqZVm+W
 bU44MMAAAA=
X-Change-ID: 20261113-topic-sm8650-el2-c6caf4237ca7
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5191;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sfORcuqdazip624HbZDZO7QVlTTKHcb3EIMKahqmR9A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoZl8vOEKEI3pcW5Q77cyprkWxywmhKFvd5yeA3
 yagw0YCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKGQAKCRB33NvayMhJ0f86EA
 CIf4MNCyZqgFFBAzoH42Phfo+hb9+M2fOI9hkPNnNFRxGp67FN6q5RH5SfPOqw+3qEP837/3Ebt3E5
 51f/hNLxwEKW4zFggk/bA3dSHw4OUhSrlSd8rkEymaADrk+P39rEeEnIhKVZTdqa2v7on4ocBRmgZY
 b5MRupc4wPCwWUAXdSHnvTY+t6qT7eab43Vgm05PCty5IlmRLr9991Ws1oyi7JQGafcGzcbirKBV6K
 KVzdQ0ZlGyIFUDpROzOgiQZLQRdD2Ep2jbcaSeFAQI+HispgcvriDWLzDxJSuw2wOuhlls9ZrYsUwd
 AY85MJjEygV6JY8TGT5MMCUqcgbYXyiKquJBujcm38pVwpuG0XUv45hJaC0XrcHRSvUfx0Cyw0Ndp+
 2l4VeY07NKFgURNZqJjS6tINckY4AqdFZT2+JlwWe+xuVQKxCcC/ulG0+3yTEkr0sQWkLQozkA5AcW
 j/ceUKAAi7OarZpH/T+YGtAgf/gwJSIfpKVcNzuO7G3IY9y0yuVeXjVM2kIlHyTaxcN4MxBO7qF8pv
 n3rkG0PXrbzCYw8c3sv5+F98FhKMR8eo4KugH10oQ043SMbbuCWUQPbRXngYplo6ATQQZrmeYG21w0
 JajsZNsSN1hvzXmbJnVLDTJxV0wZFG4zT5GCwEwd/a/nl/QxeWaDE/2z1FvQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This patchset is part of a serie adding the necessary plumbing to
drive the SM8650 audio interfaces directly from Linux.
This is required for boards like the Valve Deckard that boot Linux at EL2
without the ADSP audio firmware, meaning the audio interfaces must be driven
directly by the application processor through lpass-cpu.

Without the ADSP firmware, the LPASS clocks, memory zones and audio
controlers must be controlled by Linux

To support this, the series introduces the following changes:
- ASoC LPASS core: Prepares the lpass and lpass-cdc-dma drivers to
  handle multiple LPAIFs for I2S ports, allocates and maps LPM buffer
  memory for DAIs, and adds support for the optional WSA interface
  and Senary/Septenary MI2S ports.
- ASoC SM8650: Introduces the SM8650 lpass-cpu variant and allows the
  sc8280xp machine driver to be used with lpass-cpu to keep sound card
  bindings working.

The patchset starts with 2 fixes reported on the v1 patchset by Sashiko.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added 2 fixes reported by Sashiko
- Add WSA regmaps callbacks instead of reusing the RXTX ones
- Fix irq disable for WSA like it was fixed for RXTX & VA
- Check IRQSTAT regmap read return
- Add missing LPASS_CDC_DMA_WSA_TX4 case in lpass-cdc-dma
- Only enable mem1 at first for initial WSA support
- Fail initializing lpass-cpu daiops when no I2S dai is registered in DT
- Add va_enable along wsa_enable to check if VA dai is registered in DT
- Move MI2S lpm prealloc in a separate function and handle VA clock
- Use proper offset for LPASS_CDC_DMA_RX0 and LPASS_CDC_DMA_TX0
- Only allocate VA memory if VA is enabled
- Use correct size for remain LPM memory check
- Use VA mem clock if MI2S uses VA LPAIF
- Check mem clock set_rate and enable return values
- Add missing set_bit(chan) for rxtx and wsa channels in sm8650 lpass
- Use LPASS_RXTX_CDC_LPM for lpass-rxtx-lpaif
- Correct rxtx/wsa dma channels count
- Fix reusing the sc8280xp card with lpass-cpu by detecting non-dynamic DAIs
- Link to v1: https://patch.msgid.link/20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org

---
Neil Armstrong (19):
      ASoC: qcom: lpass-cpu: fix RXTX WRDMA current address register readability
      ASoC: qcom: lpass-platform: disable the RXTX & VA DMA interrupts on stop
      ASoC: dt-bindings: qcom,lpass: add Senary & Septenary MI2S ids
      ASoC: dt-bindings: qcom,lpass: add WSA RX and TX channels ids
      ASoC: dt-bindings: qcom,lpass-*-macro: document less clock when ADSP is not used
      ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS
      ASoC: codecs: lpass-wsa-macro: handle the macro & dcodec power domains
      ASoC: qcom: lpass-cpu: get the optional codec_mem3 clock
      ASoC: qcom: lpass: add support for optional WSA interface
      ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
      ASoC: qcom: lpass: prepare to handle multiple lpaifs for i2s
      ASoC: qcom: lpass: add support for MI2S_SENARY & MI2S_SEPTENARY
      ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs
      ASoC: qcom: lpass: support LPM memory type for I2S LPAIFs
      ASoC: qcom: lpass: allocate LPM buffer memory to DAIs
      ASoC: qcom: lpass: enable the right codec_mem clock when usin LPM memory
      ASoC: qcom: add SM8650 LPASS CPU driver
      ASoC: qcom: sdw: allow LPASS_CDC_DMA_WSA_RX0 as soundwire dai
      ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 ++-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  17 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  20 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  13 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  29 +-
 include/dt-bindings/sound/qcom,lpass.h             |  24 +
 sound/soc/codecs/lpass-wsa-macro.c                 |   9 +
 sound/soc/qcom/Kconfig                             |  12 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/common.c                            |  43 +-
 sound/soc/qcom/common.h                            |   9 +
 sound/soc/qcom/lpass-apq8016.c                     |   9 +-
 sound/soc/qcom/lpass-cdc-dma.c                     |  48 +-
 sound/soc/qcom/lpass-cpu.c                         | 463 ++++++++++++---
 sound/soc/qcom/lpass-lpaif-reg.h                   |  51 +-
 sound/soc/qcom/lpass-platform.c                    | 499 ++++++++++++++--
 sound/soc/qcom/lpass-sc7180.c                      |  10 +-
 sound/soc/qcom/lpass-sc7280.c                      |  10 +-
 sound/soc/qcom/lpass-sm8650.c                      | 653 +++++++++++++++++++++
 sound/soc/qcom/lpass.h                             | 199 ++++++-
 sound/soc/qcom/sc8280xp.c                          |  88 +++
 sound/soc/qcom/sdw.c                               |  42 +-
 22 files changed, 2069 insertions(+), 255 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261113-topic-sm8650-el2-c6caf4237ca7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

