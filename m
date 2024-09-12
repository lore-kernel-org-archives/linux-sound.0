Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837091A2627
	for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726145078; cv=none; b=ZA+CHnJomO4n8jfqRZCHmBdp6zlbX23oD6qm7TZb3UaeUk6NxODX/XwxHipisa70CUbgQ9+OfGnneUsXql4Li6jYm2zFzEGjACwI+w8lBawcHBAjhUSXV487XX0DMCjO71kMii245uzIiQEEtNHLcs56RlRxxHmCNdNXtoCFErE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726145078; c=relaxed/simple;
	bh=Hla1wMqf0HrT6fXzcUP8UY1GsACDSmIzSbBDMFZop6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FVSEZqwBELaesI4ECxwDjqJp0EojsGvDB/qBnlPQjeaOSDsklPeaB4rTJGfKofwpsXeUQlC5kIrwtSekSUtng+8NSlvKq6DRQuiY7fl2EkdkevM1XuF8sQ+qT9zVOKsm2qN/tAMyezB0da940/QGwVD+rAbfla7gu7YoULuUQs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdlhaSXQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdlhaSXQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-374cacf18b1so671206f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 12 Sep 2024 05:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726145075; x=1726749875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tIRFE104iqmiqvypwgtVAS+aqcQZibJcoPMVTtseVEM=;
        b=RdlhaSXQmAgp1KnlXkYhfU+Qh7TYYFm51uP6HOwE7tN4n1gLj0r91WFoVw19BquJFD
         /n87cq8t3y1v1QEl3Vj+OMUMJ2WgdMc3XTp//FrHF0RzFC2haiQNkuWMvIa18GtQeonW
         9eHuIFwSEmLvKeALpsKMTWnn2hT8joSrgFWFH2TuBCC/sWln4SuzcWzgSyAdYueArwvz
         PjhI8HjTxAb/+q31ZDQL1ZLM9c5DF/GqNkJJTGRuUybmeMuMDkkcpq9WQet/7bXBMNP3
         gjFL8bZ/nxfABXPl8AUGpxFxX3LPgWfALNPrEcY/TlpsMXlZVwGbQhMHnINpKtuz0UUV
         sqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145075; x=1726749875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIRFE104iqmiqvypwgtVAS+aqcQZibJcoPMVTtseVEM=;
        b=Z83I5I4qyJGnkUEUXuMdhfX/kXxcvGu2wQeIz/vsU6WVo2imXczI17sJcT1cW7WWZM
         HkWPR9PwpzLPAzSeo3Wn+AVFsogHnlW0ZpeAXWnzyZG8kephK48W4f47UksneOR3Dcas
         Z+WAGrf5Nac1VBrw0oJA1u+gHSgd3+9Od8k6mUyHzKEa1pyBuLajjIoFxwSPzCslIDXs
         PnqRqhb9c958KLpfFE0KoytVszkxxagzsnXQ2RR1PvGbhwAgmqzh7Qn59cBDVMtpQD20
         20NHew3Fbpdpran8H/8czQsyXFCM+kj4z1FXTzq+kiRM6/bP3H4DCSwuddits+rtNtND
         FyAA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEsPCvY/k+MZUK9NkhQ2DlNtwPO7j9KgXYknLrUEQEUq9tOJTqIZhttssvwqKS44laYrGV4yjdCj6GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXzWDD0ziuBHtSicb8JDEuUxYt8o30WwBRTlkJazSowrO34c/9
	X05pSF4+7DHpkBVJSqhSOBdwNltNrNYhzZK7wwxEp6nxTBu8dGw+4JPf82AvTRc=
X-Google-Smtp-Source: AGHT+IEkEa3kJagup7Qw7aPq60YN6Qx3p0uT99t7HEvmeyCNpx3cYutAK/MV22Ep795nOBJrPgDpJQ==
X-Received: by 2002:a5d:4b8a:0:b0:374:c287:2afe with SMTP id ffacd0b85a97d-378c2d58ee0mr1534533f8f.56.1726145074680;
        Thu, 12 Sep 2024 05:44:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789556aa7dsm14773393f8f.0.2024.09.12.05.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 05:44:34 -0700 (PDT)
Date: Thu, 12 Sep 2024 15:44:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: prevent some integer overflow issues
Message-ID: <72907305-eddc-4fb4-9c74-7e1d2750f4b9@stanley.mountain>
References: <0f03d569-9804-4617-a806-f0e5c32399fb@stanley.mountain>
 <87v7z1yyok.wl-tiwai@suse.de>
 <20c99f50-948e-4076-ba28-9640c3cd982d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20c99f50-948e-4076-ba28-9640c3cd982d@stanley.mountain>

On Thu, Sep 12, 2024 at 02:29:58PM +0300, Dan Carpenter wrote:
> On Thu, Sep 12, 2024 at 12:05:31PM +0200, Takashi Iwai wrote:
> > On Thu, 12 Sep 2024 10:51:14 +0200,
> > Dan Carpenter wrote:
> > > 
> > > I believe the this bug affects 64bit systems as well, but analyzing this
> > > code is easier if we assume that we're on a 32bit system.  The problem is
> > > in snd_ctl_elem_add() where we do:
> > > 
> > > sound/core/control.c
> > >   1669          private_size = value_sizes[info->type] * info->count;
> > >   1670          alloc_size = compute_user_elem_size(private_size, count);
> > >                                                                   ^^^^^
> > > count is info->owner.  It's a non-zero u32 that comes from the user via
> > > snd_ctl_elem_add_user().  So the math in compute_user_elem_size() could
> > > have an integer overflow resulting in a smaller than expected size.
> > 
> > So this should also use the overflow macro, too, in addition to your
> > changes?  Something like:
> > 
> > --- a/sound/core/control.c
> > +++ b/sound/core/control.c
> > @@ -1618,7 +1618,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
> >  	struct snd_kcontrol *kctl;
> >  	unsigned int count;
> >  	unsigned int access;
> > -	long private_size;
> > +	size_t private_size;
> >  	size_t alloc_size;
> >  	struct user_element *ue;
> >  	unsigned int offset;
> > @@ -1666,7 +1666,7 @@ static int snd_ctl_elem_add(struct snd_ctl_file *file,
> >  	/* user-space control doesn't allow zero-size data */
> >  	if (info->count < 1)
> >  		return -EINVAL;
> > -	private_size = value_sizes[info->type] * info->count;
> > +	private_size = array_size(value_sizes[info->type], info->count);
> >  	alloc_size = compute_user_elem_size(private_size, count);
> >  
> >  	guard(rwsem_write)(&card->controls_rwsem);
> > 
> 
> I've reviewed this some more and those changes are harmless but unnecessary.
> info->count is checked in snd_ctl_check_elem_info().
> 

I also considered if I should fix this bug by adding checks to
snd_ctl_check_elem_info() but I don't think that's the right approach.  I
couldn't see how it would work at least.

regards,
dan carpenter

