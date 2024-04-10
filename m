Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422A9158DD4
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712752969; cv=none; b=WJQFfWj+sq7lG5S6w+x27f09stBDfjuXUECSpsyFnynD7XqcEui8JVeLyCKAjG1lF9gIuKAQfBQl4Nru3isW+w9IGa8qkuHnCszL4+PYrLYd7zjKsdqoEFqSuCOW6rop27oPPRW5rRJEa67Y9d8A2axnyzEvBjjIjvSvCU0oFOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712752969; c=relaxed/simple;
	bh=7ARq7CtkufCoSJtbuCqkwQo/bhan5+eThkCUX7hkdd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBHZ37/SarFUUbopEmi1zTf1WEas4ZDlsu3P68ifwkCVB1c+T5NB275BLPqc/Mr3t0hmL6ZquOSvqg1HMsVM3/ox4LHEwqiToK+j71EMFSUsF6aPtlbT4ozgLrQ01bU2YI57gklYpf4eL00mbPR7TYTZtPJwtviTcSpHDu9uYz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t/WQ/oAT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t/WQ/oAT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34175878e3cso4784097f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712752965; x=1713357765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s6I23qc5vtFfA69hwi5DwiHXGwJhre0eHDpmfJgJbQg=;
        b=t/WQ/oATq6j2hHFcs4vT2QzflFqIi8geQYcDv6WyoEZ32loD5v9i4mwJISEjPy0fl5
         yczxNzfJoHeS9NvutCsXI1fle3m3nyM1fvJ7P3UXmlKJdP+9XkarWArH9/6NuwLQ80ZL
         5HLdwnltZ4B1DYgXdkZziLdU86q2tLoXqG8EIUDHaLBq5IB3B1EWrrniox8SEKDapvhJ
         ki9uR5JlgLhTS6DgDwGfS9VQmGBlpXjXRxozrMG0aTZub7zYFVVWhIFSikhi2Hs1vvU1
         mxo1OWdXCTI3xNG+dYJZxsoAxIbYQHCC4BN48qbh2IEE5NxmCYYm2Yf9LDFQcKSCEPZ8
         rw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712752965; x=1713357765;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s6I23qc5vtFfA69hwi5DwiHXGwJhre0eHDpmfJgJbQg=;
        b=QA+IUJcEhnULV7hk1gfUxa3mbV0nYzFM9auiRrQ39WUzmDrsHUfOgyqbza2j3SepFk
         WMBCvQkN0MeyBMnpHJoPFQD/lN5Gx4B1vAharV92q2t7Rp6azqskz6bAQvS8rXu3pDcR
         BsfvvQubODVDF6qYA4F/BXQZWjRm9ibnA5R8dwENJDntaeb8p4mIQFPOKCjTUBZJxUC1
         sdBldSrpp8D/nnlXkfP2Ludxp09q24TxuUBAz6AbSfNDjGiy2nNK1UA9V/K6PzMaQ/hv
         O12bvXW4qLTcPAt8PAqW1ag7bdrGTlixnUbAEZ215LWWAn6qXnlhL3CPnV1lPC6HpYPw
         y7JA==
X-Forwarded-Encrypted: i=1; AJvYcCVlkVrcWk6d0qcfJYVcDLzNaLNflLhvTLIj5njdFOQE41FxRg7oldMkWuRwsqhOFp4CJglDLDGhPrhpIuzZgJoxPjrx1pUJWh4roFs=
X-Gm-Message-State: AOJu0YxGu1mK9D/eBtobEa7KOZ3/JiQLfUzAYVKYorunMXp6tkVnvnhq
	iiVGH38wcQp+9XbOomoz2TJSPb8QYIsVgQs75JPHK7dxaZuLFc0+ijagzAVFM0I=
X-Google-Smtp-Source: AGHT+IGLIzv68MN2vk07ucSWBnQpWhzyZz3+w9au/M9OjAewrobTeMyExcozFPeCXalIxP/pVJHGdA==
X-Received: by 2002:a5d:64c3:0:b0:33e:19ae:3716 with SMTP id f3-20020a5d64c3000000b0033e19ae3716mr2319146wri.11.1712752965497;
        Wed, 10 Apr 2024 05:42:45 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b00341ba91c1f5sm13702046wrt.102.2024.04.10.05.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:42:45 -0700 (PDT)
Message-ID: <6ae5ed54-4205-46ae-b903-188a8138eaa4@baylibre.com>
Date: Wed, 10 Apr 2024 14:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] ASoC: mediatek: Add common machine soundcard
 driver probe mechanism
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Add a common machine soundcard driver probe function that supports both
> DSP and AFE-direct usecases and also provides a hook for legacy machine
> soundcard driver probe mechanisms.
> 
> Note that the hook is there because, even for legacy probe, a lot of the
> actual code can still be commonized, hence still reducing duplication
> for the legacy devicetree retrocompatibility cases.
> 
> This common probe function deprecates all of the inconsistent previous
> probe mechanisms and aims to settle all of the MediaTek card drivers on
> consistent and common devicetree properties describing wanted DAIs,
> device specific DAI configuration and DAI links to codecs found on
> each device/board.

-- 
Regards,
Alexandre
