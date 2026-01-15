Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C9739A81F;
	Thu, 15 Jan 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481824; cv=none; b=Igsd2EhM8pqNUItGophg5fmWeYO2ZjBnS7X0FK+++Fi9Dj3X6gXGUN9FW827tCEVIf+1YdfFYnCgqjIOrKAXRb3ASRHinaQNkmtlTiWvFrCWfui2hmBL8CX5bAHSGxzthhLzFv9o1F2sX5jpt2vxBjBvAYq5Vt7IdU5YxCGAVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481824; c=relaxed/simple;
	bh=5c73jSB5V916CT35L36ZsmgrVWA8Vvvy6jaycwwPDQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8e3sJXEV9mn1MJgAeMkTA1tkfvXANEl+GUEJJ/EcgEEZlL/0w3JgToVAXywr79fZZ2xrXRuxoiThsulqxvcfxTOkXywuo6YR3UVYA6pyT745PUWqpIi5vmwMU+ZQOEDWpO6QIXYdkM9UI533Mvuf2av5qbcjbkhTFUjvl1LbyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JZhEIDgY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JZhEIDgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481811;
	bh=5c73jSB5V916CT35L36ZsmgrVWA8Vvvy6jaycwwPDQU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JZhEIDgYj+2dJ+8Z6AaGGwdgiGAncfG9P2Xmzf5svHPgghSEuJPkGFH5elw7IlPsj
	 muU/qnYPTm4Hh9mdj6J5OusJyq+W8ijj5/WNgbfV+CTzzB+fjkO64H9KXrzF5JzTg/
	 fpnGdYyLvrueNp+46fsxBduHSQZkhR1S+hyNJtVJgB5cJRgVNKTrmkA+1ZlsOijZqp
	 nF5am7vlnuY+ILx/dm+m30Aw7bvKHYviokJMaX+yPUHawgBsrMi6ZeALFR9TbzU7Bn
	 BqVjexWJ+YSP6x2TRA+Je5x7CTpjGJgc+FW2PfR5PPGyTnpnQqhR62DVRmPj2iz6TK
	 XPNoA6ClZoR5w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9907A17E1406;
	Thu, 15 Jan 2026 13:56:50 +0100 (CET)
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
Subject: [PATCH 4/4] arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to audio-controller
Date: Thu, 15 Jan 2026 13:56:24 +0100
Message-ID: <20260115125624.73598-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device tree nodes should have generic names, and this one doesn't.
Rename the mt8192-afe-pcm subnode of audsys to `audio-controller`.

This commit brings no functional changes, but resolves dtbs_check
warnings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 47dea10dd3b8..9f8f115edd4c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -973,7 +973,7 @@ audsys: syscon@11210000 {
 			reg = <0 0x11210000 0 0x2000>;
 			#clock-cells = <1>;
 
-			afe: mt8192-afe-pcm {
+			afe: audio-controller {
 				compatible = "mediatek,mt8192-audio";
 				interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
 				resets = <&watchdog 17>;
-- 
2.52.0

