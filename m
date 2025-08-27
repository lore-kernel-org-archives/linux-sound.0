Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F58E2E7F32
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756294585; cv=none; b=be0gg/C8USsG7HKWvQbL4S7tuIpcJkiNQot2/QkcCalpBEUucuXnyzCZiTQIjNBuVSbrAjUuiocinDcBEAT1gQ5wlA2XWTnqyWnAKK+EQ9/uV8gjmvrbI8M6YD1aznhkbB8+Ih0hXbJjR6dFmPj5791DTe3tAFzWaPj/QYfLKhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756294585; c=relaxed/simple;
	bh=O3eitJuzRgWQvGyLZYLhgSYK9bUuaYTEpUnbx2RI3Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvjRmhvki3E7Waqfkh0UufEum+Gw1FC70v1rhWsfly7c7umV9vL/63JC0x3MFGs1Gpqf2A8vNxETQUFjq61KUe0F6PFVVYgqsj0jQWrB3k0hxjg/0YX/3mKtd/RMfkCdEih3x4AFjek7suob0KpHVkzqaEpo0M6u8ZKoNaeF8YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hS1kii+C; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hS1kii+C"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71d6083cc69so51477067b3.2
        for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 04:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756294583; x=1756899383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k2Qz3JJGsL9D4wGHU3rCYyDRlWinL/Eb1in8wszcbu8=;
        b=hS1kii+CvdC/RmnaEcVeTvbT/J+l3vql5gZL5cEMtV6joyCIL1LB6eqY8S28VyGocX
         cTI0ci4rJT1sbVUs+EYO21VR+M6DwiyiCE/Zn7NyT3TELcpxIm5c07W+V/uHANZZViy8
         1YyaNyILwCifDiuzWq13tKM/ZLPnxOMOqUJpv/9zdGGSEJUav16gibZCB9S6ajWQx7V6
         zpyO6N3uBFwtmXEXWdJkpSEoT6mhXuz2oFIhqHmNHzGhkv8RHWj6SIE4ee1+RG/w8qmj
         dBhx05qRb9h7T9opu3ev+XKY6/Y7OqsE9s+yat7cmsTpCZm69UNZkm2beLPOng+8khVj
         Cb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294583; x=1756899383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2Qz3JJGsL9D4wGHU3rCYyDRlWinL/Eb1in8wszcbu8=;
        b=L4hffi5cyURhRVFxlrYftNC3tCwCeKKMVr1JYkn/eUMo+m22/2ahx7lGljXQ2mYZtn
         ihoQ0lzKTrga1b+OZGcZE055/mNZABBe+gWNGha/a4XcjS+PeEl9aN6N/Oi9Xb3h9tFi
         SPHz8IUs453NCvZt4vwR16c7Hm50nUmKnPt8YYlJ0EmQEJE6f+GW/QWPbcgsxI4Vyt1j
         yhsB+twTRJ+JgMYY+UM3//F5iryBy6FOwH9fFw2GbfMNT1Wb6lEgCeM/Tq0CWzDzChx6
         0mM1vyyPExCHxDkTePQlGuhyaLNO1iscWP90FBKa5vFsaaIyi8qWh9ZIWTqSpO1TJQV7
         rBDA==
X-Forwarded-Encrypted: i=1; AJvYcCUTp+iK/lZHFwMfKSK7iNl7XUHV3Gq5IEERBy2tuihwIkzwT21NZerQ2UQel7TvlBJZEJcMdUx/lfo1Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1l7VF0QtQgQZpS7B5XVrZ1zmpuIUnxDsGcVbaakrRZ+/64Wvb
	HPApziRSIMIhLHzNS97KGTGXIEHwR7TYvN6Fa4jEKNpa35ZE9n3Y5jSzHZoFWlFJS9Ua5SD9h+c
	rZ3LM1PDi3y96oRDi6IayaJAGElbNmeYtYUQ6y7lhgg==
X-Gm-Gg: ASbGncuYE+aWdyAQddaxdIC8+m4iAECRZ7dpMBADL8Yysne6ZDhrfvKSzz2HEXJ5kx5
	xr09aC04AskBKfbURM0iYwAXTnj8FuLg8wM98keAlmO5Z3lIIPzVNeZuBdznigg/T0BQMOEYv2X
	7ufRLUNYKsKnbZgKstHMLb6Xb6yrHhFBoFujF0R2H4YeIGgsqwVssrRVY7/+WyDziM49lWlxg6U
	iyUjs8=
X-Google-Smtp-Source: AGHT+IEvLsgiZP7XEk06VdymfjjP/GKZtm7qPUIkTeqQ/AIuhvAjkYwilz8JYTzsvz85xP1BdCKItz/6+FVSXGE/AUY=
X-Received: by 2002:a05:690c:f8c:b0:720:b0b0:e4fc with SMTP id
 00721157ae682-720b0b0ecd0mr124195827b3.47.1756294582929; Wed, 27 Aug 2025
 04:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827101506.927787-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250827101506.927787-1-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 27 Aug 2025 13:35:45 +0200
X-Gm-Features: Ac12FXyeLWZsA4yj1i4EFlwBfynQt-VM2iAbtltGQ9rN5JyNKFyZEGRlO6FWsGE
Message-ID: <CAPDyKFq1VAuk-8jT+FzmeOqt4EawJ13e+KhFBVzTqY6QukgYzg@mail.gmail.com>
Subject: Re: [PATCH] soundwire: bus: Drop dev_pm_domain_detach() call
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com, 
	pierre-louis.bossart@linux.dev, rafael@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 27 Aug 2025 at 12:15, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Starting with commit f99508074e78 ("PM: domains: Detach on
> device_unbind_cleanup()"), there is no longer a need to call
> dev_pm_domain_detach() in the bus remove function. The
> device_unbind_cleanup() function now handles this to avoid
> invoking devres cleanup handlers while the PM domain is
> powered off, which could otherwise lead to failures as
> described in the above-mentioned commit.
>
> Drop the explicit dev_pm_domain_detach() call and rely instead
> on the flags passed to dev_pm_domain_attach() to power off the
> domain.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/soundwire/bus_type.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index bc1e653080d9..91e70cb46fb5 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -114,7 +114,6 @@ static int sdw_drv_probe(struct device *dev)
>
>         ret = drv->probe(slave, id);
>         if (ret) {
> -               dev_pm_domain_detach(dev, false);
>                 ida_free(&slave->bus->slave_ida, slave->index);
>                 return ret;
>         }
> @@ -180,8 +179,6 @@ static int sdw_drv_remove(struct device *dev)
>         if (drv->remove)
>                 ret = drv->remove(slave);
>
> -       dev_pm_domain_detach(dev, false);
> -
>         ida_free(&slave->bus->slave_ida, slave->index);
>
>         return ret;
> --
> 2.43.0
>
