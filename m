Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2324C3806AA
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772726286; cv=none; b=VhSwlPalh75FRYno4X09/jXZC52vjlpuHZLu3HA2mDXAtnOs6zurJmfMv0Ijqu5JMeJ4rigNglQaA0MADruTRjRW3GDNiw690wT9/F5rZir6pZKYqt2N37EqQlEjVAbXcIdxp+gd+wLzWE5dB+1Q5n2de64EmflDwnIl8mN/UwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772726286; c=relaxed/simple;
	bh=4KyTgNXCt2ss8gOgww45sYr6uDE3yH8xjmfMAM4oe5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VILga64wF+uMYIsADZ3oLIJ1yosXcCGpw64qVoxG38KQekTONjYQKxaJcUQ6pR159JiziTCWqB/1nByyAOiXemmutbeb6Dy4IoqCG3tEKM8/L2i9PpDrN8DwHi/MwmUf0EUKJB0i/IxO0JDgPdCnqzQRZUHLyMsZ2xC6xY5pjZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mDyMXzb/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mDyMXzb/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9C1C116C6;
	Thu,  5 Mar 2026 15:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772726285;
	bh=4KyTgNXCt2ss8gOgww45sYr6uDE3yH8xjmfMAM4oe5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mDyMXzb/T58zDXxPMp+VCOI+z/edNrWiPAX6SAicOt9w/kQERTIPVs+JbmamLCbLx
	 kf63aoe3EamXJGqc0r8tm3cDK/7flIZYFrPP4OfVa6ivdrxN7lid3s3uRQFrglRJ6N
	 lVMm+IEA5+DJpYReNK6bJtlmCW1Zfvm8r6sadwheONrNMb51cfPMuMv4q2ZFvz3C5x
	 1WfCV8FD4tAGNfbUoj6s4hFaJP+VovB9hIOi8e6ZACZO9o4iT560cnc1C8ZTVAOU6l
	 Vr+X8ZbfJ6zuC0RhRBh//3ISuBoKZWps4q9lQh2SYwRsmF8rcXu5VLBI0nUMS68dAE
	 IDXrG7HBySbLQ==
Date: Thu, 5 Mar 2026 15:58:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-component: add missing #ifdef CONFIG_DEBUG_FS
Message-ID: <6a7e4e17-312d-4863-b66a-2a78fcb3d243@sirena.org.uk>
References: <878qc64wh9.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ym31/96wKhhusWMn"
Content-Disposition: inline
In-Reply-To: <878qc64wh9.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Onward through the fog.


--Ym31/96wKhhusWMn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 05, 2026 at 06:32:51AM +0000, Kuninori Morimoto wrote:

> +#ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs_root;
>  	const char *debugfs_prefix;
> +#endif

It looks like this breaks the build for at least avs_component_probe()
and wm_adsp2_component_probe(), they don't have ifdefs (I didn't
actually try building).  ISTR we decided at some point that it was
cleaner to not have ifdefs in the users but perhaps that could use
revisiting.

--Ym31/96wKhhusWMn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpqAkACgkQJNaLcl1U
h9DNEAf+ORRmFkZ+s4qmoFo6wm/Nh9U+C+QOF+sqDFAm6SUTeUoCKhaXFT0ToHI/
FLEkVYqTmRg324pCR1yP6hDec1HzbcKWQTEq1x3VMb4UKOblmVN+tZoMTnaxd1rU
IGTN4mocVrRWut+R6KWAEXGKjonO2aqXs4Vbhy8nmo53qrl1SWfUW0ifg3OJA0fx
OAf4hzgICNR711fe9KMGi8PIsHd5YiRlDWcv29WubD7du5yl2+5QJx+JlafyNMGw
1rdjydJTF8hArpUEnVCh8zOkvSAOyghJeZSCxzBbJ4DPTkJOYHjyZtOrXTJLSDw5
u1DJgd6XsInj5x1KabyZqzVtVGzIsA==
=r1xp
-----END PGP SIGNATURE-----

--Ym31/96wKhhusWMn--
