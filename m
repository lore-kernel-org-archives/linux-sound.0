Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7639F187;
	Fri, 14 Aug 2026 11:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706602; cv=none; b=QlpWlO0pFzC/Z/0+JqBZshCNO6ggHYaaf+c+SZNEcgQhpX6FJvOpjebLGdE7+9jJlZTrwvlZGbc6WAsZp6mwTw5wlu5r+9s9zXhkvwvMgRqfU9Yr1whesusYUYDINbC66szc1W3cpGwe1bScYZMqMspyPkgi7qrcEXzrYqh12i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706602; c=relaxed/simple;
	bh=rTIiYGCTRbexi9EneEl3LcARzZARKdEb0plhunygDSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck5Z2fKfywIDAO+JFr/AHq410Q8pRyVW1Umuih9hvPD8Ub1KeyxUEBl8TQdL9W2osmY0Yd4fHdtZN9hvqYCOVKQSQpfN7vFzyK+6gZtznSYm5mp24KQyUhLslDYlt7xsozOZqd/TZg4qNKYCtGA9BhIijtL5Gg6bSTjNISAel8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlxnxoWw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlxnxoWw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 942321F000E9;
	Fri, 14 Aug 2026 11:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786706596;
	bh=KkS5iqI1KCXVRQiNSG/qGktdgLMbfW5BJqBMCcW1WF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlxnxoWwiFnLOegEg0BmEYN48DtQD4JcDYALypshCW+2qSLAxAjWoShjL+nwOO7eb
	 /wIksh7GHq9ZU2fGLUSdzdh4BzKl/Us44dbaiRbKdfvxThCLazATu0pCnXUJFffRrt
	 76bMXIPsCOuLVBGLppDM/tE4P7d535ds8B/XlmfF2HC0Zq8TJI9tX8QBsU0v1W88TW
	 i7RvyeAbi0aVhqGyYVKSY4U1BrQyxR5faDlrU3fbELtN+W4Kx+BT2Nl1WZhQPgK3+g
	 S2mIA3MJi12H3fakqj9Pzlb0wfsrwUbojCdDfzbs1V3MHtZlwaONn+NEtYa9oIpQHy
	 Gf0imusVJKAdA==
Date: Fri, 14 Aug 2026 12:23:10 +0100
From: Mark Brown <broonie@kernel.org>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Yi, Ken" <k-yi@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
	"Chen, Robin" <robinchen@ti.com>,
	"Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
	"pin-hao.huang@hp.com" <pin-hao.huang@hp.com>,
	"Syed.SabaKareem@amd.com" <Syed.SabaKareem@amd.com>
Subject: Re: Re: [PATCH v2] ASoC: tas2783-sdw: add firmware download status
 check
Message-ID: <8111a8c5-6413-4c04-bc23-db30e3b78b1b@sirena.org.uk>
References: <20260813021450.1897-1-baojun.xu@ti.com>
 <0799cd9d-a0ef-41da-80ea-3fb9b1ef0f7f@sirena.org.uk>
 <7ea690074ee94d9786ed21e2bdde43de@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ilGqQWldoOFjm/xp"
Content-Disposition: inline
In-Reply-To: <7ea690074ee94d9786ed21e2bdde43de@ti.com>
X-Cookie: Body by Nautilus, Brain by Mattel.


--ilGqQWldoOFjm/xp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 14, 2026 at 03:45:20AM +0000, Xu, Baojun wrote:

> > What happens if the amplifier uses power (eg, over a system suspend)?
> > Though since nothing clears first_hw_init I guess there might be issues
> > there anyway...

> Yes, that is the purpose of this patch. It prevents the re-downloading of
> pages above 0xC60000 after resuming from suspend, as the data in this region
> persists across an AMP reset. Therefore, these pages should only be downloaded
> during the initial power-up (when first_hw_init is false).

That's only going to be the case if the suspend is a retention one that
maintains power to the device.  If the suspend is a deep one that cuts
power to the device then I can't see how it'll keep memory contents.

--ilGqQWldoOFjm/xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp++p4ACgkQJNaLcl1U
h9BcMQf/frCo29taAXlKsrKWybhTMJnAVlIvkd/yZZkKeFVsNxApt3Z7oi+/k+oT
1fCWuURmA2TWC9i3JQl/fqT6ARzc2Mdr5jFxfP3giiipDljfuttZcvsNv4l/dyY9
aXR7sZspdaGGBBY7kHdxUNwej5JnEf5U/zX26PvSp55G1pqArDt6wMv4mCCI/Ipt
JgIuclS7oOu6BzxdKBJt8GsubUY3AMGLfggHCxHeAu+/1FZ24HWWCNbM2pjarwm8
GH+ps+5nOVqhNVdXuOP3QdI6FsOsXhu3ydV/uS0TxZqoGiI8Jj/+NNIt4255lqq7
E/wEcvk7/8QWNfdoZ0QQJhwwjjwwfw==
=elVz
-----END PGP SIGNATURE-----

--ilGqQWldoOFjm/xp--
