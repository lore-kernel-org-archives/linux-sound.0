Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58E81ACEDE;
	Wed, 19 Nov 2025 07:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763536585; cv=none; b=c7hENz4H74bHBCvcOTR7Y62PMmeclvKIUGSDUaT1Y0bM5rg5yp1MGCvxgVmDzMPyEv0lTUgjZr4nwdMxQS0KdRk+UBunDlBkjp994xP8WO4ah4XClgnm0bkK3gxiuW5wUHQ+sHjxhN9mZcbwgygdeQYE1ZajJAoj5ROvHk1C8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763536585; c=relaxed/simple;
	bh=MgG8jzBkmnBXLAGnFIwv2IK3/i6Zlvow6a3Ld1T+Ox8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=icLnuzaTjOqjWis9lvU4KBb6PAkCfkRtLj/agsiaRksBTl1W5nm8VptHz86pGrNQ6IvpsLRCUObRMdkAj2lL3vCLGKqTxzm094vR6UURSj/1GZBiC6zJiBsfk5R7vQ6wgVoxyBY7eKBmEqLLsiTC0tqEViRaoy/EFEyePRILKD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFdg2INr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFdg2INr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8051AC19422;
	Wed, 19 Nov 2025 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763536585;
	bh=MgG8jzBkmnBXLAGnFIwv2IK3/i6Zlvow6a3Ld1T+Ox8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RFdg2INrpX182GSzLWgeUEaNRSuj3I0PpoCt+8pv8KLd8sLOlXLqMAISQsD4JxSJw
	 H1IgYQa84Dei73OnSqj74c2MB2a6sOxSC7OOgAOFUiLLNsaXgOFVGyvju/Bmov+7u4
	 iHovUhvqnlf8B2d97595mGVanbiEJA5nV3ISS3PcQAnBvxeT+AIA9OdjMTs6cYdri+
	 CYUbKY3k9mpBIjHEt+KdfAorwyYQs/UnbWDd0sqPc5lS5JNdMyOQUaVHC2zsW3jwuD
	 W4UXoQdWMcKLzp7sP5YjerRDH5FkUlDcmDkJMNQdG5EMrQg3DpC0dt+tcQ8mfvN4Cy
	 vqKdobNebrbVA==
Date: Wed, 19 Nov 2025 08:16:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com, 
	13916275206@139.com, shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com, henry.lo@ti.com, 
	robinchen@ti.com, will-wang@ti.com, jim.shil@goertek.com, toastcheng@google.com, 
	chinkaiting@google.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: ti,tas2781: Add
 TAS2568/2574/5806M/5806MD/5830 support
Message-ID: <20251119-augmented-bustard-of-attack-6ef006@kuoka>
References: <20251117102153.30644-1-baojun.xu@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117102153.30644-1-baojun.xu@ti.com>

On Mon, Nov 17, 2025 at 06:21:52PM +0800, Baojun Xu wrote:
> TAS5806M, TAS5806MD and TAS5830 is in same family with TAS58XX.
> TAS2568, TAS2574 is in family with TAS257X.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> v3:
>  - Restore patch format for ti,tas2781.yaml.
>  - Put this patch in front of code patch.
> v2:
>  - Add TAS2574 support.
>  - Re-organize the patch, put compatible in front.
>  - Combined some chips as the reg setting is same (0x48-0x4b).
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

