Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0726F388E53;
	Thu, 23 Jul 2026 19:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834675; cv=none; b=pMhNi4wi46D3srk0ndI94UCgpP49oYXQSFaKUWTcxIkX28VqHrobZxcX23c8eA2VLX9lTLLyz084ueUybC4CVbIMwt4Lrbv28wm97oqfthM556YvehlE6PvoZXDNqRUa8SwSi10coUBMK3OAi2+K3IpBQezXh8dZDyCEuEovRtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834675; c=relaxed/simple;
	bh=7E2YfjkqClT8GAugBap4nGE6W/lD/oGQpxaSpPzPVnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtyT9UwV5RnDAR/kQMjKbDDLXA5HcYRrA9LXBM3g891m4ij6RDa3EbL1FsnQXT5+VJzTnqEZw5BxBClkb0SThr0aU7RJuN5dYQo5Tu0mP536B/I9OzT4KRgAb1QEMIrAORZfnem7qPAcwSx9kBS7Uf2QWTA7HTDZjJrKi+Xea00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m45U2p2x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m45U2p2x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AED41F00A3A;
	Thu, 23 Jul 2026 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784834673;
	bh=JhE9DS1wanygNA2iXM6+2xeWK+VMKzZDSJeEOBo+61Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m45U2p2xHWVX+YkeaQykSsZtPNusaU1ieQrA4xs/Woa2Lrya8L6RipT03uwzkhzVV
	 J1pvUvUp+/8W146UdtoGXe+zqx4g1g89izRoEgTsOEk/mn+CBGRv3PTabQOE1brxrY
	 fTfB2OLmAVPavOiSYgOYjuY+s0d9bs3wRZWkfQjJfKx6kSJcpxbT/MkAk1AHohKuXe
	 fo30jhVNzmW9cGfY4/I4o/ra259GuJ64Jr0ZbeajAzHb2zf3lBAUtK56tC82PfFcok
	 aM4fogdXlXLfE2MghDVxyPHlyDKfVIln0IAWFrXbAgPjwj3mf5uoDPLGh+QBb8b4Y9
	 6xH0MthabLeGQ==
Date: Thu, 23 Jul 2026 20:24:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
Message-ID: <a6f86d96-48bd-48e6-9306-159b17380ff8@sirena.org.uk>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
 <6a609d87.87c5160c.1accad.0f33@mx.google.com>
 <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
 <6a625f94.4d70c427.b2b96.9b5b@mx.google.com>
 <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hn2Mm56IKrdfG9Vq"
Content-Disposition: inline
In-Reply-To: <5o4nyr5iycpgopeo5dllygtndbp24g5ejqvh43d3mxwnxufork@zds6b6aqvcqf>
X-Cookie: (null cookie


--hn2Mm56IKrdfG9Vq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2026 at 10:18:47PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 23, 2026 at 08:38:09PM +0200, Christian Marangi wrote:

> > Yes on OpenWrt we support 3 OnHub google devices from Asus and Tplink and
> > they also use the storm driver for the strange attached speaker.

> Ack. Then pretty please, could the OpenWrt community please contribute
> those to the mainline. It is a quest and a process, but it helps us to
> understand actual hardware users.  Not to mention that getting platforms
> support upstream would lower the burden of rebasing on the new upstream
> kernels (assuming that you are using close-to-upstream kernel) and it
> would also save from similar cleanup attempts.

So should I drop this series for now then?

--hn2Mm56IKrdfG9Vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpiamoACgkQJNaLcl1U
h9C1LQf7B3nd1G8BqzkJjdRVxW2yOOwHDvHAJvmffp4sMa9REy9tG2rdpa+wj4MS
5X1VCQmzgVvaWPuW3xFzs6pHDtARNI7qvUUuvcDc/4B6NIMhkqh+hvgzPjhg4/fA
B1HnEinWirtXTuxLr8LW/NCWCsm9tLCiEqeEcrcjptkfXioGAP6HhqLfPXfKmGpI
/+2qH+aK61vJhpFJgdaZD6p1fp49y0c+8xUcxpXns53IIdGiUOMEZG4TbBDjjU/H
NUZk2YsnoR5LH36fiFtWRPPwF9OCof7JtH/ORkB3tWGz7QBnHQq0XgilXw+5XpTk
HQQ76A7plgphgM+Acvj9yUAre46HCg==
=I21U
-----END PGP SIGNATURE-----

--hn2Mm56IKrdfG9Vq--
