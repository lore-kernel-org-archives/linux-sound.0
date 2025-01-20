Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545BE18E743;
	Mon, 20 Jan 2025 19:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737401334; cv=none; b=hnv8aIMo7tk11cGYxFfiWJhgUFJHa7UupITr7FoGjojKUQAQkS7NFE2CtgNzzfej22+J+WyuRqyzG2hnqh7/dfQxtlzRNPJR1QVWIkchpGfsK6j9NZHC1yC4b4jfLMsxFZXWzUZyi7P449mZczlt67xQkZXYY0BI8bJsr2cYgDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737401334; c=relaxed/simple;
	bh=q1reUqGeya/ixjryOK53cDkVNv12CZqxlsiJ1QlDzKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZypkJImZpw752TIshccW+STZverbiut2f6Mx1lYdC7hQSRMPn6c2CHOWFJVQxAx13S91TQXTMRVDU3S6baS6/WpKqGh42CVYsJWxXzb/88yHeyQomjpll/N8XDhLvdP6qr/4UCQ74toL8c3ZrAMOUlYK6MBKdJCWR2zB07djR7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWBWYv/d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWBWYv/d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621D3C4CEDD;
	Mon, 20 Jan 2025 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737401333;
	bh=q1reUqGeya/ixjryOK53cDkVNv12CZqxlsiJ1QlDzKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWBWYv/d/tO1S6+mBu5igDAHEFLYGIhX8a4QmtQSnluDsYfkPyMzfRLXmEqJDXRUE
	 J9nT63PJajotYPRG9blUkwaJuZZ0ZZyryzLnjNnys5WhdcjuLDszOTgm6xww1+/DyG
	 6puF52oKpWowt8ypvzHVX7Z1FK8KuIZaERpCz898afF/nLPqMOAx++iWs7QpoIiUhF
	 ghs9I5SbbAFOa+aD4fcR6w+wBrHjC1RmYG4uf0K9Qn//wb79bRmz3I0u3lUvgEzeux
	 sU4nk0sVLVbpIh8jSpuXISmMC2MEHyuyEbjPSCi8AiASwA+RCsMbM/ctjiIYaerS/X
	 tdIKfeVFaOKog==
Date: Mon, 20 Jan 2025 19:28:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Message-ID: <365c47d1-6b19-452a-b4f7-ca8a64e2754f@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
 <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
 <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
 <208098f6-1022-437e-9ae2-964e9bc89942@sirena.org.uk>
 <1e10c851-f4fc-4e76-806d-5f1214f29bdf@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iFDstItUjAZwmnYe"
Content-Disposition: inline
In-Reply-To: <1e10c851-f4fc-4e76-806d-5f1214f29bdf@amd.com>
X-Cookie: No lifeguard on duty.


--iFDstItUjAZwmnYe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2025 at 12:47:18PM -0600, Mario Limonciello wrote:
> On 1/20/2025 12:39, Mark Brown wrote:

> > That does feel like quirks and new features rather than a completely
> > distinct IP.

> I see it as different forms of tech debt.  Either you keep track of which
> features the 62 vs 70 hardware supports by different drivers or add logic in
> all the relevant functions().

> The former increases LoC but reduces risk for mistake (IE avoid oops, I
> forgot this is only supported on 70+ when adding new features).

Until someone fixes a bug or does some subsystem wide cleanup which
affects both copies of the code (perhaps that already happened since the
code was copied!).  There's a reason why this is the general kernel
style.

> Changing code that affects a lot of hardware means a lot more testing too.
> Perhaps after Vijendar's series lands he can split up some of the purely
> duplicated functions into helpers or callbacks and arrange all that testing?

Well, it was getting a new spin anyway for the bits that didn't have the
serial numbers filed off.

--iFDstItUjAZwmnYe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOo+8ACgkQJNaLcl1U
h9CzTwf+NdqnwJmZFgeksO0umzIOqdzCEmUoTUMGGktQSl6URefs+EyDd+UVxIWr
hr52nlIM/faT/+yUZUZNEjs4NPacWDlDiKItd/O6eaw9p3Rt2ICQEyeCe3QBrwwH
ROaOeo3TUOCCzB6Cij6OiBJ2RwZXq0Y8wvB26fi9jU48KjvskBDyadMGGjGkI+LJ
u3Josb5ELASobKaSq2yzrETIw6ivxWDY+mqCBhrRSljjwde+G070Nx4Hve/qAAMV
XO9OxwOU4PmpMXFDcq2GMCn1TkxvB2Wg933V8MaYXTfOf8d8mTaUqfXKqc5E1ZCl
IcuMoP2i2lkM/2QeSGrX6hn1mBH9HA==
=pfPd
-----END PGP SIGNATURE-----

--iFDstItUjAZwmnYe--
