Received: from mail-m3278.qiye.163.com (mail-m3278.qiye.163.com [220.197.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1256E40DB2F;
	Wed, 12 Aug 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527672; cv=none; b=dBZgGYkS+sPQ3AeaSqe0QlPnxkRudHPyecxBTW6E3VQsnO9aGJSq63bvUSOyz9eZ9b+4f1XZ+r5Ml8NTOUXM/EuFSrlHdOZvb8SPxMVC+5NSzcagZTHMjFqNfVkttVdAkyMQp9S9HmJwU7aEbE5NQ1oqKaz2sXpQ3sKYTZI04Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527672; c=relaxed/simple;
	bh=ANpKazoN+8nvrSPLK334AoZbSAc686t3GUsWybh8xv8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d0VKoz6Gohjy0WjMFRXZpuCXfVZapa6R8h6hxEnds+Lxz7Hn7gl8f8RFto/afb5H/7mXXWXO1qprtzVCVV5Vw5tUNPeyOmrQ5NWL7CLo7CwnN5YeuSd6FFxOad75yeEfaLUdZxmL+PfYiITFwRLHheAFAyAVEDNSV/WjiRP1oig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=cOLmdV1Q; arc=none smtp.client-ip=220.197.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="cOLmdV1Q"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49b6d9f1a;
	Wed, 12 Aug 2026 17:35:51 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v2 0/2] ASoC: es8316: Add regulator support
Date: Wed, 12 Aug 2026 17:35:42 +0800
Message-Id: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4+fGoC/42NQQ7CIBREr9L8td8A1dK68h6mCyyflkTBAG1qG
 u4uNh7A5ZvJvNkgUrAU4VJtEGix0XpXQBwqGCblRkKrC4NgomFS1EixrXmDgcb5oZIP6GhN+Ks
 FSt01d6WNPmkFRfIKZOy6H9z6wpONZfTe/xb+Tf9WLxwZSsGNPMtWdopd0zQ7TSF6k46Df0Kfc
 /4AV2dkbNIAAAA=
X-Change-ID: 20260723-es8316-regulator-next-20260722-7d96badfd4da
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527351; l=1485;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=ANpKazoN+8nvrSPLK334AoZbSAc686t3GUsWybh8xv8=;
 b=gGKT5XP2g92s2FyEI/I6p3rrkD0n3GM7FuA7H/79N5GnwPec+P/pdfV9rstW1tpbH67t0iyyv
 223bZsKjcHaC4J543nUoMgecnnOl+FQ+bltHHpxLzVT94FpwbwOkAtL
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ff55403dd09d5kunm921ee5013c51bc
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEoaVk0fQ0JMHk4aHU1OTVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=cOLmdV1QVHgmJRILub78rRxcD9SZVT0WVOOqTtPj2DOIxZ6ED4cV4KtjI3rPdoSICNEcmWM3jNekaqZ+zbbzfIavPqWU7oHL1w0vtGMsMN26egC3rzIAagCnyAz1LE6YIr9BpisBd6MSyeoZLrYQdzd8uPSIWRYAGM71/cjpMH4=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=vB+jIaNzdwubakopczPUmYouqHv9G4VbNotIiC1QFWw=;
	h=date:mime-version:subject:message-id:from;

Add regulator support for the four ES8316 power domains so board
descriptions can model and control the codec supplies.

The binding patch documents AVDD, CPVDD, DVDD and PVDD as optional
supplies for ES8316, preserving compatibility with existing device-tree
descriptions. The driver patch enables the supplies before initializing
the regmap and keeps them enabled for the lifetime of the I2C device.

The missing supply model was identified while reviewing the RubikPi 3
audio support:
https://lore.kernel.org/linux-arm-msm/c293d9c7-bdb7-4303-80c8-404228c434d7@oss.qualcomm.com/

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Changes in v2:
- Restrict the supply properties to the ES8316 compatible.
- Enable the regulators before regmap initialization and keep them enabled
  for the lifetime of the I2C device.
- Link to v1: https://lore.kernel.org/r/20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com

---
Hongyang Zhao (2):
      ASoC: dt-bindings: es8316: Add regulator supplies
      ASoC: codecs: es8316: Add regulator support

 .../devicetree/bindings/sound/everest,es8316.yaml  | 27 ++++++++++++++++++++++
 sound/soc/codecs/es8316.c                          | 13 +++++++++++
 2 files changed, 40 insertions(+)
---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20260723-es8316-regulator-next-20260722-7d96badfd4da

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

