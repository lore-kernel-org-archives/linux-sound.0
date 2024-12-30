Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D5EDE;
	Mon, 30 Dec 2024 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735582318; cv=none; b=fZ8304a2sJbFiVGzER1+brhCW6tCj4ECkmFPdeohGB4FiM0dusyEj/61y2BZXJXR6ecAVMWP3Uip/TcZj1rN5uV1d9DfWN6XKErqQ6X0trKQa3WlFPvC+FjrDLG6topqSgwzjrOPviXK3vLXf9dNY2bqByxEZjKxCUwme+OH1Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735582318; c=relaxed/simple;
	bh=MVArodfS5w+b4CvOqbD/Hp7DbR57FHTgGOff7tEfM9A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDBO2YaI/6mzju8qdA7NRvAnnRXpEqZSRX486lRwR+2HjzjMQ7KEtrcy7hP8bCwXP2VMHsGsXsWnabIyRASUlxOxMwYk8blxOD5Z1559R5ElMGLlX40I3Cki67zdduOC7v+CE1D2FqwBRTvsFvBHB0yC9l9KVjqIOiHJ/wnMf6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOaQmhtk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOaQmhtk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436ae3e14b4so5201395e9.1;
        Mon, 30 Dec 2024 10:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735582315; x=1736187115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FslczWmoucE7Z8PN6aTEMA3U1UXoxSCas5OmxESQam0=;
        b=XOaQmhtk5fCbKDOUKWS3+lkqhPqxq432tFdNMScU53/kuX6pIY5adapcG1QsoUP9R6
         dBZ8zPreOKN0KazuWhtjwy9AaMiVLNc+Syi3mDv72zeFbPoJCFFdMb+yGuQzISGtRpA+
         SgpoWzgb2nmERQNxMeFN6Yug7Dtxs+ME/24RheVZTWA2/fu7GhDZ5U1DKOAvZXBbikfH
         XYGoELUaOC7jR1lpG7ac2hcWZBbkK3rJlsTROQgE4K8eZSNAICFLXp2dV9Uvf/Htr+Yp
         2vlBuYZY+b05nn1zPndA9cgoJJ3LlU/c8J27/HIkRMAR7lsF6/wlZywnWrM4cf/YaPtj
         8AZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735582315; x=1736187115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FslczWmoucE7Z8PN6aTEMA3U1UXoxSCas5OmxESQam0=;
        b=O1jSqhRNf1208Bve3QydZGKtAfafXTP2d+fojNP8ORLqR/Or02cn89e//Xyw1E2wbu
         16L3oLSWyuwKJSk+jtTwwNACSHkCZUAh/8kmoMjvRxf5/kvxdf19wr9KSnlX5tPntEi9
         EeH5gmvkne5MOweK2eY3SLBxhHNSz0wpaBFSmcsrlWaoHqi2FCUMc1yWSGEPuWcSvCYK
         K1Z6+xKv0ORSxYHtEdGoFDx+jeK/9DCXUHfZSpQBXAREb46CLAt8RJVi7SBXYy8Lb5mx
         rWKM3C9W5pwXeBPaWmUbkR19tjC/hezKegNILzdy1+iyGml7MomviY4AN9Sr1zEiT/DJ
         HFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA62l8cwNf5wKJtmlOzDyccB+ssH47AY44zGYq5wjG3HIZaaPxRhvHe8aCbHAKtPdBGmVC8CH0VfEWZrk=@vger.kernel.org, AJvYcCW3VXsf4ocJSA9HYH+2nko4QgrH5L44zb5V1mqpF9Nh8bq8oSPRKPVT+j7Tj+LJvjlH31WodR4/HdMbf/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+plmuww/aHaPjNpWckZeR0k7aw+M5yl6UkeXcomzldEUjikWw
	qJ1s0/rH0qgrOPu5/ueMbSdQVSUi3j42KeDYJ6qqMHyXIPXyJbpt
X-Gm-Gg: ASbGnctdMA3S4plKRLw3Eb4qv3yB/JmQT12K920YgVjObcvQLOwbtk6Yr9i/lHMfLgg
	xxJfwjLpD6yflmDP1/KpkoEfCKLIhUMJejA/peQhWqouZuhT1RgVHGtr+yg2iblnV0UH6hTn6GO
	t6rbCMLpz7tjjNOQajyfCdrLbLuJA/sPWlnYrm5KKDzMyrOOPbdYKJZ7CxQqbNfmYZ+SfRf3Aho
	ioHw+81a/KCV+v/PRW8kF5p0kpKtMDvw2MlhQAwANShoyKm2oWXID27shs5G5Aqn5bLWN/zhymj
	/mt6ysvf6cKBNRQwhMGuX/4=
X-Google-Smtp-Source: AGHT+IHA+LHWzOYLGFa+v1IfDBlzu4LFfu1asbS+SWmW/kWIThAbaJpPkEGailGZaeghd5hIoJpPBw==
X-Received: by 2002:a05:600c:4f51:b0:436:1b7a:c0b4 with SMTP id 5b1f17b1804b1-4366854850emr241653985e9.1.1735582314427;
        Mon, 30 Dec 2024 10:11:54 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2f9sm31430376f8f.81.2024.12.30.10.11.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2024 10:11:54 -0800 (PST)
Date: Mon, 30 Dec 2024 18:11:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: tiwai@suse.de, tiwai@suse.com, perex@perex.cz, arnd@arndb.de,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 ryan_richards@creativelabs.com, wychay@ctl.creative.com
Subject: Re: [PATCH v2] ALSA: ctxfi: Simplify dao_clear_{left,right}_input()
 functions
Message-ID: <20241230181153.7a825fa7@dsl-u17-10>
In-Reply-To: <20241230153243.2874102-1-ethan@ethancedwards.com>
References: <20241230153243.2874102-1-ethan@ethancedwards.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Dec 2024 15:32:58 +0000
Ethan Carter Edwards <ethan@ethancedwards.com> wrote:

> There was a lote of code duplication in the dao_clear_left_input() and
> dao_clear_right_input() functions. A new function, dao_clear_input(),
> was created and now the left and right functions call it instead of
> repeating themselves.
> 
> Link: https://lore.kernel.org/lkml/NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com/
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> Co-developed-by: David Laight <david.laight.linux@gmail.com>
> ---
>  Changes in V2: Fixed formatting caused by email client. Sorry!
>  sound/pci/ctxfi/ctdaio.c | 50 ++++++++++++++--------------------------
>  1 file changed, 17 insertions(+), 33 deletions(-)
> 
> diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
> index 83aaf9441ef3..d46542d0b454 100644
> --- a/sound/pci/ctxfi/ctdaio.c
> +++ b/sound/pci/ctxfi/ctdaio.c
> @@ -211,52 +211,36 @@ static int dao_set_right_input(struct dao *dao, struct rsc *input)
>  	return 0;
>  }
>  
> -static int dao_clear_left_input(struct dao *dao)
> +static int dao_clear_input(struct dao *dao, unsigned int start, unsigned int end)
>  {
> -	struct imapper *entry;
> -	struct daio *daio = &dao->daio;
> -	int i;
> +	struct imapper *to_free = dao->imappers[start];
> +	unsigned int i;
>  
> -	if (!dao->imappers[0])
> +	if (!to_free)
>  		return 0;
> -
> -	entry = dao->imappers[0];
> -	dao->mgr->imap_delete(dao->mgr, entry);
> -	/* Program conjugate resources */
> -	for (i = 1; i < daio->rscl.msr; i++) {
> -		entry = dao->imappers[i];
> -		dao->mgr->imap_delete(dao->mgr, entry);
> +	for (i = start; i < end; i++) {
> +		dao->mgr->imap_delete(dao->mgr, dao->imappers[i]);
>  		dao->imappers[i] = NULL;
>  	}
>  
> -	kfree(dao->imappers[0]);
> -	dao->imappers[0] = NULL;
> -
> +	kfree(to_free);
>  	return 0;
>  }
>  
> -static int dao_clear_right_input(struct dao *dao)
> -{
> -	struct imapper *entry;
> -	struct daio *daio = &dao->daio;
> -	int i;
>  
> -	if (!dao->imappers[daio->rscl.msr])
> -		return 0;
> +static int dao_clear_left_input(struct dao *dao)
> +{
> +	u32 offset = dao->daio.rscl.msr;
>  
> -	entry = dao->imappers[daio->rscl.msr];
> -	dao->mgr->imap_delete(dao->mgr, entry);
> -	/* Program conjugate resources */
> -	for (i = 1; i < daio->rscr.msr; i++) {
> -		entry = dao->imappers[daio->rscl.msr + i];
> -		dao->mgr->imap_delete(dao->mgr, entry);
> -		dao->imappers[daio->rscl.msr + i] = NULL;
> -	}
> +	return dao_clear_input(dao, 0, 0 + offset);

I really wouldn't bother with the temporary variable.
It is also a 'length' not an offset and you can't decide on the type.
'unsigned int' is fine.

But I suspect it really is worth checking if that *imappers[] is needed at all.
(Rename and see where the build breaks!)
You might just need struct imappers *imappers_left and *imappers_right to hold
base of the kmalloc()ed block.
At that point the functions collapse down even more.

	David

> +}
>  
> -	kfree(dao->imappers[daio->rscl.msr]);
> -	dao->imappers[daio->rscl.msr] = NULL;
> +static int dao_clear_right_input(struct dao *dao)
> +{
> +	u32 start = dao->daio.rscl.msr;
> +	u32 offset = dao->daio.rscr.msr;
>  
> -	return 0;
> +	return dao_clear_input(dao, start, start + offset);
>  }
>  
>  static const struct dao_rsc_ops dao_ops = {

