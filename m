Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7218939B48B;
	Thu, 15 Jan 2026 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481815; cv=none; b=IDjC61mNWGoc1dcMo/zIVNA2qvZddr8xQy6uoxSyWdndK2gcUTtxKU589Gg4tKZEBjm+o47PKo4OfEXTNd+b3Pl8bHFJxw5cuIKS/9t4wcmptFnG0fEDipBs+AwipbJtUnNKuqUz+ywuyzhp33DDh3LLt4zMVGPx6rwj9+UaAuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481815; c=relaxed/simple;
	bh=UH8IuGzbgD8QTBsGnAZykl8j1Pi9KOGqjmoEuyKnReE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eCPmNRNrEusMJFlgHLGrj1EKbE9r+oQJ5AxUR9e275c4A1eiRH1dyliECx/XBmEAAfxPsClxzlGFX4r6gYhfnsUYLBQEnWGoaU/XvsMJpfM9rSWh0oop19KrXfdt+MxKNnso9OnnA+REOOwrnDGwtGqkXfQHQsC+5TtAib7SXzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o3dG3frE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o3dG3frE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481807;
	bh=UH8IuGzbgD8QTBsGnAZykl8j1Pi9KOGqjmoEuyKnReE=;
	h=From:To:Cc:Subject:Date:From;
	b=o3dG3frEXbPd205WYwjNqsYefKsvbeuLxozB5N5zKMKkHAelvLw82tNeMzFO3ae8X
	 dFDkrLNjLwMN3ynhAhQM/S+mSetv9/nyC6K/b+lPdnE5STUAm0gU/xtIYdwrLMaQ19
	 ZtZqIj+viUx8pl2YswGsLPRTYgyBftALG7fPdQMTKb8wixVEDhaJGLHkpII7F3nzKC
	 aXxgyqLP7vv/Yx9zgvEjgZm7L/566Q6v33tuVM7y5Syj/tDiDqFXLEyiyLXdrs5RVb
	 cF/kAjtfHrGqCcyl/RAvLbyyjtDFQPe/Qy34+yYS42x7tGfJDQDWsv4+dab9fMtgSH
	 W2zRbI/yATWMA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62C1E17E10F8;
	Thu, 15 Jan 2026 13:56:46 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	julien.massot@collabora.com,
	eugen.hristev@linaro.org,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/4] MediaTek MT8192 dtbs_check fixes
Date: Thu, 15 Jan 2026 13:56:20 +0100
Message-ID: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses most of the MediaTek MT8192 dtbs_check warnings
by adding a missing SPI NOR flash compatible string and fixing both
the audsys binding and devicetree node name.

AngeloGioacchino Del Regno (4):
  dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
  ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
  dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
  arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to
    audio-controller

 .../arm/mediatek/mediatek,audsys.yaml         |  46 +++--
 .../bindings/mtd/jedec,spi-nor.yaml           |   2 +-
 .../bindings/sound/mt8192-afe-pcm.yaml        | 176 ++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   2 +-
 4 files changed, 197 insertions(+), 29 deletions(-)

-- 
2.52.0

