Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A21E0B86;
	Wed, 18 Feb 2026 17:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771435146; cv=none; b=rpsOKJooBdYuJeR87iLAddqSkBnagve6syNWUTQagjkh/HeuB/1vi/3sh/xoerOFfDYl9hLD7qd3P1KEh54OrczSTtSdMnd7tXCXoEiWrAAO5D7NhSgL/2AJeqAQkTzQwWlH6GaxS9FbXODiGwQB36X4FA6bdf/LVTpOCN21QOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771435146; c=relaxed/simple;
	bh=S0fTBAhDNi30ZiveNSC2Lpo/JAJCaVSZ9YnuZFTHPKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCSB0sfUqD/zlEEuicuKU+pHohRsNVpXTfgyaB7CPP+TutceMW1QySZh5+B1I8tzm+K89sesMMaoXYJLsvGVthMlLNJMKKCXRPJhcEtqi1f//dhpqog50Hz0VyEfNlbZLVr56C+h96qKUkotXq8sXKNeutGTK2s+77n7NGTdOro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7dSoJuC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7dSoJuC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFC2C116D0;
	Wed, 18 Feb 2026 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771435146;
	bh=S0fTBAhDNi30ZiveNSC2Lpo/JAJCaVSZ9YnuZFTHPKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7dSoJuCxUkPsEncIh897UzPAaTgj1+/9sw+f0UWptWSgk2VGG7CKRoBIvbcWGyWR
	 RgZXi4zzsS/ytujZ5iR3gnuqAs1ekYEwh64va5fkV5WsRDI7kuZ+IP5UaPGZ8xET1j
	 rAGEpkWa7u6BV2BorFFU+tZwo8gnXAlPqDyTCIBS/h8nuCtcoBu6ClKsyp4+ltD5NS
	 O576T1IM+yb+llkuJxPj7m6l9wcavmru99wUA915+y7mgtkuwzKFf05jY7k5M787br
	 JsqJHARQmpyOzf1wOZ0jVgkkVdb/5232cl7yP13Fhmv9+PnSE0j54YXmru0a7+uA+Z
	 ReXM9Y9SjjxqQ==
Date: Wed, 18 Feb 2026 17:19:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Message-ID: <e8e910a4-9aef-4bc3-be74-b4f5bea34b74@sirena.org.uk>
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
 <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
 <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
 <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
 <86644ac4-6ffd-48c6-a79d-8e8144f18e2e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ClagwaMKz6Owmro"
Content-Disposition: inline
In-Reply-To: <86644ac4-6ffd-48c6-a79d-8e8144f18e2e@collabora.com>
X-Cookie: Avoid contact with eyes.


--/ClagwaMKz6Owmro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 12:17:04PM -0500, Detlev Casanova wrote:
> On 2/18/26 12:10, Mark Brown wrote:

> > I did have the revert queued, but a fix would be even better if the
> > patch could be sent?

> A fix will follow a bit later today, then.

Fantastic!

--/ClagwaMKz6Owmro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmV9IMACgkQJNaLcl1U
h9A7gwf/RtuvltR1mZBShBgbGCsz9B2aFV+qgtr2HIqmXkCpAZpdxP+2Ap7NYtiL
JXLLlTWhfLTpXTLqgtd72JAygDIk7qosUlpO7Jhq5Lw9gb7LKjoVRXah6kKVbkXk
ichk8Co/qpwWOzmZDCAMufb4QoAeqh12oJgYq/80/f4rHdEVAlWpuW6cNSHtQ1am
MViCp5PxhfSdRJl9hFGCppL0XcWSSS1cmp9EwR0PxI9OCDb6G5lr9K21Ew7MtCxr
cFFjGW0zNFrnE+fNyduMukolN83waE+jXM14g10IMcPhcOOV7wcJm/cLvnmbU7eZ
twjYnbmQ3+M9RVvkt465azbx83WnWw==
=XIQV
-----END PGP SIGNATURE-----

--/ClagwaMKz6Owmro--
