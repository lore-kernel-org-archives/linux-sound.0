Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450513947B8
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782288482; cv=pass; b=VdntmdP/EYoyNo6Tjxhn5vWoNst39XcF1zRRBib6i68OcBkmGvkPNEHIcHHJz48k/ZF6nwPCI2MCKaoT5F+kfnqOUVeP6Tkx2Rc+eAcaDCabmwaoYXWl6mK9VJlZY0NJpBjLCkRoZnu1bgxy/2o39kuo7nLM2mYZjyIuWqNP/Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782288482; c=relaxed/simple;
	bh=Xg4YkPUUSRho4/mFoPTqXbvtX5ObiTPXD/x2Hcm4gyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qx9IV8DZ76s2wmmPlHWSNiYdSyZ6odxpVd0cJGWQJBZLyyL3FwcF2wbLPrzVqx7hNMs7RfUtm4ZyQTx2ByiFOmANAXPgLb5SgD3OZsWWP+1kYL9jgEDaZ4zya7KJmhN1CROwKj6he8y94/H/lwU8Sisj9m4hK7nmTKy71t1Ou54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l15U8Oyz; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l15U8Oyz"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso414970a91.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 01:08:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782288480; cv=none;
        d=google.com; s=arc-20240605;
        b=ftdCTq4fUN2dRl1HfRXdc1LB1NIRuw2Jauuj5+4W2mYrxGN9pQcTOFnWUxBUR7ZcGJ
         h6emGR/wcHzlvg+4xKSZkbzNT6puFH1rtqdcse5QBshi1INiyB3WOObpO3GFnqi6zMri
         fAJpmph7A8gj4Lfwc4COdSJHDPrz5JVl7n8eG7qircZ1dIziv6P8RI1ecK58Z5dxX0WK
         dlTY0+UI2BErKjyg8MRbsZWCBSTt/EiXlTGEcNgUzwCWWr+pSe5vEln2+lY6EmEdt5z+
         R9m/HMSjbextneKR86HssTQD7gCCYDlnC0ZVQ96KDZbudOaSLrNAfrMFCGuOsEJR0Mzn
         JzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xg4YkPUUSRho4/mFoPTqXbvtX5ObiTPXD/x2Hcm4gyQ=;
        fh=uY/IkFQAsEVeU2LorEl0doi96NZJGu//A0wRcSk6YKQ=;
        b=aGO+56O9ZEnXT7BkMcLLpXiUurQhBTsWbX7QqMjPCo96pfKtuBUWmn8l/iR1MHJyJH
         xE4jr+ft9Mri8PzMjve6h7go85kYvrnOIXA3VwLa5qMQrCAmEWse6pZt0LvZdkSrjrFq
         RFDDJlM2ugqrQlQsdYR8ZJ+/tQAHKVAPZiVp83FroCxinWqr2IF+KvdawufyCFg0VtLw
         62hKllyh5Wp7SD+U3E1D7+KmZ8gRylC3EaHR9pdWEhmbEu6E+Lz+vJ+T0CB9sAexQ+En
         5vLV9/i6pEVf+DvdEYsYJ33/CCqs6q3B82F3YpaFIZtomfjh1NmtvAJUB+ySXU4Prlpe
         8PnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782288480; x=1782893280; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg4YkPUUSRho4/mFoPTqXbvtX5ObiTPXD/x2Hcm4gyQ=;
        b=l15U8OyzdUi6FiPCrVcf+OMUqkV5rvkBgGZSyOT7WdVFCnr8g66QbPee6eRadLMSyD
         eo1dBGHGEYyviz/fIe3ZAhyZ0/VuC8eY91eaFG3Wlixzw9DwzycO8IDH4hU2LIp+4paI
         zvoIf9C2vlzXBKVQrBBJ+GfjBpplYP449dNLqqtNnWA2d0UNcNM2Ng2lbspFWepuad8i
         L1Q/cZwiwklJ9QScHp6jocllDjjLyey3aASQp7mWazs22GP0HF2EPQs6d8d4/U5UaBhm
         1S7KzRww8u83Pnp3RcQLJn2YBUrdF/qiaIKm3GvgJl1eDQ+qnT0ZYuPTQwpoqUJzYV8i
         h+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782288480; x=1782893280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg4YkPUUSRho4/mFoPTqXbvtX5ObiTPXD/x2Hcm4gyQ=;
        b=onRxUnyst+eTH4jmDYaF9imp9lZ+Y5oqtFRtzM4qdqh0D/Ht49YlfMlcSe11qolrDc
         WNIu1FqQk+Xc5aLq45geYlfOkF1tG03FE9F16p9pT8faD0gEUzh86HpIxty4AKxtpcpy
         ghsY8cEvpTFAIqpdaQ5K2DJvXKzvmjNA4J207O1oxBpczgeobrblAcSc8JNECt+zo/7J
         kIcsscM9n7Rz+VEkN4UHcfA9RFqxlKOZ4BdppKmru2I7o2lw0MU+fcQ/dKQ06Cxff055
         U0GddAbVAkFwwHOM+ayWy2Pw1uF6jxdkgTH9mEWoFAGCqoh4cxhkm34jenezhMQXkzaj
         Je1A==
X-Forwarded-Encrypted: i=1; AHgh+RoWboO/RsOGqW8codGbdB/xF1fzsqpUB1jXahX3gyu2JHNG+0dvdJu5VRCuq4go0qWV6kvbjuTj67wyZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK27ejLxgPfEjLxRDjmB0wbLqzGocaHWhM+pZxLLEg658LgM+o
	dPbl/301jL6DzZ+CwKVdx0HoFBoXDdE1bd7Vcih506b25uyn+Jp738QZjolu0OTJPgBIPQ42vVG
	ovMLBa76fWj2fAg0cxXjDECHoVkDvpU4=
X-Gm-Gg: AfdE7cmadC3WaQHKnXCV65K6Z6JBYL7sb3n3ibMM5YCH+BkAZrADgE/yC6wTbxs38US
	h4ULvfizwYMuVYNVaPnR08BhxJN0acFXdWjGYzNGFcfxv5OZDrFgQ2oLLiw4zc9PV2du7D3eFix
	qLcPGDZ51T3OOLLFqnFQTFXXiZHvZIsxtkF8ImGb2lOtFT6HCk17DrcHKfRL/G1+LE5teKmExhC
	tqVpnfvJ6nh3zYh3NGU42NUXz7Z92ICk4Lf/4cDTaYjXUHKSOVpZq3bO0GBFe8lq3nc0M3Hz4hW
	3RPPjnxsNDk8BsN06KTDHeDJUx/ZezOkuGMpAg==
X-Received: by 2002:a17:90a:e7d2:b0:362:e826:cefe with SMTP id
 98e67ed59e1d1-37dd0e1f5c0mr7674248a91.23.1782288480462; Wed, 24 Jun 2026
 01:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623105721.25865-1-phucduc.bui@gmail.com> <20260623105721.25865-6-phucduc.bui@gmail.com>
 <b73445f3-899f-45f1-b450-8031044b5ff7@intel.com>
In-Reply-To: <b73445f3-899f-45f1-b450-8031044b5ff7@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 24 Jun 2026 15:07:48 +0700
X-Gm-Features: AVVi8Cej8dXL6cUxeIBcG5C51y1ZTQRddJuqyv9y_SrE1I5UqDRCcjZojZC-JUU
Message-ID: <CAABR9nEWAcwTBet022zyDJPFVc55q4xZR7y8HNzc_x3WeCPtRA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] ASoC: Intel: atom: Use guard() for locking
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

> > Clean up the code using guard() for spin & mutex locks.
> > Merely code refactoring, and no behavior change.
>
> The change looks good - just dropping by to mention that the cleanup.h
> is missing everywhere : )

I noticed that both spinlock.h and mutex.h already pull in cleanup.h,
so the guard()/scoped_guard() macros are available without an explicit include.
Could you clarify the reasoning for adding #include <linux/cleanup.h>
explicitly here?
