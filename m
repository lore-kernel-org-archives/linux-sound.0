Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9B31B5811
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886382; cv=none; b=r4zWoMaIXndbWJQl15G5VTF2F3NYotBxe7Iq+mRORe4sCaBvy4xSa/S4lSiDTsgSGjCwhjMbidLCvKuPZJck1+J/39pswLr7HGvyr1bUHQNqRSFZd+obJMzRkIeKnODOYBY9Lq1CPc9t0Fwp76HjHQqKuaphFtoNvWZ05xD5iiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886382; c=relaxed/simple;
	bh=t9DDmx6aUWGI8kEMrZaWF3DeW23cI5h0m94dxJe8fic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=puUUxw8BiONnz/CJ49pTQ/y7XqoPO6jL6iQJZ6DUpDASj85lqHnn93/2PIR7Lz5j3dMFpez6jZXHCohCWe/8gm5VwcCKnpBm/0tI/y3ihV3b78hNSgXypRQsB2YW/YCOylZX2MBrba9qxpD1pZufpDCR+fzqlIkaAamKpFZQl+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ia1aQ56v; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ia1aQ56v"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so1715085e9.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Sep 2024 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886379; x=1726491179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=763rg3ZUl+6DZJOJy5DwsZvQOJ60xrN183DDZfMyDrU=;
        b=Ia1aQ56vurqFLJyEgoCn1/9aX3lJPGe70U/Ww+LS2NJ1BRYCyJ3nfyjQVR2lk2/n97
         lfJOEv8k1WijQbPl39Pme6OhTwN6FcgQAmVbQQYPdfBFtid0xlLkD8175h8bTrTjrpRd
         H3urRjfH0xiYFvaZI3IT3+NMtmvGO4wTqgzV33TkwymzLli6VdmwQ99yy2C6OdWu/afZ
         PydHlL4iffZGmXOrEw9w+tsMKmWHVR77izEZjpUmCcSPYaCHTmiPlMqOpGWA6tzCHJ4k
         kqC9J0wvcfEpHluml7jFiY2tdPKqnXfE2ljHKNb7PA7cp4ZprVSSUlmoV+0Se6LMu2zS
         3RYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886379; x=1726491179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=763rg3ZUl+6DZJOJy5DwsZvQOJ60xrN183DDZfMyDrU=;
        b=Ghd4KQIfj8qSTSaVY14aUfHo7Efk/lexNeEIS7wzE/lfAHk/e2GAOBJL2SoGtzt6Lm
         WF0gZNAEI0qtF91e83xO0NdFc4CgFHSdFroczkFlQBOWFJnaZhBZujfybuYLl5rFmhav
         4KGloRdK7eYa+l+prfzTQyuNlT5Sji1nf2/xyIYtTF7oG5mLL4Ud7rSAL/pJjz0tuzJU
         Ivpdch3C055d9ymkjidBT3+mB9J9aaN+6RQH8d1DD4NDHGtyOHKVA0G9uBcQje7yHDtf
         /n5wDgCMZXANCyeT9lO0WM2PZmvhwJ1SPpQ4b06D6IpZwfbFvvL72PxDmvdkS2+0Pnnm
         klyw==
X-Forwarded-Encrypted: i=1; AJvYcCW1/cU4wt5m2QVnd0xweGQUBUThHaWskKhoKk51rjV467HC/5ayy1UPALLkvvxV5FAy5wG6CWgHVHi0Tg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWirdzKoBVOKWpv7h//Wn1csOp2DWAEfUn36mIEn8uur+4h7Dc
	/vXZvNTZsL+hRb8PvY3xA+ChxJD73CXsrrQFJwrB0sWFK1wVM+VwJ+G4SRmZCQM=
X-Google-Smtp-Source: AGHT+IHpDUAYZ6M9I2utE7B65i3OcZBvlzvw4You9gctJaalUrdtM/PYSMSxk8LHlM5pPU+PhOzRpw==
X-Received: by 2002:a05:600c:1ca6:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42cae76cf3bmr53395615e9.25.1725886378512;
        Mon, 09 Sep 2024 05:52:58 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956e8700sm5957292f8f.116.2024.09.09.05.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:52:58 -0700 (PDT)
Message-ID: <e461d366-ddeb-4d87-813d-9d8cb7e30238@baylibre.com>
Date: Mon, 9 Sep 2024 14:52:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] ASoC: mt8365: Remove unused variables
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
 <20240907-asoc-fix-mt8365-build-v1-5-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-5-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 07/09/2024 02:53, Mark Brown wrote:
> Silence compiler warnings by removing unused variables.

-- 
Regards,
Alexandre
