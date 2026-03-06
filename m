Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245FA19E968
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 19:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772826274; cv=none; b=IEcsoAPsU6TMp7jpiR461D5JABvupMIZeofeyvCet4jspdn4xfG/wANA0xjv+8EIUaitclxN2OJH6goYqp2mlOHoMnvz0PJeg3Tf4VLqnKzBqBztCw4ZMBUUxR/vU0WOIaWwS0Ox5uJnBvfoG65GTBhHgqGe/fEmzht5tY47zEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772826274; c=relaxed/simple;
	bh=kyRL39ZUU2fVc+qKgieTu6xtAYRDOjoAd+SFTTPDOLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bqn7mIHf1u19vkvzdJ4s663uKhFZ/RXMxCl33Ko8F3qQijqyFHk3ul+VT7L1SqVpqYT33XsTWAkCYiBIKRZpF4E2i4VNf1JgPI/PHSJziU08mBE6WO7qKhj5dxlxVCTb+pdd00xO7+NG8iL1UMbjmamTg1/rfLcFhnayHpehMdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovX931A6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovX931A6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E40C4CEF7;
	Fri,  6 Mar 2026 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772826273;
	bh=kyRL39ZUU2fVc+qKgieTu6xtAYRDOjoAd+SFTTPDOLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovX931A6/cFE29cM0X9RjBHW9k3S/oSFMh5AzrBSeugziYtxLPPp1b838pH3PhzRX
	 udHujA8OP/3ZbccLoLYUQ7GBzItfoJvxu1Ey9toytZKcqi2nl4LtmOsKTmCy+Ga/0b
	 GpN5M39xRP5FeDlnoGDJYS2eNxGYet3hP06O03pvEkNMrkL2wehbLBCRx00m6R0SXG
	 HlBX3wWBwpXG44oaEMbiELYcFrrsjj12JDJxEmAcWyNh/sRV6OaaJ/Cfg8MBKCI1rb
	 rmq2x1X6UDYw5xhz5mIdbMRk+QLDAG82++Va0Zd31EDRAn4CvrroPFJNIuDSdi90GP
	 W6yj9vp+lArMA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 02D271AC52D3; Fri, 06 Mar 2026 19:44:24 +0000 (GMT)
Date: Fri, 6 Mar 2026 19:44:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-dai: don't use dev_{set/get}_drvdata() on DAI
Message-ID: <aasumDrXSf7rfOJv@sirena.co.uk>
References: <87bjh33uoz.wl-kuninori.morimoto.gx@renesas.com>
 <aamBtfjzkM7onEfp@opensource.cirrus.com>
 <aamGgjYd4ySf/4fW@opensource.cirrus.com>
 <871phxu8tb.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7fDOXe22YHOV5710"
Content-Disposition: inline
In-Reply-To: <871phxu8tb.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Think big.  Pollute the Mississippi.


--7fDOXe22YHOV5710
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2026 at 11:59:28PM +0000, Kuninori Morimoto wrote:

> I think it would be better to remove
> snd_soc_{dai/component}_{set/get}_drvdata() ?
> At least we can regain the balance.

> 	dev_set_drvdata(dai->dev, data);
> 	...
> -	data = snd_soc_dai_get_drvdata(dai);
> +	data = dev_get_drvdata(dai->dev);

> But what do you think ?

IIRC the original demand for those functions was that drivers were doing
a chain of lookups from whatever API they were working with to get back
to their driver data and that this was before there was a convenient
struct device around in all those structs.  With a struct device right
there it's less clear that's buying us much, and now you mention it I
can see the potential for surprises if people think each struct has it's
own driver data.  Don't know what other people's opinion is though?

--7fDOXe22YHOV5710
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmrLpgACgkQJNaLcl1U
h9DG8gf/SHIEpeeFkkfEk0xaxn4ZzTk0qw3mnFGBKmZmhw70+gEVL5fwQNgl4AFL
4tjMuE6VWCRL0PVi3KBe/JGH3qzbAYSBJJFYbSOF8Pwo773RMbio2P4PJ8ktXtOp
GSuybWJmLQww/L6RxoMAG/iT4PHrvGYqrQGYk5nWdZy9wMpcNsPhHcFARsGZ4Bs6
tf1u4fJ/o0wGbageAqz61Gb8ZBDSxZGY6wEPysHjMGAMKP84/sC+YAOP2Pdk6RTQ
1BcHm6LiMthbuDQ8vTTQr72X6/k8JQjqjRcGa/RbD80Oa1+halbl3rdjMwVVypoH
V2ASu2J+CYOqMcYvUdXHQO5pNa/2/A==
=TQDv
-----END PGP SIGNATURE-----

--7fDOXe22YHOV5710--
