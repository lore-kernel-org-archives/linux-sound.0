Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B03BD237;
	Fri,  3 Apr 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217323; cv=none; b=C+rravQ6fDzDy/LSC12m7lbYoCFAaCewQOYdY+FrpEZ1KakGO4jdRWbzYHUutH80qpTfKFoZw3v1srNcp09xbKHZHtBKISauRq2nuxaQBz+yCG1EAVEzdONPdmltUdS/7bSYTRto/gntwUCY1/7GCyucIA5vZH6yNjdHwxl9GFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217323; c=relaxed/simple;
	bh=a4ntCKvudUWsvaczdKQvSMufCMJA3BORYS70EtrlLM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuHkDNeumbzL+MHxcbeQbmG5B0EXiSZSmsT+WkAL7PW6JJyZus9ddpWe6FnLDHfVussBpmpIDvlqGBe7+BISake3sUHrkLMmJO9j3wTia9OvauBX6yt2zWL9M48k0warb2RiwUtO5C70NB+yqrQZzzB2FYEmDKYpJ4dMpQRhiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2FMUSYB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2FMUSYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26EBC4CEF7;
	Fri,  3 Apr 2026 11:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217322;
	bh=a4ntCKvudUWsvaczdKQvSMufCMJA3BORYS70EtrlLM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2FMUSYBEMjDKqvqYVcpO32RUFKtB34Wp1zxFwCXtCHpbbZlJczfkXOGyEZDzOveD
	 fuygHifEECMZC8yb9iVyPzTk81obgVIj0RqGkhsJWC4z70s05NhVXFRxssUIh50Qga
	 iweQuk51qK/ZFNZGu5fsnukE0Mu/adsWf/eymx4GVcJAZe6SUthW7HWWqHoKPtAtIC
	 lNBfPHRCI6WpjW6zqJGamAXgRCa4os+RsAgNT8jQZfXW2VdAuE85/uSX0aehtiVXQ/
	 oduqlwyHsZmE5CvtCyY4BsINBTxa+VVZSa96MfXSkKNv1XxYTFYDCwhU1HGPcmts3Q
	 Uy5yRJ+U+5/Cg==
Date: Fri, 3 Apr 2026 12:55:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Syed Saba Kareem <syed.sabakareem@amd.com>
Cc: alsa-devel@alsa-project.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Hasun Park <hasunpark@gmail.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Kees Cook <kees@kernel.org>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC : amd: acp: Update Quirk for Lenovo Platforms
Message-ID: <fc7cd530-2199-4c12-af75-6ea17997777c@sirena.org.uk>
References: <20260403100948.678548-1-syed.sabakareem@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NrKc2B8N53SKaFhC"
Content-Disposition: inline
In-Reply-To: <20260403100948.678548-1-syed.sabakareem@amd.com>
X-Cookie: The Korean War must have been fun.


--NrKc2B8N53SKaFhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2026 at 03:39:38PM +0530, Syed Saba Kareem wrote:
> Use DMI_MATCH instead of DMI_EXACT_MATCH for the Lenovo SKU,
> So the quirk is applied to all variants of this model.

I only have patch 1 here, what's the story with the rest of the thread?

--NrKc2B8N53SKaFhC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPqqMACgkQJNaLcl1U
h9AMRQgAg/4zIdSESnxvHT7boPLPXWNLMDskFNfswDSMEMu1StTQRgrwk0Xa5Zpb
fypATmN01D+/g+F9NxGVrdPwjq3ml0rAtGbCdAGvlVvu2ANLbfwtyJhfF5ccGEIK
TCV0nVD2EQF1lRBCtZxdw/1vffIJEsTYf7WL1UfKKAfqAcYF1UVqHqeS6lWaJuUM
lKUZfwL0RptIpLoy1suTr+g2jBl2AJpw9S9I3plqo5ylzbMbFjVBgBnLaPP2qCDG
auKxaZ5Z5IBRR3JDPHyFuK9npCbQBzs7rV4fjHmR6H4jV5i6KxiaFue0O8WcMn0b
NxOrYucvQ7PCCLBncJA6blv2jI/qCA==
=2mS0
-----END PGP SIGNATURE-----

--NrKc2B8N53SKaFhC--
