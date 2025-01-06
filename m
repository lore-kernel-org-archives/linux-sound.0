Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53B1DE4F3;
	Mon,  6 Jan 2025 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172948; cv=none; b=FsY9oEzHCtugfWS+/4dQvSQZRHgAblt4Ipi/HfH+9trwx9OApx0JW2LSOYr5tUJ8cLGTAeiXbk3vZj2LVAnTtggW98+On2+bNgi+ESTyilCAWyIY3cXhXvk42lf/JV6SOgbFryOwY8x996hIuuTCB6/ZIjF1WAcOspyKi8cPvEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172948; c=relaxed/simple;
	bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZ7/I6jhZbI3Jt/UynYxbw7u2gr15TPMj6BwVJxb5E2OBeHVHiG/CMBu8mZt8cWlblS8Q6onJcP7dqJnMRLoEMNEwOCWbkcU+NVzuBEGKWRKnKHdBmNCKXDTnNGijeY9wMtBXtpUS3oMN7VjqUKysg0PNBsZp710DRoeVKHAE5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=B5F+W/Do; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="B5F+W/Do"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2166651f752so7343755ad.3;
        Mon, 06 Jan 2025 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172943; x=1736777743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=;
        b=B5F+W/Do1oCPmzikP5ImjCS1KuK4uChQboSpZOW9ufBgtW/n8jMcKf5SLUQWwd35QL
         9d1zaNWlbhxtoR/DgM/feS8qIavjbsWjVDRdMCldE4Z3IUsQPZkRctNsJSkxapLApzWi
         C+/ewSyGj9qnsEmlZe/aZBLEkkMA0aOEhq7YDrneBSoNxKadwei/SuskF+HhfAYIo81F
         4Ov2BzfdpM6q8RjeqGnSVAsl1jz2skf4//w4HSI/zuHN3/qR1tKeYlBkjSK4pKLMt3WL
         ZV8IoeLk7Zz0yhLZEgqlYRiD9+e0LdF8gb1/0xfqLCBgpLqEG4kwSdClRfA41HvYB2na
         Jk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172943; x=1736777743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=;
        b=pz2H4kgMk74jULkm+tOBz9UgQLLkd9vz4XTXwoFWWAan9fJsBgbXZHMPqbFzaMmmGY
         BQd4SOQgPeO8F679TEyPnoF5XIQm2YnIyDg/AuiGT60tFJ48tlK9VPWjK/JbpWKa0C7x
         ZsQAm5NPFC2I7BhTolopHvC0NohayjA1bFrO1Rru4fcnilmE1Z7fLptcls5pGMvanaX3
         qcspO3s+ZLyZMXDvneUXcyTuHIcl4eP2Y7CA2zCdCXj1ZRThtUt1UX6/GJXOXtoEfYH+
         LSZE8d17rr1gnhnUT5K6Xz7yVWqajSjO90RmpWsL3MIYmJqa4sCaenWkYMb2uVPn4SqX
         ouZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoKFLbiqjnUse58Shi3IUEJSQdFAtth0sEX3hbgAJLX4cL2MnQi0iRnmb5IBfNc1wuvIMUQusHF3U9XUI=@vger.kernel.org, AJvYcCVsraZfIz34Ujh2dY6liMmX6ufmZvgdblTv3N0jvEEp2CtPUpWduEbP4lpjSeldxUrVUHvgn+aESALdpjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Om3ZwVLGmtrgYda5K8KZUgdKDRr3ejgRGpwIqwh8HP2xkbFR
	qKxaODLOMn0L7qhu6mJ+zHwSmHISOcbyeFDddXzQNo7SHSJpyQjZuuxfIJoUdA69wovTtXnWcjF
	Vrfb1VLaR9qMQbckUWPsTvk24rkg=
X-Gm-Gg: ASbGnctJguaEgBRjkPGowa+1LGNpnsmlb9w6RT1MokZnJHd4fYrTUIgfrbXzIapD8Gb
	G3QOxH0okZT+D7SymWBMvKWjFcFfNOoi32VtwQXGqDxsXBc1iqlE8
X-Google-Smtp-Source: AGHT+IFEBZJtpqODTcd07D9FVHGKDHkir6SlF3wADzh7P9HVYIG39voEOtEnlLVDhzsY1eefQ0fPozBDVZGOUWxSTaw=
X-Received: by 2002:a17:902:fc84:b0:216:356b:2685 with SMTP id
 d9443c01a7336-219e6e8bb95mr915796815ad.11.1736172943446; Mon, 06 Jan 2025
 06:15:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com> <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
 <1j4j2caxds.fsf@starbuckisacylon.baylibre.com> <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
In-Reply-To: <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 15:15:32 +0100
Message-ID: <CAFBinCBLPFPotAzf_5Pdk1we9ygZdMagOEfnNBKWuCm-20iYHw@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 2:38=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Jerome,
>
> On Mon, Jan 6, 2025 at 2:24=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.co=
m> wrote:
> >
> > On Mon 06 Jan 2025 at 13:49, Martin Blumenstingl <martin.blumenstingl@g=
ooglemail.com> wrote:
> >
> > > Hi Jerome,
> > >
> > > On Mon, Jan 6, 2025 at 11:44=E2=80=AFAM Jerome Brunet <jbrunet@baylib=
re.com> wrote:
> > > [...]
> > >> > I have further verified that the gx-card parsing does find the HDM=
i
> > >> > controller and links it correctly.
> > >> > To me it's odd that only the .prepare() callback is not called, al=
l
> > >> > others (as mentioned above: .hw_params, .startup, ...) are working
> > >> > fine.
> > >>
> > >> I think the problem you are seeing comes from the quirk of
> > >> codec-to-codec links. The hdmi codec link is such a link on Amlogic
> > >> because further digital routing is required after the backend.
> > >>
> > >> Those type of links are not used much beside some
> > >> CPU offloading on Samsung and Amlogic, as far as I know.
> > >> It is possible, even likely, that things are still missing there.
> > >>
> > >> So those C2C links are operated by the DAPM events, not the regualar
> > >> ASoC code. You can start here:
> > >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/sound/soc/soc-dapm.c#n3995
> > > Thank you - that is indeed the root cause!
> > >
> > >> You'll see that .prepare() is not called, same as .trigger()
> > >> That should propably be fixed :/
> > > Since I'm still very much clueless about all of this I just came up
> > > with an experimental patch. Any feedback on it is welcome (I can send
> > > it as RFC patch - but prepare for me needing support).
> >
> > It is probably a good idea to send it to get more feedback, yes.
> Sure, I'll do that later and keep you Cc'ed.
patches are sent (with your feedback applied), let's continue in [0]


[0] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blum=
enstingl@googlemail.com/
