Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C2537F746;
	Wed, 29 Apr 2026 02:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777429963; cv=none; b=eLTC9hya7H8FKa338RPCvDF3RjMfVL7odtAKuUt3z+PLbIgSli2dwQ+jN8M+xz1JxJ4yKnVCr0LaqrNl+xEhOAf5rVWCdQwmGGMOBN3qs6xdcQGy/8YOApnfXeK7f4kRhCLPwP1kVvGt7jG51RsSNOezL0ptTYw8NIFl0UmTUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777429963; c=relaxed/simple;
	bh=W81uUkEy7KPTgF2Dy6r7p6wtBRPqM/IKhBRulVRDGqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAJSK2D+KgwbCuhaQym/Yc1igkgPO83TXanNwSsKzemhFaxOAf/8/up1w7R81vCjMLr8vAyaVgKH8YS/g5VtYGwUS+cA2G4GomW5hkR6ib3iNTzW0xw/JhaUMlZdm9zaM674dxh2N/U5PGovQw5Ea3U89Ae2qEvQl5euMZCr8ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/XHH52y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/XHH52y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC3EC2BCB7;
	Wed, 29 Apr 2026 02:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777429963;
	bh=W81uUkEy7KPTgF2Dy6r7p6wtBRPqM/IKhBRulVRDGqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/XHH52y+VDppxvjzZBqtfA84pxQIkexvF6YIBtaWKuBGO9vu2sPwNrq28NUBuPjR
	 gDeB3+BuWF/6ce3J3rQXUtOoVAw/UfvOWg8IRalE7ApPQLb0414k89ellV2F7s1w2R
	 cTY77uzdVHo9Ffw8HpHqTPCBHRGTRoqr4UFzvHAPZLGhr0m+Gsqnms3mrVR5xmuuPq
	 Kk7r27+7agDolB4ebq0N3GcUQNrRCDMwsy+nyz0pxpb8bgx5s6mNco+/9lh5GcH5a4
	 eYtNyZK5p0efltfGz6qOzR+UxTP6jfePwGBcACd4Fvh5xGIBiZ53UekiSfcE13ersK
	 lY/JB8D4zPxhA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B480D1AC5851; Wed, 29 Apr 2026 03:32:40 +0100 (BST)
Date: Wed, 29 Apr 2026 11:32:40 +0900
From: Mark Brown <broonie@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Yixun Lan <dlan@kernel.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] ASoC: spacemit: bug fixes, refactoring, and K3 SoC
 support
Message-ID: <afFtyCuA28042C3b@sirena.co.uk>
References: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AdB0/2Kbr7dgh/8k"
Content-Disposition: inline
In-Reply-To: <20260429-k3-i2s-v1-0-2fe99db11ecb@linux.spacemit.com>
X-Cookie: 667:


--AdB0/2Kbr7dgh/8k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 09:38:45AM +0800, Troy Mitchell wrote:
> This series fixes bugs and adds K3 SoC support for the SpacemiT I2S
> controller driver (sound/soc/spacemit/).
>=20
> Patches 1-3 are bug fixes and refactoring for the existing K1 I2S driver:
>   - Fix RX DMA params not being set when TX is already running
>   - Move hw constraints from hw_params to startup where they belong
>   - Adjust FIFO trigger threshold to half FIFO size for better DMA
>     efficiency

Just as a general thing there doesn't seem to be any textual overlap
between the fixes and the new features, it makes life easier to split
things up - the individual serieses are smaller and it's easier to avoid
dependencies that cause issues getting the fixes applied.

--AdB0/2Kbr7dgh/8k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxbccACgkQJNaLcl1U
h9A9+wf7BD/aVPdConysbSRuDNL+sUcw7BM99xirg8cM3j76wF+UIg2DcytGtqhW
oa53CpnKiqeQV2gvRBCLtNLC3ah8N6/vqDwk2Tjn8L/WfybcAU/zDUwH5mUfezQn
A+3O3GSnzYPV6xK+0neGwofZ7w9ymGCQaUHLMGea1FH4aMos7g2JbncIuEY9QIcn
U2ZmTnlHJrPRG6VWZXPnbYOBLeJrbA90KesWkzH208l4N3FetXMFAird89S3DFnl
VmW3zNR1ZcF3GA2EugFcRTVaEfgkHTC2H8WhEMX+zuxxTsaEOyZZ7MpcIEVn+2Gy
bcnhE3bQTMLU7iGu9JBHg3prOIdQ9Q==
=UUPA
-----END PGP SIGNATURE-----

--AdB0/2Kbr7dgh/8k--
