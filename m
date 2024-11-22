Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286C51DDC3F
	for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732270031; cv=none; b=uvrUBUfwV6NJJqJbTc2QWHRPhDRoLYE9PjiqZ373/CPOWVZd+A3NbL8myMeQBy7j7FqYa0MAU+/r/dj9NwKgOv2B2551dJwjJh7hStVgJTGZMe8PAt8iZB66zIhYAafSdwSA2Kgd4YeBcvoaH4WAmUbCQD+tRuznHc4DBeKUvGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732270031; c=relaxed/simple;
	bh=HrORvOgeoi7CsjvIMAMBBpuy7A4MIkIhDkXsUWI8i1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oajm3RGR8CxJxaoe6df6jYtpdhPcfL5JmeKzjpoR1YSIoTedl7W8oO2FavkBQYpUQbDHsz/0zghZDpLLu+OeP2oUrvGY5x0zQ2EFq8S1k5ANnp/dtLH5OiVYogT79uF1z7BPyvG7ryz+22FbZbimd8IIvLqsrB3akh7PeJDNlZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xxOhZPjf; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xxOhZPjf"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ee994218d9so18053747b3.0
        for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732270029; x=1732874829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wnA5XAfBTdueHrT8Vac8M3EiaChTdXBbjyMmEGz1Gs=;
        b=xxOhZPjfDkI4jivFhQlnG+2YJYXSH/MHUOjm/NDzzA/txVbUJMBc2nIeoNHkeRouHh
         apVZaULRohI2uh4saGpBO1xTQJL4CIYTS9OZ8V2TiIhGCiBZULPoOd3HnGjg6CnlKREE
         6FIyW3+B8OleVRsaKFLVsS2io79aktvJu/RLpy4Cx5vemF++l5kgiN8+31EMAx+nsAPu
         4ByT9E6wl/TiMPu+02t8s+90rDbGCywDfLJQq/EBIiKoPfdwFTS43vUx15d0apcgscFm
         ImYhY1nXeRtNWDZGMUy5komPb+o2uVuc6inOzXHzp8VYVzqR60qTKgUyfJPpSg7MSP2a
         fsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732270029; x=1732874829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wnA5XAfBTdueHrT8Vac8M3EiaChTdXBbjyMmEGz1Gs=;
        b=Yw0oE14zUeXFCNtvF5ujqFXdODq08EEpI7zFdji34lE0ijwYhIERGzUNzspWqXY53Q
         Z/H6p+aLGF+e8vpkg3MmuySz99BCgkhW2N/pY8WNFAKb+Plr9Ndlvv2YiecTAGrEfH17
         6dp9/PKEMgPvOS0y8/ZpXaDACAMxc1DHGCXdOuhKndBW0YrB/vedrxNSwKiIwTLGKXJ+
         hJZZqY/R4734QLHu1mQHFU2pooSFCJ7DItcNjuyvoVcPyJ/7x7cAo0KoJfgL51i1GDcr
         Veom0ZOuNob/zqldhkqDED/p55xZU6XB4/VQptEQzE22W5WhLLAaP1NoZom33Ktg/5Ba
         94rw==
X-Forwarded-Encrypted: i=1; AJvYcCUL9RSWMf2MCzebfLSCbB5GcgmaexasMx422yHA/MCQr5EuPoD3eeFRpANIcGP6daJzpOq33lYbPD0w6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAuTe8xDFO2TIsYEj9kCmGj3foJhViHGlPtYGg+OcSdWD9z1Cj
	j3utVPTGEWEdjGM3rQVUQMNTAmae3App5p1laapu/pXhomV5r+nzWLMrOzeu7DKXGNNBv+j37tc
	wLzuDXazIfbknNyK4Uh0XwKMgE6NtKKXL/4Ay
X-Gm-Gg: ASbGnct1dwSPwsNIWRGJtCkb0PeX0SulAY44/iL0WWdOCY+qxw2ALBYzGtJCACHJUfg
	FjI7XBU+blGj9MbI4q/XgDsl8tEC3cA==
X-Google-Smtp-Source: AGHT+IGSJeeT08FvLZr8ORj/qc+NfENO5n9eOMFVkp5Ux5c8C/Pif7wEmdLKhwLNckDgXW94HBR2R4s5j1FhukukWBc=
X-Received: by 2002:a05:690c:4b8b:b0:6ee:4a62:609d with SMTP id
 00721157ae682-6eee0a50cf6mr26544267b3.27.1732270028879; Fri, 22 Nov 2024
 02:07:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121140613.3651-1-bsevens@google.com> <877c8w3aez.wl-tiwai@suse.de>
In-Reply-To: <877c8w3aez.wl-tiwai@suse.de>
From: =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>
Date: Fri, 22 Nov 2024 11:06:57 +0100
Message-ID: <CAGCho0Ueh4cVZy+nUrzCiXZm1VoHNXRya8oU-F2Q7k0ggUEnsA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding
 clock sources
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thank you for the review. Except for one question below, this patch
looks good to me. Would you like me to send your patch as a revised
patch to this mailing list?

On Thu, 21 Nov 2024 at 15:53, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 21 Nov 2024 15:06:13 +0100,
> Beno=C3=AEt Sevens wrote:
> >
> > A bogus device can provide a clock selector descriptor that contains a
> > bNrInPins that is larger than the actual size of baCSourceID. This can
> > lead to out-of-bound reads in __uac_clock_find_source. These out-of-bou=
nd
> > values can be leaked back to the device via the uac_clock_selector_get_=
val
> > calls.
> >
> > Fixes: 79f920fbff56 ("ALSA: usb-audio: parse clock topology of UAC2 dev=
ices")
> > CC: stable@kernel.org
> > Signed-off-by: Beno=C3=AEt Sevens <bsevens@google.com>
> > ---
> >  sound/usb/clock.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> > index 8f85200292f3..94fb628f116e 100644
> > --- a/sound/usb/clock.c
> > +++ b/sound/usb/clock.c
> > @@ -270,7 +270,7 @@ static int __uac_clock_find_source(struct snd_usb_a=
udio *chip,
> >       union uac23_clock_source_desc *source;
> >       union uac23_clock_selector_desc *selector;
> >       union uac23_clock_multiplier_desc *multiplier;
> > -     int ret, i, cur, err, pins, clock_id;
> > +     int ret, i, cur, err, length, pins, clock_id;
> >       const u8 *sources;
> >       int proto =3D fmt->protocol;
> >       bool readable, writeable;
> > @@ -301,11 +301,19 @@ static int __uac_clock_find_source(struct snd_usb=
_audio *chip,
> >
> >       selector =3D snd_usb_find_clock_selector(chip, entity_id, fmt);
> >       if (selector) {
> > +             length =3D GET_VAL(selector, proto, bLength);
> >               pins =3D GET_VAL(selector, proto, bNrInPins);
> >               clock_id =3D GET_VAL(selector, proto, bClockID);
> >               sources =3D GET_VAL(selector, proto, baCSourceID);
> >               cur =3D 0;
> >
> > +             if (length < sizeof(selector) + pins) {
>
> This happens to be correct because the size of both
> uac_clock_selector_descriptor and uac3_clock_selector_descriptor are
> same.  Otherwise we'd have to pass sizeof() of the corresponding
> struct depending on the proto value.  So it's worth to comment here.
>
> BTW, now I noticed that we didn't check the size at traversing the
> descriptors.  This means that the driver might read at a wrong
> position even before the point this patch addresses.  For covering it,
> we need additional checks in the validator code.  And this size check
> of clock selectors can be put there, too.
>
> That is, something like below (totally untested).
>
> It'll lead to a different behavior from your patch, though; currently,
> when no suitable clock selector is found, it check the multiplier and
> this might match.  So I'm not entirely sure, but just wanted to tell
> you that it's another option.
>
>
> thanks,
>
> Takashi
>
> --- a/sound/usb/clock.c
> +++ b/sound/usb/clock.c
> @@ -36,6 +36,12 @@ union uac23_clock_multiplier_desc {
>         struct uac_clock_multiplier_descriptor v3;
>  };
>
> +/* check whether the descriptor bLength has the minimal length */
> +#define DESC_LENGTH_CHECK(p, proto) \
> +       ((proto) =3D=3D UAC_VERSION_3 ? \
> +        ((p)->v3.bLength >=3D sizeof((p)->v3)) : \
> +        ((p)->v2.bLength >=3D sizeof((p)->v2)))
> +
>  #define GET_VAL(p, proto, field) \
>         ((proto) =3D=3D UAC_VERSION_3 ? (p)->v3.field : (p)->v2.field)
>
> @@ -58,6 +64,8 @@ static bool validate_clock_source(void *p, int id, int =
proto)
>  {
>         union uac23_clock_source_desc *cs =3D p;
>
> +       if (!DESC_LENGTH_CHECK(cs, proto))
> +               return false;
>         return GET_VAL(cs, proto, bClockID) =3D=3D id;
>  }
>
> @@ -65,13 +73,23 @@ static bool validate_clock_selector(void *p, int id, =
int proto)
>  {
>         union uac23_clock_selector_desc *cs =3D p;
>
> -       return GET_VAL(cs, proto, bClockID) =3D=3D id;
> +       if (!DESC_LENGTH_CHECK(cs, proto))
> +               return false;
> +       if (GET_VAL(cs, proto, bClockID) !=3D id)
> +               return false;
> +       /* additional length check for baCSourceID, bmControls and iClock=
Selector */
> +       if (proto =3D=3D UAC_VERSION_3)
> +               return cs->v3.bLength >=3D sizeof(cs->v3.bLength) + cs->v=
3.bNrInPins + 6;

Why can't we just do this here?

 return cs->v3.bLength >=3D sizeof(cs->v3) + cs->v3.bNrInPins;

> +       else
> +               return cs->v2.bLength >=3D sizeof(cs->v2.bLength) + cs->v=
2.bNrInPins + 2;

And same question here, why not:

 return cs->v2.bLength >=3D sizeof(cs->v2) + cs->v2.bNrInPins;

>  }
>
>  static bool validate_clock_multiplier(void *p, int id, int proto)
>  {
>         union uac23_clock_multiplier_desc *cs =3D p;
>
> +       if (!DESC_LENGTH_CHECK(cs, proto))
> +               return false;
>         return GET_VAL(cs, proto, bClockID) =3D=3D id;
>  }
>

Thanks,

Benoit
