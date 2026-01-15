Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A83A39A80C;
	Thu, 15 Jan 2026 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481816; cv=none; b=UeCFyPCx2AcWr70xxKlDm0fRNFhLBsUCEWAIqMqtq3lQ5OC6rgIPoBAAcVvnUsOpJir/yA+LGo7cbjaLIYPOx+Gm/SRDw55J1bOkc8OmiKCKGVp1FRLnSDEXsrPTRM51GerhzCQ8dRfNadSFuLoVjbNi0ubXNIyKo9NCGRNnRPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481816; c=relaxed/simple;
	bh=7B+xKo0mpKeN6a69BBeF6xLjGA21Jku6TgKwUt5s5vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLWM/owXbA6m+qtADqmXftOoNOh3G2EZxO+lNKzvRKZa42OLMer3eI+UuiQ2YzTJZ1jIg0b60C3gOU7FaDZIhuv3zg4ZAyf2opAHNXkfpFb5LG0fs0H+Ff3V7SR4kV5VNCt2Te0dfknR3ALIxMLT6tHsD8UeeVBqR0iQf7YqpqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NjuA6UjT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NjuA6UjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768481808;
	bh=7B+xKo0mpKeN6a69BBeF6xLjGA21Jku6TgKwUt5s5vM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NjuA6UjTaxtjEZyZleGy2pYld0mX3nAVYJKipbI9C8eFK9QaBICff4C7U0iup6/LY
	 NGu75uyWAGXttPXOSI00qm0PSS/RkKgR9I+19ETmT8bvOf17ThI3AIU+ViTUpilW9i
	 hy/az0plG3VYy+2R6hurcslIPIvntGbQbUor9Xo3EECYoNDMsjjR4/7xJ2tZW5R6Ew
	 bSDSGLxw5HiN04dP6lmlcYZeyfK16PFw9Nh5rXmyGNxocJ61CTUfp4TLXY1WxNXUj/
	 sD/Ld8aDIjMmS+YnYtW3D9Opfpo0+ySjCBTbPiqz6bMvlf2LJ6BwQ2VtlusxQXtZlp
	 C1h1ikWroYwOw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C3BC17E1274;
	Thu, 15 Jan 2026 13:56:47 +0100 (CET)
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
Subject: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
Date: Thu, 15 Jan 2026 13:56:21 +0100
Message-ID: <20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
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

Add Winbond W25Q32JWM, W25Q64JWM, W25Q128JWM, W25Q256JWM to the
allowed compatible strings pattern.

This also resolves a dtbs_check warning happening on all of the
MediaTek MT8192 Chromebooks devicetrees (for winbond,w25q64jwm).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 587af4968255..2db446c9ca9b 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -29,7 +29,7 @@ properties:
               (sst,)?sst26wf016b|\
               (sst,)?sst25wf(040b|080)|\
               winbond,w25x(80|32)|\
-              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
+              (winbond,)?w25q(16|32(w|dw)?|64(dw|jwm)?|80bl|128(fw|jwm)?|256(jwm)?))$"
           - const: jedec,spi-nor
       - items:
           - enum:
-- 
2.52.0

