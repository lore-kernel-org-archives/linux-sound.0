Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF7231A41
	for <linux-sound@vger.kernel.org>; Wed,  3 Dec 2025 06:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764742203; cv=none; b=GYy4LzylsibvYf3EzAr6UfVQXpmk6Ma9deWQAnrGT8eSOpUMM0VRXWt5r44QJOZWE71SwpCQPSrTCndJEV1MpzpXPOv+AgTvpIi/Qr+pXBDeT0kUbPP2h55JyfXzTr2McZ5QN2Hen6qR/+uH/7HivpnZdcSEEQePoZUEx5i3xW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764742203; c=relaxed/simple;
	bh=dRkqLCwb060C3+zapJxtd4kVUW7EnWK4hIJqPawwJJU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeO3fP3RvNswwVyxZ8V3svZlYFWhuRaQTNh+qCzn+2O5PUuXvXeNMs4U0zUsYgY5WAuNgTnEYn4Z6XyU3EzpLyEjZxwGSrHVs11X3XqIbi51fDpH0Fqlj8y2Hu5/BKClwkaqxzB2q2+6aL9WrNh0qH0UN8CPoiQn6ajHZl4Yrp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUd0Tmju; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUd0Tmju"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29586626fbeso78067615ad.0
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 22:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764742202; x=1765347002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG+D8buIw53AifXcbibNbBX5wNUF3zejbV3h/Ah3aeU=;
        b=jUd0TmjuL41bcxOCBp5+ZcOg9lvvGwd5LpDzHa+FmSl03J7cZO1QaJ0aCzL+AaRnUG
         xrvRZX3OPnbPcQDZOsPdAmH30IJGTIJsLfK9oYHDCXPpfJ2loSqFrXAh8R0v3YrKa4EB
         u6kp9zoIjwua5YUcd5Qbvz+IJ0xwvfjTYzlBy+vG0m7wUSpWDLVb/7XqEvP7a6bh6g7j
         YIYhhGNPiGZSRjISckal6lLmTZk21YJIHwzERQORT0awGra5jFl0rFADhrGo2t3hAxZu
         r+xCvj314StIT+wGDkdgi0gY8cX0V7j+WmVVAx974Do1VCs7sb8te0wDAPDxudn8FG5U
         M9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764742202; x=1765347002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CG+D8buIw53AifXcbibNbBX5wNUF3zejbV3h/Ah3aeU=;
        b=FJZ2csJ20ywIXuOlFLOrnv9ekmE2UKvll7Ta9g6A1E9JUiYgCKujle24nk65S6CEYA
         L8KvcRJoXWmonOHYSN9g7vPfFoZwKryxUK+riYzPijbRuguZwldOkE80ClLjgBlct+59
         xk1xyZOLczC94mZQYHAFgDNkPAC/k493brOrejYXB5kS2efQbc+Ra4Hs9NSo7xUy0kSA
         kZohDFViZoV31g9zN9rQ2GtBjiK3wgWBvQyPTnKEVWr47bw1BdWvqWhltGnzHjOjA0tj
         U7QPEo9yvfl+1ABF95gNQxe8b4oVsOAk7wsM8+l87vQEgt8EKm8RMzRfWV6rC9dBOzor
         XKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdkVSiSz01vKfrqASMb83eEDD0t6U/b4uGTlZO9cpDKeGWQehKyELRMemT+dTTzjlYNMSEWsVSMfqlIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbAlMVpb5tVMJ1BgBvAIX5OI+VmnUi2BjGvRsa5QUbpg87jW20
	7jQhCUXqG0AaqpQUhxdXNXoy3OkB1sGxj5dMDZG2KV8FJaUCM7B5f5KAyU42dcBQ3ZBJuVgsRnM
	EENmKWCdZICg+AeU31bsIHlPLhKxItv8=
X-Gm-Gg: ASbGncv2sApbjmN+PE1vrALw4/eYne7uxUavdTvPdouEFp7dHT1ZSuS2/na44bVRne5
	ePQbbPfrxj/Kreg3WcHN46mRG75femMt9/TxWSffOtoXl0Tb2H/ypRuY8+yYHtlajgBJaXE0GAG
	QkchKI6HMpwGtKuMsibbRZ1lpsHv66Bttiw7zARApf7h8wRWsBTFmonJTRdAARwLSw4Ah+gwDNp
	xClFNLa8aY0T0xV8ob8HeoUP0/xXwBe3EhVL4jO34O+yB79PiglpM77kcBJB8cVtPqIQl8=
X-Google-Smtp-Source: AGHT+IGFUk/6xEOOW2a4Vm5GIf8vTHzdr7EXagI4vOqBjGoGoPmZkppDvcLWt57GriqXrXPph9+z/adfs5D42AKyI6I=
X-Received: by 2002:a17:903:234a:b0:298:33c9:eda2 with SMTP id
 d9443c01a7336-29d68395648mr17842375ad.33.1764742201743; Tue, 02 Dec 2025
 22:10:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202083535.1985714-1-shengjiu.wang@nxp.com>
 <20251202083535.1985714-2-shengjiu.wang@nxp.com> <7d926b4a-2fde-4411-9f4c-e12a9a2fcb81@sirena.org.uk>
In-Reply-To: <7d926b4a-2fde-4411-9f4c-e12a9a2fcb81@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 3 Dec 2025 14:09:49 +0800
X-Gm-Features: AWmQ_bm50Lnpfq093c-7y4KxeWNAQDnrTsYZxEywcCyUclr5kGcLTcgAZHFbSt0
Message-ID: <CAA+D8AMOGxf8Ln0vHhD_c=0WJ2haWStLqYqEnQS0NPfm1=3L=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: ak4458: Disable regulator when error happens
To: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, andriy.shevchenko@linux.intel.com, 
	kuninori.morimoto.gx@renesas.com, nichen@iscas.ac.cn, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ckeepax@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2025 at 9:38=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Tue, Dec 02, 2025 at 04:35:34PM +0800, Shengjiu Wang wrote:
>
> > --- a/sound/soc/codecs/ak4458.c
> > +++ b/sound/soc/codecs/ak4458.c
> > @@ -671,7 +671,14 @@ static int ak4458_runtime_resume(struct device *de=
v)
> >       regcache_cache_only(ak4458->regmap, false);
> >       regcache_mark_dirty(ak4458->regmap);
> >
> > -     return regcache_sync(ak4458->regmap);
> > +     ret =3D regcache_sync(ak4458->regmap);
> > +     if (ret)
> > +             goto err;
> > +
> > +     return 0;
> > +err:
> > +     regulator_bulk_disable(ARRAY_SIZE(ak4458->supplies), ak4458->supp=
lies);
> > +     return ret;
>
> While we're at it we should also put the regmap back into cache only
> mode, not that the error is likely to be usefully recoverable.

Thanks, I will update it.

Best regards
Shengjiu Wang
