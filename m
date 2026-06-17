Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8D3C7685
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692136; cv=pass; b=BoPKV7nIaEaXPR3F+hpWQFanhAtZCaJqFEiWfpqJBE45thYE7mYGmanei31fa8iFBq2eBi3dD3VjOgOO3pexlBaJOevIxV5bmCkdHiHBwveJ7vUobmUsvuf10/bfKyFZT1NOYp+UcozXjLrtErGrBiy8axCVRy0HzVOlyRj0E2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692136; c=relaxed/simple;
	bh=z4zNU9qcxUG5DG2eB1QKwqOR2+bZlgKvI/dvIj49N9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M/yvZzXDgU9PxYbINCm2Df/3TuoOXqb/EsVEgBGBtlQQ/H9pKIY/hacM48yKlvB9uCDqa1O5Wh9tE13uchtwowIy2Zqz4uhNYxZ9ILl/h0RJkb7AmWmidY8+dUEJF5Ox93busahwiwIALgGi10/d2u/+LeJGNLghZwJFhAFB14o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfJsh1MM; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfJsh1MM"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c858014845aso343809a12.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781692135; cv=none;
        d=google.com; s=arc-20240605;
        b=AExbqjxPEdvoyczKT92ekFUJkcvMxid/+bzkb5nvITLWU00zmiEghch+U7YB9uISqJ
         s49gwKn1QO3gz9M+I0dfRr8hYKhTGehwYV4XKcENKcCwGx4iteV9ZRf4WfDPHurMoyTe
         jIpIPBPESxlyZeDfVvDzLvs+XcpqNUMKNmRcfrjYBgp+5+ApPQFpa0JWZb7GIZ0YBZRZ
         b38awkRWSHPoh8bK+Z/L9twbDY2DYQgkBL+V0gGfyOuzEvyC9WkX7/ctypbJ8XkFFZwq
         AUBjHB7IUf2BAZE6HW6JMNXQU1gO5GK7At/cHBJqOfyOCYNWdoXUzJSjeuxgwtROJ6Ca
         ZH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kRjUtdAZ1X8edMk+uEk4qOuv5l+aTxpMz/Az3+07hSo=;
        fh=KZkycZykOLn8SKlcUaYq5jeWqc5wcQs61V45+Lt/mnw=;
        b=WiL5yIgFYHde7qyWmM2IbSPbwjoqRVErT0BrnNGGdMKk6Ayb5xZQw03BIxdYayVQk3
         0e1rGZzif4/nzqmsYTx9hhOFX+NCi/xGYts24Kqz/ULaIstsqv2ifqEoCflm0kepmeXg
         WAsl1zeEJpPeususdEiKcgW9Cdme2FVI8w8A3okZJLYfLc4V7zhQRouVE1DQa8he5GKn
         9RprONpxKq2BpKPkdjs0A/XlWSLHfnvG09PA/c+l0M3U13kp9IimyG5LqEgmTanNWlaG
         xTCxHjv2TVUik8Ysj8w1nZS3gUNkVaYqDl/B0Qf9zhqv+W+EvYURxefQ8s06C+LP2tcK
         iJRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692135; x=1782296935; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRjUtdAZ1X8edMk+uEk4qOuv5l+aTxpMz/Az3+07hSo=;
        b=LfJsh1MMI7gWdxHyhHxxH/EWJCrH++hGeGU21jxf0ImWtLN5Jej7tNaB4AR4wzvL3O
         0ZQd23aZwbHPPkpLqrPXNblJHUXuibXSNBwp1L/qBB8Hla/qJg9NdEMO+d6k91BGJ3Zf
         ficDOZhxcx7UeKk/HIJKMy8YHlWF7uDKY4BsBk+ajYUZO83ehq6OXMBGpKPH80oasnw7
         gBxnEtfbAiyqv9nOW26tb1dUU34zFx4Xei62ccn9+0gQEbWDXSpSSoHOxvfqqRt8DCGz
         zAz2eLwjLrwXxdf/mys7tpf7ZytfFFc+rCaR7E+E8sPko4ou735eV0lxjwF82nojLQRs
         UISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692135; x=1782296935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRjUtdAZ1X8edMk+uEk4qOuv5l+aTxpMz/Az3+07hSo=;
        b=WL7wtrMaBfU3m8jvTW00/tm4KlVmkKGfnPgvSu3BGsmkek6U1P+CtaquZXZPfJ8FFZ
         RA3ELzrylLl009LCXroMLBUad0veG9nRLjyYupzYw0w1Wfc6mZGoof0al5XZzFTEG2WS
         80LOTSKWwwwafQTUhpd3R+KOPvr7oiGpw5OqoDoKO916gEEnaq3qw/kK6ZjyXSYIutAK
         zTjvj77RG+jB3avNG/pkOTCmdBJNM67iSotgrl1eosJ3HJbA+Qu42D2F0d7bU0eLcjOe
         26HLR644E3dFUZe0CdIFf5Tx2gi6fXTKYrVZvRrYs8rOl4BhTr8XvSnsEMwhrUEPhMxj
         LJaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9T7CH8EV9NVkyFOV8GX1rSYQWvfoxgMYNsk10YE3v/yfrDh6zGuuNZqvv4kBT8rsTxzasGtOpYp9QhgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJzRZd2KfQnlFCbdW/t0avS6jc3XbPUzc599qBogrMi8/wk2C
	6y5bTEBIeaHpNg3M968BhcIx2GqN94o2KqlMgyHTO6js4IUxBJUY8BL/AHxZc7VdqdmHsN/1/DD
	RNpdRY/AlWcjQUFhnohUAAg/3og1Z+Os=
X-Gm-Gg: Acq92OGBN+IO8+EAzHphT7GT1lzFQGtHdUGnG9KP4a8uCdecLxTk8AO1GKxSAPZOLJj
	sIxLkEDNM9qMoC897Cz7h6WB4iT/YkjiGnl4U9aynsiNlYxjI1EWnvGKx/77yWbS/juX81399Tu
	FMVgJUaS6LtH7Oyfr0RwJm4jfsCfALC1rkB39KoXF9KdznD+pqgHt6IaNmdcYU9U4+d1XHjjJft
	Pse53ZIdQOlhG5/Kqr7VTEKzR1Q65yvHErth8Lbj7RxmIS22FR/HMuF/CPi+rLt8Ajzes90
X-Received: by 2002:a05:6a21:3315:b0:3b3:6db1:5986 with SMTP id
 adf61e73a8af0-3b8dce967b4mr2334359637.30.1781692134673; Wed, 17 Jun 2026
 03:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616030038.4170204-1-shengjiu.wang@oss.nxp.com> <a5a652cb-d6bb-45a2-a1f5-ca540b34c115@sirena.org.uk>
In-Reply-To: <a5a652cb-d6bb-45a2-a1f5-ca540b34c115@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Jun 2026 18:28:35 +0800
X-Gm-Features: AVVi8Ccnexg7hf0koZrghXGJFMY7u-UOLAfnr_vjOBeW40Mj9iwT9-M8wbHva8Y
Message-ID: <CAA+D8AONvb2PJX871g8yUEtUhq7EGRFMdLm-6yFdTzbTvMGn2g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_audmix: switch regmap to cache-only mode after probe
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 6:48=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Jun 16, 2026 at 11:00:38AM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > After pm_runtime_enable() the AUDMIX hardware block is powered off and
> > remains suspended until the first runtime resume. Any register write
> > issued between probe() and the first resume (for example from DAPM or
> > ALSA control paths) would target unpowered hardware and be silently
> > lost.
>
> >       platform_set_drvdata(pdev, priv);
> >       pm_runtime_enable(dev);
> > +     regcache_cache_only(priv->regmap, true);
>
> How does the cache get turned off again when runtime PM is configured
> off?  I'd expect the device to probe powered up and then be powered down
> and put into cache only mode as a result of runtime PM running.

Thanks for the comments.
Yes. need to consider when runtime PM off case.  I will refine it.

Best regards
Shengjiu Wang
