Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14F585636
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712663784; cv=none; b=k6y8E5A0O7Qnju7t0XpQVeZMefnuB1lweHvPvrdqNbMjJ2hQNGLuaOP0kzgrqm0SKj+fhZXDWv53iCPgjc1mNbXg3FXYSwRL8L/VAgwPFPJhyM2Uj+jynBJT+NW2IQcZl7fCS1ZxD7h+fYtWvFolx5aijoCXNnJVLTH616tcGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712663784; c=relaxed/simple;
	bh=lRfV4UixxhKtAa5MtYaTTUl48CIcy27a2c5Z8UtZaKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGOJ5VNjI7TswMKiVe5LeeBo+jreyZCWa/2UV7N1FJjwD0ueqgR7Q25eKUDp5nysbR9l61N/5fw4Bh+rWy8NUI76AHaZCMU262JPLr0JkzJ/QoYHO9OoEy4fa0BpJU3W5ZGqqHmFQShIxLvhFHVuMvAnSKJMrp1LQq4e//ZFutE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMK2xDND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMK2xDND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C67C433C7;
	Tue,  9 Apr 2024 11:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712663784;
	bh=lRfV4UixxhKtAa5MtYaTTUl48CIcy27a2c5Z8UtZaKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bMK2xDND/KiKXFT93127yEfvmZAj6Ds8XMOz1Yx9BfeXAGHSXwX9doruZQy+Jjn6N
	 kBOkuOmDFP4e55s+VqgiAQBLVqEMOI8x3B1lXg6qxlP+CktEYMi5PVyCiadQBd3uFe
	 HgXkVeeSO2tBKighXZdHKTXwtarOSRXV8cfU99Iws2HFC0uY/WZdKAIiq6WX/OQUiu
	 fk8lXYA/uE+/L9zhLmncZr0hMGnzgKmCeRhrM7viH+qpUh6nogNImjCB8YirT9F1qB
	 xw5IfM4sAL3G9t6T3cs/mF1gdhEDWFiXElW1oxO+wRvvjMxc44+T3XNs8/PyyJTVZY
	 qF3lSmLKwcpdg==
Date: Tue, 9 Apr 2024 12:56:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, tiwai@suse.de, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com, liam.r.girdwood@intel.com,
	ranjani.sridharan@linux.intel.com, perex@perex.cz
Subject: Re: [PATCH 5/5] ASoC: SOF: Intel: hda-bus: Use PIO mode for Lunar
 Lake
Message-ID: <fc90df3b-d6fc-416d-9005-cc0b3d330c8e@sirena.org.uk>
References: <20240409083812.14001-1-peter.ujfalusi@linux.intel.com>
 <20240409083812.14001-6-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bsx3880wI/cSbiwt"
Content-Disposition: inline
In-Reply-To: <20240409083812.14001-6-peter.ujfalusi@linux.intel.com>
X-Cookie: Everything you know is wrong!


--Bsx3880wI/cSbiwt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 09, 2024 at 11:38:12AM +0300, Peter Ujfalusi wrote:
> It is recommended that on Lunar Lake the PIO (immediate command response)
> is used instead of CORB/RIRB for commands/verbs.

Acked-by: Mark Brown <broonie@kernel.org>

--Bsx3880wI/cSbiwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYVLOIACgkQJNaLcl1U
h9CEAwf/X9H/PgqCVdfK/hnnEn+Z+Su8lHHH0YwYO0/kvnzdpwyg/NaND4NZgoDA
VeL1JN2CgCaKlMvjse5ESFEm8V/JpBeR701zd4UYFwPM5Qfh08pBRVWKoebmjWNu
3TXpY+lzHalNXszUzWlc+jdZCFoUWDiILulrhqdSIlNNbYiD44Y6nvusui30RQBd
D9Ikya04EpRH1ajcQgIajHGhgujjUTIfd+b4Xw1+cvq804duYNYJK3VYBNFsf52+
O6pf/V4ml//9YFNdNbwZx5Zuq51O2nGxSOWauBHyrBRcl3XhmZY8d2KR0MXbKZ1L
oj19oA/vbXYrN4lsgbLnJmLShZ7Mpg==
=rPcO
-----END PGP SIGNATURE-----

--Bsx3880wI/cSbiwt--
