Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8CB38C42E;
	Wed, 13 May 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684214; cv=none; b=uzKmi3ZTBiSnq36162RlywWzqUu85uaCfkTrnt0UyNDLw1lkFx30RVnuhh2nGszFfk4LQn+FfmVr6n+AVtAEmm/WMMHYiXvJ+NZFYP52R2DM+KHX/uLVNWhr7bZ3ejTQMyLTn5QJa9yYimQcuKTkYaKO4cVuoyBOsvpf4fwxXgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684214; c=relaxed/simple;
	bh=aGUmxWzxB6Wvm2JdF7V9CfNbMJmnwH0MBKEzwmH+fQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNNLD0HD52kSUtdUjCP1zjGDiFsAlZzSvm9jYU8U7tmrOw1eOAuhSter26tvMTRaQGMfrejma4llnDNJLkSKD2b6exrV3ZqAuGUuJNNW2rQBisLBHthSxrNA6mKkJVX4L9xUbjghrA9jef7xPY4YRbkmzgBE9d5Mj0rNLVnFDrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dfm2AG/D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dfm2AG/D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12AAC19425;
	Wed, 13 May 2026 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684214;
	bh=aGUmxWzxB6Wvm2JdF7V9CfNbMJmnwH0MBKEzwmH+fQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dfm2AG/Ds0yonCgkGn1GaXh7TpfbKRnf1GILofyNq7wAlsfSbwa+79WynxHvJL5mi
	 Bmth6H2S5/9P2pHkhJFM1SjcIiK9m7OPMiThXguhHRdIBguFqGO4f3iL4Tt3BpYRve
	 6PN3c9we1R9ij6AN+NXXFbnWLYqUPoEXTM4P7A8TXoS1taUZHziO1ng7qv0efrnzAz
	 yzTuDunbRpeDlEyEXPi1BMiOLwi34WPXHbZFTo9dT81AkCW7+ZKCyNI/lOeLbgiJxc
	 Dl4XE97uf8/DUJOy2OUwjXHJfzSOYja0wp4cwOCp2Kb6I1sMsq/bhMT6IRuIdrkEbQ
	 mrP0ar/u2+ddg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E111F1AC58CB; Wed, 13 May 2026 15:56:51 +0100 (BST)
Date: Wed, 13 May 2026 23:56:51 +0900
From: Mark Brown <broonie@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
	Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: fs210x: fix possible buffer overflow
Message-ID: <agSRM7ua38bI4ZPY@sirena.co.uk>
References: <01092e5d-7cb9-436b-82da-fe23bb68f530@al2klimov.de>
 <agMeMXwKVrjJZ8Tw@sirena.co.uk>
 <40e04485-3d2f-4359-9d7b-5b530d0e01da@al2klimov.de>
 <agPVoN1zSjzYPqpt@sirena.co.uk>
 <agPmOSjHXOmpy2FJ@geday>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75nhSHzUBUWGRP19"
Content-Disposition: inline
In-Reply-To: <agPmOSjHXOmpy2FJ@geday>
X-Cookie: Truckers welcome.


--75nhSHzUBUWGRP19
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 11:47:21PM -0300, Geraldo Nascimento wrote:
> On Wed, May 13, 2026 at 10:36:32AM +0900, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Do you mean the codechange must be explicit in the commit message
> instead of a generic pseudocode version?

No.  I mean your patch cannot be applied, I've no idea what it's against
but it's not my tree.

--75nhSHzUBUWGRP19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoEkTAACgkQJNaLcl1U
h9D41Af+KsF+fbocT12m0QSWJpdh1PPDSMJK0FZ8kDqeVXfM63L+UivUF1aSgcHW
yV53lyDpu/P6NR2ApAzxv4KqUK6WnbKObeT+cwccwmQhDFWmXzj50l6eU5/NQTzi
eVtD/7ohhv5UXoBQG634si6w/LJ87mJ7UT8Z3AnZB3ZDlwzE5YZDJGKDLFbMxJ5O
AWxurX9tSk1BbOfYjRTwwEyqiDRxhw+RvNSDfvdfdkcWIoA7/NO61NqclhKMHITH
T9+WyXqkzBAJt5+vQVoDQK7yORnzs0ijXEWtBu7vCa7OWMfqQ0aXNBSN+CamZb60
owlB4eo+Acuyt+JMNHRHoE4gNHiF4w==
=P6+O
-----END PGP SIGNATURE-----

--75nhSHzUBUWGRP19--
