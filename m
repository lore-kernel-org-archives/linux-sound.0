Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E471E2857
	for <linux-sound@vger.kernel.org>; Fri,  8 Nov 2024 13:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072543; cv=none; b=ZgxQDsuEr/Y2vcB+3WzvVngbmSWl4f0tWELvhZQ8xyyTbFP4Y9t25YUX4CAEe9phuxtcmC3s2BmO7h9s5MgNFrkQCNoo9mIpZwMTdGxAvV/sTK3xs+2ixJq2FN3p3PlA/XdRXC+SGcnwV8cd8cN52zST1DKndWLkYK0PaoyIHr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072543; c=relaxed/simple;
	bh=SvKwqMJIE4NuLauvgTW1PgmhPaFGJPSAxWSGXumwJgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIBNAyTZffARXwGrUwcpfk8vXMhq/2H9ZLikEq4ou+8I2D2zsnE0TzgTDMXhmhiHj+1eMu3BtzrNYVs787434odBhfT4hEkl0KjIimDr99GNKcAJ6hSrlD3W3zntkwVEXH3TdlsZut4Gc9IpKqolgfF2Gur7RidvwHu1xyRHILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFQB82XB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFQB82XB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E75C4CECD;
	Fri,  8 Nov 2024 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072543;
	bh=SvKwqMJIE4NuLauvgTW1PgmhPaFGJPSAxWSGXumwJgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFQB82XBWn7PQj8/Aa/Q9K51VXLr6zYAm+2pir05ZfEr8cm9WqH9m/omBQX2U9A6g
	 DHMlI+NoaBfY/bD7jGoyUE4HgI43vuClw/xuHPnR/kVta7LOwYXkfuA3QJ6CAxYuLS
	 raOfNzxDeyeSrdhLvxUlDQRhoond5lWYNWt1ID86HXy7LUcmDvNK17UHdL0WgOh/UU
	 oDDwtbvgEZU7M/w6vshOYoVELc3bztM/SdFVjI1irZOR7HeD+F3Z2GjmfH3HKOs6ii
	 x/ZQ9x3mw0DwnbHoAHM7N3wHPSG7cqXvfzRKTeLlrtkGDjdDiu/O4llwA2sIF+rfq0
	 d5srBka6T2PfA==
Date: Fri, 8 Nov 2024 13:28:58 +0000
From: Mark Brown <broonie@kernel.org>
To: "Shalini Manjunatha (Consultant)" <c_shalma@qti.qualcomm.com>
Cc: "Shalini Manjunatha (Consultant) (QUIC)" <quic_c_shalma@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Raghu Ballappa Bankapur (QUIC)" <quic_rbankapu@quicinc.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"Krishna Kishor Jha (QUIC)" <quic_kkishorj@quicinc.com>
Subject: Re: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm
 registration during bootup
Message-ID: <036ac7eb-aab2-4cf9-b332-e03b7b7c849d@sirena.org.uk>
References: <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
 <PH0PR02MB7269C77CFF58B57CBD2B3637D45D2@PH0PR02MB7269.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M2J6Xqdiv2V/g8ol"
Content-Disposition: inline
In-Reply-To: <PH0PR02MB7269C77CFF58B57CBD2B3637D45D2@PH0PR02MB7269.namprd02.prod.outlook.com>
X-Cookie: Do not overtax your powers.


--M2J6Xqdiv2V/g8ol
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 08, 2024 at 05:25:44AM +0000, Shalini Manjunatha (Consultant) wrote:

> Could you please share your input on previously asked query?.
> We are waiting for response. Thanks in advance.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

https://lore.kernel.org/linux-sound/aa1a8eb7-685c-4aa7-b73c-640bbcebdcd5@sirena.org.uk/

--M2J6Xqdiv2V/g8ol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcuEhkACgkQJNaLcl1U
h9CN8Qf/eMlU9mVRPI71yDRW+OVhEYY4P7UwhYeJTac/K6709Gz1A/+3ElDq7Ds2
pFwkYMOS9hR8xgQFRNjEEe60bNlBPZeerZb79802KX65FFwOmckfqlLIivfJUAzu
CuAX9+ZpXeiHcrnWb7sSLdt819dUsRxjmZTKiTxq7t8d5f6siEkU61Kx+8Jn/IqO
u1FD3xky0r44drf7aYYZBdXolW8AfON+klWa519RKzpvRXQNWdIVVzQdOcsr9uDW
fQYxPCIg1ePUhKuDCaxtOPupxwNoKBlnQYUhD3uGttNOySrPgFoGSZF9wGwAJj1o
o8fca5jPILO6AlupcrlIULuuYFKsHA==
=EN4r
-----END PGP SIGNATURE-----

--M2J6Xqdiv2V/g8ol--
