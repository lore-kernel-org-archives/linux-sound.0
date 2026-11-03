Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714435;
	b=qT+cIxTHF7pfzTC+g4gL/O5v5vegkjP5f40qsPAvXbkW9CzwGJYoZ3klbs4RiE1FXy2I
	 7IJI+jWG8BnUixN44KIjRnyKmhj81tTfKj4b408RTHHq7k1dayTg8jxdZ33qu93NO8bMw
	 Z+5k8gO9DFMEva8DHrO9YwibmSsSioFVMha6HGOanEXGfB/xc5k0/mu+8U/CIxSVR+CA+
	 71DIILxyEFBz3gPSXQNHlBw5Nqj9dEE8AcHKE1Xo8ILyl91cx7EpxPHYkeKjUzgQ6q4Js
	 d3cLkYQNz8NHGbxrvWoFBi6TZoowI0wb18j65pA2CLaserj25h5eokvUSl6oNb616hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714435;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TpztxqPLIGTQw/vyfoJIbbChodUWhzBAHXUFhJAJpIE=;
	b=iW660lqmGLpZ0eLJPUv/KZuVd7VOKqNfNYvW91rOkTpLxI1iJA9Rvf0mOUydm/9g3MFz
	 GipUPMKQspruXXkOjwMiHc2p0nPG3W0jIAyEyTNAZx70YbAOGcQSkdOLjeqdHKHNCTVTI
	 DhcmwVAtUl6WKRsNpiOeMPYvOzyL1r29dyoB4xGISBwGrN0figJj3Q1KlHU/LWHLFRLmc
	 /tPTwbWTyEAQeeuRpAHJrP0YH2Hv6dF8bMs+4OiT/52kLjl6JHMPxe4vhoUH7HqZj6vZa
	 diLIGU5X/2pM1s01LOopbcSCNhQ4O88ef92v9OldnLefo2Dmz4vcAIezC5c0UW56Phw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbhcOPxd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9685606D80F
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbhcOPxd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9CD1F000C1;
	Tue,  3 Nov 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714434;
	bh=TpztxqPLIGTQw/vyfoJIbbChodUWhzBAHXUFhJAJpIE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=HbhcOPxda/uVLBYVYl4a2wM/9o50gfDKccHKCw6CfBepXg9C6kDt1d/cMGnG81BnE
	 2EcI2WdIpGbR7otko5wzCpPexU8NMpLFLGnqEJMW4+xmtV8OySr9alA31upQYQLHo/
	 1bh2Lsyd0Djf//qWW17Ls4CtvYaJA1LF1dArNMUXKAGbXpXI3D6cA4OYKRqUAPvgm9
	 9HpJtvu6vm/rNV22r3Yyg0qHWgM6W5EE/ER/z2sdCdV75xmIHh+fBlTtaqAsfsdUP8
	 tbvz5A5dU6r5fUUbqekPCdBaHKwjc8XIrc4+50gU5ejJA/w+oScuDrlhYuBlez86fm
	 K8kyHPv2REqpQ==
Message-ID: <sashiko-outbox-195411@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] soundwire: intel: Allow for dynamic assignment
 of PDIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261103134958.2089136-3-cezary.rojewski@intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <20261103134958.2089136-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:00:33 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] soundwire: intel: sdw_intel_pdi_config() adds separate layer ove=
r DAI ops
--

commit e83fbc567de1bac187beea3bd11c5b0304d25e97
Author: Cezary Rojewski <cezary.rojewski@intel.com>

soundwire: intel: Allow for dynamic assignment of PDIs

This commit introduces sdw_cdns_assign_pdi() and sdw_cdns_release_pdi() for
dynamic PDI assignment, along with sdw_intel_pdi_config() to configure PDIs
separately from assignment.

> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index af65214836b4d..d53fa3d299bc7 100644
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
As reported by Vinod Koul on v1 [1], exporting sdw_intel_pdi_config() adds a
separate layer in drivers/soundwire/intel.c for external driver-specific DAI
handling while leaving the existing DAI operations in intel_hw_params()
unchanged:

drivers/soundwire/intel.c:intel_hw_params() {
    ...
	pdi =3D sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch, dir, dai->id);

	if (!pdi)
		return -EINVAL;

	/* do run-time configurations for SHIM, ALH and PDI/PORT */
	intel_pdi_shim_configure(sdw, pdi);
	intel_pdi_alh_configure(sdw, pdi);
	sdw_cdns_config_stream(cdns, ch, dir, pdi);
    ...
}

Instead of exporting sdw_intel_pdi_config() for external callers while
intel_hw_params() continues to allocate PDIs statically by DAI ID and call
intel_pdi_shim_configure(), intel_pdi_alh_configure(), and
sdw_cdns_config_stream() directly, could the SoundWire Intel driver itself =
be
updated to handle both startup and hw_params uniformly across SOF and AVS
drivers?

[1] https://lore.kernel.org/r/aulzN9MCl5CJB1Al@parshuram

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103134958.2089=
136-1-cezary.rojewski@intel.com?part=3D2
