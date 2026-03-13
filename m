Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B930EF8B
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773439343; cv=pass; b=BF1Sj2uQExVY4vhGVaygiH2yVjJQ5IHYlkeZIMTfnPiaXoRaCVxQdCl/xpqPWTwt0Plp0h5PFcQMlstE5uGU03FiWBo8dt55mVTbPo8rVLRhDm/38GuGVqzYkqmVeI3sdUbJXVnJ21PLZZtYL9bM0DWFbFrQaRT4FYxX5DJMkb8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773439343; c=relaxed/simple;
	bh=xV/fAH4IXKpO9+YmtJmSlZqUk8Z75AH9Vw9hX4VCKYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNcUTqITUXSmf1gTuJKUxg1nXxyVw4v7TLMA8TFrPeYiHOSBpWxt68qANH1lu7jE991fobfRzjHUvxWcZ4WoTeK7jPNrCB+880MNvqnqRN8RqHu9opWFIe5ERKGAzsT+HaSM7MuynjklPIySSF8WRYAsIxzQyXtb5Q/kwRXP0Iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UP+2FnpL; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UP+2FnpL"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-661d929219bso3096840a12.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 15:02:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773439340; cv=none;
        d=google.com; s=arc-20240605;
        b=dBrqqioYv4eL+D04B1WbIG89ginl39aL862Anex5AKd1nAPg5eVatwdnWD+068XWqf
         WauUIr7p7NABN37tft3INXI2LFXw5BproAhlqgKlQasTrMha9Mkje8eTNN8Z6PljUQKV
         2+n1zOpmgrUNceMy7ewxLHNVOEnkUdvy1bPJC3H8qRf/PjI+PJu0X8M37si8sWjKoB4v
         kwxIfXAeMGNOTiKZwaKWTkCuPyfbdV3mIBAsL5X2MQQBApsOHzM9e2mIQhptOvrR3B5P
         +FuOlMI+BwbzDmtXx/07h1e32EeFDNA+6TQWdAbOtuE2UGHL0KUYFbkYUjppsxZfUet/
         6Uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xg7Heb2zG5YHZ6myFxfSMvZtPPQX3Yvv0U1QhckaWq4=;
        fh=uGmyVIAUa1R9uez6nLCsUAg1aYYdsK4Nvo9roIKMZ00=;
        b=LyWg/Y3V0ncsflofW3oQGAEeMpDWjTmfRU29F/QkT4hamwTTEKvH2ltyXQ4PvjRrnS
         HtRFIIkSvTU3Nb3nDd8PjG2dkNYZy8NA1ctg8dJIJRXaVZiwuZjDDMPAkrve8LLhiX1D
         GrvNaLdHVl4Z9b9G9kgYck2ErckAbNY0i2k38pc6DEbaZC0mgPkWwuJ00u7Vt2Svl+2C
         EqWlzyrcMi59Ck7DGVu1o5CixvhWp3BWp1JqKcNHdUo4gDvT2QmcQQNXB4+Fby9I5vQQ
         kVtiOKDe+SgmR9hSyOA6xeQuAet+TcJQ1iPMBscTB+aVijTidYRAF+Y952mSUpdMV7W4
         UHKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773439340; x=1774044140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg7Heb2zG5YHZ6myFxfSMvZtPPQX3Yvv0U1QhckaWq4=;
        b=UP+2FnpLuc8AzjQOkF6hf+CHYwvdUPmfAWgBBF1l6l1M37ypks3dUhCWz6hnB4Attp
         SCLGsvRhRqVnQ93rMp6wUAzytaZNMUZVwf0CuQfyfsCSnP1kqO1hhV9ZDqm3TED8ShdB
         ftJeAaAujs1GJIOc7NqQFmyRtot4wIgVYvtvXU7BsErmZB3oQzu43uuSJDR7tBettz/i
         pvf05oxPWL9T7rihvCKWMa864tXtHXBf8fY8zdFTHZUX082dGvfPwffHvBwY4jd3nC8/
         i9/btqWCxCzAQ+fDxDchqtiBjeAvmpvyJEwj5Pk4hwItHOUWmiew7FMt8EIPiT6P8/AQ
         34kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773439340; x=1774044140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xg7Heb2zG5YHZ6myFxfSMvZtPPQX3Yvv0U1QhckaWq4=;
        b=PxUGPf+H5wSabC4pyrxUaq1uoyrzIVzryhVmRVBj0mWY9EFqAo4XpX6tt7w0h5UGQK
         39QaHuO2HMfd65Q1t8BUF4XdY/t1b27gIDeoNyHs3xlwmB8RfI3KBG8TLhFSTtopZ+kN
         2p12yq//qj1QX3kD3pTZ0wP5ZQen11fJecSNIFwnVcKzQ6jMX2D86zGvCYQsofDvI44K
         E0ZiL2NEZDO/870EPN7Tn990uSJ/eKQ+nw0mUiLeu40tpPrEwM8gTUjTSIRPO8b9bHBb
         QZMQZ8logGJ5ZwtRTuP/k+XmqzKgVtorneXwsI3UbHIljklYwJe4SOiWwdN5CmOeV3FL
         u5JA==
X-Gm-Message-State: AOJu0Yy8pufm+NtQQ8W/Hr9MZUYEtKvZwP//G/c25uHgry2VgPQvkqiR
	bHcHOEw2Wwb5ipnMOWXog5drO6euQxugtqUKfLhz6rmZoFQT/PesDbIgr01X3KTIJTz10ZrEBiC
	LWQTAb0NR8Xf/udy0nYOKK27YAzbPh/E=
X-Gm-Gg: ATEYQzyXh+9qwyvHY++mT1eXsh3Y/QoW5VY/uHS9ByWyt88P9L0biP2zDPnv4iENAvt
	c6c2rZTWrx1bHDuY/vgEe5yCTCr4g+nIZEiRlGwIJUvG/FdbkYy5/3uZo+fRd3vCJJkelqLa0/X
	CKZpe9RLEIcLeTSqVcwnZSEtttV7xnuAmNR74IdEu0Ru6Mkw/i7mtNm8yQJY6Uqhnz7DhTtsWHW
	Yb/G0+jIgHPZ3P37791Ix9sLGudGJGoj051AR5ICcClvsC058wcpLavD77/Xx590bpMxAOT1s/d
	/QPBLhZNY6+5+FKKSpzRxFkwUClun51zDW2pmYUNVyiFNxBlCXIEwQmsvOcHpFEnSmFAmYS0H5P
	vclu8qQ==
X-Received: by 2002:a05:6402:5409:b0:663:ea77:3031 with SMTP id
 4fb4d7f45d1cf-663ea773194mr2225159a12.22.1773439340333; Fri, 13 Mar 2026
 15:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311232748.18697-1-rosenp@gmail.com> <87tsuld095.wl-tiwai@suse.de>
 <CAKxU2N8m1-4cP9J1A2Vmz+ZaZ7NGhcjEDm4YYjjzkmPAmGbUwg@mail.gmail.com>
In-Reply-To: <CAKxU2N8m1-4cP9J1A2Vmz+ZaZ7NGhcjEDm4YYjjzkmPAmGbUwg@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 13 Mar 2026 15:02:08 -0700
X-Gm-Features: AaiRm51Jgp0OoXiOo5CVC8yojRYJmG-wLzo1IInyV3aOtWbOKhfqQAkKrDX8AfI
Message-ID: <CAKxU2N_YN+0k+EjLFvm+vHEwduGB2jn0A+t-4C-GH_MXmWHcKQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: use kzalloc_flex
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:45=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wro=
te:
>
> On Wed, Mar 11, 2026 at 11:34=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wro=
te:
> >
> > On Thu, 12 Mar 2026 00:27:48 +0100,
> > Rosen Penev wrote:
> > >
> > > Saves one allocation by using a flexible array member.
> >
> > As it's a fixed size array, it doesn't have to be a flex array at all,
> > so it can be even simpler.
> That's true. The comment even admits as such. Wonder why it was ever a
> pointer allocated with calloc...
Oh no I see the issue:

sound/usb/mixer.c:#define MAX_ID_ELEMS  256

I don't think this is supposed to be in the header.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  sound/usb/mixer.c | 22 +++++++---------------
> > >  sound/usb/mixer.h |  5 +++--
> > >  2 files changed, 10 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > > index 7007e0c9489b..337815b9e72c 100644
> > > --- a/sound/usb/mixer.c
> > > +++ b/sound/usb/mixer.c
> > > @@ -1393,7 +1393,7 @@ static int mixer_ctl_feature_info(struct snd_kc=
ontrol *kcontrol,
> > >               if (!cval->initialized) {
> > >                       get_min_max_with_quirks(cval, 0, kcontrol);
> > >                       if (cval->initialized && cval->dBmin >=3D cval-=
>dBmax) {
> > > -                             kcontrol->vd[0].access &=3D
> > > +                             kcontrol->vd[0].access &=3D
> > >                                       ~(SNDRV_CTL_ELEM_ACCESS_TLV_REA=
D |
> > >                                         SNDRV_CTL_ELEM_ACCESS_TLV_CAL=
LBACK);
> > >                               snd_ctl_notify(cval->head.mixer->chip->=
card,
> > > @@ -3006,15 +3006,12 @@ static void snd_usb_mixer_free(struct usb_mix=
er_interface *mixer)
> > >       snd_usb_mixer_disconnect(mixer);
> > >
> > >       /* Unregister controls first, snd_ctl_remove() frees the elemen=
t */
> > > -     if (mixer->id_elems) {
> > > -             for (id =3D 0; id < MAX_ID_ELEMS; id++) {
> > > -                     for (list =3D mixer->id_elems[id]; list; list =
=3D next) {
> > > -                             next =3D list->next_id_elem;
> > > -                             if (list->kctl)
> > > -                                     snd_ctl_remove(mixer->chip->car=
d, list->kctl);
> > > -                     }
> > > +     for (id =3D 0; id < MAX_ID_ELEMS; id++) {
> > > +             for (list =3D mixer->id_elems[id]; list; list =3D next)=
 {
> > > +                     next =3D list->next_id_elem;
> > > +                     if (list->kctl)
> > > +                             snd_ctl_remove(mixer->chip->card, list-=
>kctl);
> > >               }
> > > -             kfree(mixer->id_elems);
> > >       }
> > >       if (mixer->urb) {
> > >               kfree(mixer->urb->transfer_buffer);
> > > @@ -3652,16 +3649,11 @@ int snd_usb_create_mixer(struct snd_usb_audio=
 *chip, int ctrlif)
> > >
> > >       strscpy(chip->card->mixername, "USB Mixer");
> > >
> > > -     mixer =3D kzalloc_obj(*mixer);
> > > +     mixer =3D kzalloc_flex(*mixer, id_elems, MAX_ID_ELEMS);
> > >       if (!mixer)
> > >               return -ENOMEM;
> > >       mixer->chip =3D chip;
> > >       mixer->ignore_ctl_error =3D !!(chip->quirk_flags & QUIRK_FLAG_I=
GNORE_CTL_ERROR);
> > > -     mixer->id_elems =3D kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS=
);
> > > -     if (!mixer->id_elems) {
> > > -             kfree(mixer);
> > > -             return -ENOMEM;
> > > -     }
> > >
> > >       mixer->hostif =3D &usb_ifnum_to_if(chip->dev, ctrlif)->altsetti=
ng[0];
> > >       switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
> > > diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
> > > index 167fbfcf01ac..30dd30b925fc 100644
> > > --- a/sound/usb/mixer.h
> > > +++ b/sound/usb/mixer.h
> > > @@ -19,8 +19,6 @@ struct usb_mixer_interface {
> > >       struct list_head list;
> > >       unsigned int ignore_ctl_error;
> > >       struct urb *urb;
> > > -     /* array[MAX_ID_ELEMS], indexed by unit id */
> > > -     struct usb_mixer_elem_list **id_elems;
> > >
> > >       /* the usb audio specification version this interface complies =
to */
> > >       int protocol;
> > > @@ -42,6 +40,9 @@ struct usb_mixer_interface {
> > >       void *private_data;
> > >       void (*private_free)(struct usb_mixer_interface *mixer);
> > >       void (*private_suspend)(struct usb_mixer_interface *mixer);
> > > +
> > > +     /* array[MAX_ID_ELEMS], indexed by unit id */
> > > +     struct usb_mixer_elem_list *id_elems[];
> > >  };
> > >
> > >  #define MAX_CHANNELS 16      /* max logical channels */
> > > --
> > > 2.53.0
> > >
