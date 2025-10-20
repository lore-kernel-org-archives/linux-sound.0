Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B52E320380
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969253; cv=none; b=tyuWfSDcJR9xyc3JYUcCLaLSdSXD/RHyiHgPuXEj8fahDQSUiXYANPHUj7LIgkV3WyMVueLEmo+9lyD7+d5dYfa4h/09XnGt9yLkfcDzfZsecidRayoLyWLqDeyYf1iEodr8Y+1OwkObgWgjDMz7/SwBnjLwAe5uin8sJ9PIlIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969253; c=relaxed/simple;
	bh=QIpDfyGC1nh1KlU0RFtaAX3nsb1S7WWRPc2Tr7E/zcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqiqdwgJ7q5vff6Ld5NUeot/rBb3+5H9HwwkAqRL9qsG2KbanaFeJa5BYFf2shpy+akO3z4N22GgXRt0PWRXsyR+ZF+jo1r9pdnKUFvZnP6hw3pKtpRWjnbI/BcPOy4hb3+IN/Vs04FDC6GsbfWxlyj2XYVIVVtdaWEM3TfVX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9VV1qCD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9VV1qCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18587C113D0;
	Mon, 20 Oct 2025 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760969253;
	bh=QIpDfyGC1nh1KlU0RFtaAX3nsb1S7WWRPc2Tr7E/zcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9VV1qCDwOAo0AeGwGBvq5tib7oKoHR3NDUjbb/6B2dSQzM1Ap+ZDpsZXjYhcfwaz
	 RnxbrKE2+cFGo9wacSmSnh91aOyPRT5dR5U8nkIDrcSRHP6PMf36THVJ7HjfeTVzWz
	 f/8uUXCh51vRh5UVKqkCRqBXoUP2tsEJVR/XHozb8F+gapR4gkiILPsdnZp5wx3woq
	 SIbrFrqLpngrD/V5u9iYpITOHITmVkvqmJp0GhQs+yRYMg3ar1IwaKmNKN1onFEyJC
	 EAKyfnGuO65ZyGCFP1nrRIjbdtJ7YfjtgO8xsw5dq//edB2+qVRFuXxBbjKKlOnf0M
	 WRlgDQzBWGvjw==
Date: Mon, 20 Oct 2025 15:07:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH 2/2] ASOC: max98090/91: fix for filter configuration:
 AHPF removed DMIC2_HPF added
Message-ID: <f56e2e09-e679-4356-900b-194442bc7020@sirena.org.uk>
References: <20251016151152.1107083-1-sharq0406@gmail.com>
 <CANgPUHzqyMQCyJgTxzkMStGsYymEX-Vj_ZjqLDuL_2ZdShG5Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ygFsjWU3B+73UAIR"
Content-Disposition: inline
In-Reply-To: <CANgPUHzqyMQCyJgTxzkMStGsYymEX-Vj_ZjqLDuL_2ZdShG5Mg@mail.gmail.com>
X-Cookie: I doubt, therefore I might be.


--ygFsjWU3B+73UAIR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 04:04:25PM +0200, Sharique Mohammad wrote:
> Hi Mark, I was just concerned, is this patch ok? or is there something th=
at
> you found not correct?
> Actually, I did not receive any response from you. So, just thought of
> reaching out to you.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--ygFsjWU3B+73UAIR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj2QiAACgkQJNaLcl1U
h9Bf3Af7Bd3cmiG8eLktTNdnD2hgVaaGEfdker6yQTCi/TP/UVQUtQYaDbHYvOhK
A1gHZD2wS8E0f2Gz8JDf7RhbdTUSeCFkXV8gDV8IsQFkORwmKhKApaqIcbz1Apn3
R2vK9i+V8xEAPzw7PpLMOAfE3ZLFgySNLzSrWbgw8ukUQQ6Pw/5oPnmEo6by7ytr
BHyHEN1opJiuadGFysWTU8WDZBkWWg4P3gY2G/BiaFydz6dUsm7oQScv9zi8p8Ur
8gnt86rMyBrueHC9y24gAwAMQYc3FoteZVr5GEqlM4AdabMSGNikZuyljr+MjEtD
ATX0Df09D54aOWL+PTBBENz2hdky8A==
=uY00
-----END PGP SIGNATURE-----

--ygFsjWU3B+73UAIR--
