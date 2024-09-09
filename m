Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55361B81C9
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886298; cv=none; b=Mwh7D6VTv9y0X/561gmBVmvZh56jH4YHN8hyX4EP4Mp3FANEkqqyaT0nFZm07VqCwfgah7VA61IXciUosMTB62vDQaba41kiK6v4B9oIV3KmRHErYuksstZFxBe6yokAvLLrNLvf1krmUMWHBpEn8i9zyLeBhjNxb2RInRka3Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886298; c=relaxed/simple;
	bh=rR4IPF0tQmZD15xEnTLuLzb30JEZtyDpPK6dQ65FD8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izQ7VQWzLowR1u9TNPx1RgWn9OcTCcKjJ9qAEouWgbBWifPb22n7HAVglU6b6Cc/VI2Kiq641Z1TmGHhlEZmSU4/28C/ezqC6UbGpwceuNFjslSOBr7xFf/9HICx6YI43rZ5f0aBJebNA7wuKt/rJgmptDUDNoOcm6W3LLgEuE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hZtIdZcI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hZtIdZcI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374bfc395a5so2501062f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Sep 2024 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886295; x=1726491095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aJ2Ks2SzIHWrbePz+44veAyPxFRsiZ4mtPWykrfa3RY=;
        b=hZtIdZcIGacwrqss1b/iPrFVJb26tFvQjGgm5vCiwQZoaEbo8pQXoqEonu4NsfoWL2
         u8y7gWXUSpvcFmSuwhJjCVXzNUE+/8I6ot95LTsx7Wt2NL9ajnWJrOEHT47S+79DjEy0
         RsZyjGtOfo7QRQ0omURElefOqjY9Lk2tMNm1VhkUtCTyfvgGNOeXY0nPpMNBx6qnW1Q5
         lyjkQu1ChbcPC8wsD708QuWczzs5w8fmVKYdp34smg8lvEweWBXAx6aSf+yN/06CqQ9N
         zVXhmc48WSY3C4/tq0wn2GKvrto/Utueyq0N9hQxL8TEAtWequQ/7j/27oDPThamvPoG
         UPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886295; x=1726491095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJ2Ks2SzIHWrbePz+44veAyPxFRsiZ4mtPWykrfa3RY=;
        b=sB6vIgC8HM4EWESSqmC53Tp4hR4aGgd6unvEVD4MRgFjl1ExUrwgFuv6KMruX24u/R
         KRcrRyki0BdJHaK7iEosx+xzsnTVckeTRSzewvzq+jVYGp3DqDb+hmmNKV7WIBA1fpW7
         8YGgfPhWnj42BzT9AQge7DbnOL/ObjatloFmUs2qzoiHs2sFnGgMjAClECP/6UPefQvy
         Z/78raoMbbDa099pE+BGXOxPEXYOwbaQf5lxFHJJWw4p6Ym5BIx2WN3Mv7AS6CJb/bRG
         jzQq6NyL1JzwB28yFFpOJ5yVpXW4X4/T63VEfPQNpBbczCNBq+MC2M73cj/TmN8jwTM9
         iKZw==
X-Forwarded-Encrypted: i=1; AJvYcCVnqApZEgtWOMwQvMlghDsAsusIJhCXbI43HNu4tM8mckxnyKtzkGoomuEiZJbIRdAPfHTn5P9fEbhwCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpFbdQPLWeafjhPl5rqtZxhPE1X7EnxvxR7yX4Dz6WqO/vGnw7
	W1LaR6b/CXeX5vf/C1l5SInlLibVmmqZYCrl0CKEHV1cMpCUq12oVKq0XnhLiO0=
X-Google-Smtp-Source: AGHT+IEdh2bujjJqWi9VgZ9tGPxOdGbD4BeCjn/5is4c/ki/hcUfGEw1iNBzWOGI2bFRam0XXHp2jQ==
X-Received: by 2002:adf:f78b:0:b0:374:ca0c:51b0 with SMTP id ffacd0b85a97d-378885d0348mr5147113f8f.12.1725886295003;
        Mon, 09 Sep 2024 05:51:35 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d3941sm5970616f8f.84.2024.09.09.05.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:51:34 -0700 (PDT)
Message-ID: <16decde3-f9ee-4962-8015-239c53fe9b2e@baylibre.com>
Date: Mon, 9 Sep 2024 14:51:33 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] ASoC: mt8365: Remove unused prototype for
 mt8365_afe_clk_group_48k()
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-3-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-3-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> The function is not used outside of the file it is defined and the
> equivalent function for 44.1kHz is not prototyped so remove the prototype
> for this function.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/mediatek/mt8365/mt8365-afe-common.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-common.h b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> index 1fa87e54a57f..731406e15ac7 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> +++ b/sound/soc/mediatek/mt8365/mt8365-afe-common.h
> @@ -421,7 +421,6 @@ static inline u32 AutoRstThLo(unsigned int fs)
>   	}
>   }
>   
> -bool mt8365_afe_clk_group_48k(int sample_rate);
>   bool mt8365_afe_rate_supported(unsigned int rate, unsigned int id);
>   bool mt8365_afe_channel_supported(unsigned int channel, unsigned int id);
>   
> 

-- 
Regards,
Alexandre
