Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBAB7FBD5
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708538986; cv=none; b=S066GlekR/Ypr3m/Z3nPriDwN/iYQ4L0xexxBpyvMx6AKX5MT0yiBU62cSRnf7dwr6V2X3GWSWQdwR/lwIdzYOZHVNqD45G1erTY/voCxJ71b0z8XAeUIjk7JBdmvMkW6TBeC1P1ptsXKsTzwDep3XXySmXs8x6WO3UrtN0GYsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708538986; c=relaxed/simple;
	bh=grrfvhq/I/smGmWB5qzlUYdKDiOv1OWKxpRbXWWlGhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6OUJ2cFDEV27lJXJuSEEwlKT66I2LZwJQivN6fvP0DTs3mODiOJ76YW6cvP/odQrtW/Qd0E3/wow9xk6sjoqtD5BeZjRMDU/DgwA9VRrE2Qt+sZeNT9cGN8ThjvlfVh3CdLU5w8RqxtG4YRNUdgHbCw3B92zmNZI0GERs0ZMXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ApCv9GGK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ApCv9GGK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d2710f3acso30914f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708538983; x=1709143783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4dcAwM4JyllE93PmauYjgs8AqmntaycEy/T8qi1rzI=;
        b=ApCv9GGKZADiveqmayBbVtj6Qxx1ZI6Mj0+qPestgA3INLIBt7dC9ge+FLn9iZX4Gt
         p8PyJFBVNlbUgKqv4TC+6kBTMz8TK1ZFnyqGR23ibc29ln1tuxWksFtxXpXLGW5jaKUQ
         uo9RacETQly9EgytsOm5bbp0KYXnp0beWshpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708538983; x=1709143783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4dcAwM4JyllE93PmauYjgs8AqmntaycEy/T8qi1rzI=;
        b=ZzYxXtjvsiZgwU/q6aqdFY2IzfZCieWm9pTApqPgmZY+v4NZxzD1msRLA1KOR7skle
         Pb7mNaQFrJ3H8C2ZoVyEH8fwX35uBhVbDSM+wQRFuK9aZgMIleOqszrf0ZZrtac82xjO
         aeEI6e3LkuJLFK3bQNYgfiyUJXAsQ3HkVJ+XGniZlw+hZbXWcin/MuPLZUVbBLIXxDzv
         DBUx+J/KhRiZGT/TU/NareqbQLRGc5Ugz4dBARzM5t3ryy2eVKuM3P3t2XvfosA4MjLn
         dmGzFuw0Vvsecr2YVtY361Q7mj6WoV5HMynwGa6aNVzhG1cFNqwIx5U+g1rLRRM8LBga
         0sAA==
X-Forwarded-Encrypted: i=1; AJvYcCUDP1YakIiH5kphaG1OziJ3GKLKzpApL4CLgy8PZi7ScjRSbTxk3GXbSSMdiw8Rl50F30NOH88BFMTG7/IQ7D8osG8t8UnXWVPm52g=
X-Gm-Message-State: AOJu0YzeyzW+8AuVNT5Qjtp6e8MH0EHNYfCW6IKH/+eGAU0KOmUf/fwf
	rT3472EYdEo+xqRhLvEOjOO3cpmfdUmEH9/paNCP5d0niy6w+My3JxNYEB9a8hK4zSDqEndNc69
	MiPX43DGqXGRLl941pV7bU4OE6rIBEpRHdXf4
X-Google-Smtp-Source: AGHT+IFp5GswcTDnt63ehzKUWM0iZnqUh33RNzAL6UDlpBfaG3Tt1H2BLB9L+vrnOJHGI+GUhHT0D+UrAl0uxg8/aQY=
X-Received: by 2002:a5d:526e:0:b0:33d:2872:2437 with SMTP id
 l14-20020a5d526e000000b0033d28722437mr210389wrc.31.1708538983498; Wed, 21 Feb
 2024 10:09:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214170720.v1.1.Ic3de2566a7fd3de8501b2f18afa9f94eadb2df0a@changeid>
 <20240215034528.240-1-hdanton@sina.com> <87h6iaf7di.wl-tiwai@suse.de>
 <CAG-rBigFG-U-sKY77CvzghGzs+1Xm3YXzBF6N4ti0+h6UdAb8Q@mail.gmail.com>
 <875xypk6d6.wl-tiwai@suse.de> <20240216043426.1218-1-hdanton@sina.com>
 <87plwwiz6z.wl-tiwai@suse.de> <87frxsiueo.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2402161246520.14041@eliteleevi.tm.intel.com>
 <87zfw0h3lu.wl-tiwai@suse.de> <CAG-rBihE31G1q0pXbdR22bHKNboiADTUHx0JMnDKBg_sua+0RA@mail.gmail.com>
 <87le7gog4k.wl-tiwai@suse.de>
In-Reply-To: <87le7gog4k.wl-tiwai@suse.de>
From: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Date: Wed, 21 Feb 2024 11:09:32 -0700
Message-ID: <CAJZwx_nw1H0+YP1v7AHwjb9imY+RqaN+6DpNXQ-Ud9Q_A7rqHw@mail.gmail.com>
Subject: Re: [PATCH v1] ALSA: memalloc: Fix indefinite hang in non-iommu case
To: Takashi Iwai <tiwai@suse.de>
Cc: Sven van Ashbrook <svenva@chromium.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Hillf Danton <hdanton@sina.com>, LKML <linux-kernel@vger.kernel.org>, 
	Brian Geffon <bgeffon@google.com>, linux-sound@vger.kernel.org, 
	"Arava, Jairaj" <jairaj.arava@intel.com>, Curtis Malainey <cujomalainey@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 4:19=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 16 Feb 2024 17:22:45 +0100,
> Sven van Ashbrook wrote:
> >
> > On Fri, Feb 16, 2024 at 9:43=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wr=
ote:
> > >
> > > OK, then how about the one like below?
> > >
> > > This changes:
> > > - Back to __GFP_NORETRY as default
> > > - Use __GFP_RETRY_MAYFAIL for SNDRV_DMA_TYPE_NONCONTIG with IOMMU;
> > >   this should cover the commit a61c7d88d38c
> > > - Also use __GFP_RETRY_MAYFAIL for the SG-fallback allocations of the
> > >   minimal order, just like IOMMU allocator does.
> > >
> > > This should be less destructive, while still allowing more aggressive
> > > allocations for SG buffers.
> >
> > This one looks like it would keep the SOF firmware allocation issue at =
bay,
> > in both iommu and non-iommu cases.
> >
> > If there is no further discussion in this thread, we'll stress test thi=
s
> > on iommu and non-iommu Chromebooks.
>
> The test with my latest patch would be appreciated in anyway.
I am not sure if you are still interested in knowing the test results.
The original indefinite hang issue is not observed with your latest
patchset. This observation applies to both IOMMU and non-IOMMU cases.

Thanks and Regards,
Karthikeyan.

>
>
> thanks,
>
> Takashi
>
