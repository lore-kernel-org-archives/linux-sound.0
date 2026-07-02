Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4D134D384;
	Thu,  2 Jul 2026 07:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975679; cv=none; b=ogumI/gJPmsx1f+GOvinYJrDCZM8AjQOsXvbmZh2gBJWCzpEA5y1h0d9bmFPI9Ia0FMVqKPXiPlDBGIFpiiYqoZvoqXUkAS+xpoM1LdA01m2Av2G5y83YAGP4SIXqkoJYOpE92GWstg28EJ+VdMnMjoGUaXi6MR96+sUYXCvbjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975679; c=relaxed/simple;
	bh=9dRrnwc4hjwhzS/6KZKfTiMT+HWwmmPnSYM+8SCRCLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjjMMdXyMgTTkd8pokyMSaiu0oeuI4KqAMuzUNdpMJgJhMSPIs0Yx5iW3TwmHsf9V0WWuyskhYPtYH9hWYt4i9J+T1g1JXi/BpRsch6F1OUP7LmJpTuoEFIhK2FaukCxsmYngnsO3OckEYH2cdzMMFVuPEaEL+wprLtAz8Pq8tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loY7hs8N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loY7hs8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3D51F000E9;
	Thu,  2 Jul 2026 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782975678;
	bh=WWPK1rZbVzPCq41aXMURHXLEffh62vo4HLGTsPwZZ9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=loY7hs8NBM87NKK4Rx4VRiCjl4sAyPCHbu3gMcaJe/5TGCXsXqswgSd0vw7lI6aCs
	 Jfjf24dlLIIseZgYQVR4I5yPNKynM1j6lpGwXkzY3qoOs+lEWaau7v15hqF6GqRzRI
	 RqdD1xn+lzvuIY75II0/MMD2VvYnfZJAKXPHg3Hqeen8bi/tvkb0TRKv0OhZ9qAE31
	 AJsjq64sSh5V/doYsDt0ovHBTh7zu6N9mz4jr2c1g/ug/jKlGjpqUDWmwaifuvLRYC
	 k8mA+FXFNbQw1IAnUVVgwsIm6N+y3m2pDSshmW32zaWZk+NYp6MO5Ir3DyXpIChRud
	 b6b5cGa6EdYIA==
Date: Thu, 2 Jul 2026 09:01:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] ASoC: qcom: Add Shikra QAIF support
Message-ID: <20260702-invisible-caiman-of-current-4f9baa@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 04:27:56PM +0530, Harendra Gautam wrote:
> +static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvdata,
> +					   int index,
> +					   unsigned int dai_id)
> +{
> +	switch (dai_id) {
> +	case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
> +		clear_bit(index, &drvdata->aif_dma_idx_bit_map);
> +		break;
> +	case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> +	case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
> +	case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> +		clear_bit(index, &drvdata->cif_dma_idx_bit_map);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int shikra_qaif_clk_init(struct platform_device *pdev)

I do not see any response to my comments, so my previous comments stay.

Address the comments and respond to them.

Best regards,
Krzysztof

