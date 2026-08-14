Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706EC48C8DC;
	Fri, 14 Aug 2026 18:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786732980; cv=none; b=QsbzAWjwEPoQE69ou2Jqr2PQLe3Oqs/BS9x+OCTVue8VcbSsyD7QC29MN3GYCThGg6xDuRrXl8oCPVPxb1y0coAtizbj5hzMsGQpn5u2aFefZQBLi23oqF8zb4GPqhohhMkRtir4vFFIvdwtWv/S+KvES0ffCMvAjr6A40+f/nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786732980; c=relaxed/simple;
	bh=YOJ94xYZkUiZp1NQvxc/IYUfIkFm7lbg/NgXRcg7xI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsMjwll7gZblWc3cTYG0cBgh8ao0YgvWgZESNgPMU7LuFJAJdGTaiEaa5DDnM/JEobupWHwpFpjPa8HLMS3uo22V1O+fToc9oXesheLNYa8w2nBr2Zp3RvmdoUCqGXBI0yjlxhoAx0uCEkCxTCoC1qWmmfAIqH91rca8XruBzyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLw06ILA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLw06ILA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D621F000E9;
	Fri, 14 Aug 2026 18:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786732979;
	bh=YkB1QnDS66V/ypjQWPelREncMUh+FHnfOw7Ld2EjWNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NLw06ILAuBPWUuYJ831JRG48e70aFFMjvH0b/8/g8+T4RVOfye7gIZilbZMRkxhq5
	 9/hunzg1n2QrOS2Yg3zI7u5p6sbClRS6XjDqb4SFSrvNlZJHl8FMxQUSdOrAmRPBOV
	 LL+uDuFQOTkKVT1krCBbZ4Lvg3UJOgS1pRMswug/PsYZ+TBHO9xtvTLlpchUlAQePo
	 p3lJ6sVjDC/sRwqoZM+eNQMb/hMwrNPWjOaXkd2Z/wrW2I+tx6LYpuNN/ZDqoJKdEX
	 VMFfeafhmCJQyw9N3uJKk3p/8lN6ytnp3NmVCn+vqV41kFuFMpUUnqi+S4L7qvY42p
	 2AWBNUtJP2SwA==
Date: Fri, 14 Aug 2026 19:42:54 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?5p2O5YiZ6Imv?= <lizeliang.linux@gmail.com>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2781: Add delay before block checksum retry to
 prevent deadlock
Message-ID: <945b889d-0e05-4f4c-a6ed-2d8172554d5c@sirena.org.uk>
References: <CANd6bg+B_fZUpy4wwU8HyQMeo9-GKMEx2FPBem=-e4yr4eU1uw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4shxBsaYJYcYRKv"
Content-Disposition: inline
In-Reply-To: <CANd6bg+B_fZUpy4wwU8HyQMeo9-GKMEx2FPBem=-e4yr4eU1uw@mail.gmail.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--t4shxBsaYJYcYRKv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 02:19:26AM +0800, =E6=9D=8E=E5=88=99=E8=89=AF wrote:
> +++ b/sound/soc/codecs/tas2781-fmwlib.c
> @@ -1765,9 +1765,16 @@ static int tasdev_block_chksum(struct
> tasdevice_priv *tas_priv,
>   ret =3D -EAGAIN;
>   block->nr_retry--;
>=20
> - if (block->nr_retry <=3D 0)
> + if (block->nr_retry <=3D 0) {
>   set_err_prg_cfg(block->type,
>   &tas_priv->tasdevice[chn]);
> +
> + } else {
> + /* Give the chip and I2C bus time to stabilize before
> + * next re-transmission attempt.
> + */
> + usleep_range(2000, 2500);
> + }
>   } else
>   tas_priv->tasdevice[chn].err_code &=3D ~ERROR_PRAM_CRCCHK;

Your mail software has mangled this patch so it's unusable - at least
all the tabs have been replaced by spaces.  You might want to look at b4
to send the patches, especially it's web submission endpoint which
avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html

--t4shxBsaYJYcYRKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/Ya0ACgkQJNaLcl1U
h9DDIAf+MtGt8tvS+CkPMWMjrGYCZDpoYTNSG8w7bxnZ5L6NsS7ar72k7HiRqVO/
pE+8kE3FNkOrwUFkpli5qwvdajWpwQSeCWpeV0eSDR0CccR5fe8uTP61ghxSeiH5
ugZICXyPPP5HBXx+pEltNNF5soqbhkTKFQuxtIOaj285oRpFUyoDmI+41+GoBZ01
o/UBnwpnD5m8gkR+cQs9Ev8jQC6e3IgAxZ+93XKGIgLYHjRNu0sQq70qKVDC7zO8
x7rmsv2UrO/yfu6KoCEtzlN8OSWNPKeJ7Q6fbAMomNvHoou45tjWGiPFcSyuh/Zr
5Y6zrB3VywfTAuIRBgoYdtSWmmNLBQ==
=55/E
-----END PGP SIGNATURE-----

--t4shxBsaYJYcYRKv--
