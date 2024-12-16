Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45785202F7E
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734352142; cv=none; b=uAJ4QGLrl0o6Yd9m4rh1NzKb02hP5cfArN8isFtYf0U1vZubR9u8LL/YufksemsDCShEbxsbkjJhejODa+r1rCIYtdwB6n15xy6Mt+LZAbVp3to/yZ/wPtConhZIo43vx9bjw3FVRd7yZOLoJh6moBNRQPje4/RggIFsYyDJULQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734352142; c=relaxed/simple;
	bh=9fUWcD28BYs7YGoLKXJqe3iQTQgerqU+kEg5KIZpON4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXZzwnODKbXQfbqCcnODNrhKuf/oH6i3wTkvkFUOYhaVLs/EorgxP2js6K0jQJFJ4Nh88EqqeMDX3Z4h9RDDPk4CJ8FhP6MM+FB5Q1MyUnB+kiXnQcDVLg2Mz411fjHQzPEzS71aljWfbf3XnvTcLV80DZM9eg3rPpHrm24MThI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qr1PqaX6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qr1PqaX6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7868C4CED0;
	Mon, 16 Dec 2024 12:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734352141;
	bh=9fUWcD28BYs7YGoLKXJqe3iQTQgerqU+kEg5KIZpON4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qr1PqaX6TF5u3rEUvW8obzhsCK8SS8zcr65jDyxnXLlf4kk5fvvJTm600dBv6TQbA
	 N2ddgPwrf0J5oD77016c7+y/r1TYM0Ly2g24pIaEd7fwH6Po+LsGUn00PKtaPTa1/X
	 sndP4Yd0pQQM5b4/RoBMd9cEugOB+yXpZhopF2uAPlSSqck8NMxcDkm8/FVb9YRHTu
	 u+PxD4rMVd5EF/5zt1KOly6VzJindJ/cYCptnh9PbhhJDHNpC/DvrPR3IBAvgU3vVr
	 j0tkvtNbyaj+pgFTmz6e/P1/893+xu3EU2j159xvp+3WfpscaS0vzjj6WERfs9AwFK
	 7EdOxRfHm66Qg==
Date: Mon, 16 Dec 2024 12:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev, bard.liao@intel.com
Subject: Re: [PATCH 1/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21Q6
 and 21Q7
Message-ID: <8a2f6090-f748-4a18-a190-50425cc1f4f7@sirena.org.uk>
References: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
 <20241216033200.131362-2-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c9NLHRel4ebrpWxX"
Content-Disposition: inline
In-Reply-To: <20241216033200.131362-2-yung-chuan.liao@linux.intel.com>
X-Cookie: I'll be Grateful when they're Dead.


--c9NLHRel4ebrpWxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2024 at 11:31:58AM +0800, Bard Liao wrote:

> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 5899601ac143 ("ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops")
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>

This commit doesn't seem to exist.

--c9NLHRel4ebrpWxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgHQkACgkQJNaLcl1U
h9Dp3Af9Eml9BD4u1ii3cGD7u4EPuGksXdaS+ldfGV6f7NnNVaxcNs+CO8PoZLA5
eR1akYkRLD4eVcKrtbFP0/2Xz9WiBQIDvAK7fuvzfzz6jIudawzhn/dul1Sjt3q0
pV0RuYemGdozl2gMJy8abIOoY5H3Snt50f0JA9ToClbpTLtmswU0PboM7jwmaSkc
rniYWNANXdOX0R3FoXrOIPJitc7bqXdqJEFhUM6L8gWL+d6WRvTUaTPI4HbGcidd
SoVaztxtovUm2IKcWRSvUdHlKeqTe4SAOY6J2xNabpgrNLWX8bPdZZCzjWUqhZQ2
scNW7pEmr5rM9ldCywYMRuwqTKJy5Q==
=4GOt
-----END PGP SIGNATURE-----

--c9NLHRel4ebrpWxX--
