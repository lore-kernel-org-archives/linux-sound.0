Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749211;
	b=iWW1JKZhQ9clcr2Lk0MKTsNPBovmNrUAUxJztA/e2GA04wO3IPWPr5I1u7K9JPWRC5cN
	 HF+380TBWSDT+cNVEquQIWjsemo7wiZqUlk/bns3U8kbDygPvKaSy8Gpp6/eMgZoRGcB4
	 6FUfIOdXw5IjE33GgrmD81t5hfDjlppvh82q4c+HR4Tx7S1dPISzT8MbGnMJ5W8L04QmL
	 FBoyYvNg2YRAwDO4NI6bF0REQomgmMRd6r1WrFZVpf9gp54BFKMQOdat1sPhXkjwfTBJQ
	 ZdZ/gcYlCDLdvOotDNoLPz+WW4wrIyLsz+NVhjZKy2ek+aCsJv+cEkq2Qu+pmMpPLLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749211;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jY3xGG57GVWa+wMl7oxhpSIomPcM/kWyJWqi5RR6jzk=;
	b=bbTaPKwCuOVOT6H4Zwf7BtReCDULNOgKQU65RiXb4kKE448CElHehSlMdaUcehuduPRc
	 FVWX5gjrB+JhhdD9fNi80tWLoMhinvN8DEYcHHYehAioT+SzgTWzoDBxasmtnnxCgt3qK
	 yIctRZB/QC79MxMU46iIg/46HPaMbAVs69c2txZ2jQEQ0mTYmRrh73r+ACJpwIb7AuSmQ
	 O1mlV/n6fZsAbbBvrSJ4ekdnVRBcq0k5keb95/lXXDjGjItvT+qeFfv5NUzKV2867Vp6h
	 NaO/ohKjWaKijx1GSqB5BsFOYlir0oWi6/ALMFs4IpM+N3EwVF3ADrDFxVM8ZkRLhFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DF606A33E
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 248DF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4682977f9aso399267966b.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 05:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794749209; x=1795354009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY3xGG57GVWa+wMl7oxhpSIomPcM/kWyJWqi5RR6jzk=;
        b=qEpH0VppOsYLOLf5IaDuDobjS/a35kVt8wi7nUZHhJSUYTR3H+088k0bKVXmF4QZT9
         vcuA3CPN5aYIBQvlg+4yOPoMefZRa2F3MpJ4EzVRTXd5MkeZq4tdt+jhTBMgdw7JonXz
         S4c0efeLjs3JGV5da3NXuvmOb+rdH1O8bp/+ppzskkFUpLOTz/S5Yma02bzAN3V1quM6
         I7TVGJsJlk+lUAy1Vd6vy9mtb8syXqCER1OusZC1M6eBdT3ny7XZNXo4SUcKzKQv0wcM
         hCuYJ8OebUH4/0hxEfoXjiZkysSpjP/SRkbKxtMhi7I/DU3umt65Ebcefb84kIWP+vN0
         tezg==
X-Forwarded-Encrypted: i=1; AL+hErHeO1veprOPhRAHygVrN3O04GAoHmYSU99Vmbgcw6mLLi8HgWxvMf4hohvapWW9ifmPgFqTaHWrERURdw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bSVWU1keYBA2I6q52+vYjPBmtn8UVlwSlQijF0GgLY0EpBbf0
	pIuAKvXhRNBFYVaInVMwgTlAzTsqA5qzei0ZoTF+QX0qbD+0Ddt49iQQD1jr4nmoolo=
X-Gm-Gg: AYBFou3p1zwD7m+nnnQ74EpDlAmGqDI6G5Wwov5ovmpCWODTxgrBTla5avcsrDwhPP2
	7tXXAsCotKEvuto1gYUs3uoakTItckPMm8ufQ4frlZIGLMUlUo/gwNm4AZzA9bAfvO4h2l6Bwva
	JkW7MzmRErmdd9aLYNdfiU7kdDyf9rKusWD6tJfXIf4ecRW539JxkxdRdK8UZVGUzk2JQlAh802
	Ol1+cHjA38MtmXEUkZlgfflkH3RYygEORGeQJdYwAFDMottbDiAdGZpUyLDDVVI3JpZr1ZresBC
	l1IfsMKlCDpEqflMMPmcOzW8CcSuyFkI0eMelK2MDwPTpPYCm4ogJ2A1owtuNg3Pg1NX78bXjf2
	qGFYJfuTzhEPuHpU3BZ+v5KG0w059mRlem3mDNIhz9BawfLOsqog9p2cPuKK6+QmI6XnR//Z1FN
	iQ60gAmbl2mdp6j9GvUamvdj2hrulfupgDRmI2o+ETdtVBAYxqIvN2GSFc775t9H5YRieW5U14/
	soEjkjlx809Bilo8wuOLejr5XVhi/X9kV2FHsXm1l0qLeS6uydRIev1o6yk9Twqa2UMq4kcRRW3
	dRho9RiYMbPn1kt7h1CU5d7TUA3HtpdUjXCdY2eb/wCFQjOnZOWrTvS/THZHrv4w7MhDdb504oQ
	C4RbqEZ+bSjxozbsjRg==
X-Received: by 2002:a17:907:6ea2:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c509653b3fcmr658271566b.43.1794749209520;
        Sun, 15 Nov 2026 05:26:49 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b71608sm302900866b.64.2026.11.15.05.26.48
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 05:26:49 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso914320f8f.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 05:26:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEHDIOS9VEMPlI0xGg9kj7HmUeLrot0AheXfiEQTTxFPtNV3v8mtFIvqne1MtEqbpza36ZxaD2sY34GQw==@vger.kernel.org
X-Received: by 2002:a05:6000:1848:b0:48f:bcbf:26f8 with SMTP id
 ffacd0b85a97d-49c7390fcbamr17525357f8f.48.1794749208648; Sun, 15 Nov 2026
 05:26:48 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115132215.4084031-2-iam@sung-woo.kim>
In-Reply-To: <20261115132215.4084031-2-iam@sung-woo.kim>
From: Sungwoo Kim <iam@sung-woo.kim>
Date: Sun, 15 Nov 2026 08:26:32 -0500
X-Gmail-Original-Message-ID: <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
X-Gm-Features: AclHuK89S0biKagP1-Gmz3zw0cKplorvpQTCrvEikzedtHJQEI8ZvWsTk-6J-VQ
Message-ID: <CAJNyHpK8ZpP5uAK0tgtswKVvD3=Z=d+2dR148RSNw-L7X_ih0w@mail.gmail.com>
Subject: Re: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in fixup
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

One more, ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE in alc662.c also has the
same issue (missing .chained=3Dtrue)

On Sun, Nov 15, 2026 at 8:23=E2=80=AFAM Sungwoo Kim <iam@sung-woo.kim> wrot=
e:
>
> The fixup specifies a chain_id but does not set the chained flag,
> which prevents the chained fixup from being executed.
>
> Should chained be set to true here?
>
> This was identified through static analysis and has not been tested
> on actual hardware.
>
> Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
> ---
>  sound/hda/codecs/realtek/alc269.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 96fa8c2782bb..1be2e609c28d 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x1e, 0x411111f0 },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_CZC_TMI] =3D {
> @@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x20, 0x8000ffff },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_CZC_L101] =3D {
> @@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x1e, 0x411111f0 },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_LEMOTE_A1802] =3D {
> @@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x21, 0x03214020 },
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC269_FIXUP_LEMOTE_A190X] =3D {
> @@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] =3D {
>                         { 0x1b, 0x0201401f }, /* front lineout */
>                         { }
>                 },
> +               .chained =3D true,
>                 .chain_id =3D ALC269_FIXUP_DMIC,
>         },
>         [ALC256_FIXUP_INTEL_NUC8_RUGGED] =3D {
> --
> 2.47.3
>
