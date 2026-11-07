Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018079;
	b=AKxge9Kk/kOuiVl4yGpE1JLXO9gNJeAMi19P1O8HFd411EdR3yH/HbegAE1X+gAaG/Xm
	 ZaD5SXine10RVli1v+4Xlh7bl1K+JFEnSwO4/IdWzVWuGiJ5AYSd4OFFnCbO5tN72fSYv
	 /qEKjJrRzFHgQVp50dUbOXSyjW3SalKYuWtvru+H69dGODc+X5nzn9cMsNbmQEQro0vSz
	 skm8YJLeV/0+asT/2iR7znBZcfutfM11pp3Ef61fzZcxi53RdPsiEM84W9H9qfDQlS6Rd
	 PTDfo72eyaR1X904vfNnjk0C6g1NeBfYGpU9uS/DpZX1h7b00WCMVHZCb42EQcRrUrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018079;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/z+Xlk+Qf5yxtvpL42RAPU+QoRAw6tH/3iDZV316Mw8=;
	b=36C4Dt14D6QqDtQ77f/z+1t2VjyE/3A15Z41c4HHvcr/UfkUgmDoMMi9SxNoVxpoMLfp
	 niqAmMSWTH6E2PVkP0Q3o/eoygX6cP9vYsrHgskNsFIyTbwe+hV+FvVWzj42CjvILLCPg
	 pU6VqcEeH7k0NVu1BEnB45huvW5E5Qs3Gja98byRcRxBO4Gwx4kmuzHc583te84tWLtC9
	 rJmoP+MjizfwCs//WMzXzaDdeRd1NhaWKzL0AYOFN/H1Jiy3g07IDncpZ7pV+X+BtZryn
	 gBo6AZaG97s9SQdXOndmHe77yfntGZXSomaDVyuy1g3EEBk7Dn6AXia7CHw8zKY5t8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IaBvhme+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039AA606A330
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 02:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IaBvhme+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B754B1F008A1;
	Sat,  7 Nov 2026 02:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018078;
	bh=/z+Xlk+Qf5yxtvpL42RAPU+QoRAw6tH/3iDZV316Mw8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=IaBvhme+qCgF66YUb6aNGAY65uG78Fvqu4osj/ehDU3BEteHsQSVzV+MqxAIFaoF7
	 DszkY1CFNwLAUZRhShI9ZFSP0Us0M+wjRsrj17+j6y+ZNj9qObuLl5lUqqlsceSoz7
	 BzrEQqz1GRk3eNIF7QItptUyvx+IsqpDZ6NAlHihIatbKA0hEM+wu7s1oOt66swnXI
	 +Y8GyN6uFSnisfdzaXx+7pO63o67SvNCG6VdLrQdYm4QCPxiMC7bL+M8HX9dCt2yL9
	 junrx6GfqQDP4rmyZuVUyY4j1orbdFNSvsiO2k+v3/BPIIhGfBO+ACpANGANDgj/4E
	 ybqb3dSXQ4Nwg==
Message-ID: <sashiko-outbox-202499@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Skip broken playback feature unit
 on XiiSound chips
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cristiano Souza" <cristianocps@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261107020622.119529-1-cristianocps@gmail.com>
References: <20261107020622.119529-1-cristianocps@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 02:21:18 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ALSA: usb-audio: missing unit 5 re-pinning in
  snd_usb_mixer_resume_quirk()
- [Medium] ALSA: usb-audio: missing short-read check in
  snd_xiisound_init_fu_pins()
--

commit 599ffb39dcedddf5b2afe433d25ebe88e2031e78
Author: Cristiano Souza <cristianocps@gmail.com>

ALSA: usb-audio: Skip broken playback feature unit on XiiSound chips

This commit hides the broken playback feature unit (unit 5) on Weltrend
XiiSound devices (040b:0897) via usbmix_name_map and pins its volume to
maximum with mute cleared during mixer creation.

> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 5839719444f8b..ee12bc7d1cacc 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -4603,6 +4603,59 @@ static int snd_audiofuse_controls_create(struct us=
b_mixer_interface *mixer)
>  	return err;
>  }
> =20
> +/*
> + * Weltrend XiiSound chips (040b:0897, e.g. Redragon H878):
> + * the playback feature unit (id 5) is broken; its volume controls act l=
ike
> + * mute switches below the maximum value and the channel mapping is
> + * unreliable, so the unit is hidden from userspace entirely (see the
> + * quirk in mixer_maps.c) and userspace falls back to software volume.
> + * Pin the unit's master and channel volumes to the reported maximum
> + * and unmute them, so the audio path stays fully open.
> + */
> +static int snd_xiisound_init_fu_pins(struct usb_mixer_interface *mixer)
> +{
> +	struct snd_usb_audio *chip =3D mixer->chip;
> +	unsigned char buf[2];
> +	int ifnum, ch, err;
> +
> +	if (mixer->protocol !=3D UAC_VERSION_1)
> +		return 0;
> +
> +	ifnum =3D snd_usb_ctrl_intf(chip->ctrl_intf);
> +
> +	/* unit 5 is the playback feature unit on these chips */
> +	for (ch =3D 0; ch <=3D 2; ch++) {
> +		err =3D snd_usb_ctl_msg(chip->dev, usb_rcvctrlpipe(chip->dev, 0),
> +				      UAC_GET_MAX,
> +				      USB_DIR_IN | USB_TYPE_CLASS |
> +				      USB_RECIP_INTERFACE,
> +				      (UAC_FU_VOLUME << 8) | ch,
> +				      (5 << 8) | ifnum, buf, 2);
> +		if (err < 0)
> +			return 0; /* no such unit/channels, nothing to pin */
> +
> +		err =3D snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
> +				      UAC_SET_CUR,
> +				      USB_DIR_OUT | USB_TYPE_CLASS |
> +				      USB_RECIP_INTERFACE,
> +				      (UAC_FU_VOLUME << 8) | ch,
> +				      (5 << 8) | ifnum, buf, 2);

[Severity: Medium]
Can a short read from UAC_GET_MAX cause UAC_SET_CUR to send uninitialized
stack bytes from buf[]?

snd_usb_ctl_msg() returns the transferred byte count from usb_control_msg().
If UAC_GET_MAX returns 0 or 1 bytes, checking only err < 0 lets execution
proceed to UAC_SET_CUR, writing uninitialized stack memory on ch =3D=3D 0 (=
or
buf[0] overwritten with 0 by UAC_FU_MUTE on ch > 0) to the hardware volume
control.  Should this check err < 2 instead?

> +		if (err < 0)
> +			return err;
> +
> +		buf[0] =3D 0; /* unmute */
> +		err =3D snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0),
> +				      UAC_SET_CUR,
> +				      USB_DIR_OUT | USB_TYPE_CLASS |
> +				      USB_RECIP_INTERFACE,
> +				      (UAC_FU_MUTE << 8) | ch,
> +				      (5 << 8) | ifnum, buf, 1);
> +		if (err < 0)
> +			return err;
> +	}
> +	return 0;
> +}
> +
>  int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
>  {
>  	int err =3D 0;
> @@ -4616,6 +4669,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mix=
er_interface *mixer)
>  	case USB_ID(0x0644, 0x8047):
>  		err =3D snd_us16x08_controls_create(mixer);
>  		break;
> +	case USB_ID(0x040b, 0x0897):
> +		err =3D snd_xiisound_init_fu_pins(mixer);
> +		break;

[Severity: Medium]
Should snd_xiisound_init_fu_pins() also be called from
snd_usb_mixer_resume_quirk(), similar to dell_dock_mixer_init() for
USB_ID(0x0bda, 0x4014)?

Because xiisound_map ignores unit 5, __build_feature_ctl() never registers =
an
element in mixer->id_elems[5], so snd_usb_mixer_resume() ->
restore_mixer_value() will not restore unit 5 after a suspend/resume cycle
that resets the device, leaving playback audio muted or broken with no user=
space
controls to recover it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107020622.1195=
29-1-cristianocps@gmail.com?part=3D1
