Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B82724B26
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753894223; cv=none; b=ube1MkbVWYES60iexznU81jt+26AeKlTJYr3wmZ2jzEq8LiBD01ATThY3+5HxZZg5dYHDicjHWwkLKXUN8q/caP8Dyl3+nIW65i1rUmVYPFM99VTLnm+5kgDNlhfv740mG/Vk55l6Ne/AzXBxwICLuPKTaNgtdMLcz+whlxLXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753894223; c=relaxed/simple;
	bh=9dWTRXZaJPCq1JtfMK5xMNGaI4kHGmvqX/UGrLCtlVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LyRFMOdMT6PzzmQlaNRkA90tg8Ax3b9gHyPjf5T+o7azTqsyZsl1m0hnXpDlYKIeKF6WZubMBwB3CpXsITJWFWts/8sOJzc8sXWBJKRJWmWtsMT8m2gJncJFm+0m1j/3D2xtkJq8MPXXJuNgIiDe3l2ylzyXVSpWu5Heehkbu84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TPpEQoRc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TPpEQoRc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae360b6249fso1284222066b.1
        for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 09:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753894219; x=1754499019; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hhW6h1/+S/ULBh1mEzTRJl6Vdbe8H6LqlY995wIIFZ0=;
        b=TPpEQoRchnkA8O/f8oQaVK/Sj2uMlYf+dWUkIEg+LnKSIrMFf58TrCNKUSDQrDFezl
         cW6bsVvBPRH+Slo7xWZ3+CHK1XBy3EyHqmAdUjysmM9p1BfKh4Lq2tVim83PTp1mrr5i
         8j2gwXCP+XkQvpYTE6pnmSHGcYE5UsntZgDys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753894219; x=1754499019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhW6h1/+S/ULBh1mEzTRJl6Vdbe8H6LqlY995wIIFZ0=;
        b=lMhdW5F30pCvrXQSo2j6adkLdP3JAqphPy9D5m/PTpN8ntLipQ1I/Q9VmpdA4B1XHR
         Onxtw9uYcLT/g6hIbA5lO2/7yhFVXvQGcD59OFK2CZbJafAC9WhF2b6zMaoeIjXfPQUA
         4SkbOE+Yy8fIMh35uHjwWyzbxcvO/TT2yGx7Oug+UAiTZKRhl81PTdIWiqFmY/E+NUZu
         orVQVRdur8sFAMjORBBsmZ39nm0bRTH7lVcDGhiHczTfAJCjM0ePzvPMUwyfxJaXPzPj
         iCN3YOhUAjbHLx01grACmLTvmsz3UIRPpK3E27zkFeCDhfW2XoGDm7sbKvXCi7af44Ok
         L2fA==
X-Forwarded-Encrypted: i=1; AJvYcCUDKCTphlhBkQbCa0sephllIKeDKTWseZc+Gl3Mrr4FXzQUyzaRDFFVGXcZQ8j/QQ7wxYhpHJD/76Hw0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpL5gNuYzrc5OtQYQGu9j15qtedlaYtUOWbPBrv00j4NFs6ZqJ
	UENqtYedPXKUm1ZZgzMkf8/Pu6uVTQEwS6YiZvcqHxdNSfvVLVZK8y1RG3hGvwvcZhrpIcg1szH
	yxNCYjbU=
X-Gm-Gg: ASbGnctDi2+EBUBuz5e/iN//KiuasTvMwUG6kPV1WUBZ3PBX6mRtAXgcdpBCGzigzRc
	PcUXULXCLURa0O1/mVApWiVgEY9s3MZtD2ED4eYAI5hI2ANffx9/y+0W5A8e/a+UUQZYayGLMFb
	M+Fh9O2UaGXsNZk9Pyq+H8VysYkVWSjgbNx1u9QXyZ1xKXl6t2hrOji7jc+BEun07KG1p8gTdG/
	2fELtUfvaP0TdLOQsZI5+fL9MUgFhGmkUf5NkbGajhtdzZ5/svjnZ2KJQXDLFuK77KdE9nGVYcN
	fje2lJLQi3NtOX/fpAsKsrvhX3wq/cCnLBVWkQ8dHX27CXhb7PyYCZRbPBXCDk+X2DltzYwNd6r
	oA6fccORl7YA4acM9icOEAIhvWOR+3qckLCq/n2fkEhgJQl4+0BsF9dFUzPKXJniD3Adg1Nkp
X-Google-Smtp-Source: AGHT+IFOv9x4HYLGQdZDWDcsLpvt/D2f2ufrSrG2zS7CfM7XF1pcbWNIAkwuctqSeG/fXn9MMNB5Jg==
X-Received: by 2002:a17:907:3ea9:b0:ae3:a78d:a08a with SMTP id a640c23a62f3a-af8fd69a7c1mr448296466b.6.1753894219091;
        Wed, 30 Jul 2025 09:50:19 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635860122sm779681066b.8.2025.07.30.09.50.18
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 09:50:18 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61543f03958so4709593a12.0
        for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 09:50:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWynxlnbdrhMnxGRdpgDaTTMiVh6SQbDiSIxa2nAZylBe3mlrejT16r05Ja6gS33+oolNWP2D6AA/D/w==@vger.kernel.org
X-Received: by 2002:a05:6402:1d4e:b0:615:a3f9:7be2 with SMTP id
 4fb4d7f45d1cf-615a3f996c5mr655231a12.19.1753894218008; Wed, 30 Jul 2025
 09:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecu4idvc.wl-tiwai@suse.de> <CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com>
 <CAHk-=whvoZuw-Cv2Bx2ip8Kq4j9jw0meLBg0xz8GbxzFmQK7QA@mail.gmail.com> <8734aeteef.wl-tiwai@suse.de>
In-Reply-To: <8734aeteef.wl-tiwai@suse.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 09:50:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV5HeQ@mail.gmail.com>
X-Gm-Features: Ac12FXwEVff61vrMyjTIvAD0SR_lkrr7F6Z_dxguNlvXb6tej_Sauo_3j4s3E48
Message-ID: <CAHk-=wgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV5HeQ@mail.gmail.com>
Subject: Re: [GIT PULL] sound updates for 6.17-rc1
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linux Sound Mailing List <linux-sound@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Jul 2025 at 22:51, Takashi Iwai <tiwai@suse.de> wrote:
>
> It's a dilemma of the default kconfig enablement.  In general we want
> to keep the default disabled for leaf drivers.

You misunderstand.

The problem is that you threw away all the old config data in the name
of "reorganizing".

And no, the answer is *not* "make everything enabled by default".  If
somebody has a working configuration for their setup, new subdrivers
shouldn't be enabled by "make oldconfig", because clearly those new
drivers aren't relevant.

So no - not "default y".

If you change the names of config variables or re-organize things some
other way - you need to accept the old configuration name as the
default.

And even then it's an absolute *nightmare* for any bisection, because
losing configuration ends up being very easy when going back and forth
if the person testing doesn't realize.

And yes, dealing with this makes name changes and Kconfig
reorganization more complex. And if that makes people go "that's too
complicated", then DON'T DO IT THEN.

Breaking peoples existing setup is bad. This is not quite a
regression, but it's a huge inconvenience.

My laptop is back to working - it turns out I only needed the addition
of SND_HDA_CODEC_HDMI_INTEL in addition to figuring out which realtek
codec got lost in this shuffle.

And *that* case should have been handled by making the newly split up
HDMI config variables be "default y". Because my *old* setup worked
because I had SND_HDA_CODEC_HDMI enabled, and that enabled everything.

The new setup didn't work, because I still had SND_HDA_CODEC_HDMI
enabled, but the newly introduced sub-config variables weren't enabled
by "make oldconfig".

So that

  config SND_HDA_CODEC_HDMI_INTEL
         tristate "Intel HDMI/DisplayPort HD-audio codec support"
         select SND_HDA_CODEC_HDMI

is wrong, because it *should* have been done something like

        depends on SND_HDA_CODEC_HDMI
        default y
        select SND_HDA_CODEC_HDMI_COMMON

so that *if* people have SND_HDA_CODEC_HDMI from their old config, the
new "oh, that old name used to select everything, so now we obviously
need to make it 'default y' in the new world order".

And the "select SND_HDA_CODEC_HDMI" doesn't work in that setup, so
what you need to have is a different name for the "I want to select
the common support that the intel HDMI code needs".

End result: don't re-organize Kconfig stuff unless you are willing to
deal with this kind of detail. Because as it was done, it was BADLY
done.

               Linus
