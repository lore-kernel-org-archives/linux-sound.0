Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F182561A4
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 11:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902866; cv=none; b=hYIQPY9jD+QInH6s9pXSeGGGYsw2DvyxSGSVy0x0GDF1NXXxMVIO3j9HljwX9AE78dGfHEyxabGjVYZYAzzAIZhsNScZuXuX9ufgNsRXCU3QD90ZEh/1lWXMP0vkjK7GACvjxRvXYI4gw5lES8qz6P3zjpxZizbrEXdfcvmu1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902866; c=relaxed/simple;
	bh=DWrs30dWU6BTEKeC5Kt8Uyh7muJJJmVcZ9+Wyy6BDJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dKVfv9cA+bgTqXBlRh/2l6byjZQfeXxob2PfLSjO7PzmTgXQiSiClTiwfTwSwWGRhHlLRcNKCA7P9lIpT0A5VhnBgfHNcSwkGIcvrfFNcEgzUByt/7M01yv1qW4Ju4kvHu3N6TLaBY7HeGWoOuMd4qFB4ldTlimtNMj3klZUt/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7B8Bp4Y; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7B8Bp4Y"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4217578f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902863; x=1743507663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9gGesvxkXaJrbpdejngTaAxuRUgs7M320w5yoDSB0s=;
        b=a7B8Bp4YPs2/M9crzh+htAIvrEnzWPCdDyNmMcqmukTWWEzDlzxpRj9Pf5/9fnpNfr
         oeknhx4Mz9hMkg0UJCv9MfCkeyocnQEH2fuKccl3n7+Vr5/fZtzxvzv1sEUVzXOVqDYN
         4suGogs/yO15rmO2/n520lD15My5KANzVdVtgnFI3U80RyAG0yLLrijmTC6ovknSFeiY
         7y5h9WCQHqST4grUu0Y8NybYJveI2FJ4rQr3hEA2q+m8FOjkRVcCqZxkHKkpFE8E0jNJ
         q+2nzzF1pMBH4k+6cjwUYoRiZYHeetovb95Q0vYDG2ulJX6MMUdLnY2QJVdaT82T22lp
         sYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902863; x=1743507663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9gGesvxkXaJrbpdejngTaAxuRUgs7M320w5yoDSB0s=;
        b=SAoSSl3EKBQenyapTuBRkze64epejfVn8Kbq2x81cX9Dt22lI4hXtheVz9CZRbyAyc
         RWADJeHIx1twllSEJrF5OYKsuMNsmF4SMR15YEGrDAWNwRoqQ6imM4iCeqytwGMwNND8
         CKA6zsXrQgc2920qpla/qiOGSSFn3PVhpzjxi2fXs6fC+3aUwhwgpQt1si9S7y9Bjse2
         jKKeFa+noBvWkBXYjREWKu50ngrnFwOhjGJEyaC9B0dd7dGxE52Vh5joB46eIxV3VWUc
         rozD++zAKnlRAiH/1WsxlTwNZvyEd2GZROLwDLyov2tw/adEAZnoxrEDiKqFT2Vgck1y
         xE/w==
X-Forwarded-Encrypted: i=1; AJvYcCXeXmHmQokW5qzVllCuhehlivHYl7tniSo8I629Rod9Sp7jUd0OQjYbW6VsH8C/yI+k9SvRl+2HQZRA6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRAHHvhbYs/w7JqKmNDTOuzVzjxRKSwWwM+On+FF1SElCIUFem
	Ha99qUGJiexKY51X4yDJ8bZJr6nokj58/952dSNw7Fnm17JWiXkNKmaJUEDCNEM=
X-Gm-Gg: ASbGnctR8fu/085e/ms8B+KuNUzZ3MiWDwXNRDg8iCl/7CUFbGD7yns74hst3lKof0P
	0rHRqDTbHU35lZVZVbQyHqyK5u+9epBB6iGNd1SNc41nzEeJxu7Rhi729MGJLhK4H5G9Khd5xoU
	lh0IRyaTZECUSUmaoTq8rOg/nWCMMs3X0GsRWX767CXgZFkfm6Wvk9Tja/2QOVklKRPRY5cqTW0
	8cYnvbOr2x6YfkFGd/aQXrzbUi31LYSlAteV9L4sV9kp6VKirD6q0pa6l5L827DfFzdOzFgdPMz
	qiLnkX5KuYFtfFcBPtHUfF/hOiVGUgb+7G5a0iL7ek6c4OuTE+pCZLFUcwYvvSiFB/hcmA==
X-Google-Smtp-Source: AGHT+IEvlt2SB/BWSd7IHVRcLyRr9LxNATE4wtiptj0pMzXSD4oiYGVGqTIPQ4Cf2L8g8oNx3bNKiw==
X-Received: by 2002:a05:6000:18ab:b0:39a:c6c4:f877 with SMTP id ffacd0b85a97d-39ac6c4fad7mr3875334f8f.20.1742902863180;
        Tue, 25 Mar 2025 04:41:03 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:02 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v5 0/6] ASoC: wcd938x: enable t14s audio headset
Date: Tue, 25 Mar 2025 11:40:52 +0000
Message-Id: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
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

This patchset adds required bindings and changes to codec and dts to   
enable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.

Changes since v4:
	- do not rely on as-is idle mux state, exclusively get mux

Changes since v3:
	- rearranged mux deselct to do better error handling.
	- reused mux_state for gpios as well.
	- removed tested by on bindings

Changes since v2:
	- udpated bindings as suggested by Rob and Krzysztof
	- cleaned up swap_gnd_mic callback
	- updated mux gpio to use dev_err_probe.
	- added Tested-by and reviewed-by tags 

Changes since v1:
	- moved to using mux-controls.
	- fixed typo in regulator naming.


Srinivas Kandagatla (6):
  dt-bindings: mux: add optional regulator binding to gpio mux
  mux: gpio: add optional regulator support
  ASoC: codecs: wcd-mbhc: cleanup swap_gnd_mic api
  ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
  ASoC: codecs: wcd938x: add mux control support for hp audio mux
  arm64: dts: qcom: x1e78100-t14s: Enable audio headset support

 .../devicetree/bindings/mux/gpio-mux.yaml     |  4 ++
 .../bindings/sound/qcom,wcd938x.yaml          |  6 +++
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 +++++++++
 drivers/mux/gpio.c                            |  5 ++
 sound/soc/codecs/Kconfig                      |  1 +
 sound/soc/codecs/wcd-mbhc-v2.c                |  2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                |  2 +-
 sound/soc/codecs/wcd937x.c                    |  2 +-
 sound/soc/codecs/wcd938x.c                    | 52 ++++++++++++++-----
 sound/soc/codecs/wcd939x.c                    |  2 +-
 10 files changed, 84 insertions(+), 17 deletions(-)

-- 
2.39.5

