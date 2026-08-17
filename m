Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D778448CEC;
	Mon, 17 Aug 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786982203; cv=none; b=jbnXnSV3KvMMK5s3OkoIuOAGzUBp8qB+Ap0f/19CcCT+IT3HF4h9iQcOtw1o4TiiRk8HZPG90QpUozegHgBHIPEA6O4sw7hTMDeGmHSYuEtlAZ9pYmTVhw4Wmwym/vr7mjFUHxsOMbuC+7oCCvzRTgaGhJFFqW+XprNQ+C010lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786982203; c=relaxed/simple;
	bh=+xpMyRz9w8pQllIHoZz2jIxA6m8w2ac067fdp1XyNoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQ3XA6sJsZObJ1+SZxalcTRDXwS2ksTbFtXauOkBESV64F+q+Ksb7OxwtKMPWD6Okg07YuwkEQmA7/vYi3XbpUAQL7Gxd2442X/6xWnLxaYDCuLr1kdCflxQ4oTB4fNGrbXL8ehYOCwM9Z/w3pvTiQFJwg9adQdEphHzVpB9EW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UU9thYuN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UU9thYuN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99C41F000E9;
	Mon, 17 Aug 2026 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786982202;
	bh=XUfUcNE1wEJhw1YDxcBNA2/xsAYbCGB7j3cgdHBNiSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UU9thYuNK9HGnU2JwTtWB41L5f3/K27QLdfw4oSq+9y1wjI83CBwT/4yuWkxSYiia
	 /jA7oC7n9t3BfkHdb2s4jnBgNNfWgGhOC7hu9c/I2CLAH1Z0iWB46BipI7E3sReGq/
	 ViYD+w13CsEk/jh0DPiFxKV+9ON7SH8N/Qc4O2N/z5hsK7BmJ4e6IeCCXjqwozIB+e
	 tXapcO8CrbG+10Gk7AjuBnNdlDsmYAnC23j2qX6kxmSmpbW6U6krw7LGg2wstvmak3
	 n064r17VjXh5WxwqJkzkjWn3sT7YqDRlX1a5vcdUG4kQJnS0U/rJH0iVb9BrM+JCIX
	 qfmRYNzg2GBUg==
Date: Mon, 17 Aug 2026 16:56:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Sataporn <excursively@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: add
 rt721_l3_rt1320_l3
Message-ID: <c75806b8-7dd1-4cac-b4ba-e457d8aacce4@sirena.org.uk>
References: <20260815182747.8913-1-excursively@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lanJs6rIALG1rYDY"
Content-Disposition: inline
In-Reply-To: <20260815182747.8913-1-excursively@gmail.com>
X-Cookie: Obey all traffic laws.


--lanJs6rIALG1rYDY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 01:27:47AM +0700, Sataporn wrote:

> Add an entry describing the two amplifiers. They share aggregation
> group 1, following the existing rt712_vb_l3_rt1320_l3 entry: with
> separate groups each device asks for a DAI link named
> "SDW3-Playback-SmartAmp" and the second registration fails with
> -EEXIST.

> +	{
> +		.link_mask =3D BIT(3),
> +		.links =3D ptl_sdw_rt721_l3_rt1320_l3,
> +		.drv_name =3D "sof_sdw",
> +		/*
> +		 * No monolithic topology exists for this combination; the
> +		 * "dummy" name marks that, so the function topologies are
> +		 * used and functions without one are skipped rather than
> +		 * failing the card.
> +		 */
> +		.sof_tplg_filename =3D "sof-ptl-dummy.tplg",
> +		.get_function_tplg_files =3D sof_sdw_get_tplg_files,
> +	},

Will this match on other systems that have additional components, or
more SDCA functions active?

>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
> --=20
> 2.43.0
>=20
> --=20
> 2.51.0

--lanJs6rIALG1rYDY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDLzUACgkQJNaLcl1U
h9Ag9wf/Z+XryyQK9N+V43MdxQHk47PgKHLJK3/93q6HazxQ0N9wlYHZTG3tM/QU
bXA+xRRmFudT8Bv2sQUYlqP8QsMR+LK/MP8RGsjog9Bo/qA6LpghN5wUaN1RwYWs
dP7v1+giYHy+1nNniLeoYDN5kUvBLrvWKQEK32NiFJoYiNKSyrErbPoLwSgQtGNj
4OkW6K8N/pyss//OJiQxoBlxxgRwqQlwOveWkzLc6hXHvaiwHfxDq30twcLgdbtb
ZGbKElcqiajLqU699Y9xpeaaBa687s3HcoZvxB/bEHxYNdJfAJloeTb2GkQQeJN4
dyzQHmT/jvtqRbrpmueMvRfzTy13Mg==
=4O5g
-----END PGP SIGNATURE-----

--lanJs6rIALG1rYDY--
