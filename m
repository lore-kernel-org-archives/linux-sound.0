Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB1136AB5C;
	Tue, 17 Feb 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771339056; cv=none; b=uS/1kZV56dGhaRBQH1pTvC1SMPzFulRWYhP2XNrYHk1CCWYFOGuIM5kQ/CDq7EjQHb+T4Lwn+UuPU/sZdDoH3lLWWjxogRbgZzLRUY3f+f71PIM+6lRCFmqarlSWmpCFtZN9Lbk/N7InQFKP6MIRGr9KGEPjNvA2G/oC/GMocrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771339056; c=relaxed/simple;
	bh=aO28r3QB+6YfjYl+IcrxEpimgFoGlSsIX39DwwxMXwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VVuCkJFSLLyPS9Lp7lQ8b5OP69+E6PBJWYHK5An+4md+93CirDai23jfwnKyNE715H39CcKm0S/iiCgokhow64OZlEAYkTV7ShrsaMHJFCh+8UyO3e/kllbHL8QXnCqIdUP1amQOk/tWN6fqTIcFVvS4EFm/KzqYRmrNiXe00d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBdcmxDd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBdcmxDd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D9C1C4CEF7;
	Tue, 17 Feb 2026 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771339056;
	bh=aO28r3QB+6YfjYl+IcrxEpimgFoGlSsIX39DwwxMXwU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KBdcmxDdvFoh9joLeC29TYGUNfOIaREx5QS4xgHYu975JddBRDynb3ka4p+tZH5el
	 5azUHoITd4mNBwiQot5ikFjs8YAYsBS2PB/sIMoLeYvYYX7TTWs2blsdvvtBd/6TWO
	 1N+gC05vCbpYWh0LFg9nB67MNvXgRrpKQIaYN2rwV9VcdsX9orl/ykkljKkcGkcrJt
	 GlQl36O8casFdFakkLjHm9Mh/vck5XQvYXJsGcbyFwj7S0AyLdnNWxwuIbbjLfYt+z
	 A1SPhPfty3vCmXIl5FbV7ZYIBXl9yJ5H0wdW4F/GGJtU//dwXqrD+swa9qq0ImYQmP
	 6VK4A08WL1PRg==
Message-ID: <07d644eb-243b-4399-9153-36f1a4dcbc26@kernel.org>
Date: Tue, 17 Feb 2026 08:37:34 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: Add DMIC support for the AMD RPL platform
To: Mingyou Chen <qby140326@gmail.com>, vijendar.mukunda@amd.com
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 venkataprasad.potturu@amd.com, Sunil-kumar.Dommati@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213055904.110256-1-qby140326@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260213055904.110256-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/26 11:59 PM, Mingyou Chen wrote:
> v2:
>    - Reverse ACP CONFIG PIN from 10 to 14 for rpl
>    - Remove the rpl folder
> v3:
>    - Remove rpl configuration from Kconfig and Makefile
> v4:
>    - Handle separate switch case for RPL platform (ACP Pin config)
> v5:
>    - Remove clangd generated compiler_attributes.h include statement
> v6:
>    - Fix typo issue ("reverse" -> "reserve")
> 
> Mingyou Chen (3):
>    ASoC: Add DMIC support for the AMD RPL platform
>    ASoC: Drop RPL driver
>    ASoC: Add quirk for Lecoo Bellator N176
> 
>   sound/soc/amd/Kconfig                         |  10 -
>   sound/soc/amd/Makefile                        |   1 -
>   sound/soc/amd/rpl/Makefile                    |   5 -
>   sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
>   sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
>   .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
>   sound/soc/amd/yc/acp6x-mach.c                 |   7 +
>   sound/soc/amd/yc/pci-acp6x.c                  |  12 +
>   8 files changed, 19 insertions(+), 309 deletions(-)
>   delete mode 100644 sound/soc/amd/rpl/Makefile
>   delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
>   delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
>   delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> 

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
