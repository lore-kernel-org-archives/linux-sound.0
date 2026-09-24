Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B7044C4F8;
	Thu, 24 Sep 2026 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243073; cv=none; b=jEXvNctXObJ5dtFxCt8XWXOXaoOoGgwgqmYXL4o6ZlNR9EA6WkOnlSbRx6wtnqp0OgVDlcE3Pjn7BqhASZ/3Vmz6aklasq12uan+IltDDiBMmMXigFmH8GPd9WGOAdw3uDZEdY4v9X+HKNHCki2a3XHrrE5cBWjFvnZSRUtnh+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243073; c=relaxed/simple;
	bh=Bklt/lBn2Ai1XEG7ghAX6pydy5cFRHz2SINOS/FJ7gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgrtQr8/9FW2q8YtsWyCW2XDdFDn+4v15T5mCF1mKuJntVLxUG0OepCeXfSbAcH6QeBsFC8OvniVtSKzgu4knupKKu+sd8EGRvy94PK4DpsI3pUaP4MIvyJkCNQk4K2wTJ8GBjnGwdYrrt9/L301Q0yRbse1qxNCxLnAjka+QOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5P5deiR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5P5deiR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5071F000FF;
	Thu, 24 Sep 2026 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790243064;
	bh=cM6GfKjgEnG0sVqAPz+FlJCa9DHDAX4z1zJYJsuiWgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I5P5deiRUq9UlqEoPBmwvvQhiP0FySIWkBF2YMwQPhp5FeXxLEkr5zi/42rn1oZbK
	 NBl8/CgJdkw/WO6ZDDZ9X+cc7GgnoSIjCBB5G020q1kVwc2+u5rYeqBLGvi+I1f2Rz
	 AkGobkRY4KdALUx5M7Y53/qnQyIFTlsmlKsohnprq8onB+KnZuwYmcyPI9BG6V9nEi
	 iWRNafcPNUN/u2Y2qvE1Tcykz0Tyvyp8Um8yBJ8GxWk5m4pgqEBGPiQDwUVc+N0mXR
	 UkVlON+RxAxVpUiVc3JLk24qyl8cVkoiatJe50DjdHwJtqCw2kYOLIHwnL+m4cfK0b
	 HmMgITS/4Lcbg==
Date: Thu, 24 Sep 2026 09:44:20 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
Message-ID: <20260924094420.GA3849155@google.com>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
 <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com>
 <20260924065449.GN3864833@google.com>
 <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>

On Thu, 24 Sep 2026, Linus Walleij wrote:

> On Thu, Sep 24, 2026 at 8:54 AM Lee Jones <lee@kernel.org> wrote:
> 
> > On Wed, 23 Sep 2026, Linus Walleij wrote:
> > > On Fri, Sep 18, 2026 at 12:51 AM Linus Walleij <linusw@kernel.org> wrote:
> > >
> > > > Describe each MSP as a single-DAI provider and the AB8500 codec as a
> > > > two-DAI provider. This lets audio graph endpoints resolve the MSP DAI
> > > > and select the codec playback or capture interface by port number.
> > > >
> > > > Assisted-by: LLM
> > > > Signed-off-by: Linus Walleij <linusw@kernel.org>
> > >
> > > Assuming Lee will apply the ACKed binding patch so I applied this and
> > > the rest of the DTS patches to the ux500 DTS branch for v7.4.
> >
> > Right, but it's not Acked yet, is it?  Or did I miss something?
> 
> It was ACKed under a different Subject: so I resent the patch
> for clarity, sorry for the mess.

Are you going to tell me what that subject was?  =;-)

-- 
Lee Jones
