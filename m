Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8997F3BF681;
	Tue, 17 Mar 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773749999; cv=none; b=E1Z5Yv3BDj778F1fkBkBNZsErdahR3q1U74Kb/Fcy5elxdoE9fMGHwH2fXoXQrNJ+yBwRZqbv0OMJov5Bq1WDAaxb/AG0CgPoNW/lN3mGypSAoTBbMVNL2w4p6CLFokZb45ba6Af23ws0FzHMtgzlkpyMMszbQJ0i28d/qIcAFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773749999; c=relaxed/simple;
	bh=LkVtMzQ8iwPMCCFFu6AX2GHaJLGRANe1jKQRznyYI6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPY1cJEnano6meHJBGe2Gld/HnZJ5VhwaGZKjhuMJkUdnjxCH9QgdpwswzPNbxZFYBt/kVfHx9U8EUW7bjdxYeF66E53h/NfQ2nC9HRpL8cKRL36pki2xqrzsnmLxrJlcUUZk35EzQdxF183+r9exnryKTGpcVmjh2gaXkParaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbxaE3Hx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbxaE3Hx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2BAC4CEF7;
	Tue, 17 Mar 2026 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773749999;
	bh=LkVtMzQ8iwPMCCFFu6AX2GHaJLGRANe1jKQRznyYI6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VbxaE3HxAtENyW3Yfmxs7SV4PM6sQ/iodDqLj139Us8RUXa0fBtRxmZo1ZEHopsaE
	 AFOU3h6DU9uen8+KhpS5Sqd8jOlLISSwemqyXDXYsmMQ4fSFXQtMXoup9CAiJkR1IC
	 SdHfu/6f+d6skDH1pdUVME2iocvL8/XZ9KcJ/s8YiV6kjIyji3eEQVfSDoSNozkRrQ
	 W2bP1X0pHSW2XRzOI/eLIGYAPcl0vELCBIzrWyH3BA0qI+lxHMblMF2pECbxcjnqlB
	 iLPtRL8zJSXXzou6LLb6OVO2Y0N0yKRia/tKBqacOOuAR5sZO3TkPflaxUc1gAoNZF
	 xkXYmFasbVXYg==
Date: Tue, 17 Mar 2026 12:19:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Joseph Salisbury <joseph.salisbury@oracle.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [External] : [PATCH] ASoC: fsl_easrc: fix comment typo
Message-ID: <a05120a1-650f-481a-a1dd-4dced984f2f1@sirena.org.uk>
References: <20260316180545.144032-1-joseph.salisbury@oracle.com>
 <a61b8ef0-32c1-4d1a-9ab4-ceb6d5f004bd@oracle.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xkNM2tTQgD+DOtei"
Content-Disposition: inline
In-Reply-To: <a61b8ef0-32c1-4d1a-9ab4-ceb6d5f004bd@oracle.com>
X-Cookie: Must be over 18.


--xkNM2tTQgD+DOtei
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 07:50:57PM -0400, Joseph Salisbury wrote:
> On 3/16/26 2:05 PM, Joseph Salisbury wrote:

> > Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> > Cc: stable@vger.kernel.org

> I inadvertently added Fixes: and Cc: stable tags.=A0 If possible, please
> remove them as they are not appropriate for fixes to misspellings in code
> comments.=A0 If it's not possible to remove them, I can send a v2.

Oops, yes.  Sorry, but I already applied this and there's a merge on top
of it.  It'll not do too much harm, worst case the patch gets
backported and does no harm.

--xkNM2tTQgD+DOtei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5RuUACgkQJNaLcl1U
h9AfQgf/VAaRj6I5VjU+iAt5wOu/imM4dGay/S99ALt8Ewn35FjMynEZj9SKWZNs
kIcAw34uZtovKJv7ZavcyDhDKrqAgfVc3qxlN9oy7avAoXg7scYIJfH9AQ8B2VF3
aoPQSnYh1uM6+nfFqETH1ZdnGk+RTbGT0J3F8yLpEVt1asVUR4JYYr+T5GT67aOV
C4EYB6HQC76pQMoNzLl2OaMcE69pSfbxar1w7KbUac1F3q2eoHk7F/X/bWgoxgMx
fHesfDmZd+FjpVBmmsosuuoliT3Q9UgE6jDNGDByALRY3iL4WKEg15fG5xo8Hbzg
SWxCEa9Zj+6jHLYpsqh2hAU0Q9hz0w==
=GG/p
-----END PGP SIGNATURE-----

--xkNM2tTQgD+DOtei--
