Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C006951C31
	for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706571963; cv=none; b=GOVt4H7NArIpCyuuqXZ6q2rOwAsP86SDt+KmA1In7WuuI09wmw9iDzo1Qj+SjUb8n1r0HVG4IVRmcm0FzFMN+IhshHZMTbao+76ZMPig3MloyblIb4RN4gcenU1RG6RYjJ4wNcB+1zwmsYiAw+GJ/k0cZQP1qkx07jZfa3SQqLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706571963; c=relaxed/simple;
	bh=RmMEV0VNyUZYA7LEC4ivbBMd8RW8rDgiGw7jNtlMQ7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAFiu25VLJe9BBLJ3nfDhn3H6wKALbgwLPeFQTqyORuJHGOtfVWnfZzaXICnqy9ZaTY/Ib9YCPSSUuhiQTpMzQ4g4WZXn8byYH5irtfVMAV1Fd8nAkm+N+u7ViPJ2oBlzgO9A0Vz6PiDrskGZlb1JexPX1PPHQXvr3z3gtMQ0LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIPwbGVj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIPwbGVj"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5101cd91017so3584358e87.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706571960; x=1707176760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlEQjUIJB7dCheHxxvwo8H1ivYBLyeVZnOGfAR0f2hA=;
        b=eIPwbGVjCuhyWIDldDw5Kn3f76Kn8BQDgoVumbc4x/+s6MXAerrtvjNwqmMuaFteR7
         i4dNj5QlbunXSQC9Dj1KEZd7Z9fdsYBst6BTa1XWW+aRBlmZ/WLa873zOfVh7uPQH7kM
         3qkJf2m/xSC2FV9Gv3YB/n5O5WEUd9aq4aTcP+in2EbHjmbGJAy186iIxir5tejIekYL
         7bVOKQQCijDSapW9kOYMY515V4c2D8eAnYTXY6p8iEZmQpDica1bbnh6BN7NRnPxMSQB
         q3n/Ij7tJp4H3TIF/eDlpFBG3p0HGRdGCPaHMf6Vap8ykCMZryfVphQgavgYsPT3RJUE
         6kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706571960; x=1707176760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlEQjUIJB7dCheHxxvwo8H1ivYBLyeVZnOGfAR0f2hA=;
        b=lMZ/n7qwAWG0u++XXGR53alMTD3N1Nz/f0uO5LPcrqpSW2wu8Eq5ogQV7nkyv0lhPQ
         hv4wVhy4UscyXNpucILBhP1jKFmViJr5jcnWddRE9ILSwD0InZc2kgNOsjrzNETN1xzE
         LxxscbkUOgfEHgDFRkFu4RrFxfR/sGLCn6YfyR22F3IBk1Vqihh+0W+hrpymDfKAkMGj
         C/ed2sqOqh+i5oMuFJMR9wTzeL2RCo3hy8S5WbKXxrCwKS5ATiqqYhj5yz0tyUZoP4xv
         V7cYlFbaHlofUh212JGL08m6qY5m0U+GFgFU8A0Ny4mohk5oRVrLZfwAN73HUJn+tkpv
         6qFA==
X-Gm-Message-State: AOJu0YwdE/On/L4SPLyz/pyIzip79AoeRs8GR0DNx7grFaUYVsx1sZRm
	csI4+v37NZ9KE7QCC7MLrdPOXplyn5RrtLnCDsQRJuSsViRXJ4MSEIkYX0R9DvsgmsduyFCWehq
	OMFZt3LM1TD35AJjlTDsiRiabSHMxVFQpEl4=
X-Google-Smtp-Source: AGHT+IEMCNcr5oDi70Ke5cV/vgOCbRD3N1i1GKSz6ZKS5FmjnqHJhrby7FOraHiKdFHhIg4p+a5BVIJEN6oTJ+TEBnI=
X-Received: by 2002:ac2:4c12:0:b0:510:1a2f:cf51 with SMTP id
 t18-20020ac24c12000000b005101a2fcf51mr3535808lfq.7.1706571959426; Mon, 29 Jan
 2024 15:45:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
 <20240125103117.2622095-6-ckeepax@opensource.cirrus.com> <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
 <ZbfR3IzRYpP7YCns@ediswmail9.ad.cirrus.com>
In-Reply-To: <ZbfR3IzRYpP7YCns@ediswmail9.ad.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 Jan 2024 01:45:23 +0200
Message-ID: <CAHp75Vf-HBn1gdaZipuvP0NtKO8s833apH_Kfb2Ur1jnLxH1QA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 6:27=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
> On Thu, Jan 25, 2024 at 09:11:44PM +0200, Andy Shevchenko wrote:
> > On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
> > <ckeepax@opensource.cirrus.com> wrote:
> > Adding nslots parameter is a good idea, but I still think the code can
> > be refactored better (have you checked the code generation, btw? I
> > believe my version would be better or not worse).
> >
> > > +       for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
> > > +               if (i =3D=3D nslots) {
> > > +                       dev_warn(priv->dev, "Too many channels in TDM=
 mask: %lx\n",
> > > +                                mask);
> > >                         return;
> > > +               }
> > >
> > > +               slots[i++] =3D slot;
> > >         }
> >
> >        i =3D 0;
> >        for_each_set_bit(slot, &mask, CS42L43_ASP_MAX_CHANNELS)
> >                slots[i++] =3D slot;
> >
> >        if (hweight_long(mask) >=3D CS42L43_ASP_MAX_CHANNELS)
> >                dev_warn(priv->dev, "Too many channels in TDM mask\n");
> >
> > The code is simpler and behaviour is not changed.
>
> I don't think this works, the limit here is on the number of
> channels not on the position of those channels. The last parameter
> of for_each_set_bits appears to measure against the bit position
> not the number of set bits. So for example 0xFC000000 would be a
> valid 6 channel mask, but would result in no slot positions being
> set in the above code.

Ah, indeed. Then BITS_PER_LONG is the correct approach.

--=20
With Best Regards,
Andy Shevchenko
