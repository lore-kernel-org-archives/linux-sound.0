Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBB737D130;
	Mon,  9 Mar 2026 22:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096162; cv=none; b=o6Z0RyYxMcGBlBS3kLB0fCSJ6lObQvdgTnfFQUI20hpTi48X4UTgaDUVHDRrMEyJhefjGWH12WhIvX1bfcrrzJATwVg/B6OMs1DbTCQsP8enO8g06HKdeJJa4uMyDoRmZV2yoWguSh1WBUqROwoQPM2xB7J6NKWFFj6XeWIorNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096162; c=relaxed/simple;
	bh=Bi9d4BIltjknxiuJZWqQAFnQ+2ZabYGuk5I/WsLd24g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IR1U6WfxiqC+2o4ohh6E0j60MN/NFj2j8tRSlyA2dzCK5jVo4J0OqQFF/MqT91GFILa7BbRlXOzlqTw5pwak87vHU63+B+1OdC3SUkVOPZwDDDiskTwTxVbkq8IV0Ap00rjN5vc3EgKMe0RjC15F0ZDEWNyI4w4MyYCBCPV9PBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrcOhUeY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrcOhUeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730E7C4CEF7;
	Mon,  9 Mar 2026 22:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773096161;
	bh=Bi9d4BIltjknxiuJZWqQAFnQ+2ZabYGuk5I/WsLd24g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrcOhUeYULkAa3PBQjSSHs58v7Hcn94H7x3qQR4MndDKmYbW8w0B6yl7bfc2N6Luf
	 nf9WZuCNteU3QefcaFMgPQZSRB4T0YBp+sS3UfCyw72cTzbiH2lLegpKhPgjmiDica
	 cVa6Wdxzq4MD1j/y8DAZ0XbpaamOjY0t9BcXuDMAALpD1lkn2JXNWda+Zvg3ILqart
	 XdArarED5DiPpFqeOeHnRQj3Nm77e0H13cz+y6ocON/fBXuzWyQ3a1XVbt75f3I56h
	 dxSbXRT6e0jR1EWtL1PTuy1mHGUpF2n9KX81EVCARAQwyNydWB3Nf+aLlJVejkhvbE
	 iiLur/UcslNZg==
Date: Mon, 9 Mar 2026 22:42:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] ASoC: fsl_sai: add bitcount and timestamp controls
Message-ID: <9c7c407e-ced4-455a-a8a8-54b42f706130@sirena.org.uk>
References: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
 <20260309083530.2977163-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Plf1lSLyaQKV9jG+"
Content-Disposition: inline
In-Reply-To: <20260309083530.2977163-3-shengjiu.wang@nxp.com>
X-Cookie: Nobody knows the trouble I've been.


--Plf1lSLyaQKV9jG+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 04:35:29PM +0800, Shengjiu Wang wrote:

> +	SOC_SINGLE_EXT("Transmit Timestamp Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RTSC_SHIFT, 1, 0,
> +		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),
> +	SOC_SINGLE_EXT("Transmit Bit Counter Reset", FSL_SAI_TTCTL, FSL_SAI_xTCTL_RBC_SHIFT, 1, 0,
> +		       fsl_asoc_get_volsw, fsl_asoc_put_volsw),

Sorry, I should've spotted this on earlier review (though surely you
will have seen this on running mixer-test?) but these fail:

# # verdinwm8904.2 Transmit Timestamp Reset
# # 0.2 Transmit Timestamp Reset is a writeable boolean but not a Switch
# not ok 366 name.verdinwm8904.2
# ok 367 write_default.verdinwm8904.2
# # Spurious event generated for Transmit Timestamp Reset

The reset controls should be volatile, always read zero and not generate
events as a result.  The name needs fixing as well.

--Plf1lSLyaQKV9jG+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvTNwACgkQJNaLcl1U
h9DhTgf/b6Fq0WRx0MvwkjrEGAXyqN6CpfUfSa1kTG7G5mb6TJq38H1+Q3HrX8cw
qmAB8PI48rrS27plaXDnc6FVk7aB36jwwiPE4dAB5rPButctaNZ4PoTNAzWkHgNk
JL0kBy+gXsHDr4XdxdyYBocdV4szw6a6YCodA26NlOlxQAwTx/YBbb/q7MBYW3lz
BYQG/XpqICeGP5Cbf5trDgvGUgoZw5zm5IfNADgZpW2MaVDfM3fvsaXNU3aYq/oG
LNFfrXg9VGDE4cVEkb7uXz30tUpF06l/m2p7RQVDYMxlx5JhH9pg9wjJs2CPga3r
LSsxE9jFO8IkadpZEzy8kw4DBOlioQ==
=iFMt
-----END PGP SIGNATURE-----

--Plf1lSLyaQKV9jG+--
