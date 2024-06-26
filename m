Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C20A92F;
	Wed, 26 Jun 2024 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719415943; cv=none; b=TdTWEnf85vu1eDxCzIW5VMccnC+migaJ/YO+1Z0jbATUn8cXYO/H1KCSa1JWAj/+Zd3mQVo4TQyrlv4z6lFfsYJtrr9UoAJAq36VAikldQoAK0KAhQGZDNXRGsQplNJ4jwsUgIKlUoF9gpV6IRdTjeV/s90yuwRYGMRsRHHNg30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719415943; c=relaxed/simple;
	bh=tvA34FpV4DakdXF49bAtY/u5hoSo55rpNjNYU7IAKMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=leXWDY0vcLNSso6Owy6vOIBX9k5c995wHrrYAe8s65+Vx9jl/F8eL7UB5OVpueA1u19qoZrj7TrGARHQVoxasR5/id6yDE2W0Ktooo1Jc8BQD0nJa8nqiwPs2hj3xNTVt7zduxR/HQkXcf0hHmWs0HplHeiF/WUcghmAnRI6scc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FA84uclm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FA84uclm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26283C116B1;
	Wed, 26 Jun 2024 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719415942;
	bh=tvA34FpV4DakdXF49bAtY/u5hoSo55rpNjNYU7IAKMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA84uclm1D8X4g0nuHVj1lk9xPKdRRACn2cc1L5pmlfOP8ciDVVuIRHJjPRKivcvZ
	 NRGySXog6Ct9gHt7rI8znfrrBwTDRmVWlGk+rYxvPIcyyeGuRMk2LSgrukE1Zn1OMD
	 XnAut5WDcJ47OjftqsgbgIyTXxtxvWoAFdIfMkNHYQxmZgOwLsE86RV0iazxxdxhWo
	 bR2UEOSjunR8QNqJyMtzsRhTAA15rrHT2PjrPFg2ksnf8dA2JZpqYKYjp+1NZuECrL
	 P6CP+BLuaROtW0dacArxpnxTa6fvzkKdo4HYgSTKBUwmQXnNOUEU3lhudlNzJNjvXX
	 qVgyOVmO+pg6Q==
Date: Wed, 26 Jun 2024 16:32:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, John Hsu <KCHSU0@nuvoton.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] Add master clock handling for nau8824
Message-ID: <8b6198e7-f82f-46ce-a126-972191c347c4@sirena.org.uk>
References: <20240626145931.25122-1-fido_max@inbox.ru>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0AuYSYvUy0W9Qqi6"
Content-Disposition: inline
In-Reply-To: <20240626145931.25122-1-fido_max@inbox.ru>
X-Cookie: Results vary by individual.


--0AuYSYvUy0W9Qqi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 26, 2024 at 05:59:28PM +0300, Maxim Kochetkov wrote:
> nau8824 has external MCLK pin. So add enable/disable external clock
> management.

You appear to have sent two copies of this series - what's going on
there?

--0AuYSYvUy0W9Qqi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8NIAACgkQJNaLcl1U
h9Cl/Af9H9ZJLzDYxxEX+is0jB6UkzHtM2421nZU/HDt+1V978pBNcsC0M0NxL/O
l7oEk5BYkn8S89VLoeBhUIaTVn4EkP5Z3CSUlKuxtWXurP1moz8WNz21OfLsTS+1
pKOoA9wqzdqV4lhkOKfrMhHzo4fCw0Nq/7JQGzl3vgHr9cjgiIggjAuPLuie55Wd
urr1wM+l8SfqqyOZPT5mfz2DaW4qSDVLrJNmk9TJ/sCnhKxPEJS2OIZWgyYC4Xow
jN/mGGWOAGdErrINe5q2kIcXvrgIWFLtKRoxNxy7MoV+AmJ9yV6jgV9xhxtsamTN
6qQ05tgnXH9GOchS9nqsm+z58VVcCQ==
=WOE+
-----END PGP SIGNATURE-----

--0AuYSYvUy0W9Qqi6--
