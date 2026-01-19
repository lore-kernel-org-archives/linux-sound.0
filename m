Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D9B3019D9;
	Mon, 19 Jan 2026 11:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821972; cv=none; b=t5YF2w6D5ljLKPNeZZMKIXA8M3NNkR/Shfhp05Rp4OXPh7uB9MXb54VfHbVfOi34SGFcUzoWnSEEr9XjAwE5yRB3AATjr/GNsBZ5fF/PFxr4FSyUZ3oTZqlzDbIMhkd/9VOKMzGKJBnQ6kijIevJ9AV59VyZ+Ge6ICVl91/sjHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821972; c=relaxed/simple;
	bh=9xXr2PPFCbMYAU/BCfJhTb7zo31zXr8jOcsm9o5sKxo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QuZPVw8EMS92RMAtA4ceRHMxmZsPBW3no8sQQ5cUyRKwvNrzqhsChsQmcwYsNm8Uf/voJX644NOceiSct+F8a7PltjcMuJ17502Rg51dyLowcjVEOvYPHP+dL6VSXkhBSBU97tRCIb+Br36ZJXnYJ8XLVGyZWfGFFkVNJpydu4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b68qylH5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b68qylH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768821969;
	bh=9xXr2PPFCbMYAU/BCfJhTb7zo31zXr8jOcsm9o5sKxo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b68qylH5vYrHcYmu7kZWSePqZ4NRlzquFL65A1+lZ1jhUxXyiFEB6n4X/L15R7W6U
	 GGB6Rxn0iF6qitYrxB2ZROwW4n/OK6/4xRXgK4ed/iqEIy8GgKLbp2FDjbCOvH+WVc
	 B313y6B4FaM83UAlEd1EG10pnHev4fPaeeecvtyQnRFc2rJY7p+HlGT5eGfgaeEbie
	 u/eGzD//9iUidd9lbN68WNVPa9i8sbGzc8tC1p+hHNVFD2pcGpKU8W3o8zKhTjD4SO
	 +G/7u0SxygvY9scLKSUbLBpBfQObGc2HxflceTr7o8HFeFLwd3jQxLWCtMkX8Y4lBG
	 NmsiIF2cqs2pw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE2BB17E1013;
	Mon, 19 Jan 2026 12:26:08 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org, 
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org, 
 matthias.bgg@gmail.com, julien.massot@collabora.com, 
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 0/4] MediaTek MT8192 dtbs_check fixes
Message-Id: <176882196871.27177.1302852396696042530.b4-ty@collabora.com>
Date: Mon, 19 Jan 2026 12:26:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Thu, 15 Jan 2026 13:56:20 +0100, AngeloGioacchino Del Regno wrote:
> This series addresses most of the MediaTek MT8192 dtbs_check warnings
> by adding a missing SPI NOR flash compatible string and fixing both
> the audsys binding and devicetree node name.
> 
> AngeloGioacchino Del Regno (4):
>   dt-bindings: mtd: jedec,spi-nor: Add Winbond W25Q(32/64/128/256)JWM
>   ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
>   dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
>   arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to
>     audio-controller
> 
> [...]

Applied to v6.19-next/dts64, thanks!

[3/4] dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
      commit: a8e3d66ff5c0c37e7c10b3e486d2c5047bf9cf2b
[4/4] arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to audio-controller
      commit: 25556c12f4d3edc2f614f752f204c3941697b30a

Cheers,
Angelo


