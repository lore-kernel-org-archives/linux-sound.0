Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932A61A4E99
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726144930; cv=none; b=XcdcuTjqDohq+h7LYrGbZHjJS5w4gmwcfR3yAxQHbZ8cqYJd8qGEcfuca22VetrLVmJcvLb81rp7qByoD2HyuaZtYJrIGi2XfRJMitK9yyxc2J4YZkHiDtgRupWvsiN0ABNrJxDMUeE4kaz3zuJhGG2UtuQ8XzeHD0WDIOcdo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726144930; c=relaxed/simple;
	bh=71KgVZQst1bQINamW/KAl0VawZdCHIMLFcce11DUuWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgCrY2VC7z80gvrYUX/rxhX5bETbmknq+BekBpfKWvED2x4Y4NzzxzgRq3eYzFJFLjZym3I1qQmvXvR2Zm805P7aC9YbjjIX+JyqgJjC/JvaB+npAOdrgGOsNLv1QXmglvo3+Tfq+xn7Q7k9SARaGg4SYgjYulh4Wszcl6XubXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fEgHSLww; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fEgHSLww"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so7639585e9.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 05:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726144926; x=1726749726; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r3HO60dLBEmXvbynt+exPabus1GXO9AgKqhMdgiVh+U=;
        b=fEgHSLwwxFGipFy/eq58u7bv0GcOiSvfEWEgcOMfvQvktTGB0xD1zbgEgJ7eSMusnp
         q7YQHVU/GDSso02/273q8Gs7cp+pmEZvFR7hJx0JfrFrvUC3UHnoLP/4uFxmoxvcfuWx
         ycmUK6tRhX0B/A/mlsQST8CThn3/vxmfloTqb6PyyTlsvE2FTjTr++eXdIURv1MmKauA
         053ETk/ynBKGbpQfGI/zr7hfAYfYfaAuvKurd3qhm4M+/A/ubbuurULfF3ruNdcI/Yms
         QAqE0/ZYSeZNu0Ri7FMZk1WYRWYcSQ1KXq9KfkQ5oKh3XljAH+IOkBG6yEyIwonK6tGw
         u9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726144926; x=1726749726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3HO60dLBEmXvbynt+exPabus1GXO9AgKqhMdgiVh+U=;
        b=NC/OBaDDEKqdHPbH305HoS9cU0yC/bu8zCyP2JlYIlfI32pgCXeGS052rHLREVIzaR
         h9Bnh90K9D8BwY/4UXZjfSgdPf/MyGs3VsFVHLUvJWao6fBYMW99CLFFf8weyi5tBlNr
         Jd6o7uVofLqZsyA3a6GMdnWGHq4wwgv7oPa/fWtcO+nIf7EW7P9pamkWbo9E8VrSMHBV
         ilMQNL4IYiqv72pC5N/62RG0QyTuZlCNFCBezRrPiH2J4Kknbs+roRklutOxxgjAokMI
         1dC6O2OAGzI7JVKIqd5OE6za00iQSKKdl8EQJRkwaeh5NRL3/H+K7jfF3Q0sfZg3jkbL
         D/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWhh5AOHqxG1UiOXUEpJUHzMPVNCgPsV+NIyhqTeXwUluzD332c96iIg02tuDhFEIKsjjlH6wG0LbtDZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMT/wL5XDPmMPPN1UCksAIpJghSp7csd75oCsuYNBQ4qVP8yrP
	UCJTk13kEC+C+z2eV/M150r2B/keUoB2I3sZerv4uXaia20PTztPpKHqxVfgjd0=
X-Google-Smtp-Source: AGHT+IGLiXqHlWz32AqQZ4nHiLTiJO0oZGs/eeTSyZIw7ah3Lq8SWkppjirA+CwXybjISYWXHI9jYg==
X-Received: by 2002:a05:600c:3581:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-42cdb53190emr22444775e9.7.1726144925754;
        Thu, 12 Sep 2024 05:42:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb212f8e5sm156201995e9.5.2024.09.12.05.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:42:05 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:29:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: prevent some integer overflow issues
Message-ID: <20c99f50-948e-4076-ba28-9640c3cd982d@stanley.mountain>
References: <0f03d569-9804-4617-a806-f0e5c32399fb@stanley.mountain>
 <87v7z1yyok.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7z1yyok.wl-tiwai@suse.de>

On Thu, Sep 12, 2024 at 12:05:31PM +0200, Takashi Iwai wrote:
> On Thu, 12 Sep 2024 10:51:14 +0200,
> Dan Carpenter wrote:
> > 
> > I believe the this bug affects 64bit systems as well, but analyzing this
> > code is easier if we assume that we're on a 32bit system.  The problem is
> > in snd_ctl_elem_add() where we do:
> > 
> > sound/core/control.c
> >   1669          private_size = value_sizes[info->type] * info->count;
> >   1670          alloc_size = compute_user_elem_size(private_size, count);
> >                                                                   ^^^^^
> > count is info->owner.  It's a non-zero u32 that comes from the user via
> > snd_ctl_elem_add_user().  So the math in compute_user_elem_size() could
> > have an integer overflow resulting in a smaller than expected size.
> 
> So this should also use the overflow macro, too, in addition to your
> changes?  Something like:
> 
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -1618,7 +1618,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
>  	struct snd_kcontrol *kctl;
>  	unsigned int count;
>  	unsigned int access;
> -	long private_size;
> +	size_t private_size;
>  	size_t alloc_size;
>  	struct user_element *ue;
>  	unsigned int offset;
> @@ -1666,7 +1666,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
>  	/* user-space control doesn't allow zero-size data */
>  	if (info->count < 1)
>  		return -EINVAL;
> -	private_size = value_sizes[info->type] * info->count;
> +	private_size = array_size(value_sizes[info->type], info->count);
>  	alloc_size = compute_user_elem_size(private_size, count);
>  
>  	guard(rwsem_write)(&card->controls_rwsem);
> 

I've reviewed this some more and those changes are harmless but unnecessary.
info->count is checked in snd_ctl_check_elem_info().


regards,
dan carpenter

