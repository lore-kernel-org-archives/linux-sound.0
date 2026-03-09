Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0D38B7C0;
	Mon,  9 Mar 2026 22:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773096205; cv=none; b=R3CWr+qcfR2eKHl53QvNso66KqQTJgi98g+QYnjjjWzvjh1zgkwQtVgJWYvV+RS97rNtsA7pDTVwerGJkhKhNU3bQRqy7Nh2ZEMqEI2lVdX0gsFf/HD0YWZM/+QNcx6YH5SIyOm9S/D/BaPckemQxn/F+l6Qu5i3AmHM2VrABQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773096205; c=relaxed/simple;
	bh=ZEYhz7xg3sczBOBu+pB/xffLoulI7gmHnmvTYKan0H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCUV4ClbmqgE4S17qgbZG4XFk8/+4Bakyt+8VS+xDJo4BMQBkGvHcjvX4GayZFFpMXKrkOuf35d3xKklkWvUrXIKB+ZfiXKcEJF2VJvryoUxktn+MvRjjj/39RtfgH40JZULuU5oAhIeA6PpZSrXCOK81/mXjigyUUlMT/ye5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0ChRkx4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0ChRkx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B761CC4CEF7;
	Mon,  9 Mar 2026 22:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773096204;
	bh=ZEYhz7xg3sczBOBu+pB/xffLoulI7gmHnmvTYKan0H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o0ChRkx4adkI30uwkOeH8CBE7kaj0h8OwVe2s768+/VoisV3Q4KA4KiVW/UetyhCt
	 w98Rn6inG8wjPuNP6fwTCc6YGUQ7hUNxzNiKrCOxm8jhPwpmj3PZNFDS8oWBvI79sz
	 M6mtc73kj7tWgP3mmXZCq/l1taIBAxvKd9u/aQEoRBlMTk5xpBbi51hFpQcqPgiw2y
	 qCSN+G/aK9KeBKu14dvXVJA7bn8ZsAXn+kVf2u5R0fPbqUG/qV4s0sMf0kz8qxA8eZ
	 PvZ4ohLyolQqya0eWfLQWMdGPJ2rCyFvA4JA7785bW7YXrqUJZMJYhAlswApR6Xgxz
	 pWYG+Mv/WCfUg==
Date: Mon, 9 Mar 2026 22:43:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] ASoC: fsl_xcvr: add bitcount and timestamp
 controls
Message-ID: <6033818a-4a33-47ca-996d-343dd738da9a@sirena.org.uk>
References: <20260309083530.2977163-1-shengjiu.wang@nxp.com>
 <20260309083530.2977163-4-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bx38oB90IhNv6QVK"
Content-Disposition: inline
In-Reply-To: <20260309083530.2977163-4-shengjiu.wang@nxp.com>
X-Cookie: Nobody knows the trouble I've been.


--Bx38oB90IhNv6QVK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 04:35:30PM +0800, Shengjiu Wang wrote:
> The transmitter and receiver implement separate timestamp counters and
> bit counters. The bit counter increments at the end of each bit in a
> frame whenever the transmitter or receiver is enabled. The bit counter

The issues with the resets will apply here too.

--Bx38oB90IhNv6QVK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvTQcACgkQJNaLcl1U
h9Aa+gf+LS4vLmYbpcLR4JyVW23Bv5pW8NuxC9NGus3SH9+7Lbg0PqsUvPiKx0ug
ncbBwa2Q+4vOJQbYCTMei+kbbIJp0zxVzc6lwQlmoxeGOpeJxOcSCLt++jZ0xXqg
1CKU25jxQVE9AONmBM94RyIPnL2Q8pIV1OFVYP4pJW3Ldd1YoKZZFKC0KcqZdCBr
uvksmp5Wkh8CUwb1csHuLQuaCv9ISC0f1BYQUa5zPYRWHKqESeKgKUWwvH7GamhD
x6Y/pphhOOJGdsKJYs6trNaI4xpSyqZIGVX9TgL3zKrx4NhnVT05AQUJlNHXMtq6
2bmGIkrlbuBGJ5Hr0r8w+IN/5B8s3w==
=xpOe
-----END PGP SIGNATURE-----

--Bx38oB90IhNv6QVK--
