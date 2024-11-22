Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1B02309B9
	for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732280528; cv=none; b=KkKHmt91OfUy5e54AkvgO0TAVYiGK+5Q37DLBQCuV57p78H61wRqwyrSdEkTTDY03/nAQLMgPWQha8/TxntTU+qxKvV4YBgGT8H0+/z4Z5GlUnuKiiaj8KiNbzp8QULECAFXwB4oUfo3CKR1SfVy4pfskVY+7q0iF89Zjy/a6hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732280528; c=relaxed/simple;
	bh=MSUfw/Kd8N4AGdpe4PWPbreGoEMyEtPeOD538gUDBuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekA3VTvjXhLk/+dwcfGZllUW4pE6avE1t2oVFU+f1Iq6pL6F+CHUjrDaVXtOUWEzFvUPKZ4JCjI+iz9iAetr6Oz/6ksmWaErvI29WQ0jHp4hPQ+SwZF2hCzHQZgAafWpcdXw/4tYqgPuxXO+3t2ewlTsMqwArC76vuE93mgvv1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYn7rR/V; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYn7rR/V"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d4184f2a39so12736336d6.3
        for <linux-sound@vger.kernel.org>; Fri, 22 Nov 2024 05:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732280525; x=1732885325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwnP50UJj95dwtbdNSZTVtUAWyNpVpzINjMKORz8+NA=;
        b=GYn7rR/V5J1OufvYJt7k3zjU5IAZBJeRmDxRio8HhSFXvZ+/s91JWdvf8g4/DhQNZo
         JX6mfN6B6wB+2jlUMqQQr+Ds1hKKXKHnSno+fIpxND4v+e8Mp8PrXD//yeK6wzBdH9av
         CArf9y5hKBQUOmonPoWWXYrcqcPfzbxu/zIxp3Tf2+sHzKO1qxNFj2p+N6kKh55Sr01t
         4yZh4/52meE5gxPE2Hy5sHTGAW1FUW0kkk/0kLutskQuJtjSGsPievXm6zJm3HfOoWfK
         AwlyQ9gMoHbWFvfstTEB+9kXjjFzLrITIZu4AwnUMA7WCAg4v1Zu9Bck13gtXbmr/Rrd
         hoVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732280525; x=1732885325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwnP50UJj95dwtbdNSZTVtUAWyNpVpzINjMKORz8+NA=;
        b=sPaJWAPri4qsE0hO1J6oVvScqTqDDv07BbTu3terJhCDbSCgANatohlgY70qF0KvCS
         tziw3jrnkPcxDymEX6JmxeGS7HGDwZEeza516aeK4Zxba9TBWrhX3jZ3B61mMDO6gdoi
         VCZNM/YfwbM7/W5WMaaLUygYmFA0sgpfAXBCEsRVPweVQt4b1OJENMRbBwFM1h/rKO6P
         Oarz9oZ30FRgFRjmjgG9Rg7quHdeTFYJFOMLPJ4AFQVrge/yvgJaJ8xcRsBWqb/XFYCx
         L176st5Le3UCr3Hzk+FLHcGOpGLLFrxNoel4r++vQ5wcDAOToUUqEOzZSv7gPk6znFF2
         qK9w==
X-Forwarded-Encrypted: i=1; AJvYcCXlWCc7Ny/iRqnA1MCi4Rp2J98qXxHS+tXFsyo7wDWqwsWzz07HTX/PvNVr/ow6R9c+oT+erijtrRYMLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLvxfDpXbjn35b9NCo+l11hovQjHyJBihT4hl+hMBsxK1OBHFY
	0j04SzUfeYnXAYqIExxTkCmCj+AvtDaeR4twU1v5Mc7iaOy+dqLarbfaZWzUJSSUEO3WOtdwUnV
	aMBqh7pOnTIaVaVI9AGIn1xwCI71MUF8d0Lwa
X-Gm-Gg: ASbGncvyuMYxTi+u+yj9EvCsv3L4vy9v7H6uFWAlMusfJu7FtlF+lZdSin7lTQypeQA
	CK7Nr/IsfB5e0nT6dV/N5BqhP5h2QJg==
X-Google-Smtp-Source: AGHT+IGRQi/6l7C2lzj4Y45X8VasgAa0+qr4+Hhje0GdWF4MNLurcU1NMp7M1Vf3YGgHE76Wa640jba99aJw79qN3X4=
X-Received: by 2002:a05:6214:21c7:b0:6d4:23ae:d19c with SMTP id
 6a1803df08f44-6d45114df0bmr46429046d6.37.1732280524613; Fri, 22 Nov 2024
 05:02:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121140613.3651-1-bsevens@google.com> <877c8w3aez.wl-tiwai@suse.de>
 <CAGCho0Ueh4cVZy+nUrzCiXZm1VoHNXRya8oU-F2Q7k0ggUEnsA@mail.gmail.com> <87frnj1ncx.wl-tiwai@suse.de>
In-Reply-To: <87frnj1ncx.wl-tiwai@suse.de>
From: =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>
Date: Fri, 22 Nov 2024 14:01:53 +0100
Message-ID: <CAGCho0VHB=Zewhu2mtN8xHw2fF9LOhXjcJ5JaB0qucG-5gxGhQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding
 clock sources
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Nov 2024 at 13:09, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Fri, 22 Nov 2024 11:06:57 +0100,
> Beno=C3=AEt Sevens wrote:
> >
> > Hi Takashi,
> >
> > Thank you for the review. Except for one question below, this patch
> > looks good to me. Would you like me to send your patch as a revised
> > patch to this mailing list?
>
> I'm going to submit the proper patch if the fix works for you.
>
> > On Thu, 21 Nov 2024 at 15:53, Takashi Iwai <tiwai@suse.de> wrote:
> > > @@ -65,13 +73,23 @@ static bool validate_clock_selector(void *p, int =
id, int proto)
> > >  {
> > >         union uac23_clock_selector_desc *cs =3D p;
> > >
> > > -       return GET_VAL(cs, proto, bClockID) =3D=3D id;
> > > +       if (!DESC_LENGTH_CHECK(cs, proto))
> > > +               return false;
> > > +       if (GET_VAL(cs, proto, bClockID) !=3D id)
> > > +               return false;
> > > +       /* additional length check for baCSourceID, bmControls and iC=
lockSelector */
> > > +       if (proto =3D=3D UAC_VERSION_3)
> > > +               return cs->v3.bLength >=3D sizeof(cs->v3.bLength) + c=
s->v3.bNrInPins + 6;
> >
> > Why can't we just do this here?
> >
> >  return cs->v3.bLength >=3D sizeof(cs->v3) + cs->v3.bNrInPins;
>
> Argh, it was just a wrong check.
>
> But the clock selector descriptor must have two more fields in
> addition to baCSourceID array.  Those two are 6 bytes (=3D 4 bytes for
> bmControls + 2 bytes for wCSelectorDescrStr) for UAC3, while...
>
> > > +       else
> > > +               return cs->v2.bLength >=3D sizeof(cs->v2.bLength) + c=
s->v2.bNrInPins + 2;
> >
> > And same question here, why not:
> >
> >  return cs->v2.bLength >=3D sizeof(cs->v2) + cs->v2.bNrInPins;
>
> ... for UAC2, they are 2 bytes (=3D 1 byte for bmControls + 1 byte for
> iClockSelector).  So those numbers appeared in the patch.
>
> Below is the revised patch.  Let me know if this works for you.
>

Looks perfect to me. Thank you for the patch and explanations!

Can we cc stable to get it backported?

>
> thanks,
>
> Takashi
>
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding cl=
ock sources
>
> The current USB-audio driver code doesn't check bLength of each
> descriptor at traversing for clock descriptors.  That is, when a
> device provides a bogus descriptor with a shorter bLength, the driver
> might hit out-of-bounds reads.
>
> For addressing it, this patch adds sanity checks to the validator
> functions for the clock descriptor traversal.  When the descriptor
> length is shorter than expected, it's skipped in the loop.
>
> For the clock source and clock multiplier descriptors, we can just
> check bLength against the sizeof() of each descriptor type.
> OTOH, the clock selector descriptor of UAC2 and UAC3 has an array
> of bNrInPins elements and two more fields at its tail, hence those
> have to be checked in addition to the sizeof() check.
>
> Reported-by: Beno=C3=AEt Sevens <bsevens@google.com>
> Link: https://lore.kernel.org/20241121140613.3651-1-bsevens@google.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/clock.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/sound/usb/clock.c b/sound/usb/clock.c
> index 8f85200292f3..842ba5b801ea 100644
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
> @@ -65,13 +73,27 @@ static bool validate_clock_selector(void *p, int id, =
int proto)
>  {
>         union uac23_clock_selector_desc *cs =3D p;
>
> -       return GET_VAL(cs, proto, bClockID) =3D=3D id;
> +       if (!DESC_LENGTH_CHECK(cs, proto))
> +               return false;
> +       if (GET_VAL(cs, proto, bClockID) !=3D id)
> +               return false;
> +       /* additional length check for baCSourceID array (in bNrInPins si=
ze)
> +        * and two more fields (which sizes depend on the protocol)
> +        */
> +       if (proto =3D=3D UAC_VERSION_3)
> +               return cs->v3.bLength >=3D sizeof(cs->v3) + cs->v3.bNrInP=
ins +
> +                       4 /* bmControls */ + 2 /* wCSelectorDescrStr */;
> +       else
> +               return cs->v2.bLength >=3D sizeof(cs->v2) + cs->v2.bNrInP=
ins +
> +                       1 /* bmControls */ + 1 /* iClockSelector */;
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
> --
> 2.43.0
>
