Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083AA287274
	for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895442; cv=none; b=IcqRi5onMTt4MofjGQj2Q67dns/KrfGyGOwMpdtTC1mjO5Pnu8ccAS5jpHokWHoGwLG6KjLKUqAEdpPWZMiX0fe3zOsl1ndFl9IGNW4sqwvSGWluJIG3AJ+wMBeErCr6p1DPEgW1ZaH82+V5suBg/tp/6AoWK6SVC75qY3M6d50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895442; c=relaxed/simple;
	bh=yys+Y7kH+kxLmahkOFj8+wmPki8hhBTm+J6+LUsRF8U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W7B9EfvgzcISUUmUsVAyY5Og/8GHdgG/XESY4Xq2r8vvn4O7nYcPCRYg7AxgRPFrDlpkQsKvbAXats+WIJYj/6r/JcUDyFY9+M2/VUQ6Kb3OBwDAirF/27TQEhfgd8mHHzuzUGD9H4DUqkByf0f3Lqen3dnAyZCGYzW5y6nxsqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yhv7BtNq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yhv7BtNq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so300638f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 25 Jun 2025 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750895439; x=1751500239; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVbzmXkQ+ioipLbjuwvN0ILc+ibg7MYD7cUDUXAebNM=;
        b=yhv7BtNqbpyavOIBpqsRlzQa6f64l3Dn1m6lbrAycpE3Ub1fbUExC5KnmvzjENAR70
         uoiyE5F9fBmFkzJkUfN3t+SRpsJ9PDU/1JM3wdTjtcVLLyhp2/Hu/10JxN6iM5kF370m
         lMf44EkTewORRBo9eUF+4iJQfWD1Z8CDfLAjDqRT8/BxvoBR4L4+NuhSQLg0bkgECck4
         Hb0B/wjqGqdImfIJJk+qZ1ayLKuojIGWcjYYVtk9IxKV3RndExzAVsuoBepvQGafQGvT
         N8oGWV84BMxO5ZFrlYmyRECJEHbtO5mJ83ksJT8oWpomHqBbR0ipWLBnpEJ1OJaiUHCe
         xOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750895439; x=1751500239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVbzmXkQ+ioipLbjuwvN0ILc+ibg7MYD7cUDUXAebNM=;
        b=tBbj8VHioMrX3caEbvI1B0fHylGggVm6yh12x1lGZYtD7nWaDCvAgdlwq1qg1xMCz6
         3ZqgBHulv5kl9+8VkhWaAGmPufo6iRPJtNAC0FE3IkeBIYxvUiW8Ud7dY+uQNOKgj3OW
         Dz3O8jvR62BtDQUtD8Fd+17THvA0PelSTfBUiC/25Cw9OJ0vigfcD3Gvx15AC8ovJwKt
         tUEjnM8Tld3rdlZK3Ai3GkyewbqW41SvpsW8t7G1EeGFXf/Injt3WSaEfiCRTgZuhDVX
         3giS9C53UISrZ4iSbfAEUeofZeb1Kg/o4hG1zl+xNgKySfAAzcW4LCA3AkDEiJz5aJau
         KrOw==
X-Forwarded-Encrypted: i=1; AJvYcCUq4k0hK6pV5n9eff3PUiE4MZcGKs2zMC71kXwphF/k67MUsh181e01s6pK9thn3ToOjjETxECkUzFVgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ9NHMikHoaC0m84r8P/HeHzlLXUYgXlWC/oeMazXuUtg8GHCd
	WFklyCGxPvboEJboZDouxyZnK+2g3O4omfhu9WqK8C6it5wK7D0GtZYjx693kTAGjKQ=
X-Gm-Gg: ASbGnctBlIX5i2nxDuOgqbHt9Ax2v58ofvjuqZ1IguZh55MdCr/5IWeS42wFoY8Wg39
	VpQlyTr3iZjC9j6/UM3AZFCbPITa3ymV3pByQskOh4geuZM4tqMs92zkMHhyzb/oIWs/Mbq4fCj
	X0DuM2CN2BGT2eezNUJ5ng5SZ8jEfz3LGAbHU8slXqZAh7MG75NSa36h8aI+7QVhaX8eN5Rt6Fp
	0pYVAgQuO65Y7Sx42rAWaSb7zBfwyXu+XoL2F8AxHDG6QpsYeoj5jBp7HsZBrOHc555ezVeGnF+
	7TldJOpq0PyAObXdBxcsRyqazeKHGADknLSTpIB+TcwG5RP3WQANoDdvfDtwAjuOG09Uew==
X-Google-Smtp-Source: AGHT+IHiNkMf63E27GyHyQ9CDnHOV87nvjoonLrt5SqyVkwL3YcXeaYC1SQaCHL9+wqWnnxtVniKgg==
X-Received: by 2002:a05:6000:400d:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a6f311aab6mr1095295f8f.16.1750895439285;
        Wed, 25 Jun 2025 16:50:39 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:1417:1313:3884:915e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e805dc32sm5636300f8f.29.2025.06.25.16.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:50:37 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/3] Add PM4125 audio codec driver
Date: Thu, 26 Jun 2025 00:50:28 +0100
Message-Id: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAESLXGgC/x3MQQqEMAxA0atI1lNI46jgVWQoJcmMWWilRRHEu
 1tm+Rb/X1A0mxYYmwuyHlYsrRX+1QDPcf2pM6kGQuqwp95ty9tTF+IulgInUQ6Hd0gch9giijD
 Udsv6tfP/nT73/QBuaNTdZwAAAA==
X-Change-ID: 20250626-pm4125_audio_codec_v1-02ca7a300ddc
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

PMICs like PM4125 have in-built audio codec IC. The series here
adds support for this codec driver: DT bindings and codec driver
itself that consists mainly of two parts: soundwire devices and
codec part itself.

This audio codec can be found on platforms like QCM2290 and
on Qualcomm QRB2210 RB1 board.

We are working on this together with Srini
(srinivas.kandagatla@oss.qualcomm.com or srini@kernel.org)
so this is shared here as minimal working driver and more commits on
top of this are expected that will add and extend functionality.

Currently with this set the playback via line out or headset work.

This driver also has a bit limited support for concurrent playback,
since line out path is connected to left input channel.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (3):
      dt-bindings: sound: add bindings for pm4125 audio codec
      dt-bindings: mfd: qcom,spmi-pmic: add pm4125 audio codec
      ASoC: codecs: add new pm4125 audio codec driver

 .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |    4 +-
 .../bindings/sound/qcom,pm4125-codec.yaml          |  147 ++
 .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |   86 +
 sound/soc/codecs/Kconfig                           |   19 +
 sound/soc/codecs/Makefile                          |    8 +
 sound/soc/codecs/pm4125-sdw.c                      |  485 +++++
 sound/soc/codecs/pm4125.c                          | 1848 ++++++++++++++++++++
 sound/soc/codecs/pm4125.h                          |  375 ++++
 8 files changed, 2971 insertions(+), 1 deletion(-)
---
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250626-pm4125_audio_codec_v1-02ca7a300ddc

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>

