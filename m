Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7226A08F;
	Mon, 23 Mar 2026 14:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277548; cv=none; b=RdFmkK2sf1oDpuzjUqpO4PHLSG9Yrg7Y7qYsqwERLczFqG2h3qGXEar+1wtqqUWcfreJAa/No6Oe+uCYemVGIya7UKjL+DAs+dcLEn8TFHx77N6H0nbVS+Jh+jH9dmHioOnpGQiGbl7Td2pHnNgAOhi4LcH4Z8c4FMu6KNiT0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277548; c=relaxed/simple;
	bh=NL4Y6qth4SD7yHlMhNBI27PbrOF2zuL+Rk5f2Ub44Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okXXUNKlijDfgiBDh1SLkL6V3lB4nM3UDDze0hExrka0C86A8CZiDOd5bZYdT67fdXFcDluGmb/aNNzqz4KsEV0xa3SIVM/9IbptUEXoN1CRErqiuBrA7vd2DVFoiqJTsBuygmKfCdEjE6xR8a4NPxJphjDXFabiJDMpU2W64zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eV8Uxsqy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eV8Uxsqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94959C4CEF7;
	Mon, 23 Mar 2026 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277547;
	bh=NL4Y6qth4SD7yHlMhNBI27PbrOF2zuL+Rk5f2Ub44Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eV8UxsqyFUhPkmWN5wIesM31N4EUIEKaL1pOIn/kvUDgyx9oUTFo5En8o80iVOg1I
	 E7DLG2W/VYgTNIrwMgZbyAwNa74NPJXISqFzAtVYRihvsNnttTIT66XgzEjQRo74Xd
	 a/LdmCJRMfGnuBkPstsze3IsQTzXXKOe7uGl9sMaK53NIMIi2SPKpxjkb8CZjDAT1M
	 xu91j/sEXUGQj30IXpJJPGK3qAQX3szr2OYXj6dSm3m/K4PKggiJJactUHFLGEMM2B
	 V5uL2pMSTs0jukIXVvqSMLO/yP3C2Gkmkc/u/138ZzkjVxWfwgWXEVb2Yg3G+oAnry
	 ntWf33lUAhS8A==
Date: Mon, 23 Mar 2026 14:52:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: soc-topology: fix __le32 conversion in printed
 values
Message-ID: <2167f1c3-3577-4e76-98f2-81fa829f5164@sirena.org.uk>
References: <20260318163427.1083470-1-ben.dooks@codethink.co.uk>
 <6c2114d1-cccc-4857-b3a4-3fdcb9932c76@sirena.org.uk>
 <bf59d766-d081-4548-b347-d2b40e1b2ba1@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SUAgFDnPqTFDm3kF"
Content-Disposition: inline
In-Reply-To: <bf59d766-d081-4548-b347-d2b40e1b2ba1@codethink.co.uk>
X-Cookie: Avoid gunfire in the bathroom tonight.


--SUAgFDnPqTFDm3kF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 12:31:31PM +0000, Ben Dooks wrote:
> On 19/03/2026 13:58, Mark Brown wrote:

> > The format string for the type got converted but not that for the
> > payload size, both of which got le32_to_cpu() conversions.

> Thanks, since there's been no-other reviews shall I fix and re-send v3?

Yes.

--SUAgFDnPqTFDm3kF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBU6cACgkQJNaLcl1U
h9DNeAf/S3pjXUE2rwYVQGg67zDe9q65znJJ90x3A30dqvJgpHm65Z2wQrvl+7N5
Bx9haYiafgwtbNi2gAn6s87FSjjFmMGrQZsJxyYMFAIGB9a5guj6ZOcJDy/RpTdy
tjMa2pbsveOk+NVfir/wnpbfZfLJV1RU4APuhgy0fvtV5iM7aJ+S/aA69IYJdEIq
DASDYNOm9YGKu6Hm+kC/wppx7zdAqZM/OkFW3TlLH1lXtMk9v3af82ZuJ3eV4Vab
q+C1gvyhlNdevbKd/wfbyWpnxyi2e+7kWlDCcqaXiUnEKFMxLhes6XjI5Z+4fOj0
lMthUzyZR8VtPMf/QKLaUWF+pN1Ngw==
=jE2l
-----END PGP SIGNATURE-----

--SUAgFDnPqTFDm3kF--
