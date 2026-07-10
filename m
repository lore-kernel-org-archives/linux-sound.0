Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B84740757B
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783686041; cv=none; b=G3HW7Fr3CRV5+OIwrJaaXpGGgbtp8sLYm8lgLB6TQ03Ond/bxghHaqQzDrYw1g0aVeIAoH7C7DYcXf+ANrrHpwg9wy/+BKlYYwBhFlqE9ze1fW81aJ26EkH87BBxnRJfTnhJpglXj57bs7zZW2McEDpfF8JsK3ImSh8+0qWffMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783686041; c=relaxed/simple;
	bh=uQtlFmlEDrsnmnfiKvO/WS+vVaEjJppi7RQvR+UUIdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cFXJWhF03xdshRnUxVUL/SK7JdsZfcOsI0JSj4FprxP/FrsnH7PEYE68XJZ+GYsN1lnH4ATPFcD8JbVTxZy5p10weMONUXG5OdETBlfpT9ZduEAN+Dcs02r+zJE12lBLyY4MFZAxUXDBwFDTdmYMqXJuPPc5WaKIUJIba1LGcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQiWD8e7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQiWD8e7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso7310885e9.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 05:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783686039; x=1784290839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3zreGUqgwkkgdfOKXxPfkgWWWCEAQ09f5w1+bh6RDY=;
        b=YQiWD8e7bRBFjwAwYBI3n+zrgtlTDhnQXNSVe0D7toJbhg8muTHHx6Hdhmev7OO7KG
         AeAfeYpcgjrID5OxcmdqXcIyE3TrdNmegxZK0ThCS5PKfOal2N0PB+w4Fu6f3/jiNBZg
         baeUDMdsCFsGRS0tghpW9+sLSGirFPXdtkBrfNw6GjApqDNkE1wNpWxl4jKfjXCFpAQ+
         peHewx+uuxU6tNK3+D9sY/eNgMpuciOlFfbVQpE8YPaMxD79mJixU0D9k6UF9Nc0+1ra
         k0SgWKm1GqJbqbNp0IXVwVsk4sAThyGigQvFEMjKUXo9hHkmSPbCOOC9i/RcTPB+gICh
         f3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783686039; x=1784290839;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n3zreGUqgwkkgdfOKXxPfkgWWWCEAQ09f5w1+bh6RDY=;
        b=cOrHF6JzutkkV3H52nGYufz4T13UX7SwcHz+sqjK533Trm3n5cZxf6P2OOUTxJVwBp
         iaJnY3l3CGbwPVXZoh/InirT28EX4PNF0uvG/NutKDRVkFKHcnOwbWlO+6T6xnWlT3Zc
         gmZzdE2I4Ig9ceKYJGhgdbGvOKjwsJKvWfHKtw/BzCLphLw0lJ0kRzXF0j5vWuQqqXTp
         bHd7yX76F1coVjdfVcVOjEK0gfmVTCqUa0PrkStHJiy3nCdU3jYnzmwfXpxwOjfu78jD
         Uez8HxTUoNXnLLKvJSBpRwfkhT7E9smSHFo9yB9sUkblj5NHq79VHY5e3IGCCqXsjTvv
         VNNA==
X-Forwarded-Encrypted: i=1; AHgh+RpGJ81Cd+zZY86HpWxzJGujNcc+lXRqQNkylfRLV1QpcM2FxhmVMP6mAq3hMnauUQNEvaaQAxSJroM17w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS3Xr46DDjbst+PT1oOiIBoQPq28O3gpGVmVg+/LkXExfC4+Qp
	kc9QHjV3HQdfS/yYUdpBx7gyeAT5u8To8wXjqyUUvfJx4F5QYV027N99
X-Gm-Gg: AfdE7cmIhR9+LkKCdGubRTP5frsC9pwrSxov37GNoHG6QsKlywRHH/NQffVNRbsia2Q
	YyhiMHOxujfiYGhOOa+tGpmqNdVhEWia/COrfjX9WfSFbPolph0yZWNbUvDcp00NDtaoSbMO6UH
	3RRSQUk1HnGcZD+aBKd2bHnUjawsqeLXgkZh+WPvMoxtWVfOAnj/QzQOBfxx+nuRqkWWijdpSSY
	aY9lc1HuaDyvivhfrZrdfhbJoy+QYB2/Rlm+H5cP1MyFjK4DSY6glqzkUCwny8zRLa5l2OW1oEq
	DkA3rMiO9IbcL+5YkVC9oZOgCM5cU+PXI9oPwazWQOoTt2cEN8aPc5wsKHQ8rncAKsECtMX3mit
	Z8AUgtgj0sToXeSl/irDFF0b48wun7Iyr9y6+9N0n8MRTFxMIJru2QXB7vHuyGfoIsWNEdYFKC3
	HuykbzH5kazeAcjFmJBR1rWzwv+Cx2foNAwbf79128OB0iCcsRWg5Yl5wuiqXhPPDrRxZpZHYNC
	UapsIeG
X-Received: by 2002:a05:600c:34c1:b0:492:7083:e5a with SMTP id 5b1f17b1804b1-493ee0fe824mr67889685e9.31.1783686038394;
        Fri, 10 Jul 2026 05:20:38 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm131002995e9.3.2026.07.10.05.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 05:20:37 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <c74c20f7-b819-414b-b936-c85c165bb537@gmail.com>
Date: Fri, 10 Jul 2026 13:20:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jorijn,

On 7/6/26 20:22, Jorijn van der Graaf wrote:
> +config SND_SOC_WCD9378
> +	depends on SND_SOC_WCD9378_SDW
> +	tristate
> +	depends on SOUNDWIRE || !SOUNDWIRE
> +	select SND_SOC_WCD_COMMON

The preferred style for this is 'depends on SOUNDWIRE if SOUNDWIRE'
since 'depends on X if Y' was added recently. Also see the kconfig docs
on "Optional dependencies".

> +config SND_SOC_WCD9378_SDW
> +	tristate "WCD9378 Codec - SDW"
> +	select SND_SOC_WCD9378
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE

Another kconfig style nitpick: could you organize the attributes?
E.g. keep the selects together, and keep the dependencies together?

- Julian Braha
