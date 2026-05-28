Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5832E54AA;
	Thu, 28 May 2026 16:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986765; cv=none; b=VEH511/l12PAyXb4jTgFLTuaDZaSlnpf55rwrDqzfiKJBVTdhBQS/fi5iVc9YqkdgQViElXpHuwxjw1oyVoN7xKS5pyv4IIaxznkiQQYj6qL1SlDuhkwgz2szH7Z3fYTH7KYBbil106ZFfhc5/MjLRW6IhneW/Nrgc6rUYQ8htA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986765; c=relaxed/simple;
	bh=8EGI9kMuDFJ+jR0bSx20oL0LpnN1SyHNzlgfn8c60kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7hIsn2GsMD8/w1R56kBmlbLS8rqeTazX/R1PDWsV5sSMwom9dH2e32gGvq8EGPe2wymamzVrPj1W9I629U54Y0R6n48UFHnw4ogJM4givJV+gay0NaYCqVs1/322gV73B0x3M3MLznesw2tzoVAthvH6W7DQj+DXytABVptUfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gmq9Vc4z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gmq9Vc4z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 170D11F00A3A;
	Thu, 28 May 2026 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779986764;
	bh=oPhhrjt6mc4MLKbVTjT0KnWkWNT4I9fISQf9FqWLJL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gmq9Vc4z3102JEmDp83WDM49k8dKwMxKw7LiCD+noWWzuZKfNawvB1kuN/jWcvxly
	 WKNQNav085vo22t8Mkyg5pv/CKoqL/hNZOhF3LSFO35v4ibNvhXbhzBd/3bguS1WZk
	 zfErKnAFofdDflOTLH19mpInHLmltou8pcd0nbUYKdB1PtSF/GwgtoH7GUAy6PJc85
	 qlkdJAsMf27N8wacH2O2uRvpcl6KG6gzdrsWatR7zccpWWnArGpzSJnnNutajwNLFJ
	 9jyxVgUN7O+/JlpOAmXdETHkKhfIXjsA7Xj0kVoVs4O196KklzWTuY3NfDRmjz76hb
	 1LoGotPPs1j2Q==
Date: Thu, 28 May 2026 17:45:59 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: sprd: sprd-mcdt: Use guard() for mutex & spin locks
Message-ID: <a28adec5-1b34-439b-8d92-5ddaba7ffd56@sirena.org.uk>
References: <20260528105900.85604-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtRmt1Lc3LE6hGu6"
Content-Disposition: inline
In-Reply-To: <20260528105900.85604-1-phucduc.bui@gmail.com>
X-Cookie: Don't read everything you believe.


--rtRmt1Lc3LE6hGu6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 05:59:00PM +0700, phucduc.bui@gmail.com wrote:

> @@ -897,7 +869,7 @@ void sprd_mcdt_free_chan(struct sprd_mcdt_chan *chan)
>  	sprd_mcdt_chan_dma_disable(chan);
>  	sprd_mcdt_chan_int_disable(chan);
> =20
> -	mutex_lock(&sprd_mcdt_list_mutex);
> +	guard(mutex)(&sprd_mcdt_list_mutex);
> =20
>  	list_for_each_entry(temp, &sprd_mcdt_chan_list, list) {
>  		if (temp =3D=3D chan) {
> @@ -907,7 +879,6 @@ void sprd_mcdt_free_chan(struct sprd_mcdt_chan *chan)
>  	}
> =20
>  	list_add_tail(&chan->list, &sprd_mcdt_chan_list);
> -	mutex_unlock(&sprd_mcdt_list_mutex);
>  }
>  EXPORT_SYMBOL_GPL(sprd_mcdt_free_chan);

There's a mutex_unlock() in that temp =3D=3D chan case there.

--rtRmt1Lc3LE6hGu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYcUYACgkQJNaLcl1U
h9DgxAf/dI6KWIS4rZo2p6/9VGYRv9e1pAzvHHZCRXXgS3JjQKDMRF0DqlXmUxUC
69tix4kfT+xfP+c1nbDmOXiLhvSGIuimCtOq4mSNKpPca1gdn3Qh/ybcl53NsXGH
/VweYWD9nhTksxIjJHpcNnVNr7W/M2osNCALQznnA29Hn8Bvu1p9RkSOT2KeRRRw
uV9PtVlboC4BpqKido1xX06fiyooZcEdLTXoD/HMAoqJ27OOjKu6A2GZ8N1h39/Z
MCuiEJ/PktdF2hjMmqZ2Rfnh6zpWouK6Ucj+tuza4aJSRdNtfkRe8q9T9dQCBtQz
ihE46jeiFzV5/ovFSVlCrMym4uvGFw==
=ZFz5
-----END PGP SIGNATURE-----

--rtRmt1Lc3LE6hGu6--
