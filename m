Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B693A4F4B
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854089; cv=none; b=Ta3iEBDUrMnoVCUSGoG5Ubg02U8Efex91oZncDi9qtSeWiDax1q3Bvj9sihnnMYomFKtRoiMJs/lqRyPxlCs4YjakESGc71N3AwyKowrpJ8H0crhAAq/xqbcW8P9ql/zjmtoGX0l51Xj3AqCeqKPkybBYB/wfsm5T9LSoWxDQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854089; c=relaxed/simple;
	bh=HcyQgHpsncR9v7rTdniCARd/HPLLaP40gPhoR2/dhuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+8QSu5fheWe+Bzj8/thWZ+0DhUgaXBf+Jv2mhUccWnL/AtXOArpeoykgzN+oJhFcRyvwcdEdAspsgSo9Bxaj0EtRhyszSXLLitrqM9Ph/HNtIRGHQ8xWbiEb8l0wy2J1daZnkcys0Y074T+mz6NLHjDzL/nUrsz2f97HtqLLF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T2t6kWVK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T2t6kWVK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8D41F000FF;
	Thu,  1 Oct 2026 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790854082;
	bh=/kLi6IBCA3gmrnxeSBXKc4cehtPUXpvTcEE9FXGNYmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T2t6kWVKTwFvsCc4/Dbke3rsU376S/M9TriobNbB3sQSYWdIUbfy1XzO6V4Uea9en
	 /A85+XAxpzxjEcbTfCHnYdciRoRxRnZUSZEx/ioUNNj13HAxA3GfIXch6L68GIEVfk
	 4RjoHZl5WIRbkfT76a0MavCwn3jsLBNxuz9PJowGac04jYs+AwTGD+nEk2tl8cKtRI
	 9eGPmAl9Eg7SX1jTaSk7flZ5++LeOHlz2n7k7pdDft8m3klHCBq+fxIuMZ4tqKTP7d
	 qa6itdf9OnZLz/EfQmBcGP0v8Y5qaV/Zd4SZcOuCKbpBsrPCsdXjBWAT7qShHAFirS
	 Z8lKMI8timTjg==
Date: Thu, 1 Oct 2026 12:27:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
Subject: Re: [PATCH v1] ASoC: tas2781: Fix TAS2781/TAS5825 PPC version logic
 conflict
Message-ID: <8284775a-9323-4b07-a4a2-3969f2af0cb2@sirena.org.uk>
References: <20261001024049.93-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQYFjOhSM4KvDuix"
Content-Disposition: inline
In-Reply-To: <20261001024049.93-1-shenghao-ding@ti.com>
X-Cookie: Do not stamp.


--LQYFjOhSM4KvDuix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2026 at 10:40:48AM +0800, Shenghao Ding wrote:
> Fix cross-team code conflict in shared PPC version check path, ensure
> TAS2781 and TAS5825 apply their respective correct firmware parsing
> routines, eliminate version matching misbehavior between the two models.

If you are sending multiple patches threaded together in a series please
number the patches in the series, sending them without numbering really
confuses tooling.  If the patches don't have any dependency it's often
preferable to just send them completely separately, not as a series at
all, since that stops problems with one patch holding up other patches.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--LQYFjOhSM4KvDuix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq+Q7wACgkQJNaLcl1U
h9DchQf/T05iQHnr/0HPBrfZ76vWOer3CPO3jPfxxX7HC+8BHyGxZFCtcREPdIna
C4wtFNGmzxNJvNXI9ybyR7fkGBd6vZs0mcndEFxQimbdPPXX3RbeirZXcOtOcbxm
CiMAoEqurWu1++epID0Kn2Jclo1fecemUBAQ6VIUJcIYUe/GPioM0RljGI8d8sFy
IiKi5Q/pszeLdMJBk1C0+0UiQ7ie5WAMPvjFyrsj5sXuZWMb+WKfy0sF3Jnrgc3M
gUhHb9jjoq6we2BYK1kaeufV5oDT71Vhzcm+mcUWiN1CT6bJOtucHkE7fhx85JjD
a8ZhoRpHbfvDK40DEY+hRViBQ+rofQ==
=nAPO
-----END PGP SIGNATURE-----

--LQYFjOhSM4KvDuix--
