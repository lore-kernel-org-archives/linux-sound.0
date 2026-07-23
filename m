Received: from mail-m19731103.qiye.163.com (mail-m19731103.qiye.163.com [220.197.31.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF23F1678;
	Thu, 23 Jul 2026 07:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793603; cv=none; b=X3OmopiGrnb6zuOAmoCThqyFjRNJE5VraY3a79iltqqcuYXR54zNLUpzF1k0v0A1UqWx3RWDJTU51OHKU9w9zr5kkBUyVfELVPG6C7lQujtUyUf6Eginwuk2QH3XEMKQ++fR5ouj/d8lsMpGgxAdhuqbbhG50eVmavNZBTqfvS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793603; c=relaxed/simple;
	bh=W7fzSgQwlJA5o9kwdWYuGvp88AVfd9IYKMBtaUePYhk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jjXpQlR9DPefizBDBBSYTCi2HiuHfMfNzi0zkSNdG9LaUGMtz2lFAQ+TCP199aF5myrH/ypT9qbvSV9hxqynkoe7kBEHYjAWmAzsn8nX1qtoKOy3uoz3FAoh5LxpTWVbrmYzxgIT6uk0eYj5kdZK1dxzqcceSmRuO0m61M4s6Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=QTjiPPu/; arc=none smtp.client-ip=220.197.31.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="QTjiPPu/"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 474a1d1c0;
	Thu, 23 Jul 2026 15:54:37 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH 0/2] ASoC: es8316: Add regulator support
Date: Thu, 23 Jul 2026 15:54:28 +0800
Message-Id: <20260723-es8316-regulator-next-20260722-v1-0-721f757879a0@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTIYWoC/y2NQQqDMBAAvyJ77kKMJVq/UjzE7qoLJcpGRZD83
 SAeh4GZEyKrcIS2OEF5lyhzyFC+CvhNPoyMQpnBGutMbSvk2FSlQ+Vx+/t1Vgx8rPhoizV9XO9
 poDd5yJFFeZDjHny7lC6qsAnAcAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784793277; l=1396;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=W7fzSgQwlJA5o9kwdWYuGvp88AVfd9IYKMBtaUePYhk=;
 b=+8f5oKXLvUiQWNZCoQILSjSqL3+/EQuJbwn5oB60DT++hP/2s0lPWAHKtLvq6PHKaazZAhoCX
 1k+DS8MFJryBr6bZIOmWAh3sXTIKT3i0J3NR19RRguRHcposO+hFaBS
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f8df824f609d5kunmc0741ac25143e3
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGExPVkxKSR5DGExKHU1PSlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=QTjiPPu/EvRT/8v7LqTbThwQABjyE/mvVDaPjboujOsGvS4q3rUB6sprk0SqCyK+5wmKoMIah9n4l6av/wU4fn8gcNvi+0zCmQlRByXcBfzUXlB68e7kq/yEnFO2kGHo5OQHYWph1YWAkT34c3Utn8JgJw1wUoZNUm/qCWqJki8=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=VBSbDykjNHOmBlXEJx/lTvZqaeEf/DE7qMTQxXoOgV4=;
	h=date:mime-version:subject:message-id:from;

Add regulator support for the four ES8316 power domains so
board descriptions can model and control the codec supplies.

The binding patch documents AVDD, CPVDD, DVDD and PVDD as optional
supplies to preserve compatibility with existing device-tree descriptions.
The driver patch requests and enables them before clocking or accessing the
codec, and unwinds them on failure and removal.

The supplies remain enabled over system suspend because the existing
suspend and resume callbacks do not handle a complete power loss.
Powering the codec down would require separate reset and
reinitialization support.

The missing supply model was identified while reviewing the RubikPi 3
audio support:
https://lore.kernel.org/linux-arm-msm/c293d9c7-bdb7-4303-80c8-404228c434d7@oss.qualcomm.com/

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Hongyang Zhao (2):
      ASoC: dt-bindings: es8316: Add regulator supplies
      ASoC: codecs: es8316: Add regulator support

 .../devicetree/bindings/sound/everest,es8316.yaml  | 16 ++++++++++
 sound/soc/codecs/es8316.c                          | 35 ++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260723-es8316-regulator-next-20260722-7d96badfd4da

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

