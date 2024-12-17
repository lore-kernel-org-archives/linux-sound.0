Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2314514C5B3
	for <linux-sound@vger.kernel.org>; Tue, 17 Dec 2024 05:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734414796; cv=none; b=WnU38tvvKaLRa136QEAGfiUk8AySIyBapw3MX2Iy2s2Se5IsqZnFfX/RYXMeHe4GPysa4DxJCMXGIjM0fUH1O4RVTCF7v3A8OY2f8r0YhzqW5yszCKlOIDHRhsdfzhz3hYZo+7CFsGYbRJTPsUpOvds6yck130yVu6Sj3zCnNMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734414796; c=relaxed/simple;
	bh=VZNnlFJmywPbe6SqgrkRxSoId1i4IHMK+51jB5H3pUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIK8a8vmYm1b4qJ/Tw3cYGUbBgRkgSFd60T0LjxNOCKQj2mVxOvMRJDiZYHjLvE3zqNwCRySXGk4d8ANB/n2Rg4CcunG+L99vypFADsEZMH6ki9s9tSIUOBrCm7j/DMiFMufX1HM/oev14T209mtVfQfhGE0pHBvSvXWGRR3E64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R6eS0p9o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R6eS0p9o"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434f398a171so4066365e9.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Dec 2024 21:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734414793; x=1735019593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FoDQC3EuHIEBzlx+5h5PYu/u9pYHVkSGeY9qugNdUHg=;
        b=R6eS0p9owm0uzFaR6jcf0WLBH+XmZUYUr63YXUPqhgL6eGY89Tmqvuc0HfbFuagsHm
         RKUG+LKzMDpGmr6qb65yggoDx9NJyRsDttg6jt7neH5qWoVHZ9r3oQ8McbECtNDmW9t0
         84px25zvFDpjOTj1ccTCcPpU6ulubNX3r67Zj2dWrjsoyvLO4zgRFnajHSIExNZ5thEJ
         0k4zl2flliVGmUzFJyZQxQmSXwRhMkq9it8inYDntl6UrK7m5AVDH3RmCz7M9W+TrFir
         mhGjw8nJr5RebGjKsgvRKnR/sgMbuiR7pETqhWbOW+d9NGYh4oIxL+hObBUILEcoaR/N
         HjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734414793; x=1735019593;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoDQC3EuHIEBzlx+5h5PYu/u9pYHVkSGeY9qugNdUHg=;
        b=swbsVeoUUAva61QYSIZUdUM5pRLesI3ttArxJma+9THPYivG9hptYcvoHid1ZWQUgF
         03K7kGo4OXfCRq61WUXym9BvXVka+LSQEW4vpQHHVWDUk9DoK+tl7MIDDHMoMXOfo3sV
         Kl884JFzyOvsm3483CQW2hnf3ISYUB8DAIy6yelIw3j4V0/TxNDrTljG/P7wQ0TG8jb6
         k4g5H7j4Z6EmXEsNQInBLG3faaybaBIGmPek5o9D7s0L3foX/q76s8SZEt8DgyO7adMf
         6EF0M6pu9Gzs6JgdtLau+b322W6Z5H3ZsRwY+c87NW5ejZuW1maQLTcPYYM2+pgwCAhm
         tTkw==
X-Gm-Message-State: AOJu0YxfcHtN9iANda3uduQ9//yMEItwb3HSJRa4PiBnzC5MoxRJb69a
	HEkENZGvkXWOOgbGNjcGmrfiaWhrr2VU6p5bEloSYe4sLJ3hXkbuYRUvSMtoDZg=
X-Gm-Gg: ASbGncsra9f2J6wrJDFdpDapJVn8mhEvvfjqg+byIxkD32DOxiFfxOzacVGGD/WSmEs
	dyHNOOB1Li5E0Vx7yjNBZloZwfKwTnVlOwUx69gWQc2y+rGBbZbSJQm7uHYm7+xGh0a/4WSnHKB
	MdUwV4FQ8e20XyfU6OFblKdD5oqGS6i/0L2rUDWwMIOEIWatAIftpI61sxTb59lhzo2mHEnjZ7M
	VoUSl+hU8suJobQhW+SnIIXKjSN3cSjTA9L64a6dB4DktTRARYWtBYxexj2EFLI1+SbPChMVbEI
X-Google-Smtp-Source: AGHT+IHnS86avJ5QXEZJqtttZUCk+/7z4cvwjx3ed1gonoMEmYWP89QJtSVtpvM+Kx9ewo82IiPdrw==
X-Received: by 2002:a05:600c:601a:b0:436:488f:4e4 with SMTP id 5b1f17b1804b1-436488f05b0mr5239005e9.8.1734414793355;
        Mon, 16 Dec 2024 21:53:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625706595sm163063565e9.33.2024.12.16.21.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 21:53:11 -0800 (PST)
Message-ID: <24c78bfd-1056-451b-9d03-9f5f6d7f8936@linaro.org>
Date: Tue, 17 Dec 2024 06:53:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,rsnd: remove
 post-init-providers property
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <877c7zno1n.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <877c7zno1n.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/12/2024 01:36, Kuninori Morimoto wrote:
> commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
> device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
> longer need to use post-init-providers property to break fw_devlink cycle
> (And no one is using it yet). Let's remove it.
> 
> Fixes: a2187d0dadf ("ASoC: dt-bindings: renesas,rsnd: add post-init-providers property")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- add missing DT maintainers
Only some of them? And some old addresses? You CC-ed an address, which
suggests you do not work on mainline kernel or you do not use
get_maintainers.pl/b4/patman. Please rebase and always work on mainline
or start using mentioned tools, so correct addresses will be used.


Best regards,
Krzysztof
