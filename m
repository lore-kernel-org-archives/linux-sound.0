Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A8324B22
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 20:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781296231; cv=none; b=leE/maVOQB/Y7TaxkKCakfE0ErvQQxXDLIOu5rMAMig/Q9xatJ8eBdDW1EbJ/Yvt6H4oHTcWoC7WZCETLXLPdlyTopdaEPolTbePTtAK5jty091TSuB3ONZ+nZa1SsNPlDL0N2dfnoPl3k86FgWvslLtG6P48VThQ1lKHoB7NOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781296231; c=relaxed/simple;
	bh=Lt0k7jTl9l5Je/muEANY8WmcYg3cqaLLaJEUOSsDldY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VzLfRNCj6SUDGf8Lcxc4v+t5hjar1SLjx/EvP0IndA0RgkovWl02y3oHeiCfc3QTfNkXBQa0p00vKhdzFRE/7/glwvJR40AQ12Tt9S2v80u06ato30r8lYujHBxCB3mznMTefP2E094ldUVu7De4zWhFZVKYrlHDIOdm616ltnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2vliFHj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2vliFHj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ac10e337so9091385e9.3
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296227; x=1781901027; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:references
         :in-reply-to:cc:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8htq1iA3RMdrMAEb9/pJl3QbqhjPj8uKRlayNFVpG8w=;
        b=S2vliFHjQ0WyVNDCV+A6eTsG9B3JMAPFGST8SX8NRhzjG09q0GfP1qcw0Q3jUJhnMj
         djeRNlkP/WCxqgLpAqffcuUTa4NM6Fy9/mVK08yXrs+sXHtoh9vY+yu+EXvmzbkHnJB+
         dFAzl/8tqGVd1Ce9nFFmzOzSVpFGqzlxKVwUSjCtOXTsl5RsvuRW3ni4hJ9kdrzW/fX9
         HmiK5kMEUW9xRPvzzFDMeyOHBZr44FZKMEv/1/KR9myLW4FpLRYNjTDctXwvmxtbEqYO
         A4ceJzSCZnKnejFEZQYuo09QSaTyEYCykcU6u/CdoNlVzcTOEJqhy62OF1Be4Pp9kilD
         dyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296227; x=1781901027;
        h=user-agent:mime-version:date:content-transfer-encoding:references
         :in-reply-to:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8htq1iA3RMdrMAEb9/pJl3QbqhjPj8uKRlayNFVpG8w=;
        b=qB6WooSI9ISVDWENPpgDu19R3BL3EAUEXVx02IpSDWX4HdJURe6d9D3Sr2u7MM+jsL
         qfnMxGGWlZ7Dh1+axVXHfaDFaJs55swL20Lkx0YzscEQRFCkHzCQNFgNZIKQtLTdShty
         dbevYqQ9mKAdPGraNHGltq1Iu7PyMn7TjvElg1o7fNaulk4svpaEHwOzwS/E3URL+WQu
         ZL8bGQtxFK48y2ITCPz/oz/4FLO/DDf6HDPyeWsSXtRc5mIccEZAjQ7KAz0rtuirViDh
         Ea/fxNlmIZVFqKUgp0vayahbWYwVuN02dxfHfYwwlkllz0kijEa6aGUKwPZ3xVwQYAdi
         9JbA==
X-Forwarded-Encrypted: i=1; AFNElJ/QIRpIkczIUgKfzZ5ks3lbCQ7lEfBfA864cnD+d5IfK6aQIwknhLzXUYc3Bkh/XadZeGe4zZgMKUMGCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAkV7KcBNQLFZBwpkljOuJn7kY0fkwlY31NFb+ZE/zz6iSKNZ1
	LQr/MSCfQ/SYxZlOglIMSG7RXin88aus7Cu02i6rTG8qF24/I0QtshS4
X-Gm-Gg: Acq92OEqMecOj8F/DCmoGIpqnef/QJ4I4sWODxn8n6NFLgwr4K7GSB9r/KDKvlFZGHj
	CLlftegZTOJwUVnFRI2k1q5+B+f9BVm3gyu0s+XTNR+MWFgdry/KRzBil6FDp99oNJGr6oU1f62
	+8zkEWQoo7hvDBYjVSfP7XyRaFyfqFKo8PMMlJVuojsFrlBstYuWTgVba89Rbi7Vn30SL9XyrzY
	1zPrbQmIHhG6DboPSvnw40asn9qesBb1hFoBsonI3zMfE015UWUMGd8dJcx8c7ZbWzHWOJpsoCj
	kEtp3Psm/s/9pwas6nof9tRxCFwvaYlUEMxWoquqUXLCX8uCKipWneJUX+vGxM+vupmGMh7ZMI+
	NVBOuhTc43Kqr/51S5cR9OkB57jdM1osafSSqodq7arWlD21NytZtMH1PxmN75TxeFZ6ZtGeB6a
	JctCuda6a0+mAI1IZLrIYpLrlk/x0mHC/EjBezGIWr7/k5txZWb0EQnNc6HYtuWZbEjFAielKc+
	nfJWFl1depDvKaun0QWCWT93IKm6WpLcyM=
X-Received: by 2002:a05:600c:2d88:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-492200e24cfmr7047295e9.25.1781296227009;
        Fri, 12 Jun 2026 13:30:27 -0700 (PDT)
Received: from denis-elite6.lan (178-222-30-44.dynamic.isp.telekom.rs. [178.222.30.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d05d1sm19055385e9.12.2026.06.12.13.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:30:26 -0700 (PDT)
Message-ID: <81d699c6fafb51c3f5d5adc657057706b07d9ee1.camel@gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable micmute LED on HP
 EliteBook 6 G1a
From: Denis Batishchev <ii343hbka@gmail.com>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <aiggF41W3LlKDts4@geday>
References: <20260604131518.45993-1-ii343hbka@gmail.com>
	 <20260609135607.3960625-1-ii343hbka@gmail.com> <aiggF41W3LlKDts4@geday>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 22:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 

Hi Geraldo,

Sorry about wrong email threading. That's first time I'm sending patch to k=
ernel.

My laptop's SKUs is AD3Q9ET#UUG.
It's HP Elitebook G1A 14" too but with a bit different audio chip as I unde=
rstand.
And quirk is indeed copy-pasted but with different device id.
I can change quirk description string to reflect my laptop version.

Best regards,
Denis B.

On Tue, 2026-06-09 at 11:15 -0300, Geraldo Nascimento wrote:
> Hi Denis,
>=20
> On Tue, Jun 09, 2026 at 03:56:07PM +0200, Denis Batishchev wrote:
> > The HP EliteBook 6 G1a (SSID 103c:8e0d) uses a Realtek ALC236 codec.
> > Without a quirk no fixup is selected and the mic-mute LED stays off.
> > It needs the same ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk as the
> > already-supported 14" variant (SSID 103c:8dfb), so add it.
>=20
> What is your exact variant of this hardware? Also please refrain from
> sending V2 in response to V1: it makes patches harder to track.
>=20
> >=20
> > Signed-off-by: Denis Batishchev <ii343hbka@gmail.com>
> > Cc: <stable@vger.kernel.org>
> > ---
> > v2: reword commit message as was required by Takashi Iwai
> >=20
> >  sound/hda/codecs/realtek/alc269.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index 78a865709635..8eebf91595d3 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -7274,6 +7274,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
> >  	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP=
_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8df7, "HP Z66 G6", ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_H=
P_MUTE_LED_MICMUTE_VREF),
> > +	SND_PCI_QUIRK(0x103c, 0x8e0d, "HP EliteBook 6 G1a 14", ALC236_FIXUP_H=
P_MUTE_LED_MICMUTE_VREF),
>=20
> The description string of the quirk seems copy-pasted. Are you sure
> you have the 14" variant?
>=20
> Thanks,
> Geraldo Nascimento
>=20
> >  	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP=
_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_H=
P_MUTE_LED_MICMUTE_VREF),
> >  	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP=
_GPIO_LED),
> > --=20
> > 2.53.0
> >=20
> >=20
