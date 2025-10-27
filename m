Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C71E0B9C
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761569103; cv=none; b=hGfhcB2gClGC2scJB+8ccSuDWMkDI07uR6n/jRQdwHWxceBz8Gq3/c1LtL3sAAPrhdm1KYu3zWreqLZ7j47dopB7Ja0qv6cSeANPOxMIJ1eLA7+e352b8pmfszU/6r4EIgWIxkcUNvTeGTPaltOafMYgsWhl7iHq/M36RBu0u/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761569103; c=relaxed/simple;
	bh=85jCbwnzGCDlwU9YqbynkDe2Q4z5sTolo50JN/pGGFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbgHY8CXzNEps3x/gEYySzJ/zjZRESz/0/65zZjsPMnHFfQN4zgzLiH011daWCF18+l7o4JwpWyCkdeeQ5WBnqekJYbe6S7jO41t/WVvQTAG3Zfd9azt2TMwrKz+Zp1FOQux0iTIpBTnRqH+Ye/dGCMwRKYD805vj5oBp+q59S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPqRMsTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPqRMsTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EF4C4CEF1;
	Mon, 27 Oct 2025 12:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761569103;
	bh=85jCbwnzGCDlwU9YqbynkDe2Q4z5sTolo50JN/pGGFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPqRMsTpACkwsuOL2QQ3WIxtBPrZYfBYH2ptCtifgHDeQWb/5wQqo2qp/vkNaZXX8
	 tkyo0o/jOjmXjO1DralK8cGQABht6a/80O2UPIJcOSf20ukL3aOCZfE+/5l37v4acN
	 PJFcyvp67LyKyUqHMvjVk3o+R5X3C/1lfNXYpmpLQcoZIJtnYch1TjBB9qqGOC2oig
	 iIRSwiBt2012LyYpPE2i0eaO7KhoZkQe4t5OWh+g1jrgHf/KYBvSjop97pIahxXtD3
	 xrQFLOCtvBzJZPVe17FEz0Bv7lJqO0/dkVVh+DAB2yA7RTExCRiikMT9776VvJFi7E
	 w2wQYP3LGXgog==
Date: Mon, 27 Oct 2025 12:44:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeusz.slawinski@gmail.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ASoC: Intel: avs: Set of streaming fixes
Message-ID: <37a7a6a1-6180-489d-9309-2d576822b4e2@sirena.org.uk>
References: <20251027110106.3157415-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ne/xisewM/VKZS0n"
Content-Disposition: inline
In-Reply-To: <20251027110106.3157415-1-cezary.rojewski@intel.com>
X-Cookie: How do I get HOME?


--ne/xisewM/VKZS0n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 12:01:03PM +0100, Cezary Rojewski wrote:
> Small set of patches two of which fix problems observed during shutdown
> and XRUN scenarios for PCM streaming. These ensure HDAudio HOST stream
> is reset and re-setup during XRUNs and synchronize avs_dai_fe_shutdown()
> and period-elapsed work (thread) so that no slab-use-after-free panics
> occur.

Sorry, this had already made it to the end of my CI pipeline before you
resent - could you send an incremental patch please?

--ne/xisewM/VKZS0n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj/aUoACgkQJNaLcl1U
h9CaHgf7BIuUqo/q8PdfMcRtVAyemd9lL8Vi83kNn8yJLPQl2UrlDm56m9aWZY6G
3C1yrg7gT14qdcGch8cU9KVw7b8qVQzb6XVksLmQClE5tUy+feg9JdTZ+33Xx/Xt
s8Hq1fp1m955SaMmnbv9uayJRdEJMEUm4BGyJYRZv9x0fl+5wapTUaAMbTdf9f9M
hxGKl3IKGzAIoStwBTmtEFBeBv675y+8P+sHUHOsQ7XIszQ4yErvCz4kQMgg6zkd
ZQugMLJUJFQ25iXKhg06NG9s7Q0tEBK7Nno5tAilka9zauxmmMkJyrSTO6RvNNh+
uPzLpsF2o27DGpa8WbT8q9GKTIVMmg==
=q9Fm
-----END PGP SIGNATURE-----

--ne/xisewM/VKZS0n--
