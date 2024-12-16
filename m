Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3458202F7E
	for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 12:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734352117; cv=none; b=V4CUFAn7bKo8HDFHkSX7L5FYMX3IN2HBSH5mWT1iVbnoUhdE4VxJ5MBCGaPV47b9FSZj46kjiMmT5n5M/KH4KBp9CpwCfSOF27rbm4DHUjC2sZLnH7pFkAFNfiWyUfnNeFRlc0TZLSrJplqlkhgm1RwlV6vDhqt1rtdojPxyRCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734352117; c=relaxed/simple;
	bh=mt/9nLZ6+PTuYNlGHuF7+/NMW7TpSzKQJUDEIc3bajM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9lKlqRoxiJXdaq/pQdT/nDH8qG5DnDIDrn5poWYwViwLnHOaVHpJEzaHOkS6iJ4H4+Ci/a+f/E6WMyjRWSXBTK2jZc7CccaN1xA5sVg87Sz6jU6Mq7eTLh2rfbLsUpMT+dwS0j0AC6AevMXkSBczvcwSQTJ7Sot+S7rYAw8bEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVHM3Gag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVHM3Gag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52149C4CED0;
	Mon, 16 Dec 2024 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734352116;
	bh=mt/9nLZ6+PTuYNlGHuF7+/NMW7TpSzKQJUDEIc3bajM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVHM3Gag3hLMg1VD/ee+A9GfnBa2jxcSh+NtnnUgNM8LERq6tx5TG8+l956ZN8lN3
	 LPIjs6DCSkCMqbi+aEgavbjFnFQyxVB5bogExIc19ghz/WKlB9z8lwPxwUFS/gKwBR
	 A6I1yJlYpLw3mu1B6YTyC4CnzgE3ZW/AXc1z/sLEvCcQlKDT0sLUrR3TiZnp2IAzrD
	 CypCeGsxzvkmjsya8LSOv9ojc5ZNXjcJ7RYG21jmQF1Biy2bkpu4v7ud/MzbBTfO3S
	 UIVk0ZQ4xu2d42nU4cuwSdEhNnnZ8OfasPmCHmTUhlH4dWfEt77E9bmBEot0bCDc9u
	 AVJUcV7OYVn3A==
Date: Mon, 16 Dec 2024 12:28:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev, bard.liao@intel.com
Subject: Re: [PATCH 2/2] ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 21QA
 and 21QB
Message-ID: <46ddaa24-4379-4f9c-80ec-30faf3282f47@sirena.org.uk>
References: <20241216033200.131362-1-yung-chuan.liao@linux.intel.com>
 <20241216033200.131362-3-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l+QEvNqSj83k3mUI"
Content-Disposition: inline
In-Reply-To: <20241216033200.131362-3-yung-chuan.liao@linux.intel.com>
X-Cookie: I'll be Grateful when they're Dead.


--l+QEvNqSj83k3mUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 16, 2024 at 11:31:59AM +0800, Bard Liao wrote:

> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: eea00cd603b6 ("ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs")

This commit doesn't seem to exist.

--l+QEvNqSj83k3mUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdgHO8ACgkQJNaLcl1U
h9Ag7Af9Gaqy7TWa21duE/X8fz5Lt5HxO4debNvd1vcAffh3Gw+K6yxDJIQM9YKe
gg/U7xHsTU26UJhT3OwP1fy6j0f5J+Ip2qpq76jdKpYcoVUo5jMGno8nyKXyNRme
e3sgP6//UJDLf1cEvJqpxe3RTRtVTnyGmQnSu3bGc3K4oJy5XLT1MuYNC4CmGN5f
k8+xpI511ijCSigJBArp+uHs443L/olcES6UKVgKzlLNh57tCROiY8ocZ9CsRxa6
YzxhgVBjbkQDL+ZgJO1NgT2N/AMIZ0AE7lCYIGzY7Ob9XuXw6RDwek39ZHiypycT
isSX+LZDQACWXyYzcFWuScPfdZXtfQ==
=rQd3
-----END PGP SIGNATURE-----

--l+QEvNqSj83k3mUI--
