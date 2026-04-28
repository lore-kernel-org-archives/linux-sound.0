Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB8937CD50;
	Tue, 28 Apr 2026 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359934; cv=none; b=luaQ/AOK/L072Mgrmsxs8czl8Pk8ovq+NSG5Gh8FH5YHKvJiEc+ASvLzRknszJP2mv/DIssibCwK8Z9ASrH3miMJkyaG9glTHuhZqPkvi0lqDaxEnivDroBRZiYNuComsMx3xTLvClxtb1q+AvJ8nXBAwXoD3Wl4XXdIaaRQx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359934; c=relaxed/simple;
	bh=BRO9J/ZmX8rsQZ3xlStEfQAaOa2YUCNxilflaRpplMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B14j2M+ajBrYhcKhwQ6s1QuowAPqBU1JaRe/EVqxjzYR56HyLd+AvBXy7w6psnr3Akn/SfV8nLaUtr/RZCwlKGY7pzqV6ZSimKj/67Y39QOHDbBB7A9GjvnsOWWBbvv4RO17q8IelJtoGn5kpT8QcBwUKl4z3GL7uhAWLjl0+bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IFmFTrY7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IFmFTrY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A4BC2BCAF;
	Tue, 28 Apr 2026 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777359934;
	bh=BRO9J/ZmX8rsQZ3xlStEfQAaOa2YUCNxilflaRpplMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFmFTrY7E4Om8seG+902x+cmIKa/lEV33L2FLbPmGJwI4HuBdsOs6nUeNsEzHNRr6
	 WHlA+1tgb+2A9c5Cd2iM5Ol5jjxVotyxRMXEa/WgkH/5k7AyN2x8V/lM12FWssK86S
	 d52OqmBHJSHa2mb2EFeTszx+mEpra63G/BbD0/7DJ60KwofCnL0kabaZCy3f2sfnhx
	 o6lp9+QyghAHvivNz2W7Uee7qaTfChG+uKu3WXmUIjfDjwMsTH2glaSu8CDwO+ZBXJ
	 HOQ+S/mS8EFU9WyjAJm5INVOq6FV+iFZ9Bd9AdEVBZUKNmkWTuej+Zo/5rzCvQqogX
	 Iyl+ZcI1BlKkw==
Date: Tue, 28 Apr 2026 09:05:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manish Baing <manishbaing2789@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, kaichieh.chuang@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Message-ID: <20260428-unbiased-piquant-spider-5b912c@quoll>
References: <20260424210302.39972-1-manishbaing2789@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424210302.39972-1-manishbaing2789@gmail.com>

On Fri, Apr 24, 2026 at 09:03:02PM +0000, Manish Baing wrote:
> +description:
> +  MT6351 Audio CODEC is a part of the MediaTek MT6351 PMIC.
> +  It communicates with the SoC through the MediaTek PMIC wrapper(pwrap).
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6351-sound
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

This should be unevaluatedProperties and you probably miss here
sound-dai-cells, but this is semi-abandoned incomplete device without
users, so pretty does not matter. Conversion to DT schema also does not
matter that much. :/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

