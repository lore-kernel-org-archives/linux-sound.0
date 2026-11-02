Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643284;
	b=07NwCb2saeH60LMFxWC90PLEjXDp3oDE76GGl+SaDbYTEX/M25lDw6v68hMOAfqJlCFF
	 EZjGrzOfCCUxXLPTfH9faNe1RpuW3ffX3wv8mHtiPQa7w1t59Kt0jKBSIKY0SH+FY/RH7
	 r05HklfSZP4+tbOaACtNDFFpX+lHCwESTzsFUdo/zgndPCpw0JQd1JqGFoDj9088l7Kfd
	 2haewFWo6EeE44d5RICaxfn2zCiMFgLw2xba44WRiP/jT2Ge+5Tt4C/sun8uhucN3zdz9
	 raRiFl9MXNlyU7kZxy5v2X6NOGRG4d6hLvDaUkwTphOqY6CQ4njSuWDI2zAwuDBqU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643284;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XBNn1ew5udkUdcjzLwHZCSfaJmjk1k3qUVg/5XkvtTY=;
	b=H0qImHBvsmM/K5wE0aViYuErWFKGY4KyLFBHF4EUhbrzdO74rRPlApA3nhJTb30gdUTk
	 jZXcmTm1uzwg905sCAVljsQteHLPi+SsadUXsBfv/gdpBhxWfPm6aQ7mfLbXc6J4Nmm+3
	 VQHCpOaFJAeqkSx9dKTiQ7MUZQXyzEW6aEc4bYRFIe4yp00Bl1NfwOhuM2uf6kG5oAPNj
	 BFW4dvaE6QgFZfO99xxzfVUmxyGkx8GhKtDcFGEPmsyhYh0YqbFzbphBXIVJ3HsB5MPEd
	 BLOAAkQ8w4lvHac6EQXn9b+3zsqa5cgbwvEzGVHQZKBSkPk79eWDVnTfoplvFo1fVqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=USgD3U8S;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB21606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=USgD3U8S
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA4D1F00A16;
	Mon,  2 Nov 2026 18:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643284;
	bh=XBNn1ew5udkUdcjzLwHZCSfaJmjk1k3qUVg/5XkvtTY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=USgD3U8SksgZOEEZLtKYEco6TqoyRMmrpb7w8c0jGPRog5UAxchzNJicmekjTW1nE
	 YizAZmjOPVaPJnBHc+Isyqxu9hMyAGYLrnq4JuXgDW/RhVm0wq7KNMVemJmdJugwCG
	 kTFMEo4Ag6mYNxswg7B2U1DfeuufopDYVKgZGMHasn740g2Ebnb0YJhdPvSzrupJBa
	 pu1SO2OpFUfhs23W+ckWomfN3Wid3kN5mrSDit350xOxECOtObVwvFfSttF31eedaN
	 YXrQVRUoKA2JoA4Nfr/MNmLTDxDZoQ+SVTX1pPKMXj5bcr/fAilxeEP4UeIyh8Edb3
	 si0N2+bE56zNw==
Message-ID: <sashiko-outbox-193918@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] soundwire: intel: Split PDIs and DAIs
 initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102181042.1922005-4-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-4-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:14:43 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] soundwire: intel: sdw_intel_init_pdis() breaks PDI init on ACE2.x
- [Medium] soundwire: intel: missing link power down on error in intel_link=
_startup()
--

commit 8870f97b0ab1ec823a91e4c81168130f5f4ee09d
Author: Cezary Rojewski <cezary.rojewski@intel.com>

soundwire: intel: Split PDIs and DAIs initialization

This commit splits PDI initialization out of intel_register_dai() in
drivers/soundwire/intel.c into a new sdw_intel_init_pdis() helper and calls
it from intel_link_startup() so that the register_dai() callback can be
optional.

> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index d53fa3d299bc7..708503373183f 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1027,22 +1027,28 @@ static int intel_create_dai(struct sdw_cdns *cdns,
>  	return 0;
>  }
> =20
> -static int intel_register_dai(struct sdw_intel *sdw)
> +int sdw_intel_init_pdis(struct sdw_intel *sdw)
>  {
> -	struct sdw_cdns_dai_runtime **dai_runtime_array;
>  	struct sdw_cdns_stream_config config;
> -	struct sdw_cdns *cdns =3D &sdw->cdns;
> -	struct sdw_cdns_streams *stream;
> -	struct snd_soc_dai_driver *dais;
> -	int num_dai, ret, off =3D 0;
> +	int ret;
> =20
>  	/* Read the PDI config and initialize cadence PDI */
>  	intel_pdi_init(sdw, &config);
> -	ret =3D sdw_cdns_pdi_init(cdns, config);
> +	ret =3D sdw_cdns_pdi_init(&sdw->cdns, config);
>  	if (ret)
>  		return ret;
> =20
>  	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
> +	return 0;
> +}

[Severity: High]
Does calling sdw_intel_init_pdis() unconditionally from intel_link_startup()
break PDI initialization on ACE2.x+ platforms?

intel_link_startup() in drivers/soundwire/intel_auxdevice.c is shared betwe=
en
cAVS/ACE1.x (sdw_intel_cnl_hw_ops in drivers/soundwire/intel.c) and ACE2.x+
(sdw_intel_lnl_hw_ops in drivers/soundwire/intel_ace2x.c).

However, sdw_intel_init_pdis() is implemented in drivers/soundwire/intel.c
and calls its file-local intel_pdi_init() and intel_pdi_stream_ch_update()
helpers, which access the cAVS/ACE1.x SHIM layout at SDW_SHIM_PCMSCAP(link_=
id)
and SDW_SHIM_PCMSYCHC(link_id, pdi_num). On ACE2.x+, sdw->link_res->shim
points to the per-link SDW_SHIM2_GENERIC_BASE(link_id), where the PDI
registers are instead at SDW_SHIM2_PCMSCAP and SDW_SHIM2_PCMSYCHC(pdi_num).

Meanwhile, intel_register_dai() in drivers/soundwire/intel_ace2x.c still has
its own PDI initialization:

drivers/soundwire/intel_ace2x.c:intel_register_dai() {
	...
	/* Read the PDI config and initialize cadence PDI */
	intel_pdi_init(sdw, &config);
	ret =3D sdw_cdns_pdi_init(cdns, config);
	if (ret)
		return ret;

	intel_pdi_stream_ch_update(sdw, &sdw->cdns.pcm);
	...
}

On ACE2.x+, intel_link_startup() will first run the cAVS/ACE1.x
sdw_intel_init_pdis() against the SHIM2 MMIO space, reading bogus PDI counts
and allocating cdns->pcm.{bd,in,out}, and then sdw_intel_register_dai() will
call sdw_cdns_pdi_init() a second time (leaking the first devm_kcalloc() PDI
allocations and leaving stale pointers in cdns->pcm.in or cdns->pcm.out if a
stream count was non-zero in the bogus read and zero in the SHIM2 read, sin=
ce
cdns_allocate_pdi() returns early when num =3D=3D 0). Furthermore, if the n=
ow
optional register_dai callback is omitted on ACE2.x+, the SHIM2 PDI
initialization will never run at all.

Should init_pdis be dispatched through struct sdw_intel_hw_ops and split out
of intel_register_dai() in drivers/soundwire/intel_ace2x.c as well?

[ ... ]

> diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/inte=
l_auxdevice.c
> index 5983fbc5725a2..114dadedfa14f 100644
> --- a/drivers/soundwire/intel_auxdevice.c
> +++ b/drivers/soundwire/intel_auxdevice.c
> @@ -423,6 +423,10 @@ int intel_link_startup(struct auxiliary_device *auxd=
ev)
>  	if (ret)
>  		goto err_init;
> =20
> +	ret =3D sdw_intel_init_pdis(sdw);
> +	if (ret)
> +		goto err_init;

[Severity: Medium]
If sdw_intel_init_pdis() fails here in intel_link_startup(), should this ju=
mp
to err_power_up instead of err_init?

At this point sdw_intel_link_power_up(sdw) has already succeeded:

drivers/soundwire/intel_auxdevice.c:intel_link_startup() {
	...
	/* Initialize shim, controller */
	ret =3D sdw_intel_link_power_up(sdw);
	if (ret)
		goto err_init;

	ret =3D sdw_intel_init_pdis(sdw);
	if (ret)
		goto err_init;
	...
err_power_up:
	sdw_intel_link_power_down(sdw);
err_init:
	return ret;
}

Jumping to err_init skips sdw_intel_link_power_down(sdw), leaving the link
powered up, sdw->cdns.link_up set to true, and BIT(link_id) set in
*sdw->link_res->shim_mask while sdw->startup_done remains false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102181042.1922=
005-1-cezary.rojewski@intel.com?part=3D3
