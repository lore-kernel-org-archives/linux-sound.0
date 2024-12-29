Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E51CF96;
	Sun, 29 Dec 2024 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735479274; cv=none; b=dK9Gv4w06gR0pVJa0NoPkYmxaWHQW98xfZV7oJsSxBs69q2H7FtQHgleSQ3G5bCFwYb5EicDfwBtUF8bS25XDra/sjJ9xdYuxW4I6aP33GFaAJhEAomAtqszHFv7CBLLwSd+v6erSCmLOxWuEAH4qmjKWwEZDCF/eZjyVrbc2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735479274; c=relaxed/simple;
	bh=j0msoJhM6sL5bgCDf9wFaBZoWwpmOkj2GBOQ5K+91Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U1PqpWZHnAAYmHps3PgkuKzHFfD9OD4R4FgF4NOZDrXZtakSVmwMoWnWWZcndrC1vlJY31/ZWjFsIVBf89HxbmvO0NKFTmDcalJyhpnrxN5swnJpM2Fxut5N9JjjJ8Q7dt1ltnrqhRsYeIKU0CPXEeY1jdtspR1w+tVfJFmUC+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOIYztp7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOIYztp7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43622267b2eso89762525e9.0;
        Sun, 29 Dec 2024 05:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735479271; x=1736084071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psOf8USpovv9lIFaaYNN05UslEpUwLTRrGoaWrZotIE=;
        b=ZOIYztp7DSkHFVIG0lYgKC7u7oOJRxLqmga2MJmXr2YigEQnwKRLuXZAzWND0DGmpE
         RQ2+OgEm5NksJD/w4dJ63D0TXt/Uq2WmITMoNZsPwhXO2XHeR1AuXOWoWOkk9BF/QHXl
         DBiKG4YVFFz1VKsekOso83z/f6zR/xVDmlyFDHXhTEuwfRD85rlU0PNx5rcRvhxVMnBo
         LhyOjAx6iHTh3G6MWE4xQTxVboMnqgZZSvPJsPg2yC3QFmxZ3iodq57rBiJIYmC/VxgA
         40WwcKlCTP6nEMNSU74oFIYzeQyMX0htmGwCK4gEs0nOwA53aztXxpJNKH5JU3fQMVkD
         AsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735479271; x=1736084071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psOf8USpovv9lIFaaYNN05UslEpUwLTRrGoaWrZotIE=;
        b=X1lLSpx/w/4zAtksi3OWNm2w17dDZlxHAy/Dm/CNqLl1miiEsYbNGlVdOEa2MgJdGT
         QOD+lY1JyCStdNYi4Ys/gEkVR5z/08EqYJHaj36N6FDcHyiaPgHLGR+p20hJyuQmIrLy
         qlBTSMAlZy4rCXD87kga0DC7Q9aEUiVzF8LsPnPiChSsrUjklQWEBbK2aAaMZe7jeTkL
         7QnCgB99d+penv91ZBmEnqN4CasIKC2eNDvpgnBMP6J1Wl9Vwjj3VijXfFyg9QdolaDP
         eyFMZh4neEr2yfPs4UHyxp5dgz5SDWd7NArEfE0IPaJdi1ze/oGvP2pJaY5yXLlvTUOs
         OhuA==
X-Forwarded-Encrypted: i=1; AJvYcCUvlLIse6b4rq3yMoiJX305Tf81FhiMH0aTDJiHpmDHlLX70gRj06fBVWyRSRWxLKSLt82qV0tXIzlaY1g=@vger.kernel.org, AJvYcCVWO882JprAh6EgIUQrfirKJ/Mz39tysUov+V9NiOV/vMowrgJDuHEElGiQKPTQFDMp2oJyuqlgkAgKb7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnmRXw1c/erlqYRACwcBWAzPGv6ZvDmMCIqaE/fTdKWHBXgm0W
	hGhzv/VWTluj0s8gEqlrDASJE4r09ArIr6GGPYsoT1cqiJEKPYm3
X-Gm-Gg: ASbGncvEGSLfUv2yWpYVL9ihxfgbYgwRKlKoRebl0zzELet/HQw85jlSGwwXsovCD+1
	pPrHfViRGdM+3sldaZnPwuLEFzQgNbrD2dcfVMByHzS6E+u/CIrFa1ybQRFxYWMmdtdmBO3XsrU
	YOQzWZoIDI0bmAi545R0h4q9V0U6wWGifY0haQuwOIqXCz57zsynmR7Nrsyq2TTnRaub3REZ+Hz
	6qJBmUiJzmcHJNFNU4IQQGrpnjYzt3Ggh8vkBe8DKnk0PtOTmWXtU7lEbPCffQFvg2G/pnWpgcY
	Vx1ZdcbFAF/4NnGDwx5T+uo=
X-Google-Smtp-Source: AGHT+IEdPhr5RHiPUoPxmcT1cyx3xU2TYI3tnl+dHccHvAG9jl3QbuO+FS8vx/VXwafPlUSpSdat5A==
X-Received: by 2002:a05:600c:3b9d:b0:434:f739:7ce2 with SMTP id 5b1f17b1804b1-436686436ecmr262576175e9.8.1735479270801;
        Sun, 29 Dec 2024 05:34:30 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289d3dsm329370705e9.41.2024.12.29.05.34.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 05:34:30 -0800 (PST)
Date: Sun, 29 Dec 2024 13:34:29 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
 "wychay@ctl.creative.com" <wychay@ctl.creative.com>,
 "ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
Message-ID: <20241229133429.5fbed930@dsl-u17-10>
In-Reply-To: <87bjwuy9ub.wl-tiwai@suse.de>
References: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
	<20241229090228.75f8a3ba@dsl-u17-10>
	<87frm6dfda.wl-tiwai@suse.de>
	<20241229105722.03ada34f@dsl-u17-10>
	<87bjwuy9ub.wl-tiwai@suse.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 29 Dec 2024 13:03:56 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Sun, 29 Dec 2024 11:57:22 +0100,
> David Laight wrote:
> > 
> > On Sun, 29 Dec 2024 10:10:09 +0100
> > Takashi Iwai <tiwai@suse.de> wrote:
> >   
> > > On Sun, 29 Dec 2024 10:02:28 +0100,
> > > David Laight wrote:  
> > > > 
> > > > On Tue, 24 Dec 2024 23:16:17 +0000
> > > > Ethan Carter Edwards <ethan@ethancedwards.com> wrote:
> > > >     
> > > > > Hello all,
> > > > > 
> > > > > First of all, happy holidays. 
> > > > > 
> > > > > I was browsing the ctdaio.c code and I noticed a lot of 
> > > > > duplicate code and functions, specifically:
> > > > > 
> > > > > dao_set_{right,left}_input and
> > > > > dao_clear_{right,left}_input functions.
> > > > > 
> > > > > The functions are pretty much identical. They only 
> > > > > differ in the side (left, right). What was the original
> > > > > idea in doing this? Wouldn't it make more since to just
> > > > > have an ENUM (left, right) as an argument that would 
> > > > > determine the side and just reduce the function to 
> > > > > dao_set_input and dao_clear_input.    
> > > > 
> > > > Hmmm... you'd have a lot of conditionals inside the function.
> > > > 
> > > > They also look like a memory leak just waiting to happen.
> > > > I guess that an earlier implementation used a separate kmalloc()
> > > > for each imappers[].
> > > > 
> > > > Why is imappers[] an array of pointers not an array of the items?
> > > > Each is just 8 bytes plus a 'list_head' (2 pointers?).    
> > > 
> > > AFAIUC, it's a setup of a chained element, so no leak there as of
> > > now.  
> > 
> > Unless someone calls the functions in the wrong order.
> > And that seems to be outside the control of this code.  
> 
> Could you elaborate?  The chain element gets released also by the
> destructor, dao_rsc_uninit().  And this is no exported function to be
> used by other drivers, but an internal one only for ctxfi driver.

The code is just too horrid :-)
I missed that when dao_set_right_input() calls dao->ops->clear_right_input()
it is just calling the static function just below.

I think the two 'clear' functions could be combined as:

static int dao_clear_input(struct dao *dao, unsigned int start, unsigned int end)
{
	struct imapper *to_free = dao->imappers[start];
	unsigned int i;

	if (!to_free)
		return 0;
	for (i = start; i < end; i++) {
		dao->mgr->imap_delete(dao->mgr, dao->imappers[i]);
		dao->imappers[i] = NULL;
	}

	kfree(to_free);
	return 0;
}

static int dao_clear_left_input(struct dao *dao)
{
	return dao_clear_input(dao, 0, dao->rscl.msr);
}

static int dao_clear_right_input(struct dao *dao)
{
	return dao_clear_input(dao, dao->rscl.msr, dao->rscl.msr + dao->rscr.msr);
}

Although I'm missing any other code that actually indexes that imappers[] array.
So I suspect only [0] and [dao->rscl.msr] are ever used??

Stanger things happen in the set functions.

	David

> 
> 
> thanks,
> 
> Takashi

