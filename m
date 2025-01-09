Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F01215074
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427091; cv=none; b=hk//wPZKzuc+W9o/C6rbMs9IAcYrcUbuhp8yrLF7vCRnpci0uC2tELAVTcTRCnqmMupTTqmwBzNu/5FwpWhTHvp7zOfkW9PiRrqu31pfA9D3vyAbCTt434zSdUnPiAuz6FJnzfJo2y4JeMHsuH2QUSjqpm/UaGc/eGa8ftifMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427091; c=relaxed/simple;
	bh=TJAgWJCEJ4P7o1EGqvukdNyIq3WL/hT+AFTFQHWTOVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YPXUO4T+GZ97fmDlmmuSpMkXzRVBxJ5MSCwi2U4QonVTGXR/8X0k0QDqEsnD/vG5ddJAs2L0Fihr2kM+udGrSqd3ORbPrloS1q5otsf8VDDYhSbqWjzhtx3/Qo9KxD2LDK9SPfeQfkMIndfgD8iYdguFZWx7KLUnabL6xvDtuRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=ykwhrf1q; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="ykwhrf1q"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 961B52A02;
	Thu,  9 Jan 2025 13:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 961B52A02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1736426544; bh=9GWj9vhsci9fdip4wX9KynvL6gNkSnIt+3/YqMkbTZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ykwhrf1qLyTbbpOoAwEVCEV7Lxz4i27oylpfog2wBnV0CybvrrCRJp6XZupjuUECW
	 cZqiZuWarH8ZWqTWoNZdeViP+jzrdgVTbW81nNMzdxmQYc5Z9hQ9IJd/CvUlNEyy7Q
	 35Bx/uyoIPOJi2zlSiej21Tk1TdWxg9f4F7W5stM=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Thu,  9 Jan 2025 13:42:19 +0100 (CET)
Message-ID: <99e4c4cc-d380-44a1-b81b-92a20435bf5d@perex.cz>
Date: Thu, 9 Jan 2025 13:42:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx()
 helpers
To: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
References: <20250109125204.3668961-1-cezary.rojewski@intel.com>
 <20250109125204.3668961-2-cezary.rojewski@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <20250109125204.3668961-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09. 01. 25 13:52, Cezary Rojewski wrote:
> The snd_hdac_adsp_xxx() wrap snd_hdac_reg_xxx() helpers to simplify
> register access for AudioDSP drivers e.g.: the avs-driver. Byte- and
> word-variants of said helps do not expand to bare readx/writex()
> operations but functions instead and, due to pointer type
> incompatibility, cause compilation to fail.
> 
> As AudioDSP drivers e.g.: the avs-driver utilize struct hda_bus (and
> thus struct hdac_bus) as the base structure, add casts to address the
> problem.
> 
> Fixes: c19bd02e9029 ("ALSA: hda: Add helper macros for DSP capable devices")
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   include/sound/hdaudio_ext.h | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
> index 957295364a5e..79a010dd0062 100644
> --- a/include/sound/hdaudio_ext.h
> +++ b/include/sound/hdaudio_ext.h
> @@ -120,21 +120,21 @@ int snd_hdac_ext_bus_link_put(struct hdac_bus *bus, struct hdac_ext_link *hlink)
>   void snd_hdac_ext_bus_link_power(struct hdac_device *codec, bool enable);
>   
>   #define snd_hdac_adsp_writeb(chip, reg, value) \
> -	snd_hdac_reg_writeb(chip, (chip)->dsp_ba + (reg), value)
> +	snd_hdac_reg_writeb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>   #define snd_hdac_adsp_readb(chip, reg) \
> -	snd_hdac_reg_readb(chip, (chip)->dsp_ba + (reg))
> +	snd_hdac_reg_readb((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>   #define snd_hdac_adsp_writew(chip, reg, value) \
> -	snd_hdac_reg_writew(chip, (chip)->dsp_ba + (reg), value)
> +	snd_hdac_reg_writew((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>   #define snd_hdac_adsp_readw(chip, reg) \
> -	snd_hdac_reg_readw(chip, (chip)->dsp_ba + (reg))
> +	snd_hdac_reg_readw((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>   #define snd_hdac_adsp_writel(chip, reg, value) \
> -	snd_hdac_reg_writel(chip, (chip)->dsp_ba + (reg), value)
> +	snd_hdac_reg_writel((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>   #define snd_hdac_adsp_readl(chip, reg) \
> -	snd_hdac_reg_readl(chip, (chip)->dsp_ba + (reg))
> +	snd_hdac_reg_readl((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>   #define snd_hdac_adsp_writeq(chip, reg, value) \
> -	snd_hdac_reg_writeq(chip, (chip)->dsp_ba + (reg), value)
> +	snd_hdac_reg_writeq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg), value)
>   #define snd_hdac_adsp_readq(chip, reg) \
> -	snd_hdac_reg_readq(chip, (chip)->dsp_ba + (reg))
> +	snd_hdac_reg_readq((struct hdac_bus *)(chip), (chip)->dsp_ba + (reg))
>   
>   #define snd_hdac_adsp_updateb(chip, reg, mask, val) \
>   	snd_hdac_adsp_writeb(chip, reg, \


I'm not sure, if this change is wanted. The passed pointer validation from the 
compiler side is lost with retyping.

Perhaps, it would be better to create another set of defines for other 
structure pointers.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
