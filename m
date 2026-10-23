Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792758480;
	b=PF4CuU8u/9x3x2jhFse6XFgXOteSZXqkPVk1lhI8UQyOlBRq2MCfCaBaQlqjS2GnWwY1
	 GF5yaVbZmet5/V/GxMtMrK9VD72WkKI/E2RnDg+gyydN0RXZ4g4dDoBQMHUg0RbtGOSrT
	 py3m+Z398sDu/5ToCkw9mg9RraI0EeOKkHpKFLauE5Nom/6ldoMgZ30Z2HLmOeYv84/sj
	 O2u86IHqjvByPCCnGnnGMW6T9LoqmwvFSV8cgkVsKT0yW3g3H2V4wCpnQDU52mLBHiz5k
	 rUMuS3WC/3SWxMOci4MzFNqG1LHT5mwB1VLmp1RvxUKWVYqPTaJwKAtOSco1KKpB5BA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
	b=tL5V5LEh1v/sZwfuQimjodMhUrLc7KWOTSMC/fP1/C0ZumswAin79A/3GOysqPg7LivH
	 eMME9BH3XAVx57QfqJVimqumt+qvYlaPEM8LMxONs4WDaBf9nEyeMr2+cYFGkcZ8/Y0Ag
	 lI7zxGfLMIonCMZfkkxVZyG2E3l0X7n/jmvvmHy1/glCcm65IBOC6wXCsLk9z9RXGMCxp
	 5rNeICvAt1+YjbEwRn3/NMOdQ54l+q8y4CT78bxuSAgdKnVNW7AWA4fVrW4tYHBfrgZSA
	 wMiF1LDScpbafoiEjvgyEMiqpApgVTCLsKErtr7mCLBiJBxAO9paeeq+YG+7GXd1t8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TiRebw83;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963BD606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 12:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 963BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TiRebw83
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6767d92cde6so898655d50.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 05:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758479; cv=none;
        d=google.com; s=arc-20260327;
        b=owTVWSzYQedMCxeYzyxetxcz02POIyx+TdiyQJJ3dRhno2M+ZMghZsMrvdrD8bpCXC
         fKxNzHFOX8AhiC95trjyCKW1s2BxRsQTydmJI5cMpM2BlbEu1iaTH01XOEtkmHNavHLq
         WOK+AvWkvfnRopctsIXy7HQcGW5RiqcmS85nhQExtuCYDut2n5sEDUnKaLnQRYgg0QnG
         53NnpTon5ems74Z4WJAQg3uaSIN7rD6gXnT4oOF/SjNUwTM1SkMGhFUhnpDhFUO1/23M
         aPa8yFAxvbBk/LkN1pSCa84K8UygYEDdI/BcucjFmu+CwvCg9dEsnGzGfYhXZiiYDouD
         jdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=S3Xx56In9daHnB8RBxei9OMRMorccEh9xg5hFajlchT/kbjVU3GcksLsMVpKC8LSbR
         AZ6Nn0mOL13EotWGxDPGM3GTMGoM8R6PFdRDOhQ4isWGqgM1qrzMMR24RLYyw4b9APXT
         ufivQzx8G2bOlNI/Vqtsls10tbC6ROGhpqXXElwY31V+TO7B/sjTilJvsqksUZdYq7M/
         /5onR661n7WieIRpKBTN4/Q7KCOsuxJ/Ia6Sid4lN2zPgpeU7oBLYEHciTP6wbL8UPD+
         Xeds7o7fv0gEstx/TgmisRtfstFYd3mlrXsJmg0ZHaO3mQ8b068Y6gaon6BRUmTwDng8
         8v8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758479; x=1793363279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
        b=TiRebw83Nkv02cjcYpCKOY6qGYLbox6hCW5BFUzPAfuAqnnu22uhAq/shlDkC9X9a4
         GlfZsnflQSze6y0p+QuaH3qdWbxRtULEyPkFeot6MwD9WyitSkNCIhc9lXcZ4XBdNdtT
         VwaLa5ldpbbiKaWceWeABeHKKV2gAfCLp8uaKBU5jDP5Lv3dbrCGgjlrIO8EVGoC84KM
         MSfmHfZPW4x6X8XdYAjIZ2Stj9YtPv0he2bN+jm9lIR66a5PuW1QqkcR/F2MHHu4fMme
         xMGRBNfBS9xTzilhhavI5Pf6Lk/HtQMloypaXKrA+5moNz54CgY/Jc2dUUVDCYHF3X3/
         jRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758479; x=1793363279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQY67d/Zz756QoGJ/ocO3hnVcH9ZIjPSMX4dABiHKoc=;
        b=zjJlkOto3pkv0fv+7jilc9D4+7uwkKrXqttigRrj0IZ34ArPYC21Er/SlAdhtu87s6
         gtqYqwNcTjGEgLJtV+UxrTuKXecTdOfsP3QvPSmF2TA9Xug3RT2dxxEqaFLChrWVd2NQ
         TAgjYbRvXpTBwAq3dFsAc/huz+tm95wS+QSCb6MgVr95ODfZ0rdsOVM0lWNgvkBM98SE
         t30nei5ypqkY1C9R2skCLkEMdoHvWPfiXrra3FksW6iq2YPsM/ltfxrFlZWbHfL5Xq8s
         u2p/1XLIQIGc2TESPjzvQHzdIasTxkmpleLTGz8kHCxnANqX3jDXM7+5Fle3wqbWUKcQ
         w+0A==
X-Gm-Message-State: AFq9FYIFMHvn0hZ7WC93/KVubtyIQKvlrQyaDVcTWbAZE8hHdCTyoP3H
	BY/Imo+9kp10ZSvuImUcbaFeV9ltRWwRqGtPPEvZdICO0yQ7AmZyD1eaAjq+hkOYFiE+J5/4EHl
	UiyUPTaSLPHE0LGsLJjarbGxkBSZjQA==
X-Gm-Gg: AYBFou0WJa14jOXmtwCA82TUyKEX0UWsaORtVPq55I+u38uyTqPBmmwinpbnr57ec4l
	3KThS7N+U6Hr7lLoL7YfNajIXPPOJlrlNtW8Yi67Gp5S8eybpECjghrgXeY8KESPKpe3uZoeF+R
	+wIeOSyXad2zePFHP645/jPJckDBGIg4k7ggxQOcmxMftPmiHRhKA9WW1LoDesSwl4fUb4XkHPz
	zK/aiizLZXEjBYbYLp/KiQA492hYzR1LmduClFmZr5S/wxt9VjnqCXxO7+VOy1udh0EEc4apBJt
	h93Q6FgayKHxqgL6FIePng338XGQg/ERstySUZg+GBOK8Hs8wqrnNwz1QDYGrVFtFgMpfZjXTbn
	7DdsIaakw5PwhOsW/N7lFypdcWUPUDAZ+7CP75OF2t/3JbY7z5W1ZCeb7Rzep3K3RwRiZ2HSZhQ
	hfBcyu1pUkAeCWVYUZr5FP7cO0dvXVfAHTL56580U=
X-Received: by 2002:a05:690e:12cf:b0:679:a925:edf2 with SMTP id
 956f58d0204a3-67a35bb9bd5mr1507183d50.19.1792758478595; Fri, 23 Oct 2026
 05:27:58 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022164340.78664-1-rainey.shawn+kaudio@gmail.com> <sashiko-outbox-181835@kernel.org>
In-Reply-To: <sashiko-outbox-181835@kernel.org>
From: Shawn <rainey.shawn@gmail.com>
Date: Fri, 23 Oct 2026 08:27:47 -0400
X-Gm-Features: AclHuK8dKd1CFrAVuglMwdaxGNoaEf4sR5SDw0Am1FeI8s6v4RIsVzplaUqWCpg
Message-ID: <CANcp8vf22LvCxqXC6w2jGBjbhNFbA64_Xe4-0AZXsVq_hKKrJg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good catch. v2 incoming  with .ep_idx =3D 1 to the capture entry

Best,

Shawn



On Thu, Oct 22, 2026 at 12:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ALSA: usb-audio: missing .ep_idx =3D 1 in UltraNova capture au=
dioformat
> --
>
> commit aa83c7ced6942ef370a66b06613c33f74107f796
> Author: Shawn Rainey <rainey.shawn+kaudio@gmail.com>
>
> ALSA: usb-audio: add quirk for Novation UltraNova (1235:0011)
>
> This commit adds a composite USB audio quirk for the Novation UltraNova
> (1235:0011) with fixed playback and capture audio formats on interface 0
> and a raw MIDI quirk on interface 1, while leaving the vendor control
> interfaces unbound.
>
> > diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
> > index 6343a50fb2732..0b8bea76eca5b 100644
> > --- a/sound/usb/quirks-table.h
> > +++ b/sound/usb/quirks-table.h
> > @@ -2359,6 +2359,69 @@ YAMAHA_DEVICE(0x7010, "UB99"),
> >               }
> >       }
> >  },
> > +{
> > +     /*
> > +      * Novation UltraNova: vendor-specific class descriptors, fixed
> > +      * audio and MIDI layouts.  Only the audio and MIDI interfaces
> > +      * (0 and 1) are grabbed; the vendor control interfaces (2/3)
> > +      * are left unbound for userspace access.
> > +      */
> > +     USB_DEVICE_INTERFACE_NUMBER(0x1235, 0x0011, 0),
> > +     QUIRK_DRIVER_INFO {
> > +             .vendor_name =3D "Novation",
> > +             .product_name =3D "UltraNova",
> > +             QUIRK_DATA_COMPOSITE {
> > +                     {
> > +                             QUIRK_DATA_AUDIOFORMAT(0) {
> > +                                     /* playback */
> > +                                     .formats =3D SNDRV_PCM_FMTBIT_S16=
_LE,
> > +                                     .channels =3D 4,
> > +                                     .iface =3D 0,
> > +                                     .altsetting =3D 1,
> > +                                     .altset_idx =3D 1,
> > +                                     .attributes =3D UAC_EP_CS_ATTR_SA=
MPLE_RATE,
> > +                                     .endpoint =3D 0x01,
> > +                                     .ep_attr =3D USB_ENDPOINT_XFER_IS=
OC |
> > +                                                USB_ENDPOINT_SYNC_SYNC=
,
> > +                                     .maxpacksize =3D 392,
> > +                                     .rates =3D SNDRV_PCM_RATE_44100 |
> > +                                              SNDRV_PCM_RATE_48000,
> > +                                     .rate_min =3D 44100,
> > +                                     .rate_max =3D 48000,
> > +                                     .nr_rates =3D 2,
> > +                                     .rate_table =3D (unsigned int[]) =
{
> > +                                             44100, 48000
> > +                                     }
> > +                             }
> > +                     },
> > +                     {
> > +                             QUIRK_DATA_AUDIOFORMAT(0) {
> > +                                     /* capture */
> > +                                     .formats =3D SNDRV_PCM_FMTBIT_S24=
_3LE,
> > +                                     .channels =3D 2,
> > +                                     .iface =3D 0,
> > +                                     .altsetting =3D 1,
> > +                                     .altset_idx =3D 1,
> > +                                     .attributes =3D UAC_EP_CS_ATTR_SA=
MPLE_RATE,
> > +                                     .endpoint =3D 0x82,
> > +                                     .ep_attr =3D USB_ENDPOINT_XFER_IS=
OC |
> > +                                                USB_ENDPOINT_SYNC_SYNC=
,
>
> [Severity: Medium]
> Should the capture QUIRK_DATA_AUDIOFORMAT(0) entry in usb_audio_ids in
> sound/usb/quirks-table.h also set .ep_idx =3D 1?
>
> Since capture endpoint 0x82 shares interface 0 altsetting 1 with playback
> endpoint 0x01, endpoint 0x82 is the second endpoint descriptor on that
> altsetting. Leaving .ep_idx unset defaults fp->ep_idx to 0.
>
> When usb_audio_probe() -> snd_usb_create_quirk() ->
> create_composite_quirk() -> create_fixed_stream_quirk() runs in
> sound/usb/quirks.c:
>
>         alts =3D &iface->altsetting[fp->altset_idx];
>         altsd =3D get_iface_desc(alts);
>         if (altsd->bNumEndpoints <=3D fp->ep_idx) {
>                 err =3D -EINVAL;
>                 goto error;
>         }
>
> having fp->ep_idx =3D=3D 0 only checks altsd->bNumEndpoints <=3D 0 and do=
es not
> verify that a second endpoint descriptor exists on altsetting 1.
>
> Next, in create_fixed_stream_quirk() -> add_audio_stream_from_fixed_fmt()=
 ->
> snd_usb_audioformat_set_sync_ep() in sound/usb/pcm.c:
>
>         if (fmt->ep_idx > 0 || altsd->bNumEndpoints < 2)
>                 return 0;
>
>         is_playback =3D !(get_endpoint(alts, 0)->bEndpointAddress & USB_D=
IR_IN);
>         attr =3D fmt->ep_attr & USB_ENDPOINT_SYNCTYPE;
>         if ((is_playback && (attr =3D=3D USB_ENDPOINT_SYNC_SYNC ||
>                              attr =3D=3D USB_ENDPOINT_SYNC_ADAPTIVE)) ||
>             (!is_playback && attr !=3D USB_ENDPOINT_SYNC_ADAPTIVE))
>                 return 0;
>
> because fmt->ep_idx is 0 rather than 1, snd_usb_audioformat_set_sync_ep()
> does not return early at fmt->ep_idx > 0 and instead checks
> get_endpoint(alts, 0) (playback endpoint 0x01), treating the capture
> audioformat as is_playback =3D true. That also appears to be why omitting
> USB_ENDPOINT_SYNC_SYNC caused generic sync-EP detection to pair 0x82 as a
> sync endpoint for the capture direction as described in the commit messag=
e.
>
> Additionally, when opening the capture endpoint via snd_usb_hw_params() -=
>
> snd_usb_endpoint_open() in sound/usb/endpoint.c:
>
>                 } else {
>                         ep->iface =3D fp->iface;
>                         ep->altsetting =3D fp->altsetting;
>                         ep->ep_idx =3D fp->ep_idx;
>                 }
>
> ep->ep_idx for endpoint 0x82 is recorded as 0 instead of 1.
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022164340.78=
664-1-rainey.shawn+kaudio@gmail.com?part=3D1
