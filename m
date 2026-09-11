Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A61594812
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 20:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157458; cv=none; b=N0vbIwRbyTBuKMu+PkRkzZlGNM7tvstYfLJgroOLUD5nnegm503ysb6NaHSJ5ai3uFXtVq8jZ6YQ7cAIAAyFvENCAQXzxAObkV3NUyl1j6VMz5fm1Iz2YtQ8NPi6Bk/gZN0UwTGQtmYC+unF6g20TgXYzPO+ZgZ0jDrepsUdu50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157458; c=relaxed/simple;
	bh=eN+a/AIH9Vw9H9zHObF+h5wV5NBgG3UBXngZr5GOJcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLNEx6u3i66qKkEbTJC6HLqUdetKZvGV2Ul+QWg3f08CN9BUyvFfJzRSaoZspEeiaEpLR4sMN/yCkW0iky7sUabtm5qSovH9uQ2UuZ/2Mb62dAm9nDpxHprKe+s6UXclBqneyiT2Ucffxg59Eb+lWWKp4KID320lKa22N7O+p1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgkgvntA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgkgvntA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F661F000FF;
	Fri, 11 Sep 2026 20:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789157455;
	bh=xaCUBCGadOCf+DFhnuMAfEatgAI75MxdnZ068vm7GIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YgkgvntAdHtXCYfa06zYoFgyF94f/sRae+VFCt/KZu4NwpuNjUBYKGUsj79YdM7q6
	 +ikcLD53pXmqXu98ONUTTR2ajZGwfeus2hollf52oTGFvCcUUc9NljzdnFCyCZGV9V
	 Lb+1k96V9BjIAl2fxP0fU6pXxyxhcWMhhSYJsg2ScUhPohkEynap1M9JbOgNv3P9Bx
	 vNJMxzCt0WzQutGir9gmmIq+m7jg637zisa2dLOajANaiJiOkLkBMh0x9HbJb9+XTM
	 FpZFils5d90RkD8Pq4eEuf/QQCtYHZxVwhrXi6J2SBe6c+ReuVMuzT4DhJw5GghssQ
	 Lyav0F9wB7TKA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id B5ABEDC82A1; Fri, 11 Sep 2026 21:10:16 +0100 (BST)
Date: Fri, 11 Sep 2026 21:10:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH 02/21] ASoC: fsl: use .auto_selectable_formats
Message-ID: <aqRgKGJUn5NGVcdi@sirena.org.uk>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
 <87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PeNgwtGz2Z8JbM27"
Content-Disposition: inline
In-Reply-To: <87wlt3yw5b.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Orders subject to approval.


--PeNgwtGz2Z8JbM27
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2026 at 01:13:36AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.

> +static const u64 fsl_audmix_selectable_formats =3D
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF;
> +
>  static const struct snd_soc_dai_ops fsl_audmix_dai_ops =3D {
>  	.set_fmt  =3D fsl_audmix_dai_set_fmt,
>  	.trigger      =3D fsl_audmix_dai_trigger,
> +	.auto_selectable_formats =3D &fsl_audmix_selectable_formats,
> +	.num_auto_selectable_formats =3D 1,
>  };
> =20
>  static struct snd_soc_dai_driver fsl_audmix_dai[] =3D {

Are you sure this is safe with DPCM systems that default things to being
linked to the dummy DAI?  If we run autoselection during startup and
looks at the dummy then that might not reflect the actual link we end up
with.  I think there's similar stuff going on with some of the Mediaktek
and Samsung machines, I'll skip those patches.

--PeNgwtGz2Z8JbM27
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqkYCcACgkQJNaLcl1U
h9BODgf3VUJNLqa9Pyt7+jbjWeI81DG/dz1kB4Zn/gbfwxJ4UEErgBN4EgtcdeMx
mFUfJsFy3VEn/8qMZigZj8RR9Sd5/VfTDHuzvW0o/DRAfzFz7wGn80xh+ZpbZkwv
8mvA513dehLmeNs+x6pwR+PpWhvt64FSJXgHdQdMMcTrWjR9c9nMR42biQAr19Um
DpZZK+/hqU9kzLyDHRj5CiqelHZHKhQLDjuaYHHWhf1Iq8XYF6urYNQMs8stAyj9
/V3xGzxV5xR3WftdkeQDJvihymRirrex+Co29vzWfdR4YzHnCjCgOwKsOi4D6aR8
AEShrxHa+85CpXLqpipu65eX+7it
=LuiR
-----END PGP SIGNATURE-----

--PeNgwtGz2Z8JbM27--
