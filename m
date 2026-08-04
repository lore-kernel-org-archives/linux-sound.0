Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0882C43D4F7
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 08:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833463; cv=none; b=KY8fyDgGhVzKQgzFE/HbEeHPeBrgcEg/bZVBZdN3B/cyjgtf69rksuQcS8Jv4AiTqIKTqdHjyfIMEt4/Cwz1/j/ydRSth1Tx4O8owFP/u0Zfk2KQNqF297Iazn5hV7aq18YzlQA6DZ5/UW+5jh52dqmAMMR6/jCcK58MADvZUXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833463; c=relaxed/simple;
	bh=tk2kg+hLwPj+1ic3hf6MJkuPjREZ/r8826ehN1VodlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoYsdu+nAX6BDWJf3CKANNIBzk2yLUpJ7LE8w0lNJqIUzNrks5HF5CaE2+hLR6Nfoy1g0jxjXVS9DWkS0M2BSL+eLQQbYmK58SP66XY3BmNmpJIgbJD0NDT1X43I5S8IDWph5LUdRr1b5MUZ7PJuKwxxFogX8jX5exzB+MJ+CCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWkqZ81s; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWkqZ81s"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe377a217so1087992f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 01:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833460; x=1786438260; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5VXWoAgjEFnLQlK/MqrqLxpCBi1bzk99NGn7tjaGYKY=;
        b=DWkqZ81szL0R4panzXTgC92432aGk0J94hkOgE0OOsnpAC7U+s9c7foBCz0OyheWGV
         5vb51hD0yivBCqHGMCL/Z0XNnuD18m8r7mGklQkkBuo3fINwhndBFtWHkj78CD46tv97
         n+ZJAbXL8bTiMgV7wgXDtuZ1JZ9R+WrbAcUHYiF9LqGxEfNjsbnPnTtBHvRZ14IL95NB
         LV5i8lBKzqIYe/DUfUKs7fu9F4vibVHnQdo8FJxkUFE2h0bfMmIl8X/lP315wWa1RSgE
         1ELrE6n5fH5wmcUkLXwGJnfs39yoti+O/GAyUd2LEAG5gG/h1ESJWV217rsJm+d/Q4Xw
         9vRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833460; x=1786438260;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5VXWoAgjEFnLQlK/MqrqLxpCBi1bzk99NGn7tjaGYKY=;
        b=S9ZzLfRqsjJNw1lA3xw5g4o6kbodvHmzi/nBZNM3Py0O783gFVta6V7600bGBMhhtr
         1zCBX3v/fdVqj2Q5WzySwnFGseOsBDnVfhKRunqgmnMYeAS5UuTgWS/LfIkJNzXKa6X3
         aWcLlETWtHqxY8IabYAlh4mMg5O+fzxk80TNx9nIY9jy9tvsAC8MrpRpS2GFdba0CVeB
         Pk1i/bgDs3JyyD1XfNoC+pfYJFPgYO0jdEfEBc6d7E+tMfQXVUnf2lZYjP9pyEnsS1O5
         MEiYeC+02MXB0T6ScMYyukK11WFZ71a3WJ2st9sAeVuXwogQDTdXvkwAjmwaqBLrkYY/
         6Q5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3dvjd4X3rekgXhZcAr7EPncPw1CF49IG2wJ+YTOwatxbrcJIenzkBZaIQvZJtGx+cfs9q84HZgIl79g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLY3WimvVWmxc8iajQApoDcp9wLld1E4bP/izBJOS18R/0IzI
	INt4phcIBVecIAkxEd+SNbnJdurKBUZ2n8Pfvb2JBSR2uBeHmV7F7Pu/
X-Gm-Gg: AR+sD10MaBhbRngXWOkf7OaFMOnQFOvIJA3NGQiZOu4wyyiiWVz+Cc543SFsK/JV0aQ
	dCWYV1jgbd3rnlOJI7XorlIjUf+VViWSJi5QH3aPgbYB/qH6RrdxzqTDfzTCaURaPWgZXxD0sBp
	BPQuzCAhPdU6J5AV67L6w06ZqEeJX/88H8sroE+qqK7eRPqjFsWks2QZilUxDN8swuyfSLTHp0h
	+zENu/sabhM6D9MExV7fpyV2GuHYL7BgerhYEzj0PCpnV2edfab7q7SJ5QNEkNicAqooyalvhGa
	IHmFcITZ9pKancTUHItxWuUfJVc8SHU+KBYkD4yXMgpMlLPKP78UBre4CLD9LhcwCJplM7k/bYZ
	7t1GnwIbupI577HUTCjSzL+SG92FR+SBSXCCpazr2zbKc15FNoviU+jEuPH3xY1Oe/UV+01yKFO
	6/qoNuOJSsaCVkLz7UexuY8Hw9JVdL5GqhH0GmnBcBxKPvw3q/0ycM
X-Received: by 2002:a05:6000:1a87:b0:47a:b86f:3ed1 with SMTP id ffacd0b85a97d-47fd72c6dacmr33596281f8f.21.1785833460108;
        Tue, 04 Aug 2026 01:51:00 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2961sm45500174f8f.13.2026.08.04.01.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:50:59 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:52:10 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?utf-8?B?Ik51bm8gU8OhIg==?= <nuno.sa@analog.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/44] ASoC: codecs: ad1*: use .auto_selectable_formats
Message-ID: <anGoKJer9xaMSXCn@nsa>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <87a4r2yayk.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a4r2yayk.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Aug 04, 2026 at 12:40:36AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Acked-by: Nuno Sá <nuno.sa@analog.com>

>  sound/soc/codecs/ad1836.c |  6 ++++++
>  sound/soc/codecs/ad193x.c | 10 ++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
> index 8afeadcaf8b09..dbea83bd49b69 100644
> --- a/sound/soc/codecs/ad1836.c
> +++ b/sound/soc/codecs/ad1836.c
> @@ -193,9 +193,15 @@ static int ad1836_hw_params(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +static const u64 ad1836_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops ad1836_dai_ops = {
>  	.hw_params = ad1836_hw_params,
>  	.set_fmt = ad1836_set_dai_fmt,
> +	.auto_selectable_formats = &ad1836_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  #define AD183X_DAI(_name, num_dacs, num_adcs) \
> diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
> index b93531c3a9a40..9841c779b1752 100644
> --- a/sound/soc/codecs/ad193x.c
> +++ b/sound/soc/codecs/ad193x.c
> @@ -394,6 +394,14 @@ static int ad193x_startup(struct snd_pcm_substream *substream,
>  				   &constr);
>  }
>  
> +static const u64 ad193x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +
>  static const struct snd_soc_dai_ops ad193x_dai_ops = {
>  	.startup = ad193x_startup,
>  	.hw_params = ad193x_hw_params,
> @@ -401,6 +409,8 @@ static const struct snd_soc_dai_ops ad193x_dai_ops = {
>  	.set_tdm_slot = ad193x_set_tdm_slot,
>  	.set_sysclk	= ad193x_set_dai_sysclk,
>  	.set_fmt = ad193x_set_dai_fmt,
> +	.auto_selectable_formats = &ad193x_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>  	.no_capture_mute = 1,
>  };
>  
> -- 
> 2.53.0
> 
