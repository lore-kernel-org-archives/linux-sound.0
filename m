Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D5E3C661D;
	Fri, 14 Aug 2026 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786738688; cv=none; b=WXM5UzssxQiE0Gznj2+BC6lewVKSUCJZHo/Gq5cyN/senWrzMngSZC3nkhguyDYQjPT/yDLnMCzhMwxue5njiivYfvt4rB28DuaU6sH2QJTV7tuxDez0s8mISQZIUiKRDZVGnK7OVPQ1x+WtuqMzAy1HfLE1BOWipYwvPVpxzr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786738688; c=relaxed/simple;
	bh=ItqUVC67yhzB+kYS/w+PEv43myyEK386fJ9fnQIqQ58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8S9HqzVYuRTAxoHYdkegF8EO+nAgIHzI8yk+wMiaWrhE1Wh5etFM4ZJRsIrE5mRJ4PIKrRGKMOQFqx040KR1W86oRGP1X/HO5a43p4K0JusBDhlf/78pQjNkg2WHbYFpFncPjgmuBbjsd/R5VV/UqaN2+1Mo9WlP8yC9jdgAjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7S0NHd2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7S0NHd2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00ECA1F00A3A;
	Fri, 14 Aug 2026 20:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786738687;
	bh=Imz6CUSjREa7uZWu186ap/XfqAiaJ0XB3CzccTNztnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h7S0NHd2kmPZTG9Zh+rH7XlJ+pKn4+9yUya3gIEoXNQMYqdtJvtrN5ncNifI0iz98
	 zc7TpQlovY1ihHdbHD5IV3CAhPH/CzvIkT3kfRXqkKV2DSW3lmXPmxkdjs1tivqhSX
	 REZj8Xh/OOPhHMdOdxyqlHgJJshpQqPynxYoOrE2b9dn8hM+bVssUN83Y2HfHPB6eh
	 hkhJm0yzkH67w+FZ0kN2qqXmHe4y3CcCoCtsK2qy8zAyzHXEb7w/9VH9v+wNdWBjaX
	 l4OBH+JrEV/gBPAPek3w4osaHyiqKoTeo08iLSgDX074+XuJQ/nrQUYLRYkQ3GzLwb
	 gfvHdIEHSn/vA==
Date: Fri, 14 Aug 2026 15:18:06 -0500
From: Rob Herring <robh@kernel.org>
To: Peter Rosin <peda@lysator.liu.se>
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com,
	simona.toaca@nxp.com
Subject: Re: [PATCH] ASoC: dt-bindings: tse850: Convert to DT schema
Message-ID: <20260814201806.GA2839748-robh@kernel.org>
References: <20260813-ti-axtensia-v1-1-768a1089fd5f@gmail.com>
 <d473d13e-bb5d-4d9b-b647-25a0b1b35364@lysator.liu.se>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d473d13e-bb5d-4d9b-b647-25a0b1b35364@lysator.liu.se>

On Thu, Aug 13, 2026 at 12:51:31PM +0200, Peter Rosin wrote:
> On 2026-08-13 01:33, Bhargav Joshi wrote:
> > Convert Axentia TSE-850 audio complex from text to DT schema. No
> > funcational changes.
> > 
> > Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> > ---
> >  .../bindings/sound/axentia,tse850-pcm5142.txt      |  92 ------------------
> >  .../bindings/sound/axentia,tse850-pcm5142.yaml     | 104 +++++++++++++++++++++
> >  2 files changed, 104 insertions(+), 92 deletions(-)


> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/axentia,tse850-pcm5142.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Axentia TSE-850 audio complex
> > +
> > +maintainers:
> > +  - Peter Rosin <peda@axentia.se>
> 
> Bzzzt, this is no longer the case. This binding is orphaned (as is its
> corresponding driver).

So we can remove them?

Rob
