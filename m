Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08617330D22
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439038; cv=none; b=cf+KGsyKhap3AfP9vTIaX57rGgMVgcO9Hr9skiDaJor434XaNQc0eO8nDqSEEQe18zIVKOPzUoSYbs8hlxFiqVZVqMletFOSdODiLZJzPVzS8WLO7PtVjGRte63LQFhznLZ5uNOIIrDLlEoSU2JzYRDplLGKg3Ffgb1/OFkjYTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439038; c=relaxed/simple;
	bh=TR8Q5NX565+QgdVxq8POCbFa0uHwjTvthLu8w8doDBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FlUTzX+5XFb6sAqlH98acQCV80AtLyn30c1M90LLSHP4X1gwpU4GjtvO7f+QEWuv7NpGXof49z2BWrNKyfog2mpnRM9kvcxJ02yxMkV7v2fErYXeO7L3dKBZc5QrqkqCUPW4nsJ7Z+KsIKf4nYz0PMTVxGZAimflroajy6yh28M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyyFhUTd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyyFhUTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEF4C4CEF7;
	Wed, 25 Mar 2026 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774439037;
	bh=TR8Q5NX565+QgdVxq8POCbFa0uHwjTvthLu8w8doDBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HyyFhUTdiu93p8k+hCEzhrpq+kvK1P2oXyUwuj21goborlVyJ7SdxPKHCZtiYPUis
	 VSfu74qXaUfi3uFBQEqlL2BpiABLmjpojpW50aE3CV8NMaCl5zzFZo1aQzd9WRkZCF
	 3hLwCsvV7iEG8dsWBa7E6jfMgve4vlTXeq/OwdmZ3+cJZleWHFfMMV6lNF8GEl+OIx
	 nzHgFCSm5tz8Oz1V0q93Z8bQWOyvUvwKDxXzs9Q6+tbNKID57YRXCGOuL2A0lXtl6x
	 UITq99AC+GTlRt45WJ+uoz/RAQkaqOmGz18wSP4fFUgwVWVZKDbG74xKGuTXXNild7
	 lbEg2psL76eDA==
Date: Wed, 25 Mar 2026 11:43:53 +0000
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] ASoC: SDCA: fix finding wrong entity
Message-ID: <72a50eae-18ce-4ed0-8431-02475c953be6@sirena.org.uk>
References: <20260325110406.3232420-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jzmakDz6gy+Jahnk"
Content-Disposition: inline
In-Reply-To: <20260325110406.3232420-1-shumingf@realtek.com>
X-Cookie: -- I have seen the FUN --


--jzmakDz6gy+Jahnk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 07:04:06PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This patch fixes an issue like:
> where searching for the entity 'FU 11' could incorrectly match 'FU 113' f=
irst.
> The driver should first perform an exact match on the full string name.
> If no exact match is found, it can then fall back to a partial match.

Please don't send individual patches with series numbering that are not
part of a series, the numbering only makes sense within a series to
order things.  Individual patches shouldn't be numbered, and the numbers
should reflect that series itself.

Your threading is also broken on the seriese that you do send, they just
appear as separate sends without any threaded.

--jzmakDz6gy+Jahnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnDyngACgkQJNaLcl1U
h9CZCAf/Qj3iRZU7RCRSSp9/9luA0INvtpeZ8RzcOX4Sfd5lh8tgXPBMbDxo15Sx
UVU1jqHjMlrejCF7mjiIMWQQQ/caKnxibv/C5R6hDLBEpNBBwfHM89QBJrSFCKSZ
sqqBXzVp84PMzoHF5lVb0ceOXxrJ8Qxqri08/S5hPyUB7AhfM+beNsmguGoFV3Ja
/8Z+f3xWHp3qRaCX6K66PMr1tTDpx9InbiOu0SOOZLdPZn6Rctre6rbkWECoQX+b
adP04U/sv5BOUobQY1aV0NyQZi3LH7An3vRTY+Lqgr6bsUSFVwvxpuFchX6ViNu8
AEV+/SK6rGcrcESshnRbDpy6dp5ufQ==
=tMai
-----END PGP SIGNATURE-----

--jzmakDz6gy+Jahnk--
