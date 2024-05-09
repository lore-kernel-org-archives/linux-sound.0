Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131112FF9B
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715269320; cv=none; b=nh9j3I2DpJnowai6PrVSO+y+549j9M0+ImQhJsQ7gRrh1KUyTRTk1rps0ALh3NalXzctkuZeXBrdJ5dF297L1dFnOTdmswVLasyeqN0Ky3hk3TI+r/GGIDRto6WXMtLMlABjWNiEjtNhpHGytvt973qMh7G1ONK2XmC2w3cL1PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715269320; c=relaxed/simple;
	bh=cj+UuLyJg+4fjqSa7LRBBoNbGDbzwmi9iNtluuOY+ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqbzCa0hUX0PLhWrzXyZTt5W3boMi+Q5xeeoOF8N1DbXDSanvnEfIH3rS5QgWzIeqsb/WeCx4accgAtO5oou104SZSkkME72dHUZAX4Ywp4cTUJx/plriOs7nYg+9oEJZ/dzgEaD+DxSQnKJoOKop8BMvv9ZrilguGpNSz0ku4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ylm6giDe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ylm6giDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93BE4C116B1;
	Thu,  9 May 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715269320;
	bh=cj+UuLyJg+4fjqSa7LRBBoNbGDbzwmi9iNtluuOY+ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ylm6giDeWl+e7cPrxU0Q0y9dRQcJweGtL64hS6KhNs2WrdsMZ0uWdcV5S23/0eUeY
	 LF5huoN9l0c9PQ56fqq/PICw3eN4G85CJw4DitEVrfSf03/Ld1FvkQV2Y2XCwB1B2z
	 nleSexUrzkBBT2LNn7yiiuFZ7L4tSUi7A5zXxJ8rUZos21/4Nzn6cFcv5miorHMCeZ
	 3x5OicfjB1mPuU+4ckh3VGPHbyQZvY9rFbGc3R/go+q10CQFt5uGJB47SYMGc2qQkW
	 ObKQcV2XcSVQsQAWFh/9V7qAstT8Rkhr3Xseu97Nmct8xdXfgFL/8AIYpP9deUlpTc
	 CT8uKZHRT2lDA==
Date: Thu, 9 May 2024 17:41:56 +0200
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	rafael@kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
Message-ID: <ZjzuxCqME77ei91Z@finisterre.sirena.org.uk>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
 <20240419084307.2718881-2-cezary.rojewski@intel.com>
 <892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
 <87zfsz9n8d.wl-tiwai@suse.de>
 <87v83n9lpv.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfvyHP1lSyfGBaeh"
Content-Disposition: inline
In-Reply-To: <87v83n9lpv.wl-tiwai@suse.de>
X-Cookie: Sorry.  Nice try.


--bfvyHP1lSyfGBaeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 09, 2024 at 03:08:28PM +0200, Takashi Iwai wrote:

> I don't know how Mark applied the ASoC patch, but if that actually
> worked, it's better to take from his tree.  Or, in such a case, at
> best to be merged through the tree where the new API got introduced
> (i.e. ACPI tree).

The cover letter mentioned a branch that's a dependency - TBH I'd been
expecting you to apply the core ALSA patch to your tree, but I can apply
to mine if you prefer?

--bfvyHP1lSyfGBaeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY87sQACgkQJNaLcl1U
h9B7/Qf9FhK/Wahz9enaI+mAPButkYyX4o74s3NIcIKA3SIT8/r4d9tUXKvHumlF
cdsglJ74uhkNt9c61zzyC/Vthnj0yNgRf+Y2AxEw0SDA51YU9UmOCujARkHKh7T2
QBC7/6NT4++TbI++f46WKtn+kj+bXZeypYbT+pFs+Eaa17B3jxPDe7sHrY6wUvNF
PSPTAJpmssMS9u88lpMy9b3PwwW6ycPyZLh9MUo0SeKGG8K+hCUcFiFK9xAlgNwH
HiInRnU3QNLu/G4DT+UU4i1rX8qtDmIbt9txlAjO382SJ93IzOG3VUmV1Nl2O9UE
CQpI1M6SyjTL7ZJWfl9qhsM802cgUg==
=vLGJ
-----END PGP SIGNATURE-----

--bfvyHP1lSyfGBaeh--
