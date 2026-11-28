Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880507;
	b=duLquVqOI+ky3d3epqLIBt4FERdO9yeiPzPy5ffdlG1NGVNYE1udnSWiVfVLRXDWhIOn
	 RNI14HYVum5UDiQrlY1SE/7rESmnYVUDKuU4RqQhkf1JUFhaNeozFZwFnc7WxwumJsobE
	 Q5sburTxn1Mb0mZyuwVAX0QaCHFaVtu7PO2ehpbvNGlzvMU2bRWH+roZDs+9LcxmbUgzI
	 lXw7LG5B38qGGB9ckr6Pc2UnXieU7DXY4XomWaDe0Z0Dcj6O3h3DHQJ2yuBozXH78X43q
	 paJgk62/Od44HHiBVslHAGDqz/7KbbzxVq3ZuuFYM7HleDTK2SGFPcXjynH9jZjfaaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880507;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=Njf3LCpa1EGB7I9el7Q1ySeNFq2mKmwn38droMed0Fg=;
	b=4Rog2aVkttteaVcOoFq0x+QtKQziiapJbPAwavCUp5QwqGwozlNcLUzB8aNsamJxvGcD
	 EH9BjztNPPsfHaa9jUgTdqKWjXAQf9OC15Olc8JYIC9SCauXUZh2TGm9fdQHGhMl9trRy
	 lOP4rpqw0/CNX1TmuPHKVV6EWZqH57L5yoIUMq5Gm4bpx9AIHXBUTLSMFJ1E7ppcWwgxE
	 7E7XyBT1q2v2Mbl+Nt/lXJvYqi1yXq/VsMpqs+9yIUObOftAYg/EYFVjoIHzXtmNTInIy
	 HW/lctoGN76flUaYIzVAqoe8V8LaTM2FzleyCuvNP4SD2z1LMLT4VZhcY6e66gjCAhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=D3s53hun;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC9606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 15:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BCC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=D3s53hun
DKIM2-Signature:  i=1; m=1; t=1795880504;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.li;
 s=s31663417:rsa-sha256:hGNkX8cUdZ6dW1P3y5YKjRut5r8P
   xNc2MsRmT11vFiHchElnk7xbTgl+A/EX0zR0K/QbPBgJ5imd2EybgFgEZOeNQaLVzN/bHSAoFrM
   MLcO9OtMSmxWsrj4F8H8F+EK+tOR+Df3zZAw6rdB72XyTeTCX09RVHPh4z6dRIZIrtaqAD+Fg4N
   PWRbHhSsfRihVa8yfLKwBkro1Gc1fvm0NwtX/elsJiU6uJ4RjBBNGRPmg0K65Axa0NXi2lKheYi
   bQ9ogc4vI+43zc7b6+9WzSKnBC5zyOztWKTrd3q596bNflaXylJq6aVmFoRxssnl1avxCZhSYGN
   kH2ngsS14YtUJQ==;
Message-Instance:  m=1;
 h=sha256:
   R2HwWaV5/8ZDwsqg0hLBtoJlplvaAnOkeDx2T3UT6E8=:
   y+fhPd/QBFmuTB+yeU+XDm/GVg6iznwXd30gEBRbNks=,
  sha512:
   PUnE18xhjsDOImxxu6+MGuBc1KqmetJN6mbk0wN+be50o2Ay5EZ2+o4N8Vl6o3sV+gEz4RHdied5mFbP6fEN5g==:
   KqZI9jFzxj2KnHr6CnLDqVgygFlL5+3aWquj02OO+fDpMryObzA+HrhyymfXmZ5EpM/QbXmvpxo3hNfCD/Y2Og==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1795880503; x=1796485303; i=arc@gmx.li;
	bh=Njf3LCpa1EGB7I9el7Q1ySeNFq2mKmwn38droMed0Fg=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D3s53hunjKrK9dc/rOx7EkfAtV44ZDKbRLIdVEs2qPZuBbwLRAjR4LMSZ+oYiUwC
	 h8b/3cu1dif5jtTb4WhFvorHYoIOxGTglmSMMFfr2ry1NAmv2jQgcrw7/fvdRB9Zt
	 f+PQ9JTxFykoGTIwXOJk8HVHgu5PFFoVN8IqIbWT3Tb5yM17ynxkufdmSIFmCNARk
	 UbKu6T6dFy6F1KInXJauFyLnCQgKOst6UCwQwvX4EJFt9yMtMJrzQefwiHQjI+wyC
	 R+aMkfM8e/sxJyk5hX/9bb4VsMc+x67G5bL87iAiOfat/5BW8BFKIj8GayEkCiMmx
	 oK2KZy5DU77jVNANOQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ycl-1xUraG1v0l-00BDNI; Sat, 28
 Nov 2026 16:41:43 +0100
Date: Sat, 28 Nov 2026 16:41:42 +0100
From: Christian Ruppert <arc@gmx.li>
To: =?utf-8?B?0J3QuNC60LjRgtCwINCi0LDRgNCw0YHQvtCy?= <nik@tarasov.top>
Cc: linux-sound@vger.kernel.org, tiwai@suse.de, mrwillporter@gmail.com,
	drabik.p@gmail.com
Subject: Re: [PATCH] ALSA: usb-audio: Initialize Audient iD14 MkII monitor
 mix at unity gain
Message-ID: <awr2FXUok_k34MRc@khmer.arcnet>
References: <781FF3DB-B352-4B18-A42D-40AAB3A46C51@tarasov.top>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <781FF3DB-B352-4B18-A42D-40AAB3A46C51@tarasov.top>
X-Provags-ID: V03:K1:YRFdGIzI72khrr+7Ifol7C+QLvmYbLxS7FQI7kh3Ef0zahlfg0q
 7RyeCVZfaCdXALYBo8JZ1iP418G0BFIfUaUh/hVbZfoXqwdg+DIgBLKODh8sMcZqkdY9LkN
 UpuwoeibmUd0OIjCiDL6lYwMz3b8gxqwBOqPLaN6YQxSXebn14F5YWj9L9QkcNNnKblCUOk
 K0+A2BmSMs5evfz7nWb8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1BEzu5aNHRg=;wsDnkJIKnB7Gd4JRaATULFTScCp
 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
 yrmdp+wQdiwE=

Hi =D0=9D=D0=B8=D0=BA=D0=B8=D1=82=D0=B0,

It looks like your patch is partially covered by a series of patches for
much broader iD14 support which is currently being prepared by Will, see
https://lore.kernel.org/linux-sound/20261115214336.17917-1-arc@gmx.li/ for
the latest patch series proposal (which will be close to the final one).

Could you please check which aspects of your patch are covered by these
patches (I suspect Will's patches concerning FU12 are the most relevant)
and rebase the remainder on top of it?

Thanks,
  Christian

On Thu, Nov 26, 2026 at 05:01:17PM +0500, =D0=9D=D0=B8=D0=BA=D0=B8=D1=82=D0=
=B0 =D0=A2=D0=B0=D1=80=D0=B0=D1=81=D0=BE=D0=B2 wrote:
> The Audient iD14 MkII (2708:0008) feeds its main monitor outputs from a
> four-channel volume feature unit (FU 12).  The unit's attenuation is
> asymmetric in the device firmware: the left main channel ignores its
> volume value while the right main channel applies it, so any value
> below 0 dB unbalances the main stereo pair.  Commit 9c0564fcc21a
> ("ALSA: usb-audio: Rename the Audient iD14 monitor mix volume
> control") renamed the control so that userspace does not adopt it as a
> master volume, but nothing brings the unit to a known-good state.
>=20
> In addition, the firmware silently drops volume SET_CUR requests that
> arrive while the driver is probing the device after a USB reset: the
> request is ACKed but ignored, and a GET_CUR issued immediately
> afterwards echoes the last payload instead of the actual state (the
> same shared-response-buffer behaviour reported for the iD14 MkI in the
> "ALSA: usb-audio: Audient iD14 MkI vendor controls" RFC series).
> Writes issued after probe has settled are applied reliably.
>=20
> Schedule a delayed work that writes 0 dB to all four channels of FU 12
> three seconds after the mixer is created, mirroring the startup state
> of the Audient desktop application, and cancel it on disconnect via
> private_free.
>=20
> Tested on linux 7.3.6 with an iD14 MkII: with FU 12 left at -25 dB,
> reconnecting the device now restores unity gain automatically.
>=20
> Signed-off-by: Nikita Tarasov <nik@tarasov.top>
> ---
>  sound/usb/mixer_quirks.c | 65 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>=20
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 01210cc..2672f6f 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -4419,6 +4419,67 @@ static int snd_djm_controls_create(struct usb_mixe=
r_interface *mixer,
>  	return 0;
>  }
> =20
> +struct audient_mix_init {
> +	struct usb_mixer_interface *mixer;
> +	struct delayed_work work;
> +};
> +
> +static void audient_monitor_mix_work(struct work_struct *work)
> +{
> +	struct audient_mix_init *d =3D
> +		container_of(work, struct audient_mix_init, work.work);
> +	struct snd_usb_audio *chip =3D d->mixer->chip;
> +	/* 0 dB on all four channels (main L/R, cue L/R) */
> +	const u8 target[2] =3D { 0x00, 0x00 };
> +	u8 ch;
> +
> +	for (ch =3D 1; ch <=3D 4; ch++)
> +		snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
> +			UAC_SET_CUR,
> +			USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT,
> +			(UAC_FU_VOLUME << 8) | ch,
> +			snd_usb_ctrl_intf(d->mixer->hostif) | (12 << 8),
> +			(void *)target, sizeof(target));
> +}
> +
> +static void audient_monitor_mix_free(struct usb_mixer_interface *mixer)
> +{
> +	struct audient_mix_init *d =3D mixer->private_data;
> +
> +	cancel_delayed_work_sync(&d->work);
> +	kfree(d);
> +	mixer->private_data =3D NULL;
> +	mixer->private_free =3D NULL;
> +}
> +
> +/*
> + * The Audient iD14 MkII main monitor outputs are fed by a four-channel
> + * volume feature unit (FU 12) whose attenuation is asymmetric in the
> + * firmware: the left main channel ignores its volume value while the
> + * right one applies it, so any value below 0 dB unbalances the stereo
> + * pair.  Ensure the unit starts at unity gain, like the Audient desktop
> + * application does.
> + *
> + * The firmware silently drops volume writes that arrive while the
> + * driver is still probing the device after a USB reset (the request is
> + * ACKed but ignored), so apply them from a delayed work once probe has
> + * settled.
> + */
> +static int audient_monitor_mix_init(struct usb_mixer_interface *mixer)
> +{
> +	struct audient_mix_init *d;
> +
> +	d =3D kzalloc_obj(*d);
> +	if (!d)
> +		return -ENOMEM;
> +	d->mixer =3D mixer;
> +	INIT_DELAYED_WORK(&d->work, audient_monitor_mix_work);
> +	queue_delayed_work(system_percpu_wq, &d->work, msecs_to_jiffies(3000));
> +	mixer->private_data =3D d;
> +	mixer->private_free =3D audient_monitor_mix_free;
> +	return 0;
> +}
> +
>  int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
>  {
>  	int err =3D 0;
> @@ -4557,6 +4618,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mi=
xer_interface *mixer)
>  		err =3D dell_dock_mixer_create(mixer);
>  		break;
> =20
> +	case USB_ID(0x2708, 0x0008): /* Audient iD14 MkII */
> +		err =3D audient_monitor_mix_init(mixer);
> +		break;
> +
>  	case USB_ID(0x2a39, 0x3fd2): /* RME ADI-2 Pro */
>  	case USB_ID(0x2a39, 0x3fd3): /* RME ADI-2 DAC */
>  	case USB_ID(0x2a39, 0x3fd4): /* RME */
> --=20
> 2.56.1
