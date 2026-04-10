Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5117B37EFFF;
	Fri, 10 Apr 2026 10:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816935; cv=none; b=LKrCPHtsXKjBLMVQi0IO6jcrKc1jU30kIYrS6l1uk5G/JZRCetMZgBoxj+7EBAgQL0uAJ4EN6tJgAbvvKEOYKtBb29EBgUpgOUQSSW5KuUN8es7dXp3VdoOQdqc00ZKtbEXx1TqN9b9eGTF0mRgFafUy6LtuytxEE66AIQ7R2W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816935; c=relaxed/simple;
	bh=JcpXPHlj5lb/tC6GGA8d4uK2G8UACazbeyqXotcuMjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6/s03Eni1EFaW2IMW0cjI2OA4Vwj1IejUKc9bY5+FdxqGfRNh6bu8hk2Uxrs9aoRtlBGu0Xc8KvaQ4zPOcqAKKMaKckNKAQlthU1JIGYMo5tOhSLDvqKkYHfRPo1fVHNIS6G49W4qDRwuJZWw4exxTPC7cvIaJfz4QAXSWqhCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sm0Jn21W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sm0Jn21W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05F8C19421;
	Fri, 10 Apr 2026 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775816934;
	bh=JcpXPHlj5lb/tC6GGA8d4uK2G8UACazbeyqXotcuMjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sm0Jn21W5KKuhJBrMB+l4yidD3bcufvSGT8Fdnj+KnFoTrB3fMBJS9QZC8b+sBcFN
	 JiVbKkbdTZnLQqYsvw53QhRdiUWcYP9R97Na7ijJDAUSduZJk1DScVeIxG03n47Nch
	 XPaV4Q7FDC4gP9TiIJ7GNtZt2DLTXohg5cAvQlBMTN9HpCeUIGQfVbr8VjRPLqJCvo
	 IPwLOlvvTqAgrBmvuXLktWb7w6wUXwF6+eoJW4Mkko/TwcIj3qm8EEFj+hdaAYBsF9
	 wrPlxYPB6PWUs0IgcAzu2iaG9DyFvUMzaDvLU3kwtt3d+qzj2tn8n2X3iyDeJeFifH
	 sqecpZQbOrlzg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 30DAA1AC58AF; Fri, 10 Apr 2026 11:28:52 +0100 (BST)
Date: Fri, 10 Apr 2026 11:28:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: Add support for the GPIOs driven
 amplifier
Message-ID: <adjQ5N69y2PnV-11@sirena.co.uk>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
 <20260330101610.57942-3-herve.codina@bootlin.com>
 <20260408122901.GA42727-robh@kernel.org>
 <20260408190932.0ab936b0@bootlin.com>
 <CAL_JsqK4SHQS6MciQpLSrGWo2knqs7-eB3yoAv2J54bSfW-Lxg@mail.gmail.com>
 <383635c6-0417-4333-aa9c-9056437d4a5f@sirena.org.uk>
 <20260410100330.1fc4b97b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o+9W+h3qdmnfJbB1"
Content-Disposition: inline
In-Reply-To: <20260410100330.1fc4b97b@bootlin.com>
X-Cookie: You will be divorced within a year.


--o+9W+h3qdmnfJbB1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 10:03:30AM +0200, Herve Codina wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > > > I didn't want to set a particular limit related to the number of GP=
IOs
> > > > used for thje gain value. Of course 2^32 is obviously a lot. =20

> > > > What do you think about 16 for maxItems? =20

> > > What is the most you are aware of? Take that and double it. =20

> > > Seems to me 256 levels would be way more than a human ear could disti=
nguish. =20

> > There's plenty of gain controls with way more than 256 bits of
> > resolution, though I'm not aware of any that are configured via GPIO.
> > The step size and absolute values you want can vary dramatically
> > depending on application, possibly in the same system (eg, a DAC that
> > can be connected to both headphones or speakers) so you often end up
> > making practical adjustments in a small subset of the available range
> > but that subset can vary a lot for the same part.

> Mark, do you think that max 16 GPIOs could be an acceptable limit?

> IMHO, this value is large enough to be used as the limit.

That does seem larger than any real system would ever need.

--o+9W+h3qdmnfJbB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnY0OMACgkQJNaLcl1U
h9Ao1ggAgWdjTX1pvufL7cIl1/RH40GGhnRehBGD8GngAKRTvfoi3/KBcPk29O/u
HwFPzD5v1yZIbmq4SZme6Ob/25SUIEIps3YuoLBMH2z21q6CB14p7cs97I7J2XFk
PQGkqRkHvzLyG0OjtY6NHG9xzGGViF9qTFvsTWlvYOSjUNZ4wsoYLSOD9XNmjmt6
YRJlvciBynFLtfg1QmO8Gb5Tdxjx398hPugL9griW1z0Oyii2d1MIc7nQ57JLjP9
ld7N7tfqJMVTCpIpGKbYBUx5D+7PXd0J473ig15bAtAkdVMLOTSQDQQIAMY1BCQl
4FfL2rjwoo9GL/o428atk0ph9xOLgg==
=eyC5
-----END PGP SIGNATURE-----

--o+9W+h3qdmnfJbB1--
