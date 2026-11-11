Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401185;
	b=rqAm8Tkn3l+JFWiBLgSeW5jQtAfRv4ZUnfyrF+Ez38SlS6D1TVfc0bjsH3enZVZQbwX0
	 GYeK4bMFyOcClDFsfz/ZjwHQvAajliDYJu8iTX21ccOpJKWiYAbtjgxZoXwXroHSjSazl
	 2z34hb/CwsDinv4RsjdrhOhiQmcXz3LTe4R9oufgAYlYDC+/zLTxRKzaz7sLrQn85gwkD
	 Iy4fMQPU/oN5OE4eYHbzvKk2w8vnBpoalvYj8OebNcRWV2PE2G8J7D+Iyv+SY6HWi2awk
	 x8+74chdBAj9ZSIfotlt1kKu/waSY2izkbiqnpj7b62W0VW9z82l5s4Qyu2ANbDGmBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=dqsxlzBlqew74SM4eg26ANWnUTuVT40bw8C0+TaKeeo=;
	b=GKr+mzVcOwOWrRqXBFpyfUR+VhMdTaBxhYZMqC8bK6kVSfzGfaNCm7g+sFXCOKGsSvg/
	 +Vb2k9Ny9TEEJAOW4/jibgQ+t1J+oY6JxhvCTek4BL3M9mHNzuQp1Xd11g0vMgLGYQBZR
	 tzxoG+rLSDh8NH/D4I1JMHqmvqAAzsJlniqhnxqIAzRoiDNxmJCr9QoKTXH/WkwSViEpG
	 yamiQIMFp9SmqhSkXZIQhuNiwgtT0etPkMD5TwtDuBSDXOy9VWPkFMs96wzitSlNLRcHl
	 5Ni3ggMRE4KT31VuCI9RtUkIfwRTyXugVxVhpTFFekexS/F1vgSmhnIXWtG6pbK61uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PhPF5/f3";
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A4606A326
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 12:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PhPF5/f3
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b336de3d38so24086537b3.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 04:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401184; x=1795005984; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqsxlzBlqew74SM4eg26ANWnUTuVT40bw8C0+TaKeeo=;
        b=PhPF5/f336kk32pIDggkoR5F1cLDUDOHlAT9EDD8vuatswaO3ulHJeY47zN+FViWr1
         AoSyekktOMXiwWrnLb0OoyqxIx/mho7L7jM/xI5kb8wv9Y/O6QIrRodYh5QmjGeGBPu7
         D9MveKpvkX9cxkKH3+rLJ0uH8dOAy5cvmk1T/h+LBOM7qvSaR8fd7eCrYV9DnwLsq9bK
         ecDw4Jl641jOZOmww8+7E+6RxiZGYYsVja7EavwrseSSU0/lZgPVI/kCEnBfVxySXWSF
         cZW0Sjb2ukFfnTln1gnQnKxuvm+PTE9ZmgY6xth9Rp3qpmn79SH21lsqBFr90TpejFnT
         8ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401184; x=1795005984;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dqsxlzBlqew74SM4eg26ANWnUTuVT40bw8C0+TaKeeo=;
        b=1bl0jlwYmSjjV9BhC3BjC2JjeMp2P6PDKbKcv3uLa3uOQmn8OyMCCTh0QugH2BFBKK
         /fa7hgqRIwtoY50rpqPb4FRLS3ZuViFPtNpskB6a9RJJ+4o+yIVpvUFKsdlIGYsCi2ao
         2FhnXSMQy2ypgVmvYjnTeOh8p9BnQGvNb8lxJ+ig+rXu+q+bb/14o5OaTD22jBXbnm7m
         V6rRu8KhnO3KFcQFWw/D8CDRResn4NHwX1oq5aIie5hJLhuWbREIHESpkVWd/qhaxb98
         h2z3Y0RMs4/bpBw0L80lUMxP9Qjaybm5lNSAT5XgnSwVT6s3WjRjOBfQGwDgDT3P1Fqh
         V2KQ==
X-Forwarded-Encrypted: i=1; AL+hErGI7d+wh5sniof+Pkb0Cf9m0Wc9FsB+QAHY1SX919ohZ6+mj6YCYtfm8+qL2CjFRI/bccWz6pRzbIpDDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/lcxfCsGzDcUNm/El1cIE1F/T7qELIAnSZrSEiWNebO+IuV1gp
	Uy8Ub1k3Qp572WvsxCXDfizrSb5yL3o+IsgDFDgDpemHVUKGhItf7EuM
X-Gm-Gg: AYBFou1BCxKTu7Mcbauo1Bj/QxyoAcYy4jr9p6YMxudl9Ezs/lWpgvQY2nDgwGLhCM5
	Lj5JRcphLzsogvB1EHdFBfqwRPvnCulfKJAFtCzbdXBGJNoYt5v0SbfLu0mXTV++Ov2zt6auW91
	dyMdnj7YAOF5rSuIrmhYg/sxlr3M6Stgc1XAAkys18wOifd2uL+SlpVrU8lHkTkjIv1NA1L3Ufm
	uo+GDj0P+Nu+lxiiQ9B2/lJcNzHFhly+NUekq2p3DEhXIoE5Eo76Vb4O/WpKBxx87FGDrn8BnvQ
	ulPqBRkDo0KQISj9AcVxv9BsSbxPwUW+TbMTsqzkZbORWOw7yirkLqrhu0npno2KWKeBhj50I2M
	8HPZzkg4qZ5DHJ+qCDlBs1ptzP58iSu5pXr8fpWqsWy0/BSBAurV92KAMaV9ADGABFyUsaLYtgr
	YrNGx5JPbZhCmJTNZnC20TCabZuJS33mdHGpabnHgOFTZ7Qfre7E0mqvGKK4owb8N7US8eCkihs
	CpiZ3+Yi4vi70qZzxE2uSexj8nrhQG3WM/9NYhIAuCJ95LTMI3QlxO3jn8icibVyKROr6VdfKYF
	QOC3dvMOvOpcfb4Va3fdXk9oBLRlPW5Ra3/+LIzeYvVf72B/Eku3B1ALxHpRsQ==
X-Received: by 2002:a05:690c:7482:b0:8b3:56bc:495e with SMTP id 00721157ae682-8b3a801e5e8mr16968697b3.12.1794401184204;
        Wed, 11 Nov 2026 04:46:24 -0800 (PST)
Received: from cacher.localnet ([111.94.230.110])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3930bfb64sm43554307b3.0.2026.11.11.04.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:46:23 -0800 (PST)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] ALSA: hda/realtek: add micmute LED quirk for Acer Predator
 PHN16-72
Date: Wed, 11 Nov 2026 19:45:32 +0700
Message-ID: <1jca4Y-sRYC8k7kF1YLCmA@gmail.com>
In-Reply-To: <87jymju4jr.wl-tiwai@suse.de>
References:
 <20261111021328.16153-1-faiz.faadhillah@gmail.com>
 <87jymju4jr.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart9ruMX38yRFmCy1eDNUUa2g";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9ruMX38yRFmCy1eDNUUa2g
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 11 Nov 2026 19:45:32 +0700
Message-ID: <1jca4Y-sRYC8k7kF1YLCmA@gmail.com>
In-Reply-To: <87jymju4jr.wl-tiwai@suse.de>
MIME-Version: 1.0

On Wednesday, November 11, 2026 3:59:36=E2=80=AFPM Western Indonesia Time T=
akashi Iwai wrote:
> On Wed, 11 Nov 2026 03:13:28 +0100,
> Fa-Iz Faadhillah Ibrahim wrote:
> >=20
> > fix micmute LED for Acer Predator PHN16-72.
> >=20
> > Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index a756e0076021..fa78a36bba5f 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -7553,6 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
> >  	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_=
HEADSET_MIC),
> >  	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACE=
R_MICMUTE_LED),
> >  	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEA=
DSET_MIC),
> > +	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_=
ACER_MICMUTE_LED),
> >  	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_=
HEADSET_MIC),
>=20
> You see that there is already an entry for 1025:1731.
> You should replace it with the new quirk instead of appending yet
> another.
thanks for the correction, yes I should've replaced it instead.
>=20
> And, please elaborate a bit more.  You're changing the existing quirk,
> so you'd need to show that there is no regression by your change.
I can confirm that the headset mic fixed by the existing quirk does still
work properly with the new quirk, what do i need to show exactly?
>=20
>=20
> thanks,
>=20
> Takashi
>=20
Thanks,
=46a-Iz Faadhillah Ibrahim

--nextPart9ruMX38yRFmCy1eDNUUa2g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQ4w2twx+ytUQ2e4TSHcmckvkvFGgUCavRjbAAKCRCHcmckvkvF
GhVzAQDnLtHDC0XAj07LNeeApkyPDtbw2pLd1MRVX7ITA1uRDwD9HEPBArX8mOK7
3CGlC4F0bTF+CFOmEk4RoEjkhCnrcAA=
=+rHd
-----END PGP SIGNATURE-----

--nextPart9ruMX38yRFmCy1eDNUUa2g--



