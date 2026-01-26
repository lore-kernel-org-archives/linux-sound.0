Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E48318ED2
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439391; cv=none; b=Y7Iq2RjAPE7LMWXoSMm8b38hRp4XcfLPycKrDSbClAWW5wWFyGA/Lrv8pYNayY1xG5VePaZ1dU1xpG9aBQNUJFgvlZcf33YsdlXG6NjxhqCTXSbi5KwFhL0EsKwZOEi+N7Kk9rOwqXHppOfSUIlB0lMI+onpH2uD1Y3KvWtIG9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439391; c=relaxed/simple;
	bh=04Q1GPam45voSeBnPGR/U1/CMfY6oCgIxm079aOElp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=da6cZzYzG/zucNlCQudLN6YyFVoSTXuN08EzPVQbYpNOiNktX8LlGhQLobzilc+jzbd5xOgLjxmFZGD2odT2gTz8SF3Rkfcg8UtUsR+TZksj29p+ZE4fL51Nnr5e8HYx4LoOT2jnKy9z3bVxkEaHZt59duxL6/C00x7aGSSZ05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcYFLmDe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcYFLmDe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4801ea9bafdso18510275e9.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 06:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439388; x=1770044188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=knPUlB2owHnkNVv4SE4pV1/cSooTAZY2IewxcUnkdP4=;
        b=PcYFLmDeBgknWehgg2W9xFlsbgCqIQ5bW6a1TUFtRqkjNy25QjU4Yy9JDxug4+R3c7
         YmpOE/e9k7fEhJdSX3yuBJGy/T2Yqjz4WD21umaFLX9LRkaxKjpQ6Fi6ZEnyYHg1nThF
         DrZs6fXNh2pv43S1OXY5oCpMsXHm5iBhMjlUxT+176TYQ5cwhf7g5SJ7K5bkhPIfZO7Y
         I4vrhF8qosb7gUekf/xpGSI9vRCoQORw8t2wlbi1ziYwV/Vi61sHCUYWqdnUvnOj9c1h
         HKRqjAFJ35gdbBCsEkK+parD0yDragYaPawUs5l04AJRkr3e7QVRsLAFITQkSi1hc5hu
         p0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439388; x=1770044188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knPUlB2owHnkNVv4SE4pV1/cSooTAZY2IewxcUnkdP4=;
        b=KIr8LxBIVCENIXl0m8e2Q6veLXBeSX6ZExLULWxWBaWM0eytgLPumdJCv5DY6zQH94
         EMERlIVH4j6CYXrPVeTM699Zz8x9gRyLzHeGPdup4AkZUmFe4+pwqZrAvsFd2UcIXMP5
         ihrl97vMO3G5i7sgeJaQ8xmm0MysdVXrGzh7nUVW4KnHmC1bi+s4uc5uM27CtXZOopnC
         RSGi0XXjkWI+sFFxsXUe/xaFZhmrpjWx38qo6xeMKt23THM5HSWCl6Cl5R0Lqky7wvHw
         4PTXpJ2f3BQkBbEks3qFP/1e4Asrk65QthKoMYPpS56b0K4Dmmy/Ph5UPyfECIvV6I1W
         C7pQ==
X-Gm-Message-State: AOJu0Yz1PCAioMdHF2uq7izFr7z8QSeZiGJFh8vehZluiozq03ivP7M8
	wxXkM71oD5QpKGam1mtftCbyVkNtLkdFj0En0g1OD550u7/NW/JlSknV
X-Gm-Gg: AZuq6aJ1ZdFBV+1NZWESA5PMJmrxbjXt8nDALxu2umYay01yOlHsCmjyQl4rLbm9CBk
	zvyDmtlViXD6NVZVRX7HWaBGQMKtsN3j2PDQNntLN9/T0eaV8ZmEHh4/7ww2VAfX5GjtrJQmJiQ
	vzyECk1u93DtFr61SBK5RBRObRn241dr3Y7lLORpmGtwmD93p/HlOhqzrcDZCTz7D+jez98Nei7
	rVc/fcW002AQ3vnmZdxzsjAWUSSxrPOXkgy4PUpdIKFrCr2n4CkOA6PoA/kDelj2yY19BnbBwHB
	xRBGGzFk4KEo8fmYNBFjpXJWV7o25GoD+R4/tIrQNcmAACqy6gwUTnz495JcKTS0RV+hnG0WZ/C
	ClgSZIHjMDDb2twXhpEli4wdLZztdA2Z7+bxmo8qNXJzggBvdb6PsPcQ+0fql7sXjBhuruTosos
	KN2UZuigCNE3mbtaepFnpCZSHi73xvXuNkJlnIEg==
X-Received: by 2002:a05:600c:674a:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-4805cf5e6admr76087785e9.23.1769439387866;
        Mon, 26 Jan 2026 06:56:27 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:27 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Mon, 26 Jan 2026 06:55:35 -0800
Message-ID: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.

---
Changes in v2:
- adjust binding commit message as suggested by Frank
- replace whitespaces with tabs in MQS pinctrl definition
- link to v1: https://lore.kernel.org/lkml/20260120150329.1486-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (2):
  ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
  arm64: dts: imx95-15x15-frdm: support AONMIX MQS

 .../devicetree/bindings/sound/fsl,mqs.yaml    | 12 ++-
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 3 files changed, 88 insertions(+), 2 deletions(-)

-- 
2.43.0

