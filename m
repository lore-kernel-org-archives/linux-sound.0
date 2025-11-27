Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B6C23EAB6
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271001; cv=none; b=tz94GIRGQLANyZefw7dBN71fiHL/4VbJWwsVSg+6zmNf+S3jJXuVrt3PZGetWK0ho99u/NUmvHoCaQtJiou6dGRudmWxwl2A5N3DK7UVzN2RORVzdS/Pv2cf8HufsSgS1+TkOH/cQb4tfuKmgkUY5hywwPb588hJlAOBqL+6BeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271001; c=relaxed/simple;
	bh=HNyckrlhPDXbuHHYerL7mLHRGAGEQ08JMmI/0T/a3yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M16w7IEdNbDU9nOU5YJUbOVGFFOhd1oYA7BfQruVF10aQ2R4+YHZTvp2/K9tfogZUm4go1HJIUECexCpuBZoSpmLFl+poqpvxE81CUjmYFWwwmCWsDRPv6oY/tlhsmpZLWFtb8W/TBY2uSAKXxFnxTxlYiv9kEn8DlMVajJ7coE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWC1YOQf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWC1YOQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28828C4CEF8;
	Thu, 27 Nov 2025 19:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764271000;
	bh=HNyckrlhPDXbuHHYerL7mLHRGAGEQ08JMmI/0T/a3yA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NWC1YOQf6j5kk0rclU0NcfNoVbemrOxMjcJxtsl7YC4dw+63hX2kE5KkeeobQ/rby
	 8GWXXnWv/0PVG8+Adq83wt9mAP7H1pnmRZiDAcoKpnvnXLR15bJ0P00kbtNs5DDNLu
	 0uYQ9zE/6qwZ/+zeFxam2vvvCoPpz7Fns5Rky8gh0LFMNcnEL572R28MSWhWarNaxI
	 U7jbq40JK0Jze27p/wHf+2Xt4SnZKk4ByLXCiqSkWUTLDkDk9FleErNG1lY6GCtNa/
	 +ARe0Oh5GFzUYgGwoCyABY/ckRMTqaKxYyVUUqWhoZK5JxaTWqLkZNfaUvB7CvetAe
	 o0uSDCHqvZB5Q==
Date: Thu, 27 Nov 2025 19:16:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/7] ASoC: SDCA: Align mute controls to ALSA expectations
Message-ID: <7a972ab0-a7bc-4c72-b0f1-06591f5075f6@sirena.org.uk>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
 <20251127163426.2500633-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BQC2HrtK/oGn927N"
Content-Disposition: inline
In-Reply-To: <20251127163426.2500633-2-ckeepax@opensource.cirrus.com>
X-Cookie: But they went to MARS around 1953!!


--BQC2HrtK/oGn927N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 04:34:20PM +0000, Charles Keepax wrote:

> Update the names and invert the mute controls to make them more
> standard "FU XX Channel Switch", this does slightly deviate from
> the SDCA specification but it makes the rest of the Linux ecosystem
> a lot happier.

And there was me thinking you were going to address the FU bit. :)

>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  include/sound/sdca_function.h | 2 +-
>  sound/soc/sdca/sdca_asoc.c    | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
> index c97861508a158..2564fad33fd46 100644
> --- a/include/sound/sdca_function.h
> +++ b/include/sound/sdca_function.h
> @@ -611,7 +611,7 @@ enum sdca_entity0_controls {
>  #define SDCA_CTL_NDAI_PACKETTYPE_NAME			"NDAI Packet Type"
>  #define SDCA_CTL_MIXER_NAME				"Mixer"
>  #define SDCA_CTL_SELECTOR_NAME				"Selector"
> -#define SDCA_CTL_MUTE_NAME				"Mute"
> +#define SDCA_CTL_MUTE_NAME				"Channel"
>  #define SDCA_CTL_CHANNEL_VOLUME_NAME			"Channel Volume"
>  #define SDCA_CTL_AGC_NAME				"AGC"
>  #define SDCA_CTL_BASS_BOOST_NAME			"Bass Boost"
> diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
> index 4e3f193c75eff..0e21ed1091720 100644
> --- a/sound/soc/sdca/sdca_asoc.c
> +++ b/sound/soc/sdca/sdca_asoc.c
> @@ -886,6 +886,9 @@ static int populate_control(struct device *dev,
>  	mc->min =3D 0;
>  	mc->max =3D clamp((0x1ull << control->nbits) - 1, 0, type_max(mc->max));
> =20
> +	if (SDCA_CTL_TYPE(entity->type, control->sel) =3D=3D SDCA_CTL_TYPE_S(FU=
, MUTE))
> +		mc->invert =3D true;
> +
>  	(*kctl)->name =3D control_name;
>  	(*kctl)->private_value =3D (unsigned long)mc;
>  	(*kctl)->iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
> --=20
> 2.47.3
>=20

--BQC2HrtK/oGn927N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkoo5MACgkQJNaLcl1U
h9Bc3Af9HX6Iu57l1+31THgssB1MW0M3zm/GiSSIs+MTC62w/tgSoJ/63AEQFDvH
1McyTQqV1Q2WMZzt2mXpg0kwq6IMDlUJNS1n6UDZNOkZQTBZI5/TohpfZISdcMIw
OXr+YnrP7IpL/sMsJOsH9OiJmgB76OTWi1aLOU06bt5Ccr/ljgYFLcxD75tk/CBd
3X8W3VmALq+5SJIrXS2X/d4eQmQRSXoMyGM7DaiZ1loDKcI/1lqO3iKvz8FnNbWF
rkpQB2IZX9A5Krwsof9DXHDZcZ+DDoDhxFP7yXjIrRdjjVzqRGClMlmrzxEiZd+9
u9JduP1S/68zSu9ugTWocpbtXxe6gg==
=13Zk
-----END PGP SIGNATURE-----

--BQC2HrtK/oGn927N--
