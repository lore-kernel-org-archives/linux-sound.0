Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4800533FE12
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 23:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776466805; cv=none; b=E4eDYK+HtOxXPJ+zgW4Fxd812oZ29gjnwNyPEaeHcdpzSvB0Mei4JGseQK/O7CbODY0RLdSlH3H6QVR1cCknkBecvA1wLCIJ2ag9xQGlu9rYZHGK4MoWj2UQBnur49RjNKqG0elgk34vQ1FkODwXGGfC59zpYW+kQsAbVEC0vXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776466805; c=relaxed/simple;
	bh=Fm07s0LJEPJFPXZOrReLReFYBTP8YoXXyqIbew7XXdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjyw/YtChiA4uSeoIKGZyiAYpTHemJ9DZwFRqLdqhyPsv10Dzfpl3F3mrP5Zn8/VppjhNHIeEgeMLtfY7RGYcjWNYX3Dfw80ykjKTtEOvXoS/LLU0i957Q4G0v7WhtQtJBaFuZJPdxTO0Oen5BdjRwGS8QI3fpmLpCfQlclySao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZFxdk5E; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZFxdk5E"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so8137825e9.3
        for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 16:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776466802; x=1777071602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkdExcpqmT1SthGu9bjHhEKkx2pAcbaljkvmf0PwBS0=;
        b=JZFxdk5EWDgr43hKTEWEcgj92us8026yOO0VrnCRLaEy/PS93PJspHf8P5g3LVyWVY
         QUmrNVJMX3GeJyeTDTTGgTQBwU2X85Dip4YN5TzgJp1pGQHkZoig6t+sOEYM2VMHj/+E
         JOLOB4BBUqgGLnqJ8C0Lr+DdVCVW6TMtc9Zp4huQyDnKdEsEWrwoY3vnvf8lgwSmd5JU
         ARxAcCQjEFcKWwzkb0mgxvRiKuNEITu9u3k+3zo2GFzSsdqL5CjpkajhVuXNRoIqIVas
         UyDYQNCHSqxrZAsl3ZR33TbVc5cd9cdl/R3MOLVeKgK4Lc638vLWejIcxFo4E5eSoLnX
         GDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776466802; x=1777071602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkdExcpqmT1SthGu9bjHhEKkx2pAcbaljkvmf0PwBS0=;
        b=WYvkt8PHyzQRyhte8QG9cc/6HkzREZ7rd/xfczOHbKCom0oVVDBlkM/6wNgMRhGmdq
         uRV931JLMJfAXJB146zGvU9MeEohzQcxZ0uEhDXxAIQMgTr7EyVMwRxwqi84ja17DEek
         e7A8XNIRLgYxWOmmpnCsmdu2wuZf2ZTKzCw/kpmdoIdN+xvKAg+DDCOwjGqS5dm8+tJE
         eEWC3iD6EH+TOd+FJoCdEEZzDFTS/oHah/oilb5IFo9aZuhKXCO3evj437QpsgmpA2ca
         AoEhhPS5Ng84wV54Fo0sg22WLkvLX6vX6biX1KLgxzMO9UV9x6DqtkiaaUa8usjgTysK
         ElCA==
X-Forwarded-Encrypted: i=1; AFNElJ8O1Uvt6dutRwgaZeSf5XFqdZ4IGdgivdxfP/I0Pg1WKyNJo4nXdsSeeOjN2D1e8+w1sD2p1iMltd7hlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc0lSj+75FHG7vVLLjigeAVDpn4q9HCbA28De0kMLMyPVJu+Vg
	xPPPDvML2qLdv1+sNXhElL+b6PhU0Ra2l0n+H0MyOdVGgP85Dqkp0/qr
X-Gm-Gg: AeBDiev3FgF7AQ0krYWmu2jVB+r0N6WabGbF05sbXffOAn4mNsT40Oi6cM7UIbzfSJj
	KmxSz2bPh9hVIGMpB5iljZFy2taN5P+8Kslufo4ALw1J069XJEJLR/Td38lYj5HWcnAhpnh5+rI
	c9TjPHIYks5jB8rAVLzp2rDSWnSfUKELiCRV9ZZJA0MfNW26Fk6TGBlrcTO9T6roPGU/kqlTXRc
	ekypgOskjLTc9gkopwyFi0+X+FFbjhFncFZ3iSSXJQzlXs0x11D8e44siDJU1R4ccS5pHBDRJz/
	d+Qa+l7RSRgEs3h13yEvX4fQM3tkMqPVuSmproGU+gTYuRctC+yVxeRszQpCbOV2T9tFOKQsNdL
	bzWv+mqbluZ31P+gffpuOPiKc/4JCUmxGMz3NfYVq/7cXydVS2JG8MEV/hp9ASxzyU02coWEw4/
	X4W0IwbixQw8YmbrWmStdtD2KiSbZdhC/uWtohl6f94uEcgyfP3QY5ge3I
X-Received: by 2002:a05:600c:a318:b0:486:fdca:ea8d with SMTP id 5b1f17b1804b1-488fb784662mr52675915e9.25.1776466802424;
        Fri, 17 Apr 2026 16:00:02 -0700 (PDT)
Received: from localhost (16.237.129.77.rev.sfr.net. [77.129.237.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1393f5sm71813135e9.9.2026.04.17.16.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 16:00:01 -0700 (PDT)
Date: Sat, 18 Apr 2026 01:00:01 +0200
From: John Madieu <john.madieu@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: Re: [PATCH v5 05/14] ASoC: rsnd: Add audmacpp clock and reset
 support for RZ/G3E
Message-ID: <20260417230001.vzbeym2ik4wytdfc@labcsmart-sqy>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-6-john.madieu.xa@bp.renesas.com>
 <17da3459-9205-4853-af08-5b2863403a9a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17da3459-9205-4853-af08-5b2863403a9a@sirena.org.uk>

On Thu, Apr 16, 2026 at 07:57:34PM +0100, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 12:47:22PM +0000, John Madieu wrote:
>

Hi Mark,

Thank you for the review.
 
> > +	/*
> > +	 * Audio DMAC peri-peri clock and reset for RZ/G3E.
> > +	 * These use optional APIs, so they gracefully return NULL
> > +	 * (no error) on platforms whose DT does not provide them.
> > +	 */
> > +	dmac->audmapp_rstc =
> > +		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
> > +	if (IS_ERR(dmac->audmapp_rstc)) {
> > +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
> > +				     "failed to get audmapp reset\n");
> > +	}
> > +
> > +	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
> > +	if (IS_ERR(dmac->audmapp_clk)) {
> > +		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
> > +				     "failed to get audmapp clock\n");
> > +	}
> 
> Do we need the clock running before deasserting reset?  Usually the flow
> is to get the resources the hardware requires stable before we release,
> that helps everything start up cleanly.

You're right. The clock should be enabled before the reset is deasserted
so the block sees a stable clock on the way out of reset. I'll swap the
order in v6.

Regards,

--
John Madieu
