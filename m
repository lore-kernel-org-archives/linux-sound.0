Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142C613C809
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719232662; cv=none; b=DI8PIPjKN5V2JE//KVU42M1euGH7lcePjISyifFpZX9bjGkljqufHjpoHVbIReJRbABVglQn2T4Xzfm/XMXiAE6dUpPvpCYzXsLN433mIqBzVQqSA6u4K6FRlYPeJF24J+ON8Js+ur5wtmSqCpf9g1yO8jH/bGb6Y13KLYxTANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719232662; c=relaxed/simple;
	bh=5VPx4voAM1j1D9PzeWsrAkqElvUIEYBdZlBVSM6s6LY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CiqezhZMmtPJrlp39G94eshBn7/Ye5PRqgN9KAvYwBBRbFgP9KXpKE28pSrnhqecGDCWs7YxN1pRfXTFaMfNIQbUurUJnhk3MHCDMpgIduWVCom3YGtSZhLZ3kM/KyYfjkrjxcnpwbLawQn/6FIOj8JDj86S0nSC5Peb15cjsxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JR/w7tM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JR/w7tM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22161C32781;
	Mon, 24 Jun 2024 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719232661;
	bh=5VPx4voAM1j1D9PzeWsrAkqElvUIEYBdZlBVSM6s6LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JR/w7tM5pfqe0FfoumNp+iJVobXORI3HI2C2LWn3w1IMh73DH21CX6Tl86TmYB0MF
	 O/c0pfVZjdJXWoJAzgrGQX+YUqAFgEK18RtCewVIgwRY4Grs9qg7DU5XEohFeeliww
	 KBPA6n6p06tfkx+2Npyz0I0fgAvUzcC1Bb2j6/ItqfXQRr4sOh+pC3w3yHFRUuLJQW
	 jRGs0fabQywc5l8bcvSGmwLVxNg0LEuwr4UDNcbDHwunhlLaViV2XBLUeKlIA33qpL
	 N+CUWK3JwsQ21u4gD5ZwNmp37sps/tEdeYVkYATRdyqiGHmzV+xiqOHJWADmVUpAAd
	 um4IYbvMuLBGw==
Date: Mon, 24 Jun 2024 13:37:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask
 function
Message-ID: <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
 <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0XbT4Ni5LjwX/prS"
Content-Disposition: inline
In-Reply-To: <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: Allow 6 to 8 weeks for delivery.


--0XbT4Ni5LjwX/prS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 02:11:17PM +0200, Pierre-Louis Bossart wrote:
> From: Brent Lu <brent.lu@intel.com>
>=20
> Add a helper function max_98373_get_tx_mask() to get tx mask from
> max98373 ACPI device properties at runtime.

Similarly here.

--0XbT4Ni5LjwX/prS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5aJAACgkQJNaLcl1U
h9BwDAf+Ix6++u8cXGwWway2Gm2lKl9P0MaeP04OPNNlDMKYSdjxi3+20X4fYzeX
O690a4nWmsc3/YoCfUKP94J+LbK2HrZit1P0uRBxdz1E/ZvHXziYqFblLF9IcTPm
VnmYsN0K/EUbsnVNpy4OB5fUc8/b2Xx995RQg8AqORm3ALJvtQfTwW0a65zEUW7A
MUQ1v/+f7sev9QQ9w5BHCSfBHxXNw6xulzgQuDBhG5bnm6lFCl1nLQOc4wx6vk26
bWehSKMtnmsOkT3JIkz2lAajWzE7cYgFhudPzCmj+rpypMQxnlAG+7nqn32Nipxf
ZlVlM95oh9LDWQkeyghm07fke1lvvw==
=KjHY
-----END PGP SIGNATURE-----

--0XbT4Ni5LjwX/prS--
