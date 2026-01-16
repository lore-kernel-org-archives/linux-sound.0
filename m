Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F368E2727FC;
	Fri, 16 Jan 2026 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576122; cv=none; b=fh6ARzEKX8GOBZ2gu2sA9ROij1Ze4BdWj3S0mZRiFN64UFZYjwnGxfZjajlpjSi0hCS1yndC2hCsfMy5rFBp2L2Nm4ozA/tESrQRf5knuPGSY4Rh3/WabANoejwD12yc7seJEQmG9EjkEJCm8vn9YR8gGqyOCPpN+OWoq/58Lqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576122; c=relaxed/simple;
	bh=GsDoofD9Db2+ABthdz0H2fcd39DOVi6IJIg7YdoRj8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+w+DQ3U31Irpo4A893RBV0LwNfcAlD7Cibbbx/x2Klv+NTwbaIe1dYvEEAQRfuV0MCbVm0qE8x6BE4usVMsauGyvIbCYlWB5+pH/1NEG2wOK4xITqkmoTf5FCcAt03cVv7/tLS7OO0xJZZ8vw//38hxx16klRZuGdm2QZOzeQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uVy8+kY7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVy8+kY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60600C116C6;
	Fri, 16 Jan 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576121;
	bh=GsDoofD9Db2+ABthdz0H2fcd39DOVi6IJIg7YdoRj8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVy8+kY7ZWBm2uJM1aPcj6Se4PHtz7GAXz4wHdMyGVhlhemIZzP9df1+u1DnzKyds
	 ksyaEv0+Bq5NpSZIvTBFguO/zUpvHpZzl9EFrLjQRH4VbY1T1dWk+K2gub43Awo052
	 1qCUQMmvRmhvZT37qXm5NREEYSGMTEwgAto0d81wJIil7TMVuslj4lFh38sgmVPrRP
	 hbxWJHYTAjrnXlWg5zrL8vivybNTm9fP7DGDkSO4V0vi/dOYERuucSUXATODdfhwsH
	 xLfVKus6wrbYIDbIBetj6BOSpHUofKtyqhUdz30yJMWPWfdrevgJ7nQYR7cIFVylgr
	 4yTinFtN6iMrQ==
Date: Fri, 16 Jan 2026 09:08:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, julien.massot@collabora.com,
	linux-sound@vger.kernel.org, pratyush@kernel.org,
	tudor.ambarus@linaro.org, devicetree@vger.kernel.org,
	shane.chien@mediatek.com, richard@nod.at, krzk+dt@kernel.org,
	lgirdwood@gmail.com, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, jiaxin.yu@mediatek.com,
	broonie@kernel.org, vigneshr@ti.com, matthias.bgg@gmail.com,
	eugen.hristev@linaro.org, linux-arm-kernel@lists.infradead.org,
	miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
	mwalle@kernel.org, kernel@collabora.com
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
Message-ID: <176857611991.1604366.11152222679883744313.robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>


On Thu, 15 Jan 2026 13:56:23 +0100, AngeloGioacchino Del Regno wrote:
> Add support for the mediatek,mt8192-audsys compatible, which uses
> a different audio controller (mt8192-afe-pcm) compared to mt8183
> and mt2701.
> 
> This resolves a dtbs_check warning on all MT8192 devicetrees.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

