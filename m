Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BFD2BD5BD
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 16:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941455; cv=none; b=GMb5KNmsXZ8NofgJ4XjMKIEzFAMsVqLaqILMcNlvh9pq9G1eTwNqxy6e/4dYqm7lasAUxfR+lVoAF37yiXB+NX/Lh+mgJyshwAHcQj+gpxIMkSsJIrfCpLaoQXbVZJzNBkSEJSPfRaL/r1q2uItwwmaT0KSLOFWhn46Zk5DGfl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941455; c=relaxed/simple;
	bh=rYjR1Iqi0XRFbJ1FUWt3fyHt51IY6QWXX2UUdREHseg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtOUcpjoBzIn+qweE0lG40jjgkPGq7Gi5lB+TMAhl3yN5aGA/t+NvcfnM65eu5ySs29IZp1I9F2OOftldnE8o6x/Wzq6L5Su1n1tm+Rhs8Xt71E1D0eZOWqcyQDE/68POHLno7DJqV7tL3jE19IPaecvqFL/6U8PvhRDK+5cUVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKOoUjeX; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKOoUjeX"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-36f51ac0595so36596fac.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 09:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759941453; x=1760546253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9cAqL5EmxLXp5mN45dwhw+4xOMNiEwDDv11EuM2Aio=;
        b=bKOoUjeX3GWdOy50ewwoX0G4EpaOHt7r0nvIFZCzL5r3OqTOvNmS0gIjf3dNhyTkRs
         PCmcTS++6+uOE7hf9XjKzSWvkkkRWUWposGig774vlhhWMOg6Y8bgEbrheVF3lALivAb
         Qz4prfrEJ0m7q/U+3r3IWd6EgtV7gchtj9uRP/2x0yRkUVEDLkoXQE8inaFyzCgZJ2pJ
         Tcnxd1Kt3tR36LVLAeytOBsNTlPgd6q6j9jidaejlMlAFjiiRqpjA0/D9ZnU9mBEF5ob
         4tRCviuk7Iy6IVJIG9wfH7E+o2lMTJuGSi7IcqDyYRJ5cSuDLBpPsFVM1YjeIuZWweDV
         V70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941453; x=1760546253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9cAqL5EmxLXp5mN45dwhw+4xOMNiEwDDv11EuM2Aio=;
        b=qIf5nuh3PGTI8S32Q5xFizvfyDaI76wfkI2wn07xkR7vXq8xqXZmJfUXk6XrkDC42w
         9AccqQeZtHVL0DiZ9d7ffw8LovpohugjZxzQaHImEId2ml4YGoxIXGKtXKe2kZ51iemd
         kBKH1fhx6J97DVuvaEv1Z12z1akz/6Oe/uVLAQLcFM9u4K68pIYu5R/TnPEBOY0t12NL
         KOst52CZ4QHlwRhgB7x/OjSr+k4Dbl7JjDPjHw6z3uZy++ojLNHuD71Ua0GzUkhaOwT9
         sGkbtS//nWs6dxFk6elPH04XLLIKIchhYLHOYQv/l+n0Rk/rkxKqZkb/OA1tC82DJWaz
         Nbhw==
X-Forwarded-Encrypted: i=1; AJvYcCXC0Ww/XTBytW53kn4s7GMFXZxlALRLcCTtHZH557GL3KlNvpYGTrihdEgC6BftqNsbLTvULWq2PV5pTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRtNvEso9F2Rw5bNwvfkNZA5bNWuqYrlKdsFbvzkHgJ5OETmtd
	wDeaBjrbHi9MvJPMHg1/oX5josR/IAaSqX0BFJIVwB5MV7vFamfTMyFFggRw9ut5UfHQ2yh3n2k
	0D2Le0eY98HVxf3Ia22580rqxgUEitfTrzPQifZ1unA==
X-Gm-Gg: ASbGncufIMrL5mAvdJraWFqeRMXY6cWyuDRuGLpPBLsddIqO9LWB7Jcamk1tNh0YEqs
	dxMyuQfcJMmt6kyo49MooC/r+ZTFW5PK3g9kHjejyF8YS2GJMCSaynqQIeokphWCt3snAmm/zXl
	e83R4geUmEW9khlR08huHDQb0qfTPwuCoGK7FwgMglQSuVR0UaLJ3jTkjFk90TzhSLHwfegosTY
	whGkxHSmogX/Jdz+9ntyhSV0CoVqd4=
X-Google-Smtp-Source: AGHT+IH4NX68hGg/YYbycc0EXibQucC7/Qqd6VcevQnI+k9utEcJEXlVLufe3+2AMsfLmL36l2FfDS12dhHdBKj7CYk=
X-Received: by 2002:a05:6871:6d12:b0:31d:7326:c3a7 with SMTP id
 586e51a60fabf-3c0f9e6cf08mr2106426fac.41.1759941452818; Wed, 08 Oct 2025
 09:37:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008160452.1741-1-briansune@gmail.com> <53ba5ea7-ab5f-41dd-853e-2e39efac1321@opensource.cirrus.com>
In-Reply-To: <53ba5ea7-ab5f-41dd-853e-2e39efac1321@opensource.cirrus.com>
From: Sune Brian <briansune@gmail.com>
Date: Thu, 9 Oct 2025 00:37:21 +0800
X-Gm-Features: AS18NWAYTOqZvGmx4yJdLmScGm9q6udXotXVi-6VyPjnhvEIYTAODrr7GQZj2Us
Message-ID: <CAN7C2SDzMS=uk7Qvrw4M6UP5MHgYnvSSZGuMs6OAHTWxBjqUUQ@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: wm8978: add missing BCLK divider setup
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Fitzgerald <rf@opensource.cirrus.com> =E6=96=BC 2025=E5=B9=B410=E6=
=9C=889=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:27=E5=AF=AB=E9=81=
=93=EF=BC=9A

> Selecting a lowest-error rate is not valid I2S.
> You must have enough BCLK cycles to send all the data. If number
> of BCLK cycles < number of sample bits you cannot send all the
> sample bits. So that would be an incorrect setup.

You had completely misunderstood my inherent idea.
What Mark is arguing is about the same as you proposing.
The idea from my side is that if you target 44.1K then the lowest error rat=
e
can only do 44k then both LRCLK and BCLK are follows.
Both bit and clock are divided accordingly

>
> > On top of the overclocking,
>
> Using a higher BCLK is valid I2S. In fact, it is exactly defined in the
> I2S specification that there can be more BCLK cycles than data bits
> and the RX end should ignore extra cycles.

Again, this idea is completely incorrect from first place.
There are codec allow to do so doesn't mean this is IIS standard.
Again if this idea holds then why not simply use a faster clock at anytime?
Then this patch also make no sense from beginning.
BCLK faster will always be okay, why setup the register then?

> > warning message is given to user as a reminding.
>
> Warning the user that you selected the correct BCLK is strange.

Warning message is based on what you are trying to setup on the codec.
if the background is based on mclk is fixed and bclk and lrclk is
divided from mclk.
Where bclk is follows lrclk to commit  the final closest audio S.R.
I.E. 44k1 48k etc. other than that if the setup can only make closest resul=
t.
BCLK is fasted and LRCLK =3D BCLK/32/2 then the result of cause is not fit.

> > This patch author do not agree with this design nor
> > concept from first place!
>
> For example if you are sending stereo 16-bit samples at 48 kHz you must
> have a BCLK at least 48000 * 16 * 2 =3D 1536000 Hz.
>
> If the _nearest_ BCLK is < 1536000 you don't have enough clock
> cycles to send all the sample bits.

Again from the very beginning comment BCLK / channel / data_bits
result in a slower
S.R. aka LRCLK then of cause it is not fit.

Brian
