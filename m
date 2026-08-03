Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE7D36B912;
	Mon,  3 Aug 2026 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762433; cv=none; b=jbrYFv4g6CRbxeB/erWTsgLcnmnal4tM7EdA0usZB6Esr19uw/m9Tk6Hr8sgOofnE0HkJRfRp+cqajVCw7rk+mifcMbxv0LldHXL3xH5us4mmCWpygNwoW5BqKpM69G/C0DD+DVfbGTFQCCuCPRTW6xWOmevN0PQWIjYgUbhNVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762433; c=relaxed/simple;
	bh=new9gh2txBW9d0mrcNSLfMHWFs1Oh53vrrSG5XD1CxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDBk7oDpeTQSiLPezDeXwv017nxr8ihlQddp/y8BL/kpqNYnrkcTHzUisPO+hgh6xNCHMcixM2akoXhqwhgQh5E+UW7GJWgSATuL172HkQGTkMHtitE0A2tl1o6GQ0FXppWaA3IQRu1Xko+yz0wBAKDlMqRVlxNj4IPU8FW4xa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEXNMvV7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEXNMvV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9641F000E9;
	Mon,  3 Aug 2026 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785762432;
	bh=new9gh2txBW9d0mrcNSLfMHWFs1Oh53vrrSG5XD1CxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cEXNMvV7KtLKNxMJbIC9ls5LK8KHjhdYSW0ls70abgfitEuK9KY/HhByPjcP7V81g
	 upxsvWktaxa5saR91/ZhKfxExywaG+suRWLzGBfSaGobJ5Ohu8koLH++t3vczT6ken
	 CyxjDyx6trrjPdOexpzfsGjWby4LaSPSp3UK/z5XtSFLUs+oR6rLtyyM9VPhVa1SYQ
	 1TcWDE6OxjdIET453oXw2A+V7eDA69FZlpcRDJrpY/PDqgEGHqpdBwwzwi8O4sr85N
	 ZlMBbyAf7TUNx2IpMVp3blkawvIB2BPAKsgXjLlC+bn0xHCPOSOgMKZicmvMLj8vt/
	 BLtCNtLYB4CXg==
Date: Mon, 3 Aug 2026 14:07:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] ASoC: qcom: add AudioReach TDM backend support
Message-ID: <47bce201-5086-4f70-9e4f-e5c50059e487@sirena.org.uk>
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l/8tA3Z3Wo2XVIoZ"
Content-Disposition: inline
In-Reply-To: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: Prunes give you a run for your money.


--l/8tA3Z3Wo2XVIoZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 01, 2026 at 11:16:03AM +0530, Prasad Kumpatla wrote:
> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
> up for the sc8280xp machine driver.

This doesn't apply against current code, please check and resend.

--l/8tA3Z3Wo2XVIoZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwknoACgkQJNaLcl1U
h9B+qgf/WiETbsqrjnJzQBoKjbD0b3cZ31w3sKwV04uYkcE5u6k/Z1K0IiG4dteW
JMLGUvim3nJ2E8paVBBaLYKcKWT9K0+vxMem9yWo2+2y+hrTXUu1dUq0h55INMN4
1OFCY6is5XTL2Z5qxp63Q0KVGYEklnfa6VgVZUxV9G7Z9nWHuIRYpumBqwcvk/pT
ANWRRNJZjocZi1yWfb6eCi34KfDLteOPXcR2E/KhT1cyfOYX9v8w1AtzRf4NnC7v
yJWUw3wp9PfFSqK6HLgQYGJGETXcpdezElSvjTYJPWPCPEoKcfhijfnTGgVOWFlS
4vHH3W2uwIsO4GN27WmAwlu2I6p4/g==
=weH9
-----END PGP SIGNATURE-----

--l/8tA3Z3Wo2XVIoZ--
