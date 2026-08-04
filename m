Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A6E3F8881
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865259; cv=none; b=CG5NXXOhYy/5SslKie8vus4Oi8ieJ/ilthRJ+qKqifJY9syBRy7RTgTSITc2SO1sIOEqwvemnU6ltLjME56RW+AWvLTAeeWF8Amoq7oeGEeK9FYfmoPl4O5DKsuYgKqJqUdm7khUHVayIrBWhs4ZiJGl1NnPx1XVxAxn/ruJd4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865259; c=relaxed/simple;
	bh=EMp959vjWRqwJcZWymBsZxxa5xFeEMA69r7m/5M1DrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jox5GyLnkRT7dSW0beG0qSGMEyB7NJkxY1MZ2YU0HRXuZ+qcmhkPVSJuFIl3hd6xkSygn9asGWsr4S4CE9ZAKsgeRD0Ku3zBbNcSGIA65pEHOprJWTygeJXJGhzjOuftwQ5/anwBgAsOF/1/XMm3Y/C9Ylz20X0mOWXKco4R5zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bpv8kd78; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bpv8kd78"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DBA1F000E9;
	Tue,  4 Aug 2026 17:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785865257;
	bh=EMp959vjWRqwJcZWymBsZxxa5xFeEMA69r7m/5M1DrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bpv8kd784m9wyX4ATaQP8GrU/DIJbmseOIasfyYVzI5grcFHwBwLy+wqzC9IkUKK3
	 hBDGSxG1j2lgeSJEYsEbXjH0F9QJZQu1iPQSRyJyCo4UN2r3guNLNwya3ycLENBgIi
	 GnJeqicjh5NIF27W7EKApEh9K3jBOPRTwwX7mXLFtw8LOHLZ5Uy6L8rYqECn/m74yd
	 dOU7h4ET7x4VkUg5el0yEoyzzKQ1zgDHlbgLwab6VmYwum0Zaf7bNEUuGMfmUxZYZO
	 QDLq63/0+z5SVMJA34RHu7gPzBjKQQ026/P1tROKN5KeYtyVeCEzzTA9tbSozQqvDx
	 O12u4JpiLfpxg==
Date: Tue, 4 Aug 2026 18:40:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	=?iso-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 43/44] ASoC: codecs: wm*: use .auto_selectable_formats
Message-ID: <5a891fd0-7ce8-40be-9317-8bcfbd5c1e5c@sirena.org.uk>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <87mrv2vhnq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="basWlAYacBYPvOFk"
Content-Disposition: inline
In-Reply-To: <87mrv2vhnq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Biz is better.


--basWlAYacBYPvOFk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 12:44:09AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.

wm8580, wm8962 and wm8974 don't allow all combinations of frame type and
clock inversions so have the same issue as the Apple controller.

--basWlAYacBYPvOFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyJCQACgkQJNaLcl1U
h9AdzAf/YPDHft/z89XL+RXI5I0rk76t7EJ9zKOrmbeK+j3uBXZVy8TOE7KX75kk
xqULVqeCK7WGHkX1qJRDd8ZrdS65la3fcHCaOe5XOTEywaAIz/Rxrjzp+v9SwCON
8iO6BS2rntvdKdvCTRafTdVD/0+qZ11K8WIYty3Bo/+vi667EtEdM8abDK++tlEm
tNZWEhedY/sFlw97bbdS3eS/Ib4Y4sWUYKm2PN8stomMxckUUaQs4X8PUN/AM48a
R04K59qNVT3Q4hSXo/oHjo7WWU+M9P8Or6lSmXChR1KmZF0dB231ESy1cx53mfI7
+6qjftp1JgA4eYVcQCxBhHcSjz/e/A==
=2MR4
-----END PGP SIGNATURE-----

--basWlAYacBYPvOFk--
