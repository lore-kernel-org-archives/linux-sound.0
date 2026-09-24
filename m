Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0E473C67
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247869; cv=none; b=gpIHe6SYjd5hvCOgCnkAb+3F2d2eu6jpGUBzh9iOvKU85q8JzNXE0s2m8x0B8U6R3g8iYK77vK9DujfQ8nC5DDoNsNJT3oLlGs0ceYMTEsur4s25FPiI/F2qu5wnOn6d9guozLPbmFnfTBmtP9K44hQdM9GIuUz61j64T1zp0Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247869; c=relaxed/simple;
	bh=xz5bwAgVE7qTepiKE8OlbrQBKG8VLxrreAE2auvrnIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mIsoHVtXliRF+9cuH5+kUGNcxwRRMaPtGCrjRg/OlDnym/+aA/mszFoN3YdYb+n3zJfed8mJcDFrYyXKRRBXTF84Qkyj/7rTz1A1SeWeWn/dmPy7VwvMWXjuda6HRuMKYDRp5acDj9tvC4lkRyvRKBV6mjVXT4jmvgpEXKG/leI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUjND3vB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUjND3vB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA411F000FF
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 11:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790247868;
	bh=YJWFnpmGuKQdcj3EBBzF/7yahGxSn2KCUNK04VLhlaA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PUjND3vBWPVcIfkDOFl+K6Yeb496QrhI1+K6Cv+nbKgxYaKX4rnNtXEAxGglgAFBB
	 x3yHBFmSev8uGzCe9sHwMmqbg+vKCY7qiPIb/L95ETQeSg2whzDMZ55M5LGLjyqsSB
	 U5r+47M7qKr+jK0VlQN6weZgYhRA3DGKRrh+JqJ1W6Ta/ZUV85zQihvwM8q2tgiex+
	 8MhdyhUnw1I0jonr7WWSOCDcZjWJ2427haQgudQ+GSUtzqN+I830mnf2KHxJvCkEti
	 u56HGFoCWz7BgB/LGH8e+Eug1f9dyQpBO7BTlIdSbnISFBzMJ0fO5yyKfaqbt3Plpc
	 FQSPO1I0oLqaA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so2313904e87.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 04:04:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3/iPaf8sjkDKluuRuICc/+cwzU+Z8me5/lRpp1WTINWtDvobcixnHhf1HJDNairnd4N4QvFynK5bG2g==@vger.kernel.org
X-Gm-Message-State: AFuF++mt25D35BYcUJNwji91oLdopHygr0Nt1iLvY+Uulhcdh8mb+pYw
	mXUSwL+4x2Q4tmy9zERt0WtA45Ojgaxk5FL0zAJ5KlG6p/dqeEAFkvL7ZYHyEiJRffufxXHCpS7
	oS+AIOLzJsEigjGbDkLa0iBsrItI2BzE=
X-Received: by 2002:ac2:4574:0:b0:5b6:962:4ed2 with SMTP id
 2adb3069b0e04-5b8df04cf73mr536889e87.22.1790247866915; Thu, 24 Sep 2026
 04:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
 <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com>
 <20260924065449.GN3864833@google.com> <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>
 <20260924094420.GA3849155@google.com>
In-Reply-To: <20260924094420.GA3849155@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 24 Sep 2026 13:04:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSsiMTVVX2WRWS-ACyaX+mMe+sfjqkZWDBvF9SWCCFOg@mail.gmail.com>
X-Gm-Features: AclHuK91sMP2G7yCemn-SFUSJa0zaXI4PhUu6TRM6YLsNwig0ItCJbNQOJQqUOI
Message-ID: <CAD++jLnSsiMTVVX2WRWS-ACyaX+mMe+sfjqkZWDBvF9SWCCFOg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
To: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:44=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
> On Thu, 24 Sep 2026, Linus Walleij wrote:
> > On Thu, Sep 24, 2026 at 8:54=E2=80=AFAM Lee Jones <lee@kernel.org> wrot=
e:

> > > > Assuming Lee will apply the ACKed binding patch so I applied this a=
nd
> > > > the rest of the DTS patches to the ux500 DTS branch for v7.4.
> > >
> > > Right, but it's not Acked yet, is it?  Or did I miss something?
> >
> > It was ACKed under a different Subject: so I resent the patch
> > for clarity, sorry for the mess.
>
> Are you going to tell me what that subject was?  =3D;-)

Sorry!
"[PATCH v3] mfd: dt-bindings: ab8500: Describe codec graph and
microphone wiring"
https://lore.kernel.org/mfd/20260923-ux500-simple-sound-v3-1-56a771c3ea28@k=
ernel.org/

Yours,
Linus Walleij
