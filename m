Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78C0435A94;
	Thu, 30 Jul 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427073; cv=none; b=bScVtnuitzwzXOYwfo3W4GbAZRUXsrWalE4FxVegqMy6mWIB9wTgk4kxFBsypu/FAnYYsiooYhDIaiS5NbNQ/SeQ52cuiK10XVnazA7IowSSVNJZKSl6uv96ioMNjLiPhnY+VUJPsZ2Bm3N1W7WM+Hzbp778Irzujz45UqDgzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427073; c=relaxed/simple;
	bh=6tfGRcq8mZH9c9IiXZes9VDZQ398/UwLydBiuUg8kZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2iJ021UzNd8XHSnbVpK2ygXzAY2hLZaXbPnPOZpQHYqjyI8BbmbZp0YPaDgxxtUpizwSma0/V5VK42CcXuYiW4PxvHLjA0WOCCqu7ZBxxSxL3mvAQFtxQ3qerzkIWVolvQ3fUsufildjltHiLVDGX189Pe6yfagtM7zcY2eRv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fD9Jvqq3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fD9Jvqq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6FA1F00A3E;
	Thu, 30 Jul 2026 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427072;
	bh=+q04Ue3HdSBr1XnCB3PJnxLzPRDWGBUATBbdVwP6ygo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fD9Jvqq3XLharvfabn7wbGpPKNWZKCJjIndwMWNHC/Xz1unxtp5eYxNVntSLH6Pdo
	 DLFi/YgeZ9WQtjUHR7tz2IpDgMdNurdh8LpFenLI9bJvlS2nlt64plGK4LaIIrLDnL
	 +P4YXyy8JQ/UxjSahhOC3dJo+jebCJGHZ9niNf84BEFxIiOAXLj+AFjmulY7t2U9qo
	 oUeiMil1H3IM+L5mUvo/Vn+YLKpgKDgYO6UP5luA0qJpXZ7XoKs/6PaS8MmxjaDu+h
	 epWv0KCL5l2q5X9gpzIlm8wutMLvjpAGTJXLTf0cqh5861k4OeQTwcDDPmkNt8HH00
	 mFCAeW5bLPoug==
Date: Thu, 30 Jul 2026 16:57:48 +0100
From: Mark Brown <broonie@kernel.org>
To: kr494167@gmail.com
Cc: lgirdwood@gmail.com, chancel.liu@nxp.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42xx8: fix regmap SPI flag masks to target high
 byte
Message-ID: <8ae1fb56-5d48-43c5-993b-2da7f72d3994@sirena.org.uk>
References: <20260724130128.76334-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dVO+gsYgpHwr+/Gg"
Content-Disposition: inline
In-Reply-To: <20260724130128.76334-1-kr494167@gmail.com>
X-Cookie: In specially marked packages only.


--dVO+gsYgpHwr+/Gg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2026 at 06:31:28PM +0530, kr494167@gmail.com wrote:

>  	config.reg_bits           = 16;
> -	config.write_flag_mask    = 0x9E;
> -	config.read_flag_mask     = 0x9F;
> +	config.write_flag_mask    = 0x9E00;
> +	config.read_flag_mask     = 0x9F00;

Have you tested this or did you do this purely by inspection?  I'm a bit
concerned about how well the regmap core deals with the endianness
issues for multi-byte masks here.

--dVO+gsYgpHwr+/Gg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprdHsACgkQJNaLcl1U
h9Cm5Qf/XMYFKkE+FFELIQ9zJKg8NAkPTZbYMNqT7qGZJE/4DhIbLRyaiDHs/giL
nKEvanVcBkh310AncgcmN0H2ZuaZngYmvQ80GdEIfAOd54y7lXvwe0M/uDnAgnxT
WoudrAtTHjkyIU2ks84TK5J9TGzOmPMsOQGtr9FQWNjJ3A+hEkiH3l45Z5yXxwit
lhAFzKCu3hseDYjF/ZgzuJ/3rr/ij4KJKU2DS75xb/9JjPHwem6iP7MeeRzDQGuY
EAtjStxH5Ht4Nf1Z6i+6izVpmWetg7t98Thez/pXz8EAOOVSOfMeOOpG/YxJzvYb
Pp03L3Hj0i1Lt5KOXBMbhhmxyV+CoA==
=0U8n
-----END PGP SIGNATURE-----

--dVO+gsYgpHwr+/Gg--
