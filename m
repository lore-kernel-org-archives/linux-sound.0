Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2075222593;
	Fri, 27 Jun 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022394; cv=none; b=EPDMg30xfIIDreB+0E7k7ENr3g3eUmJLw/kft4WZOrRA36sNyH6ITZAxpRAKmtUI/9O9eT8AkrqwL7KQqTT0tZr8MrP1TnmnCae04VA4jjRiuB8fZ7lHm0gckYWFxm2V/IwVfoVhMbI8HnoQREeLQ5zVvlRxxEJQGwjnF/bXWQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022394; c=relaxed/simple;
	bh=bVWOOL4faoBRQXF/xYY6NJ8izpkf/HCkgoN+v13YK3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjBp657fNpu9qmSxL+mT4yXlBazGPCK8PuvNgwqhVYdiiSEuCeu37KkFxppYR9gjfYLosXKKoLkBO3Fb9Ny/6Iwc+K5CE3jDM65u/V6j0s7JWrmcihuQerFKht30y+77n7NFDlYMfnCuwdkL8e8Nlo+bsN8nXRVN1fLk4qp/EnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ou3J0iDP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ou3J0iDP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B472FC4CEE3;
	Fri, 27 Jun 2025 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751022393;
	bh=bVWOOL4faoBRQXF/xYY6NJ8izpkf/HCkgoN+v13YK3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ou3J0iDPmZ0hL//QIxbIbsVw8hljd3RcGemzdL9tU3Syt9dK5QUfHyE19QWGWDuoa
	 Htd2NkaSkU55vWrUVTBDWuPumYe9mDmUTSQCc/0lwTkrizSyp5vmAmGMg9WFl6EAWb
	 kS1MTf+RU/9ReXEsOR/OGRGqh5CYTLmqmB1OlB9n1m2aA7ENzK2mvYbA/cTZuFiYDk
	 n2CJgq32AmyHai1D457CMRTusIIgUyN/Vz1tNfUEDpqUSkr8SWxhk8LK4bjTqNZ88R
	 C02WXeaHNZAZZiI9F08mrGvLtSREPuKmEnFEJ5TrwMGzEGpNKYw7E4WOX0JGxbSpJX
	 3ldxbeKk7J1Hg==
Date: Fri, 27 Jun 2025 12:06:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Niranjan H Y <niranjan.hy@ti.com>, krzk+dt@kernel.org,
	conor+dt@kernel.org, andriy.shevchenko@linux.intel.com,
	tiwai@suse.de, alsa-devel@alsa-project.org, baojun.xu@ti.com,
	shenghao-ding@ti.com, liam.r.girdwood@intel.com,
	lgirdwood@gmail.com, robh@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, navada@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v3 4/4] dt-bindings: sound: device support list for
 pcm6240
Message-ID: <aF57GqVuSqmF9W6H@finisterre.sirena.org.uk>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
 <20250626181334.1200-5-niranjan.hy@ti.com>
 <20250627-lean-pumpkin-giraffe-6fad55@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L/1FwRqNDWC7Bpnh"
Content-Disposition: inline
In-Reply-To: <20250627-lean-pumpkin-giraffe-6fad55@krzk-bin>
X-Cookie: Do not cut switchbacks.


--L/1FwRqNDWC7Bpnh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 09:43:54AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 26, 2025 at 11:43:33PM +0530, Niranjan H Y wrote:

> > Removed taa* and tad* device from the support list
> > as these devices are supported by tac5x1x codec driver

> No, why? Hardware does not change.

So long as the bindings are compatible it's not a problem, this does
happen sometimes when people realise that a device needs more specific
support and it's more managable to split out from a common binding.  The
commit log should have the analysis of this though.

--L/1FwRqNDWC7Bpnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmheeyQACgkQJNaLcl1U
h9DyPgf+LF0seUI/8gy07VYzrbR9kb4Uq5D3IqvRW9NElICJOf/2BKvtpG0f3VDK
NngwP1Oc7Ar181ggqHicixWwXdG++jRtcad6n63NtPu+Sw8iZxtSGQzGxpn5k3My
ORksh4s+htR/aNA8Yyyql68+ogE8DgSYS+RJI/pDeAI3JixmHb9WBAbMWrJiu8YA
GMRwtkSLCOVgl5bcpitoml6gqrgXVPvhMLpR5xjGHB372nJZ9MSjONS5Zc8N0Zsu
asTk8mOvvi0t7ho/dSmOR2Aj/CPP1NUJYnOkKx9ZyX9ojb1xHxH1G8cgXQTXsAjK
tfl1RJ7neqO97GcW8VT+5nwK5QfVUw==
=g2hR
-----END PGP SIGNATURE-----

--L/1FwRqNDWC7Bpnh--
