Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B444C9E1C
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643168; cv=none; b=tFqZE+yS8v/eL71UY71SzPv2kzDsh7FXClwsYGYaL5ggBZ91nBgnoOX30j4hDrExj0LIvmaUXnwXwYI613TNiwhG/k7Wkt4g91K9KK9pfVB+4u1W8mimIuU8a/gN8PajdPk7CmnZo+76frVB4Qv/7wvPD7jeJwZ3REV62YcqP+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643168; c=relaxed/simple;
	bh=aXlkkkQAK4MbRnv8W5254eIC0e28PqzpfRwldBLdkcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDUFmOB0gbpK60SbKUrmd6yfMpO2nwj/v1mZ/MA6b2Nr415lGizBUQG37FT3Ue/S8soxloRlCqpAi5ZHWnM/bXZ7fKEbp08dWN+fP6/BJHKXMW7Ns9+K1KRGjo8PZvk2lQaHPZ3ayW1qwE/SmRGRKzcJOqZUurkLI8hSgyciAKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KepmlAwp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KepmlAwp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B705E1F000FF;
	Thu, 17 Sep 2026 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789643161;
	bh=4juu/6OR3Dhjelm0HkW0ioS5LlRYuhSwK/77GBrbUi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KepmlAwpsHxr59FpZei8ur06j7GW/cYKio2FU36Ntrwodu/kHHlGNi5a3xWKUg40V
	 MZY7ynUt4o2RBXjQzHORDWIzcyMBh2F9GrvVX5L9GCOG568BF5PA6clJ6HET7u9kqJ
	 t9RO15TkkP7U3OFRNMR3yNvNI6v/nqcZWJBdOlVDD4sjUrFyLLYSQPeAjhtfFjiaaD
	 BITzlQ0oIyuIJUc+ICZoNxtCr9oTkEas43YSE2qrrwME6m6oH8onDIdXHuEm9HhJDF
	 MDRD4X6zl9bXGOxmTrEzT/B+bZqzC+7dBHB1c7y6MxnG2evwd0HsxbWtphQ/a6sanu
	 DXLPc/uDznciA==
Date: Thu, 17 Sep 2026 12:05:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt712: add GPIOs for LED control
Message-ID: <e523971c-c29f-4a64-8129-1ac8709817e9@sirena.org.uk>
References: <20260916090513.2294466-1-shumingf@realtek.com>
 <3afc23b2-6072-4b65-b3e5-88cee7bf6997@sirena.org.uk>
 <6c0f94dee95c474d8fd7b5ad486f372a@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aeNzB9DlSbh2eVL2"
Content-Disposition: inline
In-Reply-To: <6c0f94dee95c474d8fd7b5ad486f372a@realtek.com>
X-Cookie: Whip it, whip it good!


--aeNzB9DlSbh2eVL2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 06:24:06AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> > > +		rt712_sdca_index_update_bits(rt712, RT712_VENDOR_HDA_CTL,
> > > +			RT712_HDA_LEGACY_CONFIG_CTL0, 0x000c, 0x0004);

> > This doesn't do any locking with other regmap users and gpiolib won't h=
old a
> > lock for us - since rt712_sdca_index_update_bits() is a read/modify/wri=
te
> > cycle this could lead to corruption.

> Sure. May I add a lock in the callback instead of only locking rt712_sdca=
_index_update_bits()?

That sounds pluasible.

--aeNzB9DlSbh2eVL2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqryZQACgkQJNaLcl1U
h9A9iggAhK3KeUaDuQ1OiTOa11UIu3/HK84EJrPUbR5exoe9ChziSrS1jMeneHqK
V/HVwH8emkJ9u8tddB8KxwCyhIci8BnO3Wsq5HtDDcLLFle8c8CQtfMR3X/v2vVs
gRZMfT1kwI/hpjkxIH6ECCTQ+I2y3VLJ2FaWSEoihp/mG+MCq1U5oKoMJxdwPPXh
V7XThm47eu26bP1S08AyozgE3E4DjWIcTsxMPrIpaDSPMufqh3WtoZ1p0liemVAv
BNIIfqQPCMGfX1pyFNtCFwRSGEfsKSKkUFUPAgQnkFdCyMNLJwnL4Ny2VUswo+s8
aePlVQ4HaomlLCq8FdfdDDHmgURD5A==
=TzYT
-----END PGP SIGNATURE-----

--aeNzB9DlSbh2eVL2--
