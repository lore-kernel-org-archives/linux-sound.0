Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DCF496D51
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916361; cv=none; b=ODrJFsH+FtZMR6BzrqeqXBFeWL0QPHgMg0BgBKLjrXqqHub/yxmTtJcWFsgBSGg7ybfUQyYXgYEH5Cqo1tadIYpgUQlVRU1RMKARHOAvkeSGOLMpndrTl11UomS7j7q5B7vDb8NVuM+wqPgMRgcoX+He0MC1oaN238Z4TVqDef4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916361; c=relaxed/simple;
	bh=coCkx+On/PYyms59yzcyUxSZaTFniVRkfGkf4kFQfdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IRb7tpLMKHtie5ZVazbKATRXwyB8vuQ0GJd4NgN/ieCh0R7w8BT7fdNVWHx8dfKxFEvAIK1t6qhL9RZm561zQhjwImYSqX9+Bo/yCnAwW2/py7pGeIX8Rsypyd9ZpTBbhiw3wiQ6FjqLTnkxp9owHv6Vpfz9jwT1KPXEUYC4qKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flswW5Xp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flswW5Xp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so1886085e9.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791916357; x=1792521157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6xu/m6gLmnhmuK37G0mkWpbfD0iKHbUJbBWVpw5Q+Q=;
        b=flswW5XpxZC/2Q8jDTyXpWt9BiMv+mvr5R/28HN004YKnIFZjdaWyhvcKlObT3dKSL
         HIZ3v+IZTgwDdIDtBRAwgSiiJIYDKsJcczvBZokR8gORGxRdRHKDJYxKD47lSICJXJBk
         d+ryhQwA3gdu/Tejk/DW5RVdoGWc2l2XGxLn273PRsf/oR1Fl42AfGFPw/JBKMYjpx29
         uP5gbm3g9IhOn5/f+UBaNvZzk+LxAaOaSgbWrCIWgXWuaNPB6QauZIaP0b9I61IoR1pp
         WnwlvajSk4wUo5jOlEOT6LwHh6s4XekGwmDNwgXYyRM4ud4SPSr5evnG1VMiX4bMMNIx
         K/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791916357; x=1792521157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6xu/m6gLmnhmuK37G0mkWpbfD0iKHbUJbBWVpw5Q+Q=;
        b=Isr1jLvhWyja03/1h/pwoG7CeWONSczFJF9fMafoxPlhrW/EEvpFfmDeyDw8Qagect
         mqopMP8jdbPJYP3xRYJARDEAdRJXA1opAvz48MbDv19pqD4KiAbe9nSUOqJQqz8ELLX+
         kHkosgKhTEtM4lfbSnz08K1R69Nk4Bsw8q4elmqm+6jB6dIJeYjq3FIx4NGUDSXCiqMz
         2q1BgP8wpcUEnLdV0YVqfbEUy2EUhNTU9jvlYx07d9vvguq7Fbs/7OPyLD0yZi1sFQYz
         ikYMsTL/ALmqgvm/o+/t/PuRC+hbU0JMRhtQs86xJ/UbNj3F0jp9/F1WZeWfouLg1/B1
         5pPg==
X-Gm-Message-State: AFq9FYIcL9Bjm8EKsD4bkGslxTl3bqNn7DkDeIXPFpNUuDtIqKicIDMZ
	VRnQdu99WBhtJqgaMF+X++5kskYTIAKXZz3JGlUa50PxjBG7Vu/OTOo4
X-Gm-Gg: AYBFou2QQ96iLlJvQ9XAwI/fxczXf/cJm2Q5GBGFir1BgsS4upFGhbCMIG5/iIRo/vQ
	YEBxpwhT3rcFARh44fuQoc+zquaeNDD+ko7G7iudAol5CWV/KuMpuvkqjdgV/e4KWrn+gX93NpI
	sW7TTz8kIYOPOpMZm4iHoGRmkgzCQMDmwePF3ojkdtNKpN81saj5XZjkFIZnncslG8iykm89hmS
	UF7353SR6sKqnIeojThhYCk9nDwerWi5YL3KYsolG6TvzblBszyG8DGnmswZ0bd9UyljQ1lQTbc
	7DaAtSZgcKGyNLCe2ZpSPTFfOIRBsM58MbaqlQqJ3iRDO60XoszvZoPQCF+fXRci7bxsvthPEet
	2+oa3WbUx+Y9J4nhQgVWocfTfrQRyM2sQmcwFl8W7Z+8YiZKV8P5UDFSouAYlrkNGXT7HbvtxfJ
	66sF1oGG6ewjIzpc+outNuhKD7GIsWl51zkkYHLTdgI9/OwgYpsoaStBlQrWFmbFOUPV3RsXM+m
	m2m+Bt7B+QRFH5TRAM=
X-Received: by 2002:a05:600c:6289:b0:4a1:a475:d885 with SMTP id 5b1f17b1804b1-4a1a475d8acmr98966005e9.34.1791916356633;
        Tue, 13 Oct 2026 11:32:36 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm548921305e9.9.2026.10.13.11.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:32:36 -0700 (PDT)
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
Subject: [PATCH v1 0/2] ASoC: tegra: Support WM8994 by machine driver
Date: Tue, 13 Oct 2026 21:32:24 +0300
Message-ID: <20261013183226.513658-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (2):
  ASoC: dt-bindings: nvidia,tegra-audio: document WM8994 CODEC
  ASoC: tegra: Support WM8994 by machine driver

 .../sound/nvidia,tegra-audio-wm8994.yaml      | 109 +++++++++++
 sound/soc/tegra/Kconfig                       |  10 ++
 sound/soc/tegra/Makefile                      |   2 +
 sound/soc/tegra/tegra_wm8994.c                | 169 ++++++++++++++++++
 4 files changed, 290 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8994.yaml
 create mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

