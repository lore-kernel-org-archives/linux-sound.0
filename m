Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f+eMMXGc"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F74FD4A
	for <linux-sound@vger.kernel.org>; Fri,  1 Dec 2023 07:09:01 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b4f60064eso22221055e9.1
        for <linux-sound@vger.kernel.org>; Fri, 01 Dec 2023 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443339; x=1702048139; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gNZ7R4MQGFffrobU6ni4L3zapKkTqgLoMNn8PZTR5i0=;
        b=f+eMMXGcDuKQHCiKsue+xlZUyHctDsSu+fJbb2LgSYGelLM3zlbg6KPhnsam19thhP
         s8EFDjzADjxrVsCy2kl8TnTqRu2v8vt6LGjN61fGRPihJCWL/tHH52hTGgPbKLHHbC1E
         XIA7qpwA1oOoGGIMm8yKDS5mndAJR4Abxl21Yw8UMwLjzJGoNys3G5LjRWhcEytusQQT
         VRnqwnN9NxSwHoLW4Osp1S2irwxgw0EMbR3O5/E5IEgaxW0aS3x01NZFD6i1D7vZIep4
         JfQZGB0tU39ofVqNe+31WQ5Pp0oxsVJakOiKYmYTf6Leajga9DqPkUlva3p3f7OaInzt
         hWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443339; x=1702048139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNZ7R4MQGFffrobU6ni4L3zapKkTqgLoMNn8PZTR5i0=;
        b=kUOb9hB0LSFG7j/C4YVQbtMR+SF8oYadgT8VjzPtk1k0BK5rCV1g4MsZCmy5xnC+fk
         TSnSC15ncU2f2p1RrxSPkGUnmJW5uuM6GTr5i1CKc68F1NonGKFEHF65wVC+JIju5tae
         4xFk/n3AVqCMWbBHWajKZuv4feq97rM41UWieZ/YaBk9SD9MijzzkiF91leC95S2gZvh
         DesZ6nGngfzzke8lUeXMNQHf/LgOemhUF+tfUjOZCvJNkkSGvFJW0Ieldh14YAD7O8DN
         QNdRZqkKTLHm19yRSPySNjRb3vdGzkXCK2Eo1DtLBP/5eVEiYwnExr3V6HS9drdmclkt
         hoxQ==
X-Gm-Message-State: AOJu0YxwPwnho/+tsIt/Tp3P1Uj72vzkUBtf+aocmqhuO/NczmJr1m8R
	5bqaIxV2p0tZRNX+iVP5dBlrDw==
X-Google-Smtp-Source: AGHT+IFsi7k0cOV2CTRev6zhLhejCpJuKEr2xRKSS7XaIC1GAnoHZJlhes2/zkILjlrM0IT/88e2rw==
X-Received: by 2002:a1c:4c08:0:b0:40b:5e59:f70e with SMTP id z8-20020a1c4c08000000b0040b5e59f70emr273807wmf.128.1701443339595;
        Fri, 01 Dec 2023 07:08:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fs20-20020a05600c3f9400b0040b5517ae31sm8569539wmb.6.2023.12.01.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:08:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/5] ASoC: codecs: add support for WCD939x Codec
Date: Fri, 01 Dec 2023 16:08:53 +0100
Message-Id: <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAX3aWUC/5WNQQ6CMBAAv0J6dg1doIon/2E41O4CmyglLSKG8
 HcrP/A4c5hZVeQgHNUlW1XgWaL4IQEeMuV6O3QMQokV5lhojQVMfhQH8Xk2VQ6vMU6B7RPejuq
 iXsB5YgeuNK1Bfa8qKlUqjYFbWfbLrUncS5x8+OzTWf/sf/1ZQw6oqbRU48kQXx8y2OCPPnSq2
 bbtCy7L4JHXAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3757;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=38wj4TRML2NmpVWHDGWZ7lyYIsFw7bWFSFPePEL0QD4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlafcI7JbVO734mB4tTMVAtImtrBrBrmo6qM/8Odho
 ZjHTfjuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWn3CAAKCRB33NvayMhJ0U/UEA
 C8tw+QSmBj0o4fhv+oL9yLD5m+bFeoziZDnIipCce2w/ww24ga5Fkwm6PUYW9KPYeFERzIs7w6EkjM
 Dsbka2UyO8UI195/MxiU4zYpPtjHik3fTsGKSS7J3Crh7ECZRHpXj9FjPPgyD1lXw4bMYW6iozc33A
 88KiVor6oxDHA5cJJAKjy5v5zQzQw8giP4vpQ1R74LCxpQgSJ9CKvyt4L0ri2iojmzbF+9h+BM3UoT
 X1zRH0RldvIGzFx/GOtUMxu0XRRFo8t1s1mmxdLJ42Myk+wn8X8J7abf5VhrA5u69KUTI11hmaEcLo
 CC1bzjotRh4ZJ5HACBLgXM8N2Sseqj/rab2getI1Rzwo2RZIFvxM7V0UjsAt9Pz/StpTW1jVkM+ABE
 ng+Ve7/Nz5+1ub3k7pBkuRI3upQJz++SjGTxTeBsbw7KazeeEesEhTpvgv3bdGY5MhOig18CX2I5aQ
 zse7mFAEgb38xDOK2O4Q/sXIqmTX4BU9/OkT2MM1jC9fbLk0ostLz41Twn55v9mUW3S1zBumCZJkM9
 TyJle2hymBlbzvCNIt9EM4xp40tWq84vRyVrDZ6eIToupvW+5oF3zm55xJBPF8J3YyaCva8njiME9y
 YJ5vpw3ifN/1lNrp9X5EhKvHxkYB+2xLc//So+bVjOzciiOSt6ot25HSQ0Kw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the main WCD9390/WCD9395 Audio Codec driver to support:
- 4 ADC inputs for up to 5 Analog Microphones
- 4 DMIC inputs for up to 8 Digital Microphones
- 4 Microphone BIAS
- Stereo Headphone output
- Mono EAR output
- MBHC engine for Headset Detection

This adds:
- bindings
- MBHC changes to support Type-C muc
- Soundwire Slave driver
- Code driver

The USB Mux subsystem support will be submitted separalety
since it's a functionally separate subsystem connected over
I2C with it's own reset signal.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Bindings:
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Collected review for first patch
  - Added wcd9395 as fallback of wcd9390
  - Fixes typos errors
- MBHC:
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Fixed EXPORT_SYMBOL into EXPORT_SYMBOL_GPL
  - Fixed typo in commit message
- Soundwire Devices driver
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Dropped comments and unused code
  - Reworked wcd939x_swr_get_current_bank()
  - Added comments to wcd9390_interrupt_callback()
  - Reworked regmap's wcd939x_readonly/volatile_register checks
  - Added comments explaining while bind/unbind are empty
  - Added comment on SDW_SLAVE_ENTRY meaning
  - Added more register fields defines
  - Style fixes
- Codec driver
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Added MICB_BIAS_ values enum and used them in the code
  - Moved zdet_param to the top
  - Added TLV data for ear_pa_gain and used it
  - Defined as much as possible every bit field used on/from register
  - Replaced 1/0 to true/false when writing to single bit fields
  - Replaced for loop on all bits with ffs(), simplified code
  - Simplified MICB fields handling code
  - Reworked and simplified wcd939x_get/set_compander and other kcontrol get/setters
  - Reworked and simplified MHGC impedance/zdet/qval code, dropped dead code
  - Added comments on wcd939x_wd_handle_irq() utility
  - Added comment on the interrupt handling architecture
- I've not moved common code yet, I'll probably do later since it would alter wcd939x code
- Link to v1: https://lore.kernel.org/r/20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org

---
Neil Armstrong (5):
      ASoC: dt-bindings: qcom,wcd938x: move out common properties
      ASoC: dt-bindings: document WCD939x Audio Codec
      ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux
      ASoC: codecs: Add WCD939x Soundwire devices driver
      ASoC: codecs: Add WCD939x Codec driver

 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |   81 +-
 .../bindings/sound/qcom,wcd939x-sdw.yaml           |   69 +
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |   96 +
 .../bindings/sound/qcom,wcd93xx-common.yaml        |   95 +
 sound/soc/codecs/Kconfig                           |   18 +
 sound/soc/codecs/Makefile                          |    7 +
 sound/soc/codecs/wcd-clsh-v2.h                     |    1 +
 sound/soc/codecs/wcd-mbhc-v2.c                     |   95 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    3 +
 sound/soc/codecs/wcd939x-sdw.c                     | 1584 +++++++++
 sound/soc/codecs/wcd939x.c                         | 3655 ++++++++++++++++++++
 sound/soc/codecs/wcd939x.h                         |  983 ++++++
 12 files changed, 6592 insertions(+), 95 deletions(-)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231123-topic-sm8650-upstream-wcd939x-codec-c46f621b55d4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

