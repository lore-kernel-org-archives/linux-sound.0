Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFE3A0B16;
	Thu, 15 Jan 2026 13:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485346; cv=none; b=qf9jj2YLtswNGDp2jGxzYm/2Z5T1k2mXEKAyyqSwqhyfRAv8xRqibvZClotYnFiAtWC8hOeX/3rz/RgPVISPCXqxNC6C3+j2y1DLbmKXL0gFLlLqZX/KXOdkC5vKlAAxiUUxkyAM6Le0WvcVEuieEW4AM4F3aI28jRjlLHNapSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485346; c=relaxed/simple;
	bh=eRwBxsCfbUvrq6+iEFeXt1XljTAEoWXuaPhjITIfx6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vD0qlcqlxS7NFx0tTwL7UrgV2JnWojDciPmlwT4lFuPb/Cg3srDyar78XuJ6ty7M6jT0RW9jkUZNfm8Un/KAc7SLM2fqMrk7XGhC8c3+W60Myr2IzX+5fCXVZrYD5pKK6j6gtM+0MW32Qj1OEwjGbezthhAmjOG7oPWVcR3WQns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xg24JJpP; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xg24JJpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768485343;
	bh=eRwBxsCfbUvrq6+iEFeXt1XljTAEoWXuaPhjITIfx6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xg24JJpPFG5FrlZTiysZ0Z46F3ud+UNUX/sRKL3uN1krMVulN+N47XfehTpuEewAr
	 Q1apP6Ai1uLSVvga3AklmeQ079aUzTLkfqgKZ2tx9MYvRKOWDFw1VfWqNHdzhTmJGY
	 JLetjsVsSiw+jRIGut6I4VXBkrHDgPGufZNjK3naQhLqUjn38b/ksbV9IHSKJ99lzL
	 6sAUH/5uMO5/M5Oy49Fq50A/TWAKd9SfaFC9p9fZ7Hrx+atzoR3J49abmlo/daK8r2
	 UIQJtz5hZlYbcgdfs/e0zwTMoqyCPBYkVLJZWGYfX1GQ90ikBHnK5C1KKYP9Y408dq
	 CqN2rYLuWrwxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6128F17E0CF3;
	Thu, 15 Jan 2026 14:55:42 +0100 (CET)
Message-ID: <60bb622a-f88a-46ce-b835-bbefe47509bc@collabora.com>
Date: Thu, 15 Jan 2026 14:55:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add Winbond
 W25Q(32/64/128/256)JWM
To: Pratyush Yadav <pratyush@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 tudor.ambarus@linaro.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, lgirdwood@gmail.com, broonie@kernel.org,
 matthias.bgg@gmail.com, julien.massot@collabora.com,
 eugen.hristev@linaro.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
 <2vxz5x93818a.fsf@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2vxz5x93818a.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/01/26 14:16, Pratyush Yadav ha scritto:
> On Thu, Jan 15 2026, AngeloGioacchino Del Regno wrote:
> 
>> Add Winbond W25Q32JWM, W25Q64JWM, W25Q128JWM, W25Q256JWM to the
>> allowed compatible strings pattern.
>>
>> This also resolves a dtbs_check warning happening on all of the
>> MediaTek MT8192 Chromebooks devicetrees (for winbond,w25q64jwm).
> 
> We normally don't allow adding any more device-specific compatibles.
> This list here is only for legacy DTS. You should be using
> "jedec,spi-nor" in your device trees.
> 

Ah, okay, didn't know that.

That's actually making things easier for me honestly as removing the
model string is a 10 seconds change, so I'm totally happy with that.

Ignore this commit then.

Thanks!
Angelo

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> index 587af4968255..2db446c9ca9b 100644
>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>> @@ -29,7 +29,7 @@ properties:
>>                 (sst,)?sst26wf016b|\
>>                 (sst,)?sst25wf(040b|080)|\
>>                 winbond,w25x(80|32)|\
>> -              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
>> +              (winbond,)?w25q(16|32(w|dw)?|64(dw|jwm)?|80bl|128(fw|jwm)?|256(jwm)?))$"
>>             - const: jedec,spi-nor
>>         - items:
>>             - enum:
> 


