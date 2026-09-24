Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08EB495054
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 13:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257522; cv=pass; b=UENcrB41lELsCYG+MQ+sgxGKzsFJKSb+kUvMe9sQExlt+iP5p6ykfmm1kBeI6tF5VEaqX1gt3UyWy5eKBockzMjG0k/TlcKvtI5DF1O7NZmc+p9kDlzqgnsBcbaxQuVSsEUXU4u35/o7vIMyulqploftZUJsbVv6P2MR9tz1hRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257522; c=relaxed/simple;
	bh=jZQJkk3KHNIcE56oWvAfHwi1YqZoDB4/A8UkPIGIqKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpSISQ7StzEZXiDIBr9bpkj0uErpDRw268cgWxxacYtVAVyU2m+EUCGZAJIZlM2cVXlOJOJG6P9/JE7YxzkYiwG+9rWyT8BijWIV1qD1y1w6eu47kGoV0RZ+rPS9/5mK5ww1rK6B/g1a4Q+ob2MhfkblOpDfYU2nwSCJBMO4R8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkFm5kJP; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkFm5kJP"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so2373503d50.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 06:45:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790257515; cv=none;
        d=google.com; s=arc-20260327;
        b=Krnt09kkHU+PK0XEIL8BujCgTetGLZQXk9wFz0ZEE1cJD9bmFZsxXQKxz81x4feE/W
         b3kLXOBRCosJu12yU0Qz4pRXOMJb+ep9o8s8BRgztYB9et0HMUrWeQHvOTuXgjHDnY3T
         ZQxkk5nq4+Bn/k3dKUjuFzLZRcmBXjO7vFYB24r+P8+vW0cMK+KjkzCSb4OsjSVz+j96
         bHWgHDkBTnvRkbsleiXgHHjiiRhxKPHqodYEZMOc+sHhTObqks2NK9E5EyTAZARrElQj
         h9BSGbrAdPdSBclZDTPa/LCdKhFjAlH15cDkUoyUareX/ArjBjlwLiQWvzUIqoECWNZR
         svOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FNNubV5ejx2bLbWQoB8ueW+/fkh0ACbiMkvSyTP+9DI=;
        fh=fKMqETVO4QPGuQ6tsIANZ5rabplyJB5V/VpQ7pQ65Hg=;
        b=c3Olu+t3tALn3DSEvXjAwmid/bnFZRwvLkNT0ocsFraCECyt8kIyTfxJJamor1Jp5S
         q9f5AbjGuLw1pM1xS+ywdm1YP0Hys7zLeabWb8J0frtsHFUOF0/7WfFMaFCvN3O2EmTC
         gUyXJ0uGETA0JDsN/LiwNyHzXDOXnikyg5TgRSUtGoh/A9Hm+8gBHY4rWt+z3trSbt9F
         Zt9QyWH9hxZBZXUD5ORzWQGU7nRhPIG5WhGWpWGEmutX1IHgtsQ1j1OicwhBFhJEXcdw
         WxwIw2+QyU2imWHWeJ0E2cSepjpezmUcHestbXjwXINQKD6ndSuO1WTfPNNLtUtP3L+d
         VxYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790257515; x=1790862315; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNNubV5ejx2bLbWQoB8ueW+/fkh0ACbiMkvSyTP+9DI=;
        b=AkFm5kJPBWhEpym/Od1w9XRnCnR2bocmI+klD0GK7b8Ymlb9HOoL+GMivc3IJ2AE6X
         yRt/DNeQika1XXDo/czBrYXzdZb6HDOgQR10fHCltgK+GmHC9QQFH/rkjoIPLSgTxcq2
         K9WCyA2S0TswE4QOnbm8M8Jd2gcFpzFgRPW5jxL27QWTt3m3ukGYrd0mlTzVimC0spcf
         zf/yxUrJSqwBwpTSfjKDSDqb8KSKNhGIxG/jjBNKJVfEdflNU1zW7taNbJxwXq1bVd5I
         M/DF7KvXoJu7JFf2Knd2ebcNlDeD8eIM8pcFVLnun4yvyE8Qu27ajYBQl4Nv6Vm7HwNB
         gYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790257515; x=1790862315;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FNNubV5ejx2bLbWQoB8ueW+/fkh0ACbiMkvSyTP+9DI=;
        b=mpt1MkkLTAjLxF6fpwIAjQmwIcvvtGKfeVoEln4F3GAIiK2SOlh6HzaYTxqoCIhhnp
         JhLovyRySWb3K+cl85sHBCGAtSgjRqg/LmpGb9KPyjy9Txjbtnfhq/kTd2MLiRBhKBFQ
         mtAfLZO86YSZRr2/gc+s8mY0xRPibUXYVmd8sGjnwzAvAovvVhKNovsJuW63NlBEL4G1
         r5fPa/YrWzsSZYoF67s0W53MN4bDeWTS2pmhQPCe0VqrF6ntUHWGvRG1lAByfYfP/z7U
         xHs8n8IYZgmcQT09g5QgykFLTvDl1no15pjsYQ4gzzLMz5VmSuYR5wN4W1h1hXyqa1Ml
         cVGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLhTgilhT2g6c9ADjIazzv9OGTHgfgxqa3o3/jDHjcaIEWRO8IUvb09kVHezaV0eJA0e5/XUIA0wDOag==@vger.kernel.org
X-Gm-Message-State: AFuF++kEyOZ+Es142dFYKZ4FCZICrH1+OllR/6Q+yqqUd7SYoK+Ua6Y+
	a+r/hdpjHHFP59Vt+EgYLaMvhELPJ4cuSbr2EkBuLp/kWM1cOh+4js0o+cJszKUK2RVnrVbpX7X
	3R3mdvU3ccjxPoAbsCEPwJighNwu/imI=
X-Gm-Gg: AYBFou1l6Qzk5cee2puLYT7LydsP8KV0f2uwOl5BKu6yZPvqMK61drbR4BH5ZmCO3+u
	d+o+Fk82lL+HRK5B0PSf4WNm2AjS6zl1Bh68/x6ys3xs2e/70+h1C8D7X4AhIx9XGkmJ152zKlK
	+aSXCFHnvvNxAiutYkRK6regfMU8hYiH+MmUogq3ncOa4JmYCMMyXDPG3GxLtSdzcde+CTBsKKo
	s3qvutRai/y37IcPKuUSiwEXaEEi3Pg4fTWo/Ib70MIW+8kOu7Jore0Bjdl/tmzAb05ygEWdaZi
	6zsSWmcuRFXzFKsxU3IgZzF+YBC+gvBWYuaF/lDfw7hJjbNoiM2jw1Lgng==
X-Received: by 2002:a05:690e:118e:b0:672:d609:6bfe with SMTP id
 956f58d0204a3-672ed32167bmr1527450d50.39.1790257515508; Thu, 24 Sep 2026
 06:45:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921073847.63505-1-lgs201920130244@gmail.com>
 <dd60ce64-4af1-479e-99d3-1787a06da882@intel.com> <CANUHTR9F+D1C49MLiiy5z1snyKtbBtdU1cnuhsgr0cysp+yOcQ@mail.gmail.com>
 <af20eb97-2fca-4ab9-9759-90b210b34802@intel.com>
In-Reply-To: <af20eb97-2fca-4ab9-9759-90b210b34802@intel.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Thu, 24 Sep 2026 21:45:05 +0800
X-Gm-Features: AclHuK-k2HlTZ7P5DTUJL2j0cqyTUAaIHPGi3MajOMUrhuB7BSfKPVp4d38KpIc
Message-ID: <CANUHTR99pQfVVjNiQbVFQ9y9EAgTgxu6WbdSAcMxpWHJJuTJJg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: SST: fix platform device leak on probe failure
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Czarek,

Thanks for the clarification.

On Wed, 23 Sept 2026 at 16:15, Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 9/22/2026 10:17 AM, Guangshuo Li wrote:
> > Hi Czarek,
> >
> > Thanks for the review.
>
> >>> @@ -361,15 +362,21 @@ static int sst_acpi_probe(struct platform_device *pdev)
> >>>
> >>>       ret = sst_platform_get_resources(ctx);
> >>>       if (ret)
> >>> -             return ret;
> >>> +             goto err_unregister_mdev;
> >>>
> >>>       ret = sst_context_init(ctx);
> >>>       if (ret < 0)
> >>> -             return ret;
> >>> +             goto err_unregister_mdev;
> >>>
> >>>       sst_configure_runtime_pm(ctx);
> >>>       platform_set_drvdata(pdev, ctx);
> >>>       return ret;
> >>> +
> >>> +err_unregister_mdev:
> >>> +     platform_device_unregister(mdev);
> >>> +err_unregister_plat_dev:
> >>> +     platform_device_unregister(plat_dev);
> >>> +     return ret;
> >>>  }
> >>
> >> Looks like sst_acpi_remove() does not unregister the devices either.
> >> That could be fixed by enlisting devm_add_action_or_reset() in
> >> sst_acpi_probe() without altering sst_acpi_remove() at all.
> >>
> >> Would you mind sending a separate patch updating the function so both
> >> the error path and the driver-unload clean up the device objects?
> >>
> >>
> >> Kind regards,
> >> Czarek
> >
> > I'll update the title to:
> >
> > ASoC: Intel: atom: Fix platform device leak on probe failure
> >
> > and trim the commit message as suggested, including the
> > s/machine drivers/machine board/ change. I'll also add your Reviewed-by.
> >
> > For the separate cleanup patch, do you mean something like this?
> >
> > +static void sst_unregister_platform_device(void *data)
> > +{
> > +        platform_device_unregister(data);
> > +}
> > +
> >         plat_dev = platform_device_register_data(...);
> >         if (IS_ERR(plat_dev))
> >                 return PTR_ERR(plat_dev);
> > +
> > +       ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
> > +                                      plat_dev);
> > +       if (ret)
> > +               return ret;
> >
> >         ...
> >
> >         mdev = platform_device_register_data(...);
> >         if (IS_ERR(mdev))
> >                 return PTR_ERR(mdev);
> > +
> > +       ret = devm_add_action_or_reset(dev, sst_unregister_platform_device,
> > +                                      mdev);
> > +       if (ret)
> > +               return ret;
> >
> > This would let devres clean up both devices on later probe failure and on
> > driver unload, so the explicit unregister error paths from the first patch
> > would no longer be needed after this patch.
> >
> > Would this be what you had in mind? If so, I'll follow Krzysztof's
> > suggestion, organize the related changes into a proper patch series,
> > and send a two-patch v2.
>
> I do not mind either approach. There are two problems here:
>         1) leak on probe() failure
>         2) leak on driver remove()
>
> So, two patches-approach IMHO is perfectly fine. And yes, enlisting
> devm_add_action_or_reset() closes both 1) and 2) in one go.
>
> Kind regards,
> Czarek

I'll use devm_add_action_or_reset() to handle both the probe failure and
driver removal cases, and send the updated change in v2.

Thanks,
Guangshuo
