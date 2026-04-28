Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF363632;
	Tue, 28 Apr 2026 00:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777334618; cv=none; b=tfMGaTPMbxjl5st+BL56tYuAkuN0l+TY3Goax8GDhAw7KhIhO9rAFMg9UjfMWS32b8Gk40S265XG+UVYzxZ7W23wr33w/6+ZRecaxYbmOcB5at/xzRxBFbuv2tQ4poyZfGig4PEA9VIuC+a67XoAY+lSXh3m8tdcIuqBODF1Xto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777334618; c=relaxed/simple;
	bh=0G3cY9+QoVi+y66aACVzBlA6PBzJflYxXbcqSgEySDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rviezwal4vcHDifAT9ksneG+RY8UnHuHzMw9BZi3uN+EPw8ZXh1rv/W1U6Axhv2Hyb1Ty2B9eSz2MMpwXaw6pUb0WQbbKUjdPTmGF7v4oNtnzhlQUOtr4FPPfE85JmXqC8S6gm2g4rc6/7k61Q/udeljUJXepzxjtzL6ZyabYzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rLBZeRGj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rLBZeRGj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C9AC19425;
	Tue, 28 Apr 2026 00:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777334617;
	bh=0G3cY9+QoVi+y66aACVzBlA6PBzJflYxXbcqSgEySDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLBZeRGjJwSnu/cLHDptoiog8uJx19AGelSWpt+25FmA18X9K6FvZ4LBtgDjd3zMi
	 IyAOn+ULLBA1/BvsxEY6dGDGVQ6txE/ERh5zzRZZ8a4Hd5of+sT2a0JxeTXxKDsBQ7
	 3RQuWQRiWxCChyFFr97i6K4fBBXSV27RHsGlUmStTLbneRgD60+gUwMYJDmeyS2srh
	 yj/HbzswIWMWpXCLKAKCafDOYFsjdfV78KAtIDNY1ljK8xepp+Ndeiw5SiofuGEicR
	 jtlho+gT1YacFMg33C3bkmbhXjYej53MX0nPjZXHf8TGqvJ3I2yXtoQWXC4O7AO/5Y
	 nI+8+K8eW/Kvw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 7D5941AC583E; Tue, 28 Apr 2026 01:03:34 +0100 (BST)
Date: Tue, 28 Apr 2026 09:03:34 +0900
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, Li Jian <lazycat-xiao@foxmail.com>,
	lgirdwood@gmail.com, loongarch@vger.kernel.org,
	zhoubinbin@loongson.cn, jeffbai@aosc.io, stable@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alexandru Ardelean <aardelean@deviqon.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] ASoC: ES8389: convert to devm_clk_get_optional() to get
 clock
Message-ID: <ae_5Vll_d6f9iaBK@sirena.co.uk>
References: <tencent_7C78374FB9F4B3A37101E5C719715D8BC40A@qq.com>
 <177724622731.266775.3161558352144649934.b4-ty@b4>
 <ae-VofUzVa_ladMh@monoceros>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DdiOM3TZikU5MfZD"
Content-Disposition: inline
In-Reply-To: <ae-VofUzVa_ladMh@monoceros>
X-Cookie: Victory uber allies!


--DdiOM3TZikU5MfZD
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 07:00:59PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Apr 27, 2026 at 08:30:27AM +0900, Mark Brown wrote:

> > [1/1] ASoC: ES8389: convert to devm_clk_get_optional() to get clock
> >       https://git.kernel.org/broonie/sound/c/8ed331113107

> I see you dropped the Fixes: line, but I still think the commit log is
> wrongly blaming abae8e57e49a. Unless I'm missing something, abae8e57e49a
> didn't change behaviour of devm_clk_get() or devm_clk_get_optional(), so
> "since commit abae8e57e49a ("clk: generalize devm_clk_get() a bit"),
> devm_clk_get() would return an error pointer when a clock source was not
> detected (instead of falling back to a static clock)," is wrong.

Yes, the changelog's description is likely wrong about the behaviour
changing here.

--DdiOM3TZikU5MfZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnv+VUACgkQJNaLcl1U
h9BJIAf/ZKMTMN1R4+5sUm/GY1qDz2F9nPXTEqRDGMJCiWcj2ZyEwOZNhAjx4Sgd
8QewZo1A5pycfZqrZdB9CyYF5QRoAZTE4nX7crqnvgYJ+TH3u1poHyUWUTAiS0oR
sQ5cT6xYamQ+X2a7CIRAng1YlQsqDGgBB4MyXU9LXGlu0YXi9ipGealKrwlY8Mey
IRnuZS083AUmxU379X7BJNbE0r6n6o1uEqKrbSk6HiYWA7TXVGhVCIIKskewu+0Y
BfaL3p1XOoraEs5ZQioNsZLiUIPJuGE4xMpKVw25d1KfNXsxuPfkTPr8lqE67Qj/
+R0YaSaflkFgEA9Kmzfp7Y9iuo4hJQ==
=YWLB
-----END PGP SIGNATURE-----

--DdiOM3TZikU5MfZD--
