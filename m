Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53B13D349F;
	Thu, 15 Jan 2026 17:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768499972; cv=none; b=T4R6zZfoR6/K7KNbFKiSnWXD7ORfukdr5K2RzMQmc3hsiL9ikXOYxKOQMnu3gniKEGfgvR4cYFqVMke7LQ35+nCGxdOJZZsh2Q0xnaM3hHR3hf+3J6Wpz75j68WezYWVi27kZ/lE9iM5sEMPVeQYMPkxVDMNK4sXYrBthzfwmuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768499972; c=relaxed/simple;
	bh=k4nv3LNd06xUvMB9BLcG7D7UT7+uRA8LQwwCBmUw9b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdtJ1nrG/NdakwGZ8gHxwCA4QTBAZh6HA6lLJYzrWQ3fA+rCUhfkC4Pf0bp5fFkCJSHp32d+NdNvk2FoO+xuzQ/93P/o3JwuX556VLqde+pxufAQQVz9bgafl3GAn+Zw+J9cIFr8rGamf2hOerEAojhZI7Aww/J6N3goY724BLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bG1i4O1+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bG1i4O1+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F1CC116D0;
	Thu, 15 Jan 2026 17:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499972;
	bh=k4nv3LNd06xUvMB9BLcG7D7UT7+uRA8LQwwCBmUw9b8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bG1i4O1+W2z7yWUtJI1p/k45SGqFHEUeCXPRng04/jkQsWUyjPvq3mHb5AciPxV/C
	 UukaXnh3Yj+ph19La4HWe8yH9NzKH/gw3gbimVogSubKyLiGhmzyF5u9Gym/B22Z2J
	 rb4/ZcqhkCesFC7O3e2GcmvMY2mUJ3LtFcZbyUopScOin/CYRKn+S3iQUMpDgX33OQ
	 2zDSdShciJprta6Vl9mZk/jP8OgxzS9ugcb/N80LOgq/fqICk0I3EG53CPXPbxJBPm
	 K4XHnOueqew3hL2YV5evGkeOZjzJkbP2l0I77g56YrBAZKq1xsDtcG0M3TAiJV664u
	 JzpLo5rXebRHw==
Date: Thu, 15 Jan 2026 17:59:25 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, krzk+dt@kernel.org,
	conor+dt@kernel.org, tudor.ambarus@linaro.org, pratyush@kernel.org,
	mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, lgirdwood@gmail.com, matthias.bgg@gmail.com,
	julien.massot@collabora.com, jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	robh@kernel.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and
 clock-names
Message-ID: <246e84a5-18f9-464c-926d-3f1f305283c1@sirena.org.uk>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-3-angelogioacchino.delregno@collabora.com>
 <e1ed2a68-683c-4235-890b-9b2c5ad93e38@linaro.org>
 <9bb24b4a-248d-4a97-a9fc-a00b5237f548@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KyHCmqwLxjNYg8pj"
Content-Disposition: inline
In-Reply-To: <9bb24b4a-248d-4a97-a9fc-a00b5237f548@collabora.com>
X-Cookie: Are you sure the back door is locked?


--KyHCmqwLxjNYg8pj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 15, 2026 at 03:46:18PM +0100, AngeloGioacchino Del Regno wrote:

> I wonder if the Fixes tag can be added while applying.

Yeah, b4 will DTRT by default there.

--KyHCmqwLxjNYg8pj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlpKvwACgkQJNaLcl1U
h9C6GQf/YxMHx6TFHxRD11tVNCK7jX3h2fjjKf1TF9IusHOSp+9QdQzpXJWWi83w
hDYIsC5WX4jgAZ+IFLo3qaDsFtsPBfPvBvbSdbncbCDuqPYcdGr9EQK7gC2tugyT
107X+LJwJ73+cM/zlGxgv3qpvdhd+RrRqXiKNOPv+a/DXfip360bRzKWvEkfiNSD
HX/tEKhncVVHePdGClv71P+fZ2F6jP7jRcG6ExPE4KLj0YRa/NZ8iOUMg1dtIYBx
pL/vDRD5Sq6eXq4az9H/xgCH1/+J/GmGe4ZislsRksNFRmcVoh2WGXGA3ZEg3TY/
7AO+EqXRxfl97vJBipSqR2HUGChvlQ==
=lO8H
-----END PGP SIGNATURE-----

--KyHCmqwLxjNYg8pj--
