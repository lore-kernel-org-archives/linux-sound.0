Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A183FD971;
	Thu, 28 May 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983621; cv=none; b=QyhgMitbFOYYbLZDZL71fBIAHDhEChFcgqMtNilWN1HEVQW5dzT+10WPNrH33CrFW7cCpqtZ2KSxeiwIprws6of2DNQRMhAoLX2GwhF5ff6TTBnm4bPosqOGccmqva3ePg3BE89W3UTHtI7VlAJHLvoultaA5w5COM8H5aR9RpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983621; c=relaxed/simple;
	bh=AprZA9/zEOGoNtE3kKQMHekqsTVNzMgrK1DwOKf4VsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8rNgouzpVIqgXc/RDzsv79Qb93z1cDZUKdC2qlDdPK4I4HssJhXQSV8VG5Vwdqcwr+v6JW2YCJ8CGs2jdE471RFkHgOErHufHjrj7AqFW7ZVv3kp6+BMHWZOZzaNr4e3+0mni7oy5VGk/w/zgedIKArcIay3XzjDwANW9aq7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DxhI0M0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DxhI0M0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319881F000E9;
	Thu, 28 May 2026 15:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779983620;
	bh=aqOl4KJ+POyxHhW5KeMjbKtaqry36nNsOelFZ1HL0ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DxhI0M0P7/GNtmHmDIp57e9c+ffTuUabCpKnKORQeXlGYCrvUPbtd0sq5ZKyWkIKw
	 JKm3mnIuOvfB/cJfuoakhBuVwcEeijXIXT9HIDU098Oa1SkMa9/HCIXmTNWqI4NR6G
	 uKW9UahepMUSIa6o4qRB1uHttXj066AWRLnpFxZJY/+hqUnd1PM4ec11Uc97p/PWWm
	 +A7vaNixHBu54Www1A+iO3KWM3APVdM8CTFyc6Of3fIqJ2cOIcBkjyCkvwaEHOgLqS
	 U0M/g4vJ1rDXRvFZUH7d5ZVtVsmE6Z9kU/meOODWz0N1ufbGB+yevcI0sA/GOkT0TG
	 58CcjYxmPgmsw==
Date: Thu, 28 May 2026 16:53:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
Message-ID: <512b2bb6-620f-428f-9724-73972e589c46@sirena.org.uk>
References: <20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com>
 <20260515-reshape-aiu-as-axg-v1-4-53b457784ff3@baylibre.com>
 <758a4ef9-1a3e-475a-ae1e-83523330d006@sirena.org.uk>
 <891be10c-99f1-45b7-bd31-ec5080cfc780@baylibre.com>
 <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="19pjvJBHzpq/adui"
Content-Disposition: inline
In-Reply-To: <a5aa2965-3651-4927-acff-51eee2e4ab4a@baylibre.com>
X-Cookie: Someone is speaking well of you.


--19pjvJBHzpq/adui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2026 at 05:01:59PM +0200, Valerio Setti wrote:

> I have 2 alternative proposals for this:

> - Change the default value of "HDMI CTRL SRC" so that at boot it's set to
> some working configuration (ex: "I2S"). This should be done somewhere in
> "aiu-codec-ctrl" I think.
> - Run the 'amixer' command above before running ALSA tests.

> Any suggestion on what's the best approach?

Having to set routing is usually fine, I do that for a bunch of my
boards but not Potato.  The only issue with this is that if people
upgrade the kernel they'll see audio break so ideally we'd have the same
default behaviour as we had before.

--19pjvJBHzpq/adui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYZP4ACgkQJNaLcl1U
h9Djiwf8DPaQRmX/EbpoL63XEFpABecPfcnnkx3fq7lRA3ljGP15t7UDi1OBbLKp
qsBm1nynYHc6+rmSYN9WiEaVD02YDD8vQE2bz8gEwqsskC6fZKBM8t4ru/+epCqa
PF9AWcGXca3zx6kTenw+CgxpX2qufynlE/Os6+3XDNbHXUAVgSY2U0aALKB92uHZ
pHDS7XPT2nuWpuPollt7JUrxF6rUxhInQryAl7wt0EC2BelQ/AB9ozIOn3kG73Xg
01WpDT+ql4AP9M5+PHFL6UAQme0RYN2rS6kzSN/eZbzR/sJGcInsW8PvII+o93+O
SxxdCbgl792e+6v5xuSoQEzlwBM0dQ==
=qkk7
-----END PGP SIGNATURE-----

--19pjvJBHzpq/adui--
