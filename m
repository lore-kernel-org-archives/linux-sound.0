Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35022B67E;
	Fri, 31 Jul 2026 15:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785511773; cv=none; b=HdVSA2vexYYaceaKPtKLEPnROZLmOIQt/Jwb/rUnjUcPJFYBTE6h6G36NOie30hU1D4ZKrnocyZLk1KB+MaAJBgbPr5WlM5TPRvcEskkiJjoO9ZWgdA6v+P6aC2wGJTdJShPLkNKPCgCZxf0crwo6ZBCIctgIXX9n1LzevUBkFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785511773; c=relaxed/simple;
	bh=AsBHKg/iMrJeIOAWASl9TexSLzpABfkf4KgBlQa4VpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep2wXhIYT3ONACgUvZoMukTjfDzgkskLM4hJrjPj3AmcG3Jz2IFrzqCnxcZ6YThL6097QuvavVsngHe3W9Ra/euUSUNKXoteAXkEzV5Ky+U+Bn3BAqqlYacE+t8Tg94r0KPfzIwi9B04Ijc2NJ8MkSIpNjbJF7nu7ZmexAvprj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9Ym41Jz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9Ym41Jz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1BD51F000E9;
	Fri, 31 Jul 2026 15:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785511771;
	bh=hUpsQ3BmLeNBlpe2GOxu0xoX8ggLMcZ+LQKRuRp5yMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G9Ym41JzYfPLG5j9iWzb2bQleQ8IM7ezY+6eJ4XA1lC5YhcFCgJbMHJ3D6/0tfgxB
	 FJh2692QhvMgjIha3iBtPmf8cn3ZFCAw4nToynUFgZ0u/LqvD+whJJsr8+q2XJ7+go
	 /dqnaZa5TJhn/yNeT/DqQzFXyp5rnqazlDVtQtR7VdGWHTm7btNsJMB4K/o+LQTqB6
	 O44wJo8NAEhcO/fWaWzOw8w3WiaS/cyfRhCyS3567qN/yDyap/RpMF+AYNjM1gmi3Z
	 v8IzvCXuzhBJ3Dg19IBXvhJWnBEar9K8tOuWcEugNC8sUylScx/N19y2iDHcJB9cud
	 7LIt1KTGTsmBg==
Date: Fri, 31 Jul 2026 16:29:24 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>, u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 11/26] ASoC: codecs: wcd-mbhc: Use guard() for mutex
 locks
Message-ID: <ee9bddef-0918-4036-9c8e-8b0d4af7f5bd@sirena.org.uk>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
 <20260731030648.8706-12-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XRplbUsisyBfTVo3"
Content-Disposition: inline
In-Reply-To: <20260731030648.8706-12-phucduc.bui@gmail.com>
X-Cookie: No shirt, no shoes, no service.


--XRplbUsisyBfTVo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 10:06:33AM +0700, phucduc.bui@gmail.com wrote:

> @@ -419,9 +420,8 @@ static void wcd_cancel_hs_detect_plug(struct wcd_mbhc=
 *mbhc,
>  				      struct work_struct *work)
>  {
>  	mbhc->hs_detect_work_stop =3D true;
> -	mutex_unlock(&mbhc->lock);
> +	guard(mutex)(&mbhc->lock);
>  	cancel_work_sync(work);
> -	mutex_lock(&mbhc->lock);
>  }
> =20
This replacing dropping a lock with taking a lock which will both take
the lock twice and deadlock.

--XRplbUsisyBfTVo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpsv1MACgkQJNaLcl1U
h9C1OQf9EXP0htSdWsSyOlW9QYiNmlfv5JrohdnCZ2cGQ09Cq87ZcpF3FKiK3+je
1+llmoy6HFtSkRw9UKwYLHMinjK3IGP/VN0IgjJ6Q6uBaNycdZXvcnjua0VSJvFM
MNV077KbEeFF6hrGtItXh9tuUSuwuBcVUbis+gfgcJz/Gh/ig8b5rrnScXD7GSjz
WKYHqoH0yx5cUkk6UUEVwOD7zOvWYoDxczcQovKHOU+bIS5k2UH62XlRz4jjOmdw
H3Gkb3yrzhIWYwY6wJvPteRmM1RX1T/ejLusu3fRUKOtEkFOySQhnB8GDtFXK5e1
AUSUjXfQkPkX99TBrb9YUOk0nBGAgw==
=ymKr
-----END PGP SIGNATURE-----

--XRplbUsisyBfTVo3--
