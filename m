Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E63B8BA5
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770399278; cv=none; b=ItGQ+VYTNwlu0TgbPXn+Gu3DvS7dXWAQrYyytl5UqMcaz7EHv0kNPFm0x3KqIJCq6PiaBVwf8Qfw4qA03O/InPET/Pe3mSoxCBBYQy6IaVaG+fNK0zQf7YHxZbHLsq+bEze/iMJA+O/L4juOck9xES+utAU/qBJBzzSCJ5wkSs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770399278; c=relaxed/simple;
	bh=bMEvoZ3YmzKwhD0+i0HI3Rbo7G9luQ7yinQw97aXDYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UgPe5WE2Gf16CUIFaLL/lzitIYCgKJa+cFahuimPeg6vN1+0yATK4WNSWM19BeHisWjCMa7Htye3LnXoFoa830jhqNyRgoZJwaepkJ7YZFylzWwcLk09dnarXlKna71SxOsm3If6yog7Lbf5eyclFsNo5RtkPw6EKHgwJljRim4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsyPFx2W; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsyPFx2W"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436234ef0f0so1284468f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770399277; x=1771004077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/eXKWQ3nkCuVv9yvoGqXiUiEc5FnE49Hs9X00Cu0mk=;
        b=MsyPFx2WibQYb+f+yb8NdJHbaQY39uS5Rfk/h+0xzoTH2RXem4glozwuQNC3YKG6R/
         8siBCvFP3G5JGoyXoF5VPlw3ZQNvYV1ya4lF3Mg38BtHacT25K8ihfvcZ2HWWjakNzNP
         y4Rm5Vu8RGhnC3fNRzB36rlAFLvbJHL7LwbsPlOZDlcfhY/THLLtG01iM5KgcCcPrFJh
         R8F5TBtxXwUVE7D3VtFTWZR9SUayfpuS1ZmjpUJQ1iMhTZIPJh6EEZpVxwGRkdbeC/e2
         nfLzr8RF5/vfwMxpCXLjkbpl2T7uoLDiflgNNz3tCcPIXibZoeaxydh3RRT2mxCdqn7I
         8Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770399277; x=1771004077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/eXKWQ3nkCuVv9yvoGqXiUiEc5FnE49Hs9X00Cu0mk=;
        b=QmkKI+VXoe4IS7ppNcPcfyIxgk+ImTCcs6qhZB1nBNw9T4NYrdYYuYZcddpT4HRjHA
         BK6O0f+i9RUytIEji/HSD1znIDWwdlweJ3eptVkF+heUlwSn1InDrQe9ZiQbP9iLd/zj
         uPw8b/ZgkmhOAXfUtqImh8OPwtByYVcC3ZUXbwdBSrc7n42IMMRAjlZ6Yvrzo0LuamlZ
         MBWMlzBF0Mj5DLBeY32fPq2vEEpOARukjzJlMD6rhGhbSY7rPPNLXjulR/pV0oSEAEvP
         AaBsq55W3iMj0EpB89fMpXPDSm0+kS5/U2fzAQ1U5jN4w0YPkty3QygxI56jW/6HAdkK
         ZgQw==
X-Gm-Message-State: AOJu0Ywmeeut9qVrky65fFnJprHVpyWy0ssC1mK0AJ0OwiopsedLdEA8
	iF3XXj6XXhuIn5eSiyZ8QJ5NvO+iOgv2gyPqCVLQNnxOfSzclxlDD1Nq
X-Gm-Gg: AZuq6aKuDc5IfMGimQzpb6ggYEovvrpIi4JsMxGNiFa6rDTNJdK6QuFWDNO49kUUiog
	YR0rvL6HqyNxn6HNHKcaeTsFCVN6onCA+kvNVvN2pGdD1CLG7fW738GR5IHskqenyM82oQqt+Zl
	O1G/G7vi0vNNt8x0w6JOiZEE6sHLc7KR6WcpNB+GsdRfOgfiJPIXe1z+idLyOdjFl7YFxT/s/gE
	S3TgupPWc2FyUOs+Ta5Y1puGfw8InuY8M9eB0VGFPzmBvyUt/ju9jkSFvbZ+c25PFXzhKL7yDeu
	idvO3le8MoeWiizGDMmo9F/nofSOkOSdRCPqKxGujUgbkGwygu8FGvKOud36Ag1GoOZbY6OqxLp
	4xpI0EL85ls+k+54NI8P4NSUDOEA+7i0zDEorZ39ZlyN1z0JAsMrGkeUUAA5dPAlDctbcYVt7qT
	HQ
X-Received: by 2002:a5d:64c4:0:b0:432:a9d9:b674 with SMTP id ffacd0b85a97d-4362969518bmr5089891f8f.63.1770399276985;
        Fri, 06 Feb 2026 09:34:36 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4a1sm7454523f8f.17.2026.02.06.09.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 09:34:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] ASoC: tegra: Add support for WM8962 and CPCAP codecs
Date: Fri,  6 Feb 2026 19:34:17 +0200
Message-ID: <20260206173423.145954-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for WM8962 and CPCAP codecs found in various Tegra devices.

---
Changes in v2:
- fixed Kconfig dependencies
- added schema adjustments for max9808x
---

Jonas Schwöbel (1):
  ASoC: tegra: Support WM8962 by machine driver

Svyatoslav Ryhel (4):
  ASoC: dt-bindings: nvidia,tegra-audio: document CPCAP CODEC
  ASoC: tegra: Support CPCAP by machine driver
  ASoC: dt-bindings: nvidia,tegra-audio: document WM8962 CODEC
  ASoC: dt-bindings: nvidia,tegra-audio-max9808x: document additional
    board pins

 .../sound/nvidia,tegra-audio-cpcap.yaml       |  90 ++++++++++
 .../sound/nvidia,tegra-audio-max9808x.yaml    |   5 +
 .../sound/nvidia,tegra-audio-wm8962.yaml      |  88 ++++++++++
 sound/soc/tegra/Kconfig                       |  19 ++
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_asoc_machine.c          |  52 ++++++
 sound/soc/tegra/tegra_wm8962.c                | 165 ++++++++++++++++++
 7 files changed, 421 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-cpcap.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8962.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8962.c

-- 
2.51.0

