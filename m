Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F0379C5A
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163256; cv=pass; b=NRfUQZCTBGny5K2WAYdz3DH4ltKpszov4l4/WBEPpAsySbaWojUgSfWwpag2Zdk1OimRE3WeEtMwXVj8bpYzjFSD0Sd9cypEoZoaREAOTgwJqySFEn9bekYhFGWRULDSKdvqQ2Q9P0U34vTDImYTP/2Fm66onqU/Owq7gZ0+J60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163256; c=relaxed/simple;
	bh=bOJ1uedswj6Hy82IC1H7b+QBlWRb5JVbHsCQhpcyS/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+l3/fdksK5HtCqaBTlHruagA7NyzsJZ+Fu0kullKgIVPEOMY/SBj4lDgTl/FqmldRyrmxWWYZ/XttC2rY6+DOGwPsEni3vAW6aioR/BD3T/iONHbkjWZ3MBsJFFITPVGzrFWgPkwhW55afbf5CJtraC3gdgu63+mlS8Uv2gM+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmKtadp+; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmKtadp+"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0a921ee46so33167967b3.2
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 08:07:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792163254; cv=none;
        d=google.com; s=arc-20260327;
        b=Vsrk6fAVDb9WxMPsjAE1h0k7RIGSz9pJGPhVnXRKbIVfzAQ773AFqsVttyd4QyawS/
         7cisSX6ycz1Cgsynk4jWJqL3TZ1JzTdaFbcxebmjV6RK+aOYMkffj5boEVsu6I/iwb/O
         I6FFTY/Pwz0MtBIeSbzIvSG8gy+m8QEj6H9Un4flZeB+/48gLnVK+ozKlJQdsTwLVMh/
         4dflacy3aFy7gQ6bd5oPKqj5tsz7ETGWyWcOOVa2RXLFbeZ5B8wQ9Gp8ma9X1e4dsHde
         rrAE8HMuMCzFW9Je77NQhisVyCp/hhlA+dBEcK8cjkt8YUzxKmIMfltFSTxFLWq1z47y
         50Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DMqt96+kUwHyeRleuXnrgNsSmY0PBYC8/3p/xIWw5mc=;
        fh=h1nOxibkC2cy1KoNsF8p6MFA38+7ByUx34LQ+bVHZ50=;
        b=FiY/nrLLhFan4xcIhG+lOIHS16zeSocUbuo5cAZPq2BaH1QBCAX1zfU8UmsFQr/h/2
         WVTlT3KTlVfVUOnJSi65mfdjqhh4ucCUATGorOjJQoUcaWQgQN6KiAXUyx0k2VQz2baQ
         se8RmabDc+7KwvEbbzQ4FclcbpcSDvI9hS3w0uqq32Nhk/4eQP6oOuWns0hrW/hL/L/4
         64nGQtPW6KlSoWvMUFxXkRCEuTG/li35mDy6oIvCwEZed/18mtgx/sUhBVOJlk4iC5vd
         cBSEnyIh5wfw4DGD2V07VRxcdvdD0mZ9HFuWQehA1XpXWXVEiBUvwTgtKnizn8eAOs97
         2mSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792163254; x=1792768054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DMqt96+kUwHyeRleuXnrgNsSmY0PBYC8/3p/xIWw5mc=;
        b=BmKtadp+bKsFLaA7NzAmJaiyWINHtyg6Xdb+udn/Di4xD/SB/wHYPVUQm5kXgVtROk
         0NG9ByLeZacRPd9WTGXjdcA83vp6pC77IwjrG5IkgHH9w21BcGoZ5v3OItt/QOlM2I1a
         6agcJJWxokCrDzQ6kGieUnN6ztjPlJRTvZ16MCo18y3vzff7SsHl/5pfGTfZF2/g7aBr
         H3dhF6jwXSTHiHU7BocofBJ/YBac5WomY8oxdJO8rAq9AVFRz70/l8Et3eJUUqVhZrjt
         OWGLQ3hdF2PjwWtf0M7zCPbKMnHGBEDsOb396H+5pOvvROfWFFHX5aMj+W13nBmPOxEj
         h/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163254; x=1792768054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMqt96+kUwHyeRleuXnrgNsSmY0PBYC8/3p/xIWw5mc=;
        b=cyLIeWHTfkyFyXV26waa8uUBfjtKG3AvZxBqbuIhL/Uy3VtZWXbsCAJ9HYx+oGqv8L
         y2c1b0fFz9nvkZfM8D41VeiKQv3PRELiknXfYQOVi32f5C4SrnBuXMWKuy1q5PLi7aQI
         OJaCN3eRrYiPopsiU++Z1estPCQpDVnH2EgmBHC/ZeZDQyCo9oetk2yx6YhHD1gJz8Uq
         tAH6RL14ofwwZSMsbE3SBoER5OzUjQfQZgAhHyXhtbsMD5fExrGkGbHsrH36wvf71fxs
         rjsnSQXBXYywNgxU6EZCZF6/nDMW7HCAVbFVTeH8CtOxzFAvVuAGrBfHa5K2Dlv2wTxs
         kguw==
X-Gm-Message-State: AFq9FYIEfE6R5FXjqL/DJnHGmXjQN+h4OuPoemm1MXExOe/0zo/yIZYV
	Xgyk7UbCLZnJxJhfaV8OXED7LR8yA0T+cLCDsrskC59TYb46yY2WewiWMsMQel+6dBGxAhsrvcX
	6+rSRsczqswzY4vMqnGCAB8LjTK4Rs79rUoE7BAANKJshgcw=
X-Gm-Gg: AYBFou3tEqlcuo/eXMEhgIVz2w5de5gL+ZfEgoFjx3Ka7ZMumZv12zXKXU0zqW2yVhb
	HyCNmmRfdPYAE1mxtEwNKJm+8iK2//iPZK2bDsUeyERv0c96GGTwXZ4lxIEipCcP5CG9gzinNXn
	IqtuusJxu13fLZfM6bPNwFwtEXJIVWsGY3L/9ZyBjA9oAY1sMrGA1GOjn1g36XVqx+VySuEoc0n
	XA1TFYANhnlmeptGgaY0so82lB2ZBcqK/Pc5Bvmm0gm2g47vbLFiTnM9MHeZS3ZK6n279BF8qCz
	q8tRgiHv0PCYcwbwsX5MAqELQoNE15WkceK6Ejro3MPNYwFHV07Y7Rsj
X-Received: by 2002:a05:690c:4147:b0:89a:63da:fa9f with SMTP id
 00721157ae682-8b0f222bbd5mr728477b3.90.1792163253988; Fri, 16 Oct 2026
 08:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016140653.4406-1-tiwai@suse.de>
In-Reply-To: <20261016140653.4406-1-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Fri, 16 Oct 2026 23:07:21 +0800
X-Gm-Features: AclHuK_j5dDrkYUnkpqIlBlYf788uPT1QmDZliXxQq6mNw-ngAUaMLUrXM5r_Jc
Message-ID: <CAFRLqsVdeuTPt8N5Bi=ZxiPP=fsjJUgJZnFfgmT5EfMykoRgVQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: jack: Expose injection debugfs at device register phase
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8816=E6=97=A5=
=E5=91=A8=E4=BA=94 22:06=E5=86=99=E9=81=93=EF=BC=9A
>
> Currently we add debugfs interfaces for jack injection (with
> CONFIG_SND_JACK_INJECTION_DEBUG) at creating jack kctls in
> snd_jack_kctl_add().  This means that those debugfs interfaces are
> already exposed to user-space at the early probe phase -- that is, it
> allows user-space already fiddling with it, while other components are
> still being initialized and hidden until snd_card_register().
> Depending on the driver implementation, such behavior can be an
> unpleasant surprise.
>
> For aligning the device exposure behavior, move the debugfs
> registration at the device register phase, too.  snd_jack_kctl_add()
> may still add the corresponding debugfs interfaces (for the
> dynamically added jacks, if any), but it's done only conditionally
> after the card has been registered.
>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  include/sound/jack.h |  2 +-
>  sound/core/jack.c    | 56 ++++++++++++++++++++++++++++++++++----------
>  2 files changed, 45 insertions(+), 13 deletions(-)
>
> diff --git a/include/sound/jack.h b/include/sound/jack.h
> index 715b95983188..cf19c333e2eb 100644
> --- a/include/sound/jack.h
> +++ b/include/sound/jack.h
> @@ -62,10 +62,10 @@ struct snd_jack {
>         struct list_head kctl_list;
>         struct snd_card *card;
>         const char *id;
> +       bool registered;
>  #ifdef CONFIG_SND_JACK_INPUT_DEV
>         struct input_dev *input_dev;
>         struct mutex input_dev_lock;
> -       int registered;
>         int type;
>         char name[100];
>         unsigned int key[6];   /* Keep in sync with definitions above */
> diff --git a/sound/core/jack.c b/sound/core/jack.c
> index d9132b885ea3..a81a64b3bfe7 100644
> --- a/sound/core/jack.c
> +++ b/sound/core/jack.c
> @@ -38,6 +38,7 @@ static const int jack_switch_types[SND_JACK_SWITCH_TYPE=
S] =3D {
>  };
>  #endif /* CONFIG_SND_JACK_INPUT_DEV */
>
> +static void snd_jack_add_debugfs(struct snd_jack *jack);
>  static void snd_jack_remove_debugfs(struct snd_jack *jack);
>
>  static int snd_jack_dev_disconnect(struct snd_device *device)
> @@ -88,11 +89,10 @@ static int snd_jack_dev_free(struct snd_device *devic=
e)
>  }
>
>  #ifdef CONFIG_SND_JACK_INPUT_DEV
> -static int snd_jack_dev_register(struct snd_device *device)
> +static int snd_jack_input_dev_register(struct snd_card *card,
> +                                      struct snd_jack *jack)
>  {
> -       struct snd_jack *jack =3D device->device_data;
> -       struct snd_card *card =3D device->card;
> -       int err, i;
> +       int i;
>
>         snprintf(jack->name, sizeof(jack->name), "%s %s",
>                  card->shortname, jack->id);
> @@ -120,14 +120,32 @@ static int snd_jack_dev_register(struct snd_device =
*device)
>                 input_set_capability(jack->input_dev, EV_KEY, jack->key[i=
]);
>         }
>
> -       err =3D input_register_device(jack->input_dev);
> -       if (err =3D=3D 0)
> -               jack->registered =3D 1;
> -
> -       return err;
> +       return input_register_device(jack->input_dev);
> +}
> +#else
> +static inline int snd_jack_input_dev_register(struct snd_card *card,
> +                                             struct snd_jack *jack)
> +{
> +       return 0;
>  }
>  #endif /* CONFIG_SND_JACK_INPUT_DEV */
>
> +static int snd_jack_dev_register(struct snd_device *device)
> +{
> +       struct snd_card *card =3D device->card;
> +       struct snd_jack *jack =3D device->device_data;
> +       int err;
> +
> +       err =3D snd_jack_input_dev_register(card, jack);
> +       if (err < 0)
> +               return err;
> +
> +       snd_jack_add_debugfs(jack);
> +
> +       jack->registered =3D true;
> +       return 0;
> +}
> +
>  #ifdef CONFIG_SND_JACK_INJECTION_DEBUG
>  static void snd_jack_inject_report(struct snd_jack_kctl *jack_kctl, int =
status)
>  {
> @@ -349,6 +367,9 @@ static int snd_jack_debugfs_add_inject_node(struct sn=
d_jack *jack,
>         char *tname;
>         int i;
>
> +       if (jack_kctl->jack_debugfs_root)
> +               return 0;
> +
>         /* Don't create injection interface for Phantom jacks */
>         if (strstr(jack_kctl->kctl->id.name, "Phantom"))
>                 return 0;
> @@ -387,6 +408,14 @@ static int snd_jack_debugfs_add_inject_node(struct s=
nd_jack *jack,
>         return 0;
>  }
>
> +static void snd_jack_add_debugfs(struct snd_jack *jack)
> +{
> +       struct snd_jack_kctl *jack_kctl;
> +
> +       list_for_each_entry(jack_kctl, &jack->kctl_list, list)
> +               snd_jack_debugfs_add_inject_node(jack, jack_kctl);
> +}
> +
>  static void snd_jack_remove_debugfs(struct snd_jack *jack)
>  {
>         struct snd_jack_kctl *jack_kctl;
> @@ -403,6 +432,10 @@ static int snd_jack_debugfs_add_inject_node(struct s=
nd_jack *jack,
>         return 0;
>  }
>
> +static void snd_jack_add_debugfs(struct snd_jack *jack)
> +{
> +}
> +
>  static void snd_jack_remove_debugfs(struct snd_jack *jack)
>  {
>  }
> @@ -423,7 +456,8 @@ static void snd_jack_kctl_add(struct snd_jack *jack, =
struct snd_jack_kctl *jack_
>  {
>         jack_kctl->jack =3D jack;
>         list_add_tail(&jack_kctl->list, &jack->kctl_list);
> -       snd_jack_debugfs_add_inject_node(jack, jack_kctl);
> +       if (jack->registered)
> +               snd_jack_debugfs_add_inject_node(jack, jack_kctl);
>  }
>
>  static struct snd_jack_kctl * snd_jack_kctl_new(struct snd_card *card, c=
onst char *name, unsigned int mask)
> @@ -504,9 +538,7 @@ int snd_jack_new(struct snd_card *card, const char *i=
d, int type,
>         int err;
>         static const struct snd_device_ops ops =3D {
>                 .dev_free =3D snd_jack_dev_free,
> -#ifdef CONFIG_SND_JACK_INPUT_DEV
>                 .dev_register =3D snd_jack_dev_register,
> -#endif /* CONFIG_SND_JACK_INPUT_DEV */
>                 .dev_disconnect =3D snd_jack_dev_disconnect,
>         };
>
> --
> 2.55.0
>

LGTM.
Reviewed-by: Cen Zhang <zzzccc427@gmail.com>

Best regards,
Cen Zhang
