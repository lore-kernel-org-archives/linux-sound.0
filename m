Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77212C236B;
	Tue, 18 Aug 2026 13:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058162; cv=none; b=eApQ1v46ByoBUGSR1LH2kDqxtlBTlPwmK/FzAW59xxXa0X2FmJ7b0Qkg9VDFGr5n74hxsHT7+n+KUVE+h8o8PigqprMtNpTI8dDJsl/rkryCEYFYrjfGhbbboLVzQWM20/uQMDVJgfySxZfoCv2Gk2z9SVvIKAPMl5I4fxt0BFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058162; c=relaxed/simple;
	bh=gsDG2ZEhTSKxotaTyIt79VItpmcCAw2qC1XbXBLPJIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMVkOyLdNTsqxLekKMb8Ypj6FBh96QVCNO5+8yWIr+GmKqbH8o4X88NVa79gtVaEXrCk3zpUiH/eUWA2c1Tl7ISXlE9dQgS5DWX8Flw0n4J4kNiZIxCSOdZRGRlE4N7XfEVk643wflYfS8C9XfwEpP74BdYVaiSp/Adu71EwvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Et+vmGFm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Et+vmGFm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B561F000E9;
	Tue, 18 Aug 2026 13:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787058161;
	bh=gsDG2ZEhTSKxotaTyIt79VItpmcCAw2qC1XbXBLPJIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Et+vmGFmE04RUDfQomb//6HmHxepNOdekuJlwiM7y64r8NaMM4cp2Ek/yDsGWkUrH
	 qSt0L9HFJbuhVzo4UUwFcTrbTqpdEft0VfdZDZ1tl9lFgtmB5EXV9I/gpWdXoHpZpB
	 xLlKmxHgEIX64JwWdZ68VloZe/mJAcjslplkVtKb8JjKIH9JYulrM50tFnIt7Y0vBX
	 HYstkJ0FL+ZrKlNP4RPGyDVVn36tOgzFrrfZiGqfMIOgl//3nDGoviz+Ifydp8i8gX
	 p74YQkDS3vNJEUIvvQVoa5n6lBiCqh+o5nDY6XJPI+hzIII1B/A9oCNl4IzH8C5gxa
	 9Srfx0OTGzIkQ==
Date: Tue, 18 Aug 2026 14:02:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: sound: qcom,q6dsp-lpass-ports:
 Rename QAIF clock IDs
Message-ID: <8d693df4-74e8-4b9f-8474-2f753195388f@sirena.org.uk>
References: <20260818084655.3240284-1-prasad.kumpatla@oss.qualcomm.com>
 <20260818084655.3240284-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eTKmSpxltYM/Byu9"
Content-Disposition: inline
In-Reply-To: <20260818084655.3240284-2-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: Smile!  You're on Candid Camera.


--eTKmSpxltYM/Byu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2026 at 02:16:52PM +0530, Prasad Kumpatla wrote:
> The QAIF clock IDs were introduced with a LAPSS prefix typo. Rename
> them to use the existing LPASS naming convention and update all
> corresponding in-tree users.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--eTKmSpxltYM/Byu9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEV+sACgkQJNaLcl1U
h9Arcgf/W7KMwn9JJn2+Fp+Bs8M15pQWARYvfICwaXU358K7gMa9c0V4CTmAIQU1
bFvakWmwnPxQeXzLAKCHE8mhQm9ncqiIOWd7MLE5lLLW5k3WG1FNQV6MocDdY4ft
WtPJDcjHavBWrZ0XOmz+tCQIAyR6Fd3nRveJinzdPtn2xkKvAfL1JDNN0TNQ/gqq
sD6vFuUI/RMHWZQby4p2/xDvVLEkct7DMh3d53C4LjEjqDNVCbyfGJ8xdumxvHJV
TF7sOvlRsytBV2dvDah8GkkH4aVjJWAhvf9UJ+w9J+UvY0Q+vHEiWyezCU5hX98M
+a0h7sCKsL1ZnEjzXjKKdI0jTqN7dA==
=zVTM
-----END PGP SIGNATURE-----

--eTKmSpxltYM/Byu9--
