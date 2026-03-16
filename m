Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0F4C6D;
	Mon, 16 Mar 2026 18:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685395; cv=none; b=Sgu0eyrYnowfLYnkC6NwlO9qT8UsXvOl98xDgp8BoZvn9FZbBO5JPYwWvej93ExIl1tNcdgeqFAkGboMoppaZ1gs1opcSEi8GQnWOcTGGM+1B1JWAFajtl3oQV9YkipUrN/Cr99dexFiRr6YoALujwZWKGDY5Onj7GAdOQMg30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685395; c=relaxed/simple;
	bh=4vzW5cO1monjXx7rKE1CqJpQtcAhGeYb0mKqTMLQsVs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ta3erRcF9XmtgBNrcZ5QMvU+Fv/hVtNUCdZxKIKqSD2NMctP1KF65MIK+GBY6rJCoGy10/VGBvDtGxh/ldyeSZlUzLzDqUB57vT8dePTApckJCAUfSiiNMarQ3gNCcpjeb9isyT/73sRQoa/yB/U5S2Y/Ty6QtV4ahyjPysuLsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=hLsOclL9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hLsOclL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773685391;
	bh=4vzW5cO1monjXx7rKE1CqJpQtcAhGeYb0mKqTMLQsVs=;
	h=From:Subject:Date:To:Cc:From;
	b=hLsOclL9Kotj2+9tsAvSHPsDYbYMfwRAatpSkkdtTKJsRyTifgVPR4AtI/kYPmYc1
	 4w+0HUed8M7dUi3yNrc5dneOF94ML3pKlv3cYCHp06sNIKPCCMBcJTZIyhoA4q0Cor
	 wtSd9Yd46ogPsdmwA8vXt64Z1R8yHJit009j3t/kVrEjEVMCiJWEIohxqqraT4eZPB
	 2DpA5Ga+2wgHI6/TF00pounWMG0nxV8/EjG3W4XvmAeoqHeeaxUXJkadbiIc87bSot
	 vVK24WvXxtBHJamr7ibLbZnPLQUp18W3yLR7mRuFdlk587A3JhOKaEqWVkDAdq/T4d
	 +lVvfxjtRezww==
Received: from jupiter.universe (dyndsl-091-248-189-119.ewe-ip-backbone.de [91.248.189.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5DAF417E12FE;
	Mon, 16 Mar 2026 19:23:11 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1052548002A; Mon, 16 Mar 2026 19:23:11 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 0/2] Add SPDIF support to RK3576
Date: Mon, 16 Mar 2026 19:22:59 +0100
Message-Id: <20260316-rk3576-spdif-v1-0-acb75088b560@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAINKuGkC/x3MTQqAIBBA4avIrBP8QYWuEi0yxxoCE4UIxLsnL
 b/Few0qFsIKM2tQ8KFKdxqQE4P93NKBnMIwKKGs0NLycmnjLK85UOROSBeVRx+NhZHkgpHef7e
 svX9tXJT8XgAAAA==
X-Change-ID: 20260316-rk3576-spdif-7017f2bebf56
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=793;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=4vzW5cO1monjXx7rKE1CqJpQtcAhGeYb0mKqTMLQsVs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm4So4kdnYef2v0s5Tu+G5da5SevoXpWwgJD
 nIK2VzpVpa84okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpuEqOAAoJENju1/PI
 O/qa8sAP/3hnTRRSnb8Rr7H6KFJxz5XrSNAmsdgmlqmrn3FXgQYEln3nnSLeA0LsX1gEcjey/PC
 5lCgLIudcwfMmH76FzVgPe8kvSX1zzMZTVx5O8+5oyStX3XTlztEkG2vul2iPqSvoI7h5xsK0iI
 s9z3El4l2VSGH7cFH47Vv3eY462DpYYMHLjom1kGFO1ablTsKpupIid+5nI3bPf8jQAS9hXhhic
 F7N1PpQj4/XRoyz773/k4VV1T9LqVZE4Q2d4npleXe5s2rnR4kE7I3xbAK2QOvbIPd+qXrkKMCW
 l0jU1yP32jp1DiZvSXjG8N42yVBhP5TSXzjdaAxuUCPhTNBvlT8gR5Mtce53bNW1zRNbu57zwIA
 S1qRvnsoujkbwGd0zeImOFYkRzschlvEJBlqzr6L3gc6udxb58zx/z6HBOqW6sIoIR0i9uVxWGd
 NSaJ7O6GnLnuGawZNYT5LZnbdkplsGTzNLZ+4fUcu+4ggSs4qibe3m+9D5bBt4YfZdrRbpNjra/
 z08MqWGvxQSkTXds0/9IaW/dxF+/ysV6lWSMvU6C0ADTtJNKV85DDwwKqXZY8PvCvN+aC6c5maw
 B0xftWteLe+smr7rGOj0tIWo5LORCqTDBRwhzJf4Sfa3I/wAjhkaX4qlPwtK2M+S8L4yQQqrxFZ
 w5snIHz8dcGYpfFCwmPc3zA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add SPDIF support on RK3576 in preparation for Displayport audio
support. My expectation is that Mark picks up the DT binding via
his audio tree and Heiko picks up the DTS via the Rockchip tree.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (2):
      dt-bindings: ASoC: rockchip: Add compatible for RK3576 SPDIF
      arm64: dts: rockchip: Add SPDIF nodes to RK3576 device tree

 .../devicetree/bindings/sound/rockchip-spdif.yaml  |  1 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 82 ++++++++++++++++++++++
 2 files changed, 83 insertions(+)
---
base-commit: 74b04802e23d970099c522b711b0d94e9a29dd74
change-id: 20260316-rk3576-spdif-7017f2bebf56

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

