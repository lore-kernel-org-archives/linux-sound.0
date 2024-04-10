Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52916E86C
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762074; cv=none; b=lQroZL5dnt3Q0INufC/giXmnrSqQ6GPbGSY7nzfbeI529WEuPcqzrp5fFA09KVyie4f6t7QjlXqWBDDuWohTPsEEvq1yxtvN8x3YGFzzen7dIfP31EpZ5O4jzGf4IShI7/SHJAUa5QFDnjLqaYEu8yw7Vlw8a74WhrYCeDmV6v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762074; c=relaxed/simple;
	bh=xJfhI9QPat0r98+lhtVmHv0dk3LFeZuD6e/my70ds9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bgoxEi+UeEYWXN0JS4PqAlEIGSnNCXWbzTxT+XKjqIvyqk2OtXoSeEomcT9/cIaK4KUpOaRQnzYnjSyOi7enRp/Ch5K64Dojq2qYz7tvi6Nom0z9DyCzc6qTAlj0btTH0uIrYNq1sk4bFyZHTgc8mxTq59kYM0WJHl32VsD0TMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b3M0VMCe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b3M0VMCe"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-343e46ec237so4099424f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712762071; x=1713366871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rTWr7zCunTSu7yV6LyAJ4TilgZ8hrFbQ0RRY5+GeIDY=;
        b=b3M0VMCepZmZP7Nl75QXw13xlqXQdDX50hWB5MSbNZ/RV0U1dGT7aJDIif7sCnjVwv
         bX+OAkbrcfggDhQ5dXxPvWQE3v+3aFt4ZnQXznZlVAgv7zCgUYsDfkAfhiG0hvI222er
         hdP4BzBhYVhzAAryhx9Ih9+0W+TGb7JWNhrHnexSsTCyF+iYMWDeHqJ4PfkDXqQ19+mL
         A7Sp0Z4457LtmPeB5PV8jznZe/36rz7V6dtQJFg8vV3C0QJg+wlbG7UIJo00+7s42PaY
         GH767zZmkvqGIK001jf2KVBVTD42rv1KKUVokLbt6QiDMJwKIBzlOk9cdK5YnCCJkhSa
         uEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762071; x=1713366871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rTWr7zCunTSu7yV6LyAJ4TilgZ8hrFbQ0RRY5+GeIDY=;
        b=NzAN/lmBIpS/BZ+OEKjryfJWwIxoAsQG5hSFoV1JxQ2rH9u3SHH6Qat25lmsvLDuyk
         /4Oe8y1lXUFgw8jluv5LTePInccriysKlMnbNHUMuLbV8zeQgkHuUgeIFh0Isd2NebtR
         DPBiVJh5Lhff4KX/qYUsOHfeRIqrkXM3w0dyNQ3X/vkOm25Swoxr6aWKTRZE0EL7aeBt
         riwcM58uOi+/6WVPKbuR9vkMdHCcEhOrqdzjrV58JyMQzLGMlLgQzLyIeFIzW5SfGsx/
         +gHsrgq0DZj4stVx8InmS/JM8SkXKUmXn6X2ARHTIGhDF54XmoTW3B/f5NGiG/06qS8k
         VNYA==
X-Forwarded-Encrypted: i=1; AJvYcCVrl7LgL32c1FCCRlYw2xoiUAWaxE6xbAKmaoBRg7TfBkltIFXYIqkMkkUdE+Ej6xRZQzQFZFf4krMiYtLuF4Tc/ClIDY+NQBdifeI=
X-Gm-Message-State: AOJu0YyvIejfCcIkHq7mBo6GbhobcD7tGJz77QgSaWJNeIyLzTJj536a
	3u2oM+EV+w1p8gejnscv0AV09sk9vb2Wzra6pQ3kB+otXl/BVYtU0XNCZQao1P4=
X-Google-Smtp-Source: AGHT+IHsg96eOL2a4LJhVDQUrGOMuFbwCCDLT+zKpSk4ARDLKr/ObMqBjfvII1zIu2uKlKh/jpN3ew==
X-Received: by 2002:a05:6000:2a5:b0:343:7b6b:dcc6 with SMTP id l5-20020a05600002a500b003437b6bdcc6mr2373938wry.30.1712762070970;
        Wed, 10 Apr 2024 08:14:30 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id d26-20020adfa35a000000b003469e7f5c52sm176322wrb.80.2024.04.10.08.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:14:30 -0700 (PDT)
Message-ID: <437bdabd-f16e-4a2d-b9c2-55c91b2e399e@baylibre.com>
Date: Wed, 10 Apr 2024 17:14:28 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/18] ASoC: mediatek: Use common mtk_afe_pcm_platform
 with common probe cb
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
 <20240409113310.303261-13-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-13-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Also done for mt8365-afe-pcm in my serie

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Since the mtk-afe-platform-driver generic mtk_afe_pcm_platform now has
> a common .probe() callback, there is no reason to keep duplicating this
> function over and over in the SoC specific AFE-PCM drivers: switch over
> to register with the common bits instead.
> 
> Note that MT8186 was left out of this because it is registering some
> extra sinegen controls in the AFE-PCM probe callback and needs extra
> cleanups to be able to use the common bits.

-- 
Regards,
Alexandre
