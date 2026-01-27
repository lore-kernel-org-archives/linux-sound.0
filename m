Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B942EA749
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527836; cv=none; b=MgmKGbyHA9P8GrZPEHU/SHokEgDfMdQeM3mmhElyUdGsZa6FpNXVqQDeBc5Dv/2WEYFEtlHghfpDBJsOrjhMsb/ZhZxW25v2MLrAghsnzgeYyMAp1bdRFQDD+Qe//nz6sbIazDb+yLWWqLipg1f61p7x3g8MaWzVkZcgGSK84Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527836; c=relaxed/simple;
	bh=FquAxMyEZUnx56clUpEYy39o5UtF6dOtZ+36u7/JQ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CU47sIwf65TvK4pDttbadnAYcYhHVk99s3jXdNdggDX9J6ggKdotfKSP8YgqQdou0W3+cpcnOGcgNSTDFznxeAD4s4is5oh2barYGu8kaSOqLok5WC1MT85aXWQ5vS6wNn1W6zU3a16EmCs732rKXEOhFzel/6R2oMpVCUGaDF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQIQOE71; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQIQOE71"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806bf03573so2770605e9.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 07:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769527833; x=1770132633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y+BzwDOXsuwsKZRnCwm7TR0RjiDWsT5xOCESlbi3ly0=;
        b=kQIQOE71mNGWcbWuQ9LoRb1g/3Y1ApZzi4AzAEK4qYe3Cqq0wpue47pfFBepFyLTIn
         WZPOlqQXECroAfsxneCBxbR29qyYtgHVMLMLb8LnpkrKTllMg8FZJNtOqMx5AJ6QSD4Q
         4mzh34YGiwsNeUPAh0+3uGrghqzqsXYvWIR3o+/k0IJMsWVCaOG4uWcSGL7HxXlNXZxU
         Vf8KMbB7+QnviAhR0+jg0mpoyOCb44eo7559fzSPMvsi3pVA4Rfaz/wEDyvMcOM94ThO
         vUNUB/uaML3Pto2mNDOLcZQDLpU74Y/flWx1DSiFHm5xD0aVh5vuFqijzzk6A9X3ADHN
         xUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527833; x=1770132633;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+BzwDOXsuwsKZRnCwm7TR0RjiDWsT5xOCESlbi3ly0=;
        b=uZ0fDd4Cvrpa1jYBByaox/V5Q/wPihExLWh46Zc0mi0IJRXK0EW+rsx0keKXl/pdps
         gqX7HZoxt4Gq55Lx991uecG3XxJKHAtndbMULkgl7kJ8LQYB4JZNC0Mr/DEY6bQ8EX2H
         Mfyc1AXdiB5/KNx5WbOSTsi1MdzZJ383eXalOQTRtWPKpxzShhL1Ev1EGCu6fEDkMil5
         +Fc5VDCxa/eHFxIutAA35X5BpRdJP+SDM/2yXocMhUYWs4l6uNZO5mcwWOTnhGyZHVcI
         tgCHxnlhkeDHi+I50GS6AVAnDPhbid2tH14iaiTEDQbm1vpJ+8jSt00Ww1+NbbYvTWPG
         Q58Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNqoFa7WDfdeHuWR/0h9Yo1r/15zy7BE2a7EQmMtmusp0SAL+OJyNw+8X2vcZm8vQklBJZsATTU/awSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5sD5D9r1HByRmvrXdcSscksSo7C0MQSDwXiUwh3kC6d7T2K0K
	MxTZ3/LQCOg1Ifh4zjNeu3OPEZG/pkqMtsAGhP65MKecz0FI0EX5Jxdp/xzvaA==
X-Gm-Gg: AZuq6aJ0hKCejd68cDEAN75Y3vZDyXsNMLF5KVV1y2tuG9Xo3OqzPnkQObStDaQ5ZUX
	034oa1ReCVQKnQonQkH6HgIIb3D7rNAadofs6vsUsRpjPdTLQDYeTCHS98CZIIE/xgJ88nE+jog
	jEOOeG/j74vV/pqEMxzeXzlltC+s/HaFrkAMR09qDVfiF63G2ir7NjCY//+jRQrqADZ/MAgGGIJ
	EUh8OhUAEPthDCuhfcw9KiKDTANmCgt2CJ8wEvBOr8NRIA0/UDJbIssTgaotj942cRKD9KPIUUQ
	bErpumbnVq9ZBze1xaY9/I/ak4rBA1ojekI4kTMe+djUUJ/IhV+dosmc6xZN5cGJ7w5/HMVq8D1
	+xA6kHn5ULTw/R0UKXML0kiFed8Ll1JTw9CVWXLlnCCkFSCEw2IRlMVt8v8/LzclDXBP50WarBk
	UfD8mfX8YBsQFvvlCG0m/xRoqPpNAXxLg1MVmgd0ENnoQ3RhsK8wCsAg0=
X-Received: by 2002:a05:600c:1f88:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-48069c39a00mr29694175e9.13.1769527832532;
        Tue, 27 Jan 2026 07:30:32 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db63817sm137117845e9.3.2026.01.27.07.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:30:32 -0800 (PST)
Date: Tue, 27 Jan 2026 19:30:27 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <aXjZoFi_fq3tzJFY@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
 <aXjRx12yPA7QflaF@anton.local>
 <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>

On Tue, Jan 27, 2026 at 03:13:59PM +0400, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 07:11:24PM +0400, Anton D. Stavinskii wrote:
> > On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:
> 
> > > Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> > > probably be a mute_stream() operation.
> 
> > I'm not sure here. DAC mute feature was not implemented because I don't know how
> > exactly do that. The public documentation is very weak for my taste. 
> > This call added here to be sure that override flag is
> > not set (override feature replaces the output by setting it to constant 
> > value and ignoring the input, so it is some kind of mute from my understanding. 
> > So ensuring this off is needed be sure that DAC will output our I2S data). 
> > What do you think will be better to do here? 
> > I'm sure that is needed, but may be better to move 
> > it to some early stages, like probe function. 
> 
> It's probably fine to leave the functional code as is but you should add
> some comments to the mute function explaining waht's going on here.

Sounds good. Will add comments and prepare v5. 
Thanks a lot!


> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

