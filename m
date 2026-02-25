Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FC024DCF9
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 11:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772018353; cv=none; b=NfbPrm3DBaPhbzZpdg6/Kcl9aZl0JIklF1yQfR90XrPPjVlzjYxOGch+xy1ABTsNLSr7Z/UigJo4CPOrees9XzkmmCO/fNQefLbqyGiMVdXo5/i8lbD7cMn3Gk7FudOy7mKVzXafmvEsoVG5fs6zPIi/R2V1kG5dsnNhuZGn6UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772018353; c=relaxed/simple;
	bh=gfPjUR2g/Ii+EuR5fZLNQnSiZDOIZJnBf4uWk/qoZhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppX91DyMFtPIcvKsjea1MVhiNz9fdKTN5ppLvr5PDEswSfM+aK9131HxlEwIo5Ge3PzxO1HRrFqikjDa1G9XTAxmZVDw9TVSPyIoxiHJ8gj/sOyQ3hQ41lC0wcXktO8XWbspKiCe4T1ROzbx1IY7u+gJ2MX45Po4OdWY5bPHrjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpSgK0NU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpSgK0NU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1984AC116D0;
	Wed, 25 Feb 2026 11:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772018353;
	bh=gfPjUR2g/Ii+EuR5fZLNQnSiZDOIZJnBf4uWk/qoZhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qpSgK0NU6FpY1d9F+//1jDTgjbPHpP7eyBTE8xaafq027QaAzhwGro8V5vrKuIpLh
	 0YlnrKTe29hC9q8Sk9wEBRAAbq7fw/KYy7SjL3AAhXSU+uiaeT9xR6dc+J3YioIW3Z
	 JDzLR68Sc3qSwDR5t1K4on7aKWC0ducI7K4sRviLDDCExce9XbFKq39BH+xaOXuhJh
	 YAo6Fg78WDt/JFCRpM8ff1z/gleqmSebV+X1r0XLrKfEfsTca/JyM2H8Me1lxNN32T
	 38p6TWAo/C/KC1Y01S30T65ukwKOyFmh5h6g09Keb9ryCrFgE/yrkhSz8NsTNA0KDp
	 Miyo1B4zKTIJg==
Date: Wed, 25 Feb 2026 11:19:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v7] ALSA: control: Verify put() result when in debug mode
Message-ID: <e6ee4de8-4a00-47ae-bc58-05f85025450e@sirena.org.uk>
References: <20260224205619.584795-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mTizstJNe2VTgc7+"
Content-Disposition: inline
In-Reply-To: <20260224205619.584795-1-cezary.rojewski@intel.com>
X-Cookie: From concentrate.


--mTizstJNe2VTgc7+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 09:56:19PM +0100, Cezary Rojewski wrote:
> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
>=20
> Currently 2) is usually ignored when writing control-operations. While
> forcing compliance is not an option right now, make it easier for
> developers to adhere to the expectations and notice problems by logging
> them when CONFIG_SND_CTL_DEBUG is enabled.

Reviewed-by: Mark Brown <broonie@kernel.org>

--mTizstJNe2VTgc7+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmme2qwACgkQJNaLcl1U
h9CCZQf/X01CbYUJVF+0VKWbQXB1HeoX6Dy0S7ImWLcU7wfTynidD20asdMBYEHD
ul9JTXJrxQ6FiAjFJuUjJAMOgqIUDQoMDP30+5BMpGCp7Pc/stOGv48sq1wW6aym
l3HPNvRsj4wKhlo0pM+flAgJbj4bn8hf9qqTE0ptMRlGsXKMVKk2za/xtyrHKFh+
PMvNjipZABMGGjoq+oBaOlFQd96vqwhxmJyU7BdV0mLPZadiZrpwOmgqzt74oWxB
KIqVXjmKNEGtdUtJr6ecWGv9Jk/nTLWqECeLWr3ybM1Fi4OvuDzubLUlpN+poFTB
wchv11GGa71YF4QPVjn0RM0YKE8NUw==
=U135
-----END PGP SIGNATURE-----

--mTizstJNe2VTgc7+--
