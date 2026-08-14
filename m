Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E6C438494
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786706874; cv=none; b=MbB31uy/CR2ZVk9pQttNQIJbTT3sHzssLKJ3dlJjxt1arw3eW01PUCavE0PUTGJuckBpoDYqL0EIrEPOpY+sBlQ6vsZIpEc8+elXwRpzY+Aloz6m9ntd/ZJmQMqzvObu4gWu1ir7snTiEbjQVVHSGxt9VdD9/MEz2uUWWJ1Ez7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786706874; c=relaxed/simple;
	bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RMoEnhzFl2Cgmku5b78p8scjxB3d5zm5xg2yE2oOlHfGhm5P/1AlEScONATOnlpiniyFsfWba8qNHDA1q244RsMMDedIXLQ+Z+7eC3IYYrA11M32VObKUvBB1V1NM4JCudjQrWWYxhxQ5z/uo610Nwdzr67ISx0mdICHoUpisJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YxgmsbLD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YxgmsbLD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954d29264cso4785205e9.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 04:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786706868; x=1787311668; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=YxgmsbLDArjVWV8/bTynrQexdPGwSVsffaJe7BEzT0Kopox5RGWWFAvEYKMI2BDa8y
         f7dMFf5lQGpd+7BfDLjWvR/drOd52AY1DjhRdhM/h1U5Vf4au/T8GWikU+83UZn4yZQc
         +NcINO01xNJdwxlgkUcLcfnsVyS1CgFNVoI1IvOIA92DlZCG/iuUIWnNVaSIdvnIZm+E
         wBu0t3AVGK+TZC4PoBun1d2ur/hAD/2Oq4qDuVdhwsqNxfD/YpE677+6ZeVdebWgOOrG
         5BBpyl75lrCSTRyFxE7fGcQu/cXFM4Qlag+MohhvzySbaiEtbSN1S/NgTc9bWKXp7KMh
         L5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706868; x=1787311668;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=YHlioX9XRZ1FIkbtXCDin5Qnxdnsw9+GUBsTB0Nb+0P9yTYEAkDojoE7VIBFVE5lVz
         7LaJvmT7ZDX1U6j2YGm0BpWsjNostON8UZiQLvqTjkzhZpwzajRbajNjkf3Q92ruKIEs
         iq6NFBNQwuVCe1xIIrBWkiUH/jQJQY89rz2etFeZxDJz4wnJcfPAOGlEm6B5QklGSDIJ
         dkwhvqLz78KWnW0qoV0pSMoQlcWDNqviju7TwrwwxTifKX9zqMS1mFLRoXN4Gok43ozQ
         QERfEPWzV6LpwaXW/fzqu/wleXDhN7Nn00jNsbIoS7T6fjfPzUfOxGO4+XDy4G4z9ojU
         aFHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiGXwLkAoUDY6aIP1pfPH6YDOSalhA3PAXALY2F10aO+Khl88vPgLKSIryYuIQLRBKaM1BQ8IZDwMmuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAmYwuJNti7sL1zcIum7R7gfb6KjQ1w2QkUKqkomsOncJKrdwx
	5WzwbMG5+WUGrVRnXEJKQpoDyMuE0QWjuV1xUI9mD+QX0UyTADMKffxdPFmqTSg2yQs=
X-Gm-Gg: AR+sD121z89cvtu0wd2xgNZPWshz8YIPrKgWcw0apoEbTHUgaG4XWGOtG6gm8TDC3n4
	3VngPwzW5hzVEF3y6Rt/i2fgeLyoKQbStK/J2Y9KyziRrPDRxYF5ML2BSjuAcwwjcYGRUV5mA1R
	893gpHG8TVMGvUwG0zMTVzuv2YUXDMvvrbxoAfraYbdZvL1u8MlJeoFaCkxckUwoY7suMkmPy/W
	K1vjwIq2+GLvJuYP97fTL1FmNVHRj8uspyYKHbxQ76aWTqiMdDG5EvDA3df+0kXwoBBc79m38ou
	QZjM+no39CEdbZ31SqZlmdOKp4ZCzdougY6RJsNdPJjRcTJAz5BYG4lwKx3Nn07zjZiSaJCjVYL
	VKXMBJNK0rxaUEeCJ7BKPNAeDKdb8hqG4MC8PA9wk4PolDxztIoGj68lz2/6GGVd7zlLQ9MmNkC
	eWN6zHNyNPS05IhvUMlRWBrZ2MuJudLKnoQmM7QYDYQYu1CYpRm3itsWITdArdGyXDpxrM3w==
X-Received: by 2002:a05:600c:500d:b0:499:86f5:9e33 with SMTP id 5b1f17b1804b1-499879bc10emr72416975e9.18.1786706868594;
        Fri, 14 Aug 2026 04:27:48 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899b5ad0sm22278775e9.4.2026.08.14.04.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:27:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: meson: aiu: Drop redundant probe error messages
In-Reply-To: <20260814094211.25151-1-phucduc.bui@gmail.com> (phucduc bui's
	message of "Fri, 14 Aug 2026 16:42:10 +0700")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:27:46 +0200
Message-ID: <1jjyptc571.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 14 janv. 2008 at 11:42, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The functions called here don't log the error themselves, but the
> error is already reported deeper in the call chain, so the dev_err()
> calls are redundant and can be removed.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
