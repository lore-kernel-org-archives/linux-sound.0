Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D912F872;
	Fri,  6 Mar 2026 12:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798696; cv=none; b=hLQtbFa5tkEUxhDSLYFLTk1Wi4rKmO5IuzUirrvUoo5sdpUZBvvX9e0XdFZBqp4mr/vA6QoTJ8n3JvPrSe7M7BEmaJEWOoOJRz3IqcxH1eD+dSd9pVE9qrxuwUhUu5lisuNfLGAWqCUW14X/2CP+nJ1PA4Fpp9qVFOeWpi/QM10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798696; c=relaxed/simple;
	bh=OK/V7WgT+BtAQCQInwPGXadurJ8C6F9OPr0IpggRc9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sH6+Qn3QYe2r4SNxMt/QzK3koPU26Y/SdH+b2yxmKU+xCTj/9+zAWw2+WFAqXZaYf89dibHQKpvnPOOmsmK9ZP8aVMk+hC6y/p+RPH4EZnQqQ3HHpTnKd+iRo1im8vXeJ76te8MmA2n3jnEmiauvdL41aVDq/rONuGnVXkTkAlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FE8qIcXw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FE8qIcXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8A3C2BC87;
	Fri,  6 Mar 2026 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772798696;
	bh=OK/V7WgT+BtAQCQInwPGXadurJ8C6F9OPr0IpggRc9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FE8qIcXwuwa4rIAFBSmP0FKHWuwRqhRCstfE0Wn9aAhYo5O/CQCk6WLD5n98ngask
	 TBrE/SWVXAdrctaNZV0xgXe2qrCiUImfriM9W/aim2EibVhVJKsLbt1AcWXGrQXVxZ
	 zfoW/N5NSokhmUPuZpvKtx5sJg8hHgveItqbg8uGmEevdcDhX2Yb/6KmFnCB5nIEue
	 LAsPqmKdCsEaYcYq2TXceFGAtwfTr+xQEk+qt51CFlL0WYQpeX07HaHWQ8+mnh1xkT
	 iPyCOm1nD0DyRoTqzargcPQV+TssjQi9Bk2G4HbF3hj0tem1wqkhdprXJdQ3fN8Gzo
	 YEdbJpsZeJKzg==
Date: Fri, 6 Mar 2026 12:04:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
 specific cases
Message-ID: <0b110f10-dcc0-4573-803c-4dcf21643c3b@sirena.org.uk>
References: <20260306093949.1647452-1-shengjiu.wang@nxp.com>
 <20260306093949.1647452-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pz9X0x5TI724p1R2"
Content-Disposition: inline
In-Reply-To: <20260306093949.1647452-2-shengjiu.wang@nxp.com>
X-Cookie: A nuclear war can ruin your whole day.


--pz9X0x5TI724p1R2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2026 at 05:39:47PM +0800, Shengjiu Wang wrote:
> There are some registers which are volatile, at pm runtime suspend state,
> the regmap cache only is enabled, regmap will return -EBUSY when trying to
> access these registers.

> +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);

Please make anything that exports ASoC or regmap functionality _GPL, the
underlying APIs are _GPL.

--pz9X0x5TI724p1R2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmqwuIACgkQJNaLcl1U
h9AIwAf+K+r3S9KAElHMGCrYoq9nCdr8s4aLSb2bGWX8gkmQ000L840fz/C/xb85
mLuFuCsL0I1ouP4TxE0Nn4BUMpSsC9vVYkynQIq2BxJYZWapmPwp1yABbqK5KGJP
Z1VoihCfeF/qNdnqU/zHvdnfWaBlQ89tWlXQSoZ36O613/lMMBkCFnFUAogBrxqE
zbsxPLVtdH/06BAgkN2PradMy3hDZ698G0Lf9Cy3J3r3ZzCiDwwbDqrDhjmeNOku
Ir2ppo+Fm9QiTsiO5TUSfpvrWwAAQ0A/sLTXx+rMkyLvfibEeyDDkTOh1vwM9n+c
enP3CeLjEpv7mWdxHP1SKT6LJPe4MA==
=Ex6A
-----END PGP SIGNATURE-----

--pz9X0x5TI724p1R2--
