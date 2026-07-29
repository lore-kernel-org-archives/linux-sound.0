Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB56F1F78E6;
	Wed, 29 Jul 2026 01:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287988; cv=none; b=jCfPuhumtsxnxWpSSEF5LwQzjkQrOCkPkuZg+UwOQXSr+UTMrMrzBy0q0sxWOOL8p80krmX198iZsFHQ61U4vjlBmzFBOORlUEqYQl9WoE/LeIAwqO2fW0tcGi4pBO2Tmt7KFG7NZqKfS+FBEWRYWwMhh+BHfQ8UHlt4+c+nbV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287988; c=relaxed/simple;
	bh=kGVCA+LdfMd/DvqQ3PWeq7IiQWOwo82dVb/60TDLHYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuiqoqkApHJc9wcDUJAQCWS4cvAP2SqZ6bNv9UVsxVQ5R5/qJuGwUWBVqK8zH3+JNJ2LhDz7HkeoZhzjKMvdW4WMFD2nXmFcgtMn6KTP8Vm9Zap6/n1CNsPaAf/aDWdKGgclbyGDu5b7ArSReDcTG+wjeIyFkpExHvTFAnM1Jws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyKg3ltq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyKg3ltq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DCD1F000E9;
	Wed, 29 Jul 2026 01:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785287987;
	bh=ATMYrAwVujA9rTlR4Jzs4dT+nbSqGZK7ev3BrwlqI4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XyKg3ltqLIDAAI5/osueEcrWjJfA8fKD6d06slFM9bwudXOLYTLcB8snDJYZCZstM
	 Ycz0rmtJjUGGK9EWAezlzQ5RfQzRjGbLbE++JWE5zlmQRWsPQqed8xT0/NKfSA6YH2
	 seXIaovj5Rx82tpc/b6fmByzPEcNt22ouiKz0cIQtHFSkgynNoR5Nwyn7iEN5kSdqh
	 QAwpU5Chtd36dVnc1vNQDBMUy2FRDvTvNDJWJ2Me9qLOEGJ44MA4DG98HZGdikAa60
	 abBGIe31o3KBYYGxrwTc0gYS4ALv5LtjG3Ow/Nxh9cOpmfEjdidzZGOTTmizEGbb/C
	 CUx3UjT7UnMbQ==
Date: Wed, 29 Jul 2026 01:19:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Message-ID: <20260729011944-GKE76518@kernel.org>
References: <20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com>
 <20260721-kx-i2s-dts-v1-3-d22cb6cfaab5@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-kx-i2s-dts-v1-3-d22cb6cfaab5@linux.spacemit.com>

Hi Troy,
On 19:35 Tue 21 Jul     , Troy Mitchell wrote:
> Add the six SSPA-based I2S controller nodes for the K3 SoC.
> 
> i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
> divider, so they use the published 7-clock layout (sysclk, bclk, bus,
> func, sysclk_div, c_sysclk, c_bclk).
> 
> i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
> its sysclk is driven directly by a DDN (ISCCR0) and has no separate
> divider stage.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 119 +++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 

-- 
Yixun Lan (dlan)
