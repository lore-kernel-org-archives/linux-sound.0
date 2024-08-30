Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386091B2ED5
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 14:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725029814; cv=none; b=ZVuTc1WIOwKZF6sKxx70OY0s48jPsaBpnrQN0GFM6bpgpvCgi11s7CWTfKxSDBFdfcjsd3Lc3+qOAthSKddLmhRHcupPn9V6EO3LnxKKPyaA2G9vsjO/iNJNUeRL7kMsSkC5FkS7/kJ9QyY97pgE+Tfp0XkyQUo6pIdYkHuikoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725029814; c=relaxed/simple;
	bh=ms2gIE3wABHQbvrAGtEdGrpnTlXLcJoCBwHQMlYdmR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q124AkmiwBJXGFakzkVwWAEw3rk9CbzH09qAgVVXTaRt9YcpDnQXoUBbAZ8hB4Fm9Az1kssmkpNZ6xnsqqJRYb+y6DgKDycLbhsmPE0tQPE/nbr/L+cg7A0glfa57uTj0yIDGArFroI5UB0LZZ7IPUzCu0c4zUOh8FxqASXnKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G27+ejVd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G27+ejVd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10D8C4CEC2;
	Fri, 30 Aug 2024 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725029813;
	bh=ms2gIE3wABHQbvrAGtEdGrpnTlXLcJoCBwHQMlYdmR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G27+ejVdoLZilgj6lUcK8zxy+YoIvlpV8m1lLJo38tLK6c+pQnWss8HAdf+37ftFM
	 RAC9wLMD6DKXlDPQntBfU2L3pXHwzVjKdm0dp9N/SiXeDzkHqrMxujcT5a/Rz4uFoa
	 FLZVkNSFYVkp1K+mkaOLlDOClS43wdoj9B2vjw2td1Mm5J/VLBVXEp2s0Dge6fcS8Y
	 zKAc/gjU7Umf9CpxsqYNgBDo3sw4ayliXciu+nPxZxAWpBJ7iKeFkgzofN7kxpnsBe
	 oHe0n1N2ioUQxb9sO6cqSm2d7OMNh6MMdxUVoSWUzn/G24LPQnXO2u0rfkUpjC/5aS
	 Qwrfr+x45NV/Q==
Date: Fri, 30 Aug 2024 15:56:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Zhang Zekun <zhangzekun11@huawei.com>, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Some clean up with helper fucntion
Message-ID: <cc0dca4b-7850-4c2e-a4c9-3f016c7b4e6d@sirena.org.uk>
References: <20240827070650.11424-1-zhangzekun11@huawei.com>
 <87cylt2ria.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EhUXryYVStOjJv7v"
Content-Disposition: inline
In-Reply-To: <87cylt2ria.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: for ARTIFICIAL FLAVORING!!


--EhUXryYVStOjJv7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 28, 2024 at 04:36:15AM +0000, Kuninori Morimoto wrote:

> But I think this patch-set will conflict with my posting Of-Graph patch-set
> if Mark apply this patch-set, and Rob (?) apply my patch-set.

> 	add of_graph_get_next_port/port_endpoint()
> 	https://lore.kernel.org/r/87cylwqa12.wl-kuninori.morimoto.gx@renesas.com

> Thank you for your help !!

It looks like the of_graph patches might not make it into this merge
window anyway so possibly it won't actually be an issue?

--EhUXryYVStOjJv7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbR3a8ACgkQJNaLcl1U
h9ARTAf/ZxRqf/t95CBPEyv8cXdvtbPYrRAV7ux4M5mBfFXmK1fpVUBKXoCfdwWl
NkrK5MSTweuRt0YNCVFz5Uzjia90Q3At2KY/OPCbXsOZYZ93TA0P/tvSTeCzxqj8
v6XfCNe0BCKDnek1EjoTkwbjbuAiPPD/Jmpij+UozYOtBT+x12J2E/63VqRvr8+7
hGPNYFY78jZhOqFmf6z1Rpix6iaWt+sFnAiXkwg0I/p7u6GrNHedd/bxtb+XU2d/
invW68BzvRBeFv4u48V4tuQrqI6Ov4qBi20vmZUyhG4yj635HguAisk2V8Ca4XQq
blk4StmzaQ1t5NgCNelowFiVIVQ6Dw==
=l3cD
-----END PGP SIGNATURE-----

--EhUXryYVStOjJv7v--
