Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9190C2C1780;
	Thu, 19 Mar 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928694; cv=none; b=N4Abt/sGor9/2CVU4TaHxptFNsk4orSGSvz89pHM+BqhCkIYmsnujWXe2EweE5ejlgVpvOUMwtD/XH3nCOfckHMeociSXC48j2InYGYs9TlSFWNZ7YAxSImLqTFCHDm8p0xWycNZdggWc2eSLwIbtRZs6tfyfrQDRoAZcD6fex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928694; c=relaxed/simple;
	bh=vcTlYg/xbkMn/aQbj9qPf0912LYDUKS3ifjCidYmRTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVfK28ByBijrkHTecIFr6qskd1zfqngt2bEjzRPe404hA+H/SXLfHenzVhz2zrK3ht68oCh+OQM94Sw32pnzb/MpKVDjzH1jZ8QNiOxt01LCPVNGS20tyr+++8Jxz0BDLq2Ru64DcTT9/eCMTUuBclSIkjPtLGJRHhr75PuiAwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ocjNVS7l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ocjNVS7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D53C19424;
	Thu, 19 Mar 2026 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773928694;
	bh=vcTlYg/xbkMn/aQbj9qPf0912LYDUKS3ifjCidYmRTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ocjNVS7lH888dre6aBurp8o7G75IPXD8RvOvU9Q0G56wBB2m3HJ5eaS/8FebK+Y+d
	 wR0XastFjy8S+xtrOCxIYA/fWdzTLue6M9rTKFSJ0/RFVWbZsPCkv08tmwNv1HRNd7
	 7Y+RfplZnhEBfn8luHtj56GhQcA014uUMleKbDtzmq9z2ZhD5CwZRh7baORX/TdYwI
	 eLz6bzLL7cHmNpKOFS9BAVU1feXoMb9JqOdFujzdnUXtmybkwSYse4qKcxMqPmJEtF
	 mful6Ue6+6Mog8hZeanswNGDjxet0Vue9gOgQHLL+bDahLzcx1yg0gamMMC0jfuFAK
	 +C4YwVbZ4PD2w==
Date: Thu, 19 Mar 2026 13:58:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: soc-topology: fix __le32 conversion in printed
 values
Message-ID: <6c2114d1-cccc-4857-b3a4-3fdcb9932c76@sirena.org.uk>
References: <20260318163427.1083470-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3gsLFYddJk+eg1kh"
Content-Disposition: inline
In-Reply-To: <20260318163427.1083470-1-ben.dooks@codethink.co.uk>
X-Cookie: Given my druthers, I'd druther not.


--3gsLFYddJk+eg1kh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 04:34:27PM +0000, Ben Dooks wrote:

> @@ -1957,9 +1962,9 @@ static int soc_tplg_valid_header(struct soc_tplg *t=
plg,
> =20
>  	if (soc_tplg_get_hdr_offset(tplg) + le32_to_cpu(hdr->payload_size) >=3D=
 tplg->fw->size) {
>  		dev_err(tplg->dev,
> -			"ASoC: invalid header of type %d at offset %ld payload_size %d\n",
> +			"ASoC: invalid header of type %u at offset %ld payload_size %d\n",
>  			le32_to_cpu(hdr->type), soc_tplg_get_hdr_offset(tplg),
> -			hdr->payload_size);
> +			le32_to_cpu(hdr->payload_size));
>  		return -EINVAL;
>  	}

The format string for the type got converted but not that for the
payload size, both of which got le32_to_cpu() conversions.

--3gsLFYddJk+eg1kh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm8APEACgkQJNaLcl1U
h9CXugf+Onl0r36NZeMibD+3VzNG/CUb4mXiq1PKa6H726zT0QqT85b1j8CpBfAS
Tx3xW1mshiAKAadIq0ZnPfv4kKQYYF3jVi224IIVBr7XxiNi87d7c8afwgLhWlc1
1cCZJ+J/F35uEiWifpaELzMfgDlxtGR3WOvH5G9hU2HRKfrPThLdvMj3ePtixdRQ
unTtyPFhjbbYtKsGcKlngYyE1F7YLv1PrBRDUOfNrwxke+OxgSX8kf9gV+1MVXEg
RfaGAueQJDrYw4ASjnC28lVggm+8+zmGpdv8wvJfWsJbp8VYorljG0H0oebLfWPR
uv8guTgx2w9Ki8wk/m4cqeo4V73hbg==
=fka6
-----END PGP SIGNATURE-----

--3gsLFYddJk+eg1kh--
