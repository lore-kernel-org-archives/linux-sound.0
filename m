Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714308;
	b=SOMFvujtxXFz0aQUtBeDPpAk4viCfJY3xAUtwdmmgXQmQJG73AbnJED+JzPBPfjDw864
	 LB3o5iRadV9hP0NlnPeqoKjXchyfpkPHn932xz81SX7KzkdA94nkjrdrRwbK93syiGvyn
	 09AOisoj7IJ6CpqNAhbEccTYwsNFsq7ZUYKM7nQ1UhL8DR82Y9dLmSRpRE3jbTFFUD1hR
	 HVIPlK8MJH5uyOnMeA912k/zZgis+YTT5Amx7xzNjzkdV2V3JJ4yGP6QM/ZMNv4Nn+zLR
	 Gk9b3D9pHWn9+jewutgwnD3HC2k7ZVpOWFjiuF7Ex0ulZccUT6C4VbrpNiFjaV7sz4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714308;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mG37EprBM9Mrnwjf5V0h9N4Jxm6dZ7TaeMpj4i+fOQs=;
	b=hXlU7zdvWcM41yQhHXu1aMk3DfqA5id3sS0zf6Xp1leYFdR5F0Bp/rqi74gDUQsUnbM2
	 +gQw359ZieGsWqM3emKRBfD0v25sp/4BShZqA9/hZgUTRrSTaPhfgj+6tMHz+dTxUIsjD
	 0ISq2G63ZWfO+NmebgNkDVZGC6YwS55kLF5NLq4Y3svwU+aFDPW1OTjVhYUz/iFGRLkiA
	 Jlyq4ogDcHfeyJxL8Amybf6FKhbJjkkWYvB3dQE+Y8L3Aw0G45qi562WLlD53VdEtw+EE
	 ajGWw5Vj/+gE2pmtysFAf7qhW9HfjQFwqVC/F08vlqjHCjDsqMc6+KsV0vThMPirALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cz5utf3d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F85D606A326
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cz5utf3d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFF71F000C1;
	Tue,  3 Nov 2026 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714308;
	bh=mG37EprBM9Mrnwjf5V0h9N4Jxm6dZ7TaeMpj4i+fOQs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=cz5utf3dRJcZpIht4249XzSFuwuqJi/eCGMfiG+4y4WOw2NlGAQIhx5sXJTTljLXV
	 Pe1+ntptIJsBm2fIIRMDNxaqxY0W5PcC9m0cSTrFaxg67/MuaZyjsv5+UnMTaL6uWt
	 kfWYXsGSKiOXGX4HHIB4i7dn92qyrRRZ7BoR+xZxbXW9n+qCi67Xy5BXQH3jTb1EUd
	 /KkUzx1HJpDnIsU6TTu4BC6QU+wVfNwD9bUayaziF3RuSfz58mD/UBhhlnfsThBIQU
	 BtdCr/JebCu2N/EBCv80Swz1x86dMOpkr+e/FyRkAc29brpNZIeQIdbsxcSGcP8DLC
	 PR8TeX5JalrgA==
Message-ID: <sashiko-outbox-195408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] soundwire: intel: Split PDIs and DAIs
 initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261103134958.2089136-4-cezary.rojewski@intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <20261103134958.2089136-4-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 13:58:27 +0000
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
- [Low] soundwire: intel: redundant declaration of sdw_intel_init_pdis() in=
 intel.h
--

commit b93a84bb66dfc11183e5241bb65db4b0c4fcaaef
Author: Cezary Rojewski <cezary.rojewski@intel.com>

soundwire: intel: Split PDIs and DAIs initialization

This commit splits PDI initialization out of intel_register_dai() into a
separate init_pdis callback in struct sdw_intel_hw_ops so that register_dai=
()
can be optional. It also updates intel_link_startup() to call
sdw_intel_init_pdis() before registering DAIs.

> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index 7a2e7e73ad632..f2372749f08db 100644
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
> =20
>  static inline void sdw_intel_check_clock_stop(struct sdw_intel *sdw)
> @@ -262,6 +269,7 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw=
);
>  void intel_check_clock_stop(struct sdw_intel *sdw);
>  int intel_start_bus_after_clock_stop(struct sdw_intel *sdw);
>  int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop, bool wake_ena=
ble);
> +int sdw_intel_init_pdis(struct sdw_intel *sdw);

[Severity: Low]
sdw_intel_init_pdis() is already defined earlier in drivers/soundwire/intel=
.h
as a static inline wrapper for the init_pdis callback. Should this redundant
non-static prototype under the common bus management declarations be droppe=
d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103134958.2089=
136-1-cezary.rojewski@intel.com?part=3D3
