Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C065296BD3
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770400670; cv=none; b=a4vMYlGVfRjBXVX0AUbk9iAMlSNc43AQ3KZJwwz2f8TSWbSfAhGyk14CNjaCRPoyEzycsmP1d8NsfNcaOFgi6KXgAaq10mfTxSJx5Qw6tWkIsPYrlWjRcat0NzEKC6aRQWpmxWnAeePKvWLmBDIlqLSnXr03CBZlmsb7+CO1gF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770400670; c=relaxed/simple;
	bh=xKHWMyO98Gl5YTOIGxQYRr3rvRDinvv2FKGyOL32Sy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nboZUhQVRIS3GPMoOC7FykJN+pEQe6u44m0LemkAdwiUIe/ffZWWCVLID0NQncQyIFjqX6QjU961wwVZJaG+vRQfx0cMDUxe1Tjqqny5z3/Apuc0jQuayotLg7RmMDl7rE+H1XIdGtGIREU/77UaEKjdBPD9m58q4yAsAy9MRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AetnHTkB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AetnHTkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BFBC116C6;
	Fri,  6 Feb 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770400669;
	bh=xKHWMyO98Gl5YTOIGxQYRr3rvRDinvv2FKGyOL32Sy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AetnHTkBaZPDfJHBAEdnlFVGqzjqjZxUVQUUTrW6jsvFhrgxQZGE0B2eXfUU7ICkj
	 4MgJfzATpUVWrLl0aYOUal1UYsKrdam3LrFeMmiueVx381qQdIB4bXHw6mXd/JOPzZ
	 i9YE6XkvKRY/3hRTCih0AjWq1He/sFGmNSLVzApQYwIc6hlWsIaLPzX5WhmnhR814B
	 rug8mHl+wechQ7QouIomgmckMiU0yd9gblAacd4zIE3UBlFX6FRoj3+5hsTSulRDb6
	 H6o0GmmCLKL6UWREhP4st1lZeAQDn42nFEvv2l4GytpPtzflDZFbyev/CU9ldJdJaY
	 vQPWgXAmdL9nA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1C7471AC57FA; Fri, 06 Feb 2026 17:57:47 +0000 (GMT)
Date: Fri, 6 Feb 2026 17:57:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, tiwai@suse.com, perex@perex.cz,
	amade@asmblr.net, linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
Message-ID: <aYYrm1WvF5tBTuYg@sirena.co.uk>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
 <87ms1m9htu.wl-tiwai@suse.de>
 <56885643-6602-4155-8644-58eb6e561ed4@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zR7Pi7/Vdix8+GKY"
Content-Disposition: inline
In-Reply-To: <56885643-6602-4155-8644-58eb6e561ed4@intel.com>
X-Cookie: Think big.  Pollute the Mississippi.


--zR7Pi7/Vdix8+GKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 06, 2026 at 06:45:08PM +0100, Cezary Rojewski wrote:

> TBH, I thought going for ~1K on the stack is fine, as IIRC, the typical
> limit is 4K. This function should not be folded into any of its callers
> either.

We trigger build warnings on individual stack frames at a much lower
limit.

--zR7Pi7/Vdix8+GKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmGK5oACgkQJNaLcl1U
h9D7VQf/ZhMADgigvlFIioEsEI4mNf1fsj9ObKK3/tFof2Fzh8mTWjTOoCTT7eN1
5JGxyKfkIUBB7Ih/B5rlLoJITolKwP87z967iLZJb25C/ExmfE8Rsi7rVtBeo3Nk
KNfoOXJOI31K0mihX4Bbk5uLxnHkxog/d6+NOdAX/rSDOL5+b3WCY5CfgNojR0tm
nr2Eiq0fI/REle1FwZW7CrzSWZtLn/rbUOaqd8FWGYgGkhKPy5pjJAFoaSudN63V
/U5Fln087LgWFPdkeMsYgryk6YHSC/afVZzNBtBVPwh0Ea3oBucHdu6arjNPYTS9
HFfy8dk2TlZ0JnPcqRXbSNAYOvYiXw==
=a5hU
-----END PGP SIGNATURE-----

--zR7Pi7/Vdix8+GKY--
