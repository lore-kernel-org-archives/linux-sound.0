Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C2F253B42;
	Sat, 30 May 2026 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137890; cv=none; b=gePV8vudcOeo6WgQtrRIVOcd2F4q/la74pKk6ugLf6vDL/JPEn+qU7HN1uAAAWT9e3K+1Uoi6NCDO7gvAu8qrNkEoIJ6SmRYdTjtR0TpkZ/PWxtwUIKU5dYCjdsduTZGWEaaxMzmFi1I2N1yoEKVTpnAuwTfgpV1xUe76Bx45h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137890; c=relaxed/simple;
	bh=dOzgHxYakMLOd4CI8dc0KRhCNUyE4WgrPhWXiV83kg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSpcUjOvtasE4jy3B27OV9XpAtZ9YKYj5SmiyYFyz8TQRdVIMxua5u70W+dskO8WDyhYHqt4pzu5A1u0sgNIfbP3ZUlufv9dVH0PKz0IMFGVhsKkC7VfXFsHrLSxYzpLWw3tHPCOfEnCJJZ3rbmgAi1P9Ksg5GLv1CK/SOkOt2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/Mwva5H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/Mwva5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BC41F00893;
	Sat, 30 May 2026 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137889;
	bh=Ah0BAmd+lwHuZO6zRBiL0+MEQYrEVAKIQyjvoixgNRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c/Mwva5Hzm5FVkloKcxpDPjbejs7gN/gCXj04ZWIkg4crNYrhY5SkWrpmG1XHjKLH
	 qvCFZq10iibjzf7jSgKqQFJCWC1k55O4CVETgqY0IEYrFg5+gvmh8T0YrOQPsfkYyy
	 kyIGnovk2EbYY4BZZTiUhEL7gYUFYVlIW7r3C2xYDXfK4L9GrUXVMPDMj6YYe8rYcR
	 wyz8uTDD16ZMGu6f+QkNa+N94p8+egLsOVdqcWWEyoDLo17hKQI1qyVFbfUj1zXhJj
	 NVzqWz8o6VTYjadhwKUzBTrep3hP1QLVy0Lris/dT790L+Qz4KIFiCL7gTNHteglom
	 X0ZTBGk6NIMdA==
Date: Sat, 30 May 2026 12:44:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF
 clock descriptions
Message-ID: <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
 <20260522100318.73474-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522100318.73474-2-phucduc.bui@gmail.com>

On Fri, May 22, 2026 at 05:03:16PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The clock descriptions are currently swapped relative to the
> clock names used by the driver.

Why would order of clock names in the driver matter here? I do not
understand that explanation.

> 
> Update the binding descriptions to match the actual clock
> usage, where 'mclk' is the controller clock and 'hclk' is
> the bus clock.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/rockchip-spdif.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> index 502907dd28b3..b174d7498029 100644
> --- a/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> +++ b/Documentation/devicetree/bindings/sound/rockchip-spdif.yaml
> @@ -45,8 +45,8 @@ properties:
>  
>    clocks:
>      items:
> -      - description: clock for SPDIF bus
>        - description: clock for SPDIF controller
> +      - description: clock for SPDIF bus

So example is wrong?

What about all the users?

Best regards,
Krzysztof

