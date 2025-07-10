Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFE322D9E3
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752135082; cv=none; b=lhyhYhblz93QehgT2NFXBASl87/FBXWTgDbiG34kOMBySpBmt9wIPzTmVEf5M9yW6SJcNKbYvRWPrKOuNrqBRYVfsQyrnf7c9vtMo1YcLXGBXVWc6XSPn206UQGGpeqQf8LWU/BHmRESNUnkWZJt4kr978FROALwg+qWD0v0uWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752135082; c=relaxed/simple;
	bh=KdRG9hQox2LIVg5BQbJagwBCdXub17DTK0Abf1w5+Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qq6ostRHcbvHhgFFVpD8GQOq3oHqWaZLkeXiOFL881eDw4xzVUeb4eRfvF5WUnI+ZjxlZWuZRwXaX6ZlqUn0M4TayceMq6csJUmDuPdxKzb01eObjvZjPT6Vj4c/qI/Ea0L6x+HQDiHVHo1DL0HDo2dgR/EgW09rr5LseX0VXuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com; spf=pass smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foursemi.com
X-QQ-mid: zesmtpsz8t1752135064t9362b96b
X-QQ-Originating-IP: r3LYCXsJvRGu4NM29rklbYDyiBmQ2Aw00APHKgzq3Aw=
Received: from localhost ( [183.17.231.23])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Jul 2025 16:11:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14875192277165604199
EX-QQ-RecipientCnt: 14
Date: Thu, 10 Jul 2025 16:11:02 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, like.xy@foxmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: Add schema for FS2104/5S audio
 amplifiers
Message-ID: <BD2D8A14FDC941B8+aG91lowfru0KiWWW@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250708112901.25228-1-nick.li@foursemi.com>
 <20250708112901.25228-3-nick.li@foursemi.com>
 <20250709-invisible-frigatebird-of-felicity-7e87c4@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-invisible-frigatebird-of-felicity-7e87c4@krzk-bin>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NZcrde3zhHkV7PIpAgUP+ZF8B8kN68RldcisIbwyh6bfTTncy51yTicK
	WU2Dd+YcHq5c9JF1S169q8efAr2TIbeBHjx78jQePIoaej/B5/FWaiTMvHaxmXIK3ctJVoP
	JnnbUNDOpgq3xK+6ZCf15/d2Ct69fWQ4fR+8Ni7CRb02PrTyM227y7T1RWTz5GWVRY5HF/8
	KEmFObRNYSm/I7dh2vX7fXTDcdiAe1irEw8D+nPywcDGLlehXbFFTTww2sJsRNBgTkox/+O
	HelnvuY7h5M5/4yg8ip5KTkr6bAh378vXRwgfC2We6PrPu5DZYfm3IM8Ed1gvJXDbateXyd
	gvqF9kqhhzQnge7STUW3/Uy4JNVMU54oHKPm/5mI7HtmnY5HdNLjNGQq9Ku6gPeFNCGXE01
	waKWucK90No8U8hybdEecxG8PDReHzzTCMUOpmZ0OFUFqZslqotIhsKOw1XdiFcn+r5pQi4
	v/xadDqwv0WIuTFGY7/nskPDVYDDhHtvzpYLkpMuIwJiVRBfRc6Sri1Fp0hujH1Zr7rISqe
	zXQf1gzePn7pILKRQR8qw7rvexSY8ptbmEdj6IZ7Ix67LkBrusJDGoi3YuoTnNv1JQi/LzS
	mVjc5W+d/Jdb5saUc1W3y/vasN/0KTcbqzzj5/wKeCjg6xxa1crQU+Jg81dZTiLwAXxO+sL
	94MocsQtW6W0rscDI707h+yh/Yb82LuzFpEj+XQ7imObN7uUiAGnCYEm60XcWZdfnSiW4rT
	1Wy3yWV9Dx3iFinH0mvZ48BJdZUBTXUPbxHMQs7n9XVkD704fd2a6HyKizIx+yn+C7hyj65
	Nz2IzO8eYjg2IVD+MLSAWU6jk+I3/OM/Pyk3aTRJbwH1YyAOiGKC7ywcYmJVfcNznHtkoKW
	DAbdF0VYPPFx5R0mhyTg5048JTlMJizZKNXyjGJEAwGaO2HWxbOMtdR14CtdC32T2HI1zd2
	J1R+O3q6CxVjhULOxx6MXEIyvcLrEcwO5jPMvSsQQBIp0uU0rpS8E7zIAb7ik83OHwIaiBb
	ISDCI5RrziNaqNjmGl9FCJp399zp/8PlU7AEzEmQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

On Wed, Jul 09, 2025 at 12:40:33PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 08, 2025 at 07:28:59PM +0800, Nick Li wrote:
> > +description:
> > +  The FS2104 is a 15W Inductor-Less, Stereo, Closed-Loop,
> > +  Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> > +  The FS2105S is a 30W Inductor-Less, Stereo, Closed-Loop,
> > +  Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - foursemi,fs2104
> > +          - const: foursemi,fs2105s
> > +      - enum:
> > +          - foursemi,fs2105s
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      I2C address of the device. Refer to datasheet for possible values
> 
> Now the description is entirely redundant, brings no value. Drop.

OK.

> 
> > +
> > +  clocks:
> > +    description: The clock of I2S BCLK
> 
> This was different... Previous code was correct, this is not correct.
> And nothing in changelog explains this. Do not make random changes after
> review.
> 

OK, I will recover it to version v1.

> > +
> > +  clock-names:
> > +    items:
> > +      - const: bclk
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +  pvdd-supply:
> > +    description:
> > +      Regulator for power supply(PVDD in datasheet).
> > +
> > +  dvdd-supply:
> > +    description:
> > +      Regulator for digital supply(DVDD in datasheet).
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      It's the SDZ pin in datasheet, the pin is active low,
> > +      it will power down and reset the chip to shut down state.
> > +
> > +  firmware-name:
> > +    maxItems: 1
> > +    description: |
> > +      The firmware(*.bin) contains:
> > +      a. Register initialization settings
> > +      b. DSP effect parameters
> > +      c. Multi-scene sound effect configurations(optional)
> > +      It's gernerated by FourSemi's tuning tool.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +  - firmware-name
> > +  - '#sound-dai-cells'
> 
> Keep the same order as in list of properties. OTOH, missing supplies.

OK, we will fix the order, but the supplies may not be used as regulator,
we mark them as required, is it OK?

Best regards,
Nick

> 
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +unevaluatedProperties: false
> 
> Best regards,
> Krzysztof
> 
> 
