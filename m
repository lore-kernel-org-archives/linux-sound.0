Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE7D3AEB29
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786369621; cv=none; b=eG7gGeNd9EH1KGuU4vTYs2Niuzb9C3RL0z9qrg+IuaH84l7Q6G6axtriTH821/jtbNVII5/xyCUhVl4EhUzPNTaVHvarvHfvuhRvnE8M7YxdOSjYe9i/jysZ30hkv/kDq610C3YWskse0Akq3mvzDBBi8H24U4UFQkgzJWtogCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786369621; c=relaxed/simple;
	bh=nGvLBkBDKOaRJg4kSHLzaeM3hbIwICruJFemXkd3omU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=C5IwfOdMD/mflaa0rzKOO59FBr0CHTnBIIsydfAp/Cq9daCdcq4fXU+NbercBp0Xz19pE6WTQt2WogiFmY3Vlo2y+ZziM0XSc6b9QxTkMQ1AjCJtt8FGimEVydYlJUpgwzHtYcrCH/wtq0AEoYsrFaYhEwBIeIYiRwLvsUezN+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MU3Ykl4g; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MU3Ykl4g"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a205b0df35so2161138a12.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 06:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786369618; x=1786974418; darn=vger.kernel.org;
        h=user-agent:mime-version:date:content-transfer-encoding:content-type
         :references:in-reply-to:cc:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VkmuAyNmOKZH0mWQNQTduJMEBCH2vZax1Arre+veBLc=;
        b=MU3Ykl4gy1SpdHXXV/w910+ztPPb7zDY9Nc4HV+fJes77Yo2H/wTlVmLA1uLX7SZ8s
         Z80iuPtP08Ksgtfeyb+1PbgaEOlw3gB7mK5XZnzxxQFVqYVipCiFpc3qJc1FOmvF41E7
         Uqq8DAeFikyUkXnXQcoWiSb1PswlCC3leATmvwiSfFF0SEt5CtyHctLPHLJeFMr6KjKG
         +jhsUz+twOs1CGpqYC6Lmtmw5Abx93/arioKY2TOByEk7nMlNGGK0MdcZiux71T1TG+9
         2m6teyijcu23CGyahoVeDzN98ie3sgO+pgfDFEua1u+M2D+76g/mtRS2I2k8bRrmzhrr
         lAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786369618; x=1786974418;
        h=user-agent:mime-version:date:content-transfer-encoding:content-type
         :references:in-reply-to:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkmuAyNmOKZH0mWQNQTduJMEBCH2vZax1Arre+veBLc=;
        b=jhW9XGrfxesSZJC4ayr2Rq5l5m0ksS2xPAmUr0vF6IB8Kr0ReSUKTEUj8WwYDu5I7+
         UlcW80puUcLc14myhX6A0JKcxR/HEZmI2ywxXTyhebE/jH70WMiLpADly6VKHffhgFjH
         hAt4zLO1Q3Y9oAIVG3IeQTNg+QwUFZHPnvNVoJ0DpEpI/cDHp/yNwNWftYuuquIRmIrf
         5VNnAeRjpU6CENt/NJHbhsFHJsYzeRcAP1Krqzk0L7l5HJBvDFFIhhO+MHDKBbSBf8Io
         yZKmQDJxxgIHz6/JeKXaOqMdQk6L+cbXjJDj4oatNFygUyeO79tirjbmZI/nkIChTqei
         fAyg==
X-Forwarded-Encrypted: i=1; AHgh+RoGppTS483oDkrzRPvigxtpQlIz5DJpNEhGvr6gS49NNhHAwBywu2dyR5shZfpKGqqurn6+d75oIORVCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfQeUMss9otRGIg/N1io7sH2fQE8XulqdHmMGb7ytjR0bzqFV+
	0HIWCPuzRjcKIyiIM9gBAsmYjp6DTZwYsD9zkQFKLrahyj61d5hJrVib
X-Gm-Gg: AR+sD11SaLWXVbYVv6OfPD4OsM13X1brFv5gNETiaHJhKiARlMLr9G+4+Z6ZLAS6de/
	oy+ANkmvh0H/WPhcZBYTkSWSaXhCYfgTZLOI3fm/fOEVD1yFhxWLsPZPnE8c/EGbTcMmPPxcHvn
	bYeVy+3P6btlxf00TEvHIasC0+xX+toJkDShAoCIF8SZiGvVMMlq3WyZifO7Lrug0HMpzwHL6gz
	3bUaTNEu9axOSh8waMC2VwfA9RS3Feq5Tw3aHo7NabdJ9RoHwtWXKa5/CeW/NXiAqV1DcXcaiQ6
	lypUUeLfAj/qozjt4hxUCfUAfXwi9VR8gXZSg5GiwYzhXJ/2scPITERwcMABMv80FtmnlFIfDz9
	Qmtv2KOXK2rjzdO7EC3D3rLLacFRdDqXmQg13oReVa0SE8hyikPqiXnoCR7fiV1H/YZ4QLKvOb5
	pn98fd8LqU9d6ftA4CrgC86B75OufcodZWChVZq0//Utlu8OTq9s7fNU6g+r0s6O6+KtMXugEf8
	81vCKH7lyQ3MdeOrTrAuDvdZkaoCWpBg4W0esKQ250Z
X-Received: by 2002:a17:906:4795:b0:c15:d0b6:495c with SMTP id a640c23a62f3a-c2039e6acefmr2013592466b.29.1786369617351;
        Mon, 10 Aug 2026 06:46:57 -0700 (PDT)
Received: from [10.198.255.130] (polaris.rmrf.org. [70.34.242.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080a29a28sm387425366b.7.2026.08.10.06.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:46:57 -0700 (PDT)
Message-ID: <1ae066f5cc91a5e6e043177774cf6ee699a7b2f5.camel@gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Enable micmute LED on HP
 EliteBook 6 G1a p/n: AD3Q9ET#UUG
From: Denis Batishchev <ii343hbka@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <877blyccxq.wl-tiwai@suse.de>
References: <20260810125209.2014042-1-ii343hbka@gmail.com>
	 <877blyccxq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 15:41:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 

Sorry. I'll double check what I'm doing wrong.
At first I used spaces that's true.

On Mon, 2026-08-10 at 15:39 +0200, Takashi Iwai wrote:
> On Mon, 10 Aug 2026 14:52:09 +0200,
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
> > ---
> >  sound/hda/codecs/realtek/alc269.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realt=
ek/alc269.c
> > index 6b36c730c..ef8beb928 100644
> > --- a/sound/hda/codecs/realtek/alc269.c
> > +++ b/sound/hda/codecs/realtek/alc269.c
> > @@ -7542,6 +7542,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
> >  	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP=
_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8df7, "HP Z66 G6", ALC236_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_H=
P_MUTE_LED_MICMUTE_VREF),
> > +        SND_PCI_QUIRK(0x103c, 0x8e0d, "HP EliteBook 6 G1a 14 (AD3Q9ET#=
UUG)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>=20
> Hmm, it's still with spaces instead of tabs?
>=20
>=20
> Takashi
