Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73DA372ED2
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 10:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866690; cv=pass; b=lxGaCOvo8PrbKZAltNiAd8tU7avId/N06ycQ5YkOoW6W0DsK6OWW2RT/fp2TbJzNAOG3UAsTguaAV0VgjFWBXDwUxGWpNUIFwqGXCymDAdOxj3U1VhdsqTMehcQKjYc6dLvjRtbUrTr5SsL7bejjf9bAiaDQUC2ttXh3SYBH64E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866690; c=relaxed/simple;
	bh=hW1hHfit11KJ1/jbc3rz2OzpM401agNI/4AOURsyGfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0eVelx7ba0VuvZ2s8OGOvQAwVVvqbPiGtHg/6w3fmYH4+Q9BQFgrQPzI8y8/QocGZqT0btrNC5/am7qhfBLDfLPjIDPUlC2gEtAkBi+iKz6vPIVLhrSEVI1fk9KCWmSXFf4BLzBzNK8hwZhIPLitXBbwvulqOoWa6C5/n8KNE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiM+TrXR; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiM+TrXR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-37cae9b7536so1193911a91.3
        for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 03:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866688; cv=none;
        d=google.com; s=arc-20240605;
        b=ewMC+X1+dmJ5GjNXX2h9pF3eCJAeZBgv+FryfdYxYDRppB90IRNFf2JMHlr5YFggLO
         veq9OLuNJvzE1ZbPcRrLs+MCQKBcN/9GIy/iTEnX5gusVjenludk8EAF3QLLOKvznQs1
         kUFJ9wo8j5GiRT429Oxac11EUfSUf8sn7IC1APu2KUqrZ1wCTg2smb+WzTeZQXgPSkA8
         I6mEDJvNNmBVsogBnQDk07i/+D3qM8ROQwh0XsaSXDD0W7pjLYzSF5zAZH5dPwxxz2f5
         N9lSknf0vis9uMsOZ2pK6pY98pGlSOGJ3KPvYuLM5XL9QsG5I1vGl1h60VOFxef4a7cx
         6I5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        fh=t0S7vXAYb0CJfg3QQlns3l3NheZeEcxYh3V9Evmorq0=;
        b=jYaCLhOI3j+BUVerLrqVK5N19vdvh6KLYzYix8nbXH+0Prr6OQcz9FSKumq3BZaciX
         r/40kPlzL3aPia+BCYxUIHdZjXfJes5jNDEcwl3Y3eKcBoWW0bPmUHO50BrFrvKYGd1y
         RadoPo9vpW6iceMiu686V/fsRx+ktgwyrc5N5s/WjavvUAWr4Wc2O2/ij0jiL7gHolk9
         c73r+BhQixuL/O+dxNkXI+9W4gjTvIVHtT2kAoJ6O3/EeczyIQRRR2/0/58ZmrN7unXg
         9RIpekvJrdIUMBhm8jFfaRTdtS23KRK5PHr8ibMuKBrLIgHpsySGBfDX8sWg1HKArjDY
         vT0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781866688; x=1782471488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=OiM+TrXRs1ialS4Tykcu0kogovr/yFJurFTQZd37c4398mW6xPlrBlQKnNlRckEhQg
         ox53b9zJcH9g9KP8ECxb6woPbfdnv88FGKVq8CgbJKcafxQ7YsEMXS3qON+33KEb7yJw
         RE+TDMD7F8Zwa0U52EdTjX8BaSPQcyIYnVvShQv/YglMyvTe1uurhd/lRLG8I9cIu3WR
         sXsiceNHZPuRscEg+PBpIf3E4lYVMnvWYeMIrXjyRoOtdcuCs8groLBC+ii4mB1atGx/
         q6/ODgJmdUEv0eEmBu8vwkPFGHVoPjcTDq6+2iv7DWcOk62W+LGOg700g6oU2iBPHLUZ
         sACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866688; x=1782471488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UyoRbyY1ikZAKjLVrYosObC+OJksg/6It/AyYwr3648=;
        b=OHPHWgkRxm7cat8CBdTBCQ4q9PZv6oHHVrPHqknOhVNJkcBzlf/a3pS+Y/zgxuSdOa
         ObRDpXABBo8hEpf6fXyWreVrjG/B6LvHpshmPW6kwzyxmgwH1bYtOuCL6MhoRQPnV/Ct
         DMxynPe5dZJqXVC36D76wnNic9ode6XWxzn5xf6jtf6t55HRuPoKhDXB6fX8/mHYqTxK
         fxfqNIjE4pYsTz4/h+q8vtDirZ+GVhHj3RNEzmsiTbw5eHJcRsRBJXiUdHoeWdU5uj+D
         oT+zNR2oTpuXoBvX1HWMLqBUxAXtzWcMcWh7Vo069IxYJQQDcWRAh2vN5xYnwDuefBL2
         egnw==
X-Forwarded-Encrypted: i=1; AFNElJ9j7UwlofqQs2LfGwVLBaGlN7iCYG3d8TAReq7T0W9WFNbmxpK/IdZv/8jKFcgL/mXw98R1/naBSEWYZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYDlOR18UaYYS0QokoYk3ePc357JWei8PFctCf4uUFFeGVVp27
	Z9/1o7oTq3KuXOV6L2wghS1tCO4xjk16uDGfU0gKFv5uzkQoDkYNEuktaQwzhnk7KlaEgw1RqmA
	wJkizPL0oVIrHjWe/XRx2vlOrDgwYJGY=
X-Gm-Gg: AfdE7cldDA7axXRwb1guG04xhV62mMPcW1XZk/Dj6vDEykZgR7CNdgQHgjzFvlKQlCZ
	un8jM+gj1tZwUUSNar2VJvnaxlutWVi/PPEgInLe8V5eKwwpSh/9BzpcU0VmWMPziJlb2YsuJ7p
	tkoo39/GbgWOx8mWQUffpCQYhixCRcDQNP3E41+ttC8uNrPWYtL2DRjx5l/HRxUo+K1o2rQYTFA
	+xpqzMWiabbeyIhAuCiz9vPlmZuwOHU6M8vcwJyUc0ac+SIk8ap5fNCY1Lmszw6ewNm7bcDYvNF
	t0jAjOr4JPN9VL19yt+wGQd62pE=
X-Received: by 2002:a17:90b:3847:b0:37c:7090:821b with SMTP id
 98e67ed59e1d1-37d15cb4614mr3550684a91.10.1781866688090; Fri, 19 Jun 2026
 03:58:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-16-phucduc.bui@gmail.com> <ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
 <20260617140209.3f89706c@pumpkin> <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
 <20260619101346.2ec49087@pumpkin> <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
In-Reply-To: <ajUcTfG3vSGz3n3d@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 17:57:57 +0700
X-Gm-Features: AVVi8Cd_NlwUbIL4avZasgAe7DuOI7f8OOig9UU05BKU2wbfQ972D9fz9PREhwc
Message-ID: <CAABR9nGRCZ1zv0cyBGc3yuM8MeFNqBB1MkGUL7bTbtC_LcKKzA@mail.gmail.com>
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Laight <david.laight.linux@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>, 
	Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, patches@opensource.cirrus.com, 
	chrome-platform@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Charles, David,



> > > > > I believe you have to use scoped_guard here, as there is a return
> > > > > from the function above, if memory serves it attempts to release
> > > > > the mutex on that path despite it being above the guard.
> > > >
> > > > Indeed.
> > > > I believe clang will complain.
> > > > That makes these mechanical conversions of existing code dangerous churn.
> > > >
> > > > While using guard() (etc) can make it easier to ensure the lock is released
> > > > when functions have multiple error exits, I'm not convinced it makes the
> > > > code any easier to read (other people may disagree).
> > >
> > > I built the code with both GCC and Clang and didn't see any warnings.
> > >
> > > My understanding was that the early return exits the function before
> > > the guard is instantiated, so it should not affect the guard's cleanup
> > > handling.
> >
> > When a variable is defined (and initialised) part way down a block the
> > compiler moves the definition to the top of the block but doesn't initialise
> > it at all, the first assignment happens where the code contains the
> > definition.
> >
> > However the destructor is always called at the end of the block.
> > So if you return from a function before the definition the destructor
> > is called with an uninitialised argument.
>
> My understanding was exactly as your David, but it seems that isn't
> the whole story and indeed I had to fix a bug in our SDCA code
> that hit this.  However testing this out, results in some things I
> find very hard to explain.
>
> It seems as far as I have managed to test, the code below works
> fine as Phuc suggests. It does not appear to run the mutex_unlock
> on the error path.
>
> int function()
> {
>         if (error)
>                 return;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
>         return;
> }
>

Thanks both for the clarification.

> The situation I hit this in before that doesn't work was actually
> this:
>
> int function()
> {
>         if (error)
>                 goto error_label;
>
>         guard(mutex)(&mutex);
>
>         stuff();
>
> error_label;
>         return;
> }
>
> Which in this case it does run the mutex_unlock and NULL pointer.
> Will try to find sometime to look at the generated assembly, but
> this basically totally blows my mind. Very unclear as to if this
> is supposed to work this way or just does by pure luck.
>

As stated in cleanup.h, mixing goto-based cleanup and scope-based
cleanup helpers in the same function is not expected, so I think
we should keep a consistent approach here.

Best regards,
Phuc
