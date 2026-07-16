Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FA223395F
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 06:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784182795; cv=pass; b=X/oRVnB7nQ7XmNAUN0u8Ma1po5mIlCw64eTK7+Atd9Imw7yt6quQJyOaB5v+eXqhpvAzTsmPv7IJ5K0I9nhFOnNGkfnmcsr3VX8IFOVSYnmx/LqwF2uxlZPdvXdmI9yLdQm+AlF5DO//NHtuZB5/7pTtj+VYb0547yodeJNnRiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784182795; c=relaxed/simple;
	bh=Z1xYzaKFoC7KOhHV2wOjYI5julQTrdp2ki63LNelNrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIOY7QmYCaImsnwSFXeJagNaby3l9Qs0jZYQ9PHhkn/uej4U1W3qgSirvwq29dIEWbqjO1ZNXmAIX6/+qHXtmOaaqd3elZrcnPhzkVn/kiTI2RjuOCdxp+F6+e3Z5pG9MwCnlZHtUPoL8uM+/3MU6T4XTVuwmIo1/PW+A1P3vXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar0WWOqJ; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar0WWOqJ"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so6253676a91.3
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 23:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784182793; cv=none;
        d=google.com; s=arc-20260327;
        b=FQsOsOvuZut137Xv3a22+NJqiAzcHvf2EE4wt34us9vDLrRtdFnWOP/KcF+SZ0ndgv
         D79Hya85twlg1Rcjk8zPW9U6bELZvp2ykGyJPTdNo9jbwnA3MlIC0yV/wsH9vwHni76c
         PROEXQvKxlt3XUAxzotGQOHmCy3oH13WoaP6BQwnuFM0QFZq+LtgkwWwrui9YXTxqby1
         EOho/MEqlpJZVawzRjx/3szbs5CqH5cPIr9MFLES1/ew5ZFTpftSg1UtadHOS+4tXKEn
         NHsC4tu3adu85V1hPZgq8NUMco59m80gpWqyhpHGkjdFoGiKR9In/rAndnLWSNAvheyZ
         5EAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        fh=s9Zd9G/rI+9inLHlZ7K778za9SuBmi/dIr1oWMF3Uko=;
        b=eTJRmDT4odEzYjsohOQiQ/wnA1UhmvRtti3ysUf5SB6pHW0MM8CgDX0BnKUHMKMJ0v
         G/dlf+PtpSbxo4uMtvqywP+4HeSeseUUPoILRB9GsMOP/8Z0dXd4KfmGPchFF8XAgWlJ
         ggpQGgvcqSmgcruG/ld9zefxlICk2fpJFITJz7WktynxFeV9M523gnFtXWorDd/c7JFp
         MCXURyS8dqvtaEp5ZlP6lvD5BcqRsV4sz//yAWvlGJJJsQefyFh1uX0lj0Wmv1mrnKrk
         DTA8KTo/uP/R4i7sFc+yrLSfNnKeuqeO497dZP1unsndj1a9oHoSmCls0vCIaE7YTS85
         zGfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784182793; x=1784787593; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        b=ar0WWOqJ8uBdPxA8yZ+ZhH5ixdCAVJSbPXTd76gxomfP0EGWxArXgTiYSG0dgkEJs9
         eq7bAsRCNtGemz0axk2ab1nYC/qKcLTz71fg4ncHdntlAchQ82RleSGIpsBW47ac39+y
         dvK4cdZM7lx8j0rX1JvdSJFt4MWfsDeY78yRNIHhrQJfqirMBD/C0pcqRKjySo5fP7ym
         X8LbHl6xdpJfV29zggleCiLUR8qfKkZtIBXYiyNyhaLyPzAGuO6xXI+b3/0gDHI62yfn
         V1eYsj5yHgOo1xUmENYAUgKaPNwsz83PHS4sCin5dRjN1kvBjuBpKD/k1zYeyUNnUBti
         /bZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784182793; x=1784787593;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QgvkBWHWdR346IwLVQEHaZZsFXG1V1Qn4Ec2u3LFb+A=;
        b=rqHx8pfkBI4QZZPo4duX0MA283JBOcc/AQmTpuLy9hEEwRZfaNtiFTF5wPJJokAPfG
         jiVXEUdESiMUkSkXJIwvHbPhY99fB4xUDxmHw3CBHffezzwmwOcEmNIraubg9twZ4iyO
         3OrKc882967ytTYNhMLXNmy1iu2HOF+or9nBEIGMDn5EP6F1tdI4b5YfHw6Ggt0OrLgF
         wUvpFPro+y1U8lo0jpNSt5qId0Mfs+Hi8WYMowUl+2gZil3QQ/pUpzb4JlVLxSU6EHx2
         Tpr9ybRZnNI87XdpMzFJBbQ2VP+a2wTJ+ImE005wh6rH3hdZgc1jHoNUR31FjhJsXQtY
         3qdA==
X-Forwarded-Encrypted: i=1; AHgh+RpqirxViYZMATf+unFIEQ5rP9kIfnnEP0wgByDLzKfdndGerXBXqsQ7U9oeyHeeMjP7yMDQA/XulRbI3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/eYF1FqJ7LDAg32Rk5ZKtWjVwK0upcjBM8oKRK/9w+vcRTB7
	btc4dl9n3MO4Vlj8oxcZSxZSxfssHz2QRnfS+iRAW3huZfSpFWY+SFwG0WwYUpRtG+x/10Wd8bB
	kmtsYtkVOHXtB0JxCeVN/9eRMCIJ9XjA=
X-Gm-Gg: AfdE7cmo6AoS0fUUIK92lGukj2S1/gOkvWWlVyIyEXnpuaXloA0pmbUou3zKg8ZRIJj
	B78N8tkrPqcL40ok1Z+JQ43VcUX3yXQ8ghve+PeFHZpHee+p3Iu/zKnfLpNQTn5YOn9K9AWeqhh
	T2A0m59SjpjF6azuZ6IIHYUFamrwwqT1sVZkDb8ouUx1LSyUXtytl47MagbCtc0rl+xZ5jN+jFY
	76gTWuY38DEX7HA65JtFzltipkdfn66GJQkBWh0I3o1H83TOc0vtqCpbRFoLjxmHEDdcYBUEU1H
	zDU4iQxqNcn7/NEh
X-Received: by 2002:a17:90b:2b43:b0:38d:eac8:2dbc with SMTP id
 98e67ed59e1d1-38e29f6c683mr4862337a91.9.1784182793361; Wed, 15 Jul 2026
 23:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715095525.40668-1-phucduc.bui@gmail.com> <20260715095525.40668-3-phucduc.bui@gmail.com>
 <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
In-Reply-To: <CAGb2v67tVzjZsPbA9oeCFjuRjrixxCut05P5zkw+sYq-gJPoJg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 16 Jul 2026 13:19:42 +0700
X-Gm-Features: AUfX_mzLT5bgNmawwyrEk5EUD4UBu9qW-wp_xIJKTxIxw3V-_Jn5uIqdk4DToog
Message-ID: <CAABR9nEk19N-hBm+QKv6U=7SBgkQwC2Ohb_NDz8OLEetavLLAQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sunxi: sun4i-codec: Drop redundant error messages
To: wens@kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Chen Ni <nichen@iscas.ac.cn>, 
	Marcus Cooper <codekipper@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, u.kleine-koenig@baylibre.com, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Chen-Yu Tsai,

Thank you for your review.


> >         ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>
> snd_dmaengine_pcm_register() doesn't seem to print an error when
> dma_request_chan() fails.
>
> > -       if (ret) {
> > -               dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
> > +       if (ret)
> >                 return ret;
> > -       }
> >

You are right that dma_request_chan() itself has several code paths where
it doesn't print any error logs when it fails.
However, if we look at how the caller handles the return value of
dma_request_chan():

---------------------------------
chan = dma_request_chan(dev, name);
if (IS_ERR(chan)) {
                /*
                * Only report probe deferral errors, channels
                * might not be present for devices that
                * support only TX or only RX.
                */
                if (PTR_ERR(chan) == -EPROBE_DEFER)
                        return -EPROBE_DEFER;
                pcm->chan[i] = NULL;
} else {
                pcm->chan[i] = chan;
}
---------------------------------------

As shown here, the code only propagates a single error code, -EPROBE_DEFER
regardless of whatever other errors might have occurred. The reasoning behind
this is already well-documented in the comment block above.

Therefore, keeping the following error log is not particularly useful:

----------------------
ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
if (ret) {
        dev_err(&pdev->dev, "Failed to register against DMAEngine\n");
        return ret;
}
-----------------------

This logging statement does not make much sense here because if the returned
error is -EPROBE_DEFER , we should definitely avoid printing error messages to
the kernel log.

Let me know if this makes sense to you, or if you'd still prefer to keep
the log with a check to avoid printing on -EPROBE_DEFER.

Best regards,
Phuc
