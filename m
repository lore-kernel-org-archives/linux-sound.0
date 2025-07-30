Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B371C5F2C
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 04:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753849302; cv=none; b=Olnp1unfQVoEIjYNX2JE5Xl49hgXZsBguU9OJJCvXONKGBMpqgVp3ZwD6IUptE48PTFOeGBHVYLN13Y7I2wH7PT89C7vGqEw/2q3I3mRMsIBpcOS9uSdVlp//Q8EFd9lHzht3dkUqrzP1PhGkCh5nHD2PZlmRz6Mlbjfb3IipL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753849302; c=relaxed/simple;
	bh=+yVIEwWI/pytYe+qFiWwkZsx+4eYlSH05Mm/XDATRc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWX0C+C6p9eI/HtEAURGvMxmNzzx0wu7OgNwdxjxfC/K2K7odtgASQM6Az0A1dp7jvCd9F2lmUF+Pcn/F5hXw6kjSXNJwvmwAiVeV6IDvtHIJNiLMorg1B6el9gGhWEkT4I75K7BHFEFSqm867T/t963m3ccDPEs3kVXUc2vLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PW4ffQOA; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PW4ffQOA"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so3560872a12.0
        for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 21:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753849298; x=1754454098; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6M9EqKm5huN0PkmwCjBhaBvdR1Q+MeBLJNqjDIEMaY=;
        b=PW4ffQOA31E41A1bTvqoVopQdHlQXuCj3j+jvy+lKrKX8LTdLKVYMxnhANqxZegi7g
         RUbNUDnAgl6lDnaBlW49qQxtKYu+TEJ4r6nbLlkfXHSd+7OCElG3zCjfa151NrkHYyG2
         8yk562dTkHtMvJiH0+9NoMcep/Ek8NufeyDg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753849298; x=1754454098;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6M9EqKm5huN0PkmwCjBhaBvdR1Q+MeBLJNqjDIEMaY=;
        b=nyDg2VveqNYieVSZKSx8oV4S14QkcN0p3ud4biApvnDUMv8AjXyCUrI/P8jrEaTdp9
         iM/l7PwpqAQrtC7aD4bCkn0vzJRxD4ejbwEf2XVWea4DYPlL4Fcek+a5eYbL5BBHvc1N
         zYhAs6EMy/N7jUszDdFZv4SLZJLOQFx69f4y4ziLZz2JUt8Lz9FVDXEfoNjMQn3DXJXI
         DfUN7tfZIdSGU8CQSX+J7mrIxCQgM6aRXy6LkdrARk6VbtyER8yqTOJKPe7OPfZB1LgC
         ncEI3hcJ5VUvJH+D/bzEZcrtnE0EA33wFgFTB8AYX2Qo26WP/01lXk6NdGyW9FFvDVfb
         ix0g==
X-Forwarded-Encrypted: i=1; AJvYcCWoR7HU9hcvavFX9u8CJL+6uhuzjEzGXrZN16wKIdbJNQgQdCCgXfl2tc4DuTf+KruAervU0+iu1Bfydg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyte+F/0jQrBwuakDhYXfW32UIjhN7EiyNkNM7XfJ/6OesKXTX8
	IqyeDNioUuqJQd24rpGdS+ARs+R3NmQDrSJ7UEQASnebph3k0cX5SsB1hDT3tRizevFcMqOrK/e
	5+8kY1oU=
X-Gm-Gg: ASbGncsjFS0ShKfWIe99r00nG01Z7Hhk5tSBPBiK38vF8e1ruN8Y9HQMnQwkmW2vz1U
	AE2OcrznscXWxdiElJUTykA+xI4phs/HIw0bNL9REq2C5V1rrw3LFN9Wwbdhu+u3MkWzcV29Fh+
	2pydZ86JSXq8hBpn2J267XxGX1aRpZ+w9p6/Y2GDbqRoVOKho5FS5auEAnal26xLBy1eA5R9juY
	biTACGe/g4F2tWhFiT5N2DGEq7SzTds1lMq7k7FMbhRsFW9LF+0gZz12e6EM+Hhs7QSHPrrZGsi
	Prvv/MFjzLGHqSBoS+fnRYpJracmfmb4g+X+5ITTJvuAcQj6lV1NNX75PnasTmpYWvo/HQ+1avk
	MgF6b7Kp60ao7iwVJOT1/VoyuhtHRFvvy910ySpsFvfgMDTsc6aLJYN1gxnjVgLFA7VGynbvI
X-Google-Smtp-Source: AGHT+IHrxkY49r/KjIgjKcOqeVrlB/TY4QQKQFOOFAmfNS0yPs5uqd0tLd0xYdW9AIcskM4lX+Xe6w==
X-Received: by 2002:a17:907:7ba1:b0:ae9:c849:fae0 with SMTP id a640c23a62f3a-af8fda6b1a7mr225653466b.58.1753849298372;
        Tue, 29 Jul 2025 21:21:38 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a6314asm687866166b.91.2025.07.29.21.21.37
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 21:21:37 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so3560867a12.0
        for <linux-sound@vger.kernel.org>; Tue, 29 Jul 2025 21:21:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX0jyea72mwoJ2yUXQ7LNc+3s0IR9QIbAXfgHgsnofwSSrA26f2he1gBin8pDrJxU2DZW7qRnWcTu67sg==@vger.kernel.org
X-Received: by 2002:a05:6402:1e92:b0:615:4c9f:f7cd with SMTP id
 4fb4d7f45d1cf-61586ec8aa9mr2125416a12.7.1753849297125; Tue, 29 Jul 2025
 21:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecu4idvc.wl-tiwai@suse.de>
In-Reply-To: <87ecu4idvc.wl-tiwai@suse.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Jul 2025 21:21:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com>
X-Gm-Features: Ac12FXzaCg0v1L18IAkSLioNqM5JZfdRDn7g4517txlEqP3wNFRnIiRiJ4NzmgM
Message-ID: <CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com>
Subject: Re: [GIT PULL] sound updates for 6.17-rc1
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linux Sound Mailing List <linux-sound@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Jul 2025 at 06:44, Takashi Iwai <tiwai@suse.de> wrote:
>
> This includes lots of file shuffling due to HD-audio code
> reorganization and many trivial changes, but otherwise there shouldn't
> be much surprise from the functionality POV.

Hmm. I suspect I have been bitten by this on my laptop. I no longer have sound.

I also suspect that it's purely because "make oldconfig" doesn't work,
and probably turned off my old Intel HDA settings. Or something.

Renaming config parameters is *bad*. I've harped on the Kconfig phase
of the kernel build probably being our nastiest point, and a real pain
point to people getting involved with development simply because
building your own kernel can be so daunting with hundreds of fairly
esoteric questions.

And it looks like this pull has basically made it all worse, by making
previous answers to those esoteric questions null and void.

Now, it could be something else - like a real actual bug in the code -
but it does smell a bit like just silly Kconfig noise.

My laptop seems to think I have headphones attached, and there is no
sound. I think it's some generic HDA setup (the kernel messages do say
"autoconfig for Generic").

This is my bog-standard Intel laptop from many years ago (Dell xps13).
I am seeing snd_hda_intel and hda_codec_hdmi, but it *used* to pick
out ALC3271 and apparently that just magically went away

I think that's realtek, but when I enable it, I get this mess of
"which realtek", which I have no idea because the ALC3271 that the
kernel used to print out is not mentioned.

This was _singularly_ unhelpful. If the answer is "just enable
everything because you can't know which codec you have", then why have
the question in the first place?

This whole "ask people questions that they cannot know the answer to"
is a disease. And then the questions then randomly change, that's
*worse*.

             Linus
