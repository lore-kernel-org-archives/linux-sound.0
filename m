Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC983212B31
	for <linux-sound@vger.kernel.org>; Fri, 28 Mar 2025 07:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743148100; cv=none; b=id1ntRBbNpV3g9AuwmmtEAqNnzpKkc6VlVaI5savjbz16WaELLbuRM/JxW0qmAF8tXjwSrYEvZs80xVbu2glUToSgd6isVGuTAOYvQ2g6W8fIJrZYJcU4XPOjovSuxVpF2tBygj9zmtWf9/v4j6hb6x29ROyX011KDT3n3i7VbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743148100; c=relaxed/simple;
	bh=1VRG5gptAlPsvHDNKA/iNCN3DmfzeGWVXmFnEWaIm8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTFbzgNyQf9Fq099sasyPmVwMToPuSgYCDn7xSp6OYu010mx9Z5c7fDlWd0ePdzX5sASKJM4iRpgZtdRdU0bLD3pfSX/oQhMzTsFg1DU9iPsRlniHbbsp2XBNrTtdUej2O7FrEeMoj2jAQThS8uMmvZeTTxzRL65nPp2xa9cjlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GhNKDRh+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GhNKDRh+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so2981384a91.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Mar 2025 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743148096; x=1743752896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRzjJUpNQVaJwaxONUg7oIZp4mvWCO0S0U577rY3xUE=;
        b=GhNKDRh+8za6emkYm3zB+1svPtZsuKZfHMXkjR67qgoXb+RRsqj9TIUvo0IJOIEaMN
         9XkY9jrSXp18Lp2nJOHLyGyhYjhbS7zyFGeT/L+4wFmRXfmvUnePmFUDvory/ork7SPa
         wEfDBbb6U3kIp7/w/3FcCIDzT9/Xd8wqDMF0z7mtnQkPDavyDrp/PPLBbC9xp7OBR+rH
         Kyje2oJGFqOJiIJZRmjEdj0Zxtmr+ZrnWHb8/BkFhNOGYROz1BjcWupoKvsXmQSsgIgF
         wFA7vyvnxDqZUHbwKBikk3pa8Edr7eH9kaLj1am71FoIKmPKN5NsJlCDXL8WPip259gQ
         TNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148096; x=1743752896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRzjJUpNQVaJwaxONUg7oIZp4mvWCO0S0U577rY3xUE=;
        b=sjlY+FbeKT0DerkGriagCCwhz+cxkU1YUxLDR5En4CMkoK5Huq0qv/tDIu6s/BY2Ls
         YzLfcLOSJKLonQvr4hZ2AfONRpnV0PYdUZYK1ljoCYwXTlvdWn7fuL38WmFFoDgnffeK
         jlFrt0+oNc8m0l4H6VC2VkfzaZk8l61gFKuoFrXfqj4prw5yddSZKMFbV93a2i+if3pf
         7Ne9NU6hVSlyazdKYQ9OEiYLwwjYX9CuzbA+QfP/HDPe4C2LsgVO3iVtn7OwQzKsBm0u
         +FWAP+RJURLefzL+L3OLlDu50EX9ro1bY1He98coxBLMV7uDBjX/KE1tV3oG64nh5UQn
         NHXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBmV5ckZNNwlGXayxSp5SHb3dOasJ9uWwhNby4iYZdGrC8o5Z9N7lYoI0tH/iIlBe4Ub2Uiqc1C/NY6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFmF4oXzvgpoJvUmhQg7fzwZRcvHgNiS9WNjxW6LTDV40imqBZ
	6Man6ToDialGPPzZcS2Xplqu4ouwQFHhP4xPLccV9mZ196LVmeDbtiqySdfL407QSHguRW/pliL
	VHAhfnOTvQPs4Wg7nnQWq+P2Usiq2n/7QXfMm
X-Gm-Gg: ASbGncvD4P0zVv5nHleaysFtmyL9oU6yciA3wZcUWjTIwseCkcs/WNzDCsqoZ7qlRhv
	2Zf8/FqPWYstbyPnaWVj6n1psZ9V2WR53593p5HeFglMgJUwl9cGsR4uU/3Oj5BVWJT6dzuA49P
	AsobcEKs4HnIZGi41AXHAHd3KnHHXJ+ZKJ7JPi1jmWilA5BdpYgq4qkJvQ
X-Google-Smtp-Source: AGHT+IEBaxbL6HDDZL1bOaRlCywyrAoYUcEN4dxkxdnp4CwBP8mzj2N3dlVlnb1ED+EAow643ibowia8gXssCwa290c=
X-Received: by 2002:a17:90b:2590:b0:2ee:bc7b:9237 with SMTP id
 98e67ed59e1d1-303a85c8a48mr9336414a91.27.1743148095893; Fri, 28 Mar 2025
 00:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-13-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-13-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:48:00 +0800
X-Gm-Features: AQ5f1JrlHT0yIgJWcDgTjea01A8oianDjLUwfLWklDsfjSug36IyOZb6G4iSTYk
Message-ID: <CAGCq0LYvXsRpfhWrvWu0=hQHBVYqJ2ifnv0wEbPWtmTw7j6-CQ@mail.gmail.com>
Subject: Re: [PATCH v36 12/31] ALSA: usb-audio: Introduce USB SND platform op callbacks
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:56=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Allow for different platforms to be notified on USB SND connect/disconnec=
t
> sequences.  This allows for platform USB SND modules to properly initiali=
ze
> and populate internal structures with references to the USB SND chip
> device.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  sound/usb/card.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/usb/card.h | 10 ++++++++++
>  2 files changed, 59 insertions(+)
>
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 6c5b0e02e57b..4ac7f2b8309a 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -118,6 +118,42 @@ MODULE_PARM_DESC(skip_validation, "Skip unit descrip=
tor validation (default: no)
>  static DEFINE_MUTEX(register_mutex);
>  static struct snd_usb_audio *usb_chip[SNDRV_CARDS];
>  static struct usb_driver usb_audio_driver;
> +static struct snd_usb_platform_ops *platform_ops;
> +
> +/*
> + * Register platform specific operations that will be notified on events
> + * which occur in USB SND.  The platform driver can utilize this path to
> + * enable features, such as USB audio offloading, which allows for audio=
 data
> + * to be queued by an audio DSP.
> + *
> + * Only one set of platform operations can be registered to USB SND.  Th=
e
> + * platform register operation is protected by the register_mutex.
> + */
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops)
> +{
> +       guard(mutex)(&register_mutex);
> +       if (platform_ops)
> +               return -EEXIST;
> +
> +       platform_ops =3D ops;
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_register_platform_ops);
> +
> +/*
> + * Unregisters the current set of platform operations.  This allows for
> + * a new set to be registered if required.
> + *
> + * The platform unregister operation is protected by the register_mutex.
> + */
> +int snd_usb_unregister_platform_ops(void)
> +{
> +       guard(mutex)(&register_mutex);
> +       platform_ops =3D NULL;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_unregister_platform_ops);
>
>  /*
>   * Checks to see if requested audio profile, i.e sample rate, # of
> @@ -954,7 +990,11 @@ static int usb_audio_probe(struct usb_interface *int=
f,
>         chip->num_interfaces++;
>         usb_set_intfdata(intf, chip);
>         atomic_dec(&chip->active);
> +
> +       if (platform_ops && platform_ops->connect_cb)
> +               platform_ops->connect_cb(chip);
>         mutex_unlock(&register_mutex);
> +
>         return 0;
>
>   __error:
> @@ -991,6 +1031,9 @@ static void usb_audio_disconnect(struct usb_interfac=
e *intf)
>         card =3D chip->card;
>
>         mutex_lock(&register_mutex);
> +       if (platform_ops && platform_ops->disconnect_cb)
> +               platform_ops->disconnect_cb(chip);
> +
>         if (atomic_inc_return(&chip->shutdown) =3D=3D 1) {
>                 struct snd_usb_stream *as;
>                 struct snd_usb_endpoint *ep;
> @@ -1138,6 +1181,9 @@ static int usb_audio_suspend(struct usb_interface *=
intf, pm_message_t message)
>                 chip->system_suspend =3D chip->num_suspended_intf;
>         }
>
> +       if (platform_ops && platform_ops->suspend_cb)
> +               platform_ops->suspend_cb(intf, message);
> +
>         return 0;
>  }
>
> @@ -1178,6 +1224,9 @@ static int usb_audio_resume(struct usb_interface *i=
ntf)
>
>         snd_usb_midi_v2_resume_all(chip);
>
> +       if (platform_ops && platform_ops->resume_cb)
> +               platform_ops->resume_cb(intf);
> +
>   out:
>         if (chip->num_suspended_intf =3D=3D chip->system_suspend) {
>                 snd_power_change_state(chip->card, SNDRV_CTL_POWER_D0);
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index cdafc9e9cecd..d8b8522e1613 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -209,7 +209,17 @@ struct snd_usb_stream {
>         struct list_head list;
>  };
>
> +struct snd_usb_platform_ops {
> +       void (*connect_cb)(struct snd_usb_audio *chip);
> +       void (*disconnect_cb)(struct snd_usb_audio *chip);
> +       void (*suspend_cb)(struct usb_interface *intf, pm_message_t messa=
ge);
> +       void (*resume_cb)(struct usb_interface *intf);
> +};
> +
>  struct snd_usb_stream *
>  snd_usb_find_suppported_substream(int card_idx, struct snd_pcm_hw_params=
 *params,
>                                   int direction);
> +
> +int snd_usb_register_platform_ops(struct snd_usb_platform_ops *ops);
> +int snd_usb_unregister_platform_ops(void);
>  #endif /* __USBAUDIO_CARD_H */
>
