Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A5345CBF;
	Mon, 22 Jun 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135740; cv=none; b=AYkcRYUGo3ndK62EpBGkm/oHKfA8uoZ1hkACGeRDHmMOzv45eAncRVtXvYOslD1hfIkZ1vyNntccLpXbVYUWt+fVP2VBKXPDXAkR/sXPlmmFJUL8t/NiwW7OuveSIEvtsK/xpP7WOaMrdhwP9dCoP5ls7zzQBplj/4YDOUUZHro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135740; c=relaxed/simple;
	bh=wPs2KvIcrzxAfqFySRNk66FlQJWyRYYOYsEFmeCGzDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZMc6TNBhb1q1UynZxXuF/LX9N1ZlaZBO/zy/cAD9dFOKcpaJnsoZ7aIFt5Yvfry6+hCq8RLDNUr0LneDRJHhKZBzP8B/AtzGtA6UP+GU+oebGDdyUFbjT+SOOKmL6FqBE7JXT4e0jLTyM5Xv1rRDtPVgejPGJKgl8iVcH/zk6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ni93tuwk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ni93tuwk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A54A1F000E9;
	Mon, 22 Jun 2026 13:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782135739;
	bh=FC/VBYU4oBVduK0L5ASsa1ThohOhgLydmEOiMbsObKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ni93tuwkHsNp9dRWNzSEJk/muSbISp48Wg5v+f81pcpNpSxlHzQt8xlHt0cP3Eafs
	 pw6LXSApGr9mVEBp9Tg2mIztdRfhGjIJaM+9u+Eo9/bU25laEXmaQZxww52wps6Jfh
	 pAaWXsVpzFT8LchKv6tLVXOFivRB9KP2nfJyJwWlrI+p4sjc0SztY9rMgfSdM1bZnR
	 Pf1XuLzmMHu5EP1XrBGPRbtbETwIvF+oadfnWIlTmzjfnn6GyQdWB+YGobXCB99ouY
	 1pw2MlckbKN8paILOwObzbbcsNScuwqzeHwWX1txDeiZwNWb+OOw9Y3oWibzRGVRvD
	 q7LensQSBnvdw==
Date: Mon, 22 Jun 2026 15:42:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add MDSP carveout memory
 and update APM DAIs memory regions
Message-ID: <20260622-defiant-warthog-of-authority-d9d1ba@quoll>
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
 <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>

On Thu, Jun 18, 2026 at 05:05:09PM +0530, Ajay Kumar Nandam wrote:
> Add a dedicated MDSP carveout memory region for audio usecases on
> Shikra and mark both existing audio heap and MDSP carveout regions
> as shared DMA pools.
> 
> Update the Q6 APM DAI node to reference multiple memory regions,
> where index 0 is used for control path buffers and index 1 is used
> for MDSP data path buffers. This separation ensures proper memory
> allocation and access for APM communication between APSS and MDSP.
> 
> Also add shared-dma-pool compatibility to the existing audio heap
> region to align with upstream DMA pool usage.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 88954ee943ef..d744f7e38ca6 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -365,7 +365,14 @@ smem_mem: smem@86000000 {
>  		};
>  
>  		audio_heap_mem: audio-heap@86200000 {
> -			reg = <0x0 0x86200000 0x0 0x100000>;
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x86200000 0x0 0x40000>;
> +			no-map;
> +		};
> +
> +		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x86240000 0x0 0x100000>;
>  			no-map;
>  		};
>  
> @@ -1935,7 +1942,10 @@ q6apmbedai: bedais {
>  
>  						q6apmdai: dais {
>  							compatible = "qcom,q6apm-dais";
> -							qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;

There is no such line in next-20260619, which means this is some wrong
base.

Best regards,
Krzysztof

