Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1E042E8C9
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 18:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780290; cv=none; b=rIyuWunda21mQNbVPX2VmAjwW1gSGiRtWPaNMz2nWdrclPEf85C0DUAiXfj73V79o8W+fS3I8xqe3WiDMAxNR7M5P5SQ0u2kn0CNd/WeOPR6/SleIHrP859S12VoODXWYNm1qUXhjAhFvKH6W30YgMSq6wwNOfVrPjieSOwhUZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780290; c=relaxed/simple;
	bh=k+7Tn2u/nJTUpPXmd3+wYWVn986Wf/6QDAGDdbyUMtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyNCTAB+Nii+SWFv80iW/LQo2PawpCwOgDyDWmVlMPCzm61HZalwH8lnWBshbaeSkS+i4yiDhggws/qDIXUQPW6JDzxq/NJv9LKy3DWUytJvEv6aWPG2KP1ee4pRfudCoT6GQvqgLXH/AXrAqmaqasDlCOggoWCWLqV1i1LjGeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=got72n+q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="got72n+q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DDD1F00A3A;
	Mon,  3 Aug 2026 18:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785780288;
	bh=peXK7HDp+tDJesuRECP0JWOWa5rYTLAnFulBCLegkfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=got72n+q/gIoR8xXclkNhrr56rfBYMM07zpQMmnQIStLPYkYWwjGyUNS6diD7hsid
	 JscAOvf2YWksdIkm3zmBOtxlQMRHKsGc9yUmPGeLrCU0TSjXfEAkFBNHfjqyzJHnK9
	 JMU83Al6G58Yn5QG48pcW+QF6UO1qaYVEf95uF3SxcstPWdlrcvIp3Ek8ntDIlaL1T
	 TptmEIZbKjb09aYcsTNqjnlfyrWyoylyWqQx5xvdOslIL3QmKy8FEURLwt0pM1uY4n
	 QToSce6pD3dcI7Zkaj2hl8KfDMXyqDZJAIa2ojJiSpUm6//vORH7kiqUy9IB6Sg10j
	 d/86e6N7i5vcg==
Date: Mon, 3 Aug 2026 19:04:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
Message-ID: <c474b067-e549-4d51-be21-4337cb8de184@sirena.org.uk>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
 <87wlu8rmr3.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZPtySfMzVqythYRM"
Content-Disposition: inline
In-Reply-To: <87wlu8rmr3.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Prunes give you a run for your money.


--ZPtySfMzVqythYRM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 03, 2026 at 01:55:29AM +0000, Kuninori Morimoto wrote:
> PCM SH7760 is not compiled with COMPILE_TEST, and there is no defconfig
> which selects it. So it is easy to be overlooked for compile test and/or
> ASoC updating.

> -	depends on CPU_SUBTYPE_SH7760 && SH_DMABRG
> +	depends on SUPERH || ARCH_SHMOBILE
> +	depends on (CPU_SUBTYPE_SH7760 && SH_DMABRG) || COMPILE_TEST

SH_DMABRG looks like an actual dependency, there's custom IRQ request
and free functions which don't have stubs.

--ZPtySfMzVqythYRM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpw2DsACgkQJNaLcl1U
h9DFoAgAhuOJGptzTlZSq5r+uh7M2+eaE5tp/3/D7g1x815iYWbqqTo7c5oBYVnX
6LePqpX6V/0xyHOyZZJFmtMS6sY2mGzvoDZ1+ERicn3+0azpa957nUIj/9TAGHtW
Zd2m7MEk0aD4cjwUFDVpIBLjnGs5p5baaGHeHBSsqCyXjg12xBLbcdL1xXpWLTLV
1rorAcrkzuqvn4eIJJCjiLi+QAbCFVf3vGHNHG5uIUBopZs43PPNzQZlOxXZKSoC
hN3g25g7DlOLzknfcmz+E53xl/yBYv+vwF+RNA4ZytnMGMLrepAv2eGU7TbCxoMI
kK4gR6/hcIPExMi99vUGdRqxrd9nEQ==
=ffxJ
-----END PGP SIGNATURE-----

--ZPtySfMzVqythYRM--
