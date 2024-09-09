Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D931B81BB
	for <linux-sound@vger.kernel.org>; Mon,  9 Sep 2024 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725886041; cv=none; b=esSYGDCr8mnd3A5aRN914do7b4jbs378pn2rLNeNVfQmccELfwiFEg0Mq2qZbJKF0fpcDHSOYElR9EZrCuqZf1+V4u5FVKobngp73vKhBg9LK7ULIk5XxcTx3LqZpANJ49bVgEBUG4/V/0R32YsmiJjauLXMntb9uQPdK1NCtQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725886041; c=relaxed/simple;
	bh=olgYAQFE70KObWliJ+bbP5Exly3fzgalSSoMAsFCD8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VglLugLRkzio7nWTVtClM4PhDx0Qqf9d7/rs3Fppqawiu3LiJJSdd/XExpJlfolc810sGTXyClz4N/JKGCeFPCDB72ZpGq4c0lLLUDrFtyWTWamnlkjrhV/xWT0hk3TJEC8SouxNwyS0vb1CakS76+fFxP04G7+Wy/TewOK9wdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mMB73AYF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mMB73AYF"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374ca7a10d4so2555026f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Sep 2024 05:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725886037; x=1726490837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFdSn29D2vbF5C5b2ylmb59wYWeic4q4prRLAv5rTI4=;
        b=mMB73AYF8s7M1E0gHPsg4gv5tdmMd0TCSyyGDs7/g9RV2u/ymNPViBWHnV11JA8LBt
         QG2B3B6igkRwVPniwDWgOj26Gp9otY0PoSTZo8TSRv1kv4bxyOwNKGeBgvVDMO5FUa8R
         QYWwocrkbxxbRWzo9wyjMTWfgV083Q7EvFg+8y2Oeh8mt+qGX0zI96OfiBom8hsBocsN
         DBroFOwRsRYuR8KsQotLvrqYArK1CU1toFE7Zbe8Eh0eVdT2ur478DBeQZOrZbWJtA/e
         Zx//jrJ6B0jja9LWZv/bzGQYg/KpeVzaIsGuC01+YjaLixgRJRxihUN3gYH44xLSMait
         Pjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725886037; x=1726490837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFdSn29D2vbF5C5b2ylmb59wYWeic4q4prRLAv5rTI4=;
        b=XEwV8xE7q0Yc2582Hdy1dmTtLdEiv5Vc4JQ3fpKhUpq0ZCSqF0Ri1xliKQRTuXdARW
         M45YCBjeIBTgSr9OTN1rfkGsp2rF0Z7gr1Mph5D5MBGV6gNCiV0mx3m2/kow6rRrirdF
         OrZeg4T+qDIri+Icm9iJIEa5FMBMib3ZeLlMqBuhZq0wd5mqghppdLlKb3PZUqBZRDTY
         er1BHlWnAh6LgbuLRZ8Fldd3vSDeMwgyLBTX/6oEKiyRwhzE+mjXR+Lns4CtOKv492pO
         Hp+KqyLqDcWLuON4LaTuKR48IA3Izd7GdOHwvV56Gs6HX+QoN41AnltwyLVo8MfZ+LGV
         f5QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuKHM8tU8mN7XKkqixMlpe59KXzfQKQjjAtLV7p2qzMwtsE5JKTf5FdM6FuoNI4EYApZ9EMsupD7KF+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZVDEcKq9Ip7buYXPpGQymSJguu7J9AAV7VMPNel/AqQOThHp
	NeAHBxjlryXGctv5o/xum41Kp0Kq4aVcJWpUEnJCLhhpb4yWnykuN4yPVc7/Rd8=
X-Google-Smtp-Source: AGHT+IGNVpmNYEMCrZnUHl6rM1WqQqMqFiNR+myLEWeiswQRFxR8AFfvou1NnDq7soxmYBAG5Uzmug==
X-Received: by 2002:adf:e64a:0:b0:374:c1de:7e5e with SMTP id ffacd0b85a97d-37892727dc7mr3791168f8f.54.1725886037310;
        Mon, 09 Sep 2024 05:47:17 -0700 (PDT)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb226ef2fsm58370845e9.13.2024.09.09.05.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:47:17 -0700 (PDT)
Message-ID: <b2b8b181-1bbd-4925-9d6c-40c4b9e29743@baylibre.com>
Date: Mon, 9 Sep 2024 14:47:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: mt8365: Fix -Werror builds
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm embarrassed, my apologies for this oversight...
Thank you for the fixes.

-- 
Regards,
Alexandre
