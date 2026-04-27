Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8339D6D4
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 23:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777332461; cv=none; b=Eee991apz/aDAGpaMAQFkYJQw7k19JGzhkUD2mQCwogvE2hVhGX8X7KZY5yVTILrtyk6orkp+qAjd9hoYncW326zgHKQq1/gZ48np4GjtjQBw9I7rulUE3pLWT3B3ieUEp1AZo3yjiNcoEjaptqDIFCSOFjPBRQOrLGXL+XMY9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777332461; c=relaxed/simple;
	bh=a5IkK4nFH4/sBmMhqj64Fa9kIcMYOH0ckFTVJ/IPaQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/Ab773uhfh2L0kEG4w9daL7i8ZrIfOfgXN6lhauLlOXAzOPo8q1STGHBKl62NzKElTtz+/2BzB4twZLJ0XF62H59uUnIEtOyrT7vRkkRoyhl5TLuSLREmAbM6+w0WCt8yRmVFi4UKW3MdCmkF3yvhARDnD9t8VzxAg8S0RCETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHPaTVLt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHPaTVLt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C68C19425;
	Mon, 27 Apr 2026 23:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777332460;
	bh=a5IkK4nFH4/sBmMhqj64Fa9kIcMYOH0ckFTVJ/IPaQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHPaTVLth2Y9h130AweFvdfMab+dk2g6HcHqnxuN3VAzD6WUrs5wvi56HQAx75fvY
	 VZL+BO5aDDWBIbO2V0ve7j0acJpdElPAxK24fRAq1ZXNhstMMCcPqreDH5vp0lArBa
	 eMuRu0eA2SRdqOiLn814tiIS4C22IAIL8I0PHY+1/bvXLj8FuLzhES697dTfMPutKv
	 nxN0tDsYaS8sfXvOdVhHmktTL+BlTabQ8bHiswfYJFXrCSQwrB49Pr08764CJwlWQg
	 XnG5UeG135BdbhkzeAAyIYv7psMTXuJFuKER9cdvMy8qCzTiiMFFO8xNw7PLKnjr7e
	 gmoCYFi55TyKw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6383C1AC583E; Tue, 28 Apr 2026 00:27:37 +0100 (BST)
Date: Tue, 28 Apr 2026 08:27:37 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] ASoC: SDCA: Support devices with multiple functions
 of identical type
Message-ID: <ae_w6eh533e4UTnD@sirena.co.uk>
References: <20260427115925.3801099-1-ckeepax@opensource.cirrus.com>
 <20260427115925.3801099-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BgyqYgVMKna3SIhZ"
Content-Disposition: inline
In-Reply-To: <20260427115925.3801099-4-ckeepax@opensource.cirrus.com>
X-Cookie: Victory uber allies!


--BgyqYgVMKna3SIhZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 27, 2026 at 12:59:25PM +0100, Charles Keepax wrote:

>   * @adr: ACPI address (used for SDCA register access).
> + * @bool: Internal flag to indicate if other functions of the same type exist.

That's the type of the variable, not it's name!

--BgyqYgVMKna3SIhZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv8OgACgkQJNaLcl1U
h9BeiAf5AZZlUMQcXYK4P3eg1pgzVg7DkaPK4nZjIOutCrBLdnb4C3tkQvvVFM71
kWkUMV6Dc83gWbKZB0xMUhd6ug6ZHiPt2cALVDsjig3D3tIaxFLun467Ayx8TVVm
8S/WYWEVfB+kdrL2bI91GmSOMAfCwTuXE90jH8TWiRwSMg0SV56BnNXzoNSNIBTl
D6JzI70NaanWwVjPBoEXjwftchyB8UC3zYP99QkMXs/ulT8/hlgIXKHoeB02ntQB
Seimzi2vzqS72/4sgvrpla3+tIKoYZxm1MjFvkWh9j+MjtM5x6WaJiCVq6CMnXXD
o1Nvexw509BfYeSAUkdEN2sJcZdiNg==
=MLzG
-----END PGP SIGNATURE-----

--BgyqYgVMKna3SIhZ--
