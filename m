Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05541B81D5
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 12:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886242; cv=none; b=HhcwXKcDWl8MfWvmmbmMx6viiuE78OjNoKfef5xzZtv3Ko4YTbaO5YUeGsuygOqVfePxHhscvTj/EKCJJU7LSn73znMgeO7Ol1te/Ln+/jj4hxJL26yPhIDHAzUaU53/sUQFA5zieKgwS/tmFNyW66fSHhQZLqJseODMBXO6uSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886242; c=relaxed/simple;
	bh=ZnFGLD5uhJ1WVlWe+pOmEAoMkQoApzFgdDy8C00RIjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X9fswV/XcFXziJV5tXpJuZg9NVAz03CyZHBghWadz7VjDT05y+CKZN2R7Ne9SJ04c3ST/NgQr5R6Lpp//LzR0CL2N+8SZQ/r9dhp9fRl93W7LYDFRarWH3mEyWdJEJECOkwdB5j+ju9tMqkjewMwyIfMFpvRV3/NRMhZQCJ5jGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dHk5jlWv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dHk5jlWv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so39249655e9.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Sep 2024 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886238; x=1726491038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qu8AiuVNDMFZsHKbDBADYE3SgSVd3DKO/R+5KxRr+yo=;
        b=dHk5jlWvfU85RpUNEUhrLA1oFZYB6YcW1xkcgAese3b6eOFSzsM52ifwFC1yXfFaDK
         TL4v5ICruK99vUXzs4gesJudR45/oVQYNVZQQ3m91EVU+HTqSniq9sYRtKuLsKGS/W88
         3oWBb/cNGyaJq/PnoYVXP8uzwDeXjVWATPfKLLmh3cUKWAKcxiICiWY9OK53RRCcWQq3
         t2CeO/mQfCCnvZxToZJ93Z+p5CLyc9NVTzauHkK8PRah/eYcFbQqBvt1suSI4AHdAPwM
         Rb6IKWQyt5tJeFskkJb20J/1yhYaNT6NlghayC7iMI/Q8S0qjc+8A4LeZ6WS7ova/bUq
         Hs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886238; x=1726491038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu8AiuVNDMFZsHKbDBADYE3SgSVd3DKO/R+5KxRr+yo=;
        b=WPQpm0T6K2G0eQs2Z7u3yJv5AmDcT+vF0oHds98orXSZyD7QAZKtxcDxKzxFp51iQw
         DLQFJYbSGNJKhvRbzkFctr3KWA9b4HwuioDyIEMzaax2KDWO+Qgvzzw0kneIvUDHULvd
         xgTNwZn0j5rbIZmGHbYB8EylHRNkoglgeEnyQIJx28p+VOqbNx7uRKU6d8vYneG4ZqDX
         sOJ5UXDwL5UlvYJTvjXoadseIE8P9Ob/A6qFZqOwm2Vi3MMkR0UKk50YUF0WELtHTAYa
         qyxhbvuIMZ5sAOcvZEsjPkAMQw3xhkiUzKw1TV4OsJiYmNof8Vyis2mGPpCh+Gy1E96h
         w4EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmhb6CAW+CKiW2KofSatJvNj3BhMorCsa4wfvhdTDYqKWjE6Knqu1JjbE5dmQzM1B8/LMPkdjSisk5+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOJAOyvRr9tLIfSNxTgUEOpZyg2Jkru/mXH1iefkqMvir/QnIs
	j/VE8SeQhylu9DR3vREc+eso5MxIDoeyCZZDERGlYxpbl5jZ1d2pVl0XuXlOePw=
X-Google-Smtp-Source: AGHT+IGw51hUzdlE3S3wJzKx6lcv6PmKcfrveOD7e0k3WsT4cO9ATJhlJsGkwOYchIgV3PaN0zdPpg==
X-Received: by 2002:a5d:47ab:0:b0:374:c122:e8b8 with SMTP id ffacd0b85a97d-378949ef675mr5281675f8f.11.1725886238075;
        Mon, 09 Sep 2024 05:50:38 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564af1asm5946522f8f.18.2024.09.09.05.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:50:37 -0700 (PDT)
Message-ID: <28afca15-561e-4712-858d-e3aaf130c72c@baylibre.com>
Date: Mon, 9 Sep 2024 14:50:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] ASoC: mt8365: Open code BIT() to avoid spurious
 warnings
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-1-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-1-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> The mt8365 driver uses bits.h to define bitfields but BIT() uses unsigned
> long constants so does not play well with being bitwise negated and
> converted to an unsigned int, the compiler complains about width reduction
> on a number of architectures. Just open code the shifting to avoid the
> issue.
> 
> Generated with s/BIT(/(1U << /

-- 
Regards,
Alexandre
