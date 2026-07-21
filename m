Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFBB3FA5C8
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 09:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625719; cv=none; b=WOv3WcwnYHOmB0Ey08fzrMu5IWj8yu70aYc0GecYiV6roovZTaNOHjQOOQg2CrEJ/UpLeGAVgTTDkaPbFL0UVFUPc3Crqou3ITNCo11NOCM86Ga4GDnTZ0lsqll1Idzj+0Dcg4coL2OiEY3MWG5stypZgJqBZQORy59KR4DEfKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625719; c=relaxed/simple;
	bh=erEGNGVLEIxDkPO6zBTgGI3KJKyGhoY67y0vl9j6x84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUbv7HSaBEITQ+7MjBsX1vQobEu2skLLSZAexw8ZKbKxYZ9+eud7oi2qtpnV3ghc6iabEm2SK77gIKxpd+scrYQsU0qf+df8NkXgSp3XR5y7QJsM144TVmG/yDqOQxvl53eLNLoXFZw/G+0sehm7XW/XGi+aiTI7Ihfc4Gf9Zbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KfhF4bEa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="KfhF4bEa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784625714;
	bh=erEGNGVLEIxDkPO6zBTgGI3KJKyGhoY67y0vl9j6x84=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KfhF4bEaynKj1/w6EFnk/y0cfay9TU82h1NZr440/4ECY+S30klxfJ8mgfgtNFi8v
	 QuAaNdaM708kWDzouvnXXNPu80WJLFi+/NuXpC16E2RKX4klusHBxLfN3IVCMb2lpf
	 bzDd+2uHthQH4q8DPXWgIHO81u9vlTY9+jqxuCvkZEXnktihZA8UCjRlMU4xFyFPf6
	 jmZstNm5dAsCjfq9ugSRWZ8pYTqum9FnR7t7Q2EBjK5kyyKuQCkk2T9wPvg/Q6rIiQ
	 /3xKfPEcU4dbhm/L3RclO3wCRBvjlRg+3TZ7Cc/flmQUP8c5iCFp+AbcxgYoDv0tRk
	 yeL1m5a/P7r6g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64A3317E0A46;
	Tue, 21 Jul 2026 11:21:54 +0200 (CEST)
Message-ID: <323095f5-0006-4473-925f-2e2f1febf8de@collabora.com>
Date: Tue, 21 Jul 2026 11:21:54 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: mediatek: preparation for Card capsuling
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Darren Ye <darren.ye@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
References: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <8733xdjfdq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 03:33, Kuninori Morimoto wrote:
> 
> Hi Mediatek developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup mediatek drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> 

Entire series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> Kuninori Morimoto (4):
>    ASoC: mediatek: mt8192-mt6359-rt1015-rt5682: use *dev in mt8192_mt6359_card_set_be_link()
>    ASoC: mediatek: common/mtk-dsp-sof-common: use for_each_card_prelinks()
>    ASoC: mediatek: mt8196-nau8825: remove unnecessary declaration
>    ASoC: mediatek: mt8365-mt6357: remove useless assignment
> 
>   sound/soc/mediatek/common/mtk-dsp-sof-common.c       |  7 ++++---
>   .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 12 ++++++------
>   sound/soc/mediatek/mt8196/mt8196-nau8825.c           |  2 --
>   sound/soc/mediatek/mt8365/mt8365-mt6357.c            |  1 -
>   4 files changed, 10 insertions(+), 12 deletions(-)
> 
