Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79F1E7C23;
	Thu, 12 Feb 2026 11:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770895103; cv=none; b=J2S08jx43fc581Q9YQ4m+2Io4aXebIQiZZOi4zVrkU1fZ3mM8IyFU9sAD5ynS99MKWxWi7Zu8FS6ntmSEMruFDKlVAKUu+OkWxVSAp/tyuN6vWePIIodxgrR/TVBL1llpUyIg+ZdqhuJFRLCpk/JN351qb8Z6WQ/lvFhtrErIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770895103; c=relaxed/simple;
	bh=vgei1J8Qt9yfaIE8m5FrQOrVdTaLpOmNQHu1YPaILHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kX+DY6UPP3l4TGNkPQ/Sn2pW0229uvi/hsZPGHRscVa79x98dvlx3XN+cA5DleLSjiOepFbnb9UbqZ7j5EYe50Es+KfrdkyDaS8UZpuGlseMQXqfXTzxQywA3ngGdfKpbk1rBVaZH15bJppek2Ke7sP1dWue9G3b1q18gI5ieIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+0M2HhK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+0M2HhK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FE3C4CEF7;
	Thu, 12 Feb 2026 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770895102;
	bh=vgei1J8Qt9yfaIE8m5FrQOrVdTaLpOmNQHu1YPaILHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+0M2HhKnvwiORkcKWqmvevfH6hVXhDS5G20QSrDOLz43yzxVQZDUFRlOUmr4bCJe
	 ZCm+VWGM7wkDssGC9GytJGqEbKwdcbvY9JlWkMVdeUPT5dptyNfVfpA3V48qm/0Qjk
	 mXEpK3oGcBCLRH6F+2y2W6qrz7EmXjFGK5DryIIFmy1bJP25nBX2T4s1x2OWuq8jLg
	 wXqF7kS488jggLoTTagAXRCgwBiUzmd8JGHJhI0jDtndzwZ5ntzE2g2PK3EEl07DB4
	 uQ14sdViwvL05lH8ZAxzfstzCQfzFFKqya+DGxY8MHRcIIiWVAivD+CF6Gg8LCygKc
	 OCRROIPMNv0vA==
Date: Thu, 12 Feb 2026 12:18:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	ckeepax@opensource.cirrus.com, andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: asahi-kasei,ak4458: set
 unevaluatedProperties:false
Message-ID: <20260212-gainful-angelic-cricket-dae6ee@quoll>
References: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
 <20260212021829.3244736-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260212021829.3244736-2-shengjiu.wang@nxp.com>

On Thu, Feb 12, 2026 at 10:18:27AM +0800, Shengjiu Wang wrote:
> When including the dai-common.yaml, and allow '#sound-dai-cells' and
> "sound-name-prefix' to be used, should use unevaluatedProperties:false
> according to writing-bindings.rst.
> 
> Fixes: 8d7de4a014f5 ("ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI properties")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

