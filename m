Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF2346ACE;
	Tue, 14 Apr 2026 12:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168149; cv=none; b=GmDLHoTasdv2DuamS49KqcE1wUQcWnaLvkPAPoVaifFh/TNo06ynpc8HEfKZ+mrEkTtV0RbcuLx8UUjt9+cmp1I8lrNlPp4ES/vDqVWNlU3NuftVkIzWSiddVdtWK0JY+D5Yd7Fp4MyH5JUY3ywOzEJu21dxiN2Mh5+Awsn79uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168149; c=relaxed/simple;
	bh=SfcjDYeeXoyYYji47Z//FYorFu+vBmbxMKw+b8k3cII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfLYskM1iEwQQKJaLxyUwE9O4nFTkCJDcxQk2UT/2z6+TcJqTCRIYpELuMk7n4PAd0DpRBxf9IeC/xa5yXW8Vgwx/50fwx2hSncwQDvJ83bKSDTIi23tbaF9oIUx8QD6X+8TtC6eXNxnHN0LBrj9lQSaM97zQ7uRLOOOOZgdRiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhevKREP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhevKREP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7F1C19425;
	Tue, 14 Apr 2026 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776168149;
	bh=SfcjDYeeXoyYYji47Z//FYorFu+vBmbxMKw+b8k3cII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhevKREPWNWs//X4pYThP92dDmIsDvdX31jdjWTwzfh3YITxGurDYAq1A+73xchxh
	 LHcREe/pmjrjcymdkNrIAfboi0CHtp8qJJwhDON394zbDGEZW0XHMmE2PR1rmi0UdX
	 5YUUo21bVFdiPcC0ZFN47y7mbtp4AGo7szxe6fnozUjkXJ+M+GYar/HKqZwugfHMEP
	 W0XElRN+h7GEFgOAF+Zwgu9OOt2S8vgLBhuNCcm4DlOUir+6wMt83UZldduYIt/uaB
	 O+HKgimhIEBlUwePDoiq8V9W3866f4kxvBRoK6ObhvsfbuxiO6dMKSJo+mnUwNQUK7
	 urloUBP84XnDg==
Date: Tue, 14 Apr 2026 13:02:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH v1 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Message-ID: <05ec7d33-1dd5-4e67-9c88-03e39e02c39a@sirena.org.uk>
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F9AoMBOK5HGw6XGu"
Content-Disposition: inline
In-Reply-To: <20260413121824.375473-2-ajay.nandam@oss.qualcomm.com>
X-Cookie: Academicians care, that's who.


--F9AoMBOK5HGw6XGu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 05:48:22PM +0530, Ajay Kumar Nandam wrote:

> @@ -2868,34 +2846,12 @@ static int wsa_macro_runtime_resume(struct device=
 *dev)

> +	ret =3D pm_clk_resume(dev);
> +	if (ret)
> +		return ret;
> =20
> -	return ret;
> +	return regcache_sync(wsa->regmap);
>  }

This doesn't unwind the clock resume of the regcache sync fails.

--F9AoMBOK5HGw6XGu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmneLM8ACgkQJNaLcl1U
h9CJ0gf+MuiZlx+vtY+TJNl98wQ8IAV3lxxKabGen2G2TL2O4661cbvhRKTq/ZIf
Ima8mZ55UfPhXAEEVJIaSdpmrzDXT41A7OQ+zcdzl0NhbupfHKqThvX7lDsFxWEI
+qln6H0R5cmbnG/82e5d/iBhWVSpVoRfXrsP8rjNdai4PyjnagEbliqv8VybjwC3
jJ0KoUlyzdCJDS8VTC0sxg4Lvgi7Fs/JMmibRKVJxRRG9PXhcgF2q3UjlyonH2DR
ffz3Uv8mS8dbdHTuXdBeS3mow8q4U/Um9hllka1pU/CTM5a0YGFDibi+4QLAwqRv
a6FfL223uolvnmyo8pCVbnGGq4pdKg==
=CT/K
-----END PGP SIGNATURE-----

--F9AoMBOK5HGw6XGu--
