Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B79240FDAD
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 22:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786572837; cv=none; b=mCnpBkt/QJ+r/eyJ+hBnD2jqFVuWAn7RFtADrfQKERpX2+XWWYiO5hXkB3wxFzZTVnFPtnLOXx8ZkhyNkcUozOfJmMGQVVl+cBKF43f/IZJhG9fLGDuIfd5buFPdv3u8Z1580/C7jyFJktT9sXrNdEvEeTWbq7FKcrwGiNNHJnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786572837; c=relaxed/simple;
	bh=O15VxwWMBRkqh9kj9wxsTvc8k0yZaEomYA9y4t+CbTM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=aL8Z3njeaIosacZFkg5lYx8j7/dUSKXJYKavhn2TMOw4S6qXEnfWz2WowTWLN/O/4jftmi1BA2BuXOVjNPaRvUq551ma5AdC2xWGSUq6oJtDXXpQgZV037PtJFWYbQE+swUvb1hA3fn/sqPJcW8Prllwt0CWR/NNCt+1V9Pt+2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oO+ncJ4E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oO+ncJ4E"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49553515a8bso20739155e9.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 15:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786572832; x=1787177632; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6yv8SpmPtECpv9adgpFjESICTUtdGwK1tmXAnGomHac=;
        b=oO+ncJ4ECFWc3YYC7Fu8IXxd33ysnQ/pWCD+Avwhja1puGjc4w0oZz7GfehHTrSRej
         T5io4A1J6tuVCDlHuYsmhZObYsPny1rXELs4tcC41FyMmpUS9lgDVERL2sErdQfdGoSM
         jNwcHScy4U7F+Rw32W/gJuCD7lT0d8qWgm3ZpJ5tTLPvbQOCkwimKNiI6t1ndz2K9GUB
         7wHl8Ud7Artfv9BIPxH+8rNrK57r6GKSeqglLTPBQMqV2xBCsCVxkswP7O/saPzr29QB
         ieNGe6VrXm5O6bmfVoChuoqT5XyMyfngwzI3QVaVthCAtD7/OXICNEPNup1MZhNoex0p
         Jyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786572832; x=1787177632;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yv8SpmPtECpv9adgpFjESICTUtdGwK1tmXAnGomHac=;
        b=gty8xgy6B/uz929/HzEC06QK9/dBzhUee+OFfN7VQcfh7absFX2JgP4gAdwtOjxxAn
         Y4l62ER7q47wT9SzDfMXGWZ2fQWZIY2bvueI7Buu/5oX4Xuju1u5d6s+ymb1Al0KM4qk
         GxdcoT1xEHATEcM/HnVrVZK19NJ7qxLD1jxqNTisOUZEhWgE5Ol0OfDkFD1adZ3t442b
         ZbItcyc8B0lnotmMlAT4+IQeHZb/iIG3BgdLqIfg9LS0HYDKVqBRnDOraUb8JSyuRJTB
         mSKNdc5fJHybF9AFSwCCf0FaXstOXix65SFSY4/WrxWwAL7aT/pOAuT2zub5Ntg5lm+n
         DoyQ==
X-Forwarded-Encrypted: i=1; AHgh+Root+LRKryTI8W2On/xCTUJPHlqgi+TnAC3rI5E/YHE9VFacBaRHzyyXp36svexs10cLQ5rAajbyqwgSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqeY+/C6PUtaGGWKSagtFdP8kZVzcx0PX5Ec5Vsav6rRbAphqh
	hu/+hduhyRE94hZU+6dgiBkwc1tHngQexeloBnLAZJ7UWmSpNFwVM0dt98zoqh0uq3c=
X-Gm-Gg: AR+sD10NwsSs4HwW0KntRqdtfnXSzCb6e6qcmqvCY5DvT6Jonj8aAXEKYMmr0GqqvjL
	O2p0MHPezLzzy9wvwhzT/0ID0VhFsOnSzloSn8Wv8VomtExNk0bvSoKF5An4a3y/RnioGzsdAC3
	3DSXxfDrd9ACch4MG+woFdMJZLFZny3gSuxMnmzO3SUIzqAD6iThj0fv7bfmo64NU2lHOEn0qUz
	ibfuNdmWjaPQf3lg5iu5y0wwP2fIQCy6VJR2lvUGrajV1GXIFCfiVdZ3sQBKKP5wpS56uSWW2hE
	QyyJgo4q5X5eFO3zakmm1zh1Vuq+uRnqruBUzFHO2hgkrNs7j3JzF8s7eBO0mSdmfEgGhuQAuNC
	hAC2Kb6H6S2oX/ob1FhyYp1oMOtTw0vIZWf1wiSr0OLMY/Dqn+2jIugyVBsE4eDCpPeDA0NU/eQ
	BGc2XKdEXHMoao+QDybFQeRKJw4lM/Dx2lGN6tOI6XCNLD1v8psqB61JyIoT4=
X-Received: by 2002:a7b:cc99:0:b0:499:8157:c03b with SMTP id 5b1f17b1804b1-499821c3215mr5493765e9.15.1786572832486;
        Wed, 12 Aug 2026 15:13:52 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.120.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e3f154sm9263805e9.4.2026.08.12.15.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ASoC: meson: aiu: make aiu_formatter_i2s_drv static
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Valerio Setti <vsetti@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
In-Reply-To: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
References: <20260812-aiu-formatter-static-v1-1-67936d57ba05@baylibre.com>
Date: Thu, 13 Aug 2026 00:13:38 +0200
Message-Id: <178657281887.546910.6599899262272389101.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=320; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=O15VxwWMBRkqh9kj9wxsTvc8k0yZaEomYA9y4t+CbTM=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFk1H6R2Tw1wDm9iMRbpjtPXOv7ae33YbnldzmMHQuPa1
 +39xFLbUcrCIMbFICumyMIy/d7vglK1h8YJJwtg5rAygQxh4OIUgIlYcTEy7Pbg0Wz+mCPw+djj
 DwUB9nd1BSLvqty2MTzV7Sa+aZfrZoa/Itu/MGzJnX9y5sFJYoaXFx6z3jT/8jVzLzEVq08sG1n
 +cAAA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

On Wed, 12 Aug 2026 22:50:34 +0200, Jerome Brunet <jbrunet@baylibre.com> wrote:
> aiu_formatter_i2s_drv is indeed used only in the aiu and it is not meant
> to be exported. It should be static.
> 

Thanks for the fix!

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>
