Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235626ACC;
	Sun, 29 Dec 2024 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735469847; cv=none; b=VLqEZYo86+878FdLNXbuOFn9nswTem+V5e1kbsU6FwIodCjkx0xywoBFAdmk9plgAvHIoV7O1VJY03ld8XIs0fRKsktt+PF2OI5KXf36BHuNLCc/tzvlS1uZWj6//3YzvZ9psFXEOc6ZQWUBkbcqhmG8UrrZ5HNrpCrWjoYQSRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735469847; c=relaxed/simple;
	bh=4Eozzhdl5L/0zPIM1vRD0RuQBaLccXlErOHhaFiV1tA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D1Tss6Nc3d8LInfkqWe+eq1B+lV/VdmT377nanmv/5GUuxDQVCioTLEdMTJYUr3HzEQIe6HkkG/imYxB3RPDtOx5O4lz2vN6L56QLcEj2fNM2R9umbjx5G8VqR353YualbFCbrJPgpXKwwkoJeOkQwHCxgX2bO9/hRHjMbYALbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Icqptgf+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Icqptgf+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385eed29d17so4059142f8f.0;
        Sun, 29 Dec 2024 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735469844; x=1736074644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+o4tT17esxM8G7HzSOewSg++in1i/RxP9Ehwp1HsWjk=;
        b=Icqptgf+n++he09XyLZe3xYKt5YxGQ6eqwoy5gsolDRcYkZGgMiZYia1Wep1ys2N62
         Gxt//NQZm0Zh1B7o1fMp638DmFrtz+2Dl3Xe/sRy2/B++Z0Y8Ogv7A0tmGnSM5BokMmX
         gKyzVXbcPXPiSh/z7JOyomIhfSfAUKmXBQwFQv4lNj6La4aR0PHalzqrY0zoUeesv3jq
         57WC1qkamsxBm6rxyT50u2VlLSX/bvHwnBi6r7PSkF1McSPqzivCb6NyRQzwsex9L1Zu
         tzH94SRxRlTMv6EuSF/oyswU/lyITveJdxk8qsQ2oCPt+BUT5wt7vJAytwfTX0rXLEZl
         Ui4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735469844; x=1736074644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+o4tT17esxM8G7HzSOewSg++in1i/RxP9Ehwp1HsWjk=;
        b=PEAqug3rHTr/Z7dXR8SpMcrfC72pC5GJFxZFEHNF9USjX73RJuPSqyagWDOgpccEdf
         xXk1FNWGTqKoQYYYfYr/pX6gYIA9Q2oPflttA0cOjsdy9EF2FQQOc4uMyBpWjACZdYc/
         SuCeUzz4gIrDExBwK+R+DJT1C//n3Xb7wj39RXHfxfqmKiROpEQr0MgudgcIHAjZfJzU
         X5h0+haAtes4LmDtY3PfJyEVqFJzLzx5BlS/uznBjaW5ap9ihYo4dA/U0GLcKcQdP7VV
         ZT9pQa5Rg2dLrRHoiZi65btPfSohl+nI31Ke5lqfrCXVs1MqkqzpTPTCB8OnspeeoHiA
         357A==
X-Forwarded-Encrypted: i=1; AJvYcCUiCDILU0t1qD0gf4tGQ9rS8IPbuKeQ5NBIq0nM8dR7/sB+2WNk30jjrZvx6G+J1WZ6yBXvSsM4qxagWW8=@vger.kernel.org, AJvYcCW7i/iz7sIkw6pBpBM+dQUHtP0bMf9uRu32/0kY9gVw3b/zNC5PU8coXZjJ4UXhbW+fQ8+L+swno/frA/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRLf7VsBF6s8v41ht4JeJnyX1luBG+FA4a17sUmh5GYIcJ/yi
	gaVL+xjzHgmoNr43hdfdMaiKXe0xYYU8K2+f1/Rf9mK2InAePCk+
X-Gm-Gg: ASbGnctR7vmbzT9BbKAagnFQebl5Q+7qxKv6fYgjg1Gao8pvG2zY2Y+wwkl3iFgTaln
	Z31YacFF0p/J29LzyblwRjhDKjdfOmLtpZuJdPFJYL/Ib+QViRfFypp5VlAaREnO6Zt8se/eZII
	BkxawsLfMt5FdENdQcfOaCB4kjYBFi9YagReapE9eFN7b0lg789Ur6QELMgAN2r40T4HuCsn8g+
	oZY4IoVZBb3VqCsOy3hbV8F3GUCUoVVOPnQuBmeqEbCew3D32L1s80l/2gG/idXbuq6VezjwM8Y
	S7jltCgjOZAznvg22u06a2E=
X-Google-Smtp-Source: AGHT+IEIIsx9w3o8AZgSBoMB7+O0c3kqmkWAuoe9FDHuSRTt2KC5AAsvu+8sMtlEEWkbEbHnJa9PCA==
X-Received: by 2002:a05:6000:2ab:b0:385:f2d2:2ef0 with SMTP id ffacd0b85a97d-38a223f723amr21615745f8f.41.1735469843471;
        Sun, 29 Dec 2024 02:57:23 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e219sm27450002f8f.84.2024.12.29.02.57.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Dec 2024 02:57:22 -0800 (PST)
Date: Sun, 29 Dec 2024 10:57:22 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
 "wychay@ctl.creative.com" <wychay@ctl.creative.com>,
 "ryan_richards@creativelabs.com" <ryan_richards@creativelabs.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: sound/pci/ctxfi/ctdaio.c: duplicate function removal question
Message-ID: <20241229105722.03ada34f@dsl-u17-10>
In-Reply-To: <87frm6dfda.wl-tiwai@suse.de>
References: <NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com>
	<20241229090228.75f8a3ba@dsl-u17-10>
	<87frm6dfda.wl-tiwai@suse.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 29 Dec 2024 10:10:09 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> On Sun, 29 Dec 2024 10:02:28 +0100,
> David Laight wrote:
> > 
> > On Tue, 24 Dec 2024 23:16:17 +0000
> > Ethan Carter Edwards <ethan@ethancedwards.com> wrote:
> >   
> > > Hello all,
> > > 
> > > First of all, happy holidays. 
> > > 
> > > I was browsing the ctdaio.c code and I noticed a lot of 
> > > duplicate code and functions, specifically:
> > > 
> > > dao_set_{right,left}_input and
> > > dao_clear_{right,left}_input functions.
> > > 
> > > The functions are pretty much identical. They only 
> > > differ in the side (left, right). What was the original
> > > idea in doing this? Wouldn't it make more since to just
> > > have an ENUM (left, right) as an argument that would 
> > > determine the side and just reduce the function to 
> > > dao_set_input and dao_clear_input.  
> > 
> > Hmmm... you'd have a lot of conditionals inside the function.
> > 
> > They also look like a memory leak just waiting to happen.
> > I guess that an earlier implementation used a separate kmalloc()
> > for each imappers[].
> > 
> > Why is imappers[] an array of pointers not an array of the items?
> > Each is just 8 bytes plus a 'list_head' (2 pointers?).  
> 
> AFAIUC, it's a setup of a chained element, so no leak there as of
> now.

Unless someone calls the functions in the wrong order.
And that seems to be outside the control of this code.

	David

> 
> I agree with that the code is unnecessarily complex, though.
> 
> 
> thanks,
> 
> Takashi

