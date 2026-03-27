Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6F034EEEE
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651849; cv=none; b=MBF5QsiG8zco41TEz7MgN1Bp0z3SORFyf8SuMhq/Wz7PXc9+31/0pedogRWULxQSqkTeNTXRIZuAf6Ug0hLKKtGAJuSTLUfi1XcYLuu15OpG+18L+BvJNTehISlz9prnE1h3PImHXW93rmTKek/4Hgo6faYIiy+pp03Agenyn6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651849; c=relaxed/simple;
	bh=0eGc8ssDw2nhR1hlhrKYnnwf3OeDSalYxD5Yo1jKxLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHVUFTyDHiv9bYwSLMnTnVra7SpImNmp7mGNTyGgd6mgDE6X0WcaIydYatnd5DUJKFDThgIZc5crq3sLQrUOnW86+HQJkGOmFPifpYQSrozH+0uNrFMNHBE1UZiJmy3VY59tLgkWDwA7jaA2jefXU0i4eDFl0WrZg1KGaVM/Q94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxbKioEu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxbKioEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E8A1C2BC87
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 22:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774651849;
	bh=0eGc8ssDw2nhR1hlhrKYnnwf3OeDSalYxD5Yo1jKxLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cxbKioEur5duMrtyTAU1Deisj7mpKxAVdjRTEqyGnOdvZe4C67/XT5JdYoD4Kktf2
	 /TL8/98RRX7bLUVoIGGyY2dKW0mYOWYOpXjCgJ+QEFbKB14X4EHrhY8PHJ/gLQ17KD
	 ojrTRcwO0JL/R0QATnQQ5BfA3ojTdpF3QSBhMRJ19u5Ra4U6vVPJscGzkN7ED/DQhV
	 VvfhLy5WGEv6hO1zdGZaPu9zTqP9kT67vJNo07yHA7Y3njNXSzsZRRiXE0PXJvWP8v
	 vth126p9ASXZFFI9qNJEnos+zO6foS09VvepT50U+aDCw31WVdGn4Cf44OkP/5alqB
	 scAJev0wu+JTQ==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64e87a81639so2906182d50.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 15:50:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUakRU85cmydHiGKnXyDbPB27gnOz0xag5gt3l0U4TA7pprZAeR3u5ysgnNUptyI883LlG4G6cksdVdkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc0DcmAzOR0qoCWn9h+fz4J2JS90kKU0J5imS8qx59pQ4Ea9EF
	a9ATMxJrcII43l4r+XjQIgjVTBIN9lOHdAU6NJQ/Tp3MJ//DXUWwBdsG30uCPKJmPHVrgX1BAJO
	MLtI2FoTkH9LIPSC4Apx2ejrDVlWZjHc=
X-Received: by 2002:a05:690c:e0dc:20b0:79a:b118:4386 with SMTP id
 00721157ae682-79bde0fb879mr33317957b3.48.1774651848807; Fri, 27 Mar 2026
 15:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-asoc-wsa881x-v1-1-53dc05867e6b@kernel.org> <acbGBtY0zsPntsoE@sirena.co.uk>
In-Reply-To: <acbGBtY0zsPntsoE@sirena.co.uk>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 27 Mar 2026 23:50:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVa2ykiZcedui7a2PnAdSyVxnJEr4hpm-B4Bwj+R=sUg@mail.gmail.com>
X-Gm-Features: AQROBzAyjQY1OZCHAsqMvibuQZyLS2BoFTjTly-UOI7Q0JomPhqR4-3bqG6UXew
Message-ID: <CAD++jLnVa2ykiZcedui7a2PnAdSyVxnJEr4hpm-B4Bwj+R=sUg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wsa881x: Move custom workaround to gpiolib-of
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 7:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Fri, Mar 27, 2026 at 12:10:46AM +0100, Linus Walleij wrote:
> > +++ b/drivers/gpio/gpiolib-of.c
> > @@ -240,6 +240,14 @@ static void of_gpio_try_fixup_polarity(const struc=
t device_node *np,
> >                * treats it as "active low".
> >                */
> >               { "ti,tsc2005",         "reset-gpios",  false },
> > +#endif
> > +#if IS_ENABLED(CONFIG_SND_SOC_WSA881X)
> > +             /*
> > +              * WSA881 powerdown is always active low, but some device=
 trees
> > +              * missed this when first contributed. It also has a very=
 strange
> > +              * compatible.
> > +              */
> > +             { "sdw10217201000",     "powerdown",    false },
> >  #endif
>
> The quirk in the hunk immediately above (and from a quick glance all the
> others) has the -gpios suffix but this one doesn't - should it?

It should, let me respin!

Thanks Mark,
Linus Walleij
