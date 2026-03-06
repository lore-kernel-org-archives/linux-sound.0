Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18FD33F5B1;
	Fri,  6 Mar 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772788725; cv=none; b=EwBrgyu2v1IIavf28CmYTSsHyWNJ40idC2hwIhdRLCcTL2lgHhJUXRrM9xvhABrxW9SaAdS30j5PtocKxN4SifkFULgzO5ISr5wBgUQWpOfO7ZN557lp2iLbke0ucOBQ9P8aHpEdetTcag+nQZQBi07nLHjnEiFPYSJ6OMu+9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772788725; c=relaxed/simple;
	bh=OH702f+DlOSO+MCKoOLFzipEKjfAn3TXofGaFrLTaQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C7BgSTVtwH2H6L0xffesIapUUluncqdHgjd4DYSA1EGPgQoHo40ay4UAdeEGA5rbwoIWzj2s0ds9xu/JjyKqkMV4taaQD/r5stffNAqio2TthE3VFXe3NKmDo55PnzCilc8qMyT2L5aGUblSRLAdXfPrCWO//nLCnn7VLpm0k3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aQa1sWd2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aQa1sWd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772788721;
	bh=OH702f+DlOSO+MCKoOLFzipEKjfAn3TXofGaFrLTaQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aQa1sWd2F8WTv1R+3RswL7qWrKeVIWzE2vX3Cg+7Ivx3TJuCLZIkf7zjgpblReBtu
	 iep1moGyo0iCJFd9jL6w/BUkDeKLNxsajQolbE28XCR7HLEqapCEKHqCbkdLFklcni
	 /BhNZNbHfWOmiiDvN4Nvn+jX4EwHpXVk8YNaZOmSM8Y3OxUIvufH+4s7G432o9F6VG
	 5tLq/lNoQBJilutcyClY3N1V4Iu/2rrt/+u0+lZifvMNIvDgBbiR4OxwDLu3Wqyje2
	 KwCcxdAEvCKA5Emi+uvO1pcgVemR8leQMVtdxWUMHcDPcdh6bCw2C5PmU9hD8e9F0+
	 Y8fh0QkPcc3fw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D3AE817E04DC;
	Fri,  6 Mar 2026 10:18:40 +0100 (CET)
Message-ID: <e179c650-5d0e-4004-a983-e3b63d4c28c5@collabora.com>
Date: Fri, 6 Mar 2026 10:18:40 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com,
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
 <CAL_JsqL=zAqyVDAP_B1VW1FWKoS9OEdTNZiZabSNxDscBryYgw@mail.gmail.com>
 <0ccca45c-34af-4d38-ad0f-6cd080f2882d@collabora.com>
 <0b3a1fa9-4024-44b9-a42f-6b82862e2ac9@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0b3a1fa9-4024-44b9-a42f-6b82862e2ac9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/03/26 10:10, Krzysztof Kozlowski ha scritto:
> On 10/02/2026 15:28, AngeloGioacchino Del Regno wrote:
>>>> + - if:
>>>> +     properties:
>>>> +       compatible:
>>>> +         contains:
>>>> +           const: mediatek,mt8192-audsys
>>>> +   then:
>>>> +     properties:
>>>> +       audio-controller:
>>>> +         $ref: /schemas/sound/mt8192-afe-pcm.yaml#
>>>> +
>>>>
>>>
>>> Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
>>> [warning] too many blank lines (2 > 1) (empty-lines)
>>>
>>> Please fix as these are warnings in linux-next now.
>>>
>>
>> Ack. Sorry for the mistakes. Not sure how this happened.
>>
>> Let me see when I can get some minutes to get this addressed.
>>
> 
> This was 2 weeks ago.
> 
> Warning is still there in next. Please revert your patch or take the fix
> from mailing list, but anyway this should not be broken for two weeks.
> 
It's done. Sorry for the wait, but it's been extremely busy days around here.

Cheers,
Angelo
