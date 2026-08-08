Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75933EC81B
	for <linux-sound@vger.kernel.org>; Sat,  8 Aug 2026 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786194248; cv=none; b=Gp9UPmAUfMby/vgfHb6wTQ3q8FrVkajZmAkoE70j0oUdkzVuM0SZKQvHayspEPo2+e+mn05v9LFR8yVxnXBJ2+AFcO7hsaDu8jZRjHGBTv60NWVWpfitAZJQjtNXB/oybnfFJJJAE3gWfo/lHGWXmT6RUqMd0q3uD9j0e4YzXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786194248; c=relaxed/simple;
	bh=pPO+Z6bwoX10MG1Z8ii2+Y6MoWoAJECq+PxdJgg0Y6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kJ+a/qy9E2c6IRTMTI0SUA2SwQJtAZoxj9B3fL6/M81/Luo7kExkkfUL6xieExy8zw1FjVynXEWJuqbmCjXEJyCqi2wr1mTeb6wTp6isMhhDYPR3OwK3uoDdmfjxpOO1E0f7EC8lXHciFJskPQZJ9v+9Y48/2Uo1gqW5ht4HD84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG7HKXIG; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG7HKXIG"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47db714766aso1704427f8f.0
        for <linux-sound@vger.kernel.org>; Sat, 08 Aug 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786194243; x=1786799043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gk/P1QwaJrQ4JSmGI/ZGfhPo+g7crElZoj/gCPNRdKc=;
        b=dG7HKXIG32zAQoDGYHhcZYvgq6akIV1byyKTnIdAQr6+hmyN3yR3D6SrbiuU7IyO3E
         6B3FbE3lsl0CozTun5ACIR96PNsSaoLOOLIhl4CZxnJpkslxWwzHwN+WgSqKrIcfE5ra
         luR9ZAI837N1tQSSab1VZhwR9ZSERTTrH5VDWP9unOzY+H3JoEcxya28/VYsLa3b9UeT
         x6tWMzWYAanznWiOersCdIte48bEWfK3K7qJ9J8exo6//ptnbMRk1+SWb/HiPIcTJ04h
         mVxgu7LXROa/lg7b94enzw/pX5w2sIuskTchEpRql77x+SkXbI65r0T1VGAxIcqslqdV
         poDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786194243; x=1786799043;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gk/P1QwaJrQ4JSmGI/ZGfhPo+g7crElZoj/gCPNRdKc=;
        b=h1r4UfRcnoUWObNXyqMWpbr5iE9E3FXyao8WBLLDwsx1sWmKVIlIZD8NCVtz97+Xvi
         EtaPAQ6K8o4H0FqeVhavkRa/sxDSUTwtwTvsMWz0CCynn+ckhi2KwBjxNN/tNxjtAFZA
         LdqyGt7GBxKuAQLEDhZHG8XPxmLN7NRrSBtjMLWGcf63PYeWSXzeNJqnod0VZRsO7jZQ
         F2YydB3KGrkqcGNhF6ga+pJ0RU8XiTzIvMuMeFdSNSFbiyqq8CaVX41OsmZSdomu+AD9
         6tvj4qspC6ASA8P32/HZMbBTNQZZOB3YWR/6DKClmHWdGpg+5gHLtxFrMOBnIBkEFKbv
         eb7g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Gn6UyjPEw+H9O7uqilU7DHjrAHOA2UQbG/FofRmnXnKW0XgF03MLg2HSGIKbEtcThuVz1EhTri1TdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUm9lVu6bL9Y1VCqFv4CPXJyHI/l6mhIbVDgohK5WNivXqr4WT
	jGj1xCaVDkIfnpJnSDEW6qRcdEAQW72lzF789gXCRM1oYqliNDm5ZEzs
X-Gm-Gg: AR+sD13Tp26FLNi9jW+T30cYnbpujwPsWx9Ze2yznU3Q/LhMfzxAepw2Hu8UPbP24Ut
	hHl2+zm7bWKfv04ACwRuM614lgLKJTmdhUo/0mejvVyQ8Asp65kv2GCAVEK2CPcZheFiUa8Zp1C
	cR71SBlL+BA44/xCp9ZEnobt68D6Vi+rDxeYfiZXN+ZgM5dN/cD5CXS48X9FL5vytAssw1pnoab
	nGkV0VbBQZDPCQhpp7FL57D+YkjYR2uNlwXzyUgHBljKvNCPEZsuojhCmEStecpDQYXAgSaj00R
	Pn/mdavAndGP8AsMbiSVQG9oxQFklq+0HxZj1JLgo3MnSkm0kR+boLt0SQu/pYUmjQpiEfUl+v0
	CW7zHsn7R24yZeEGA4M34rGunio+jymBfc/y/GQxRQ5l7f7a6e0zWkkkv+3+W7U643WfFrd7jIH
	T5Cb3vP3KlowBflEH5TBQQyCnZ9xCVqjWvFOPRG8dIkCXVnoAp0OiZywJi4SV4meeUGWrJdOLPA
	omz2Gs5cnF9ZiVKQb3xSFPV2w==
X-Received: by 2002:a05:6000:2889:b0:47f:90f1:68c8 with SMTP id ffacd0b85a97d-48131915e4cmr7384863f8f.1.1786194243024;
        Sat, 08 Aug 2026 06:04:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021501bcsm14698089f8f.9.2026.08.08.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:04:02 -0700 (PDT)
Date: Sat, 8 Aug 2026 14:04:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Mahad Ibrahim
 <mahad.ibrahim.dev@gmail.com>, Takashi Iwai <tiwai@suse.com>, Jaroslav
 Kysela <perex@perex.cz>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ALSA: remove remaining strlcat() users under sound/
Message-ID: <20260808140401.485a84de@pumpkin>
In-Reply-To: <202608071442.37E40CEFC@keescook>
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
	<87jyq2azz4.wl-tiwai@suse.de>
	<DKITQMNPN2I7.CH00E8CSZMXI@gmail.com>
	<878q6hc3yp.wl-tiwai@suse.de>
	<202608071442.37E40CEFC@keescook>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Aug 2026 14:46:44 -0700
Kees Cook <kees@kernel.org> wrote:

> On Fri, Aug 07, 2026 at 06:03:58PM +0200, Takashi Iwai wrote:
> > If strlcat() were super-dangerous, it's understandable to drop.  But,
> > it's not, and issues discussed in the github are minor and something
> > that can be addressed in strlcat() implementation; that is, can't we
> > rather re-implement strlcat() in a safer way, instead of killing it?
> > 
> > Sure, there are code calling strlcat() that could be optimized better.
> > They can be cleaned up.  But it alone can't be a reason that strlcat()
> > must die without mercy.  
> 
> The risk comes from the compiler having no way to know what the size of
> the destination buffer is, as the "char *" argument has no length
> associated with it. One thing we can do is change the argument
> requirements for strlcat (like we did when designing memtostr, etc),
> that requires that the argument explicitly be an array (not a string
> pointer), at which point bounds checking can be done.
> 
> Usually this requires changing the plumbing of arguments, as a lot of C
> code is used to just passing around a bare "char *", etc. And if that
> re-plumbing is going to happen, it might as well be seq_buf.
> 
> But yes, just replacing it with strlen/strscpy isn't very ergonomic.
> Adding the length explicitly with strscpy certainly gets us the bounds
> again, but it's _separate_ from the string still, and that will lead to
> mistakes too. Better to have it be part of the type (i.e. either an
> array or seq_buf).

And, if the destination is an array (where the compiler knows the size)
there is nothing wrong with a 2 argument function.

Like strscpy() you want any result to be the new length of the destination
string.

Embedding a fixed length char[] in a struct can be a simple better option
and lets the compiler do a lot of the checks for you.

	David

> 
> -Kees
> 

