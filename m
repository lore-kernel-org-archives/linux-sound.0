Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB27140EB9D;
	Mon, 27 Jul 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785159851; cv=none; b=Y8fXUzVPnNl2Thlihn6j7n7bF7xa6xEkqkgzxVaG9PgxrCO+NOaMyDcptCu1b2PKsYNfo1CwGlyejtftp3N/aTFS3WmNs2GBWGvKtpbFvXjZTeGgXBu4bTIN/ywMtv6IN4jOR2ZMxIQgHGn9XqXu7Ie9H++kdw4PTRCQQr6EywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785159851; c=relaxed/simple;
	bh=1jzQbjulhsqiH632N0TSLnRdOnK0j28MA16eGh/owSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZPAhAWEznCDNpUjeq87W898xfn9o1kv280KC41MGbtsd0sUfR6RbGNIih7eWtKCBlVd7GbB3VdiiUJGUSRnt4itl8v9Y7GXZLh2HRpvrDW3LIzgkuFv/AimDHMuyp39/RBCiKEtpGmHmhqe/IPqigZBWmcRZrZ/GUO7hzp7Mtak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHbqqo8K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHbqqo8K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660BE1F000E9;
	Mon, 27 Jul 2026 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785159850;
	bh=jHg1RkRxU9N7CQY9HA/VQE3rNz756tFfYsgQ+RA4Nhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gHbqqo8KFVTscj/KkiD2XkY8oJOD1tUG5Y4coFooiiruqMGfnVm9OweBgPSU+9JNt
	 Zwik4kGsdnn+pwKh6W4WhmFP02aiKHcggvFfG6w4CdQtT07VZ6U9JjXVES6KWL0Qj1
	 lHlb2FeVZdmhtxqT7d3YLwesdXiYeID5ynVAcynh0PlKY2/XLGX+tQPszDK4sjlz/Q
	 xbwu2ukZyiA1jccP1lv+D7h8IbttmEYrkusMqv8/LVeYWsa8gd1V8KUsn5XIRgx53q
	 OKBtG43CefZ/Vg7ZrqrEKfkZODTnCIxdwaGIlzvmhobn+wkEcRBqS1IbONCJg9Fs0p
	 xceiGKMxxBbzQ==
Date: Mon, 27 Jul 2026 14:44:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrey Golovko <andrey.golovko@gmail.com>
Cc: Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org,
	shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
	lgirdwood@gmail.com, Vijendar.Mukunda@amd.com, vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: ASoC: tas2783-sdw: calibration firmware not re-downloaded after
 s2idle resume (AMD ACP SoundWire, ASUS ProArt PX13)
Message-ID: <faea53ee-9271-4ec4-b274-9225242d4b13@sirena.org.uk>
References: <c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech>
 <2d59f17b67d3886a3085f0da8c8850f3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pUQpR7hK8i6SgeCo"
Content-Disposition: inline
In-Reply-To: <2d59f17b67d3886a3085f0da8c8850f3@gmail.com>
X-Cookie: It's OKAY -- I'm an INTELLECTUAL, too.


--pUQpR7hK8i6SgeCo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2026 at 11:13:29AM +0300, Andrey Golovko wrote:

> What does work here: drop the stale cache instead of syncing it, i.e.
> regcache_drop_region(0, UINT_MAX) before tas_io_init() when the device
> re-attaches uninitialized, so the following update_bits() calls read real
> hardware. Side effect: user-set controls fall back to hardware defaults
> after a resume, which seems the lesser evil versus a silent amp.

That's buggy since it will throw away all the userspace configuration
done through controls that map directly onto registers, without
notifications too.  The suspend path should be bringing the driver down
to idle and then that should be undone on resume.

--pUQpR7hK8i6SgeCo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnYKUACgkQJNaLcl1U
h9DRNwf9FGNDYbfx/26uKOy1N+3efj0P09ytTearbgakY85kVdn+CSKt5F/lQ4pw
in7GYlWeb/loeN3yt1a1gQZWwVGQjEoa0ScMOiTg1+vb/gqOAILyiEBzehRN/rV7
C9zguyH6vtCAjR/PoJv/CHleusj/U67lweiUwgZ7X+ijCao573Vjuuq8D7wMBWT+
ylH/+v8iwMJT9yybExdbH18uUx6Hikx7+pBTqfFUNEb7yXSmIq2N0oEN5bItR9QU
9awCRo4vqtrxJlEXupJZvtDgbvolIl5xOnRIe9RJKFedfbDpt0cBkhqMlW7usJHQ
gnKGIgOUaSf9aja/16zMi++vCV7Ytw==
=EB8Q
-----END PGP SIGNATURE-----

--pUQpR7hK8i6SgeCo--
