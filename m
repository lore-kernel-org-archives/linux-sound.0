Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FCB5218BC
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069612; cv=none; b=gmh70PbZOdZvM3sy3B+hrSsYE2XLQxb3uLP716tsObOsYRwHGA4Yc7nKR8GYLENM0SXM2byyIU6bUN2fbeJKrbLS40YPGI3ZQLlbjb2SZ4LQi10dcHLDXY3zTn/pyU0tu3sYr7tosj7QGQ1SZHz2DexTFtvULAty9nHxZ9cCozU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069612; c=relaxed/simple;
	bh=p7n1Ecnt0Ig+o5MTz0wrxEjhHgnBndQY1zB+5PXKm0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eAnPAgr0u9mWe+CFChkrSb5on2PXygVKhG0tRpKGehd9N7Zj4vWSGFPnOB0HT2WZBa/7Ib4uIXUhkNJaODJ15wA7chV9jh0Thzcb862x3kAkuQzgcO57gnOFtNCTs1CmcPqSt0E7zxDbPxcf8XuCONBkozq6bVLKuYRqzjj4Rlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSTbGdrw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSTbGdrw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so41535015e9.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 06:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792069609; x=1792674409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVKjnhR2wtejD6NNK20XI1upYrpeZTFwNjFuTIUiDEs=;
        b=jSTbGdrwnV/nEf3vlDHnERFngHyo4ZcfFxiTjjQAijnrmjXtjt+CxUTKT12zwTbuFP
         JOkfKqRz9jPk1I9nmZjfMYSN3zj3NNitNU7VVkZzI2lAvVHf/rz6US6rGfIrSQ4/ISqn
         iqEyqrfkqot91lYJQCcJUY9StHxB/7myvhosgu2Ai9SYrd8YjB9XtoijxEb5qGRP+NNh
         fwECS6FeOjafxArgc6nU96FxsgWau0PDWt7Vbf+1vjYhqxi94/zYxm42lO1OHOUKSoH9
         sMxDRw52ZbNddZpYbR1B3TiZDLJXLPlfd5Q6kDI4VUHEx519zJssunR4RMQ004B0o12N
         l40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069609; x=1792674409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVKjnhR2wtejD6NNK20XI1upYrpeZTFwNjFuTIUiDEs=;
        b=LKwRd5fTG8wOlKJLFUZe7lo9RcR9mLJNkSzhMrgbp+Mi50eE6Oxp98xmuCQObsEWQs
         4hyAbEqtxlB3Vr+Np0x93iA4dOX4/12ZGlGcckmsCtXThspmea8XHmS4NZMXopQcJ3rx
         t4CEbMkqTuXUWXsiGvtaoiWGZiKrpLhEfvGIoplxpHwFyAhwvC0oBWUwJLc3RchVOFn+
         b7RDUA5CeJCFVuXIlqPcuH2l3hAU6EcczipLcQE5noPWAZSeaZPU/PLqlbWP1iwdjdOO
         tWfwDrYLzdDJzPEASyh7lD0Ya9gR8lhdFtFknZ08QxhkF1sD2erDMHiok7vnQC8Iw55r
         X+TA==
X-Gm-Message-State: AFq9FYLR7VmARlaPDqjTNDZrQGOpy4rloCnFMLer5UbrQQCbE7MCgTpL
	pTZ//3/LscAvZQMIJVDP7O53kC31B/liESu4VKOAW0CvQMMx/0zDCOuN
X-Gm-Gg: AYBFou3SKjclSoPqM16kLH8hT8Bbn5zXsDBC+seY1inahBW9dD1CHFEuxvFxSpJgbQP
	DZtkY9c5UjDT1qoC+J1B0CFUlEh0AylBorMHFuWyqn2uDjHh05V0KLzhSLKtkypu86wcdl4D7D4
	wtzk6kWq/Mr9Wz2kR5B9IETMjyRsJTsFlxzsX/whweQ1B3XqxG/3bZu7prqQN0BeqoEn5H9+6+L
	PbCo/8y6aFJ/5t4c2tRwWQrBRZvZL8lH1+ROOvWXxZkKlNDbISf5ERDZuOMuNZhtMkLFsyyhWTH
	xi5Wl27L08d9/WWd9jfsG/tuoHSqQcmvFGI8WXzV6Q8xrlkHcBwmxlkCc/ObNfkILenie0vUUYI
	HqgW2qTEp1Du95Y4CLgBSsnlfMzaYBG3fEk3sRAWCFLt9z/9YixmoLhY4I3ErWIDliVuMpONtRn
	2/vFdYCUMC1zsLRLlPUVBWoeBKDqL/R7cWv35EtHaOvrA8hwgZUWo2GaLBEIAHI30ri0Cvz9K9X
	n1kxXiR8EDv/lPSj7c=
X-Received: by 2002:a05:600c:a088:b0:4a0:333:253a with SMTP id 5b1f17b1804b1-4a18e49c331mr385515195e9.14.1792069608553;
        Thu, 15 Oct 2026 06:06:48 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9c001dsm67013005e9.12.2026.10.15.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:06:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support into a single schema
Date: Thu, 15 Oct 2026 16:06:27 +0300
Message-ID: <20261015130628.184279-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of codecs supported by the NVIDIA Tegra audio complex is
increasing, which leads to an increasing number of bindings with minimal
changes. The main differences between codecs are the compatible strings
and possible pin configurations. With the introduction of auxiliary
devices, a definitive description of possible pin configurations becomes
nearly impossible.

Remove all existing per-codec schemas and consolidate everything into a
single schema. Compatibles are grouped into common codecs followed by
unique codecs, all sorted alphabetically. Added examples for each of the
common codecs and for each Tegra generation except Tegra114.

Schema check passes for all in-kernel Tegra device trees.

Svyatoslav Ryhel (1):
  ASoC: dt-bindings: nvidia,tegra-audio: Consolidate all codec support
    into a single schema

 .../sound/nvidia,tegra-audio-alc5632.yaml     |  74 ------
 .../sound/nvidia,tegra-audio-common.yaml      |  92 -------
 .../sound/nvidia,tegra-audio-complex.yaml     | 235 ++++++++++++++++++
 .../sound/nvidia,tegra-audio-cpcap.yaml       |  90 -------
 .../sound/nvidia,tegra-audio-max9808x.yaml    |  95 -------
 .../sound/nvidia,tegra-audio-max98090.yaml    |  97 --------
 .../sound/nvidia,tegra-audio-rt5631.yaml      |  85 -------
 .../sound/nvidia,tegra-audio-rt5640.yaml      |  84 -------
 .../sound/nvidia,tegra-audio-rt5677.yaml      | 100 --------
 .../sound/nvidia,tegra-audio-sgtl5000.yaml    |  67 -----
 .../sound/nvidia,tegra-audio-trimslice.yaml   |  33 ---
 .../sound/nvidia,tegra-audio-wm8753.yaml      |  79 ------
 .../sound/nvidia,tegra-audio-wm8903.yaml      |  93 -------
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 -------
 .../sound/nvidia,tegra-audio-wm8994.yaml      | 110 --------
 .../sound/nvidia,tegra-audio-wm9712.yaml      |  76 ------
 16 files changed, 235 insertions(+), 1263 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-common.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-complex.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml

-- 
2.53.0

