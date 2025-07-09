Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B612BE7D9
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067998; cv=none; b=fkOFVRptDIjOAB6bTqJTaw01AMPzO2Wo4cymjFFg3GWH7jwCDr6WhBSFE0fAoTfoDJx/oRxs7QBDY0X77LfibhIkZwQ968vK77zaMCcdrTzuHjVo1XXzlOj1/4/UeuOq0lZ++kf+ADSEaHlpW+9m4PTebbatPwfLBLBgZIbmLSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067998; c=relaxed/simple;
	bh=GmrXDxWsEInNBlqSbvZ9NDSIpH16I3rIk2si7vmflTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GL3aj9CTcrOMLEdUR7+OdZp3T5Gg/oF/FRuA9MSpQu9eLF4grpyqf4D3daSQ8NOrOBUdo832rzzxk4R1pJPWmWtH5dV3gDN7CQAgViwNk0Jv1Bvn6FWWsK0zMpOBE8gYEU7lJ/s9JblOG3zlLONVPCWbGBzhaP322dPngcWQwd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAWHakky; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAWHakky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1F6C4CEEF;
	Wed,  9 Jul 2025 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752067996;
	bh=GmrXDxWsEInNBlqSbvZ9NDSIpH16I3rIk2si7vmflTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAWHakkyg6AZLdhpXHeps3bQMendA/tiTUa8/t/SnD+4HFrE77v/WGjNj9IS2/1wE
	 jD5H5QY+RUEddqS4I8wpmT19m7rZr51vvI+SGSHxqqP7oubzvZv2+iiBSEXkwesa2C
	 kqutbpDU/frZG/g+kJUJDFdBXb+dcGP+ZgD6E71ld0er7KEhbrc0Rkgpt9mSxKBHyd
	 UI8X2sPu8yosv5yF19Do7c4WwdVe0fJMgy7oNB7Et5MM03qSLIc3+bKIvUiEL+7tdp
	 8D7QV3iYfWRXda6CgodTdmcxJdsPC1MWXduEYUNCUks4n63VtUgygayNheEZuD9jKP
	 ug3PX9r6/1ybw==
Date: Wed, 9 Jul 2025 14:33:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev, bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH] ASoC: sdw_utils: Add missed component_name strings for
 speaker amps
Message-ID: <aG5vmbWvHyKllpdQ@finisterre.sirena.org.uk>
References: <20250709025745.1285788-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QpTFidYxOqDgMTqI"
Content-Disposition: inline
In-Reply-To: <20250709025745.1285788-1-yung-chuan.liao@linux.intel.com>
X-Cookie: Nobody knows the trouble I've been.


--QpTFidYxOqDgMTqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 10:57:45AM +0800, Bard Liao wrote:
> From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>=20
> Several speaker amp was missed when the compoennt_name was added, which
> results missing " spk:" from the components string, confusing UCM.
>=20
> Fixes: f792733e08d5 ("ASoC: sdw_utils: add component_name string to dai_i=
nfo")
> Cc: stable@vger.kernel.org

Why is this tagged as a stable fix when the fixed commit is in for-6.17
rather than Linus' tree?

--QpTFidYxOqDgMTqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhub5gACgkQJNaLcl1U
h9AaWwf+MSaCPAXOSnIIBs2l6JHAGqLpheV3HZw6UG5e4Cp7Dm7dB4ReBglcOhoq
Yk7SwQVe0rSeVLL0LxwllXxKUe8eGp9cejJi7867XjgPJpXPs/xG0rMvLqxsLrMp
lkQG2qijzCzfc+Bs29+/n5GFzyJR4Mm6BAzRMCCO9xbTWdbgGST7n6hTZq9vqibM
lGAmPlCBY8/GmqHh7TX7x5i4Us7E7y6vwCbfLZCeZETYjw8+nszPHtZuwbGhAtDA
KRsiFjd4Oxul3X2CIogkEUmUqAazV0EKRI3vuKEfMr43lrXwOzrkn5IlaY3IMfBl
ariKG7qLB3zEZtFSe8EeraAwOEcZAw==
=txLk
-----END PGP SIGNATURE-----

--QpTFidYxOqDgMTqI--
