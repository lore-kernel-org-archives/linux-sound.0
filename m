Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A33C5528;
	Tue, 17 Mar 2026 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752002; cv=none; b=LJVrtztWOuNrC9mVJp2g1VtIBQukyKMP3+02ntAoJ5yt0YnswBpgmyIK5Z96QzjyDLKdXw9Y8MOKpMQKjuni3TM2ZscKEbfZ+5ZjY5cMZ9JZXmP0AaVukXi7FfAZu1CQEYbdz3UYd2kL0RDpH4trrn4ea++KQyN4hcumdahjv7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752002; c=relaxed/simple;
	bh=UD/RBSc+N4oO/wPmDhcTsiyH/18uhJnjhT4Jy1KO7Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWvfmQ2EVrfAG4w76jb9BVvd52oYJnSuBoKm7Y0J4B3838H0PgJAtNaOJlHGVtxy0Bq5fI/c/L/at+zd/maG8P2VL1aQulUqa4aLOcLmiGGuBf0wHKecnhdb6y6VG7X2w8PEK58n+Hz+GQ34zDLgyQ9+rI5ADMci2eqNBe50yeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q4SveHHP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q4SveHHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E171C2BC86;
	Tue, 17 Mar 2026 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773752002;
	bh=UD/RBSc+N4oO/wPmDhcTsiyH/18uhJnjhT4Jy1KO7Qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q4SveHHPKWA54elnHNI7Ua3C2vjf+Fk0jIhLjNA0xI5+RhB6i7cusejxkvaiz5Kfd
	 3kwZmyrxQUpq27R29R0Qn8/WqYKTDdMO/pbDiQrOsDSuQ8mmt4+R8OuaIEHmriTOSX
	 sU51QKG5k1GfXhVZY7QRfBcP+ngmv+ZFL62ip1C7mhiCViMOdRh20NC4qrX5LVmN3Q
	 BtutDjPllEj5zraGpZdpmF4c4YjTAM0XTpSVpQxuGRLNaayh3uNLGpeBeuS4I8tLry
	 J9cVJZhSqgMCz7iK1Hgw7GthiIAy+xNNtIqCC+/Zv/9DJrgczANhwhF5Put/Y9AFA1
	 6DebPvZSGyY7w==
Date: Tue, 17 Mar 2026 12:53:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Piyush Patle <piyushpatle228@gmail.com>, lars@metafoo.de,
	nuno.sa@analog.com, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,ssm2305: Convert to DT schema
Message-ID: <fc4cd40e-ad7e-4851-a483-125b1c1c1697@sirena.org.uk>
References: <20260316211348.230923-1-piyushpatle228@gmail.com>
 <20260317-cassowary-of-authentic-agility-05dec5@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bMSXVIoh63XDwg0r"
Content-Disposition: inline
In-Reply-To: <20260317-cassowary-of-authentic-agility-05dec5@quoll>
X-Cookie: Must be over 18.


--bMSXVIoh63XDwg0r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 08:28:12AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 02:43:48AM +0530, Piyush Patle wrote:
> > Convert the SSM2305 speaker amplifier binding from text format to
> > YAML schema to enable dtbs_check validation.

> Missing DCO. Apply your patch and check yourself.

Specifically the issue here is that your signoff needs to go before the
--- since everything in the changelog after that gets deleted.

--bMSXVIoh63XDwg0r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5TrwACgkQJNaLcl1U
h9BUxQf9GJCy5JtHgROSDjuqcKzvg7RKzeN9e7Ppf/7gjNh0v8uAXjLgaAcjoIEO
XQ9R0tqNOTtTorq+ZlqG9DJBLppxLftWBS5IudChP2asPGFInSpuNWfxXnyjr4KZ
6YPmuNC3Y06prwkw69F7Kginibyq/H3/WCg27aSOwmJ6Vz/ngNEYYfV5+oAno2/r
hHlumdLlR06AHlkTPcTt0zvKy+T1c9yeZo0UwwxSdiq18xvIWK4ynBEGg6qgm/Mc
u3qBhkHEEATUhpiS0DS+Ts+3dQSdWKAoTkOJ0nCiNQdjNi9WiqdqYrrqnqt/uI6U
zmqwqT5gfmwex+0ODxoEQf05JdhSlA==
=rpiX
-----END PGP SIGNATURE-----

--bMSXVIoh63XDwg0r--
