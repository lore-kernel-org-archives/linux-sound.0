Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5017B50F
	for <linux-sound@vger.kernel.org>; Thu,  5 Jun 2025 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749125972; cv=none; b=k96/A/ZhdBI5lZBuPfHVhFHSBquVlxB8lTDElMCSSoGz0nKl4zoVZcpWfTxnjGvlu0i/F9Je2t/cLxN0J7AZIsDmMOz6KqLhGCWeeJezDMGDxzDfpvFIMqZYm+HHq6im4eEngfaRMQAn/l/AyNXNgVV1LayzuavJgAwtggo54CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749125972; c=relaxed/simple;
	bh=Tw5xA42uRR9UKgE5R9ocElwTKk1C13DtUD6zvoUn3vY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koEzqgCWBU4Jdztjd4iVVFZLjJr+HAw/PbNAOI5ArfR/0gqKh9zC4lKn2n9zuB2mOHsqWRZZggqinj6qvL02Z37BnU6OZsD8bSJtXNmlfBmADF5ckd751DWyjP5IOY7nvh1r/hjmTq5PHb+88OdodwEAKZ+pZ6vARXZnwIvEfgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blokas.io; spf=pass smtp.mailfrom=blokas.io; dkim=pass (2048-bit key) header.d=blokas.io header.i=@blokas.io header.b=aSOMHIWz; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=blokas.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blokas.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blokas.io header.i=@blokas.io header.b="aSOMHIWz"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e78e04e48so7916427b3.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Jun 2025 05:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blokas.io; s=google; t=1749125969; x=1749730769; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDQoeLx1xUMIeYODTvWnT+C1KEpKdarFa+N7garS/hk=;
        b=aSOMHIWz1RRu3+So+WsYcrQthhjwrvNTSBKOxNf7yEmk4bu+J8ZkyOITtq/Zx1MrLO
         0e3D5le0J2tIRwAC+Z+of3dSi1MsBO/Eid4OFU2Uy5edOqTmHbzIQtPj5jOxb4BJyqDt
         Sc9xjwwUWuhJE3tRvX2bgRf8A2/T6Lp5NwPyYKeZHupjHEYwTkuEG6RcebVZ20/A+avp
         QbKNZI+h52pOwAjEubwuvFU7ke3cAgaO0zW70aGyaRol0ld18AeKvG5uTjWP37o6F1Ts
         Akbk79UAbOgi9F8VoGpLBK5G/OMMwxcNyBN1H6r93hd+8it6APVSbw2w5EO8JMQUR2Qo
         vVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125969; x=1749730769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDQoeLx1xUMIeYODTvWnT+C1KEpKdarFa+N7garS/hk=;
        b=ZtDppjuNt+k09dLAYVFeuINxBCBzmJ1Z3tDkhyTbRe5Hg0yQh4lZ2e1wOq0iXs2n+x
         7U6yD04tO8GDRQEF8PH3SpE+9OA3bZ5twR8bVQ9Eh8TFTszu4xDLz0bVYJM16cnpPDlE
         5I5csiKV7GAcvYai/1HpltgMb7y2fdNx/WqrcqCgVuEz2RXewqdxSXZQqnZjjpVe7817
         gMVuw1IZK8w32wTFgf6mlkrgcZi9LqLQy8JiSmXjuCsWF6URsVx9+HSkq6F0IWWvZgbj
         2U7lU6kmvtz4ABQWcwIqqrNoi4cu78lQKDE3YWKr1jw2Qov9+ZkkMIjXpNchO9mJQ2iq
         lPEw==
X-Forwarded-Encrypted: i=1; AJvYcCWBlZ+V2pbG661/WjwFTr1evFE6c8txP9omUkF4TKkJh4thVt/mXJk0Lq/LD/R5fug8rOXOYkx52Clmlg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/VBNJGccQb19ekKdF6zko4+iYjGzYN/j825FYmQelPtxG+pCS
	BX9LOVE4gPh1BKG+pey/L6N28uV7gfC+NPQO6Jg0xgeofBqnMG25cJhvSaLdtlN5MQR3hyzg7vW
	flf0CV6zWu6vP3M44HuHwlkWGbl51AUo+fXXLg+vHIQ==
X-Gm-Gg: ASbGncuR9S7d1uBlnN+OL7AzB8F98tTxFAilDq7bKnd8zwz/2ZRCJduCEsUzgVg8xUR
	8Pt9Dc9cdks/zJ86uiyYOnRQtr3DnqGEnkKJAFG2Lw6wRVaDOEw0Wd0bw1jiCr3MgYJaG1em0Jh
	tgHtXa19AmKXHQ0JWhxbsoQvX1hmoPEkMcVsDDYTcWzMg=
X-Google-Smtp-Source: AGHT+IEs8V1vkIZfaZ04V8ufIpGyN7PngDUdK/YIp84+66wFe0bOPdFxlhOEChfjwlrUq7j6MthIvtwpvSzqXyLdbTU=
X-Received: by 2002:a05:690c:338e:b0:70c:aa00:e0ec with SMTP id
 00721157ae682-710d9f315f9mr90960127b3.21.1749125969124; Thu, 05 Jun 2025
 05:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87qzzzj7t1.wl-kuninori.morimoto.gx@renesas.com>
 <87msanj69x.wl-kuninori.morimoto.gx@renesas.com> <6f9c423f-526d-4395-a8a4-cc3df0c3e724@sirena.org.uk>
In-Reply-To: <6f9c423f-526d-4395-a8a4-cc3df0c3e724@sirena.org.uk>
From: =?UTF-8?Q?Giedrius_Trainavi=C4=8Dius?= <giedrius@blokas.io>
Date: Thu, 5 Jun 2025 15:19:16 +0300
X-Gm-Features: AX0GCFvVfDlpYDWSNpoU_zN5tcGNGLyA9Ihj7fmjnPbG2DQ2UjeNZdpDCs4DbVE
Message-ID: <CAMONXLv5_5j=e+F-6Uct4SyNnUPBoR_=_wbmspApwo4eirQ2=Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-dai: tidyup return value of snd_soc_xlate_tdm_slot_mask()
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note: Resending the message without HTML so it is accepted by the mailing l=
ist.

This would prevent the -ENOTSUPP return code, in case slots=3D0 and
ops->set_tdm_slot is NULL.

Why not simply wrap this part with "if (slots) { ... }":

if (dai->driver->ops &&
    dai->driver->ops->xlate_tdm_slot_mask)
        ret =3D dai->driver->ops->xlate_tdm_slot_mask(slots, &tx_mask, &rx_=
mask);
else
    ret =3D snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
if (ret)
    goto err;

This way the behavior would be similar to how it used to be, except it
wouldn't call xlate_tdm_slot_mask or snd_soc_xlate_tdm_slot_mask in
case slots is 0.


On Thu, Jun 5, 2025 at 2:58=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Jun 05, 2025 at 02:01:30AM +0000, Kuninori Morimoto wrote:
>
> > Should it be like below instead of fixing (a) ?
> >
> > (S)   int snd_soc_dai_set_tdm_slot(... slots ...)
> >       {
> >               int ret =3D -ENOTSUPP;
> >               ...
> >
> > +             if (slots =3D=3D 0) {
> > +                     ret =3D 0;
> > +                     goto next;
> > +             }
> >
> >               if (dai->driver->ops &&
> >                   dai->driver->ops->xlate_tdm_slot_mask)
> > (b)                   ret =3D dai->driver->ops->xlate_tdm_slot_mask(...=
);
> >               else
> > (a)                   ret =3D snd_soc_xlate_tdm_slot_mask(...);
> > +     next:
> >               ...
> >       }
> >
> >
> > Thank you for your help !!
>
> That does seem safer.
