Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643733;
	b=gnu4RMmhPmWFMyttUUIH0B7vYKQlCLWLc7wGFm/JLP8QW3w2bMpo3hbLDe9/xbqacGc4
	 GuHtjx0VZuEt4dbVtQad1WB8wwqfOpr3vdEfR8L23ITp/hMrebiyKvr2450x/OB3o1TOk
	 TT7/hbfdAKmJaUwzn+TnUyoR81YEdg25h/sKSJ1I03bQsYqjkPxxEvs6qlxMMZ35bPVgq
	 R5KmeLBOwsuIxPBNiblqUQmWvGf4QRhU+NbIzThmn+DNqrrdiNPrGXX7CIQPJOQCVrd1y
	 lPFlb9nPOSmfH6HftT2JwyRzRDuYyyV8D0NRhfQ5OaRDygp/AE9xSQK2abuNCRYoDKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643733;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uZyIkVFOFkd9jLVbUWEaIIDHtydWb/B2QzNgKleXYj0=;
	b=nUARzmEZ3tnlG+SdBuYUCtwZ/ZVz/ABbJSp73kELswlCP4oNq0ZZvfe/mG8UF4Iereof
	 DpgMAK5MBWtNNtsJW0GVQdLh8X98S8JqC2qA86g9GyuDQ7KSz4nDbwL2QSY6vom/Zn6tW
	 3YN1YCx5lmoOwlwvVRdW+YChwzjgCn/v+jeFVLMlOlxciq/jrhtwWAAyLJUXdBLzpYA0w
	 MvN4GB/wWD0fpVqC+ZKMnaA6TjEJI/r6d7lH5tXO9q9QFTa2iO9Kk/kX6FWeTWmzszw6D
	 I6wW8Y44u1c1+4/8+hgNNt0E2S3wnXg8jDejhrjjluDIx4cDmKYTPnICBYP5puRfGHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahZjYZd3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38430606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahZjYZd3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE4331F00A18;
	Mon,  2 Nov 2026 18:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643733;
	bh=uZyIkVFOFkd9jLVbUWEaIIDHtydWb/B2QzNgKleXYj0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ahZjYZd3WQrDOjL63eIHrjxsuLWpEcyqfKuglZIP9FsN9ae0ao4UOJym4edsvpJ/H
	 OmPrYqVZ2YV4ht7o8Tk0m5l4AlVG66FDXNFrvoS5ZjSdvFtmHlswx9iXc4lgiEM0pr
	 4I4tWgxhnK7uhJfXB0d6r/CZu8SNEoAmnGb5+d8kPg5bF0N2in2S2HuZ8rC/Up3lRm
	 8NreSW5Nw09jPFo1S4tKRf5QA6Kep/ROesQnmfQQxuumLfgA5vbIl3Qac2Hyu4bENp
	 dML/IVR6oFb6a3pKHKmONc5zVH7MmnvqRdEgNre3FDO5fneLxchr6irvxAA4k5xPKs
	 //BcbXUJ88uEw==
Message-ID: <sashiko-outbox-193929@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] soundwire: intel: Allow for dynamic assignment of
 PDIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102181042.1922005-3-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:22:12 +0000
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
- [Low] soundwire: cadence: missing kernel-doc for sdw_cdns_release_pdi() a=
nd pdi_lock
--

commit 7d3c13df44bfa3764481f78c64186b31510a9ae2
Author: Cezary Rojewski <cezary.rojewski@intel.com>

soundwire: intel: Allow for dynamic assignment of PDIs

This commit adds sdw_cdns_assign_pdi() and sdw_cdns_release_pdi() to allow
dynamic assignment and release of Cadence PDIs, along with
sdw_intel_pdi_config() to separate PDI assignment during startup from
hardware configuration during hw_params.

> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/caden=
ce_master.c
> index a0a63b76793e2..9375db9c08a2d 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
[ ... ]
> @@ -1991,6 +1993,68 @@ struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw=
_cdns *cdns,
[ ... ]
> +/**
> + * sdw_cdns_release_pdi() - Release a PDI
> + * @pdi: PDI instance
> + */
> +void sdw_cdns_release_pdi(struct sdw_bus *bus, struct sdw_cdns_pdi *pdi)
> +{
> +	struct sdw_cdns *cdns =3D bus_to_cdns(bus);
> +
> +	guard(spinlock)(&cdns->pdi_lock);
> +	pdi->assigned =3D false;
> +}
> +EXPORT_SYMBOL(sdw_cdns_release_pdi);
[ ... ]
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/caden=
ce_master.h
> index f4e41a9ab1658..f52c9cbec8a91 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
[ ... ]
> @@ -140,6 +121,7 @@ struct sdw_cdns {
>  	int num_ports;
> =20
>  	struct sdw_cdns_streams pcm;
> +	spinlock_t pdi_lock;

[Severity: Low]
Should the kernel-doc comments be updated for these additions to avoid W=3D1
build warnings? Specifically, sdw_cdns_release_pdi() in
drivers/soundwire/cadence_master.c omits the @bus parameter from its
kernel-doc header, and struct sdw_cdns in drivers/soundwire/cadence_master.h
is missing a kernel-doc entry for @pdi_lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102181042.1922=
005-1-cezary.rojewski@intel.com?part=3D2
