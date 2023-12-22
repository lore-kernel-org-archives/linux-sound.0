Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7023740
	for <linux-sound@vger.kernel.org>; Fri, 22 Dec 2023 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFtt6kZT"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a235e394758so216926766b.1
        for <linux-sound@vger.kernel.org>; Fri, 22 Dec 2023 07:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703257303; x=1703862103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W4lx9wwE1i9du74XL1yxBGJ3vsI1REncsFrgYBE3k74=;
        b=rFtt6kZTCIUos/jIFBJjo4cGSNZeyF3y1EGRtvnqutUgeMApU34w/GCLaYIMJdToRk
         s0PTo/EESbYt89haNIk6MPHnYeSA0kHPGc4BYVekgOaEEYCbLVdiPj7hikpBlGREmLdR
         spRBqNle7Xdt5N5RRrKvB+3428tvripGsImhyR8GPgbx4Nevy28VwD2iBPaxIT2qSZPX
         rKJA7yLJe7O+puMpIa/rSLXQz4Fzxpohvn/o6uKnAYytTKNKUEYjqstzfh41qIu0qXP4
         ePAUAaRmU5/7oaoWt4r9FhfJ33Q3kBOfnKkF9/gRAzcQz4JelBVSMwXSFFRYqhIR6v2+
         SQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703257303; x=1703862103;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4lx9wwE1i9du74XL1yxBGJ3vsI1REncsFrgYBE3k74=;
        b=lJ+gghr+CyfUveupWVAFWVc090aeGT7I+nNk628aX2UzBySSHo1oqEaViDjmUwZ6Nz
         MobOqf8zVPfLGG9Yed/F9RFwrhjwC+5kyPhc+R4yVxdBLBUjev2MlHBkXMFsegdflJi7
         jdQ27WSsqp0EaRgCWQag4Wqnk2UY3WL1W3ln7CIX+a+0bcmCe88DWlRt9nyOcanqsZCz
         4inluAbL6GdZ+nG4fkZsh8WWZ03iOFt6E4aluC9DbVcFHWgIaYnoFOWr7Bs/OgoqTkDk
         gbOMs7h8vGIT930JeZtssyJnspE2EHCdeeQwxg9m7L1BnQIdX/PRGqWJHl5l671o9B4X
         MGtA==
X-Gm-Message-State: AOJu0YxlkHbgMAiUCHoQpAVycrp//AxCcOjqA8j9kx1/5fXKiYTZbxbo
	vNftH7fjutLRKQAqXK4s7SZ3atVDZZpqgg==
X-Google-Smtp-Source: AGHT+IHRKrti1VwxIc09jY0oOuJy9YPs+JgtifApCY/xsD7vtw0cq160pet+7Cxzey11G3sc5FPgzg==
X-Received: by 2002:a17:906:278e:b0:a23:577f:5fbc with SMTP id j14-20020a170906278e00b00a23577f5fbcmr849058ejc.79.1703257303016;
        Fri, 22 Dec 2023 07:01:43 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id h1-20020a17090791c100b00a26af35c171sm1275671ejz.0.2023.12.22.07.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 07:01:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 0/4] reset: gpio: ASoC: shared GPIO resets
Date: Fri, 22 Dec 2023 16:01:29 +0100
Message-Id: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

We have at least few cases where hardware engineers decided to use one
powerdown/shutdown/reset GPIO line for multiple devices:

1. WSA884x (this and previous patch):
https://lore.kernel.org/all/b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.org.uk/
2. https://lore.kernel.org/all/20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz/
3. https://lore.kernel.org/lkml/20191030120440.3699-1-peter.ujfalusi@ti.com/
4. https://lore.kernel.org/all/20211018234923.1769028-1-sean.anderson@seco.com/
5. https://social.treehouse.systems/@marcan/111268780311634160

I try to solve my case, hopefuly Chris' (2), partially Sean's (4) and maybe
Hectors (5), using Rob's suggestion:

https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/

Best regards,
Krzysztof

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>

Krzysztof Kozlowski (4):
  reset: instantiate reset GPIO controller for shared reset-gpios
  reset: add GPIO-based reset controller
  ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
  ASoC: codecs: wsa884x: Allow sharing reset GPIO

 .../bindings/sound/qcom,wsa8840.yaml          |   9 +-
 MAINTAINERS                                   |   5 +
 drivers/reset/Kconfig                         |   9 ++
 drivers/reset/Makefile                        |   1 +
 drivers/reset/core.c                          |  70 ++++++++++--
 drivers/reset/reset-gpio.c                    | 105 ++++++++++++++++++
 include/linux/reset-controller.h              |   2 +
 sound/soc/codecs/wsa884x.c                    |  52 +++++++--
 8 files changed, 231 insertions(+), 22 deletions(-)
 create mode 100644 drivers/reset/reset-gpio.c

-- 
2.34.1

