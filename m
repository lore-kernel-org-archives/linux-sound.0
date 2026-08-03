Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F33B47F5;
	Mon,  3 Aug 2026 21:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785792710; cv=none; b=qpRI9ADEAOYU4QUYiSrreDS45FZ6XAFI2RFiPkjrjM6vMlMKohc6tD6HOjyVQ3JCcFrn4c2BZe8J1k/5iNYARp+Wfc98GTnT2QTJbs1keRphwGDFRCBY+JBSK3ax/IO4ARbxoPBoLx/bdjMBe4lRJwWkTs94KASWkjt00e/WD14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785792710; c=relaxed/simple;
	bh=1boA9uu9X/v8Uud12H6iu/wny3ZGrn69G5OCFDpQeqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nm5fmxyFxMnqVMkaaWWmwHmDk2saz2Y57EQv5hDVNpRxzyhkAsrr9XhiUsRw2CqSKN9Ey5yMsG/U9PoDM9+pw9K3rBUts+0Zd0div3B0qOEBkLkrrKWgYLIUJmi3vTCBgvuZ/vcF3AwA8bKHEDhIDdjh0w5WqfDLAMfE7Xwre84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njBnbM5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njBnbM5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393231F000E9;
	Mon,  3 Aug 2026 21:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785792709;
	bh=/9Ti5n/72tblCcl9KsbLsR8o/ouaD+YWMPOtsNAyORg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=njBnbM5c32reDmarRByD8piJsLo4hAii9b8QdHFXsPCekjVQBGkMWxM8YO0SXSO9P
	 lD+DJOSN7LlCkGYLgMFeBFabW99PhMmVHqYdIHbLCEi/y2j4afi1kdG/+HVzSWwYQw
	 yLjcGfPuIDDnqZ6DGe9AnaZ82oinU3D4oKUOxgKESiNvPo5aiR++lcFL6/hUBiXw4K
	 4BZVcXCeoBvKw+1BRUYOn85gaYdfHx0aWIWpJ7eWebW/FD+yUbr8nU4UKuj9fsJsaD
	 2HIKHOKD6PqkzFAXiJE751jXnHF5EB0WijPlQTSrlnrpRxyl81MmN72D4v9LmYahjc
	 07PLsQ8quMc+A==
Date: Mon, 3 Aug 2026 22:31:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/7] ASoC: qcom: add AudioReach TDM backend support
Message-ID: <467a15d1-158b-4ab1-825c-475fe89a8b34@sirena.org.uk>
References: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zFEno68VFnLf+Vf2"
Content-Disposition: inline
In-Reply-To: <20260803195624.3606352-1-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: Prunes give you a run for your money.


--zFEno68VFnLf+Vf2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 01:26:17AM +0530, Prasad Kumpatla wrote:
> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
> up for the sc8280xp machine driver.

This *also* does not apply against current code.  Whatever undisclosed
tree you are sending this against it's none of asoc/for-7.3 (nor
asoc/for-next so it's not missing fixes).  Please test that whatever you
are sending can be applied to my current tree before you send it.

--zFEno68VFnLf+Vf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpxCL8ACgkQJNaLcl1U
h9CFRwgAgy/tC6vGRf5XVmaw9c6ySzx4UVNNUjumvVKwUbPzgulrWoK1zDcT6l9A
c23PkhQqqymo67yC85jn5jkRtjOwvLtE+P2B3L+8LaFDNLtjD2QeQNNTVFpoKqqv
VsjW8uZ/E+IOnUDOvWoNYrxbsfomeRtB72lZaixUFtYhoR5S11oYWewqEk+eWbOs
Y0dEcTzAW0Ngc0zVzWpm7e4G4GCpVKichDn0R3VlaSKZGp9W5k1/nXlQDuoD/wOV
xz5jt28/YCwEp3D0gz8DTkb0RReQAh2BJo1SsUHyrcavyzZ28mXSVN352+QF78Mb
pFPRYBPe6HqqOfRW1bWULl8kEUeAcw==
=lRyZ
-----END PGP SIGNATURE-----

--zFEno68VFnLf+Vf2--
