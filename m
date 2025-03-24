Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0BA1ADC86
	for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742821266; cv=none; b=FDx5Rp4wCaUfZHx+Slp0tSacF98xfzPFhwldqb4GAQXMlhtC30/2HituvXJvRfJYSsEJwNCdV1BMYXTgTuzfMWvodSl1wXuxozqYDriEitANTDTqBd2UlVuOQlWRNEaW2M3Ome15fYQkS2P7mhT82D09ruXFVbXF4xqRy/7NE0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742821266; c=relaxed/simple;
	bh=e+asD1/kySHtQyB/lOfwPMKIM/FlqM0vMt5Kru0ld6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sInOfzhuo0ft/WBGN+zSHbJ+ndUa5AqboOmaHgOKROvWBoduHBoEDSOjzmJgWzdxaWOpsDdJAWm8h5qxf2wtwD/Sr5lS0gzUXUg2tcvrza54ndP0Td4w3yNmIWT7z2XMuiMW41nuifTYHUN/92yn17DPcr0TZGOD8EdoPieP16M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFAdZV+b; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFAdZV+b"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso29852545e9.1
        for <linux-sound@vger.kernel.org>; Mon, 24 Mar 2025 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742821262; x=1743426062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+jNjLycT3ZQAOIz+8wQ7nvfI7CnYsytMJ+JsnPa5OA=;
        b=mFAdZV+bDi0iz6bwZ5pecxN6/FbGc1z70UReMoutX/Y7slqZlANgGqfy5xmCQ7J5hU
         RYVOwq4y0RjQRUeUDKL1SzFeQMfwhfXx1OgIXPS4rEF1ps7VTsWElZprHtwLMHtJxhAi
         8/TB/2swa6ZGLt/lnKjduRH4LQoa2j2JHIJ3+UxZrMGMJwcScQFCT6a8CwTo3IsTokHB
         QDN6pWogktBClYzCL8a/oov8+31azCFMNEu2xAp4dkdQfO7VKgiatblWfbLq8y8Z32+W
         YMnGSWHREtP7pfMmtk7viqkYmUeE2qC8/LujxL67Ww3WV2v34PX8uBhTewZVOyNYBc3V
         EdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742821262; x=1743426062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+jNjLycT3ZQAOIz+8wQ7nvfI7CnYsytMJ+JsnPa5OA=;
        b=MaMDUjQjmOxng+l7voE6MzZqTL+mNweL0j2IUwhK6PSy3yl9Mn05gQ6EGh3ic/uFny
         BJtOjqljVXRP11h9yLtpt66bRvAKmbwxhvv58slAinIaaHVfc79D63LfM+IRQk3Y6h5z
         WxiI1Mu+t/z6JU4QCPQ1pYO3IwTeFNb1z7VZAwPoSZP0OJkiXJ5RWX1Hx58Uo0dVgd2o
         qHR/ld7nu5hLvLdEsg+h0wJ7izVitZxIQPokEiE6chhPjPks/zHin5CEVCU8WFtbGZD3
         yK6Tt1UoGkFMuuGrxVwwgOfO/eeBLEv7Ju2f2ygRptcPmbylL8TvRD6ZY7yjXsodfyCp
         N1kw==
X-Forwarded-Encrypted: i=1; AJvYcCUKlLqEOeVnloeV+ojCMjEFNaItzQkGAkw6BM/TfZhC2ueJ9xm+E4kkiAamFJ0p2TNQh505cuAJYve8Fw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzF1LC+vAtfmXrOKybrKPCsQKULtu4xxbsjkC45BOzR/sHy3BGu
	5/URB5ULFyHl8mSlNDrMqJtgT76x/IteRbRpIFW1y12cMnQukKp2LWF0MbJZY90=
X-Gm-Gg: ASbGncv1nxzisAYZhiWELSPfaLbi3nToJXNBMgR8E5sW3R8Wt1uQ0YOz2VkvQMP209G
	EntQZ5Gk1o8yGCwNAJOy23cSJLW4fo4KMA3IU3dZ+vJUFQVVUmy4k5xKBPRr4DgDehnaynlMWDD
	X0CMOaduu1T2oAuNrGyRKcIrrpsMOcvIolODCqmjoCiIRCayAQt91CQDFQOq5Gm45KZufzC9p63
	d/dbVKwTq86fznSTt9cr4mlkyTmHP6pqtSLct/lkt0hngkFVG0YdPM6uRNEncK291lxoGXsxe3K
	SXUif8FP9HRGsjz+6RRlVknRvuqWr6ekUAVONLxTvIkSFsdMLENayKleb2Ar2KUyatiEhQ==
X-Google-Smtp-Source: AGHT+IGz9IBknBvdoHaX2dPjOfY7K08ie1Ra/SNOt48wwrRqkVCUOOGWrJ8G2YTKz1/+6y2ctou0Eg==
X-Received: by 2002:a05:600c:299:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-43d509f5a52mr93992365e9.16.1742821262372;
        Mon, 24 Mar 2025 06:01:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm122275975e9.40.2025.03.24.06.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:01:01 -0700 (PDT)
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
Subject: [PATCH v4 0/6] ASoC: wcd938x: enable t14s audio headset
Date: Mon, 24 Mar 2025 13:00:51 +0000
Message-Id: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
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
tnable the regulator required to power this switch along with wiring up
gpio that control the headset switching.

Without this patchset, there will be lots of noise on headset and mic
will not we functional.

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
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 25 ++++++++++
 drivers/mux/gpio.c                            |  5 ++
 sound/soc/codecs/Kconfig                      |  1 +
 sound/soc/codecs/wcd-mbhc-v2.c                |  2 +-
 sound/soc/codecs/wcd-mbhc-v2.h                |  2 +-
 sound/soc/codecs/wcd937x.c                    |  2 +-
 sound/soc/codecs/wcd938x.c                    | 50 +++++++++++++++----
 sound/soc/codecs/wcd939x.c                    |  2 +-
 10 files changed, 84 insertions(+), 15 deletions(-)

-- 
2.39.5

