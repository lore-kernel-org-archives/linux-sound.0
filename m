Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDB13D1A86;
	Tue,  2 Jun 2026 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406031; cv=none; b=leYoOXPQcahe6vFrDld0LZoRMh0xLhXVJfNZKToJlQWYzB8+mTuCcj6ZTiEdAPS4pa8u6kBx89UeaMqRDetqUKdFcGDLJPG9gmygDfyMOAKtdjBR8iKHHU2FjN5Q2UobgrAOj8AouigtyreWb5gALh2KNKJZE2j1IkZPUFf23sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406031; c=relaxed/simple;
	bh=bdATNsuW+ejvlXXmD5hXFPYFFKTEOS5Pduc6iVFXvBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivnV6s75NEW1zEbV7fYvYLC4SAoImN9DM3O15z4TxfooDGLSvVGcRlxhR8CCOaxKhoSW5rqLPbswOhNdwjn7XTwjdN0rNaXR40DP44JoCKOcE9pDBRZy9KERgmc2vGnlfNQxFwJdQRtp2SXnN9QF7mUd8IDsX+ZTok8cloVreck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4nXaQX7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4nXaQX7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB251F00893;
	Tue,  2 Jun 2026 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406030;
	bh=LzHR1tYkliTSBjOTQ008Or3ty5QZOABm6IV2H15p6EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O4nXaQX7UUf1WBKLtyJuMNYb5O+mNMo/Hl4DHFg2L+RIst5ejzaTIZLbfIpQyZhwr
	 +r62Jzg4+dtgSNjuo2237oPpivT5eM9d+BXznaiqqwrTKphB09T+WX/ztDa5Szpy77
	 DTh2+lbr7NhzplaHKl4gcrQLzx/yvHUCxCRDvM4meKlPXOJotqmudl4gGw6wdXtmmU
	 tZvibx7qzAGfDOxAhKmjmUhYR91615cLmx5vlQgFnNriIp7XojtErVxSQfrhxC93p7
	 B6MMCkTX2b2r2k57qncNErMVjpa3bqd1uAEOw0grgRWvSWpEXxT9s38VNgJY5pco59
	 w/pxakXx6/hGA==
Date: Tue, 2 Jun 2026 14:13:46 +0100
From: Mark Brown <broonie@kernel.org>
To: lijun <lijun01@kylinos.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Message-ID: <40a51e9a-56d3-4859-871a-42842158e976@sirena.org.uk>
References: <20260601084309.845322-1-lijun01@kylinos.cn>
 <7ff4cebc-4873-4135-b58c-29a9ce2d696f@sirena.org.uk>
 <e4c628f8-dac3-4318-bdeb-758ac007a92b@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZfrquphT14/rNvx/"
Content-Disposition: inline
In-Reply-To: <e4c628f8-dac3-4318-bdeb-758ac007a92b@kylinos.cn>
X-Cookie: The wages of sin are unreported.


--ZfrquphT14/rNvx/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 08:49:29AM +0800, lijun wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> for example,the DMA controller is abnormal in hardware
> the addr =3D 0,
> addr =3D ((u64)desc->saddr_hi << 32) | desc->saddr;
> x =3D bytes_to_frames(runtime, addr - runtime->dma_addr);
> addr =3D 0 dma_addr=3D4195352576=C2=A0=C2=A0 x=3D-1048838144 i think the =
value of pos should
> not be a negative=EF=BC=8Creturn 0, maybe better.

Right, the question is if this happens in normal operation somehow or if
this is an error condition.  If this is an error should we be reporting
it as such, for example with snd_pcm_stop_xrun().

--ZfrquphT14/rNvx/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe1wkACgkQJNaLcl1U
h9BEbAf/UGarMXfYSUaJlanDV/h8Kp4TfzWbleRNPXe0vTo0/QgCLNBVPdzZNcYe
hM7N1evVKJsVCtnLPQ1dhR7rBePeZMMx/p8XrntbmpEwBo/iE7rf5XPBAyoEhpHr
uoRURQVl8X7o/IKvCAPE4FFEGac2rmjpLuvM0b+q9brAcRbZOUu5v8neboJyDaeF
/V84ecAds+vC64ZFwoMU6nKDhi0lCnnRDsJSD7mEBwvhYdZ+hprrumDzSR/XYbiT
ydWkwk7H/XQHsIYBWvwbtFHno2zggPx/BVmdQ0fD04nDeceFua3Lf+sNv0+XWih9
hLT72zAT4hanBlMlw0SyR1hF8Y2NDA==
=b2xY
-----END PGP SIGNATURE-----

--ZfrquphT14/rNvx/--
