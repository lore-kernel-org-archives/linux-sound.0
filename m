Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ACB209F26
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154229; cv=none; b=r1IZWMx3u7mPXujsxhEE/jU88rMxELGBoFn9Iy2TNT5FSPHlbfzv+m2w0LAnVJXXh0oBqf9YKykHGcWkwSz/QRBVyVdJIx/GevWhwRhjGzY23SmfrGC16daEspfAe3ECjqwmAVhOhBRyhVzMbR34uyNVQesc/jstDU7NMv19cnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154229; c=relaxed/simple;
	bh=G+ixesJwrhmdRGOoKaVi9aVhGhbSs7sCztwyhRsZ6Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6/bLoHKvdR6k7CTGHoTg4yJVPfOPn64NAbejROcVxUmaA0ChE9M2vO9IhNAw/+EhAfbWk5Y8VUokMlAvyW//Xyf6/duv6JOz+G295eV90CaTm6WAzLcVHz6L2HRQHQrP3mz+JWn0QMRb7/CcKbGdgVsKRgkyzyQL9/EOuupFhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qiMZ87v+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qiMZ87v+"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffbf4580cbso45119391fa.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Dec 2024 07:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733154225; x=1733759025; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+dnyVo651sV7HO/Z87qDMxuAsPz5I+ekVBFQvKra+Wc=;
        b=qiMZ87v+XxNFV32XiCbriIt08jVS80KLFRFfxZHrVPeJD7jzgnXfOfbr6tSBbHcqM0
         aegRHMFrXb8gYzKgVGlo/mg0S4ezJnNZHyAuFAuNHXu/QA0NohURpYMNuRiWlaz5E1/C
         vbOGQWQMBfZChn2urWuXNvcrzYZsTIw41nugw1Go4EiuRm+7vTqHcpeAku40q9npYeJc
         sEXeez2XUEaIuxzH7sHp/uOK2chn9aKnEC6eLnYnb0EBY/+SS3qW78DY+xHUzv0pOqzG
         jBgwEGNtRPUhkoQCH8ES5v4UCr67FZrMJbfn4yngKE7kBh1Jiwek38Dn+xhr/TzBxpaO
         RSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154225; x=1733759025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dnyVo651sV7HO/Z87qDMxuAsPz5I+ekVBFQvKra+Wc=;
        b=IBBc6pFIrIYpONVYh2rEr4dRXzpiF2DuajyA6B8aWVNkTXWLpHKPE/PR3WFlBqyajC
         nSlJAWfKFJ3uQI3cQUe3hYUH9BhqD9oyLIYBIOJCRRHxIeuONHhLH9LnRP4UYALsbm4j
         3m4k+tn/5ZTGpJCfF1DHkatrc0VM0uWtmB2sw0iCbzBTbFkBxo9sK7VFdAU00pO5Lio1
         AyXxo17Sj3j4YV/5Ex48w3G4bYLQvsS494uwECYPLE4gEmFhzAV8OzKhaWPd3HH9YFf+
         Fti0+N9EeUlLJte0TtIQ6bJyVFaw3T13uEmUcvSpwaTyVDy8DcKHV+d8U0j/puMG+C9o
         pr1g==
X-Forwarded-Encrypted: i=1; AJvYcCVCb5JdRHWDMjnAOR2OjYPq2Hnxm1RoCYNLUGh/6JxL8jF4ePd8tcApYwMIq92pBNyWzXp6igE5qgKoAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNEwIrmC1m7uUiI/ZlRWAUeAdBDqeOgN0iDLT5j7v8FgEfs7W
	X36OQIMR/+Q6Ah/ATe6i44J4nlZqeQxn+JyKA1Y+EeqCQJhIjk1klak8uPlcnCg=
X-Gm-Gg: ASbGncu3BaXw0jlvWnCx/NmIf8CoDpqNNrx+AkjR7Ms8VzzYnS2zT8oA+sZh3jTLZre
	P0wwuuaTidSST+qw29bRHnr+RMmCexhYO1FoPhAcnq7xeniJF6bcRMglEnSUuVpqFQzkIkFOqGO
	bhujYklg1oL26421g83kpcI9KwnlXO1WvWTciU9695f0KylCnczTQn6j86Gipq1qgD8vadjh/W9
	lGKPhVDj+zUXK8FD/OBJ031rma/FckUTNIafDC8vtCgPq25V++4ADQ=
X-Google-Smtp-Source: AGHT+IEIwYAvgrT4TyGB+e9trQokMHX+TMZ5HrjBCIm5b7G6DptR6s6UNJiBuC0AVZHjQbWqoOKSSQ==
X-Received: by 2002:a05:651c:2109:b0:2ff:d2b3:753e with SMTP id 38308e7fff4ca-2ffd60d2e19mr133366471fa.20.1733154225544;
        Mon, 02 Dec 2024 07:43:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097ebb78esm5119323a12.86.2024.12.02.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:43:45 -0800 (PST)
Date: Mon, 2 Dec 2024 18:43:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?Beno=EEt?= Sevens <bsevens@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Manuel Barrio Linares <mbarriolinares@gmail.com>,
	Lianqin Hu <hulianqin@vivo.com>,
	Shen Lichuan <shenlichuan@vivo.com>, Cyan Nyan <cyan.vtb@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix a DMA to stack memory bug
Message-ID: <0c6fcfb1-a528-4e05-9fe3-f1671784569e@stanley.mountain>
References: <60e3aa09-039d-46d2-934c-6f123026c2eb@stanley.mountain>
 <CAGCho0Xe-jGcanAxehP+ENmrG0Otq5DzQO-yKHx7Ot_UzSRXWQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGCho0Xe-jGcanAxehP+ENmrG0Otq5DzQO-yKHx7Ot_UzSRXWQ@mail.gmail.com>

On Mon, Dec 02, 2024 at 04:05:01PM +0100, Benoît Sevens wrote:
> Hi Dan,
> 
> On Mon, 2 Dec 2024 at 13:57, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The usb_get_descriptor() function does DMA so we're not allowed
> > to use a stack buffer for that.  Doing DMA to the stack is not portable
> > all architectures.  Move the "new_device_descriptor" from being stored
> > on the stack and allocate it with kmalloc() instead.
> >
> 
> Thanks for fixing this. It looks good to me.
> 
> Note that the commit that is being fixed is already queued for
> backporting, so I don't know how this usually goes then.
> 

It's fine.  The stable scripts look for fixes to stable patches.

But I also CC'd stable because your commit is CC'd for stable.  Even CC'ing
stable shouldn't be necessary here, maybe there is a rebase or something so the
Fixes tag gets broken or maybe something else goes wrong.  CC'ing stable is just
an extra way to be careful.

regards,
dan carpenter

