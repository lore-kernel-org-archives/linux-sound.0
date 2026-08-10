Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415D6329E7E
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 15:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377215; cv=none; b=g47CEpAGhO/j/F1fI+AmPGAn9921ykUSJlTdiMWRJqe0fZfLYVRsjqqeQQI+0A7ZRyJKSTeY76lrzEgidV+auBZ9PXA7z8laIg4pEK7krDzwL0rLDoYXEDv6+sGohk3JV05cx/02PptDVgpYAUCIigt/WJeT1Gms5Kw3Xg8VG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377215; c=relaxed/simple;
	bh=Ro0N5PxSzkcGfaO2q/mC90NvWjxKhBcpNAXq9iivlfY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=TAD+gFqiVz1f5OFAGohBlqIZ79ZxP3ZXTQe0jXtLiPj12erH0rlC5Wng5BFsKYEFT16CYCQ+4KPfTlICW/F8vnzAAtsuuTSRgesq1f7U+5/QA6aExVAhdQqnsJhLZefIdL2mjzVAdU53nV9n+CNWzyIZOyXVgmL6wSRKdbucmgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RT+OA4U5; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RT+OA4U5"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15c42a45adso6331266b.0
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 08:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786377212; x=1786982012; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:content-type
         :references:in-reply-to:cc:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uZhcRyQnA3+vAWSpQZGi/HC8GMXRR5Rr60F2e5thEwg=;
        b=RT+OA4U5/7tLyre4qZ86ziuaIsqXwkP0Ur9dH1tflt0XuIriW2DUyPXDCfDFPyiw+Z
         L1BFOkg1b8YR0+xyX47osdKB0AWBiT0yAAcCQQmPf3Irn7gKoRneKAoZLHbNApBvkBNt
         MCxUDCXZ6fPherp9DZAB42SG+Cn/VLM0AyczUZ3briCIYjRlKvosaAw6EqubJZ/b7utK
         jaaf0j/dWUwPxxFHXqqe0veKcbZE/C64pS2KDC0IeXK1KIkCmk+Rz+1Rb6y7NHmpQGjt
         NS/uIJv9BU7lr/+rrtlv94ZVi+OJh2O+900u1Q+TsEDkcMT1zOSxlSkNHd1vXuCNN4s3
         MpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786377212; x=1786982012;
        h=user-agent:mime-version:date:content-transfer-encoding:content-type
         :references:in-reply-to:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZhcRyQnA3+vAWSpQZGi/HC8GMXRR5Rr60F2e5thEwg=;
        b=QuhS1FP6LMZ9npHCJw/tm83hcqTjnWvQm6H/em9AOh4xZhkfqhaSS1DJP/IveckWlY
         fTzYlrO3B8Lyj1dKs4w2byAIflqSKn5Z/gEKoFd/bIlv7ElqaL6PSRo71BYbMUiNJlI5
         KgOthaehPoJk+ujZEkR8CWFs5OTy1adg9qRpJ8FVnQ9NdAYhP+boDyNMM/xn4v2C7nem
         NrHrhacPegT4pIPTpjqgS4LEM/sxVw3dOH7U8OHQmwVRTmrKPU+XmO+yK4PAfzDktlgt
         KIACuXQEoMIbQFP4ivDdVW1rdI//hKVgEK4Gq2FITzTLJoUnJknWErd7rp0WP9eTaab+
         VQpA==
X-Forwarded-Encrypted: i=1; AHgh+RoRpxmUuBqoDp6uTmJPsy/PMNoZ7mvbJdQkC8TZuBMEimj+1Lu8wp8oPkQwHUcFtnnEJOo9EI500dmMFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEEkqWF6jccr94cDxZa4/reiFRpDCb/9BeLjIuTsjItJ/aiaHn
	eyWRVzeUnEN7bdfvj5gYvi12vPny4JglR1NQGejvnQYlYRDfTBgrm1LB
X-Gm-Gg: AR+sD13RtR5EveOo4r5AosDOjEoFMarz0nYL9I0WkZN/zTXBKP/dazD1JNQLLhkA/rv
	JoztX58W03hFHsrivIjhsPmUPRmOFyeX9OD/J0OWdKsTmVGIajEj2irCm0TFMiQ4dJ2RkwSfT3I
	y2RSXqoQXUvbwQ7JJh2tuCjK7QRgbficMDkyj6999dKThuO4xBnqxhlMc+srKnt5kNK2q2s/bZf
	HbFl4vUSkN8I7LUIVAx3dXxvJyhwzlnlIlWu6wAPlz56VXbwe+fTPMbhqJecZBiPhOCMS5p8JeZ
	c7VW/MsYroIK20+wX7fl+Nm5wDI//9uZ2UonzfLeDJyCWGmTic5dkRXWtlULjn9Ikm9+BvRN3fZ
	npnsFJY8EReVPLrQgrJf5syPSRDc/t8XUTESGP2I2Q3ahSh0529PlzW7RPJrAORgtTJGjUSJT4i
	66q/jQm+rnHjOhogwYWKgbVLahOSPIggjvYrHpQ9E5uBzAxYhaGYrpfvwp2tLRC5uR36ESMKzD0
	CQ64h+NWYYkiIJvQuF5x4EMx4uIEvG6ZId1WzpIHL5kk3UI3ecuCCCn
X-Received: by 2002:a17:907:a890:b0:c16:aee0:5422 with SMTP id a640c23a62f3a-c208d3d7dfcmr802842966b.6.1786377212359;
        Mon, 10 Aug 2026 08:53:32 -0700 (PDT)
Received: from [10.198.255.130] (polaris.rmrf.org. [70.34.242.93])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7c9d912sm4208903a12.2.2026.08.10.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:53:32 -0700 (PDT)
Message-ID: <6b68d04721562e51e8d26bfb1450b4f9d9e73d2c.camel@gmail.com>
Subject: Re: [PATCH v3] ALSA: hda/realtek: Enable micmute LED on HP
 EliteBook 6 G1a p/n: AD3Q9ET#UUG
From: Denis Batishchev <ii343hbka@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <87tsp2asuv.wl-tiwai@suse.de>
References: <20260810151440.2306217-2-ii343hbka@gmail.com>
	 <87tsp2asuv.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 17:48:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 

Hi Takashi,

Thanks for pointing that out and applying it to for-next.
I'll pay closer attention next time :)

Thanks again,
Denis B.

On Mon, 2026-08-10 at 17:38 +0200, Takashi Iwai wrote:
> On Mon, 10 Aug 2026 17:14:41 +0200,
> Denis Batishchev wrote:
> >=20
> > The HP EliteBook 6 G1a (SSID 103c:8e0d) uses a Realtek ALC236 codec.
> > Without a quirk no fixup is selected and the mic-mute LED stays off.
> > It needs the same ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk as the
> > already-supported 14" variant (SSID 103c:8dfb), so add it.
> >=20
> > Signed-off-by: Denis Batishchev <ii343hbka@gmail.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> > v2: fix indentation (per Takashi Iwai <tiwai@suse.de>)
> > v3: fix indentation, 2nd trial (per Takashi Iwai <tiwai@suse.de>)
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index 6b36c730c..bcbdafb42 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -7544,6 +7544,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
> >  	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_H=
P_MUTE_LED_MICMUTE_VREF),
> >  	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP=
_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_H=
P_MUTE_LED_MICMUTE_VREF),
> > +	SND_PCI_QUIRK(0x103c, 0x8e0d, "HP EliteBook 6 G1a 14 (AD3Q9ET#UUG)", =
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> >  	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP=
_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8e11, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_=
2),
> >  	SND_PCI_QUIRK(0x103c, 0x8e12, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_=
2),
>=20
> The table is sorted in PCI SSID order, so it should have been put at
> the one entry below; for saving the internet bandwidth, I corrected
> locally at applying now :)
>=20
> Applied to for-next branch.  Thanks.
>=20
>=20
> Takashi
