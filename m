Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B5F2D7D41
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770888009; cv=none; b=TG7yQ0Lfd329rR+3gaGXL5WqM7OuZhjFGC4aMwfi0UF7CGaBptqg7dMnXppZP0aidS0lKUtJQiSf5rrgjmP0idZaAHB2hwPB0YeHg2ZbyIjpv2n8htov6q85el5QMejC7qb5kQln90QGWgbcqVkHCr2BjHG8ci9HIqwRqZTc6u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770888009; c=relaxed/simple;
	bh=EVvRpWbkzklwILoJ9jNRQ8WJ/fBJztkBG71RCwf6PZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKzqroNj0HrTifMhlh05veSYJfTGTIVvEyDrBqiJVPOjVQgYru1rtRbSrQ4WwOKyVEaKX0iQ7oLOens1eMhNp2VkyY+lZ/SDr5Ko3xziydmNkboWxpBn8vS/Hwo2qrdvdFyF/m+ukQzNUaOoyfz3Gbns17pvT0EEpz0qV9U1ECA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=II3Lu45W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="II3Lu45W"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-481188b7760so55342235e9.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770888006; x=1771492806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hY6CiLhnKwBTZyp27azh8kEPNVSN1EDcWkJd3Yb4vdA=;
        b=II3Lu45WspaRCpgtSbyGs4DdQka2IJsJPXRgfz49cHBTHmdaD7ITIZ+VZbD59RlpSf
         flRzzawAnmIcEmqbLhlKT+4uib4f7YKRWmd9Lt1131baoJyDNlm+WIAjwkD/kfUfbkR/
         mkZg+9iSm/MY/GO/uDM5eEbclDHpS+lxpay9N5bE332D/JeBoE2hBgKnTHgGws8YtNMm
         nUxQ+qacG8L7uTAG/ixysrfoN9VkA0ZKjpWoA6ulp16DMKznkB1agc5o2DFHfVP/tl/m
         hGDw8h2w+hjVIUwRRFH34VlsZHAkJSU6DKTH+YeNsCKXwvFkUuYPF6vJs5dZEJyVs8QM
         N1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888006; x=1771492806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hY6CiLhnKwBTZyp27azh8kEPNVSN1EDcWkJd3Yb4vdA=;
        b=o0ystB2yV/97Xsa2NvcrtGfK57cr54b60X8l9yZT12Myl09ljRkrpR3nM6BLhDvUB3
         pbcUcYoISMRVNmVnfE7Om5PFouEhjNB8O2O2PHPAFQudXOWNtWqPMUdlG5huPUuGOfL5
         7K9SeybuHrLUWedaaMg007n4UG75b/yhg90TppKz2B8frk38HFj3ypwX/NqFTtVo4MxK
         y1Ug/A2fdPY49eEb+fL8Tgnfws4WFdyV/Og8UunuwmQ3UwoPLaK/MyNWC+o1a32zqhW8
         UnnbAN/c/dTAzb+95gIEA0ceXrS6Q9hvsc1fMc65o5J3dKFud9zmE2h56l8l+sGyh4SM
         xzVw==
X-Gm-Message-State: AOJu0YxNdDZuKpbVyAnbciXI/cPj5TE8l9zUon5TLDGivNHTS7CIoeDH
	i1oTsaGbITMQmnKeVB1IkOtZlKI1hgaoByy+F5a7Y4tUlQLkVNZHCsuA
X-Gm-Gg: AZuq6aLivO5PWOG4sw8DcBjnBCYYapMOGSsMTCspILK8CSXTB0ssnXqNS74jARcFFOq
	jmyn1rihd8BTLIw2OORnfB+RXtmoFpE3lQCeLKcTOKU5R87XgvCW9PhCz1R45pVi5XpZd27QKxN
	3QnIChYddtTBQbnAjSiXx4KZoxNiuo+lsDFsDmZRr+IPvVopSDIPYK0v6sfz2OHTunHNyF9BKpx
	gyPKtcVDVFiubIN+XD4HlQPiVGWzYUaZc7DdfR5xgpOculBMjnEjIYp3jpDrGmVsJINUNd4IC63
	r4deGO3eF8DNzGVIZLETV2Lh8qSzSxWRz0QQdQ6YJHWsejx0C26LsLQ0LjXzH1kjoXsVGqpfZ/Z
	EVzTepmEzJ1oUl4iu5blhtop0+k5NjhWTdT8n8+hWJVjzmrO88gJj4+wU8A1khgwz/tUoGZGnsU
	rb+UNKrPGlJtzOuGdB7clM0ImkOeVz4UCmT1zVjnagoc9KO5wEFQxvVyqXuux/K2N/XFiYiWeDt
	Gy6nb7dFY8runsLAcppT6gvBMIbXYsCWjCrlKXoYmtmig==
X-Received: by 2002:a05:600c:5298:b0:477:73e9:dbe7 with SMTP id 5b1f17b1804b1-4836572257cmr29099455e9.35.1770888006045;
        Thu, 12 Feb 2026 01:20:06 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d994670sm84262955e9.4.2026.02.12.01.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 01:20:05 -0800 (PST)
Date: Thu, 12 Feb 2026 10:20:03 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alexander.h@variscite.com, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v3] ASoC: simple-card-utils: add sysclk ordering support
Message-ID: <aY2bQ0_bKBqvSFsB@Lord-Beerus.station>
References: <20260211112815.126734-1-stefano.r@variscite.com>
 <87y0kyu7iv.wl-kuninori.morimoto.gx@renesas.com>
 <87o6luu00l.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6luu00l.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,
> 
> > (snip)
> > > +enum simple_util_sysclk_order {
> > > +	SIMPLE_SYSCLK_ORDER_UNSPEC = 0,
> > > +	SIMPLE_SYSCLK_ORDER_CODEC_FIRST,
> > > +	SIMPLE_SYSCLK_ORDER_CPU_FIRST,
> > > +};
> > 
> > I think UNSPEC is not needed ?
> > 
> > 	enum simple_util_sysclk_order {
> > 		SIMPLE_SYSCLK_ORDER_CODEC_FIRST = 0,
> > 		SIMPLE_SYSCLK_ORDER_CPU_FIRST,
> > 	};
> > 
> > Do you set this "order" via custome driver if you want ot use CPU_FIRST ?
> 
> Or, not use flag, but check whether "clock master" ?
> 

thanks for the feedback!

Yes, my initial idea was to set CPU_FIRST from our downstream/custom
kernel (e.g. via a small local change) when needed.

Also thanks for the suggestion about checking the clock master.
I had a look at it, but unfortunately the information we can reliably
derive is about BCLK/FS (bitclock-master and frame-master).
These properties describe who provides the serial bus clocks, but they
do not imply anything about MCLK.

In my case, for example, the codec is both frame-master and bitclock-master,
yet I still need to call CPU DAI .set_sysclk() first because the CPU DAI may
finalize/adjust the actual MCLK rate (e.g. via clk_set_rate()) and the codec
may otherwise configure its internal clocking based on a non-final MCLK value.

So selecting the sysclk ordering based on BCLK/FS master would not
cover this case.

So, do you think the solution I proposed would be acceptable if I remove
SIMPLE_SYSCLK_ORDER_UNSPEC and keep only:

enum simple_util_sysclk_order {
        SIMPLE_SYSCLK_ORDER_CODEC_FIRST = 0,
        SIMPLE_SYSCLK_ORDER_CPU_FIRST,
};

with codec-first as the default behaviour?

Many thanks and best regards,
Stefano Radaelli
