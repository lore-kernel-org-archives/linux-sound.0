Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB113624D9
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860432; cv=none; b=EDdPZsTnxeoR0DRTNTXHp3+U4LH4d2shs1amD60V19jmTo03cIqYGVnR9IjqztvLMCHBpl/ZIHYjeXJ4Ij2RHSuBbukOC65K26M7UAXjrPxF7zWQEpz94O4HmL24srsevW9KdDg539JBRTr1c+BP6rkPveVLFFV/Z9rEj4afWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860432; c=relaxed/simple;
	bh=lHzB6EZ41MiDTwBOkyeJrpZ0oY0kME/5CGkptBf/jlg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ns6+nksTn8R57HrKQPiCrjrJlmdrqMoIYQCqIqB7p/nNO7U0GHlRUtJzfzXKGgwItXb8GnleKF+95r5Rl/qFZErZc4fVpgoXKoQLXQYb9pPmufB4MnGlvqtqGBoUL8XtCREIq6t3qXjGF0stKIgz3slqcVsaP1Y9ndOkD3V0FIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ4+ChTg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ4+ChTg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46255b269c2so1424670f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860429; x=1782465229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=kZ4+ChTgxFKxphuhSJBr/VjjxMRyG5wf0edzDGyXJvW72MK8Kfgc0zhyObW8nYDOj9
         krCa6V7M0gDlBB1eEO7F+5fh+MtAC3Tp5Doxzp0Iqqk0sfZu2/YoGtejU37OUdipqgmt
         x4P77gEiMTjfoWJ/CcOovf21upzCvoOobj/3LpaMxmYi7VRn1eGnGfHwSRDPT/0CbAA6
         15OkYFHV8ImobZBiN/sERHH8ZDAdXq9IH6JR6xwrVvSQhqjpuYJi3jYhyA5arv10Xgdp
         rfOPSWl8JTTu3MH1QFEp/b7cuhzvKRfMrX0Vqqx86lLmZ1Gmf9ZKAkhisEF2chAwzoBy
         GbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860429; x=1782465229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IsrGIaLO7MXNYwDCXl5rLdyTY6/tEE8Vl4Mj+GBAm/g=;
        b=r+LMjGzh2uA5x3FoLCuBEqTmUbOc4ywVZKnh+9H5F2iL89dBHtS8kUs8orLf+CfMQl
         9Z5JLynbVqwfdn6AWv/YPoY1Nu5ZMN7JWTUfe9+rjblOmxMbJZIrOHHVjRhKmlv+8Ylc
         aET7RAOvHtISaLbozYVWABrIzaIkPcPTr4aUzWXtJXxhksK+1jA4DpxFAFjhQK+uF2NV
         XZmRgqtxvXZ9u5OQ8YppYwCzt5HIvDugYnDzm6zv9faPDiE556jy2KW26WPRxcRRAwBu
         yL12nsfa8HrotrrTOfGqDNCjwsD5FZfQhE//m/g8Cml8mVoLzzAseKyNTVNuBS1M1MZd
         occA==
X-Forwarded-Encrypted: i=1; AFNElJ9wcDYefI/79v2v8GovQayEbaU0BJ/pfEA4D7d7oygDw2POiNVDN+k6I6y0iVTu/h4PPUMtYNQU1Jtusg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMoblTrl4QpET7NZno9H1BjFeIexkyIhhuc2M6BWqm5vXXQSC1
	kE/qgMuc6s6KMwC03lqjx3zP66+p8MKUkSyT9cFIVrK0bBXkFVx69MbE
X-Gm-Gg: AfdE7ckDM0ybuk3z5MpmiaxOi4NI6BuNs4JaSPoQTdGmQvlfSVaK4l6w68ib21/Dkwg
	8Icw2apk/27iURSdq8vvooRCzayKTJDNdQslXyB+oVBqgUVAnNN8JQZiEy0NtpMkXTHzzDjYd95
	LW/j4GLOIEY/OHi2qtNWf4QneG7pmxOD8Wx3U5+SCI4mHNG800xcbeiXH19PjQ34+jjtJNRv0KR
	HysqUTBnAvA+5ClGY1A/+TiBvWacVUlQNoT2Cd5L/FbRcLxQhRHkqEhInKOx+6nRGW3kAV8Qf1P
	rtLKnHgFl1e6ODuKwwsK/EOP0hIQgvvdUJDZ9AQ75nQi4Mze83n7/ZQx9lCavorozbfRUcnmz+O
	rGMGPRa9zHYoWqxTqmUcBTfEYgoxP6Tj6hJuVJlnipjoX12vk1jX27HZ7GNPYE3H/stbuOdjlqi
	vcJtU72g2cKA+hpOaUWXFOqxc/H6PKgnK8GgnzZckf36slJbIIFw==
X-Received: by 2002:a05:6000:41ea:b0:464:5df5:332a with SMTP id ffacd0b85a97d-465026e230fmr5178308f8f.34.1781860429313;
        Fri, 19 Jun 2026 02:13:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4650bc428d9sm6387329f8f.27.2026.06.19.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:13:48 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:13:46 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cheng-Yi Chiang
 <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck
 <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, David Rhodes
 <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 povik+lin@cutebit.org, Support Opensource <support.opensource@diasemi.com>,
 Nick Li <nick.li@foursemi.com>, Herve Codina <herve.codina@bootlin.com>,
 Srinivas Kandagatla <srini@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Shenghao Ding
 <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Lars-Peter Clausen <lars@metafoo.de>,
 nuno.sa@analog.com, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex
 locks
Message-ID: <20260619101346.2ec49087@pumpkin>
In-Reply-To: <CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
	<20260617103235.449609-16-phucduc.bui@gmail.com>
	<ajJ9rbHTspXHo6Ou@opensource.cirrus.com>
	<20260617140209.3f89706c@pumpkin>
	<CAABR9nG+6gOj4KnWmTyykgGN93xy6jKQh+-_f8Xxn=Jkv28vBA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 19 Jun 2026 15:20:37 +0700
Bui Duc Phuc <phucduc.bui@gmail.com> wrote:

> Hi Charles, David,
> 
> Thanks for the review.
> 
> > >
> > > I believe you have to use scoped_guard here, as there is a return
> > > from the function above, if memory serves it attempts to release
> > > the mutex on that path despite it being above the guard.  
> >
> > Indeed.
> > I believe clang will complain.
> > That makes these mechanical conversions of existing code dangerous churn.
> >
> > While using guard() (etc) can make it easier to ensure the lock is released
> > when functions have multiple error exits, I'm not convinced it makes the
> > code any easier to read (other people may disagree).
> >  
> 
> I built the code with both GCC and Clang and didn't see any warnings.
> 
> My understanding was that the early return exits the function before
> the guard is instantiated, so it should not affect the guard's cleanup
> handling.
> 
> Could you explain what issue you are referring to? I may be missing
> something.

When a variable is defined (and initialised) part way down a block the
compiler moves the definition to the top of the block but doesn't initialise
it at all, the first assignment happens where the code contains the
definition.

However the destructor is always called at the end of the block.
So if you return from a function before the definition the destructor
is called with an uninitialised argument.

This has always been a problem with C++.
It usually happens when you define a variable inside a switch statement.

	David

> 
> Best regards,
> Phuc

