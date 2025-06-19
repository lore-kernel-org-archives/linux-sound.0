Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD6523C38C
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750311357; cv=none; b=u3Q7oGexdTU1z9VrPd34trveFj/IqNNYyUOF2YrD68XF7Tb5zIWY+o3XWbM9JM5PGln9+PngaFf6aaJ2nAR38keLqk42BWCqPBzpd9VGUcUs/jJRqwXaeqOQEVZX/Wr/C5juK8i+WRLHS+/Xwdk4zDlcKMK/rrbXwOBBXKL8vAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750311357; c=relaxed/simple;
	bh=3T6kJuyoKBc2nft91aab5hLZW+0/3OZRvkSZlEz+xsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2ymqBuChjksM8nhx2+Fr1Dht01tGXltLNJrGmAz8I/MQnBDdCb/IWNWDxuLRJtkspmfRySey6krJZvN9qcqRUZ3Q3KJGlB2R82I4AdqwRFiKBbVcTqoGHkMxJ3myznYPOEBajKBWUe054d2GhBLj5KaP1iqxhI+LCxLiujFg2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AbljeIXg; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AbljeIXg"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2d46760950so489908a12.3
        for <linux-sound@vger.kernel.org>; Wed, 18 Jun 2025 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750311353; x=1750916153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=AbljeIXgWzc5HyaqF0LJ6zpYffGY9+wpulok//kNaTbZc6/TkJKAKfbrmMzw8rS/f+
         haPbdNy/VGgCmafJheFGqvyz7DxHbQxAi/+Ot3I76MYlZv2D48CHQBT+Av6dm7TbY1TE
         w9ZOnR8rxJkOnB3UidGtNObmm31bntqXMkp+2WZF9cqc8VdQrESEHPPM+O+7qegW1oED
         to7A9v6pZ8169cDLSIADe7i0rBCa8cjYXWYZDwMskHPiwYly6NhB4oPimrYJJRmI3rAW
         IJWFhjKFxKzLPibGNhMNTnH2uShn2AlAwSVeDEqQj/po+cpsEeC3VQfJ9R0YAWDegqah
         xD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750311353; x=1750916153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbKgKaSzJXcq3MoycGVCSzlp40V4lZ1OfWmFaWrV5lE=;
        b=jCws6dU2UIp7DdRlUv0DA8GsWSwqJyVHf9uNgiw3NwFWq/8rh4f3VH5yTmDmqJouTP
         dNEtYVt7/lDqJ4xlqTV7nWUCH55w0qUZSUVz4qm2VMSMWOQGf+J36T6UA7Wq0EAaS/5s
         cLMXe+8jl030LnsJU0Pp7r1L9RvbGwZZB+YWwNwt5ABGw872Ihyu52Ryy5Im219rcOLB
         dGYDWtqVQllB/NGzOYNPdivzJYFK+8Bl1dm7xCskNyYAgXRW6tUQ8iTQUGqMF5LI244G
         tbWQBmUFu64K7CFTFCpmkzHy7wbJCtcQYNLV8on1ZHArlvcBPDA3VM8Z8UMQN6QpAwlb
         MCiw==
X-Forwarded-Encrypted: i=1; AJvYcCUqoK7SztymuEDbe75bygCPl/7FRq66aj6fzkB/+V5lO46gfaNlkmQnM3KlybD5mFTbvuw3QwlZ+OsgWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7CTOWwpEoFnhpwL8/JOjSBINs4ys1AjYqOZ/cpWhBJP33GqR
	3GY64USywALEPN/fyWFoJEyO4eaKgvxyFJff2R6z6QOpWzk2NYI1HJU+Be6e/dZ/Hw8=
X-Gm-Gg: ASbGncsMufHmQFuwTrZyQHO0fD63jw5CAs3VDPMy7i2A9cCvd1Tyk9wKbt4gnqmKSgX
	bo6ZZQ0gXteg8VCNfkY2y5srU/uy8gj3Y3WtLa3uYSoH1l9+pE8K+NFpziMUKYx4Pq/7FTZ1KkO
	G6DwvDPG4bgJRqWb7KJF849ySX0eXmACIuXdJeM3rr1xOqb2NXoA/YTJsOJRMYWuLlM/Z4OllTd
	v89WKE9C6TkXcjSniKeb853u5gXaeRWIKW4D3JSbHeztwaq1Nfgfq5AgtzPYCQDLRX7fEcaW5Up
	bFH8v+/pcu0Dk7ZSdh471qOUi55+YRnTLlo2/dJwnHzOkNKLLm+OkJkDjGw40kv3UeV5LhuOuA=
	=
X-Google-Smtp-Source: AGHT+IF1Brl2Ml/RhPp1ZISh/ybbgy1I/Aosv1oeoYbA3EE1IVQw9sjB8PhoTnTOzWYQtjW2ZHuZqQ==
X-Received: by 2002:a17:903:32c9:b0:235:a9b:21e7 with SMTP id d9443c01a7336-2366b3df793mr286985355ad.48.1750311353385;
        Wed, 18 Jun 2025 22:35:53 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c0c9sm112008655ad.20.2025.06.18.22.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:35:52 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:05:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 06/11] cpufreq: apple: drop default ARCH_APPLE in Kconfig
Message-ID: <20250619053550.hogoo7ic5igvex3c@vireshk-i7>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-6-0e6f9cb512c1@kernel.org>

On 12-06-25, 21:11, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/cpufreq/Kconfig.arm | 1 -
>  1 file changed, 1 deletion(-)

Applied. Thanks.

-- 
viresh
