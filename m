Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7050B283C9D
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 17:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188859; cv=pass; b=Fwxc2QD7XjV9VGAVp91AizMjqkHwyU1XbYlXpJUBwTEA6057RwrgR11KS3Gn/51toDtXeBLp3+rZn4uVXKmuukG7bGCytqAVxaEcdIt+75bGApVk+GHM8mPcdWu1+8N/coBKo6BhmuuQR8P8uTVh7WZHiWguQ350EfmaSz9gb0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188859; c=relaxed/simple;
	bh=8LwguyteE61pZdnZxf+DmcyVozghCCr/eXBRUHKV3FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJ0fSX9guVj1An+bVyDLyWtPfCs/VsIFjZOYJ+Sb4CmyZ+/HHzDsJKmpJ6HHqB3wLvzMWmKiJyyANOfEVHNpILAuDpwCzyHDLZ+mmBNCoTzfrPdTFARHFs3uaTyon5B8MsIIrZSEnkJVk8ylC6hTWNDseZpd0bjoNXIwcCFlgrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAl+rrea; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAl+rrea"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56641b5a471so1198697e0c.2
        for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 09:20:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769188856; cv=none;
        d=google.com; s=arc-20240605;
        b=lyE2yVvw3PUE84cxvDkpBI+0YPQxLNGljOFOGJ3EiIah4q0ePSBQqlg67tjjfXsICr
         PJLSHooqwGH/JNSEjhOuIdz50opadFIn7DVkE8RZcNO3/Tzz1c2uQtZ1Ya15V5IO6vyj
         SLNF8jxCPh5dd/BUla6aWn7TbM2vGP2+dZ1VgHwPfPNWzwiuVHy5AKKbWeRqjfTymkMx
         gAJTk3KRDaZTbFqc921BsoTvA9y2Qebfn5wEde6RUTNLk+/aOiZDmC/1BpIpIK4WqW6Q
         ylYmpWKbuu+bZCzUU/4Olx7VfTwbkMGzVINa+9lALOcacKJ/LxS+Hxi1WRS+oq/LttbQ
         Iqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VT0DdjxO0WMsUpZwBJa9M9XqIdrkOaODly3IcDxEOgU=;
        fh=6W3HzrFNzLMumascZJ1jw/laE7y6AGQw7lRdHVCZvrI=;
        b=X0IGvzwaIuVH9AAcJY/VN8MOOXDgoGApqEIodDW6CrC4VTIJILG+T4oG9NjPtA4FbB
         KFYgJr9B1OECkSMz+tByF2wvlcOvf9Q0sSTrrox89XS1tmBBwmtmrl8dh/H6VXnw/Q/l
         gYF5rEI+m63vrhqb+S6L+1z4b2DS+4rUObhr0IskKTUj9vfU1wrcKaUxr9VJR9u+hPCF
         dPR+mytxLhItRTnTH44txjbUOEHHbohzEQjLV0XmIX0bEnWe6AGDNR+554qdC1XfGuW+
         xwoD7DM+QAcx6NiCgeomSQXM/+6CLVrT6c5BXyTLxmNW8fLMPeKGToy8E+PsvnMg70iA
         abqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769188856; x=1769793656; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VT0DdjxO0WMsUpZwBJa9M9XqIdrkOaODly3IcDxEOgU=;
        b=hAl+rreaKrDxMEj5hOzOwbr2JPfzwYWuumvJBY3zTn0Ix3BlDJ9IIxTiauO2F9DJi8
         MuqH8ANVunS0b2AaQIulgm7WcFH7Llwx5Df7TxGKgq8bk0BrQFP19qlzB9zp9/ExkFZG
         iPGoCGwoQUg5iUyF+Ql/p9gxeQFNDGolJF7NAVK0XVjzSET0ZGJioptwQHtdg/z4A44b
         ZHE7v0tUz+BBBlzEJbLe4wZgn95mDG+jy0L/u3WslI3XMKv0YCnzwy4h/uDrPXRHBV+H
         zDWgOLM3vgmmZtLU2hoel4tVc6UVWPIHapNrUt+eiEoUEmymmDuAcDkrYWqkIHB8H/+X
         RSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769188856; x=1769793656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT0DdjxO0WMsUpZwBJa9M9XqIdrkOaODly3IcDxEOgU=;
        b=sRy6HwQVgG+vrCTEeOTQRW/G9QaQKhIBSVkU7N1eaLE6eKDJWZWCAnLloaagpkBjpv
         VXwYC6z3JVrQBL28BCRAjff6q4JNYAPJnjFemJ6ecWlIgiPM/Ce/BUY5Wq4qFVK3/Ypk
         xE0Lyf9Hk333N5Z8rkw4MBx4xZySXOm16wqS5TYJYQY15Lq1NVbCJmpB+C4dt6tSB9Ot
         RRysOitApuPnjZJ34xpGyy+o435nvNMzfp+BkGMn5X1VcirB8xhUGuyqJkXjqQDFZy5r
         iM1wrLa8J+xzcLgCrCZ1PcdXMRQyXF3hsqdPbGlBYWXo1GBubppmpz35IGE2S7ZR26I9
         hZcg==
X-Forwarded-Encrypted: i=1; AJvYcCWUE7piECbvH099XXehNECIFAHqEBvjIX61XFsdTB3l4c+7Jalq/z0Di61gSuWZdK5R4tWhchFXqnFLHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzCRT/ivvu1jfhTNVLOTAKplIJHQ0rOmy3KJ4b25frUXK+P9No
	G2NRyWOxBj9jtY14PKFtkO8JdsmRXLTTZCsz4yvd4Y2sMtgde2gPzLjvlIozi92iT5bKjkfutDd
	1/3VnzPQDG0gnfLWYJewq2ScqmogE3uM=
X-Gm-Gg: AZuq6aKSyxXWGKqPngRnxed1FFsIzdTFpX0CIUzOkv2PFIZZKUOJ+zoT0ioOGynJEJB
	wPbj9X+cMu1GRn4x7jPznZgT8E0l3BivZArgt6Vp8xUOphN//YwJxlVYLKhon7WZv8gjpxz03/v
	cifL78LmLTU0PWrUSDIoLxdhcSaZCX/T0ki3jBN3YvhtvWpxTrZkORdh5clz0oB8wqy+rd7lcuD
	KCFVeD+zOyUoFg0sU1oCe8eUeBdtaWl9fsOl0YnUY0I9DhCseC3sLjEeHhOwR8X2wr4PQSczEf6
	CIgzYuCiIjSk/aeCCc+P6ntSdMa65sSkdKeyEg+9o75HYGkYtS/Vtv1mOsHoUle99X4IGCO4jdI
	d6TEQFK+KAA==
X-Received: by 2002:a05:6122:4b89:b0:559:6092:936c with SMTP id
 71dfb90a1353d-5663eb36d87mr1287782e0c.12.1769188856177; Fri, 23 Jan 2026
 09:20:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN59QMUSiJjGrpVzW2czHqdbVUf4yshxUFdKQPws2Fe8veSsdQ@mail.gmail.com>
 <871pjge180.wl-tiwai@suse.de>
In-Reply-To: <871pjge180.wl-tiwai@suse.de>
From: Damien <damien.dagorn29@gmail.com>
Date: Fri, 23 Jan 2026 18:20:44 +0100
X-Gm-Features: AZwV_Qi0uxIi8ceXbBWGQYH7zFLltUipZXEzvPfkFbn9DR1vkaEAFN-U4Pp9l08
Message-ID: <CAN59QMUhd4kHrkRoJA6VzEr2VKezN2yjHnANaQoZn2-Bnwe3bQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] ALSA: hda/realtek: fix LG Gram Style 14 speakers
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: multipart/mixed; boundary="000000000000503f91064911619d"

--000000000000503f91064911619d
Content-Type: multipart/alternative; boundary="000000000000503f90064911619b"

--000000000000503f90064911619b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 Hi Takashi,

 Thanks for the feedback. I=E2=80=99ve reworked the patch as requested:
 - single patch (no cover letter), with the full description in the commit
message
 - proper Signed-off-by with my full name
 - added comments for the quirk
 - use AC_VERB_SET_PROC_COEF for 0x400 and 0xb011 instead of 0x4b0

I hope this rework matches your request

 Please find the updated patch attached.

  Thanks,
  Damien

Le ven. 23 janv. 2026 =C3=A0 17:35, Takashi Iwai <tiwai@suse.de> a =C3=A9cr=
it :

> On Wed, 21 Jan 2026 14:12:09 +0100,
> Damien wrote:
> >
> >
> >   Hi,
> >
> >   The LG Gram Style 14 (14Z90RS-G.AD77F, SSID 1854:0490) with Realtek
> ALC298
> >   shows normal routing and volume changes, but internal speakers remain
> silent
> >   unless a userland HDA-verb workaround is applied.
> >
> >   This patch adds a dedicated quirk for the LG Gram Style 14 that
> programs
> >   the codec coefficient sequence used by the known workaround and enabl=
es
> >   the speaker amps only during playback.
> >
> >   Tested-by: Dams <damien.dagorn29@gmail.com>
> >   Tested: speaker-test -D hw:0 -c 2 -t wav -l 1 (front left/right OK)
> >
> >   Please find the patch series attached.
> >
> >   Thanks,
> >   Damien
>
> Thanks for the patch.  Unfortunately, the patch looks created somehow
> in a not ideal way.  First of all, the useful information like:
> >
> > From 113b13ace8671a18c8f3820b007d5757df43dd36 Mon Sep 17 00:00:00 2001
> > From: Dams <damien.dagorn29@gmail.com>
> > Date: Wed, 21 Jan 2026 14:06:38 +0100
> > Subject: [PATCH 0/1] ALSA: hda/realtek: fix LG Gram Style 14 speakers
> >
> > The LG Gram Style 14 (14Z90RS-G.AD77F, SSID 1854:0490) with Realtek
> ALC298
> > shows normal routing and volume changes, but internal speakers stay
> silent
> > unless a userland HDA-verb workaround is applied.
> >
> > This patch adds a dedicated quirk for the LG Gram Style 14 that program=
s
> > the codec coefficient sequence used by the known workaround and enables
> > the speaker amps only during playback.
> >
> > Tested-by: Dams <damien.dagorn29@gmail.com>
> > Tested: speaker-test -D hw:0 -c 2 -t wav -l 1 (front left/right OK)
>
> ... those should be put rather in the description of the patch itself.
> You've put it in 0/1, that is a cover letter, which won't be included
> in the git commit.
> (And in general, there is no need for splitting to a cover letter if
> it's only a single patch; describe it right in the patch itself or
> not.)
>
> Secondly, a valid Signed-off-by tag is mandatory for upstreaming.
> It's a legal requirement.  And for the Signed-off-by tag (also the
> From line as the author), you should provide a full real name.
>
> Now about the code changes:
>
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -1814,6 +1814,161 @@ static void alc298_samsung_v2_init_amps(struct
> hda_codec *codec,
> >       spec->gen.pcm_playback_hook =3D alc298_samsung_v2_playback_hook;
> >  }
> >
>
> Maybe it'd be better to have some comments about the quirk.
> It's no trivial code, hence it's worth for explanation.
>
> > +struct alc298_lg_gram_style_seq {
> > +     unsigned short verb;
> > +     unsigned short idx;
> > +     unsigned short val;
> > +};
> > +
> > +static void alc298_lg_gram_style_coef_write(struct hda_codec *codec,
> > +                                         unsigned int verb,
> > +                                         unsigned int idx,
> > +                                         unsigned int val)
> > +{
> > +     snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_COEF_INDEX, 0x23)=
;
> > +     snd_hda_codec_write(codec, 0x20, 0, verb, idx);
> > +     snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, 0x00);
> > +     snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, val);
> > +     snd_hda_codec_write(codec, 0x20, 0, 0x4b0, 0x11);
>
> Use AC_VERB_SET_PROC_COEF for 0x400.  It's equivalent with
>         snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, 0xb011=
);
>
> Could you try to resubmit with the corrections above?
>
>
> thanks,
>
> Takashi
>

--000000000000503f90064911619b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0Hi Takashi,<br><br>=C2=A0Thanks for the feedback. I=
=E2=80=99ve reworked the patch as requested:<br>=C2=A0- single patch (no co=
ver letter), with the full description in the commit message<br>=C2=A0- pro=
per Signed-off-by with my full name<br>=C2=A0- added comments for the quirk=
<br>=C2=A0- use AC_VERB_SET_PROC_COEF for 0x400 and 0xb011 instead of 0x4b0=
<br><br>I hope this rework matches your request<br><br>=C2=A0Please find th=
e updated patch attached.<br><br>=C2=A0 Thanks,<br>=C2=A0 Damien</div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">Le=C2=A0ven. 23 janv. 2026 =C3=A0=C2=A017:35, Takashi Iwai &lt;<=
a href=3D"mailto:tiwai@suse.de">tiwai@suse.de</a>&gt; a =C3=A9crit=C2=A0:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 21 Jan 20=
26 14:12:09 +0100,<br>
Damien wrote:<br>
&gt; <br>
&gt; <br>
&gt; =C2=A0 Hi,<br>
&gt; <br>
&gt; =C2=A0 The LG Gram Style 14 (14Z90RS-G.AD77F, SSID 1854:0490) with Rea=
ltek ALC298<br>
&gt; =C2=A0 shows normal routing and volume changes, but internal speakers =
remain silent<br>
&gt; =C2=A0 unless a userland HDA-verb workaround is applied.<br>
&gt; <br>
&gt; =C2=A0 This patch adds a dedicated quirk for the LG Gram Style 14 that=
 programs<br>
&gt; =C2=A0 the codec coefficient sequence used by the known workaround and=
 enables<br>
&gt; =C2=A0 the speaker amps only during playback.<br>
&gt; <br>
&gt; =C2=A0 Tested-by: Dams &lt;<a href=3D"mailto:damien.dagorn29@gmail.com=
" target=3D"_blank">damien.dagorn29@gmail.com</a>&gt;<br>
&gt; =C2=A0 Tested: speaker-test -D hw:0 -c 2 -t wav -l 1 (front left/right=
 OK)<br>
&gt; <br>
&gt; =C2=A0 Please find the patch series attached.<br>
&gt; <br>
&gt; =C2=A0 Thanks,<br>
&gt; =C2=A0 Damien<br>
<br>
Thanks for the patch.=C2=A0 Unfortunately, the patch looks created somehow<=
br>
in a not ideal way.=C2=A0 First of all, the useful information like:<br>
&gt; <br>
&gt; From 113b13ace8671a18c8f3820b007d5757df43dd36 Mon Sep 17 00:00:00 2001=
<br>
&gt; From: Dams &lt;<a href=3D"mailto:damien.dagorn29@gmail.com" target=3D"=
_blank">damien.dagorn29@gmail.com</a>&gt;<br>
&gt; Date: Wed, 21 Jan 2026 14:06:38 +0100<br>
&gt; Subject: [PATCH 0/1] ALSA: hda/realtek: fix LG Gram Style 14 speakers<=
br>
&gt; <br>
&gt; The LG Gram Style 14 (14Z90RS-G.AD77F, SSID 1854:0490) with Realtek AL=
C298<br>
&gt; shows normal routing and volume changes, but internal speakers stay si=
lent<br>
&gt; unless a userland HDA-verb workaround is applied.<br>
&gt; <br>
&gt; This patch adds a dedicated quirk for the LG Gram Style 14 that progra=
ms<br>
&gt; the codec coefficient sequence used by the known workaround and enable=
s<br>
&gt; the speaker amps only during playback.<br>
&gt; <br>
&gt; Tested-by: Dams &lt;<a href=3D"mailto:damien.dagorn29@gmail.com" targe=
t=3D"_blank">damien.dagorn29@gmail.com</a>&gt;<br>
&gt; Tested: speaker-test -D hw:0 -c 2 -t wav -l 1 (front left/right OK)<br=
>
<br>
... those should be put rather in the description of the patch itself.<br>
You&#39;ve put it in 0/1, that is a cover letter, which won&#39;t be includ=
ed<br>
in the git commit.<br>
(And in general, there is no need for splitting to a cover letter if<br>
it&#39;s only a single patch; describe it right in the patch itself or<br>
not.)<br>
<br>
Secondly, a valid Signed-off-by tag is mandatory for upstreaming.<br>
It&#39;s a legal requirement.=C2=A0 And for the Signed-off-by tag (also the=
<br>
From line as the author), you should provide a full real name.<br>
<br>
Now about the code changes:<br>
<br>
&gt; --- a/sound/hda/codecs/realtek/alc269.c<br>
&gt; +++ b/sound/hda/codecs/realtek/alc269.c<br>
&gt; @@ -1814,6 +1814,161 @@ static void alc298_samsung_v2_init_amps(struct=
 hda_codec *codec,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spec-&gt;gen.pcm_playback_hook =3D alc298_sa=
msung_v2_playback_hook;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
<br>
Maybe it&#39;d be better to have some comments about the quirk.<br>
It&#39;s no trivial code, hence it&#39;s worth for explanation.<br>
<br>
&gt; +struct alc298_lg_gram_style_seq {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short verb;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short idx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned short val;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void alc298_lg_gram_style_coef_write(struct hda_codec *codec,<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned int verb,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned int idx,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned int val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_C=
OEF_INDEX, 0x23);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snd_hda_codec_write(codec, 0x20, 0, verb, idx);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_P=
ROC_COEF, 0x00);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_P=
ROC_COEF, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0snd_hda_codec_write(codec, 0x20, 0, 0x4b0, 0x11);=
<br>
<br>
Use AC_VERB_SET_PROC_COEF for 0x400.=C2=A0 It&#39;s equivalent with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET=
_PROC_COEF, 0xb011);<br>
<br>
Could you try to resubmit with the corrections above?<br>
<br>
<br>
thanks,<br>
<br>
Takashi<br>
</blockquote></div>

--000000000000503f90064911619b--
--000000000000503f91064911619d
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-ALSA-hda-realtek-fix-LG-Gram-Style-14-speakers.patch"
Content-Disposition: attachment; 
	filename="0001-ALSA-hda-realtek-fix-LG-Gram-Style-14-speakers.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mkr5ajzv0>
X-Attachment-Id: f_mkr5ajzv0

RnJvbSA4MmE3ODU1ZTY2MTk0ZTE4ODJjMTg0MDkzNDViZjQxMzI0YmE2ODc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYW1pZW4gRGFnb3JuIDxkYW1pZW4uZGFnb3JuMjlAZ21haWwu
Y29tPgpEYXRlOiBGcmksIDIzIEphbiAyMDI2IDE4OjE0OjUyICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gQUxTQTogaGRhL3JlYWx0ZWs6IGZpeCBMRyBHcmFtIFN0eWxlIDE0IHNwZWFrZXJzCgpUaGUg
TEcgR3JhbSBTdHlsZSAxNCAoMTRaOTBSUy1HLkFENzdGLCBTU0lEIDE4NTQ6MDQ5MCkgd2l0aCBS
ZWFsdGVrIEFMQzI5OApzaG93cyBub3JtYWwgcm91dGluZyBhbmQgdm9sdW1lIGNoYW5nZXMsIGJ1
dCBpbnRlcm5hbCBzcGVha2VycyBzdGF5IHNpbGVudAp1bmxlc3MgYSB1c2VybGFuZCBIREEtdmVy
YiB3b3JrYXJvdW5kIGlzIGFwcGxpZWQuCgpBZGQgYSBkZWRpY2F0ZWQgcXVpcmsgZm9yIHRoZSBM
RyBHcmFtIFN0eWxlIDE0IHRoYXQgcHJvZ3JhbXMgdGhlIGNvZGVjCmNvZWZmaWNpZW50IHNlcXVl
bmNlIHVzZWQgYnkgdGhlIGtub3duIHdvcmthcm91bmQgYW5kIGVuYWJsZXMgdGhlIHNwZWFrZXIK
YW1wcyBvbmx5IGR1cmluZyBwbGF5YmFjay4KClRlc3RlZC1ieTogRGFtaWVuIERhZ29ybiA8ZGFt
aWVuLmRhZ29ybjI5QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFtaWVuIERhZ29ybiA8ZGFt
aWVuLmRhZ29ybjI5QGdtYWlsLmNvbT4KLS0tCiBzb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxj
MjY5LmMgfCAxNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTcwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zb3VuZC9oZGEvY29kZWNzL3JlYWx0
ZWsvYWxjMjY5LmMgYi9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMKaW5kZXggZjI2
NzQzNy4uYzJiYmE4NSAxMDA2NDQKLS0tIGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2
OS5jCisrKyBiL3NvdW5kL2hkYS9jb2RlY3MvcmVhbHRlay9hbGMyNjkuYwpAQCAtMTgxNCw2ICsx
ODE0LDE2MyBAQCBzdGF0aWMgdm9pZCBhbGMyOThfc2Ftc3VuZ192Ml9pbml0X2FtcHMoc3RydWN0
IGhkYV9jb2RlYyAqY29kZWMsCiAJc3BlYy0+Z2VuLnBjbV9wbGF5YmFja19ob29rID0gYWxjMjk4
X3NhbXN1bmdfdjJfcGxheWJhY2tfaG9vazsKIH0KIAorLyogTEcgR3JhbSBTdHlsZSAxNDogcHJv
Z3JhbSB2ZW5kb3IgY29lZiBzZXF1ZW5jZSB1c2VkIGJ5IEhEQS12ZXJiIHdvcmthcm91bmQgKi8K
K3N0cnVjdCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9zZXEgeworCXVuc2lnbmVkIHNob3J0IHZlcmI7
CisJdW5zaWduZWQgc2hvcnQgaWR4OworCXVuc2lnbmVkIHNob3J0IHZhbDsKK307CisKK3N0YXRp
YyB2b2lkIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2NvZWZfd3JpdGUoc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMsCisJCQkJCSAgICB1bnNpZ25lZCBpbnQgdmVyYiwKKwkJCQkJICAgIHVuc2lnbmVkIGlu
dCBpZHgsCisJCQkJCSAgICB1bnNpZ25lZCBpbnQgdmFsKQoreworCXNuZF9oZGFfY29kZWNfd3Jp
dGUoY29kZWMsIDB4MjAsIDAsIEFDX1ZFUkJfU0VUX0NPRUZfSU5ERVgsIDB4MjMpOworCXNuZF9o
ZGFfY29kZWNfd3JpdGUoY29kZWMsIDB4MjAsIDAsIHZlcmIsIGlkeCk7CisJc25kX2hkYV9jb2Rl
Y193cml0ZShjb2RlYywgMHgyMCwgMCwgQUNfVkVSQl9TRVRfUFJPQ19DT0VGLCAweDAwKTsKKwlz
bmRfaGRhX2NvZGVjX3dyaXRlKGNvZGVjLCAweDIwLCAwLCBBQ19WRVJCX1NFVF9QUk9DX0NPRUYs
IHZhbCk7CisJc25kX2hkYV9jb2RlY193cml0ZShjb2RlYywgMHgyMCwgMCwgQUNfVkVSQl9TRVRf
UFJPQ19DT0VGLCAweGIwMTEpOworfQorCitzdGF0aWMgdm9pZCBhbGMyOThfbGdfZ3JhbV9zdHls
ZV9ydW5fc2VxKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCQkgY29uc3Qgc3RydWN0IGFs
YzI5OF9sZ19ncmFtX3N0eWxlX3NlcSAqc2VxLAorCQkJCQkgaW50IHNlcV9zaXplKQoreworCWlu
dCBpOworCisJZm9yIChpID0gMDsgaSA8IHNlcV9zaXplOyBpKyspCisJCWFsYzI5OF9sZ19ncmFt
X3N0eWxlX2NvZWZfd3JpdGUoY29kZWMsIHNlcVtpXS52ZXJiLAorCQkJCQkJc2VxW2ldLmlkeCwg
c2VxW2ldLnZhbCk7Cit9CisKKy8qIENvZWYgc2VxdWVuY2VzIGRlcml2ZWQgZnJvbSB0aGUgSERB
LXZlcmIgd29ya2Fyb3VuZCBmb3IgdGhpcyBtb2RlbC4gKi8KK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
YWxjMjk4X2xnX2dyYW1fc3R5bGVfc2VxIGFsYzI5OF9sZ19ncmFtX3N0eWxlX3ByZWluaXRfc2Vx
W10gPSB7CisJeyAweDQyMCwgMHgwMCwgMHgwMSB9LAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVj
dCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9zZXEgYWxjMjk4X2xnX2dyYW1fc3R5bGVfZGlzYWJsZV9z
ZXFbXSA9IHsKKwl7IDB4NDIzLCAweGZmLCAweDAwIH0sCisJeyAweDQyMCwgMHgzYSwgMHg4MCB9
LAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9zZXEgYWxj
Mjk4X2xnX2dyYW1fc3R5bGVfZW5hYmxlX3NlcVtdID0geworCXsgMHg0MjAsIDB4M2EsIDB4ODEg
fSwKKwl7IDB4NDIzLCAweGZmLCAweDAxIH0sCit9OworCitzdGF0aWMgY29uc3Qgc3RydWN0IGFs
YzI5OF9sZ19ncmFtX3N0eWxlX3NlcSBhbGMyOThfbGdfZ3JhbV9zdHlsZV9pbml0X3NlcV8zOFtd
ID0geworCXsgMHg0MjMsIDB4ZTEsIDB4MDAgfSwgeyAweDQyMCwgMHgxMiwgMHg2ZiB9LCB7IDB4
NDIwLCAweDE0LCAweDAwIH0sCisJeyAweDQyMCwgMHgxYiwgMHgwMSB9LCB7IDB4NDIwLCAweDFk
LCAweDAxIH0sIHsgMHg0MjAsIDB4MWYsIDB4ZmUgfSwKKwl7IDB4NDIwLCAweDIxLCAweDAwIH0s
IHsgMHg0MjAsIDB4MjIsIDB4MTAgfSwgeyAweDQyMCwgMHgzZCwgMHgwNSB9LAorCXsgMHg0MjAs
IDB4M2YsIDB4MDMgfSwgeyAweDQyMCwgMHg1MCwgMHgyYyB9LCB7IDB4NDIwLCAweDc2LCAweDBl
IH0sCisJeyAweDQyMCwgMHg3YywgMHg0YSB9LCB7IDB4NDIwLCAweDgxLCAweDAzIH0sIHsgMHg0
MjMsIDB4OTksIDB4MDMgfSwKKwl7IDB4NDIzLCAweGE0LCAweGI1IH0sIHsgMHg0MjMsIDB4YTUs
IDB4MDEgfSwgeyAweDQyMywgMHhiYSwgMHg5NCB9LAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVj
dCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9zZXEgYWxjMjk4X2xnX2dyYW1fc3R5bGVfaW5pdF9zZXFf
MzlbXSA9IHsKKwl7IDB4NDIzLCAweGUxLCAweDAwIH0sIHsgMHg0MjAsIDB4MTIsIDB4NmYgfSwg
eyAweDQyMCwgMHgxNCwgMHgwMCB9LAorCXsgMHg0MjAsIDB4MWIsIDB4MDIgfSwgeyAweDQyMCwg
MHgxZCwgMHgwMiB9LCB7IDB4NDIwLCAweDFmLCAweGZkIH0sCisJeyAweDQyMCwgMHgyMSwgMHgw
MSB9LCB7IDB4NDIwLCAweDIyLCAweDEwIH0sIHsgMHg0MjAsIDB4M2QsIDB4MDUgfSwKKwl7IDB4
NDIwLCAweDNmLCAweDAzIH0sIHsgMHg0MjAsIDB4NTAsIDB4MmMgfSwgeyAweDQyMCwgMHg3Niwg
MHgwZSB9LAorCXsgMHg0MjAsIDB4N2MsIDB4NGEgfSwgeyAweDQyMCwgMHg4MSwgMHgwMyB9LCB7
IDB4NDIzLCAweDk5LCAweDAzIH0sCisJeyAweDQyMywgMHhhNCwgMHhiNSB9LCB7IDB4NDIzLCAw
eGE1LCAweDAxIH0sIHsgMHg0MjMsIDB4YmEsIDB4OTQgfSwKK307CisKK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgYWxjMjk4X2xnX2dyYW1fc3R5bGVfc2VxIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2luaXRf
c2VxXzNjW10gPSB7CisJeyAweDQyMywgMHhlMSwgMHgwMCB9LCB7IDB4NDIwLCAweDEyLCAweDZm
IH0sIHsgMHg0MjAsIDB4MTQsIDB4MDAgfSwKKwl7IDB4NDIwLCAweDFiLCAweDAxIH0sIHsgMHg0
MjAsIDB4MWQsIDB4MDEgfSwgeyAweDQyMCwgMHgxZiwgMHhmZSB9LAorCXsgMHg0MjAsIDB4MjEs
IDB4MDAgfSwgeyAweDQyMCwgMHgyMiwgMHgxMCB9LCB7IDB4NDIwLCAweDNkLCAweDA1IH0sCisJ
eyAweDQyMCwgMHgzZiwgMHgwMyB9LCB7IDB4NDIwLCAweDUwLCAweDJjIH0sIHsgMHg0MjAsIDB4
NzYsIDB4MGUgfSwKKwl7IDB4NDIwLCAweDdjLCAweDRhIH0sIHsgMHg0MjAsIDB4ODEsIDB4MDMg
fSwgeyAweDQyMywgMHhiYSwgMHg4ZCB9LAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBhbGMy
OThfbGdfZ3JhbV9zdHlsZV9zZXEgYWxjMjk4X2xnX2dyYW1fc3R5bGVfaW5pdF9zZXFfM2RbXSA9
IHsKKwl7IDB4NDIzLCAweGUxLCAweDAwIH0sIHsgMHg0MjAsIDB4MTIsIDB4NmYgfSwgeyAweDQy
MCwgMHgxNCwgMHgwMCB9LAorCXsgMHg0MjAsIDB4MWIsIDB4MDIgfSwgeyAweDQyMCwgMHgxZCwg
MHgwMiB9LCB7IDB4NDIwLCAweDFmLCAweGZkIH0sCisJeyAweDQyMCwgMHgyMSwgMHgwMSB9LCB7
IDB4NDIwLCAweDIyLCAweDEwIH0sIHsgMHg0MjAsIDB4M2QsIDB4MDUgfSwKKwl7IDB4NDIwLCAw
eDNmLCAweDAzIH0sIHsgMHg0MjAsIDB4NTAsIDB4MmMgfSwgeyAweDQyMCwgMHg3NiwgMHgwZSB9
LAorCXsgMHg0MjAsIDB4N2MsIDB4NGEgfSwgeyAweDQyMCwgMHg4MSwgMHgwMyB9LCB7IDB4NDIz
LCAweGJhLCAweDhkIH0sCit9OworCitzdHJ1Y3QgYWxjMjk4X2xnX2dyYW1fc3R5bGVfYW1wX2Rl
c2MgeworCXVuc2lnbmVkIGNoYXIgbmlkOworCWNvbnN0IHN0cnVjdCBhbGMyOThfbGdfZ3JhbV9z
dHlsZV9zZXEgKmluaXRfc2VxOworCWludCBpbml0X3NlcV9zaXplOworfTsKKworc3RhdGljIGNv
bnN0IHN0cnVjdCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9hbXBfZGVzYyBhbGMyOThfbGdfZ3JhbV9z
dHlsZV9hbXBzW10gPSB7CisJeyAweDM4LCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9pbml0X3NlcV8z
OCwKKwkJQVJSQVlfU0laRShhbGMyOThfbGdfZ3JhbV9zdHlsZV9pbml0X3NlcV8zOCkgfSwKKwl7
IDB4MzksIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2luaXRfc2VxXzM5LAorCQlBUlJBWV9TSVpFKGFs
YzI5OF9sZ19ncmFtX3N0eWxlX2luaXRfc2VxXzM5KSB9LAorCXsgMHgzYywgYWxjMjk4X2xnX2dy
YW1fc3R5bGVfaW5pdF9zZXFfM2MsCisJCUFSUkFZX1NJWkUoYWxjMjk4X2xnX2dyYW1fc3R5bGVf
aW5pdF9zZXFfM2MpIH0sCisJeyAweDNkLCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9pbml0X3NlcV8z
ZCwKKwkJQVJSQVlfU0laRShhbGMyOThfbGdfZ3JhbV9zdHlsZV9pbml0X3NlcV8zZCkgfSwKK307
CisKK3N0YXRpYyB2b2lkIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2VuYWJsZV9hbXBzKHN0cnVjdCBo
ZGFfY29kZWMgKmNvZGVjKQoreworCXN0cnVjdCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVj
OworCWludCBpOworCisJZm9yIChpID0gMDsgaSA8IHNwZWMtPm51bV9zcGVha2VyX2FtcHM7IGkr
KykgeworCQlhbGNfd3JpdGVfY29lZl9pZHgoY29kZWMsIDB4MjIsIGFsYzI5OF9sZ19ncmFtX3N0
eWxlX2FtcHNbaV0ubmlkKTsKKwkJYWxjMjk4X2xnX2dyYW1fc3R5bGVfcnVuX3NlcShjb2RlYywK
KwkJCQkJICAgICBhbGMyOThfbGdfZ3JhbV9zdHlsZV9lbmFibGVfc2VxLAorCQkJCQkgICAgIEFS
UkFZX1NJWkUoYWxjMjk4X2xnX2dyYW1fc3R5bGVfZW5hYmxlX3NlcSkpOworCX0KK30KKworc3Rh
dGljIHZvaWQgYWxjMjk4X2xnX2dyYW1fc3R5bGVfZGlzYWJsZV9hbXBzKHN0cnVjdCBoZGFfY29k
ZWMgKmNvZGVjKQoreworCXN0cnVjdCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5zcGVjOworCWlu
dCBpOworCisJZm9yIChpID0gMDsgaSA8IHNwZWMtPm51bV9zcGVha2VyX2FtcHM7IGkrKykgewor
CQlhbGNfd3JpdGVfY29lZl9pZHgoY29kZWMsIDB4MjIsIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2Ft
cHNbaV0ubmlkKTsKKwkJYWxjMjk4X2xnX2dyYW1fc3R5bGVfcnVuX3NlcShjb2RlYywKKwkJCQkJ
ICAgICBhbGMyOThfbGdfZ3JhbV9zdHlsZV9kaXNhYmxlX3NlcSwKKwkJCQkJICAgICBBUlJBWV9T
SVpFKGFsYzI5OF9sZ19ncmFtX3N0eWxlX2Rpc2FibGVfc2VxKSk7CisJfQorfQorCitzdGF0aWMg
dm9pZCBhbGMyOThfbGdfZ3JhbV9zdHlsZV9wbGF5YmFja19ob29rKHN0cnVjdCBoZGFfcGNtX3N0
cmVhbSAqaGluZm8sCisJCQkJCSAgICAgICBzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKKwkJCQkJ
ICAgICAgIHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAorCQkJCQkgICAgICAg
aW50IGFjdGlvbikKK3sKKwlpZiAoYWN0aW9uID09IEhEQV9HRU5fUENNX0FDVF9PUEVOKQorCQlh
bGMyOThfbGdfZ3JhbV9zdHlsZV9lbmFibGVfYW1wcyhjb2RlYyk7CisJaWYgKGFjdGlvbiA9PSBI
REFfR0VOX1BDTV9BQ1RfQ0xPU0UpCisJCWFsYzI5OF9sZ19ncmFtX3N0eWxlX2Rpc2FibGVfYW1w
cyhjb2RlYyk7Cit9CisKK3N0YXRpYyB2b2lkIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2luaXRfYW1w
cyhzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBj
b2RlYy0+c3BlYzsKKwlpbnQgaTsKKworCXNwZWMtPm51bV9zcGVha2VyX2FtcHMgPSBBUlJBWV9T
SVpFKGFsYzI5OF9sZ19ncmFtX3N0eWxlX2FtcHMpOworCisJZm9yIChpID0gMDsgaSA8IHNwZWMt
Pm51bV9zcGVha2VyX2FtcHM7IGkrKykgeworCQlhbGNfd3JpdGVfY29lZl9pZHgoY29kZWMsIDB4
MjIsIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2FtcHNbaV0ubmlkKTsKKwkJYWxjMjk4X2xnX2dyYW1f
c3R5bGVfcnVuX3NlcShjb2RlYywKKwkJCQkJICAgICBhbGMyOThfbGdfZ3JhbV9zdHlsZV9wcmVp
bml0X3NlcSwKKwkJCQkJICAgICBBUlJBWV9TSVpFKGFsYzI5OF9sZ19ncmFtX3N0eWxlX3ByZWlu
aXRfc2VxKSk7CisJCWFsYzI5OF9sZ19ncmFtX3N0eWxlX3J1bl9zZXEoY29kZWMsCisJCQkJCSAg
ICAgYWxjMjk4X2xnX2dyYW1fc3R5bGVfZGlzYWJsZV9zZXEsCisJCQkJCSAgICAgQVJSQVlfU0la
RShhbGMyOThfbGdfZ3JhbV9zdHlsZV9kaXNhYmxlX3NlcSkpOworCQlhbGMyOThfbGdfZ3JhbV9z
dHlsZV9ydW5fc2VxKGNvZGVjLAorCQkJCQkgICAgIGFsYzI5OF9sZ19ncmFtX3N0eWxlX2FtcHNb
aV0uaW5pdF9zZXEsCisJCQkJCSAgICAgYWxjMjk4X2xnX2dyYW1fc3R5bGVfYW1wc1tpXS5pbml0
X3NlcV9zaXplKTsKKwkJYWxjX3dyaXRlX2NvZWZfaWR4KGNvZGVjLCAweDg5LCAweDApOworCX0K
KworCXNwZWMtPmdlbi5wY21fcGxheWJhY2tfaG9vayA9IGFsYzI5OF9sZ19ncmFtX3N0eWxlX3Bs
YXliYWNrX2hvb2s7Cit9CisKIHN0YXRpYyB2b2lkIGFsYzI5OF9maXh1cF9zYW1zdW5nX2FtcF92
Ml8yX2FtcHMoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJCQkJY29uc3Qgc3RydWN0IGhkYV9m
aXh1cCAqZml4LCBpbnQgYWN0aW9uKQogewpAQCAtMTgyOCw2ICsxOTg1LDEzIEBAIHN0YXRpYyB2
b2lkIGFsYzI5OF9maXh1cF9zYW1zdW5nX2FtcF92Ml80X2FtcHMoc3RydWN0IGhkYV9jb2RlYyAq
Y29kZWMsCiAJCWFsYzI5OF9zYW1zdW5nX3YyX2luaXRfYW1wcyhjb2RlYywgNCk7CiB9CiAKK3N0
YXRpYyB2b2lkIGFsYzI5OF9maXh1cF9sZ19ncmFtX3N0eWxlXzE0KHN0cnVjdCBoZGFfY29kZWMg
KmNvZGVjLAorCQkJCQkgIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50IGFjdGlvbikK
K3sKKwlpZiAoYWN0aW9uID09IEhEQV9GSVhVUF9BQ1RfUFJPQkUpCisJCWFsYzI5OF9sZ19ncmFt
X3N0eWxlX2luaXRfYW1wcyhjb2RlYyk7Cit9CisKIHN0YXRpYyB2b2lkIGdwaW8yX21pY19ob3Rr
ZXlfZXZlbnQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCiAJCQkJICAgc3RydWN0IGhkYV9qYWNr
X2NhbGxiYWNrICpldmVudCkKIHsKQEAgLTM2MzAsNiArMzc5NCw3IEBAIGVudW0gewogCUFMQzI5
OF9GSVhVUF9TQU1TVU5HX0FNUCwKIAlBTEMyOThfRklYVVBfU0FNU1VOR19BTVBfVjJfMl9BTVBT
LAogCUFMQzI5OF9GSVhVUF9TQU1TVU5HX0FNUF9WMl80X0FNUFMsCisJQUxDMjk4X0ZJWFVQX0xH
X0dSQU1fU1RZTEVfMTQsCiAJQUxDMjk4X0ZJWFVQX1NBTVNVTkdfSEVBRFBIT05FX1ZFUllfUVVJ
RVQsCiAJQUxDMjU2X0ZJWFVQX1NBTVNVTkdfSEVBRFBIT05FX1ZFUllfUVVJRVQsCiAJQUxDMjk1
X0ZJWFVQX0FTVVNfTUlDX05PX1BSRVNFTkNFLApAQCAtNTI5NCw2ICs1NDU5LDEwIEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLnR5cGUgPSBI
REFfRklYVVBfRlVOQywKIAkJLnYuZnVuYyA9IGFsYzI5OF9maXh1cF9zYW1zdW5nX2FtcF92Ml80
X2FtcHMKIAl9LAorCVtBTEMyOThfRklYVVBfTEdfR1JBTV9TVFlMRV8xNF0gPSB7CisJCS50eXBl
ID0gSERBX0ZJWFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGMyOThfZml4dXBfbGdfZ3JhbV9zdHls
ZV8xNAorCX0sCiAJW0FMQzI5OF9GSVhVUF9TQU1TVU5HX0hFQURQSE9ORV9WRVJZX1FVSUVUXSA9
IHsKIAkJLnR5cGUgPSBIREFfRklYVVBfVkVSQlMsCiAJCS52LnZlcmJzID0gKGNvbnN0IHN0cnVj
dCBoZGFfdmVyYltdKSB7CkBAIC03MTM1LDYgKzczMDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGhkYV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7CiAJU05EX1BDSV9RVUlSSygweDE4NTQs
IDB4MDQ4OCwgIkxHIGdyYW0gMTYgKDE2WjkwUikiLCBBTEMyOThfRklYVVBfU0FNU1VOR19BTVBf
VjJfNF9BTVBTKSwKIAlTTkRfUENJX1FVSVJLKDB4MTg1NCwgMHgwNDg5LCAiTEcgZ3JhbSAxNiAo
MTZaOTBSLUEpIiwgQUxDMjk4X0ZJWFVQX1NBTVNVTkdfQU1QX1YyXzRfQU1QUyksCiAJU05EX1BD
SV9RVUlSSygweDE4NTQsIDB4MDQ4YSwgIkxHIGdyYW0gMTcgKDE3WkQ5MFIpIiwgQUxDMjk4X0ZJ
WFVQX1NBTVNVTkdfQU1QX1YyXzRfQU1QUyksCisJU05EX1BDSV9RVUlSSygweDE4NTQsIDB4MDQ5
MCwgIkxHIEdyYW0gU3R5bGUgMTQgKDE0WjkwUlMpIiwgQUxDMjk4X0ZJWFVQX0xHX0dSQU1fU1RZ
TEVfMTQpLAogCVNORF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyMDQsICJIdWF3ZWkgTUFDSC1XWDki
LCBBTEMyNTZfRklYVVBfSFVBV0VJX01BQ0hfV1g5X1BJTlMpLAogCVNORF9QQ0lfUVVJUksoMHgx
OWU1LCAweDMyMGYsICJIdWF3ZWkgV1JULVdYOSAiLCBBTEMyNTZfRklYVVBfQVNVU19NSUNfTk9f
UFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxOWU1LCAweDMyMTIsICJIdWF3ZWkgS0xWLVdY
OSAiLCBBTEMyNTZfRklYVVBfQUNFUl9IRUFEU0VUX01JQyksCi0tIAoyLjUxLjAKCg==
--000000000000503f91064911619d--
