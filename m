Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0AE3845B7;
	Tue, 21 Apr 2026 17:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791503; cv=none; b=MHwT76f2WbACADPD7cQNHdRqa67XKio4hV5Z96qLU9WtgGvZYxdPiayiLzkJIotTq+0Sd5QsUIqtXwR23qklGgfSC4Ktz1oXVARzIPBE180AWppkSJU8ZMiFYGLQeXW0wDAEAnVH0XEmCUqKMzCIBaRCuYHJScjjvccXHxyCVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791503; c=relaxed/simple;
	bh=vok/sWJ8AOzEDKYmt8jHtz+Hdy1CE78jKXsvl6F/LfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPdbc5DwLdd5L+Ipfaz7h+BrjqqrI8UrFxTREdu9+TRTUvS7p2EwraU6c3Dfc6UxlRmNn9ssi3MQbFNXFDitqdHX1AqFwVPG+QWKG2gxRwpmF5YDG+QVgjDua+x4eNWQ853IXkHXSLm0ugfY5SIiW8RVpynBeR2fHqtZcJfJzNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+XIVBeU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+XIVBeU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66ABCC2BCB0;
	Tue, 21 Apr 2026 17:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776791503;
	bh=vok/sWJ8AOzEDKYmt8jHtz+Hdy1CE78jKXsvl6F/LfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c+XIVBeUmS8b4CKqWDqP1awp1k6fNjlPT4YzUfnPd/4h1645xEgSwJATWbYRXAaBM
	 XfMJdDqKYad0MyTvZRnGkbxyguTxs3JAP6vA1H8eC6R3CxxFMoiSfc8yYYFFhDurGK
	 DRRyUud9HURogtebWaE1sgehgRYUeO4do+Wq/RiegcF/9NHGK4SrpYgntTUUXCfwzF
	 B9bXe8v3+vxeByK1M2XuzQoLnaA7BIQt+7AQEOyX+TlGDdFrr2eLh5hvZf87NLGtM3
	 omgoS9sM1bZhm/tlYx0I1uU2pP+s/TxeDd8A10yc1fGZqt3/emHWyToyOLPgGU/aPo
	 XRoUOACo1WS9w==
Date: Tue, 21 Apr 2026 18:11:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH] ASoC: codecs: wcd937x: fix AUX PA sequencing and mixer
 controls
Message-ID: <89ccc6c9-525e-4878-a43f-f91c681969c3@sirena.org.uk>
References: <20260420180221.785113-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z88XJgBepUVyiYNf"
Content-Disposition: inline
In-Reply-To: <20260420180221.785113-1-ajay.nandam@oss.qualcomm.com>
X-Cookie: Jenkinson's Law:


--Z88XJgBepUVyiYNf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 11:32:21PM +0530, Ajay Kumar Nandam wrote:

> Enable AUX PA sequencing during AUX DAC DAPM events and keep the
> AUX-specific RX supplies enabled while the path is active.
>=20
> Add the missing AUX-related mixer controls, including CLSH PA and
> DSD left/right switches, so AUX playback can be routed from userspace.

> @@ -730,10 +736,23 @@ static int wcd937x_codec_enable_aux_pa(struct snd_s=
oc_dapm_widget *w,

>  	case SND_SOC_DAPM_PRE_PMD:
>  		disable_irq_nosync(wcd937x->aux_pdm_wd_int);
> +		snd_soc_component_update_bits(component,
> +					      WCD937X_ANA_RX_SUPPLIES,
> +					      BIT(6), 0x00);
> +		snd_soc_component_update_bits(component,
> +					      WCD937X_ANA_RX_SUPPLIES,
> +					      BIT(7), 0x00);
>  		break;
>  	case SND_SOC_DAPM_POST_PMD:
>  		usleep_range(2000, 2010);

It's a bit weird that the supplies are disabled in the _PRE_PMD
callback before DAPM disables the PGA, I'd have expected them after the
disable.

--Z88XJgBepUVyiYNf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnnr8kACgkQJNaLcl1U
h9BUcAf/f/3cEACS1zzesHBclsExi7XapFr0LFl5/JiBYtCQI5t1m0//ojBKr5nY
0AtnYejaxN2IFgJec0Nb9IpjkVicA4AByg5bJBek2u3p/67YCDmniaO+V9ucWndQ
AIqrhOsxKC97EUcx3dQ6a/gBaRYmXIPAMUbx2aoi7hl4Nv+H0f7fic/auetMVLdp
fYxiaMpaeDnl8uTe3VAXwvAasUBdxqISRaF8A80TVTpZPDy9Q2l0TvH3aCXJ0pEP
3r9+DLlbUzFa+E+qNRpWNDYYIQv+8O32VtD1qW08LxZzwmPgHAXOYFdCAzpHjfW8
SfHhA6UxXbRKjQSziRQYR4f8zfRoDA==
=2IO3
-----END PGP SIGNATURE-----

--Z88XJgBepUVyiYNf--
