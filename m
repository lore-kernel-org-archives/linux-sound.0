Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AFB1A682E;
	Tue,  5 May 2026 21:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778015409; cv=none; b=CTGIrz6ShlUaylDMm/jiMS8+7GeeE/29fu/ouvUPzeEUXz/86J+hMtzeZwZI1bWoP1Si2Qi+0mBV2fI17TwBPPiMEzCzxMv3P7QAfjFfgg61Q1+Ywt3Zh1l4z5J5EOJv/NutXtcndQntcohHl6YUtKPm1uK9iHrFbRveo3nMKnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778015409; c=relaxed/simple;
	bh=YJRd4B8dBI7NnuwfxeAAKCP/9sHlFCzWsZu+lnLLO7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGLdC5UojPqPKzWaov990KwkxGx/s818IHEfj2DcfVKSxcur+n4j8rYePF+co6RboGiJwlIgInG/EtbwjNz2Y6xfAXBo/f6A0OWFEvlZY4I5kjivJaBKLQCo5L4xgv1R2ik6gtd5tDYpTGZzV8HdkA2Th76e/Kpc2hy1E10Ek2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIvLSBvl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIvLSBvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C20C2BCB4;
	Tue,  5 May 2026 21:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778015409;
	bh=YJRd4B8dBI7NnuwfxeAAKCP/9sHlFCzWsZu+lnLLO7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIvLSBvl1Cpo4rpWBWXR85ZTXl2vG6EzcWbfoLxY7dK0d4JlrAtBNLJr3Ocuy7W+P
	 OUu/mHrbIYpCgGiCHL9T0/v1sCpPvGHtqudcd9d1LHTAF5/db9dL6nv/sY5hT+BgnT
	 2d+QtWiXpqrejubxHb0E+BDSgQJeLVuXeOUisTeqYdeAtxIA4VP6942dl1Fqj0wmzB
	 KqxeJwZsQX4v9oGzBvEAQFRsl8LBKZ2iytOeCQJ3jBov4AnIQ/nzy9MYeB2SO/h+S0
	 cY4fBa9rDHQ2PyWJkwHLDm3s4P66z1Z6ePCI8MXAdt9AfNllldpwDeDs52UPBt7zwo
	 Hn7WmEtXAhllg==
Date: Tue, 5 May 2026 16:10:06 -0500
From: Rob Herring <robh@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	David Rau <David.Rau.opensource@dm.renesas.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source
 definitions
Message-ID: <20260505211006.GA3875657-robh@kernel.org>
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
 <20260423042831.21114-2-phucduc.bui@gmail.com>
 <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
 <CAABR9nGH4yZcgyzm=wNYVHB2vLhojZJSHKOC6dSeQPm0rbh4KQ@mail.gmail.com>
 <ce219aa2-0bb1-4a74-b40d-bd753f1a22dd@kernel.org>
 <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAABR9nHaGBU9KAWJZrnBy8HO0Waccp8CCGmBdKJ3QOEb8WZsXA@mail.gmail.com>

On Thu, Apr 30, 2026 at 12:12:55AM +0700, Bui Duc Phuc wrote:
> Hi,
> 
> > Yes. And the ABI. You cannot have ABI which has an incompatible
> > implementation. IOW, when implementation contradicts the ABI, something
> > is wrong.
> >
> > The question of course if read_bool() is here incompatible. From the
> > actual code point of view, it is compatible, but how it is documented
> > and how it is intended to use: it is not compatible.
> >
> > Also if future schema-kernel-ABI checker gets implemented, the tool
> > might report here a mistake for that reason. read_bool() means property
> > is bool.

It is doubtful such a tool would do per binding type checking given 
types are global and we've avoided making types per binding so far.

> >
> > > If the hardware supports wakeup functionality,
> > > referencing the core schema is sufficient. Hardware description should
> > > not be constrained by the current driver implementation
> > > ( e.g. the use of device_property_read_bool() ).
> > > Bindings should remain stable and generic, while drivers can evolve over time.
> > So you claim that bindings can define property as integer, but drivers
> > can evolve and for example read it as string?
> 
> I see your point regarding the ABI semantics and the intended use of
> read_bool().
> My understanding is that the I2C core currently uses of_property_read_bool()
> for wakeup-source as a presence check, even though it has no way to
> determine in advance whether a specific device will define the property as
> a boolean or a phandle-array in its DTS.

If this was a problem, then it probably would have been fixed already 
because it generates a warning. An I2C device probably isn't all that 
coupled to SoC power states, so boolean is probably always going to be 
used here. But maybe not.

If we do any cleanup here, I think that should have exactly 1 location 
that reads this property instead of 77. Perhaps the driver core can just 
handle everything and drivers don't have to deal with it.

> >From a behavioral point of view, switching to of_property_present() would
> not change anything, but it would better reflect that the driver only checks
> for the existence of the property without assuming its type.
> 
> If the expectation is to strictly follow the binding types, then
> of_property_present()
> seems more appropriate here.
> I can prepare a patch accordingly and send it to the I2C maintainers for
> review and feedback.
> 
> > >
> > > Re-defining the type locally duplicates the core definition. If the
> > > core schema evolves,
> >
> > There is no re-definition here. This is choice of subset of types.
> 
> The flow is: core schema → YAML binding (ABI) → DTS (actual usage).
> >From a high-level perspective, the binding may appear to redefine the
> property type by narrowing its scope, while the DTS selects one valid
> representation from the permitted set.
> 
> > Where is Rob's suggestion to do such cleanups for EXISTING code? I only
> > see that new code should come like that.
> >
> > Anyway, your commit msg is for me incorrect because it misses all this
> > points I made. Whether the schema code is correct, I'll defer to Rob,
> > although I still claim the same I claimed before at v2 or v3 of your
> > previous work - this should have defined type.
> 
> You are right that Rob did not explicitly request cleanups to existing code.
> I included them to improve consistency while working on the new parts,
> but for now, I will stop modifying the existing code and wait for
> Rob's feedback.
> Since there are differing perspectives, I would appreciate a consensus
> on the preferred
> approach before I send out the next version to avoid redundant rework.

It's really outside the scope of a device binding what is used for 
wakeup-source as that depends on the platform. So I think just 
'wakeup-source: true' in device bindings is fine. I don't think we have 
to change all the existing cases either, but the patches are already 
written so I don't have an issue applying them.

Rob
