Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9A285CB4
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671491; cv=pass; b=gFE4OJ2hCUFY/Ivc5dWstQQsKay7dQ5Vedt/qHRsT+y0eezoPorchJ6K9jo0Ninh41XkU94a1VQPFleWq+mgA5FWuuHVBltR/s1ZpmHl2riGd2/OFAMiErKxlK2+Y63X7C+Vq9Y7builZWsw0zVF9k1DpflSFvUVnCGlot04JfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671491; c=relaxed/simple;
	bh=cCLlbrOBmq+DCpv1CXmRYPYwrJV00CnDkEFRsqhqz3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQiESEEznVG62mondw6XP9UqE7AYgG4LzHzxZkxGjroNnsw+/oM6OvBEeaRQYvi6wMtu+8Lxgw1wvvIWKKfenYB/ESKeTFcWxDpHsPsBNaK7fwln74yBVDaNsXuiaC105lvVqfD2+HzwvwnbVvDMNAd+JxoSjUWBLmPXSjFwD+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9cUVObD; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9cUVObD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso893969a91.2
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 01:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783671489; cv=none;
        d=google.com; s=arc-20260327;
        b=GtqZoCYUgIdI5S5BzGi+I6XB5mY9LvAmeGEPLcllyP5VR9mkJ2jpkESodzI101TtMl
         s1jZjzKtTAa9iPP+zhlPVhiuUOOJkdvvwiFGSFTyBbcdg505n/GQkBtWjW+H024YP641
         G9trYkZFZ+Gwf9bExdXZjYJWaCNXtjFX+EojPJ11UyZd2Duc2A7v8mNyhj0kXuS3h48b
         sU2/xx9+N6HRhoo+2G+rMe4EcmT6vDU64Ydw1BKaluaBMuSyk+mJ3mbmqxzWfjfKWAd6
         DGsFTFcQYwWkkAXoYJ3NvbT4FHCrpGRUU2V7AedOSPCWDnEnM2VOakcwoSk4mNSG6pTZ
         Ofeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Xm+71vhVvB2sUAuzgpV4v4ZXbW+TKZaCwA7h4T8wfQ=;
        fh=i06ddkLKL0NjQN7NCLEsh9WfL/muh3nAl/i+hB359QI=;
        b=KwxhKhkADfYZWZQwMqLpglk3vdlJGH+UfbaZU4l6E11sPATLFpTlAq56QdeHtz3II3
         frjfSoWHn1ZVDEpon3Nj6VKvBK84DM9sX65/FlzeNjTkA98HZK6OYyirlwsSW4SwpSwT
         BR7LGworc/mjflViWNbVLjfYzlLXAdIhuX/0F/SPLH4ufnHOWN+jSxkZH/76KqoKbFMZ
         oSQxUKigFMAG63bxlM5pi7KaLQMvR769imtqfWSqjAoTaDHvZN8a793niYxl2KzkUTGr
         F0g8h4qgyx7uInqaXzyYi/o5+1ynZzCyMcG4l4blTRt8Ou7ccPG/34E5Zy9fZPDNII/R
         M4DQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783671489; x=1784276289; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Xm+71vhVvB2sUAuzgpV4v4ZXbW+TKZaCwA7h4T8wfQ=;
        b=P9cUVObDksONUptehgH2CL8Lk+6RMmOBawLIqyBQIavZH0Yvu0rEdf6FKnX8GRk68o
         3RgNk9O4P/gNZOGB4BGAWI2DyJ2igQuWA1Ly2FGzEE5kpJKQsLpCj5yODxCJt9Wfz9/H
         0vUDKtWiBUwEx9MSNAG/fFmgB/TRLtTZ6GeEHGMDN8mjlzeMMV3RgxkiqnsDy//lYAAt
         Wm0UHqnOHT34sQnKwkiK1H4TdOHWXaEx2hDbGnskyintrpLXSJ0lh2jggK1UMJWoJMk6
         2A7/114BdF7urDU7lDzwPZ8SVhe8mi8gDJjN/6oFyAzV+cjjgMNYfUjRmnx+cgcIoEMZ
         1dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671489; x=1784276289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Xm+71vhVvB2sUAuzgpV4v4ZXbW+TKZaCwA7h4T8wfQ=;
        b=Daw36IQjDIUPgcvB6DQSNMh2zZroGirmLg4tK1VwhSteKZDDH6jgEGI9wAKxZGpl0i
         OHJG6iKgpS5ji9Bhf4uYSqG1OMy4qPiM4ONc1wnpeWNXffoti2KF5Qpeo2wQ4ff/Zz4/
         xG3JXlUyRN2Q1rz6boCf2ROpZIa7b9D5HbBj4YXWvEBAwnym2SK610l1v0zOxadGGw75
         KB/NIFneR+kzcy7Oo1cbdl/EENdaz2hBT4TUJlEpzHUUQxzwuM6yoBPTgh+Y8xoA5xT9
         YSGIFk/9aJeUfiG2iKfKVKb92qtObEy1Xc6Q62obdOUaMphSzPZiMOM7j8VpAPRMeQQ/
         p3Sw==
X-Forwarded-Encrypted: i=1; AHgh+RqaEwqEq++Wk7W51M+TLrDiCuISBjmXIJngRHfl2kP+PoX35EEZ818Zs/P2rVbX64z/jS3h17zsKR8hbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpalRSb4Yz5z6QTE4qk2gVlkr46gt2b4f5Ogihhm9J8uQkqcJS
	VmLpy3dF7xtGRHbGsvxUksbUclcfKViYHOYf7ZCCdhEw3XG5IE6PP5a1/0AH/CL3E95V+nkIyRm
	yI0SOX+S41LPCr25gqKzi+daOzwKdvD4=
X-Gm-Gg: AfdE7clLYZnY9o+6Be1tCS/r06gogQAoCBi9xNJyZ4MMwbHCwdBFGWOf0M3N3lUYI+E
	JRFZxnAhquuphqr2HdiZrKINt/Va8s993GhxPa+tFfMPmoXqz5EAK0/QgRnaHfPion8LqYdzHR6
	DherqREjS9QvOlOTqIkn2daFcX5HJz1rbHLAUgon4fc1GWAhqDOk6uNWNm1wgwcucxJA3TytaS8
	Zd5Oi7DNR2MPdFIpwPqwil3OoxQsN3QxZ7KPMF1zAAMB5IdOljv35UEmAUgeJMzKfnYx+BvhSih
	D9I+HApG3WeMbqthxSWgc81id6w=
X-Received: by 2002:a17:90b:2f06:b0:37f:bfa2:1887 with SMTP id
 98e67ed59e1d1-38941101e2emr10680019a91.8.1783671489057; Fri, 10 Jul 2026
 01:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710050223.14266-1-phucduc.bui@gmail.com> <20260710050223.14266-3-phucduc.bui@gmail.com>
 <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com>
In-Reply-To: <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 15:17:57 +0700
X-Gm-Features: AVVi8Cexjb8IlpQOnKY8Iz8sH6znwFCqGvvu16EY1ysnfcqVV4Wi_i8aRfmJTkA
Message-ID: <CAABR9nFFMMk6i_sjKGjt4t-_QZF_hu2gBPRNK8c-GfhyKdVP8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and
 drop redundant error handling
To: Michal Simek <michal.simek@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Thank you for your review !

> > +     if (IS_ERR(ctx->axi_clk))
> > +             return dev_err_probe(dev, PTR_ERR(ctx->axi_clk), "failed to get s_axi_aclk\n");
>
> This is pretty long line. Message should go on the next line.
>

The line is still within the 100-character limit.
I'll split the message onto the next line in the next version.

> > @@ -274,29 +270,23 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
> >               ret = devm_request_irq(dev, ret,
> >                                      xlnx_spdifrx_irq_handler,
> >                                      0, "XLNX_SPDIF_RX", ctx);
> > -             if (ret) {
> > -                     dev_err(dev, "spdif rx irq request failed\n");
> > -                     return -ENODEV;
> > -             }
> > +             if (ret)
> > +                     return ret;
>
> Here you are changing error value and commit message is not saying anything
> about it.
>

Oh, sorry. I should have explained this in the commit message.
devm_request_irq() can return various error codes, such as -EINVAL, -ENOTCONN,
-ENOMEM, -ENOSYS, and -EBUSY. The existing code overwrites all of them with
-ENODEV, which does not reflect the actual failure.
I'll update the commit message to explain this change, and add a
Fixes: tag if appropriate.

> >       ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
> >                                             dai_drv, 1);
> > -     if (ret) {
> > -             dev_err(dev, "SPDIF component registration failed\n");
> > +     if (ret)
> >               return ret;
> > -     }
>
> And this is another case. Where origin code didn't return any error which was
> wrong. That's also not described in commit message and likely this should have
> Fixed tag.
>

Sorry, I don't think I fully understand your point.
The original code already returns the error from
devm_snd_soc_register_component():

ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
                                                                    dai_drv, 1);
if (ret) {
dev_err(dev, "SPDIF component registration failed\n");
return ret;
}

writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
dev_info(dev, "%s DAI registered\n", dai_drv->name);

return 0;

As I understand it, this patch only removes the redundant dev_err()
call and still returns
the same error code.
Could you please clarify what you mean by "the original code didn't
return any error"?

Best regards,
Phuc
