Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17544ADDAD;
	Tue,  4 Aug 2026 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865868; cv=none; b=iLnh9lw5OxDcjBh76+V6tKsBJPrOQlQE1B4NCyPQmFV+I4tqBeQmYMWUUMqS6+v7yUA5x+83QNBtcz5K0T0atUjfR6i2c1rJmKNG7Vk+j50RU59LA6/XLZHsoYjuKnU+e3quxfzSRuQD1E8zdlSqQY8EcdqV4WPe3yEjkBVv3SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865868; c=relaxed/simple;
	bh=LkOqpgJZWV09ABQYMSBhyXxk1G2S9zV+9flifzj8E7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCwES99lsJTxMyUcYweahpodDRsZyoYuqN6ojqTaZXae9GLV92vpUPuKYpvA7/zk16Wz6lHUCXof14bbr2UTB1B4cJkn6QsrSHT/mHfPdXP87Hz2PwrIZUfu9MYaQ1BqFmGWfmoWBzkq0mQO8ruX6DNYKlSKdd5lN6VwN+T/sck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QYggY9C5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QYggY9C5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2483D1F00A3A;
	Tue,  4 Aug 2026 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785865863;
	bh=LkOqpgJZWV09ABQYMSBhyXxk1G2S9zV+9flifzj8E7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QYggY9C5rrZYrPOr4pNWnMex4qpINP+UNbauC3Qaa50dDbpdPuOl2egqjYAevYRgz
	 eotVGD5zAxbSAy6zvnS8w7VNZARc+LNmwKE6gwJ0k7PprymrbfjN5dj52FqrtQqXdE
	 1UPtq/2IgRjOH3zj8MXfGCjTAWEhn4IJhiYjgHQddyKbecBKpP+mHE80EBzNUtLoyk
	 EVYJXKaIV2iGzbHvb9JR/keUFIPnICretg94Gr/kPMuyK+MSb5DO3R7XvgoO8+lQCk
	 /TQ6bBsIi5wbWQSu0u9HC6fpQgsVtvq/yBSiZ9JQNF1vfdNxEijD1VVDXaG1t8DCdL
	 pxVFlPUiq2h4g==
Date: Tue, 4 Aug 2026 18:50:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v7 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
Message-ID: <1179aaa5-a7e5-40d6-804e-b52597d844f4@sirena.org.uk>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-2-prasad.kumpatla@oss.qualcomm.com>
 <03f5d925-3d54-4634-bbf7-c2b29dfc7f07@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W/FSfqyDzeIMsdOE"
Content-Disposition: inline
In-Reply-To: <03f5d925-3d54-4634-bbf7-c2b29dfc7f07@intel.com>
X-Cookie: Biz is better.


--W/FSfqyDzeIMsdOE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 07:46:58PM +0200, Cezary Rojewski wrote:

> I'd suggest to move away from snd_ar_tokens.h (the name is as ambiguous is
> at can be) and start new header family within 'qcom' subfolder.

FWIW the "ar" is I think AudioReach.

--W/FSfqyDzeIMsdOE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyJoEACgkQJNaLcl1U
h9A9cgf/a7q/h2mSTEAXkRJK1Vbw8tA+DW70JCQuNvD/HtC5omymOgh72MS0N4RW
EY7kKetcJduoBJnJ4269n7ntA5zHL3FePdwke0RpjuSTDsyNifgD4MpFPHjWsJrV
c02GZ83Bipln1j+5g3pMAqSP+tG0oyXbY21phamqoTOTtedyQms01GZR0o3D4caE
7NCRRt6hny1IjI5LWvf6VX0FYvxyUWB5/th3+eXdLIfC1TsaP/U9khJOPVJd98Rs
hPNYDCWwYFIjIFl/nK2Yon5eGQfs+H1g7muznnSr/yzKZqM2bQIWxbwqPrjd9kzu
t5PNvBFCcm3nrtP0xwswVlcP1NNXlA==
=aZqG
-----END PGP SIGNATURE-----

--W/FSfqyDzeIMsdOE--
