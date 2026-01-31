Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882FA35580A
	for <linux-sound@vger.kernel.org>; Sat, 31 Jan 2026 13:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866203; cv=none; b=Ky+CecfFSpv4khJa9fiGdDYyqwGVAT2o+S/TY54dMVu9J+C4bmVpCofSvcPNVx8yTZo9tOL4Xh4WfcXccB8gDG1cYzkNLSFlzpGRjIArPuRhMNasOptuyvi4rfdwqKFOmwNk+za274Z3CSs1+CmMMNCcU2H+gIFRy8j+CkeRMJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866203; c=relaxed/simple;
	bh=RhWmI0patvLn+/TlH2PszTLrMbjXloqg4IGIq88mY4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=txfYmIZOFqyouSBzasJ3e604gXYF18Mxh1TGoBbcVZQPGT9pH7qBl2AOdrXzjxHgKcYWULaii4FDw+3LDe7mzHQT0IY5OJTjZzewbtRs/u+ae808qYwcNFhrZe5H1m20TL/5eyl4A+T4lUFYJf70RIJFLKMUvKEYptmOzjVI4QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gj+zUoB5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gj+zUoB5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548FEC2BCB3;
	Sat, 31 Jan 2026 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769866202;
	bh=RhWmI0patvLn+/TlH2PszTLrMbjXloqg4IGIq88mY4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gj+zUoB55WW+2Zoft3uYdnoPjZPC0CWZW4LUhViPLjSJccHLGKwH9sEgoA3ohyqb5
	 cM9uGuKv/9aso5SHIB4B6Hap/j/XHvWSrabZJfrCjuG6l6UdFDI9V1J3fBUmJwQy6C
	 uEYDI8H11QLzXHElGKTGHl0a6HJbB06dAg4Il+7LUwL/4cWQgp0L164F8hyO7cNEca
	 yxKcfylPzaHnYglLpLYJX3+yywuHOC0VcwcsLeW8h0jMc1uhs4cUTUZj7l3J0BnfjK
	 c1584FHU/Aqqu/lnfQCEXDzJG0VjB0EDDSHpgAQNv4x6AGxwmPPry8bLTG8NQO2vr7
	 D9yoBXUcYVIyg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 104161AC56A2; Sat, 31 Jan 2026 22:29:57 +0900 (JST)
Date: Sat, 31 Jan 2026 13:29:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>, Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <aX4D1VodQ8Ksrad6@sirena.co.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YrNR+3l/Y5P80pbU"
Content-Disposition: inline
In-Reply-To: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Think big.  Pollute the Mississippi.


--YrNR+3l/Y5P80pbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 26, 2026 at 06:41:50AM +0000, Kuninori Morimoto wrote:

> I think keeping cleanup/update current soc-pcm.c, and makes it more modern
> style is impossible or very difficult, and/or it may become irreversible code
> in worst case.

> So may I suggest to create new soc-pcm2.c, like below ?

> (A)	  soc-pcm.c
> (B)	+ soc-pcm2.c
> 	  ...
> 	  audio-graph-card2.c
> (C)	+ audio-graph-card3.c

> All existing drivers uses existing soc-pcm.c (A). Nothing changed.
> And create new soc-pcm2.c (B) and new card driver, for example
> audio-graph-card3.c (C).
> audio-graph-card3 (C) user only can access to soc-pcm2 (B).

> In this case, existing user will get zero damage from new soc-pcm2.c (B).
> We can just remove (B) and (C) file in worst case, it is easy to rollback.
> But what do you think ?

So, as we disucssed in person on the one hand this is obviously not an
ideal way of doing things but I think in this case there's so much
fragility with the current code that it's difficult to do anything
safely which makes this much more viable.  It minimises disruption to
users of the existing code so we get much less stress all round,
hopefully in the long term people will convert to this code and we can
retire the old things.

> In my understanding, current DPCM searches path and power via DAPM in
> runtime. Because of it, the code become very complex. We would like to have
> more simple style in soc-pcm2.

Well, the big issue is that it's sort of partially using DAPM but DAPM
doesn't have full awareness of the system including none of things like
SRC.

> This means, user need to understand Codec circuit and/or board schematic.
> Even if the path setting was correct, we can't get basinc sound without
> each volume settings, because default value is zero settings. We need to
> setup both "path" and "volumes" to use Codec.

> But it is not realistic premise IMO. I don't think *all* user understand
> it by themself. I think user don't need to care detail of HW. It should be
> handled by Kernel (= Kernel developer), not user, at least basic path and
> volume settings.

> At least, default path and default volume should be set by default without
> any settings from user, I think.

I'm not sure I'd go that far.  The trouble with setting a default path
and volume is working out what a suitable setting is for a given piece
of hardware - the really common case where this is a problem is that
many headphone drivers can also be line outputs but the volume levels
needed for the two are vastly different.  That's why we currently just
go with hardware defaults for everything, it avoids trying to code in
settings for a specific system.  It's clearly not ideally helpful for
users but it's a lot easier for them to fix problems with UCM than it is
for them to fix problems using the kernel.

But that said once the code has a better understanding of how things are
wired up prehaps we can have some algorithm that can try to guess a good
default, possibly something people enable optionally.

> So I want to reduce amixer use case as much as possible somehow.
> Not zero, but volume control or some kind of feature
> (= for example "noise cancel") ON/OFF only, etc.

You also get fancier systems where the users really want to fine tune
everything, mobile phones are often an example of this - everything is
very closely tuned for the platform.  The end user never sees this
control, they just get a volume usually, but the people dealing with
ALSA do.  One of the issues we have is that we're catering for both end
users who just got a laptop and want to use it with a generic distro and
system integrators who are building something where the user is only
ever going to interact with a custom software stack that the system
integrator has fine tuned.

> In Codec, each [x] connections are handled by DAPM, in my understanding,
> but we don't have such code for CPU side today.
> I think DAPM is for "Power Management", but is same as "routing".
> I think we can expand it or create similar system for CPU too ?

Yes, that would be ideal.  The power<->routing thing in the name is that
we're trying to minimise power usage by only powering up the things that
are needed for the currently active audio paths so we use the routing to
figure out what needs powering up.  It uses the routing to control power.

> Anyway, both "graph" and "routing" are fixed, not changed after boot.
> No need to search path in runtime in this idea. So no need to call amixer
> (for path setting. It wil be setup from inside kernel, etc).
> Above "graph" is good match to modern Sound HW ?

The graph is generally fixed, where there's anything changing it's
usually just something being plugged into a port, but there's systems
where the routing can be more dynamic.  For a really simple example a
tablet might flip left and right speakers depending on which way up it's
being held.  You could do that in software with a DSP but you could also
do it through routing in the hardware (and depending on how the DSP
looks it might look more like hardware to the host computer...).  You
also get things like routing around some effects blocks depending on use
case, just turning the effect on or off might mean the effect is still
causing latency so instead it's disabled by not routing the audio to the
IP at all.

My impression is that the systems that need to do dynamic routing beyond
just turning on and off some paths are getting less common but they do
still exist, and older hardware tends to stick around for a long time at
lower price points (eg, you'll see what was once a cutting edge CODEC on
a board with a low end SoC because these days the packaging it uses is
much more easy to assemble).

> Bad point is that number of "routing" can be explosion, but it is very
> rare cases ?

It's definitely rarer that people want to be really flexible at runtime,
but it is a thing that happens.

> I know this is not so good idea, but how about to have only one lock, like
> "graph lock" ? This is just opinion, but having one large lock is not so
> good idea, but better than very complex and un-controllable code.
> I don't think .trigger and .hw_param are called frequently in the same time...
> Yes, maybe realtime side can be problem though...

I think that's a good place to start TBH - it's pretty much what we have
for DAPM with the DAPM lock.  We can always go back and rework things to
make the locking finer grained but hopefully that's not needed, we just
don't need to do things that take the lock for long enough or often
enough that people get worried about contention.

> I think we can use existing Codec driver as-is in soc-pcm2, but, CPU driver
> needs to be re-maked (?), especially DPCM user. But not sure...

I'd definitely expect way more impact on CPU side - ideally the CODECs
would be unchanged, but if we need some updates it's not the end of the
world.

> If I create soc-pcm2.c, I will create sample CPU driver and its sample DTSI
> file, like ${LINUX}/sound/sbboc/generic/audio-graph-card2-custom-sample1.dtsi.
> People can easily try/test it by just including it in your DTSI file.
> No HW / no implementation is needed for testing. And I think it can be good
> sample code to create new CPU driver ?

Yes, being able to work on this without needing some specific hardware
would be great - it's one of the big drawbacks with DPCM and one of the
things that make it fragile.  If we can get a good development and
testing setup that allows people to do work without needing to worry so
much about what other hardware will be impacted that would be a massive
win.

> I have indicated many random topics, but these are just my idea.
> My motivation is I want to cleanup ASoC framework, but can't on soc-pcm,
> especially around DPCM. There is no guarantee I can create soc-pcm2, but
> have interesting. But what do you think ?

I'm super greatful that you want to spend time tackling these things,
I think this is heading in roughly the right direction.

--YrNR+3l/Y5P80pbU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml+A9EACgkQJNaLcl1U
h9BsAwf/QctO/ZtTs4g85uLOsoBiTNPf/lu307Nyj3vdJ+y0/2EvaGWHZkiIiORn
Q0ghmHMaM34/biz0UZn5Xm3ICvqoKFenIH+56Agu1UE1flcrkYMcLe2CXZG+wawC
bXSY9sypHekJirUThN24dLWL8Q+QxyXtoowqwMzq7WlnsYWzL+zBa5BYe5Z7eLoS
xhGYW4OaYu7YUHEdDtQIj4uLh+g+FJ9wcJpZgcESxhh1Q4CMlG3qAqd9d5JIPJKF
0gA8q+NFotyahgcoqDx9Mc13FsRpOCxbSYVaI1Kf1yOulx2ZmM6UatVww/K4LJeQ
NXA2W7iPQLMSuxVKU911iDWK4ldOfA==
=rGIM
-----END PGP SIGNATURE-----

--YrNR+3l/Y5P80pbU--
