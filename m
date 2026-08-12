Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733A034DB7B
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519273; cv=none; b=ld1WuKrmRDwmG62BsCpZYEg4AXKF94uPOoUrAL1xrjSi1riS8GahL0efsKPcOXs3RvCtCUJzH8Cg9cmo29nkZbAa1CVs1clyb3mZteollIH0iTLsScrG4A93UfuglRQ1GpoeEJBy6ydObOB0QRyJdqGImuTkRnTOmVzOu8wvVOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519273; c=relaxed/simple;
	bh=pnuIhBPTvzkQeNITgaJ7kaqmGpPwc9cFFpuFht1t0MA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ish7fwkrdPDs8JB1jnLXmqrHSGfio1bKa3K6FCEs1g+ntcQ9DcDLs2s/chUA+Y719dWwgB8xa2YSlK92wxvhngL2A9syuhMdrOYTeOewQa11qZGcDNbRCOB4Oo4Lo+HdMSucWX8BkKHwSpHySb8Be8XBnCKZeQsZ+oXvwApoHZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aF19WEcN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aF19WEcN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so5281225e9.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 00:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786519270; x=1787124070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWkefhiElPSPTRdZVJLTJxVcTBKhXqYnUTuIdBgRFJc=;
        b=aF19WEcNj8zrpGaIba3A+k0aKhdRSIxUitWxtgZzGmlk7qy9m653iUZvMCRKkCH4n/
         Pn/PMvs1OCV5Nk/sEFpzRlQkYcQ4WWIcgc23mt5FB6oHKNCPS1cAS1LIkksnQdtHpSu8
         t87EsHkSaPDW59T16/aTwq5msXp531Fu415s7YhXlq4VwZ8i07sLrRxp4tC9yJC7O2OX
         3SGa/m4Eeyc2tFidPe38XSg9vDLGOvfA/fmMrTp40I43Rt5pkfcv9F1S6gft8PE6y6qj
         YWaZ0syo7fpAUv9yzTSxfCbCrZm6Wn0kYVYM195p+488CLnx2NxFt+epcVDfzb8JNFWG
         Iv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786519270; x=1787124070;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWkefhiElPSPTRdZVJLTJxVcTBKhXqYnUTuIdBgRFJc=;
        b=WZFga1Jyqv3d4OVnmGlxZNjcnzJxRyLg8QYVIWWoM8qGKyFuIAVNBFFHKbYf+icJOD
         cEN9fMhFe7hRYqE6mwfv7m/IxHHD0tQA0WcX8Hq9aS9wN6xN0fGRYiXmtkHeFv9iOxBy
         3WuR90QTB2bPmypq3yhBW7ap1fFQtE2xXulDefBl96sZQFm8NZLTUcSKYO0i/o7UcFx9
         afSP/cbRazITcQBfq1gW2u/yFdIpg9CBuRW+54qvY1415rAhjC5AQiQ0bNUrP8Cw6xLy
         4asQ9B5431U6pBIzdVXoQ7ssGosrEfEk7qjRNVFn+y5NKAWDIY5fBgEqpZqIfmTHu38t
         xUeQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQ8onZll83++HX2RskQdWCJwesX9dhTDGtIaChEIoRci+NT7fp+CWbuaZL9qE+wEk8MifCSdz8jjY+YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7r8Fy3sp2eGOdh/oqilFRGbn9ptUcfRrcdFNyW70khk4yNJXQ
	lz22ZTyPa16KZka0e/Jfl9MOa9hq8hWwHBdEXtJ/fO4LLq4tA+uG+1u3
X-Gm-Gg: AR+sD1219k79xsscLdYJYwq8B+PG/Vq+V3NRPfWDHVBFtMHVnv458OYbRaDV+RyHZxv
	shYjJ7tzMT1vaV/fHLOPnEWO5oxEr8iXH2/DNznXVquGEAFHkZahEXamlpbNYvhwhuN+qFEim3N
	JhulWqkBOvCx+FhHlwTPMilP8MD/cZr8hSbdJU3L7Cpnhf/j4WbAbmI/drZQfuse0FwzUM7F5rd
	RpmCb6J+oiYsYYzchXSQ6staQeEQzmLBK0P5mo7obK9Qa3Slh6vCe6vXqAGrjgChLh1y0UB4quS
	4aeJ8YM7GDODHyO4QJdLnTtmykdc6XjSJ4a1t1XdHpyTQaGo0SdnK54bAEZIqz7zC0rqb1VSvCC
	DKe0Gb0OwZ2vaA34nemu4QPDl0f3mOXWqetlwnPPQutRZnL375x764kE6z8lMrKqJwPTDzs4Ks8
	Xks/4t6BNH8WMmsjwzndj9TZkZ58X1MMRZlWXcGUxx/5+AxRAgtfF5WuO1eLAOygeeQn6tupVRT
	IfZkzQG5z4y+0m4QdAu3/7qkQ==
X-Received: by 2002:a05:600c:524c:b0:499:7219:122f with SMTP id 5b1f17b1804b1-4997c39ca1emr29427725e9.4.1786519269590;
        Wed, 12 Aug 2026 00:21:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4e0cfsm4812063f8f.19.2026.08.12.00.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 00:21:09 -0700 (PDT)
Date: Wed, 12 Aug 2026 08:21:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: hda/ca0132: replace sprintf() with snprintf()
Message-ID: <20260812082108.67db969b@pumpkin>
In-Reply-To: <20260812033030.635417-1-songxiebing@kylinos.cn>
References: <20260812033030.635417-1-songxiebing@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Aug 2026 11:30:30 +0800
songxiebing <songxiebing@kylinos.cn> wrote:

> From: Bob Song <songxiebing@kylinos.cn>
> 
> Replace six sprintf() calls that write to
> SNDRV_CTL_ELEM_ID_NAME_MAXLEN-sized buffers with snprintf() to avoid
> potential buffer overflows.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> ---
>  sound/hda/codecs/ca0132.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
> index 424224ef4621..d3ac29fd5780 100644
> --- a/sound/hda/codecs/ca0132.c
> +++ b/sound/hda/codecs/ca0132.c
> @@ -5788,7 +5788,8 @@ static int ca0132_alt_mic_boost_info(struct snd_kcontrol *kcontrol,
>  	uinfo->value.enumerated.items = MIC_BOOST_NUM_OF_STEPS;
>  	if (uinfo->value.enumerated.item >= MIC_BOOST_NUM_OF_STEPS)
>  		uinfo->value.enumerated.item = MIC_BOOST_NUM_OF_STEPS - 1;
> -	sprintf(namestr, "%d %s", (uinfo->value.enumerated.item * 10), sfx);
> +	snprintf(namestr, sizeof(namestr), "%d %s",
> +		 (uinfo->value.enumerated.item * 10), sfx);
>  	strscpy(uinfo->value.enumerated.name, namestr);

Why not snprintf() directly into uinfo->value.enumerated.name ?

>  	return 0;
>  }
> @@ -5840,9 +5841,9 @@ static int ae5_headphone_gain_info(struct snd_kcontrol *kcontrol,
>  	uinfo->value.enumerated.items = AE5_HEADPHONE_GAIN_MAX;
>  	if (uinfo->value.enumerated.item >= AE5_HEADPHONE_GAIN_MAX)
>  		uinfo->value.enumerated.item = AE5_HEADPHONE_GAIN_MAX - 1;
> -	sprintf(namestr, "%s %s",
> -		ae5_headphone_gain_presets[uinfo->value.enumerated.item].name,
> -		sfx);
> +	snprintf(namestr, sizeof(namestr), "%s %s",
> +		 ae5_headphone_gain_presets[uinfo->value.enumerated.item].name,
> +		 sfx);
>  	strscpy(uinfo->value.enumerated.name, namestr);
>  	return 0;
>  }
> @@ -5894,8 +5895,8 @@ static int ae5_sound_filter_info(struct snd_kcontrol *kcontrol,
>  	uinfo->value.enumerated.items = AE5_SOUND_FILTER_MAX;
>  	if (uinfo->value.enumerated.item >= AE5_SOUND_FILTER_MAX)
>  		uinfo->value.enumerated.item = AE5_SOUND_FILTER_MAX - 1;
> -	sprintf(namestr, "%s",
> -			ae5_filter_presets[uinfo->value.enumerated.item].name);
> +	snprintf(namestr, sizeof(namestr), "%s",
> +		 ae5_filter_presets[uinfo->value.enumerated.item].name);
>  	strscpy(uinfo->value.enumerated.name, namestr);

That is silly, why is the sprintf() there at all?

David

>  	return 0;
>  }
> @@ -6632,7 +6633,7 @@ static int ca0132_alt_add_effect_slider(struct hda_codec *codec, hda_nid_t nid,
>  	struct snd_kcontrol_new knew =
>  		HDA_CODEC_VOLUME_MONO(namestr, nid, 1, 0, type);
>  
> -	sprintf(namestr, "FX: %s %s Volume", pfx, dirstr[dir]);
> +	snprintf(namestr, sizeof(namestr), "FX: %s %s Volume", pfx, dirstr[dir]);
>  
>  	knew.tlv.c = NULL;
>  
> @@ -6671,9 +6672,9 @@ static int add_fx_switch(struct hda_codec *codec, hda_nid_t nid,
>  	 * prefix to OutFX or InFX enable controls.
>  	 */
>  	if (ca0132_use_alt_controls(spec) && (nid <= IN_EFFECT_END_NID))
> -		sprintf(namestr, "FX: %s %s Switch", pfx, dirstr[dir]);
> +		snprintf(namestr, sizeof(namestr), "FX: %s %s Switch", pfx, dirstr[dir]);
>  	else
> -		sprintf(namestr, "%s %s Switch", pfx, dirstr[dir]);
> +		snprintf(namestr, sizeof(namestr), "%s %s Switch", pfx, dirstr[dir]);
>  
>  	return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
>  }

