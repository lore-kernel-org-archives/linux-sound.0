Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749770;
	b=VmMiN5xSYJDCRoSH+GCKRiScFvsDcZb8+yho+C04Uqz3jBU9ptyyzpldMXP7YP0jnjzT
	 QWkrKPlvwQzmTa/7pFySzk5P37o7pDE49Bb3UgL4EbFfE5fJQCRZtjKEhaqGJuupQhEMy
	 bGGwsSpyQ48Z8tKfx6dMzUgmTlEKz/eWsxZZyRROHREkXpaaisZE2eeHbVDUl1uQdc9wx
	 s4vfSk3I9Qx/h33rwjsDE0ltL0dqIIkpsrYRggIZMGsUmv3bz232zUiBeBHdeV8vg5kY8
	 EuWTVqmh2TRflxvFapRcwEUX3Xr8SZ6X59ru6mzJqvOQYbt0q5hXPWSKskPPh4+M2dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749770;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CRp2PjdQ7+ZT4NK2cLgdd6O+V5jMdcUEINgEmKNy1sk=;
	b=ydxLRJPahmrcOs1IiZ9AoEtPIbg7iwTR+Ui+xi9CqOGOH/DCGDa9RxdUVTRRpQiNnCGh
	 Rt16tBlggXrLjXWSz/0L21O7iuefDpiEuZXhNFEjIYWqQ07LWUmqPW+zEkw8rpc3ZwVcD
	 WU5WTSanHzQy6lKUOmTsB7Jqpbkx+0LevxqnpevX5W71zwQZEzMkfiL1MLu+6Mr0Q5S3k
	 B54s74sijtLhJ8/9OacTF+xLjqwgjjjv2e44nKdFZRFz6v8J8kDw1U+D+cRSxD9jhIpnY
	 zq3YU6P0RDwnBjiVpWC18MuBJB3u9VPVIuLwsJr9zH3Y7q2IVWaF1FpBhmBJuObn6dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E73606A31E
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E73606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b7a488a0a4so2861616a12.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 05:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749768; x=1795354568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRp2PjdQ7+ZT4NK2cLgdd6O+V5jMdcUEINgEmKNy1sk=;
        b=fITVEPTVif536/t5odNqGyzlQuhdz/NlEvWq4UR4mdc1TM1MnSNcvN3tORsliNuhIu
         p02g09rIUNs5DOhjWSMwD87dg/muM7JdBVrIq1bwEVgFVyV+Fuj1BrR7ozuGKrJ8ETLa
         ATxCpSJBkX+1liMbKz4fKLbhumdd8mABPUqNvg5RUz3VQEecms0egh0xoeEEBPaK3WAu
         Y/ht12sRtV3TIzhCxw6kcf0RFCDE8I+w7YCFFTy0VVSh7LCyOxye8R5Xbzagl87Jrinc
         TkjkHCtHMN7+X8XrrSFzqSSw247vS8qZBuJlasnIw8JLJNa0j3ViDw4EYeYiLuYdL4YI
         SXEw==
X-Forwarded-Encrypted: i=1; AL+hErG1RxJSYv8vGYh6XJF3otuANTV0wj8pPV8ENVueGrj1WyqZ4Bywqp5wZLyL3sb3AWXrOzP/0S1IeAS7uQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ENEE7iSw9QRgEyT5T04Q/qGZwyevYucRWOrja0kXMGwqUN2df
	o7/ID0CdO1Bxj2FHWecTO8WZ9VWu2OVmEs8m945OmTIFWwETdvh5rxD5CLdnCknRdwI=
X-Gm-Gg: AYBFou2gu60hlLVBseGPbGZy0tOAtgYwJO1+ktZ/i0DY5BLe0vm1DaTncM/Hf1jvaeq
	xyd+xrqCv6F0FPN/APZAtOu9b6vSJ9Ky0Gwxo/jjRs9kZk5/aLyaLBv4hBczErFzEn/3WJduBKx
	nkwLGRJb3bSlXAhxoAgelpIaK3mUk3Jw60k1ndqQbDW3NuEDKExPfHGUi/lZ2gcpf5uLbgdtJkv
	morps69LiM7ldFyWTHyjBlyJIShWj7GaOEJrdH26cc8mTGFWoXBZ76eLwG1ACuVp3Ehicg5Jue5
	32/1ZEDRK91YVxEupKCbv8gQFCkMxCUM68dfUJo7mJcESwshbnbXkgIem/J0aA/lfz0psqsgRtz
	TGI9Rl6VSbrZHsXo/9JH4kPWqNfZGBzmDemd6pAFiONhcUV0r0hiiwTEP7j6SmJ0VoGUUmRyU5W
	XVd2dHqfKPnByYgRKvWZrS0IJRpFyB+JvjaGrhZSZ3pOx3udFGjifv3ki715EPpaXQfBtk/flTX
	u/GfVC77vG2lQf4lZXVilGRbC4BXlrJxk9zeVY7l5R9+YfknZLWddW3Zm5P9q7vv6c7wpbKbgiV
	+F9ObnM/KFNl3v6/sX+HvVyLujWKrEaJQ1HRzGzGGGsjllDrfwjK3iod2iZ7CBia4Lmqb1TZvyK
	mrkYcgV4Lc0swRPRbKso=
X-Received: by 2002:a05:6402:5483:b0:6b7:a647:c28d with SMTP id 4fb4d7f45d1cf-6b7c0ccf88cmr6024515a12.32.1794749767661;
        Sun, 15 Nov 2026 05:36:07 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23dde49sm3432010a12.23.2026.11.15.05.36.07
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 05:36:07 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso17043935e9.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 05:36:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGvLMQQmc6ljA9ARIrFSzbbx3SkLUi+CS9dBTDCNvvUo1dpOI7JXZTrs4jc16l5tR4UuhL55/oHxuW2yQ==@vger.kernel.org
X-Received: by 2002:a05:600c:1d03:b0:4b1:4017:c4f4 with SMTP id
 5b1f17b1804b1-4bb55a58e1amr180391845e9.20.1794749766904; Sun, 15 Nov 2026
 05:36:06 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132215.4084031-2-iam@sung-woo.kim> <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
In-Reply-To: <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Sun, 15 Nov 2026 08:35:50 -0500
X-Gmail-Original-Message-ID: <CAJNyHpJuFY7SA=xzM+ZD-30F0YW73eCS0mP1Triu0sQotaO28Q@mail.gmail.com>
X-Gm-Features: AclHuK8LTHHMaEvQyZot_XanTuzT972cGFa3yw5rvKxpPOm1x_YoUHoyJ3G7R0k
Message-ID: <CAJNyHpJuFY7SA=xzM+ZD-30F0YW73eCS0mP1Triu0sQotaO28Q@mail.gmail.com>
Subject: Re: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in fixup
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One more, sorry for the multiple followups: CXT_PINCFG_LENOVO_NOTEBOOK
in conexant.c.


On Sun, Nov 15, 2026 at 8:26=E2=80=AFAM Sungwoo Kim <iam@sung-woo.kim> wrot=
e:
>
> One more, ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE in alc662.c also has the
> same issue (missing .chained=3Dtrue)
>
> On Sun, Nov 15, 2026 at 8:23=E2=80=AFAM Sungwoo Kim <iam@sung-woo.kim> wr=
ote:
> >
> > The fixup specifies a chain_id but does not set the chained flag,
> > which prevents the chained fixup from being executed.
> >
> > Should chained be set to true here?
> >
> > This was identified through static analysis and has not been tested
> > on actual hardware.
> >
> > Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index 96fa8c2782bb..1be2e609c28d 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x1e, 0x411111f0 },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_CZC_TMI] =3D {
> > @@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x20, 0x8000ffff },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_CZC_L101] =3D {
> > @@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x1e, 0x411111f0 },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_LEMOTE_A1802] =3D {
> > @@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x21, 0x03214020 },
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC269_FIXUP_LEMOTE_A190X] =3D {
> > @@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
> >                         { 0x1b, 0x0201401f }, /* front lineout */
> >                         { }
> >                 },
> > +               .chained =3D true,
> >                 .chain_id =3D ALC269_FIXUP_DMIC,
> >         },
> >         [ALC256_FIXUP_INTEL_NUC8_RUGGED] =3D {
> > --
> > 2.47.3
> >
