Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A8336896
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810654; cv=none; b=ZjyroZb8bvZyO0mH2UXlr2ZpXt9gzMrQb+Vzo92/Zlk91Y/GUPxKHlVCfO/2U9FLD7A60DyoyJsqFqoy3MlFCGjlOPozkRu6qughqH6bHWG35uPO3LKqeqI6ToopT8j7q+6Cj4OYVt71/A/QWyFpsm3nBvc5WAn3XtKX78FSw54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810654; c=relaxed/simple;
	bh=b/rW1PcojEgJtL9lr0YmhpH3NBHGqGgvJ/U2Kl18Ptg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XMShayWzEbpt3BicRnaDw0zrs9pBPiAVzPvMz6uUKMgxn3saWGCvHNtNcjoNlUVi/uVuWagNSHMweXcLrolgQ9zDb9doWpoz/eim7f+2xZ2Cj3voVzrstOz6CGNd8FHjZBnVYZnaDEpJjugL6iWBYgMgU1YsimxSxW5ZIe77Fr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XfZlAUOf; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XfZlAUOf"
X-Forwarded-Encrypted: i=1; AJvYcCWVWztewQuKDHaEWpOGBFvq53Zx5PAi++5HTe9fJgTZlP8or4IscOpHE3UgsrCZevEIhhFqlhctEHivyA==@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775810650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXiCF/cQHLlqLmg5E4EePFicgPfwqLvUFCBSJt2cKhE=;
	b=XfZlAUOfaPFxUTkaGIJHJBO9cZocpUkXumi6gCss4YMeRZdcqG/7xbX1bFJncF/Xbxk/0K
	E1V8xPkLs/50HC97z3xF1iBNv+E64eNB90eLfJQ4q8nXIrlIFciiNa0GA3PGRvkBPs0/Jc
	Oc2+jioqZV+EWxWTXvaaskMfCTAnBNs=
X-Gm-Message-State: AOJu0YwucsYuamEfGffmDB7Qn8bb9lW5Iapwb6wxkaz/1itZ/hoz/s3x
	QkveAIdhr0IphGq3j3JwaQwRpPKHjfqAJCbzvEV0Z0+CZ4K4h49hTTdwSdFWhEEe3gCMmUGFzec
	0wqryR2Y99T7L5R8/noFBenIHDpPQXJQ=
X-Received: by 2002:a05:620a:472a:b0:8d8:9376:3c4a with SMTP id
 af79cd13be357-8ddcf2bfcd6mr301130485a.41.1775810646275; Fri, 10 Apr 2026
 01:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-syy-v1-1-068d3bc30ddc@linux.dev> <87qzoxiqnm.wl-tiwai@suse.de>
 <87mrzlikjk.wl-tiwai@suse.de>
In-Reply-To: <87mrzlikjk.wl-tiwai@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
Date: Fri, 10 Apr 2026 16:43:52 +0800
X-Gmail-Original-Message-ID: <CAANcMPn+aLfBKSoDn4bGPwBQU_8cV0h44Cjais3eOGiauWWpQg@mail.gmail.com>
X-Gm-Features: AQROBzBVXdreW2LlL5UA2rQMNDP8VF6U9I8hFxwfNTnHZU3lIPf8ZiQ4Dx5x7vo
Message-ID: <CAANcMPn+aLfBKSoDn4bGPwBQU_8cV0h44Cjais3eOGiauWWpQg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: apply quirk for MOONDROP JU Jiu
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	kernel@uniontech.com, =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>, 
	Kagura <me@mail.kagurach.uk>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B44=E6=9C=882=E6=97=A5=E5=
=91=A8=E5=9B=9B 21:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 02 Apr 2026 12:48:45 +0200,
> Takashi Iwai wrote:
> >
> > On Thu, 02 Apr 2026 07:36:57 +0200,
> > Cryolitia PukNgae wrote:
> > >
> > > It(ID 31b2:0111 JU Jiu) reports a MIN value -12800 for volume control=
, but
> > > will mute when setting it less than -10880.
> > >
> > > Thanks to my girlfriend Kagura for reporting this issue.
> > >
> > > Cc: Kagura <me@mail.kagurach.uk>
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Cryolitia PukNgae <cryolitia.pukngae@linux.dev>
> >
> > Applied to for-next branch now.
> >
> > > ---
> > > Btw, is it a good idea for turn the volume_control_quirks from
> > > switch-case to a table and sort it accroding to USB VID&PID?
> >
> > Yeah, this might be better, indeed.
> >
> > But the quirk isn't really straightforward for those, maybe we need a
> > matching of USB id plus kctl id name string, then update the cval
> > fields conditionally with flags.  Let me cook later...
>
> This doesn't look easy.  A quick hack is like below, but it doesn't
> reduce the code, ended up with more lines.
>
> So, unless any other clever implementation is given, still not much
> worth for it, as it seems.
>

Hi Takashi,

Thanks for trying this out.

I think the current quirk list is probably still too small to justify
a refactoring like this. For now, it may be better to keep the
existing code and revisit it later if more devices with similar quirks
show up.

Best regards,
Cryolitia PukNgae

>
> Takashi
>
> -- 8< --
> --- a/sound/usb/mixer.c
> +++ b/sound/usb/mixer.c
> @@ -1070,11 +1070,107 @@ void snd_usb_mixer_elem_free(struct snd_kcontrol=
 *kctl)
>   * interface to ALSA control for feature/mixer units
>   */
>
> +#define VOL_QUIRK_MIN  BIT(0)
> +#define VOL_QUIRK_MAX  BIT(1)
> +#define VOL_QUIRK_RES  BIT(2)
> +
> +struct mixer_volume_quirk {
> +       unsigned int id;
> +       const char *ctl_name;
> +       unsigned int to_update;
> +       int min, max, res;
> +};
> +
> +#define QUIRK_ENTRY(vid, pid, name) \
> +       .id =3D USB_ID(vid, pid), .ctl_name =3D (name)
> +#define QUIRK_MIN(v) \
> +       .to_update =3D VOL_QUIRK_MIN, .min =3D (v)
> +#define QUIRK_RES(v) \
> +       .to_update =3D VOL_QUIRK_RES, .res =3D (v)
> +#define QUIRK_MINMAX(vmin, vmax) \
> +       .to_update =3D VOL_QUIRK_MIN | VOL_QUIRK_MAX, .min =3D (vmin), .m=
ax =3D (vmax)
> +#define QUIRK_MINMAXRES(vmin, vmax, vres) \
> +       .to_update =3D VOL_QUIRK_MIN | VOL_QUIRK_MAX | VOL_QUIRK_RES, \
> +       .min =3D (vmin), .max =3D (vmax), .res =3D (vres)
> +
> +static const struct mixer_volume_quirk mixer_volume_quirk_entries[] =3D =
{
> +       /* M-Audio Fast Track C400 */
> +       { QUIRK_ENTRY(0x0763, 0x2030, "Effect Duration"),
> +         QUIRK_MINMAXRES(0x0000, 0xffff, 0x00e6) },
> +       { QUIRK_ENTRY(0x0763, 0x2030, "Effect Volume"),
> +         QUIRK_MINMAX(0x00, 0xff) },
> +       { QUIRK_ENTRY(0x0763, 0x2030, "Effect Feedback Volume"),
> +         QUIRK_MINMAX(0x00, 0xff) },
> +       { QUIRK_ENTRY(0x0763, 0x2030, "Effect Return"),
> +         QUIRK_MINMAXRES(0xb706, 0xff7b, 0x0073) },
> +       { QUIRK_ENTRY(0x0763, 0x2030, "Playback Volume"),
> +         QUIRK_MINMAXRES(0xb5fb, 0xfcfe, 0x0073) }, /* -73 dB =3D 0xb6ff=
 */
> +       { QUIRK_ENTRY(0x0763, 0x2030, "Effect Send"),
> +         QUIRK_MINMAXRES(0xb5fb, 0xfcfe, 0x0073) }, /* -73 dB =3D 0xb6ff=
 */
> +
> +       /* M-Audio Fast Track C600 */
> +       { QUIRK_ENTRY(0x0763, 0x2031, "Effect Duration"),
> +         QUIRK_MINMAXRES(0x0000, 0xffff, 0x00e6) },
> +       { QUIRK_ENTRY(0x0763, 0x2031, "Effect Volume"),
> +         QUIRK_MINMAX(0x00, 0xff) },
> +       { QUIRK_ENTRY(0x0763, 0x2031, "Effect Feedback Volume"),
> +         QUIRK_MINMAX(0x00, 0xff) },
> +       { QUIRK_ENTRY(0x0763, 0x2031, "Effect Return"),
> +         QUIRK_MINMAXRES(0xb706, 0xff7b, 0x0073) },
> +       { QUIRK_ENTRY(0x0763, 0x2031, "Playback Volume"),
> +         QUIRK_MINMAXRES(0xb5fb, 0xfcfe, 0x0073) }, /* -73 dB =3D 0xb6ff=
 */
> +       { QUIRK_ENTRY(0x0763, 0x2031, "Effect Send"),
> +         QUIRK_MINMAXRES(0xb5fb, 0xfcfe, 0x0073) }, /* -73 dB =3D 0xb6ff=
 */
> +
> +       /* M-Audio Fast Track Ultra 8R */
> +       { QUIRK_ENTRY(0x0763, 0x2081, "Effect Duration"),
> +         QUIRK_MINMAXRES(0x0000, 0x7f00, 0x0100) },
> +       { QUIRK_ENTRY(0x0763, 0x2081, "Effect Volume"),
> +         QUIRK_MINMAX(0x00, 0x7f) },
> +       { QUIRK_ENTRY(0x0763, 0x2081, "Effect Feedback Volume"),
> +         QUIRK_MINMAX(0x00, 0x7f) },
> +
> +       /* M-Audio Fast Track Ultra */
> +       { QUIRK_ENTRY(0x0763, 0x2080, "Effect Duration"),
> +         QUIRK_MINMAXRES(0x0000, 0x7f00, 0x0100) },
> +       { QUIRK_ENTRY(0x0763, 0x2080, "Effect Volume"),
> +         QUIRK_MINMAX(0x00, 0x7f) },
> +       { QUIRK_ENTRY(0x0763, 0x2080, "Effect Feedback Volume"),
> +         QUIRK_MINMAX(0x00, 0x7f) },
> +
> +       /* CM102-A+/102S+ */
> +       { QUIRK_ENTRY(0x0d8c, 0x0103, "PCM Playback Volume"),
> +         QUIRK_MIN(-256) },
> +
> +       /* MS LifeChat LX-3000 Headset */
> +       { QUIRK_ENTRY(0x045e, 0x070f, "Speaker Playback Volume"),
> +         QUIRK_RES(192) },
> +
> +       /* QuickCam E3500 */
> +       { QUIRK_ENTRY(0x046d, 0x09a4, "Mic Capture Volume"),
> +         QUIRK_MINMAXRES(6080, 8768, 192) },
> +
> +       /* MOONDROP Quark2 */
> +       { QUIRK_ENTRY(0x3302, 0x12db, "PCM Playback Volume"),
> +         QUIRK_MIN(-14208) }, /* Mute under it */
> +
> +       /* Huawei Technologies Co., Ltd. CM-Q3 */
> +       { QUIRK_ENTRY(0x12d1, 0x3a07, "PCM Playback Volume"),
> +         QUIRK_MIN(-11264) }, /* Mute under it */
> +
> +       /* MOONDROP JU Jiu */
> +       { QUIRK_ENTRY(0x31b2, 0x0111, "PCM Playback Volume"),
> +         QUIRK_MIN(-10880) }, /* Mute under it */
> +
> +       {} /* terminator */
> +};
> +
>  /* volume control quirks */
>  static void volume_control_quirks(struct usb_mixer_elem_info *cval,
>                                   struct snd_kcontrol *kctl)
>  {
>         struct snd_usb_audio *chip =3D cval->head.mixer->chip;
> +       const struct mixer_volume_quirk *q;
>
>         if (chip->quirk_flags & QUIRK_FLAG_MIC_RES_384) {
>                 if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
> @@ -1090,71 +1186,21 @@ static void volume_control_quirks(struct usb_mixe=
r_elem_info *cval,
>                 }
>         }
>
> -       switch (chip->usb_id) {
> -       case USB_ID(0x0763, 0x2030): /* M-Audio Fast Track C400 */
> -       case USB_ID(0x0763, 0x2031): /* M-Audio Fast Track C600 */
> -               if (strcmp(kctl->id.name, "Effect Duration") =3D=3D 0) {
> -                       cval->min =3D 0x0000;
> -                       cval->max =3D 0xffff;
> -                       cval->res =3D 0x00e6;
> -                       break;
> -               }
> -               if (strcmp(kctl->id.name, "Effect Volume") =3D=3D 0 ||
> -                   strcmp(kctl->id.name, "Effect Feedback Volume") =3D=
=3D 0) {
> -                       cval->min =3D 0x00;
> -                       cval->max =3D 0xff;
> -                       break;
> -               }
> -               if (strstr(kctl->id.name, "Effect Return") !=3D NULL) {
> -                       cval->min =3D 0xb706;
> -                       cval->max =3D 0xff7b;
> -                       cval->res =3D 0x0073;
> -                       break;
> -               }
> -               if ((strstr(kctl->id.name, "Playback Volume") !=3D NULL) =
||
> -                       (strstr(kctl->id.name, "Effect Send") !=3D NULL))=
 {
> -                       cval->min =3D 0xb5fb; /* -73 dB =3D 0xb6ff */
> -                       cval->max =3D 0xfcfe;
> -                       cval->res =3D 0x0073;
> -               }
> -               break;
> -
> -       case USB_ID(0x0763, 0x2081): /* M-Audio Fast Track Ultra 8R */
> -       case USB_ID(0x0763, 0x2080): /* M-Audio Fast Track Ultra */
> -               if (strcmp(kctl->id.name, "Effect Duration") =3D=3D 0) {
> -                       usb_audio_info(chip,
> -                                      "set quirk for FTU Effect Duration=
\n");
> -                       cval->min =3D 0x0000;
> -                       cval->max =3D 0x7f00;
> -                       cval->res =3D 0x0100;
> +       for (q =3D mixer_volume_quirk_entries; q->id; q++) {
> +               if (q->id =3D=3D chip->usb_id &&
> +                   !strcmp(q->ctl_name, kctl->id.name)) {
> +                       if (q->to_update & VOL_QUIRK_MIN)
> +                               cval->min =3D q->min;
> +                       if (q->to_update & VOL_QUIRK_MAX)
> +                               cval->max =3D q->max;
> +                       if (q->to_update & VOL_QUIRK_RES)
> +                               cval->res =3D q->res;
>                         break;
>                 }
> -               if (strcmp(kctl->id.name, "Effect Volume") =3D=3D 0 ||
> -                   strcmp(kctl->id.name, "Effect Feedback Volume") =3D=
=3D 0) {
> -                       usb_audio_info(chip,
> -                                      "set quirks for FTU Effect Feedbac=
k/Volume\n");
> -                       cval->min =3D 0x00;
> -                       cval->max =3D 0x7f;
> -                       break;
> -               }
> -               break;
> -
> -       case USB_ID(0x0d8c, 0x0103):
> -               if (!strcmp(kctl->id.name, "PCM Playback Volume")) {
> -                       usb_audio_info(chip,
> -                                "set volume quirk for CM102-A+/102S+\n")=
;
> -                       cval->min =3D -256;
> -               }
> -               break;
> -
> -       case USB_ID(0x045e, 0x070f): /* MS LifeChat LX-3000 Headset */
> -               if (!strcmp(kctl->id.name, "Speaker Playback Volume")) {
> -                       usb_audio_info(chip,
> -                               "set volume quirk for MS LifeChat LX-3000=
\n");
> -                       cval->res =3D 192;
> -               }
> -               break;
> +       }
>
> +       /* other exceptional cases */
> +       switch (chip->usb_id) {
>         case USB_ID(0x0471, 0x0101):
>         case USB_ID(0x0471, 0x0104):
>         case USB_ID(0x0471, 0x0105):
> @@ -1172,16 +1218,6 @@ static void volume_control_quirks(struct usb_mixer=
_elem_info *cval,
>                 }
>                 break;
>
> -       case USB_ID(0x046d, 0x09a4):
> -               if (!strcmp(kctl->id.name, "Mic Capture Volume")) {
> -                       usb_audio_info(chip,
> -                               "set volume quirk for QuickCam E3500\n");
> -                       cval->min =3D 6080;
> -                       cval->max =3D 8768;
> -                       cval->res =3D 192;
> -               }
> -               break;
> -
>         case USB_ID(0x0495, 0x3042): /* ESS Technology Asus USB DAC */
>                 if ((strstr(kctl->id.name, "Playback Volume") !=3D NULL) =
||
>                         strstr(kctl->id.name, "Capture Volume") !=3D NULL=
) {
> @@ -1190,27 +1226,6 @@ static void volume_control_quirks(struct usb_mixer=
_elem_info *cval,
>                         cval->res =3D 1;
>                 }
>                 break;
> -       case USB_ID(0x3302, 0x12db): /* MOONDROP Quark2 */
> -               if (!strcmp(kctl->id.name, "PCM Playback Volume")) {
> -                       usb_audio_info(chip,
> -                               "set volume quirk for MOONDROP Quark2\n")=
;
> -                       cval->min =3D -14208; /* Mute under it */
> -               }
> -               break;
> -       case USB_ID(0x12d1, 0x3a07): /* Huawei Technologies Co., Ltd. CM-=
Q3 */
> -               if (!strcmp(kctl->id.name, "PCM Playback Volume")) {
> -                       usb_audio_info(chip,
> -                                      "set volume quirk for Huawei Techn=
ologies Co., Ltd. CM-Q3\n");
> -                       cval->min =3D -11264; /* Mute under it */
> -               }
> -               break;
> -       case USB_ID(0x31b2, 0x0111): /* MOONDROP JU Jiu */
> -               if (!strcmp(kctl->id.name, "PCM Playback Volume")) {
> -                       usb_audio_info(chip,
> -                                      "set volume quirk for MOONDROP JU =
Jiu\n");
> -                       cval->min =3D -10880; /* Mute under it */
> -               }
> -               break;
>         }
>  }
>
