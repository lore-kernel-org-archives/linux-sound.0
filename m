Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F24357D09
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253805; cv=none; b=te+7T3npJmJWp5x4OLIQVEQt+Ee8IvsCW7VirByLByzcsTY+BYTmnX42amazLddzI9HP6Jeqg3oBAiy+wpxNEbTCFXue8Pix4bQBIDrbbwNKJReI4zC7Hljz/ZUz6y0zbJp8ovFGT+Xy2DJcKpUk0/aoX8zHqGsMXD0+/Ff32e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253805; c=relaxed/simple;
	bh=8vZcz6qAZD4uRcsZpPiAXNiCjuQZ+E/uDUWR8V0b/vM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVssrBMdcJPXaP/zDN9I+50hbkLtdCusdfYNOOKYLP+33sXk9Qqh6nqohmyl+8Bhkt/piYR/P/LXzhM+Geu0f5kqsprjWwzDktAtTuZ2gjztZUClObbvemCyDBeFy44tA9p7XCzBXK0xHpZoracZscktYoDWlorFCWC6R5+22ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNIsErs4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNIsErs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8171F000E9;
	Sun,  5 Jul 2026 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783253803;
	bh=wCXuoEM+zXYvIbDqg+uC7kK8f8ZsiBmBh0QdsgSA2J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DNIsErs4F0LN6jZPLj6sZNSWOdc333z7m5CeFrORtHp55ooIFCD0YHAhSd4B8MSlb
	 BnayAuHJaoxcaazU10maaDj0o/gDLiE0hSwdjnDeUUY4oWnVuFZ5WtLIyMfPkc5fxk
	 +Wgwfc28cWC6op2Exr2AYyEKqvZrE/p9zr144QU/3xP8J/eG7gyFd22t6dy1og5zQm
	 Kmw2vgG5C4AqgfQ2OA1Z/dadEymbg/QLizKhHyIPAMsh1s7gKrSHyo9xvholzYTtNi
	 AlDjMONZFslEyqF9huf4G/B2my4WDSyXrB+qwgA47Z78fMEb2vWn0ca5+Nriu1Qx+T
	 BGVzKyyzVH9OA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0D9901AC5AC6; Sun, 05 Jul 2026 13:16:41 +0100 (BST)
Date: Sun, 5 Jul 2026 13:16:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.2-rc1
Message-ID: <akpLKbPAdPnoGaww@sirena.co.uk>
References: <20260705115220.1C9801AC5AC6@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+ubnJuzOtu+Kl9I"
Content-Disposition: inline
In-Reply-To: <20260705115220.1C9801AC5AC6@finisterre.sirena.org.uk>
X-Cookie: Whatever became of eternal truth?


--W+ubnJuzOtu+Kl9I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 05, 2026 at 12:52:19PM +0100, Mark Brown wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e524917774=
82:
>=20
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/=
asoc-fix-v7.2-rc1

Sorry, this is a duplicate due to me using a different machine to sned
my SPI PR before the sound fixes landed with Linus.

--W+ubnJuzOtu+Kl9I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpKSygACgkQJNaLcl1U
h9BMEQf4+7UFd8njlt/KUjSv5esd/KP3cYr1IvAJvXEIDU+2kglkv4ykI/nR656Y
1NImQWWQywZGh+dWCb3P1/g/v6ff/CHwsWjyIUJxHnSFZ7MnHUMhazGWCkgf7qhW
x+uaGt82AU5fJmV1pQL7i6wKEooPve2zydRTNXTQR0Xc147eO6ax0mIoM+DNSoFD
6Bp1zZyBpZt+DhL6166zncXve1UL1UxiFHZGUD6epIv1P02+dGcPFMfQRQlAeTIx
4KQvHJ9qKhFjh7ReCNU3otIE4gyztkaxAdZ242s8yHvWfgSwfbPq0qVcIpwsV9Pf
ppasO8Sd9wrO7W7aeysTiZVacF/v
=RHX/
-----END PGP SIGNATURE-----

--W+ubnJuzOtu+Kl9I--
