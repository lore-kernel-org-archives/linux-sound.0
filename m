Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19AC2376E4;
	Tue,  6 Jan 2026 18:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767725377; cv=none; b=qVKMZPWqP9VacNws8o5WCoOwgQepo1GT7e4RWNB6ojfBkYaSfd4mfJTPIpRwNyd8NdOewch29NdJQR+KS8PgtRqP/HzDnlP9NC9weh3GPPhqQ6gNOCaSR6tK76mnxQJgiL/dok0oyj3nsGMwk0KdBUrgBMwDoKBl0YAJSOwmhIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767725377; c=relaxed/simple;
	bh=MZ6Svd55ZlvCBunB4Zjt4d4jZj4xwy6MqwTUDZTbSH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Af1CklPZGj6esfY9cEKu11OFxjYBY/1PFocefCw4FJCFFh9HBQMxzXGz8SrI06LR99p4Sqrba9pClgvnDAOgDqEWZbUh5f5jNtI0L3rNMa0TglxVprYjj6/8dqs1iKhi8uNOaD+2t3+i60ew3qtFOZcoolJweOrc8zIyik3Vmx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpejQQ+R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpejQQ+R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE50C116C6;
	Tue,  6 Jan 2026 18:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767725377;
	bh=MZ6Svd55ZlvCBunB4Zjt4d4jZj4xwy6MqwTUDZTbSH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpejQQ+RbBFS0gKJd342pmqkJ53TqJCXziTA0dATTdKT2WcO22woVpKCokFdvzHU0
	 1FVQEiNt5+2duZ5VWC9rFifJiZPra8QfuNWL1Bm2NBijOPJqu5BuqqmsHmtGEt7NfN
	 jxio8l3mmlrMVYHBbshPdJUmnU7O8PF2WeMS0GsCRLPqKsB8JFx43sydz9J8X2nnVk
	 a0KAc4zpDXiopdnNxG9znfMma0JxDLnaoUfrsE+weCMtCD5O75zYBNQyGfXnMczagK
	 AWDkwbhufXFfZzIDdZe+arr7kMRhFTYA2TmdJEmN3UOZpCrQDDcdcTjuCFlG/P++oc
	 /dL/ldLeiZybw==
Date: Tue, 6 Jan 2026 12:49:36 -0600
From: Rob Herring <robh@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: broonie@kernel.org, tiwai@suse.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, krzk+dt@kernel.org,
	amadeuszx.slawinski@linux.intel.com, krzk@kernel.org
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: ES8389: Add property about power
 supply
Message-ID: <20260106184936.GA2517797-robh@kernel.org>
References: <20260105091548.4196-1-zhangyi@everest-semi.com>
 <20260105091548.4196-2-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105091548.4196-2-zhangyi@everest-semi.com>

On Mon, Jan 05, 2026 at 05:15:44PM +0800, Zhang Yi wrote:
> Add VDDA supply and VDDD supply
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  .../devicetree/bindings/sound/everest,es8389.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> index a673df485ab3..75ce0bc48904 100644
> --- a/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> +++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> @@ -30,10 +30,20 @@ properties:
>    "#sound-dai-cells":
>      const: 0
>  
> +  vdda-supply:
> +    description:
> +      Analogue power supply.
> +
> +  vddd-supply:
> +    description:
> +      Interface power supply.
> +
>  required:
>    - compatible
>    - reg
>    - "#sound-dai-cells"
> +  - vddd-supply
> +  - vdda-supply

New required properties is an ABI change. That's fine if you know there 
are no users without the supplies, but you need to state that in the 
commit message.

Rob
