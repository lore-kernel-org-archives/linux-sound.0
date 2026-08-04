Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA29E3FBB72
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785813599; cv=pass; b=YrE0Ro+VsikLy0rUqw7R+RdpYSGCFMMYlQPV/std5RFitT7znBWOBTMn7rton/KcFDN0KlQaJ7N0b5LpOc2Z3vGhS9FXFH+M8xRKMTPY76ngX3K7J+oUqimxPnmqcuv5YnFXHmDulC75V7GnDd6v988cnyILRTup61AmatQ0n54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785813599; c=relaxed/simple;
	bh=Vr02QsyZGGlqJGloFMMGaQXX0ui8LHThGZK/7f+2zfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+UnjC5CXOW2jMLdGylXUVvLS+iheaVL75FPFclipX/EQZ02m0Eu3LTJRH2A1KwA2mFe3nVksARCfxr9d1GXQ0ZUjKSoHZ9x0EZOwSNMugUydSbjaBgEiKZfSppFll1LxBzcCDHRW7bX/IGB9UWQw3iASseTEG6TXcQbYWf/iEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CQHRUO6a; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CQHRUO6a"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb973e6749so4573288a12.1
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 20:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785813597; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbC1Mi1dZ23buuG0zMIHmiTRB2uFtBS6RYhm0drLMeNnRISkXjIBOzW2c/myEpfpyk
         KlIBzVdL9DuifZkDLXDtv3U/h4PGOjoe7ZfgklVv4zSesSXM1AhKjFjHMRaU7KXj4f2J
         x0wedR7hySMzff+OkxUOzXh46OUfdca6vq2Aq+EentYNOdkkPPi/9qG128zYjkyDo8tI
         gwD/42cZEmbcVhJbyN2IJFqldbkSMfGvJfL61AmVYD/q3YlH60YBDC7ldUC1UTqt/jGq
         Rtsxk1WMx3vo2iU9LALFcQbDp7KJOY7Ve0bJohCf1RbX5eyk7aujo6Of6WMUhyO6VYbH
         ZViQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pzmvZ0pDewMJt1D3huw+ZYN22thAue1GN3cbR9HDwJo=;
        fh=GZIeDYatAXZkZov1S/rApON1h5hCvx+iEsDci9k5IS0=;
        b=Oj+H+7KKo6nozhAPzUDaf2ITdrygH4ESIrA2lv7cXCY5kXC+cJ0Uhtq1MmVZsmI0gS
         rgTjipHTey66GFCns1vc9j2OA+OCxDfi9NtKwr56Zlj12z64W238WrC5ee+noJwhTUJP
         QaxpCplazZkFQRKAR3M679CvOVhoV3nxJvRnLHCGPE6JSAxutHmxtf8/AAEdzpkjjKqf
         zghQM7ZtX7gp9f+B+70rzoO6/tIK6qJ4BkoRoU9CK1i1kDUs0qToxfDwelefwiaR6cjt
         uuc3wzQYNDPcjT9xY4mIJh2ya1eOSCDbaG5sLKzq3IU0WmiZlFRsLfGheGJcMnBBAZd7
         7KXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785813597; x=1786418397; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzmvZ0pDewMJt1D3huw+ZYN22thAue1GN3cbR9HDwJo=;
        b=CQHRUO6adBnM1uJoBZKRQOG3/4JEDMt9gLpdbuHdHGBiO777oIZLKBy3RYt0tatBcu
         WzTNJefLexiWU8PckCtsYnoCx564oMMATv+Xyd9GTZhes9h+r16oUteUirNUQvC9ChqV
         0IUCz9x2UfnsYs5YWNFTMhWgDmJugoOCKwNb6WHtjnshtkUqbLyG6jLwkZqc/bnMOQx3
         DmTJq8bGw9hK7UmbyifTcjve//ZIGL9AxDbWOfyoLahXxFdkRo8hAoPQXLGhELvnkvrH
         VLAYlowHWwh7LnHfeNJewvgD0nHcAwvPHRHC0ZkP4Pp89/W7hU5XomG42UvdjHqw0xPi
         btZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785813597; x=1786418397;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pzmvZ0pDewMJt1D3huw+ZYN22thAue1GN3cbR9HDwJo=;
        b=fVRmcsT/pdtchOUYb5+bmoMznrSHPYLh9gcEirs7k1d3/d1cBpy1YRzz8SLeElzW9f
         CRLsiuWMP89ctwpO6ZZrN+BV8Np70SUK+vrUUj9SxDtmQ4aF/jeF+n79GCXt3m3/buI9
         BlKmvravsro7gqwuH47TlObrL6EdUrkB26OkLISXHnU8PZfYd2aYB92Ez9bpn60GKfTZ
         Z+IJTfKqq+SDbIbdve+yaHd3p+yaG/joSRfFqDRarlwwuTFWZlBtDIoTc8PZBBHvfcHA
         Gq8rozPfD51q0CsQCEMZFGgt8FfNOPdy0rrcMFpotWgBcv7zol6fuUFVVekdGv2XHRoV
         wEmg==
X-Gm-Message-State: AOJu0YwGAxiBX3Cxwv8ZHV6Ag5n8QSJ4SOEOeajC4DPPJXa0WCQIJPI6
	k7xpuPrSf2+/d5iud/E48sm8UeocPwW/YGtWwNCDrkoLnIlol8NRbFWeUg+bH5QnPRVla8jWcKJ
	rPnNF5FuM05foljbKYSJoiCTZiz5gr+4=
X-Gm-Gg: AR+sD119k9InHs4IzJRD9mcq6fWdhnhlJL0hmdmVR2VYg1MsOMt9udzMdHMkunaUhRz
	3oBQU51Z1GJx/TBfWeKiSjCheeOEdVW4Ecmh2XGBLYNzHVcd/10h5aVE+/sUUxSNH6/KR5CaNX6
	IRSAR4MEwnAsP9A9hRpTs9LmNG48UmwLG1criyeBEcyP3Dtk7XBWFafzAlSoOuYn6SHYC/EZAtX
	9ktQyJOR6PrbBJa6+K6deBFtMSw/5pYLwiV5cr9PDqes84YvG1ABt4DSzMl5N21YwDdHKUpBgNW
	X9whDzLCO6BlCZebiKqf6J8kf657fcyZBkDfOUd83DxcDNo0WOXBrYTBBC3FBpRckMVKKEro8ok
	5yI8YVKNN7AGgf3DEafEgW+7jyCsf5qRRD8CWJY3/r7Oeu5WMcV6iV+GJ
X-Received: by 2002:a05:6a20:d0b0:b0:3c0:9c1b:d0b4 with SMTP id
 adf61e73a8af0-3c92a908862mr12198213637.63.1785813597202; Mon, 03 Aug 2026
 20:19:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803102739.55569-1-phucduc.bui@gmail.com> <f7c2eafb-84c0-4c4d-a359-8c80ed989c24@intel.com>
 <CAABR9nHynGR4TjdpGW9-sjEC8p1x4D8omq8ouPR6E-3ifDhBqw@mail.gmail.com> <61910d04-6f6c-4c99-bc96-397163cfc31f@intel.com>
In-Reply-To: <61910d04-6f6c-4c99-bc96-397163cfc31f@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 10:19:45 +0700
X-Gm-Features: AUfX_mxlGnCyh1wrdM5PQQSG-p65u0StZmVGOr-4HHl1EB1XIROs_98Hz3G3bYs
Message-ID: <CAABR9nE6Jcfkj94ABPfyua5bBjaqE-ZNQp43uHc5d8fo_Xu-1w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: core: add snd_BUG_ON() check in devm_snd_soc_register_card()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Liam Girdwood <lgirdwood@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your feedback.

> snd_BUG_ON() translates to WARN_ON() in debug conditions.  After reading
> the macro documentation, pr_xxx() or equivalents are recommended when
> dealing with invalid arguments.  Same results after grepping for WARNs
> in sound/soc or in general references such as driver/base/core.c - it's
> clear to me the macro is not used as plain null-arg-check.
>

I couldn't find anything in the snd_BUG_ON() documentation that
explicitly says the
macro should not be used for plain NULL argument checks.

Also, there are quite a few places in the sound subsystem where
WARN_ON() is used to
validate NULL arguments, for example:

https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/usb/endpoint.c#L857

https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/ti/davinci-mcasp.c#L2476

https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/meson/meson-codec-glue.c#L59

and even in the Intel code that you maintain:

https://elixir.bootlin.com/linux/v7.2-rc5/source/sound/soc/intel/atom/sst-mfld-platform-pcm.c#L31

That said, I'm also fine with not using snd_BUG_ON() here. Replacing
it with a simple argument check such as:

if (!dev || !card) {
      pr_err("invalid arguments\n");
      return -EINVAL;
}

is perfectly reasonable to me. It's not a big issue either way.

> Updating just one function with the check raises the question when
> reading the file - Why just one devm_snd_xxx() has the check and the
> rest do not?
>

I think the remaining helper functions can be updated gradually over time.

To me, this discussion itself is a good example. You and I interpreted
the intended use of snd_BUG_ON() differently.
I don't think the macro is wrong; rather, its intended usage is not
clearly documented or consistently reflected by existing code.
Therefore, I think it would be beneficial to either improve the API
documentation to clarify the intended usage,
or add explicit argument validation, such as the check I proposed for
devm_snd_soc_register_card().
Either approach would help avoid misunderstandings and make the API
easier to use correctly.

Of course, that's just my opinion. If the SOUND subsystem does not
intend to make these APIs more explicit or easier to use,
that's perfectly fine as well. I'll follow the preferred direction.

Best regards,
Phuc
