Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503FC36E493
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500742; cv=none; b=CMNTSt6EGgxde9hed06fUENQstI9pLbI/EJSDjWqUZA4EDCLzT31YblTgQKXuyS8RSk0yG3yfW/cGzgC7Mb82Wutg+CjKEpfjkjyWeCBMjSvhOLzHPLERFGq2FNUXGQgJ/du/1l5BfRy92IXvJJ5Hu6NLrnVGyUNz0n+u3SFCzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500742; c=relaxed/simple;
	bh=8ey45RphvLPjHisHLDV74NzOk8VRdI8QaE/vfYQ0Bt4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oOiUITUNlxaEji+fxRndfmn0VJEUGnftr01lV0OfuFXYjyAqq/8s4lPPcJceSnyzGMEttYxqrGV/IZPP6FudJA9yzz9tMdAGMycnl2VwMJMkr37ifC7G04Gcw6nmKqwNeA8pgPH4efGLbtk6UJVX6SpVYfxDHXZ047PM7iuc8t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzVi1LiZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzVi1LiZ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso50260505e9.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778500740; x=1779105540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUid33WwNB3Ws50Vag6k4HqB4RfPmejzhxTEDmPJDZM=;
        b=UzVi1LiZALmVFZSVM+/oG7a62XjYYB3kFrfloOZN6y86QzW22KgWFV6ebpjEIBkP9G
         8hRSy5bfw6LH1oyA67beWFE8+LX81r5j1jHI84ThP9X+aKF5KPFtz5Ra9+PfCkvHHGpE
         VpGTg0aRtiuezxMVNMmJdg2YDGh487iaXVu8NfhDX+rwW2mrQ6je1cuKmBVMCs1taQFX
         NSN7UBJkbn/yrxxsdl2/7hrQ5RS2wdYallu673gZ00OF3swbmbqDc9K9BXG355BYRCqi
         HifG2so49OK9YCr9AeG6z8o67YX5TOPzRyBsK0P0FSroyTfPGgRALpb8071marLVwSAD
         xCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778500740; x=1779105540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUid33WwNB3Ws50Vag6k4HqB4RfPmejzhxTEDmPJDZM=;
        b=hcL5GnGGLoXU4doJQFeCIp0Fk3MDU5sw5XgixFbN0t7GOXTgKUuik/KRxf862hh4EK
         jYri58wxRp8oejjmBTK7NgE4vP7Slrbpkczi7uOOpiJG2Ol7WXcG4OYtzSBMRYD1KvGJ
         lYwIbkdTvaTQUBfU+sYlF94KdJFd3NwJLy1QDqbRiniYNI+dd5rveoWM/Kx8tCo3INqH
         V+fB+3RiSJvqVYheHlFiiavpKJ164oOtlJZflVnvKonLWyTzuxWO1YVSdhDfi6R5vHWB
         EWR/SxYO3y2yARmqsaML8jR+nHibB3Ihd9snzSD7hx6pRNIZd5V99eLRqEGwgLEa4+ru
         3xZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9EdjOW+LNte91KrYUrvtGdfn1mooxTWDZT+CUK8z89OqKmuudpWoXEuEFHmX6knyAVhPx801UPt+CKNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyF6C1RInkEWZX8S5mPyixbQWQA0pK1vN04tlAj9yDQ7iUMc7RG
	J+wBNFumYf+qlSwTgT4BebeJmHPxeY1Oc9hStVMNI90NKuDynNy9iofZ
X-Gm-Gg: Acq92OHL9XbT10fWFw4sKgT5/zzFnsD8Okxem9G1psN2WPSf5vE2uFYLiHk4zBzAfVq
	anSvO2gjbig8+AKUqMNLifekHJuLpVQc4qiFt0rRnfz5jO1CU0mvdKPoFNxIbOVfsARB5oKTTWG
	hBn99Si9gf30TjNUXXKTJj7v7AzsXXmR9A116PQQ860NP0bL5iDHdkj947gms+4gb96WluDHo0x
	ppzGxgzunxwRlJ6qBtGVTmM5LtSN9WKFmkXkelPXtsCrtJOjwRN+P7j50k3v/0BamaSotjcC0XN
	1u0KmZg1///UH8lruhM67ksHuOfKHGwOETHRIGQ8oShxUnQjXAnoR1cvbaY8CSK5/lisrzFDkCc
	wOiyYD9TJVLNdXwMkd9To1ZZ5hSs91fJJbz0Rgxu4LHxbapnTBeAao6qJhC92S4J/p68JTH5bi1
	z8C3EdiTt1Jq3BgD31wV8M3agJ3EL3Pms7bKY6igJ++IhrKHDqzjIq189n8SYSwKKWP7lpWBY=
X-Received: by 2002:a05:600c:630f:b0:486:f893:56c6 with SMTP id 5b1f17b1804b1-48e5dffab3dmr285697095e9.10.1778500739428;
        Mon, 11 May 2026 04:58:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dafa61esm80172405e9.4.2026.05.11.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:58:58 -0700 (PDT)
Date: Mon, 11 May 2026 12:58:56 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Andrei Purdea <andrei@purdea.ro>, Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>, Geraldo Nascimento
 <geraldogabriel@gmail.com>, "Alexander A. Klimov"
 <grandmaster@al2klimov.de>, Tony Luck <tony.luck@intel.com>, Kees Cook
 <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-edac@vger.kernel.org, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
Message-ID: <20260511125856.3ff4cdfb@pumpkin>
In-Reply-To: <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
	<20260510230853.154050a2@pumpkin>
	<agExLK2GR0w0Z_N2@geday>
	<CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
	<20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 12:38:54 +0200
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, May 11, 2026 at 09:46:53AM +0300, Andrei Purdea wrote:
> > Hi all,  
> 
> Hi,
> 
> first of all, please do not top-post when replying to a public mailing list.
> 
> > Furthermore the one in versalnet_edac.c looks like beyond fixing a
> > buffer overflow risk and code smell, it also introduces a behavior
> > change (bugfix?), because the old code I believe cuts off the last
> > character from the copied string. (Because it was using just strlen()
> > and not using strlen() + 1)  
> 
> The versalnet_edac is innocuous because, AFAICT, that silly code is copying
> "error_ipc" into
> 
> struct rpmsg_channel_info {
>         char name[RPMSG_NAME_SIZE];
> 
> with that buffer size being 32.
> 
> So no overflow here.

So just strcpy(chinfo.name, "error_ipc") will be absolutely fine.
If you extend the string to 32+ characters you'll get a compile error.
It degenerates to memcpy() and is likely to further degenerate to writes
of constant values.

> 
> However, just to make this safer, we should min the size.
> 
> Also, Shubhrajyoti, why aren't you padding the rest of the name string with \0
> *especially* since you're allocating it on the stack?!
> 
> IOW, this (totally untested ofc):
> 
>         strscpy_pad(chinfo.name,
>                     amd_rpmsg_id_table[0].name,
>                     min_t(size_t, strlen(amd_rpmsg_id_table[0].name), RPMSG_NAME_SIZE));

Why isn't that just:
	strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name, sizeof (chinfo.name));

I'm trying to remove all the unbounded strlen(), getting fed up of code
that does strlen() and strcpy() of the same string.
If you want the length, get it first, use it for the size checks, then
copy with memcpy().

-- David

> 
> I still don't like it because we're noodling with this string as if it is
> super special and copying it back'n'forth just because this rpmsg is
> MODULE_DEVICE_TABLE and apparently is used to autoload the driver or so...
> 
> Why do we need it?
> 
> Can we simplify that gunk there?
> 
> Please have a look.
> 
> Thx.
> 

