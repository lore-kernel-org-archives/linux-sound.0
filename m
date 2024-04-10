Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5347915D5DA
	for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 12:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712753896; cv=none; b=oA6iIkFtI9psCsW5+lwtBjA5mjKT4KZfnAs5JGituYhmB0+8MYS6XvMcXyJyMETfBAcp4BAbcy0PPZTpfnGx96IXXCbW2lREDcOJ/RNscSizmzlmUtsncNlCYTW+ouQ+CjO4q6ZfEv5PJWN9y6OgchNZa8W3VjT1RS5fi5khjkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712753896; c=relaxed/simple;
	bh=XvD5fOS/hQ7HPF9KYvW4fabBNiId/tBgRPWvKt02DhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CO+FRkstnIlMZh/8ze0LBjHKNFkQpJnJ2pzvhaHNevSkkbEnV2mJJsWqJdnygg2wtIePR3kPC2oDglb5N1fTNsj7B/GZXHy+/4CleJyWx3jUc9oc4E4CNJE8YaWlOLPNbJlhdJLxCi5Zgo6AO+a+jhfksckO5nX23DINei/iI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Qo/aNGXx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Qo/aNGXx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-346359c8785so1021230f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 10 Apr 2024 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712753892; x=1713358692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAPCyLKBSHRTWSRRoqdJH1JxTgNtm+xffvG0gyEDWQ8=;
        b=Qo/aNGXxjrUKSLafOFe4kqGTXdywcDhIyb+D2RJoIL8MoP7akMSk1Mge0BuVmQQrpE
         KwRQAWfrHVtVfWFINSlOgPAhA4f9Vfq3os839cFuU0aSfvRx6Eg4hxippPBgbyudFq6x
         IDCyhs/jxVUs0IVXIOuTcfzwyzcsD6+zACc8BeYmW2rB4H/bdfkcnn1S39SnU7dlIMuI
         1TtQ1lRl/1cys3h25u5vJJtceF4PxApK+6BQMdyDlJLwkti/hKf7DBXCtM6coIFk8AXl
         VswfYJd1FxYFhUXinHRZ1VpcHd1eOzT+heN+JdkEeUkWh0tzUoKBLhixy+yRkjM5kjfV
         fqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712753892; x=1713358692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAPCyLKBSHRTWSRRoqdJH1JxTgNtm+xffvG0gyEDWQ8=;
        b=wTA0JZF0pe4Dhv8nkzLH3TXvDDBIsO2eUWQUDyF5f1b+myNmXBT9ntl7ocFEl15r0M
         UwKxhE96xC9xdkEiCx63I3XDpT8VcsSXyqqD4CWCaIf32X1FPMGt9KIIuyuPf73H/tfA
         BnJUiea1x8O6WAwRe86ZySEh2q5rYfn25bn2xdObXvn3BTrnKTHGEnptHFUkbEa7rh45
         t/GPykYrf2NaGZgmjKjUnqw2Vniacw/mlq2UsWR47OBj7dFNHh3SPpaxOuWFcPQmtNZZ
         pJUe2zhoROmlPFLWwa1vAwFP6uwUVwSOSAA22L7zMXB3sLG/bLve/ssN8B2SsgqNyqnC
         N2fg==
X-Forwarded-Encrypted: i=1; AJvYcCV2oatfMpJf8MeDN2rGumz2mxJm6qB2wkt9IuPeaZjB4V6oNKb5jYNwvU6eyG2yo0f0PZm/kXabp53wZ7Taewut5ATOP1qdGkqVxSw=
X-Gm-Message-State: AOJu0YwIcGxOQn7ucPgXVORvn9W9fHXnGgM5MLKLmekhuBcyVLfXEdNs
	bYgSPA1GMYrB99YP53qxGtVCqMqxBz07b7hxjqXQXaw2GcRI9GhtfSd0Fghuo8Q=
X-Google-Smtp-Source: AGHT+IHfa120qRAfspKcAyRMy5PXxHlCGJzmW0vlTzwyQGnoeYFwCg8fQKa0TokP1NrBdWntPAlpFg==
X-Received: by 2002:adf:ee8c:0:b0:346:47d6:5d17 with SMTP id b12-20020adfee8c000000b0034647d65d17mr1758280wro.57.1712753891611;
        Wed, 10 Apr 2024 05:58:11 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l4-20020a5d4104000000b00343e392829dsm13404941wrp.97.2024.04.10.05.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 05:58:11 -0700 (PDT)
Message-ID: <4c43eafe-f173-4a35-962f-a5f5f020a587@baylibre.com>
Date: Wed, 10 Apr 2024 14:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/18] ASoC: mediatek: mt8188: Migrate to
 mtk_soundcard_common_probe
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
 <20240409113310.303261-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Similar changes has been done for mt8365, it works.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:32, AngeloGioacchino Del Regno wrote:
> Add mtk_soundcard_pdata platform data for the MediaTek common sound card
> probe mechanism, including a driver/soc-specific probe extension (used
> for bits that cannot be commonized  hence specific to this driver), and
> change the probe function to mtk_soundcard_common_probe.

-- 
Regards,
Alexandre
