Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913963;
	b=F4gxaWJ84L42ZOpw+Sd3kRiZ3oxzk5mEudHkW0Ht7SRW+vro4DlltFhShkAlaJ1D9ZKz
	 NYcFIcOb87C0/R9rfsPewDSzk/AdivTeRrOYXVZ1S6b57bCJ9fwrr8gKItMgluYICQl8W
	 nWpjUL1287dvDb5sCxf9vV5YELwKRjIh9sLIgL763pOgtHLS9+kG8e9xMkAZdHjgdxC2h
	 Q4t+cvWuFLoba5ZoZ8E5ZFNoXNpfLlAdNWhfsNoQ1YH9WllubHA/UoAeEOl8JpUqYxSFB
	 xRCMTdHlb4Ng2GzS2/ulKYaUrZSW0rp+UTsGJlizTvRIIZz69CIaQs2IQZVyFN7fjVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913963;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=f15GGLfZRSW/97hfdU6TL9nh7Hr+uNTJeX5nSmQWx70=;
	b=U6aXCpW3VVIxVMH6o95wTavwZRQDQR0kNxvmLifX7jrsW3z+CrNc5g5GlJ1BBAzxEyu6
	 QpuXoFPWbsB+olMh1mN+c6c3cg3KWBCaqTG2N2p0H+NhQxCiDt5SP0GgsysWVKcSiPoUz
	 Phm+Y42T+tAXXZ9zQAzhpd0mV9WKMprW6lgtppbwdTqXpuUyieFaGeL7+0+E40aNJEB8s
	 nWzV/X73e0YMutY37rPVT8FKgItgmqPkffkrYEjukSY056/DkosnqE08N1hFnlOYcpneP
	 fOL+iB5Pkm6c/F4fGRFUEX6Zito821IxYQuUndtKNGzsf/n++Zm0RHvp0QmQ4C7xtlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m05msBSb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4235606A332
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m05msBSb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7421F000C5;
	Tue, 17 Nov 2026 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913962;
	bh=f15GGLfZRSW/97hfdU6TL9nh7Hr+uNTJeX5nSmQWx70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m05msBSblCkHa6V4w78YFA0jOpiwjfHTXFAbXZrs1OWhXpKjfBlcAi2IuyG5ZicTP
	 opVuuQn79A4Dg7US+DMGgukzFlGvd3mVtd8sfcEizj3HRPmDkOwj7NigT2RxY+WuUj
	 qCM26jUr0ksHWu365JaU+j07WtUweuJsaDy0yEFEdFUOQmTXY34IOfenWREIQXBlw1
	 uvmneM1syTQIHvGFgWi9TX8g4Sf4MF1J2+hh4kVwitd92ncdtwwWx827/7alLIZGum
	 o5o4tPexp/AWwxhY5N3rEUrJTRG4zBT4t8GQ0ocmZ17Foaj6Lmle7n3yoYjWqEWTYn
	 4Z5DUnab82ZbQ==
Date: Tue, 17 Nov 2026 11:12:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Qianghua Wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, bo.liu@senarytech.com
Subject: Re: [PATCH v3] ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC
 function
Message-ID: <fc54214c-8f3b-461d-98b3-bf92c3aad213@sirena.org.uk>
References: <20261117013558.1790310-1-qianghua.wang@senarytech.com>
 <20261117060213.2327503-1-qianghua.wang@senarytech.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6fd5LgHkuP8j+e5/"
Content-Disposition: inline
In-Reply-To: <20261117060213.2327503-1-qianghua.wang@senarytech.com>
X-Cookie: Marriage, n.:


--6fd5LgHkuP8j+e5/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2026 at 02:02:13PM +0800, Qianghua Wang wrote:
> Some OEM platforms, such as certain Samsung designs, use Senary SN624x
> for headset jack and speaker playback only: ACPI _DSD DisCo describes
> jack and speaker amp SDCA functions but omits the MIC array function
> because no on-board DMIC is routed to the codec. The driver still
> advertised the DMIC capture port and ran DMIC function init against
> registers that DisCo does not expose, which breaks bring-up on these
> machines.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--6fd5LgHkuP8j+e5/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8NqUACgkQJNaLcl1U
h9DN6gf/cs9YmLb+1sVMCufSbTMn0qmS9yKEtQsjhWaABzMiVV63CdLY2azQ8BCy
+CQuW9xBh1XcsJr9/tH6GaprUX1jmpOvtoejCiKPRO4I3PWIVXs3O0mAyeg6yH8U
fbzyG/ieyNZq/78zJzcEaYAIf5EnrdxkEXQZ1YAvUMySJLFQ60vruKjvogNUhcic
l/J4J3jmAEzOKTU612DgsEh5fRImyGXV+Oj1ZxVjRYQWFzfpoZUul1L1QKS7pLQB
eWjCBp+O+DBS3N/mbWwWyx6lX7Mqp6uIQ3Xa0Y3fRgkDH+TnIfuvBMWpb8qreO2t
0pX0S1E9Etaotg3Lw50oZUv0B/EgTg==
=8x8N
-----END PGP SIGNATURE-----

--6fd5LgHkuP8j+e5/--
