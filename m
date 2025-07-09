Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32227EC7C
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752051466; cv=none; b=V5kiiFYTr1TP7VyMyJ6Uwa13Rtno35mVeAIzByaEos+66qxtNO5cle9ZfQKPvV8F3K3wyMz0k5m9ymlFWecKVZ7R3WlrkmFKQB17dypfIZEC+ZbS1tVIH35UrcQJ8kQ8qKLPudk0q6Br8kE32SfHvQiMwngyEc7hBBaNreRtTg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752051466; c=relaxed/simple;
	bh=pc4PnyGnYO+XawMdDe1vKXmJU+DyKWrLeOFt9ICvpyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6ZIonhWih2d3vvEDkB89vsuxtcWxjbP2vkfZykraSvw+oQ2wLTJQKJsWMYy07JLNdBcBgL2vFAU/GE4rY5ch11RS5UmlkJ4Gf+Chwjs2SPhixEXv8bV6ri4FmG4sOliMMv41AB3WHbmsMuBzUiraJAtveZpDAznIsg4R73FrJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=najbBK1J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="najbBK1J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC03DC4CEEF;
	Wed,  9 Jul 2025 08:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752051466;
	bh=pc4PnyGnYO+XawMdDe1vKXmJU+DyKWrLeOFt9ICvpyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=najbBK1JkDlBw4QazRxVGN+4GLuxSSqrByEGiHAg3f7pytPlw/Egx4lBGYKmAymud
	 UU0VOLEAHk9eALMtKgHujYfDeQFl03CsEbY3fSBczLwd6z/DH7+hl0kQ6cqnPykLAl
	 Irsp8htVtNUlUNL3lLtOCkEZGqNxouUUIZGWuhPs2yGU/rkhYhiFd6Lu8aRWhgGGFe
	 PRP/Hl8Hnllfq385iORDFWvaVvA1UnWbH9U5Xy21tATgGzGPKkaEPMYpblMn9jGyzq
	 RBMNzJvvmmzjTe3Lj1gJfpcx1zmfnSr0kc/L+KdYn2jwLYN9hu+H8hH9MX5bbFHQMA
	 tP2tfO7UZRtug==
Date: Wed, 9 Jul 2025 09:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org
Subject: Re: Question: how dapm should looks like ?
Message-ID: <aG4vB9mexKU06uLv@finisterre.sirena.org.uk>
References: <87tt3nmork.wl-kuninori.morimoto.gx@renesas.com>
 <aG0la8cJJ3mEVUXX@finisterre.sirena.org.uk>
 <87zfdefe8x.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CF0+hpKg+lK9mCS6"
Content-Disposition: inline
In-Reply-To: <87zfdefe8x.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Do not cut switchbacks.


--CF0+hpKg+lK9mCS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 08, 2025 at 11:34:57PM +0000, Kuninori Morimoto wrote:

> I'm now posting small patches, and will post similar patch-set again.
> After that, I will start to post DAPM cleanup (hide) patch in order.
> The plan is like below

I think that plan sounds reasonable from a high level, let's see how it
goes.  Thanks for working on this.

--CF0+hpKg+lK9mCS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhuLwYACgkQJNaLcl1U
h9CYQgf+Jch/l4PkRyhpRXq/rK5ueds5wZ8y8wsKti4LxHnjTXAZyjFzmZr0eIRo
Vpv69lRYRGs+CLH0J7qnxNGhmx6QfVp7vhj6foPkQvaC81lK04OD41oi3HY0UXJS
v07kIdVDpeIuDP1R/WUtHWFI5fVdQ95REaGNasMXdZsbfALw0kujGHA4Hyrc6XNO
t7aqTblj3WHnpLBVn0dkP01R9EIhOpyCWFEEpD3Tn0Kj9A1WPUbl3e22JnnGqcs0
qwTV3EiC1looHVJqgAipMfy/erVOBuFrhOcWeUyoOTER/9nqRQ83qj3mm1Oq5Uri
ELYTcJrONvxIi4UDMXQ3+C6ySpTkww==
=fXN/
-----END PGP SIGNATURE-----

--CF0+hpKg+lK9mCS6--
