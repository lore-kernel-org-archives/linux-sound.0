Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967964;
	b=KQOyAGDqfEGNLfwY7/jSBPAvolFdnRjRVuywqKvB5cLrzA4TucQShZ/75UhJlC8PXhs6
	 iwqvIfe8rlFpXISrJmGKue1TalpnJ/1tfYnuPSjRIl0gKWgn0eTq1ihK4qvoqexexlMaa
	 3TNs/96xrf5pJ+GTLsAOgzZ5ok+rHslNRmvFlBAIDyFIdx3a3tj/fRyYr39hOYMcU1mE3
	 zL5OBcD2Uuyi3Zhp4aMrYuIKrim+MaC3BbEChzidibNv261QzV1RSTp/r2PgvzW2+9wHK
	 DDY7tYNa+cK7cv4WIft4P/E3sLn2wIj3iqnNQTZSk2WUMKHMYUJMOsIdveSbId3WFEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967964;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D8yNYIGywleFlwk6dUiwCw7AU0Ds3EMSfTo04LYrGwE=;
	b=clyLZYzSUPfXPXnkpLJdxZRzkBUCX6xqCJSUMO3kWtQ/jMed/TSPagSNuD/4EO1zUzna
	 MRINwARLhgNdmKfMRrE4T/8aosvqFc2IlfEbv1a27ehT4Ejfh2ccwm82rbYvoZHILS4X/
	 AGgh2oYdHane/UIVpuTEvQSZ+FQFCnPi6ew2p685Hp077zCM3ibcy7+376vmDUlvSAmRd
	 xhwcxSab7DUt5OMULfnV5nF2vNDbh49p16W0nwLEErxL0dYn/cSuM4eUnkPvIxrFGpkz9
	 9FDElPywSFXCZhqL+9Ccai72VpSyYDpU7r31EcozmSVe6fT2v2+8lSFZW2wE/TbcpTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcEyHuqL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BC9606A32D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gcEyHuqL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977DE1F0089F;
	Fri,  6 Nov 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967963;
	bh=D8yNYIGywleFlwk6dUiwCw7AU0Ds3EMSfTo04LYrGwE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=gcEyHuqLz2bsyG0kEGOnmyTW/BuGB/vOh/OmQWg52KnZWhot3th5y+WvYJUzXOV5e
	 OgumJTHzbgti3icWUaPCYVvD2X0G7cB0WvL6fX6zJsYPdhaKLsyopO2WNeVTFEyqo6
	 vDIKVSkyu9l0EDGJhgozSn0by0TVqgpZdiRBZWucjz9oB8TAf7QnRz067X78CruFYY
	 8RE0zm3KTdrQ4DXaGCEHQLOVxHvWZnEUwquAwc23jzI8rn/L1XuWS5EXtUMMTD5KB0
	 jUlMCA11NzaVHk4AHOQh5+eFYF7DwBJiXQpzAPmH2M1zJVGVwgRm2n0BedfMGimex6
	 v6Qb+HarXE5FQ==
Message-ID: <sashiko-outbox-201396@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] soundwire: intel: Allow for dynamic assignment
 of PDIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261106121557.2338556-3-cezary.rojewski@intel.com>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:26:03 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] soundwire: intel: NULL deref in intel_hw_params() on
  dai_runtime->pdi
- [High] soundwire: cadence: sdw_cdns_assign_pdi() assigns Bulk PDIs 0
  and 1
- [Medium] soundwire: intel: sdw_intel_pdi_config() adds separate layer
  over DAI ops
- [Low] soundwire: intel: unused variables ch and dir in intel_prepare()
--

commit b476d294896c8b164f217d04d51fe678c5bc644e
Author: Cezary Rojewski <cezary.rojewski@intel.com>

soundwire: intel: Allow for dynamic assignment of PDIs

This commit adds sdw_cdns_assign_pdi() and sdw_cdns_release_pdi() for
dynamic PDI allocation and exports sdw_intel_pdi_config() to configure
SHIM, ALH, and stream registers for a PDI.

> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/caden=
ce_master.c
> index a0a63b76793e2..6c1ad11c6583a 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
[ ... ]
> +struct sdw_cdns_pdi *sdw_cdns_assign_pdi(struct sdw_bus *bus, u32 dir)
> +{
> +	struct sdw_cdns *cdns =3D bus_to_cdns(bus);
> +	struct sdw_cdns_streams *stream =3D &cdns->pcm;
> +	struct sdw_cdns_pdi *pdis, *pdi;
> +	size_t num_pdis;
> +	int i;
> +
> +	if (dir =3D=3D SDW_DATA_DIR_RX) {
> +		num_pdis =3D stream->num_in;
> +		pdis =3D stream->in;
> +	} else {
> +		num_pdis =3D stream->num_out;
> +		pdis =3D stream->out;
> +	}
> +
> +	spin_lock(&cdns->pdi_lock);
> +	for (i =3D 0; i < num_pdis; i++) {
> +		if (!pdis[i].assigned) {
> +			pdi =3D &pdis[i];
> +			goto found;
> +		}
> +	}
> +
> +	for (i =3D 0; i < stream->num_bd; i++) {
> +		if (!stream->bd[i].assigned) {
> +			pdi =3D &stream->bd[i];
> +			goto found;
> +		}
> +	}

[Severity: High]
Does searching stream->bd from index 0 hand out PDI 0 and PDI 1 to PCM
streams?

In sdw_cdns_pdi_init(), stream->bd is allocated starting at PDI 0, and
the first two entries (pdi->num 0 and 1) are reserved for Bulk transfers
on DataPort 0.  On Intel controllers where all PDIs are bidirectional
(num_in =3D=3D 0 and num_out =3D=3D 0), the first two sdw_cdns_assign_pdi()=
 calls
return PDI 0 and PDI 1.  When sdw_intel_pdi_config() then calls
sdw_cdns_config_stream(), TX streams on PDI 0 or 1 set
CDNS_PORTCTRL_BULK_ENABLE, PDI 1 is mapped onto DataPort 0 alongside
PDI 0, and intel_pdi_shim_configure() / intel_pdi_alh_configure() omit
the +2 PCM ALH stream offset applied when pdi->num >=3D 2.

Should the stream->bd loop start at i =3D 2 to skip the two Bulk PDIs?

[ ... ]

> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index af65214836b4d..0baa032fb4e8e 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -674,6 +674,22 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struc=
t sdw_cdns_pdi *pdi)
>  	intel_writel(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id), conf);
>  }
> =20
> +/**
> + * sdw_intel_pdi_config - Configure specified PDI
> + * @bus: SoundWire bus instance
> + * @pdi: PDI instance to configure
> + */
> +void sdw_intel_pdi_config(struct sdw_bus *bus, struct sdw_cdns_pdi *pdi)
> +{
> +	struct sdw_cdns *cdns =3D bus_to_cdns(bus);
> +	struct sdw_intel *sdw =3D cdns_to_intel(cdns);
> +
> +	intel_pdi_shim_configure(sdw, pdi);
> +	intel_pdi_alh_configure(sdw, pdi);
> +	sdw_cdns_config_stream(cdns, pdi->ch_count, pdi->dir, pdi);
> +}
> +EXPORT_SYMBOL(sdw_intel_pdi_config);

[Severity: Medium]
As reported by Vinod Koul on v1 [1], why add a separate layer exporting
sdw_intel_pdi_config() and sdw_cdns_assign_pdi() / sdw_cdns_release_pdi()
for driver-specific DAI ops instead of updating the SoundWire Intel DAI
driver to handle both startup and hw_params uniformly across Intel
drivers?

> @@ -745,9 +761,7 @@ static int intel_hw_params(struct snd_pcm_substream *=
substream,
>  		return -EINVAL;
> =20
>  	/* do run-time configurations for SHIM, ALH and PDI/PORT */
> -	intel_pdi_shim_configure(sdw, pdi);
> -	intel_pdi_alh_configure(sdw, pdi);
> -	sdw_cdns_config_stream(cdns, ch, dir, pdi);
> +	sdw_intel_pdi_config(&cdns->bus, dai_runtime->pdi);

[Severity: High]
Does passing dai_runtime->pdi here cause a NULL pointer dereference?

dai_runtime->pdi is NULL until "dai_runtime->pdi =3D pdi;" a few lines
below, and sdw_intel_pdi_config() -> intel_pdi_shim_configure()
immediately dereferences pdi.  Passing pdi (or assigning
dai_runtime->pdi before calling sdw_intel_pdi_config()) avoids the crash.

> @@ -823,9 +837,7 @@ static int intel_prepare(struct snd_pcm_substream *su=
bstream,
>  		else
>  			dir =3D SDW_DATA_DIR_TX;
> =20
> -		intel_pdi_shim_configure(sdw, dai_runtime->pdi);
> -		intel_pdi_alh_configure(sdw, dai_runtime->pdi);
> -		sdw_cdns_config_stream(cdns, ch, dir, dai_runtime->pdi);
> +		sdw_intel_pdi_config(&cdns->bus, dai_runtime->pdi);

[Severity: Low]
After replacing sdw_cdns_config_stream() with sdw_intel_pdi_config(), the
local variables ch and dir in intel_prepare() are set but never used,
triggering -Wunused-but-set-variable warnings.

[1] https://lore.kernel.org/r/aulzN9MCl5CJB1Al@parshuram

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106121557.2338=
556-1-cezary.rojewski@intel.com?part=3D2
