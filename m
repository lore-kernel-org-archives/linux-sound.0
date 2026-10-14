Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AD14DEC0E
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979341; cv=none; b=lJkCtVMU5XI9hjpr06TfZBMImvH7rPZ77FduGEjExEJ/K8cCQLczAu3YLO/vN3LfxquNGDL1SPhapZ3the3YWVldd6aG6N6HSp0LlXWarBY8E0ZUdxMz9g+p4GPahSqsUZiHtHnqfXu7PiXzTshL3IbeAyMWmOwVd+XjVkhwBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979341; c=relaxed/simple;
	bh=ew6C9tF0Hto4FCznXsHAlkcnPGFhEf22Z2CTdUK92UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KI8rP8XWErqIFAz1UszWnVHHLYf9pD2qkZ6QTxwUhRNumwRjJ9LfCpdbM9XLW33woG3OKOwC8TQRL7BEXtGn2Y6Vo9+2/j0Z5Ya/kF2tDeaMignrVE+hmRVBNLMD2GsKC3lshaJgRPtpqo4MpuzYzwe1RIOuehNW7wa8fPOsmpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aixumOY7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aixumOY7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so854402a12.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791979338; x=1792584138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=aixumOY7nnXWzJbjk4sjmVUDbx7viJW1FlqyrKZVXqJ/UC/+cbbMXPk00KtgKpv21p
         D7KGY/amn1M0XetyKWmo4OQrhdbYJcgn8DRIDb8nllS5xMQyk7Qi+36t9ef+R0UP9fov
         0yDOLY5NdtOdkwTmtsMqBlsz+ZXZtqz+iYGgoJny2vaOyNYV/znibMwde4taW9l1YThq
         B0yTvdTp4c9Mu8/nAym/mWkzDJz4RD4FX477xFeoKq9Lvfvggkxx6RFSmzI4aFvuPpGT
         R+Fr5wRtXAtygc2aVNXRa4HcmN60dlVL+3lBVBfEa7sacVJuQi6kDL2tvM2uyQDKXWHl
         YKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979338; x=1792584138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfsJvhoEFG+uWSyTw8uJ33oKmHT7ytqNaOzPZrQir/U=;
        b=zp8VFIKw9ZpILzdeXbHiEjUxHwL59c5oejLzvvOZmKOn3fqvZJY7r0338+Ywl8TXJg
         N05s7kaqYurHk1j1TEJZk6MQv0Ue9BqiE9Dr1w01Lvryjrctv5DoNHEvfXCHgcx1VHwn
         8ZFJ+ASFNFgcaREACQsHbcfZpcBgKk0uzYfwjUQLfYlpj0UPn80rcsQX1spivjnykxPF
         ptpsKvgrWCpT3+Gk++1m6YKXzoskqeTgoovAjQuFWLGY565Lsl+WSw1jCl8Vqb9IR/Ns
         w0oJW4ZYmWXZYU3sO7D1LKC+2JxK8zYff/JJAE4c4Y2ilDP+SSRu5zThSQ1mYbpGB3vg
         BqCA==
X-Gm-Message-State: AFq9FYIWe4o/5rhkDUi0P8wDiVJkDqNSVDUtpQyV2hPLdC/SF7uqDBWV
	xlFaF76PI++SF6ozF1aUzH8cOCbW0i9qyA5F1+6assX5zdAt7N0+AqFa
X-Gm-Gg: AYBFou3Msi501I7moRP+Kg1yfR6R1IN9WLsLvck62Mvo1WDugYIyYK/oM5nMiwoisbV
	qmna/0drHgyTDXRMqYeHO3hD0K0K3o49AhTFbC5qbvL6QYVh/8JddL3Jv8kIDg986ghc+3gPHW/
	MzQ4XzOVrY5MEYOlkv75nQQvdmxZKeJGmH/uOf1BSrhjvR+BjkApGkJ0YqAdgZ8xxTFYgyufHPN
	aQQawKDZs9wie6xH590PhI0Pvxr/L8OmvNt2D1fJUSyDe2GMo981A6BVX+CYGRgmKmdOSBzSmDB
	F3WhxDzVAENPlhKoJO9NpSIHejQLuHlETYu3v+c7skHVH//Zu7pSs67HGlXIELh/odRY+/OW/d6
	q1AJpaQ3mSgf8JzhiLna2VmlQ1XBa14ncK5A4t/PB6zHHPO6mhWcnpy/swqdC+Gt+xiOXeVO4ja
	P5vfe3dELJR/YI78ifTsfGcmTdc4XsNa9fjJc1UQ6g9WkjZemuwDSSzsYWatHVRPRzVchOk0/YU
	wFaOxleEGMhpqeobkFCe+TOzrvkZw==
X-Received: by 2002:a05:6402:c1d9:b0:6b1:b9da:2047 with SMTP id 4fb4d7f45d1cf-6b1b9da412bmr5434409a12.16.1791979337314;
        Wed, 14 Oct 2026 05:02:17 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm10937057f8f.36.2026.10.14.05.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:02:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: tegra: Support WM8994 by machine driver
Date: Wed, 14 Oct 2026 15:01:46 +0300
Message-ID: <20261014120148.126160-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wolfson Microelectronics WM8994 codec support to the Tegra ASoC
machine driver. The WM8994 codec is found on devices like LG Optimus 2X
(P990/star) and Samsung Captivate Glide (SGH-i927).

---
Changes in v2:
- added missing dapm widgets
- added owner into snd_soc_tegra_wm8994
- fix jack detection disable and place it behind check
- change copyright comment style to C++
---

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: nvidia,tegra-audio: Document WM8994 CODEC
  ASoC: tegra: Support WM8994 by machine driver

 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 +++++++++++
 sound/soc/tegra/Kconfig                       |  10 +
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |   2 +
 sound/soc/tegra/tegra_wm8994.c                | 175 ++++++++++++++++++
 5 files changed, 299 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

