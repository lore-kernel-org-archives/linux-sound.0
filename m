Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6175316188
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315235; cv=none; b=MODh4IqfWxY1yW2qbiI3Gj1JwmEKgAWfpbrwZwp+SDTf2ZsBxpEXdIROZUyP1HxqZMh2zB93QMTMS62+DRaFl9OeRRfMe1+LwuuP5fEJjnkzluqzrgGCKGE8XPXBXTHKqmUfBKV9zZYIBC4jGcenuvUsnDaCfMBd2a1rnr9akYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315235; c=relaxed/simple;
	bh=UMc4DAdZ3wELgwJc3P0/USAY01EMC3U9Jpr3hVyWTuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTCvL+X8KcIrWWv7YYZz2ro6VV8PBFwPaSGle4nu/zY3A6a2x2g7KwajaPC6qalm7krisAPQDKAc6Uc6ezlQZ1jgZ4Qb5maqfxAaHa389reD2fe4iw3FlmwqszU5gO5Mt97sw2NjuZdSe3xdT1Zu0Ik1e81Xql1Gmry/cnQVAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAtv9qS2; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAtv9qS2"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42701b29a7eso1139239f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761315232; x=1761920032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVsA5NUMk7Er151JpLhnqPMBBeiJc/C7dvaqVJvIrmc=;
        b=WAtv9qS2VqlUdLgPVLqijR1pZv93MK3KFjzNVR0EKkxs8mVCiJYT37dZuOvO+T+8gr
         WNW+MSQxj2gGuRNxxIHieQO75jPqxTT6pHhWr5rblHVwrshRWiXPyUm5Pwyx85uhFcZo
         jMVjJKaA+/T6kuJAC4nXUjvQLfbvt7YzR7HtIysMLIUFHQrlTia9t5E+654boZh4q4W+
         iSK7bb2XdhIHNWInbB4V84kTtX/QbzpNJ3mnha7oK5K/qR/9SN0y8/uD5664YNC+v1pw
         EOrCFtgoiYEDJqRnaKczWGhFWRAIi7UXbombh9ekW3SQ736YI2Lk4mXS2X/9srPqsdW9
         of1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761315232; x=1761920032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVsA5NUMk7Er151JpLhnqPMBBeiJc/C7dvaqVJvIrmc=;
        b=pgvGVC0cENtCnq8mYqIHTgzIfHpjDd+Toye7O+QIiJN6XYiAR8vai4uxx4s/c9gwP7
         gXURnMMzTxN4EnERTVW5pX+M+DD/JfPaiYzJTtFdJZ/p4Ia8fLNQzomftDQJq6iwmN4+
         A5DSebmqveeOj5uwhqwy4nN7dzZoUVgJ/eQ74Bv8aqZte8wqEb4H7U30qk1pruauHq0Z
         luCpYyCnMgH1WorsFhVUo44fJdsTW4lWWgofnyvVy4W3KRjk25EYdCmi7kj4y3i/KncT
         9/R/gFsGLGAeHw6Kdpt8nGOtq2usghdUlUivBxc2OUSfIfew+kDRjJsYtRg/SI4FtNFb
         aU8A==
X-Forwarded-Encrypted: i=1; AJvYcCXixGFZS5Ijrfxay5VhKpsvFbBLFqHwHeB9NXTnprt1FZxNWM32qAQC/xf/vJh22vjACS11bYjk0RFsLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkvut7vm7/qcd6U5QudstIcOW6bzaKhLVpzK+5IJcr1T0NhtSv
	3FcL//ZLGbcbLG6m1X/LVmiZALt6B1BmbQT0HvSSNwZPu6FjMnKd2oQqFK8nN21eNDA=
X-Gm-Gg: ASbGncvYfct/26UJ7gTOZ7Qb6EFA1YGhjdTNh33a7HTK1myDBeepKj2c19OQutX0e98
	lRuc5CHNlL/aGmAuCK8oO6tbfJ/pHz7qWZ6R77F3GgbocgKqKc8YuGftSi4/CB4sxK9Cq4NH5Wq
	P+5LBF+jpWYzVHqkHnHApqHhenNYXgtoA09OLco7L2XOtLwUfsuvKl/Zr+vXO+HbyUVJkVROXvt
	1uFMkdHYxofXH3+h1tlJPdDZIYFP3L7QLCWgfjNzM+2OQ07U0+sNxzj43CLXJizlJxbo+xeieGp
	10sW5t00bjklUIC3ND/T8xNQHEdKLT1k1AlYRMFdR81Og1M5VMELmNEra7NAXtCDeT4VkRmC6sK
	HEyg9+IgLhv982BtIY96EY4xKf/6tasKXfyw9dbR7+o9uBJ1dxP4KaUVpeQuQdMpMrreLXm071I
	AAXY7dCUFLhvshuLwe
X-Google-Smtp-Source: AGHT+IGOwSSq4cPlqfVI2+cQc4DNxAbP8ipcdaug6FB/HIUIzgkN8w1ERIrzCxdii8Zp8hIOBEEMaQ==
X-Received: by 2002:a05:6000:2912:b0:3e8:f67:894f with SMTP id ffacd0b85a97d-4298f582512mr2780216f8f.26.1761315231940;
        Fri, 24 Oct 2025 07:13:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4298b996aaasm7851320f8f.3.2025.10.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:13:51 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:13:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yixun Lan <dlan@gentoo.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: spacemit: add failure check for
 spacemit_i2s_init_dai()
Message-ID: <aPuJnJIeupM1PV09@stanley.mountain>
References: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>

On Fri, Oct 24, 2025 at 09:11:01PM +0800, Troy Mitchell wrote:
> Add error handling when memory allocation for dai fails in
> spacemit_i2s_init_dai() call.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Dan reported here [1].
> 
> Link: https://lore.kernel.org/all/aPtiNCZ_KBezL2Dr@stanley.mountain/#t [1]

Thanks, Troy

Normally we would say this needs a Fixes tag and the Link: should be a
Closes: tag.  It would be easy to make the argument that the
allocation won't fail in real life so a Fixes tag isn't appropriate.  But
actually it's simpler to add the tag...

regards,
dan carpenter


