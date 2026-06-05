Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC1F3B6BE3
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 01:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780622739; cv=pass; b=HC1Zu7NPpT3H2teqtwHaqEg00m6Rk4aSj1tnWJnr1YDe1VnXTtmUagjtjBQBhSOtvz2Zjg57U5LzkeAls/JkZdGvIN/8dFwNOv1uSQxtwARFYHIRbO31ihYfuIVfXIUojcrNgHBpVl2xNZCz41RubeYYTEYpymNuHW26VDfSRMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780622739; c=relaxed/simple;
	bh=yR9iPHQ7X1yMgWZrkr31stdQCeajq3KhlcULNx8kfWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7RmabVQL6TxxHLukngepa/MxnIpl9LTep7c/tIPK3Cs3CH6Ea4bHDGt/8EU0ZBvani+NuX3e70KpwHyx/J1yEGckrkv/rIc6NMiTIx/ERMRTRDDtkL2sZ8gfKWmBcZnKt4SCOWfUYpZCVCbnuSSkil67exEbHOq7CU/Cl9YPfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTcP9kYO; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTcP9kYO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bebc80100efso136984666b.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 18:25:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780622730; cv=none;
        d=google.com; s=arc-20240605;
        b=WJA9eg9cXGiThi5k2QJiFLBJ6TDnojRxEgHT8PUb7U9kSHnMDjG8D6qpo7KgLUsM89
         12fI49j/mP90sBr6u2P1RUM37VPATTTpuW5XSTgYS/A5+RsT7mcNCKeF8RPOUDEx1j3k
         i33V6jPBNrcW8oXYevcsJAOkYPjJfiyogBYS4cXIwp7qrWX5cNwqjSOb1+zGwrHMoEnZ
         ktUqenL625EbsF5AFHRt/kubdyesIJVXvb0VGUIaPgqgQLvdXJGRiroE6x9jObN6Jbyy
         5KGev2bj9btGihmNUV0unJfbqRhyIch84lISA3LuYcHXqONE1Zf6agnuvwASqQBs1C4F
         KssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        fh=WUr1rtPp3Q0K6qnGlu53j5K6YGSWiT3UPCnqyqTt8FQ=;
        b=W5QlnjB+cxIE98zLfuugmDJTmStL/5Hguz7lQORMQ26Mm+p6bZWz2rmeB3yfpQkTq/
         qju+dH5t3YjihNVzr9Ov/eCmmlL4/gbYfs00m4bM0vDbb9o7Sc0JG+lDQmqO6BMG5sqa
         /eQbce1lOK7Gw0sKPuupBA56cWN3+R+SxCw5XTwVx7GZX/8qC5u4xPcDSPMs1Us6kD3/
         v1Qg04a8I4qImOzCbXlEKvb2lXP3t07jmdjhBvbMCcLlTDYVt5nB78Mcti73TH9+vnTk
         ZV8DnkBZ9BYuxajGIDfq1EhpuxiM5XjUpxkdhYKbGOQaZauFisihxVVOXKD2bIkh2iBY
         bCiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780622730; x=1781227530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        b=sTcP9kYOPITvC2aSMeL/A9u1ZAavHkIf2RkdQAOBE2XIxeBSy12dd/GkbiBLReZt1J
         3q+hpfwTv2bNGD+xekHUE6w65STeu5r/ZeCVhAjFB2BLzGUWZnIIeWmWnJo02LK9XX3Z
         Q47gjpO/Dz/u4r2xjf8iWuSEHWPrXoWOFe1smUD8rABQbXCKrNrZR5rbyDDjlry+/iwp
         Dzb6cOx6qGTtswmpJlxPX03sbt7opfuVS1BCjWsUL/bv8PAGm3YVAZd4hP5sLas6FVEP
         QzY9FatsIgCSChyombaaXZOabcviM7bsC/vdaXzc39BRqrWRZUykXy6aD/fBfUVxoKKG
         PniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780622730; x=1781227530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uokzk4V1WQNqzax8rM0zN70J5L37rNbhenhyeHDxJfg=;
        b=ZzwIt6e7vdMnCsWwhcGLNA2fa3RBv6mtyJ87OGUIaYb/IgOXO6iLbNekdPpo+bm8Ut
         Rm9OjWjGj31oV3DiW0J+OIzZ0eRenC+/ItlQSvXOqew/yZYkvBI8+71zySYbbstPTJvy
         8HdHax5wK6ntdTxHgsdixelUxTIgdGVDWENkTpzgcTBMz3tWKM4qUuMsS5d/W0ddSej0
         3Q80dQ61VXfcD9cgoABfxPghWZx6b87qI7iJMq0vvXsoaWFtVI4QAwiiy+iL/jSsIo5d
         idrGQSAl3qxuPRsJ8qYfgFgV1c8O668hdmZgaOBGopHawNHAX/aOYLMRodTABwIkRQ6B
         PZXg==
X-Forwarded-Encrypted: i=1; AFNElJ87td+Jd51PruIyia1Ge7WGYTq8RWIuEa5gF1KBoJmqwSEztSKeR2tXINXqOPkqLJylWBden7OphrwOCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxusP9K5VenZiGu3AhVcgNEDNUvwZZ0K/AQ7CM4uy2smfW+KlXr
	ZJMCkwKq0ZsvfhAyK9DdN2Obg28rBDUJVT5iOlDE44o2CgabM8JhzeUXc6KdNVGXZoV/diZH+n/
	myLYa0hfoJwxK8iRjT+BYBhzm28qXt+/C6vQ4oPQ=
X-Gm-Gg: Acq92OG76ZTFXQQHtz115V5MuaeKUWLxHvkdI9U/jqwm6Bl2rUWfX+6vCc27VKVJdSP
	0OUOP/ULi9iACy7daCAJDn8zOF5C+2C6hGcP1jgGkTQxSxnW8qlGn02ZYnjQLTri05qsTAwLTnT
	ByuKB8Bi95x8afZyhVirsO6AW/zdIVFl0DVrwizA5PCjl3TJX1EBJOHMIMrv0pW/yiYbIn68/k6
	PFOWMnYI3FlwIq/7eu6iTYT+39HI8W+wVegEhO9gOIBs4NXPzffl0m673wAz3gRIv9qvgzHg7KF
	4BmGVd85JYP1VsLp2Svc
X-Received: by 2002:a17:907:dac:b0:baa:6847:af9 with SMTP id
 a640c23a62f3a-bf37234c8c5mr52264866b.28.1780622729733; Thu, 04 Jun 2026
 18:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780538113.git.zhoubinbin@loongson.cn> <2736a44ee11bcc0bbf282c69e99cb05b12469207.1780538113.git.zhoubinbin@loongson.cn>
 <bae028cd-c77b-4238-8b62-330a1c3c46ed@sirena.org.uk>
In-Reply-To: <bae028cd-c77b-4238-8b62-330a1c3c46ed@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Fri, 5 Jun 2026 09:25:17 +0800
X-Gm-Features: AVVi8CfdW5IUTOMPP78y2fnXmkP4Q2-oxn8x6qdRtekrt5cj2B0jDWhtd_sOa5w
Message-ID: <CAMpQs4LCQmp1-Rw6W0jf=h9Rub1iK8BYCYi_jhB7updSKMfCSA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ASoC: loongson: Add headphone jack detection and
 DAPM routing
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

Thanks for your reply.

On Thu, Jun 4, 2026 at 10:56=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, Jun 04, 2026 at 10:11:47AM +0800, Binbin Zhou wrote:
>
> > +     ret =3D snd_soc_of_parse_audio_routing(card, "audio-routing");
> > +     if (ret)
> > +             dev_warn(dev, "Unable to parse routing\n");
>
> The routing is optional in the schema but the helper will return an
> error if it's missing AFAICT (the of_property_count_strings() won't find
> the property).  I'm wondering if it makes more sense to have the check
> for a missing property here or in the helper...

Yes, I noticed that too.

In the next version, I'll add an `add_dapm_routes` field to `struct
loongson_card_config` to indicate whether `dapm_routes` needs to be
parsed, in order to avoid unnecessary warning output.

Also, since the newly added parsing items only apply to FDT, I=E2=80=99ll m=
ove
them to `loongson_card_parse_of()` as well, which should make the code
clearer.

--=20
Thanks.
Binbin
