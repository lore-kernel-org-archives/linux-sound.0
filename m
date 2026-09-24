Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1A33A9631;
	Thu, 24 Sep 2026 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790259743; cv=none; b=a8E6LzYddav8WtmMWglUXLTlzvQzbdZvB52cM7vlmirsuaKqlhR4wRhkhZ0DuBhOqTSv0HqsnQkJ+LX5RBOeskLLMV17Jy6TIsKLOclW/tEFWaShaPv4NcFsr0jXUiWdSmUe3bskbLl98Itu0kFGNF2SqeEIHYVTHHMpNcd1FmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790259743; c=relaxed/simple;
	bh=pv/yplGgxmdj+ZIlNORb/ncWgmSKZY8kOQafD3dc2IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhua4DLsFMtTzIsRYX9l5voOBfqEf6UwXIw+COO+HD0QFVCTvC8+JtRTovI+509hitKzCAPRNBezWvKKpFsY1SXIo2shBBOIXqMYKmW0GsFwZCdmK99AE89KUhuRLvaC3gdoIxU8DqF25OaZt2tRZdHDHR66xURgVpXt2ba1R0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHWmv/VZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHWmv/VZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0591F000FF;
	Thu, 24 Sep 2026 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790259737;
	bh=69wWaTF7qapLVuqtlZBe20mgRU1XxxJj98H4LZVmop8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gHWmv/VZyUe4+vg13ttIQcQkuGfkZMLy479ubOBsftGvEgAMWVIOfcGkrcA/sC7Eg
	 J8ybmVD2lxH7a4LPjMDdsDjoTDLeUv7VfaYendwKT9GspHjREjYVfseemvYrlyQvYI
	 WXcwbsvslUlBC5/F12APD6eN2T6MbhsUNXMBsmGXP0EEYsv+OEZfB3v4D3rIEy+wMK
	 VRyzw2wtS8cwnj+ZIYb14YMf3UEYGBnXPnFqhgV0zeBzNCjDNRG+gWXuzFA88+pE9C
	 i0LAticRf6nEE17C2Hln9GIcMjsqYBfeVhKa+1dhVCUSusm+Kwv/3F5xTtzQQcqur7
	 g9BiOGppT9Nbg==
Date: Thu, 24 Sep 2026 15:22:12 +0100
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
Message-ID: <20260924142212.GG453446@google.com>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
 <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com>
 <20260924065449.GN3864833@google.com>
 <CAD++jLnbJnENbZuXyr6uoeHioCxek6ZZes_MyWk9MowBzuMqkQ@mail.gmail.com>
 <20260924094420.GA3849155@google.com>
 <CAD++jLnSsiMTVVX2WRWS-ACyaX+mMe+sfjqkZWDBvF9SWCCFOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnSsiMTVVX2WRWS-ACyaX+mMe+sfjqkZWDBvF9SWCCFOg@mail.gmail.com>

On Thu, 24 Sep 2026, Linus Walleij wrote:

> On Thu, Sep 24, 2026 at 11:44 AM Lee Jones <lee@kernel.org> wrote:
> > On Thu, 24 Sep 2026, Linus Walleij wrote:
> > > On Thu, Sep 24, 2026 at 8:54 AM Lee Jones <lee@kernel.org> wrote:
> 
> > > > > Assuming Lee will apply the ACKed binding patch so I applied this and
> > > > > the rest of the DTS patches to the ux500 DTS branch for v7.4.
> > > >
> > > > Right, but it's not Acked yet, is it?  Or did I miss something?
> > >
> > > It was ACKed under a different Subject: so I resent the patch
> > > for clarity, sorry for the mess.
> >
> > Are you going to tell me what that subject was?  =;-)
> 
> Sorry!
> "[PATCH v3] mfd: dt-bindings: ab8500: Describe codec graph and
> microphone wiring"
> https://lore.kernel.org/mfd/20260923-ux500-simple-sound-v3-1-56a771c3ea28@kernel.org/

Already merged.

-- 
Lee Jones
