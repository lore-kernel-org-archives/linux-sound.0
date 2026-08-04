Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F56E43CE65
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 08:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833674; cv=none; b=iWIk9WCZGKM9LenmJQEAWdKwvf6hSZDzW8xS3x9jHT2caJQEWN2blZY9d3D4ujuS4iIBn32bZHPaAJ9tXecpeZKHYvVvKtHuWk1q5P1KwXYpx0rL2uBPALgB6bjQ99F8URNeoDQyu/d1ZfuByacUm88kJtW8FVCQLoXB811Zylk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833674; c=relaxed/simple;
	bh=lln6EEaihni+C8Z+tr3Ixt6m9HOhXXjjEU0L6WGxVwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVkADHkZ54r6/RUQNCfRYychb6/Ao3iC/vShPBvc/e6gp61TycTCOYV5Vt0ETppL6Rl/uY0LIqjAhZr/DYjHYq6KhwODZ2vv8b8rmsmLnEXAOIKPf9/Gsvebl2yEt8yOd9HMmObnBMkhqnLoqoMi/Mzb6q2il8lhls9AlmWGJJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiXTlLug; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiXTlLug"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47fdd674e17so1410052f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 01:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785833671; x=1786438471; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekdlIgDn0WjTIVkQaZPcjiy8/GGu01euGj9+PafWw/Y=;
        b=EiXTlLug2b3PyTeRQMqX+3PlL7dWLwZLU2bKSOw6bMCdm0Nkd4vVffQmr8logg6arv
         6/tnlmXvKj3NJvfECjrlPQEYzlr0aKSo2ZWyC7LHzfLmnBq0hJ03/BdUEF/dhNOvLgAr
         x84WMQPB/bheIMGYK4aoORorRlVwYYj8560TNvi+fBjlr+54J+UEngwujPrfxqxSTzm3
         HHS5k41mQG6mClat8gwqL1rKulwnlm18XH/yDsiKcUyCoBiq3Qpn9vDCrRmievk7gFSN
         77IIfAqVNxWtZhMX8wCKkaMaXkQU+w2NUM3l3m4bTGYKf2Am2nrbLs6LQcenuqpqxhUy
         4HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785833671; x=1786438471;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ekdlIgDn0WjTIVkQaZPcjiy8/GGu01euGj9+PafWw/Y=;
        b=K/1miBvqKHkXAWqxOBvspjIsq4l8m/eggO6Z9x3a/NLqcDGFeaCwdj/ph7MWUXijtt
         6H4R9cmY9Dqh7AeUQjU8PAEOtAw7OxUuTCf+k3hqE/ujWmZwRh6PcDPWSll5fjee9Htl
         m6llqeSqmL1q2D+nBgFy3ZH+p7S+f4HaKVRqafAJ+2NdH0TY5bfswg98VqYy6coIXsgF
         a8DGFuXt0sX8izDu+nb42C53+VUWO/MVUUF+oNuWB5+Fj5UBCBpbtGgcYWQBT4HmS7N/
         uoBGKsKO8JkA/LQVRpvUth3dbNGTTaVE1S56xBaMhZD5Vio7pFlNLVRxHq8vB1N9YTnC
         C9yA==
X-Forwarded-Encrypted: i=1; AHgh+RpkqViTeqiWCRKQ4iRrSyZrJwlA5Z50QmOFgihQ6NjfdstVpGHY+XExDae0TXi7T9XFjKqOvFjvwNDbrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu2SV0MRTCsL5y8BUndahN8rPgqETddKvachM3bydzTFTisWgZ
	UrjmFZrtoXGsDB0ieN3RQP0PKSyhEHla30L9/INpp4gQreppm4mwX4FL
X-Gm-Gg: AR+sD10Sqk3Hv8E4JHEqyjCBGGyx5+aLkxYn3AbgBsImsKh675773XnYNf5Ha+oKALu
	G3ZtVjA9fOhLmb/pTWNYrG5hImvwd11VIWPuXvGzcsWmRMxDuAN/cYdP2L5hQXtajfJluewSIS+
	3D3W+wqnzoId2ZZ+MdLlOrLMjigHP1C5vtiLsH3YxwbMTp7HL5BO/Gu+sE55B7pCrYLrI8oduTe
	Ks7o4PXSNSn/0oDeF3JsR5cIrPXZGUn9vpTKvs1P3jp7ONPsS7TDfCffocmU32cirLlQrX7fzD6
	BB0x+XrKTuC76pMvbqEtn6xdFNAytL43xNerQjszIHFoq5ENFzp8hc83bF6BHrpegGRFiI9KeRQ
	NMGOrT6a86qaPOAO2e89jLDK6wOv0IQIH7POw0WKMjpE3UNaBxM/dpyFxGcMqaqtYLdRLFQN/03
	yYpP+nh6P8sqy3lqwBy4+Gr7c6EkQoP+D3s/+Y88Y8ABeDouD3QdIH
X-Received: by 2002:a05:600c:8b13:b0:498:8e6:d464 with SMTP id 5b1f17b1804b1-4980c65cd2fmr325604265e9.14.1785833671212;
        Tue, 04 Aug 2026 01:54:31 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fd08dfsm81198295e9.4.2026.08.04.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 01:54:30 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:55:41 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	=?utf-8?B?Ik51bm8gU8OhIg==?= <nuno.sa@analog.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/44] ASoC: codecs: adav80x: use .auto_selectable_formats
Message-ID: <anGo-yAYOd4aCHy5@nsa>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <875x1qyay1.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875x1qyay1.wl-kuninori.morimoto.gx@renesas.com>

On Tue, Aug 04, 2026 at 12:40:54AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Acked-by: Nuno Sá <nuno.sa@analog.com>

>  sound/soc/codecs/adav80x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
> index 8a89187f9c782..e97c72ac9b2b2 100644
> --- a/sound/soc/codecs/adav80x.c
> +++ b/sound/soc/codecs/adav80x.c
> @@ -743,11 +743,19 @@ static void adav80x_dai_shutdown(struct snd_pcm_substream *substream,
>  		adav80x->rate = 0;
>  }
>  
> +static const u64 adav80x_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF;
> +
>  static const struct snd_soc_dai_ops adav80x_dai_ops = {
>  	.set_fmt = adav80x_set_dai_fmt,
>  	.hw_params = adav80x_hw_params,
>  	.startup = adav80x_dai_startup,
>  	.shutdown = adav80x_dai_shutdown,
> +	.auto_selectable_formats = &adav80x_selectable_formats,
> +	.num_auto_selectable_formats = 1,
>  };
>  
>  #define ADAV80X_PLAYBACK_RATES (SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 | \
> -- 
> 2.53.0
> 
