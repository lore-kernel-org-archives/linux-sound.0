Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F001B4F1F
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 06:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297964; cv=pass; b=bu8IIJUDlaWtLHUkTXsoC+wW7s31BaH+h/lCNn7VSG+pHEHtmBBZpQ/1t9LSup/9V8G/3KwlhUi0gh+0w5urj+Zb1/p7LN8mOMH4rrq858j602Zjcqn0ppRfmFuNjn28JwRfw/rXVWFvVAOwGrDfdL21B/yxR8ey8OlA+vvnTAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297964; c=relaxed/simple;
	bh=SgFpf8aowMRAS4HCWu8jp45B3HOMM69V9GdWdpumtGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gxwLlVaP7yZvF/OVboeMjdr8z4n0b5VGxvgYEBcI40CVNlibFtzl3xEf4EzTDaDCHjGiWyd1v3Q7fqKJHTMR8FiJMgJdNAJxbZRVdAUliDalOd/raPC30H/sLXTtfIBItfAUQI13wpPHPSepSm4C/0DAIZl+kv0SsbdqcmUqp30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUUPo/Vn; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUUPo/Vn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b96e1ae843dso88895966b.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Mar 2026 23:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773297961; cv=none;
        d=google.com; s=arc-20240605;
        b=MRZzxInUedN82ey9A6MeUoKyckkmFeQM0IP+L1bt0oULU5LKFENWScy/eTBy6yqCcg
         wmsY0obl7OJ8Hc2Z4Tb58uakU0w16lAsAAcsguHeN/dEOytR0NTx529yq49ZoJfwPzsS
         zUKP0GJl6S05SRhdrrtORg4aN0hPKig+O22hr+d6/C13T9r/AVDhVX662yA1tvTeCpJs
         6L2/7TXd7AvOdq5caPcC6g/irVsZiH9OdVCZK6m0DsZcxotRIgD6H2skzMZffsRj7hCr
         pXT5jbLUElrBrAyxtwoxQBtgfi7bZBvc84Tbur8hhXqMn3WBzhpVYEhSk7jaRbbVkRAd
         nwRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ckB6nPFRT4KbmUIjUv0JpO+SZdLYwEdB7Dvjz6OIzfY=;
        fh=uGmyVIAUa1R9uez6nLCsUAg1aYYdsK4Nvo9roIKMZ00=;
        b=hyYIg0AMO565gKB/xPRUMq09q8Grjc6Ui2wXV7SrEu5ZdRFrq7zQ3mgR1MZO3IDi2A
         nW1laWCd6eYK2gLey0tF+PEAE9JVF2Sd9Z2KO97XjBIJf0KVk4MLHUetUIqECnOsKJjm
         J0I7Ym+mPJHm5I+hr9LPzQPa+u6M6JKbnuHoCi0Fsvn7CcFYtD6oAHxNrhXOBgbewGLX
         wOMhGzTae5aHFaUgPO4bG1khi6pZHg3H5mJ6yB7A7GSTK4ac5oBh/ejLrdybo30FV8Pg
         q6Whvtv0VJt+koTvpuXE55GHYKjMvg7yrG/QI2GbKyvb6dayrzeH9oELVDzu3H2VDvwg
         m9Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773297961; x=1773902761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckB6nPFRT4KbmUIjUv0JpO+SZdLYwEdB7Dvjz6OIzfY=;
        b=UUUPo/Vn9w94cf0+N8ZHbnPCvZFGa7adKPHnAFKkigcYCWVyGuBn9bPb0djm2zzpMe
         DixYU5iqbnwHIXs/LzWwDeq+i2L82en8ePZ0d5JCFJMdk5WdmRTyEsSCiPLJ0TaIJCZJ
         cBnix7In84UH8XaHgXOcMeqmfq6VNUm9QTwKyMUPqz4BzinM1lAQGr6QtU+tpMbPC235
         J4WwEK3mZOtJ82mYYXCRTy/nVYU+bUx2W4SUHyfpZwrU85xoAZTEBPy7qnzcjy5Z1vb0
         Ds6A/TptEddxHDJha4S6svKS/XZQEXsThhVrRBjFiucKYpROdFAEhjYjHz0xNspNcpmY
         PpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773297961; x=1773902761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ckB6nPFRT4KbmUIjUv0JpO+SZdLYwEdB7Dvjz6OIzfY=;
        b=JgfA4L7Wfy6Qs7UCoD7x06HpklShCg3PreXwGLb+j/x6sTLfWoml9SCmA+kzB/AlHh
         BxSrlZuYSo/uVKF0JgfxVa8Tkz4hqV4LZXCHEilK/a01oGuny5H3eCW0JyOgFlFeW6Up
         Tc2V6DSySwMqElVyZ/1ZuNgBRcX9aXEEPQ0PIYUUwHhRMNUY2vuws7U2kvHGi8b2TDdt
         ao6efrh0sfHXNZRI9fMQNd3muUneiVjdfIZ/JXXWGOTHycNU7hJiAmzS9jfyKYXQYvwm
         fwt+d/NnLR31LzRZsWihBSeEkhkbllAg5fkbSOmvSWDSC427jGerNq+s7Y8d296hXrYl
         U8uw==
X-Gm-Message-State: AOJu0Yyc0ofS621b1OeOG2x8fyPFn346D1RnBXeNyhnnlu9wX6SA5o5F
	X/wQr0QFuqQsd5vvDfPDpG1tPGFi2n3ADweGzRWLLljLOpBGRTh4kU9lt80NWKY7fIhBpF7loSd
	tm7acaMPtdhC8OD1O4gLP6HzR/9wqfRc=
X-Gm-Gg: ATEYQzxDnTfIRIF3kzThVD0SqGd+qwRkp0GkiCBGfchSh3Z03WWMqMFsi/DKiqGxjz8
	GaAdUmhTAFNwk08Ke5BIL8qvXMMds3gzDYQQjJNm/EZqD+DtdCHfJxPySOYORv5Asz9xuI161ch
	LwSRNMg4SA0Ak7jW4cPKSlfNhCmUzjlmsxEbdOz6VoogM+VY2Ia05tJ0UrPyiU6A8lyD0qkXpMg
	MJhNWv01ctEh+R8nac9OlV0x7r6pGrxi57a2v38xD3VqTKPXjRYGwKHraETKrpnAFIpmFY7fS/P
	tFDpqHyGmEFypve1Abg5Bgdd7kVqi8gnze8jRMDt7/6SwpMIqqWf4aPfvgfpXbe9gvj3l79v/9m
	vuSzrSw==
X-Received: by 2002:a17:906:fd8c:b0:b93:a02d:2ef3 with SMTP id
 a640c23a62f3a-b972e4e2b85mr252190466b.41.1773297960672; Wed, 11 Mar 2026
 23:46:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311232748.18697-1-rosenp@gmail.com> <87tsuld095.wl-tiwai@suse.de>
In-Reply-To: <87tsuld095.wl-tiwai@suse.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 23:45:49 -0700
X-Gm-Features: AaiRm52YmPw6D0ZK8aqRj-lLLHkFMqQ8_4uouLeqsgibQ3fPBfeIRrsqtN2aV5c
Message-ID: <CAKxU2N8m1-4cP9J1A2Vmz+ZaZ7NGhcjEDm4YYjjzkmPAmGbUwg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: use kzalloc_flex
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 11:34=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Thu, 12 Mar 2026 00:27:48 +0100,
> Rosen Penev wrote:
> >
> > Saves one allocation by using a flexible array member.
>
> As it's a fixed size array, it doesn't have to be a flex array at all,
> so it can be even simpler.
That's true. The comment even admits as such. Wonder why it was ever a
pointer allocated with calloc...
>
>
> thanks,
>
> Takashi
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  sound/usb/mixer.c | 22 +++++++---------------
> >  sound/usb/mixer.h |  5 +++--
> >  2 files changed, 10 insertions(+), 17 deletions(-)
> >
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index 7007e0c9489b..337815b9e72c 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -1393,7 +1393,7 @@ static int mixer_ctl_feature_info(struct snd_kcon=
trol *kcontrol,
> >               if (!cval->initialized) {
> >                       get_min_max_with_quirks(cval, 0, kcontrol);
> >                       if (cval->initialized && cval->dBmin >=3D cval->d=
Bmax) {
> > -                             kcontrol->vd[0].access &=3D
> > +                             kcontrol->vd[0].access &=3D
> >                                       ~(SNDRV_CTL_ELEM_ACCESS_TLV_READ =
|
> >                                         SNDRV_CTL_ELEM_ACCESS_TLV_CALLB=
ACK);
> >                               snd_ctl_notify(cval->head.mixer->chip->ca=
rd,
> > @@ -3006,15 +3006,12 @@ static void snd_usb_mixer_free(struct usb_mixer=
_interface *mixer)
> >       snd_usb_mixer_disconnect(mixer);
> >
> >       /* Unregister controls first, snd_ctl_remove() frees the element =
*/
> > -     if (mixer->id_elems) {
> > -             for (id =3D 0; id < MAX_ID_ELEMS; id++) {
> > -                     for (list =3D mixer->id_elems[id]; list; list =3D=
 next) {
> > -                             next =3D list->next_id_elem;
> > -                             if (list->kctl)
> > -                                     snd_ctl_remove(mixer->chip->card,=
 list->kctl);
> > -                     }
> > +     for (id =3D 0; id < MAX_ID_ELEMS; id++) {
> > +             for (list =3D mixer->id_elems[id]; list; list =3D next) {
> > +                     next =3D list->next_id_elem;
> > +                     if (list->kctl)
> > +                             snd_ctl_remove(mixer->chip->card, list->k=
ctl);
> >               }
> > -             kfree(mixer->id_elems);
> >       }
> >       if (mixer->urb) {
> >               kfree(mixer->urb->transfer_buffer);
> > @@ -3652,16 +3649,11 @@ int snd_usb_create_mixer(struct snd_usb_audio *=
chip, int ctrlif)
> >
> >       strscpy(chip->card->mixername, "USB Mixer");
> >
> > -     mixer =3D kzalloc_obj(*mixer);
> > +     mixer =3D kzalloc_flex(*mixer, id_elems, MAX_ID_ELEMS);
> >       if (!mixer)
> >               return -ENOMEM;
> >       mixer->chip =3D chip;
> >       mixer->ignore_ctl_error =3D !!(chip->quirk_flags & QUIRK_FLAG_IGN=
ORE_CTL_ERROR);
> > -     mixer->id_elems =3D kzalloc_objs(*mixer->id_elems, MAX_ID_ELEMS);
> > -     if (!mixer->id_elems) {
> > -             kfree(mixer);
> > -             return -ENOMEM;
> > -     }
> >
> >       mixer->hostif =3D &usb_ifnum_to_if(chip->dev, ctrlif)->altsetting=
[0];
> >       switch (get_iface_desc(mixer->hostif)->bInterfaceProtocol) {
> > diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
> > index 167fbfcf01ac..30dd30b925fc 100644
> > --- a/sound/usb/mixer.h
> > +++ b/sound/usb/mixer.h
> > @@ -19,8 +19,6 @@ struct usb_mixer_interface {
> >       struct list_head list;
> >       unsigned int ignore_ctl_error;
> >       struct urb *urb;
> > -     /* array[MAX_ID_ELEMS], indexed by unit id */
> > -     struct usb_mixer_elem_list **id_elems;
> >
> >       /* the usb audio specification version this interface complies to=
 */
> >       int protocol;
> > @@ -42,6 +40,9 @@ struct usb_mixer_interface {
> >       void *private_data;
> >       void (*private_free)(struct usb_mixer_interface *mixer);
> >       void (*private_suspend)(struct usb_mixer_interface *mixer);
> > +
> > +     /* array[MAX_ID_ELEMS], indexed by unit id */
> > +     struct usb_mixer_elem_list *id_elems[];
> >  };
> >
> >  #define MAX_CHANNELS 16      /* max logical channels */
> > --
> > 2.53.0
> >
