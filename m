Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA593D2FE9
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135531; cv=none; b=PD2HX2I8ooVmVZ5e03TlYOmfjpBT76MQFKuQ0OSK/F+RdF7DiKhePMSKdKDrisSZ4c3cH0/sgaq2UvKbNYkgeFGPwGTIJ/Rouk9d+sIoPn1eJ53nsQVlUmroffzudntIReErcD+Hpay6LmfOub4919uS1gxl/57yLcRQbtBUzxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135531; c=relaxed/simple;
	bh=5MEElMHNVyepRPmthba77lN3iQPXGJPH1i/1VFlIz/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkacfaF79h3o0p+TdfgVFLAXfmKGSrfsQWbXJob6qt7X7CZWdOsS7+TSblDpqAjpLOFsIHB061xppXwCdKhCRarAdlFYup+ObVHKA6Oe+PJsFXXeduJx228lC3nmZoiaxveMRLM58qi6ybM85LyNx2WFgJoT8eQEch+0Gis2hxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RK6B4FEJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RK6B4FEJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B12C2BC86;
	Tue,  3 Feb 2026 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770135531;
	bh=5MEElMHNVyepRPmthba77lN3iQPXGJPH1i/1VFlIz/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RK6B4FEJNSEst6zu1ZWVsKV//ekQBhnl6OJU/xMDRJ7gx9Mjqy9OthbTJe/yhLayS
	 qyPapq/QLhfOVu2l5cMUg4uc+R0yjC3ejXU1OhrSvpjAqpOixXs5MXUnc1alNX623F
	 hPr05rcQYWMR7QHniz+f285XA+5UWp2tNjWQM7+byf5/JhqRkF7stA4DRoXDsMqR4n
	 vhoBP1FDecmbF/Z+ESnKfvZ90uUPP9QC257JcDIQUrR+40WEHiE7cWaCCx+29+XnE4
	 sVUY/hSxHVqRjgB35ZfjXjC+L0whovUyWeNdxXlBQrghEKkLsZpdvquDXlssmDMQv9
	 DF+Kd4voaGRoA==
Date: Tue, 3 Feb 2026 16:18:47 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linux-ALSA <linux-sound@vger.kernel.org>,
	Lars-Peter <lars@metafoo.de>
Subject: Re: ASoC: soc-pcm2.c ?
Message-ID: <f9cfdd9c-3299-4231-8d1f-d014da49700f@sirena.org.uk>
References: <87pl6wub81.wl-kuninori.morimoto.gx@renesas.com>
 <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qlrVGCV1u5SlOwfT"
Content-Disposition: inline
In-Reply-To: <5bf2a9bc-6b38-4d75-9f97-be9b65b09d21@linux.intel.com>
X-Cookie: Do you know Montana?


--qlrVGCV1u5SlOwfT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 09:45:50AM +0200, P=E9ter Ujfalusi wrote:
> On 26/01/2026 08:41, Kuninori Morimoto wrote:

> > For me, current DPCM looks like forcefully expanded functionality.
> > I think support modern Sound HW on current DPCM is not impossible, but
> > unique implementation is required on each vendor driver side.

> I'm not sure what you mean by this, but since there are several codec
> vendors and they produce different codecs, they do need to have
> different drivers. Some needs more complex, some simpler and DAPM
> provides the functionality for the developers to not care about the
> things that are generic (sequencing, path finding, register/bit flips, et=
c).

AIUI the issue referred to there is on the SoC side - DPCM doesn't
support SoC drivers as much as CODEC drivers due to the lack of
framework features for dealing with digital parameters.

> I'm not sure if I read this right, but the proposal is to create a
> parallel and incompatible susbsystem?
> How would existing codec drivers be used in there?
> The promise of ASoC is that an OEM could pick any SoC and wire it up
> with any codec and that will 'just work'.

AIUI the idea is to only rework the SoC side.

> > If I create soc-pcm2.c, I will create sample CPU driver and its sample =
DTSI
> > file, like ${LINUX}/sound/sbboc/generic/audio-graph-card2-custom-sample=
1.dtsi.
> > People can easily try/test it by just including it in your DTSI file.
> > No HW / no implementation is needed for testing. And I think it can be =
good
> > sample code to create new CPU driver ?

> We use ASoC on non OF machines as well, I understand that the current
> users will not be affected, but having a parallel ecosystem sounds a bit
> scary proposal for ASoC to move forward?

We'd have to work out some way to flip the switch for ACPI systems at
some point, I guess there it'd be either a command line parameter or a
build option (which we'd probably end up with at some point for DT
systems once things are more ready).

--qlrVGCV1u5SlOwfT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCH+YACgkQJNaLcl1U
h9AM+Af/YkTbpgN6EDJby3Ggv87TWJo3gdD8nCNt2bfBtcrqOhyNKH2SSjUKRQfU
FgWOYwqtzV7zJ9jYsWU6Or6JvUNuIx5GsjRTYgFN/A500XzTG387OdazgEC4EpET
w+lGR11ILZqQUawwbbLqkKra//15x9UEJzuUTZcqZ+eO70sb/sP78tiW0ZyBFSNo
YofmSAFeHLGQCcpllJTUiB0W4ypOxGSlpT8rhmf2G2v1VJkWrrJBBNJtOqm3i+fQ
iVJeFp/LUFuJ0F8gdrwQgDw/2Ec5/K5rrTa9fSBQhtDhF70IXlspNGSh0AkJl1u9
6KyhIjS1QhBQcLpJnqeSYbgMUEt5pQ==
=BJRu
-----END PGP SIGNATURE-----

--qlrVGCV1u5SlOwfT--
