Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643103;
	b=mZB0NhD6B9GmMeTPD24kAevnpQDdHlh0fvWyYPLKwu5SbnWaNLmNRBFivMSn5FVGMSmn
	 uTiGvZoI2EoOxleqMik5XGguW46Lb3HMKRr2yuS8EHG4CwZtQq67hzPoHwFTf5cOYKyWy
	 bF+ADs+Fd35U0b7lBDw4b12Mq0rlYe/wOgnJWmaPgjTdwzbVNFhFf6p6fELuDBMJTu6Tn
	 j57GtPowowiCRh2ho5MqcjAYsRZv3zkPcW2moBXODcWbYEeJRdC6A18FKHY9+qLqTBEry
	 qUShz2D2f2CeowDaoY2j+4SVJpMVYBOKOvwixmLwn9QzMqwPrDe0tCs+MnY+HCFOnjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643103;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oSBUlMWVG6bZx0KUQkYnlDJyfFUNTlIgsc8ZRL+yE5I=;
	b=epSlSQP2zcKjXJ7BHkSN1rp5deZqZgRFsL8UiI+2REfAUp8VS3bVrhkmcVu84k3iQdgp
	 UgBBj2exckTwLl55sOk56Wc0TsXkcI2ugaaRtWPonO7jf0+nyBKNRHqL3ZskLcEueV6wo
	 3xhoIQHuUk35UjM/zgZM6WSwacfEQ46uZTRZI0GZBSw6T/dbS3/Bd3sZ1IlhZbeFNpYRE
	 YaYvpkvFcW49lGj6Fvui2Plh8h6pPjGnsp8PpDqeOqK3WDWnBTNtlqucD3LuiV762QNBt
	 Fa1p+PmJ+ntOW83zmU7GMIwk0nEPqvkQ7zDjzaactmHkv25qKhPbxR/hW4k4cWVhLdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jp6khYq+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CA4606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jp6khYq+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52411F00A16;
	Mon,  2 Nov 2026 18:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643103;
	bh=oSBUlMWVG6bZx0KUQkYnlDJyfFUNTlIgsc8ZRL+yE5I=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=jp6khYq+3pw5EJ2TeVID88BH6iW2ZfXzSAAUfxeZt1/G9hrgyjHVSzWtWFCPq49mZ
	 m86ECy8Xan86p22KNhhDoClrtZcdRAGhciyiLrWSBhHvdCMeVB7kOKbZO41L2nLe1B
	 JYLUNOC7X1J5M8ErJBM2yVG/X8XS5ilHmqBeZiB48BUE8NagNstN/O341cf+tR/8lP
	 PKufCV/mQwstyht/+3igntX6tOo4KYOoar9dc3Y2Rcnp46m9zX4ed0eDJH7ZcFMbfW
	 SNR3y6Riq33gN0TUVAEpYcdXW9GUVLVExRlbaU8psN8MtCSDAwViwsqjwPUuLv933I
	 L6GXpYeqb2d4g==
Message-ID: <sashiko-outbox-193915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/7] ASoC: Intel: avs: Expose common PCM functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102181042.1922005-7-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-7-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:11:42 +0000
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
- [Low] ASoC: Intel: avs: duplicate header includes in pcm.h
--

commit 9d263961a528ee317534dc04cdc45b51e6460ff0
Author: Cezary Rojewski <cezary.rojewski@intel.com>

ASoC: Intel: avs: Expose common PCM functions

This commit moves struct avs_dma_data and declarations for common DAI and
component registration functions into sound/soc/intel/avs/pcm.h so that PCM
operations can be split across multiple files.

> diff --git a/sound/soc/intel/avs/pcm.h b/sound/soc/intel/avs/pcm.h
> index 0f3615c903982..ac127ade4ca1c 100644
> --- a/sound/soc/intel/avs/pcm.h
> +++ b/sound/soc/intel/avs/pcm.h
> @@ -9,8 +9,57 @@
>  #ifndef __SOUND_SOC_INTEL_AVS_PCM_H
>  #define __SOUND_SOC_INTEL_AVS_PCM_H
> =20
> +#include <linux/device.h>
> +#include <sound/hdaudio_ext.h>
>  #include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc-acpi.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc-acpi.h>

[Severity: Low]
This isn't a bug, but in sound/soc/intel/avs/pcm.h under
__SOUND_SOC_INTEL_AVS_PCM_H, sound/pcm_params.h and sound/soc-acpi.h are
included twice in a row. Could the duplicate #include directives be
removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102181042.1922=
005-1-cezary.rojewski@intel.com?part=3D6
