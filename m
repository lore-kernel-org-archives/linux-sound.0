Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E73E9C0C;
	Wed, 20 May 2026 15:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779291725; cv=none; b=FE+6erRQ0PzRyWVJS5CRT+QPsTGhVZmIiTj0Py+nKhkFtcmyErn5Fg7H6WnqCigiKRaFszzBp+EKzhaPqRnZICzltpYzGC5vfMaE3/+PFLBVivDkWN+XopzzKTrcB25Wc8iYAww7UQTVm/Emxj/bEbVJjfwgxROKudVU3pLQtwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779291725; c=relaxed/simple;
	bh=dT/vl7LlTluTZZOCztR+FBzaBLU12agi7aZbHdC/ooE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEo5aPJCg0I3tMAHwLTBmGGgCjyqKC2BAu02pB+Tk0HXmU38jb3yvsjiE69yte2+lsKCwxI6/QIQnyaDG0nURlgnrMFNRRUHoV6i/ZOQry4fo+RYGQB9bcPzkkDoKz1w9y6s6TWWCuSCNGKq6TcOvKgvY6o+CVz1KmTCTnv9y2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSSfWItJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSSfWItJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A241F00893;
	Wed, 20 May 2026 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779291724;
	bh=xTs9j84EvrpbUB8zmi/sXVyU6CvZkmauLXlVFqdgLPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RSSfWItJZQLm/gKbl48yMOmzxjineVIK03iKozC8JKuvQoBs3ovHcQ7xQ4XqiSZDd
	 tHbGTI7X3VsJL3Rhmu+TlDcVLKucB22OF71wpJ6wrPh551wMTlMlAmHb2WrFukdzMv
	 5VTaFfBzbhVM2NDlh9tJryrxXN4sg1FN6q3NEb3JCGR8ia0J7W38fbL363H4tBGeKf
	 Zxxqs12ToS45Q0qaR+q6RcO7GQLwhu0GTYO27z02rN5ClS0D8euymnQR4Ne+YegA7Z
	 Vz0+8HN9hw3cgYLp7UWD+U4NjpDPl5sdes2zhsyTDF+CzRKV1mDubaMPzvqI8GhRvE
	 jIdrvFf0cSxLQ==
Date: Wed, 20 May 2026 16:41:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
Message-ID: <980eef5c-478e-4503-a3b8-27f3eba7ec3d@sirena.org.uk>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
 <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
 <81b15533-3258-48a8-8d5a-0dcec7027254@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LeC902u89KSq/6Lj"
Content-Disposition: inline
In-Reply-To: <81b15533-3258-48a8-8d5a-0dcec7027254@oss.qualcomm.com>
X-Cookie: Natural laws have no pity.


--LeC902u89KSq/6Lj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 03:34:59PM +0000, Srinivas Kandagatla wrote:
> On 5/20/26 1:42 PM, Mark Brown wrote:
> > On Wed, May 20, 2026 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
> >> use snd_soc_component_set_jack() instead of custom callback to
> >> max98090 codec.

> > This needs to be squashed into the first commit, otherwise the first
> > commit will cause a build break.

> I had them in opposite order in my local setup, which is why it did not
> break the build for me, I can send out a squashed version.

Putting this first would also be fine from a build point of view so is
probably also OK, though there would be runtime breakage (which I
imagine is why you reordered).  I'm not sure anyone will notice the
runtime bisection issue.

--LeC902u89KSq/6Lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoN1kYACgkQJNaLcl1U
h9Bglwf/fFyVX5wZ6pPFxe17aKN5nIUOOpNPzWcYnojdG/+Dm2HC7YBpPzPcIUfd
IS8u4clCZmMSaBULc1R37Du8CRthdVGpqwMEUuBZ0iECRpJGr3S3OT25i653DWNu
oYSyWmnM5UlrpSoLGk39DOO0k+K1mKDFCPmzCHRbkFcpL+lK+vo0KRjr3oO9o1UV
S/It3KPhyc3FRRo+Z0UaTzruQ72Ky1HAoAvsPxSdYmtxV88iU9YxSEwSAjtAB1gl
FhUWNJopESjFOyM7x6JUYz0Yp3FC76ZKwpmV+ONJ7X96onrFQv6SVQ8a+FmVCUim
qR2xcAdHjU3W37KUi7R0hkadSgb0+A==
=ZDx3
-----END PGP SIGNATURE-----

--LeC902u89KSq/6Lj--
