Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BE1191F89;
	Fri,  8 Aug 2025 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754658076; cv=none; b=OqwAqwdGBGfkHpb/q+29SEPWj2SgLOFNh/ZaHBJBIA4i6CXLeJTn3DJxUnkehdGQYh6PzkX9yaK3kPkvQLJ74YLDvAbog7YqLqrd2puoXci8nQYW5+YenNh1XCiSO9q1U4X10OTlaQjXKZUBaJ1hiL28SUUsKaG7M5NdF5NAma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754658076; c=relaxed/simple;
	bh=NkNApSinva40ZpdLZNaOWsWG0bDK7PPoZPG3hAYn7aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8CTOKqgK7EEjhFa0HYWLJzDFCVlPW0Ie5jCrxkuB12uqU3CtR1xvoXFmZLts3I3gzVBKumV0X4Eb4zNNHmRQMW24doRSczpl7jhs2auErDN823PTvKRzQYYV8WYTpphiEsnojW1YV0cJFN46w06wy+W2GkR65Ima//FO2D4l40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PyuPSzDF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PyuPSzDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D97AC4CEED;
	Fri,  8 Aug 2025 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754658076;
	bh=NkNApSinva40ZpdLZNaOWsWG0bDK7PPoZPG3hAYn7aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyuPSzDFZWrHglWkOsaZdrENIMrndnfnmetP60SZHZuNQyLG7LwT18mEc2NIQ90jw
	 TnsKwCPsqwh1h8FVuGRmkxfg7gZ8XL/12gbEOA/MRNuor7KPRSq1KLDDCN9vjDusI0
	 KnToMii9xZBsh/6+8N2wNDVnIa9k6mzkrqNwmBAXGIOgJ77NgWmt++Bp3t33kw7gFK
	 zO1/5VbEKcMcAbhMpEm5IF4qsy0eTZrbnQba5sqcoer/6wm/oE6lyib7DqpcJGaQFz
	 rXHXQYl3zYW3SMcWWkIOqQbiexFKVfKdDlyyMmE73wr9OChw3H1v5aeRx5XwmPup3T
	 vs0Sxbb+UDn8A==
Date: Fri, 8 Aug 2025 14:01:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shuah@kernel.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [Guidance Request] LFX Mentee looking to contribute to ASoC / DT
Message-ID: <0b89ed97-78d2-47bb-b205-232a20cde624@sirena.org.uk>
References: <CANBuOYpLNAtLVWBvR9E74Ju4cM1K7H_bS2Z_UhthQFrJaZXmiQ@mail.gmail.com>
 <aIOHm4AOrhHBf6Xv@finisterre.sirena.org.uk>
 <CANBuOYrtmA-UgTo6X87pND9eTfub-R633scTzDef56gVvBVwig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="24X8Q5J5cCa7Hle3"
Content-Disposition: inline
In-Reply-To: <CANBuOYrtmA-UgTo6X87pND9eTfub-R633scTzDef56gVvBVwig@mail.gmail.com>
X-Cookie: What an artist dies with me!


--24X8Q5J5cCa7Hle3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 08, 2025 at 12:28:16AM +0200, Jihed Chaibi wrote:

> For an immediate contribution that I can start on without specific
> hardware, I've been digging into the DT bindings and identified a
> challenge I'd like to help solve.

> While learning to configure audio, I found that discovering the valid
> routing strings (simple-audio-card,routing) for a lot of codecs is
> kind of difficult. Currently, for most codecs, the only way to find
> those is to read the ASoC C driver source for the specific codec. This
> seems problematic for a few reasons:

The names are supposed to be documented in the bindings FWIW, but yes
this is an oversight in a bunch of bindings.  The general theory is that
the pins on the edges of devices should be named after the pins on the
device so hopefully if you just work from the schematic things will work
out without ever having to reference the bindings.

> I believe documenting these strings directly in each codec's DT
> binding file (.yaml) would be a significant improvement. It would make
> the binding self-contained and greatly improve the experience for
> anyone setting up audio on a board.

> Does this seem like a useful contribution? If you agree, I can get
> started immediately on preparing a patch for a popular codec to serve
> as an example.

Yes, that'd definitely be useful.  There are some bindings that document
these properties already (eg, wm8731) but it's just a text list rather
than a property so can't be automatically checked which would be another
step further.  Just getting information into the binding documents at
all for CODECs that don't yet have it would be good though.

--24X8Q5J5cCa7Hle3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiV9RYACgkQJNaLcl1U
h9CKqgf/d4DUTvjJrvAFcgOU4bqw9w2ehsRAVKdDY6fqAXkNTQUhBlgzozTPmRvd
K4VcUstqQAraQ/Wi7XAagnxs9aDBjIWJ/XdANeG2l9JFj0YjAGZqpjQ7Qx2ds3kt
cxOakwheOsXTwRN5P40RMhF6/qKEb6x/LGfiMnUdbqQtWYZXIti1Gpqb4dF7ZSIA
I/n6FrvlMJlBr+se5eqYXdcWctvS7NqzXe9efxDFBzE9dpPK00ySnuVDrQf7JesB
MZaCIbhRmyzmEZEUr20PxQfDMwlc+aRZra9JBKsEC3f6KHBknp+yuZjrV5IXG7Bt
fzhw4M2tJqhx0ToAb8np+guNgXEUsg==
=DRqH
-----END PGP SIGNATURE-----

--24X8Q5J5cCa7Hle3--
