Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814B62DA759;
	Thu, 12 Mar 2026 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320818; cv=none; b=F0/lGi6vo5Sak3h3mZJx/rtUeM6RvQ0Bnho0dq6ycic8fmZu3ijG+K3eizl5e3gG1zYq6BvMlyz8h9sriH7yzmCVkms2YuWZwD9YxaRFpJa9qdb71J6ctPolYdSLNx9EVOrvu48kd5VH7mRIRmADMuZnUkpBdngjJuWxL5oooHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320818; c=relaxed/simple;
	bh=kTKj9LmmkN5S/R4Zl+K8p9K3P8nbhQOHk6afE5kOSRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKuLITFTxY79So5dp9wEReQObamTin2giBVv8UWyX52OguJ/1WavrnPpYmKRqP3rxGGY9b1dDHtHForK3q/wkOLFCewggYVnamrramjE9RqEYr6nG6ONeAq2BlFkUkfdVvODZWM5criCF3rE/ZmWlrfPjFj3yCCzi2UEXQz+ieU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqQDlaZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqQDlaZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E86C4CEF7;
	Thu, 12 Mar 2026 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773320818;
	bh=kTKj9LmmkN5S/R4Zl+K8p9K3P8nbhQOHk6afE5kOSRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqQDlaZROCLkeKEvVpMD3KcdkKzBqpUUcAdu7EOQlp4hFSJhGgsu+ejbEbLi8Sgnk
	 7bOFcqY4ghrZt47DTmmPSrSVie5qayeGlSp/8Vn+rUaJvWuae19/1ZC1u94r34uzgM
	 3Ft9Ub1ipXJKvZkqKKPQ+B64DWuSufHxDfsFmPUI7llltEdllktFGmON17JRQ5dTZ2
	 CYTvEVunN/hpTYWfVHbf3WN26JC9Qgkr8EPp9Nwj8dBcesZaYQ+eArSpxbs79cqh/m
	 u6BqG+LefQdtXujXon1z0x4OKCQM8c9WjuPyKCf3TgBnXJMpBK3HzD+y2fXvknDxr2
	 8IAIVHYwuOgcg==
Date: Thu, 12 Mar 2026 13:06:53 +0000
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: hasunpark@gmail.com, linux-sound@vger.kernel.org,
	venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Gong, Richard" <Richard.Gong@amd.com>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
Message-ID: <7790d1b9-5152-495e-85f2-3b1068435d13@sirena.org.uk>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
 <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
 <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
 <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nUHNMtupIoSb+hOO"
Content-Disposition: inline
In-Reply-To: <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
X-Cookie: I feel better about world problems now!


--nUHNMtupIoSb+hOO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 12:19:48PM +0530, Mukunda,Vijendar wrote:

> We have cross-checked hw configuration. This platform uses DMIC connected
> to Soundwire codec(ALC721). This patch should be dropped.

Thanks for duble checking.  I already sent my PR for this -rc, I'll take
the other two patches once -rc4 is out all being well.

--nUHNMtupIoSb+hOO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyumwACgkQJNaLcl1U
h9C+cAf8Dge9gsv4lm9yNTi+W662/yQpmwA3+GGW57SLldanI7BmKHJE5L5PNJ9W
51xu/IU01dU8S39VL2fjgnXAlCA8gYi5ec3OQZhpebQAiydxeTZukxvA+ze8HLGM
48+nWknf+4XND5oEC6Aeq0p1WfnvBhn60hoSPskVTRar0qV9zcB5ZEMg94wdhsRQ
Q9xRW/S72VypxhPhjyj56bjHaCBzmZfL/jiB8gQQmtssEFJN1SJ7Oc/6SfUGW0N5
Vk9SdeNO5IDYDn0Bz0awEvubWqAIpROtObQDBDlE/V0O1VyqL1/3/v63VU0kLdZs
uAx+C3+6Sl/vEj4R3pVK4E95MXHMSA==
=ITNw
-----END PGP SIGNATURE-----

--nUHNMtupIoSb+hOO--
