Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6511014AD2B
	for <linux-sound@vger.kernel.org>; Mon, 26 May 2025 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256605; cv=none; b=bTuC5ZXw7+L7f76TEu/+nqOoPECkOSN6hEtmTX4x3YN2S34BeI1u8sKtzfiv1l+WEX0yVNJVDXg5cqFDjBFGvfaNqHUsALjeG+u7LV9AznCQid54GB5b181okMdxbFGbC9IhogXKmhpKmJmP4WQ7owr9rrOv947Wmz+Id+OSoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256605; c=relaxed/simple;
	bh=WbpB9upkv3/HDk+JtSehQw0Ct5NABTO0UPSvKkYXBgE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NzBmFnB+DkqYX8NaKnqSlAmVAXuwCLjmsuxOpejciA4T2bSzIJ3pbQqDsvhpYL44nR1qvoQ8GT02GmFYvfP8JYc3vAA3TvEv8TqVYDvMYRX8PwyvCwNEY87HT5ftBUVXkUNQT2tEaO4zkPR8okrx9DX12iS+xj+p7ql4hFTLtj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rU0L5bMV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rU0L5bMV"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso3633155e9.1
        for <linux-sound@vger.kernel.org>; Mon, 26 May 2025 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256602; x=1748861402; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4lITYVXHPG+JFCrFUyQZsYC0j5Z3JlSEM4hag1CnWg=;
        b=rU0L5bMVA/9qcPQVPhAiyuvTxnIQOYPgLYOEV9oZz+9qyrlsl8d3dhewne4+esXoGR
         i5RGVGswwh2itHz0qgfTVuQrz6nr3I/itdBlrS3kmJpntZAmnNA3onl036GivDzqcEgF
         xFz+aMf2QQNZqN7Mo8IzLPaefaHtvbxx6up3ymRCfgOsHxYn98hK6kwHtFfDojPe9HJL
         yl7iODrfeaY4Ycqx5HTm5m89hg1QeLmrCE4mrufzdIVSrmb6FXLR5XHKJhO4YnkAzN7Q
         jNmeUbh8XNG/8RaV+aivdGB2qFDuoiq0st2VVIfEV6oKKFobxnBGgBAxteOWbfE4Jj8q
         bFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256602; x=1748861402;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4lITYVXHPG+JFCrFUyQZsYC0j5Z3JlSEM4hag1CnWg=;
        b=pcEpbUsw1voIXkPqbyb6uJqyS5JzY4PaAQdh++95Za3ZuhIqDdEXC3iHCHOD3G5JFL
         FSjcg60+konX+P+DD19B5ZdXb3ynAJuZZsbz9zqB7B+3DlJsWZGc5Jn+5WTlQo2KakHi
         Rg/v87Eife7GIgeiZke0C07bi0wyHzGgbYOmwwKNY69aktUWzp6c1qjUdGPBXXQmQ+O9
         6KkO4BYXkqG9EqPTIp+U1b8qIlfWpZzR4DFuhEJPxfmO9pyvnqUl36NaYx29yLrQVVj2
         4WgMo8re5SePozkX+d0wT3NGIFealAy/4uz629mQo6kHjACDPXgHsjL/PFJN/yU/IJwg
         Z5tA==
X-Gm-Message-State: AOJu0YxIm8HGauOTKNNxsk6pC9hOALluXCkcOGGoyoT5wIei5A7J/XkY
	e/ao9EwACBRQgaw17HewwcRsl/zRjMdjTGCdWRzACq4yaJ5QmIuS1VhUjFkkunLgokM=
X-Gm-Gg: ASbGncs15NGK4anQ/F0hh3ue8Lh8/kxBapP/NF84TM2agwc4slzcVn88I5C3SyAxvjP
	2ZKv07S0N1hJ7Z8rBG2H7MgB5ggEO0x+a+Ej3ynPSFBR5h288UKZ99N2rMO8uxdgIGOTyyc6dTm
	sPNGaWSxU5Kk0SsVrbcWVKTTujlZ1Rz4dkGa90SGgz3DBD8Ay5tDqSd/3XXWoVfpWcShE1B8pPL
	2XfpIvpi9pK7qfYFYYxy0W3MxmRHdS3n2nJ4OODYbgRpKdt+x8OUXfWqCKQUb5PMYwBRBk5c4NA
	sQ4EFqWc58XRx6sywJ0ykthyT4RAtycxLkMGpyEcWXpNHHu0JDznOEet3CFxhCFB2GQN9A0=
X-Google-Smtp-Source: AGHT+IFTCow9aqRgGawC6WRupjB7jYfRrQO5KpOeG1VtSzVc+AOaepEj65qG+3tyNe2uLXjkg3HTig==
X-Received: by 2002:a05:600c:314f:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44c939c15b7mr24734825e9.9.1748256601649;
        Mon, 26 May 2025 03:50:01 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] ASoC: codecs: wcd93xx: Few simplifications of code and
 extend wcd939x
Date: Mon, 26 May 2025 12:49:49 +0200
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1HNGgC/3XMyw6CMBCF4Vchs3aSXihSXsWwgOmg3QC2WEkI7
 24DC924/E9yvg0iB88RmmKDwMlHP4055KUAenTjndG73KCEMsKoCvsSuzgRvslZbQ0m53BekUl
 eta5174SCfJ4DD3494Ft7duDnK/vLOX75pvjF//gHhoK4KrWtB0vUJAntvn8AYg3uasIAAAA=
X-Change-ID: 20250526-b4-asoc-wcd9395-vdd-px-ec173383bd02
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WbpB9upkv3/HDk+JtSehQw0Ct5NABTO0UPSvKkYXBgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNEdR7qFvr6UL1ZKTX3h/FDIAzezQEzI4GYoa2
 L4h6FAFDLuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRHUQAKCRDBN2bmhouD
 1w1ZD/9MVoUXjC9vO2SEnpFp8EXEhxpV1ONhPJ6ST2hcJMe1hbdgGCKoOaN64U9Yr9d0bAEVvxR
 FbiX2DxbctoAxw4NhIA5XumxqO2mQoE0RZPqNWVyZ1P+EJw73qjQOIK3AaSMcWom6Vprh+Om7Jl
 ccO3YbuMTwJacvJMz6UV4AEuC9zWp/pc52b0Kpb6TLR9xQwrsSwISF/9zJdzrL6Hz+mdtmKHGbN
 PreHzQAPbqJAXIcPvdr9YpsxGU3W3u0shKAnJiIAtYNHMDVjisj/8YsgRidBZ2FHbWQD0Zq0Sdz
 nSVxOWgUpgoeyAwCElaSZb7wsqDm5w7H5TctZXUTu5zAKb7IO0ZB1Y0rC+8vC+BWH/JqPAJdyiT
 MSjODoEyLNpEZW8CokmtSr5vMLriSCZUZ5E6L/L2LLtdm73VLEnw/CDEtuEOWv10E/9UN3StNB9
 UGtimW4YwJ3u/qqeuNjFclZbZBmYYosOv9GGxsBezyDHZ6cl1HZ/tvIPMAyl5SAfX8h+eWk4sCm
 Qg08A85sGt0lBCpPy+HuiKhnzMM4Oe35hn3XleMS5etsx+FRLUyaqHg4z6yclFLSc9WRdxxAPH3
 3hGOoTL9nmLUVxXFq4TDwMS4DV6/vnwHP+8mTbnPv4ZMYYxEGUEyh8oD4G7ZQz9KWHFTYsk5Uag
 vUoAi/jyY1lo1fw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Make the WCD93xx codec drivers simpler using
devm_regulator_bulk_get_enable() and obtain missing VDD_PX supply on
wcd939x.

Context depends on fixes:
https://lore.kernel.org/r/20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org

---
Krzysztof Kozlowski (6):
      ASoC: codecs: wcd937x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd938x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd939x: Simplify with devm_regulator_bulk_get_enable()
      ASoC: codecs: wcd939x: Simplify return from devm_gpiod_get() error
      ASoC: dt-bindings: qcom,wcd939x: Document missing VDD_PX supply
      ASoC: codecs: wcd939x: Add VDD_PX supply

 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |  3 ++
 sound/soc/codecs/wcd937x.c                         | 31 +++++----------
 sound/soc/codecs/wcd937x.h                         |  1 -
 sound/soc/codecs/wcd938x.c                         | 35 +++++------------
 sound/soc/codecs/wcd939x.c                         | 45 +++++++---------------
 5 files changed, 34 insertions(+), 81 deletions(-)
---
base-commit: 3717d2adda1ad07b4ecf3bef144ee489cc1563a1
change-id: 20250526-b4-asoc-wcd9395-vdd-px-ec173383bd02
prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

