Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444BE3B4EB3;
	Fri, 10 Jul 2026 21:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783720749; cv=none; b=MObLnfXUBVGGhpDDRrMY/5z0zlB+yKwlcLQmm6ri1ENjAxneHjhaEKfmtRViW4rKxc45UYkM1qduR1LnIX2jtIfrYZ4BhtPc2PyRt84k8Xf0KCcgn6HkPcDhKtx3B6+ZV12+lEEe9zloie4L2w63KSS01JReLtXLUCLZjPx9evk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783720749; c=relaxed/simple;
	bh=Rv+00UNMh9dDVXb81yBg+4+3/d7/dITVlQzsoALiI0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvcZrJjeWQHSZfZzdFykzaPrhhUF6kN+kLMBI+siw6HTQ20SL+r/KycaTZRk91nglt4hGMsskPi6dtoRa/NGz9ft6X3FptvSYGhGMIY3elfyLeMk3Ny8PmegYvdaJZeIfVnos2kFNgRqXAzDZHC5Mk6HkiFt5fJXL+xKyfulrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U+WJ1JYo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U+WJ1JYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45DB1F000E9;
	Fri, 10 Jul 2026 21:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783720747;
	bh=LtS4nogenjGKyBY0LN40SHha2E4jCmg57DAdATWHF7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U+WJ1JYoxJZJVgP79jppI9DVRz0Qd5PwSGBAx3wxu5XyqCe7DWYSne/D4f/qlDB5R
	 6bCJIs4OJEu2XfnU8ijPBX3BsUd5ml/5XKFs0qqobwMEf3a28WKpA4N6khyA3SIl5+
	 Goy6WgCH++nwCiakCG/IhzdmGXE2Q67tQVkZIe0Pje07W1Vtjj0LxCdobyg/NZe3Yf
	 40Zi9ABm+PsGW3G5w1QTVRKGtnn1AaeMukVxIDmgdzP2o7LmFyr5kBBat7EDraUFyA
	 o2PZYCN71v6C0a6GUmpCEEUiuxhUNbwcwoq1cUH3UIe2fT34cHDYODYvHtAyAo5kbL
	 KElz7bPkyubYQ==
Date: Fri, 10 Jul 2026 16:59:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] ASoC: dt-bindings: ti,omap4-dmic: Convert TI OMAP4+ DMIC
 binding to YAML
Message-ID: <178372074660.1412241.7384502507366665799.robh@kernel.org>
References: <20260630-ti-dmic-v1-1-9e4400230266@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-ti-dmic-v1-1-9e4400230266@gmail.com>


On Tue, 30 Jun 2026 12:25:49 +0000, Charan Pedumuru wrote:
> Convert the ti,omap4-dmic text binding to DT schema format for
> validation with dt_binding_check and dtbs_check.
> Changes during conversion:
> - dtbs_check flagged reg-names, dmas, and dma-names as undocumented
>   on all four in-tree omap5 boards using this compatible (cm-t54,
>   igep0050, sbc-t54, uevm)
> - Add these as required properties to reflect actual hardware usage,
>   since the original text binding was incomplete
> - Drop ti,hwmods from required, as it is a legacy property tied to
>   the OMAP hwmod framework and is not mandatory for DT schema
>   validation going forward
> - Update the example to exercise all newly documented properties so
>   the schema validates cleanly against real board DTS files
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/sound/omap-dmic.txt        | 20 -------
>  .../devicetree/bindings/sound/ti,omap4-dmic.yaml   | 68 ++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

