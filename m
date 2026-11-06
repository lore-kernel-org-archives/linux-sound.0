Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967529;
	b=HCOnxeRnh3YJ/wgXInbheuQrkKG36gV2rJeVA17i9cSQibfLKt0csZEkCLBsXVTVMtfl
	 PXSbw+jbSK4O8fGT1vbf4TCpbV0X7ZPlLDB/kkaXuBqpDnrR3dw/PsugDvNbPZ6YKVibO
	 xFP75nkyyC5S6SpD1gPW10x0rSTSYZBc+or9a6Rj7WF9riGCCuCLgvrckzipp2piBe58z
	 tkh3BaQrVSLfbO8+vh5/XafsH5GqZl9C+qaKGdoxWPfXlsa6I9aatvS9K78ZzyMxzQOvA
	 IMIvelQBhEbbjMHEF4EMtMskva+5+u0PSK40knhb5P78WdnQ6zpUNiPVlet3qb7J0RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967529;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4qXLI0St8FXAmbLjkN4vDQ7wTcvz2OAJULsfDtRq1Lk=;
	b=VtOlLANX0Ha2y5hDlNLDaNQf76k7Zh/pz3oTZTcO3u5o+FswxeVM5AJrCGhBmSzcPXdi
	 V5mLH5d2BfDiFje+Xap8/FLUwTCP67VYdnrXHIujObP62A8AvOC6kOcoJLBfcYhaAV/i/
	 1z8c6dCBvbeFNqCG3O7GcV+kqC8nc2v4DFhrrMbZY90FNtDawJMrRc+9PgH4tIQ8+1ghn
	 LC/ltOta1dCr1iwtBh7iADSXVb19rFY8dmkg2EzYTSH2zFs1nOLwqD/s1wv/uAaKhROzS
	 jWuGH6PuhJ5UhZehI1UWL5fam7TUcLUrdqR8/99xZd0blRgY0oNLXSbBzSoTUb8/sFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHj2n2+C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9603A606A326
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bHj2n2+C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E611F0089F;
	Fri,  6 Nov 2026 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793967529;
	bh=4qXLI0St8FXAmbLjkN4vDQ7wTcvz2OAJULsfDtRq1Lk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=bHj2n2+CFmRzmYMNaAk994G9fcyXVVbWdGYjKILmTkAEXn/YjV/JD80OwlKOnug01
	 VEBRaC4HmjPNihmwUmOCzT7HMy8qfszyttMZX94EqrT48LWJraXsarctzZL3SdflbQ
	 3lur/ZHlkPfAYcPf1h9/V6KfEFKDyNDQAwzI/fbEkyvXTObvM+BxfpP4jLBzR4y+DY
	 hhW+T2B3hu8FwKf3te0BlekxsHZr/wXLXpm+O1O9osGXgNuR+q5fDOU+h8palf/AIB
	 9Y9dYh/IUd6cuXaKp92WHe6K+kQ9zSWgCRf9CEnQ4daSx/L7LFbPasu9wIzt7Linq3
	 XDl8a0x1nRWiQ==
Message-ID: <sashiko-outbox-201394@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] soundwire: intel: Split PDIs and DAIs
 initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261106121557.2338556-4-cezary.rojewski@intel.com>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-4-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:18:48 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] soundwire: intel: bypassing intel_register_dai() against
  maintainer direction
--

commit fd70be11c65e2cabc3b8e75299a0c79a70299383
Author: Cezary Rojewski <cezary.rojewski@intel.com>

soundwire: intel: Split PDIs and DAIs initialization

This commit splits PDI initialization out of intel_register_dai() into a
separate init_pdis() callback and makes the register_dai() callback
optional during link startup.

> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index 7a2e7e73ad632..65f7d53a3d2b4 100644
> --- a/drivers/soundwire/intel.h
> +++ b/drivers/soundwire/intel.h
> @@ -154,11 +154,18 @@ static inline void sdw_intel_debugfs_exit(struct sd=
w_intel *sdw)
>  		SDW_INTEL_OPS(sdw, debugfs_exit)(sdw);
>  }
> =20
> +static inline int sdw_intel_init_pdis(struct sdw_intel *sdw)
> +{
> +	if (SDW_INTEL_CHECK_OPS(sdw, init_pdis))
> +		return SDW_INTEL_OPS(sdw, init_pdis)(sdw);
> +	return -ENOTSUPP;
> +}
> +
>  static inline int sdw_intel_register_dai(struct sdw_intel *sdw)
>  {
>  	if (SDW_INTEL_CHECK_OPS(sdw, register_dai))
>  		return SDW_INTEL_OPS(sdw, register_dai)(sdw);
> -	return -ENOTSUPP;
> +	return 0;
>  }

[Severity: Medium]
As reported by Pierre-Louis Bossart on v2 [1], can the AVS driver reuse
the existing SoundWire Intel DAI registration and intel_pcm_dai_ops
rather than making register_dai() optional to bypass them?

Splitting intel_init_pdis() from intel_register_dai() and returning 0 when
register_dai is NULL is only used so commit "ASoC: Intel: avs: SoundWire
support" and commit "ASoC: Intel: avs: SoundWire PCM BE operations" can
clear register_dai and implement a separate DAI registration and dynamic
PDI assignment path, duplicating the existing SoundWire Intel DAI
infrastructure.

[1] https://lore.kernel.org/r/bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106121557.2338=
556-1-cezary.rojewski@intel.com?part=3D3
