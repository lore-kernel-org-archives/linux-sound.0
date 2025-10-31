Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C0345744
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 13:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761918577; cv=none; b=KpQMhMxyr08bep7o5RCUwIpz9gu6rLq2wiWtP48gCDYNHIzgxqvYuluxTvmD9RvmAQJYHNVjBRB0aHXbbytfjLTUnym+k8uUxRBWvXcleOtlBOGsKdm8GqwC9ElOEkh6ZDY2F7O8A2Aor0eHPVD54+CH2CELo76MohFurNJzD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761918577; c=relaxed/simple;
	bh=Mb3hdezO/zj39rJ6QPwR50iz2dpQPsf3E7iL8IUH5GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKGecpyVjPyWGa+SJwQSSg6dyGNrRv+y3HjtXWFNCYKqAwOeV8Yc4hasN9zYvcBaRRuHK32e9UznYkwDjRl1VryvPR57MS+Rhgiol2Zzge9udb7gvFJUlU8mhVtSvCs7M8+bYmWuX57fq8sZz0rknNW+v80C4oiVFbxZyNEmtu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixw1yZXX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixw1yZXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9A3C4CEE7;
	Fri, 31 Oct 2025 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761918577;
	bh=Mb3hdezO/zj39rJ6QPwR50iz2dpQPsf3E7iL8IUH5GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixw1yZXX9zCwH3E2bQI5ozTNQE3iXRC+sJuu5UAg1c/fxkR+OgHeV1jDVqE3arY7y
	 JQcTjhWzAIutWJMoQDKFycL27qR6b4MKLgDIoQDkZSSgc1BKjwEfO26CKja6TpkATi
	 UN6MkIEW9W5acC1b14jz3XrzS6BDWTXIjmViubSLoCZFsrzo5/23aUAqE7qsaJezvz
	 LNI9GH8lT2NWYnmSaPW0399Q7ssjMjiPkwUhnNEOWlDxf1CVTbQfOYNNAuG986/4dK
	 2BQN0DqXglBcpjV45KLdk0FZ5NbTnJJ4Qd7s67kV3xQJOjguAg9BhChCqgwIxSB+Qz
	 Je+zrB6EcPiZg==
Date: Fri, 31 Oct 2025 13:49:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH x/x] ASoC: convert to snd_soc_dapm_xxx()
Message-ID: <ce39d5e1-9cb3-4af3-9872-a1f56d7cbf8d@sirena.org.uk>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
 <6358b4f5-88a1-4bd2-b15a-20f090dddbb4@sirena.org.uk>
 <87bjlqv9ug.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IyYo80JxAhDv+9Nb"
Content-Disposition: inline
In-Reply-To: <87bjlqv9ug.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Byte your tongue.


--IyYo80JxAhDv+9Nb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:18:51AM +0000, Kuninori Morimoto wrote:

> > > snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
> > > snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_u=
nlocked()

> > For these shouldn't the change just be within the implementation of the
> > helper?  So snd_soc_component_enable_pin() would be a wrapper that does
> > a component->dapm mapping itself like currently.

> I'm thinking of removing the simple wrapper. This is good timing to do it,
> because there are a lot of such code, and this patch-set need to update a=
ll
> drivers anyway.

> There are many type of wrapper exists, but thus, what is happening is
> that wrapper calls wrapper, and it calls other wrapper again...
> As a result, call final function directly without wrapper is simple and
> easy to understand, I think.

Right, the other side of that is that we then end up with lots of
repeated patterns where you have an X->DAPM lookup followed immediately
by an operation on the DAPM which starts to look like a repeated pattern
that should be factored out.

> I have already cleanuped such code, but we can find this kind of code in
> many place.
>=20
> 	// It has dapm
> 	struct snd_soc_dapm_context *dapm =3D xxxx->dapm;
>=20
> 	// But it gets "component" from "dapm", because of (a)
> 	struct snd_soc_component *component =3D snd_soc_dapm_to_component(dapm);
>=20
> 	// It uses snd_soc_dapm_xxx() function
> 	snd_soc_dapm_xxx(dapm);
>=20
> 	// It can use snd_soc_dapm_xxx(), but is using wrapper side.
> 	// "component" is used only here
> (a)	snd_soc_component_enable_xxx(component);

This case is more clear where I agree it makes sense to use the DAPM
function, that's getting confusing and messy.  TBH I hadn't reallly
registered that this case was happening a lot.

> I know that there are many type of opinion around this topics.
> I like wrapper, but it is case-by-case.

Yeah, I think it's a case by case thing.  Things where a big proportion
of the uses are just the simple two stage lookup might need a bit more
consideration but probably for a lot of cases it is better to just have
a bit more code.

--IyYo80JxAhDv+9Nb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkEvmwACgkQJNaLcl1U
h9AsRwf/UWxkWCcwJGm7jOZEgIVqZ9SI7Kd9xZIt39UnLyjHVJWgEoEp7qPbbyXe
RrevvUL6f6RhC46/tjDx2O1yQv8tIw1ca6b1ZPQ+6BQd4dsChfzPjdhd1+5zj8H8
GdZS6JHFxZ9angfXCCYotnv2JSOLG03RZdKjjdlGPGxH1pHcYpugyqv3xbCQPNrZ
G6yP5ZuaJ6n39vHZZz31f7CSRSUR9EbKXjml5UFgblyeaXn/TMb0DM2sr9JoQ4MQ
AiCHr6dYnHH96pvrevT9XNNLppQgXeZLwec38YeiOGO++ueG8V9Kc1hHNYzpnuN7
D+vMWVMiV5fwyOsKpUHbwSmQoIPQtQ==
=BfiB
-----END PGP SIGNATURE-----

--IyYo80JxAhDv+9Nb--
