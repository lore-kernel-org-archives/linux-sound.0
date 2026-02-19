Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CFA14A8B;
	Thu, 19 Feb 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771507855; cv=none; b=XMCtyxA80VKSKyc2x3LPhdLJaefOxRf7l7MlDH8xHpNtRM4wavGskHWev8K7hcvkCeblfe9lLgTypvlxgJ6oZ7gsyA+PxvxCN1Cq6L1CMeUgRKDh+2ScyBk98zWsPCKU7b2QWShixjlQSF+RLOIE9+QlGM4lBHhmrj7RxdWXlbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771507855; c=relaxed/simple;
	bh=9c1w7t5jKWeVmDYVe9cXmwM2Oqt1Q70df1xG1ed9QVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKG0DJkH154FyJeE2pS4OiLF8kpxnG49HkwozCas17H78DZSvlNGuQyu46F9vtEj8DdHUoyLlTjBaGMrKWcMbk7qa/TbZLMq+gFn55TTKuiO+CwScUnM9UQhFpmEyqlGnUTz2D9QGaRFEowLuQF0xTB77LYS7kjHwhy0EXg7rOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MY9ZvABT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MY9ZvABT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 511341A0744;
	Thu, 19 Feb 2026 13:30:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D91E5FB45;
	Thu, 19 Feb 2026 13:30:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8C6A102F18FC;
	Thu, 19 Feb 2026 14:30:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771507849; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=npuTIspAvOrD19FQ0TqG9QOxkV6FhzrkSXimIpMnL4g=;
	b=MY9ZvABT+1aokTgV8+munKqpZOV0lg0d8+sqwvXPIHpzY+M2QHeItcwQkdXD9EZYcq7Aaq
	G6jAEx4Wd3w0VyOcSZinyqbAUGTYfX8NTbQ654p5iGnZ+5D1KpMR5oxLfOn0604lqxzI0F
	LHE4HSscCnqAiYA2vRDJ6ZKOcbN6Z2VlPCnxB2FFcNKlnrr2k0CpTl/iWy2x0F5XHzJ6Xq
	DtYRAqOEMzywC19YJ8emLHKFgIQ8b2qnGjWJ0QIWGZbkEiJvMXOgdK8YpKNSGiDHw+9TRf
	rjA/464qfqnN6nuFjorilwul9iApJFrCNCIDzW7RNHLaU5PFmsrO6TowbxnIZw==
Date: Thu, 19 Feb 2026 14:30:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s-tdm: Use param rate if not provided
 by set_sysclk
Message-ID: <20260219133044fa1ac2a4@mail.local>
References: <20260218201834.924358-1-detlev.casanova@collabora.com>
 <20260219093718b7d29076@mail.local>
 <00698644-63dd-45b0-b43b-a7bc0fa459b1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00698644-63dd-45b0-b43b-a7bc0fa459b1@sirena.org.uk>
X-Last-TLS-Session-Version: TLSv1.3

On 19/02/2026 12:34:44+0000, Mark Brown wrote:
> On Thu, Feb 19, 2026 at 10:37:18AM +0100, Alexandre Belloni wrote:
> > On 18/02/2026 15:18:34-0500, Detlev Casanova wrote:
> 
> > > +		if (!mclk_rate)
> > > +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);
> > > +
> 
> > Maybe this could be set as the default value of i2s_tdm->mclk_rx_freq
> > and i2s_tdm->mclk_tx_freq in rockchip_i2s_tdm_probe instead of relying
> > on it being 0 and testing later on?
> 
> That makes sense but since this is fixing a regression and I'd like to
> get the fix in I'll apply, we can improve things incrementally.

Yeah, actually, Luca pointed that it is actually not a good suggestion
because we need the rate of the stream to be able to set mclk_rate and
we obviously don't have it in probe. So you can definitely apply the
patch as-is.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
