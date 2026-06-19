Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5875730BF66
	for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781852766; cv=pass; b=XmRJu6EW2i/Mq98o/HwNdo12iRgkidlD2l951W4GCylJvuSft2ze1hXk21LOU0n1pThCz4SN9zHYrO4Wf2mMfmReJzYP9J6SpzshCZ0t50/WeZryKhS4aZvXUHwmYr8CPyHOXOJwuuXyOyfnQhCZwXOtthWVOYVollnUSAt4I9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781852766; c=relaxed/simple;
	bh=MFth+nQoWZzi+xQC4nT+m7rq1ssr8ND46G11AXKXufQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKpf0na9gy40B8JeWSnEH/aujBt4QzBI1MEnIj6U7KeVrlRf0/XGFtdG1kRXKyIL1YRj2Vx0N4AJKGcBtb4KAp5rf0mz8fYHiURf8hQNXyiBasE5qB7GirLSTTFuwQi4/C4TV8ZHbtB7TJQaI5VN/aTNM77NRryULGZHrAEy5jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEevzfr2; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEevzfr2"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c892a0ef503so1179128a12.2
        for <linux-sound@vger.kernel.org>; Fri, 19 Jun 2026 00:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781852765; cv=none;
        d=google.com; s=arc-20240605;
        b=Nzz6ewrJeUoKUL9TjZGAZKZKeei/aSOvT/3v0cH9i9QfsKmAnag4RgUcD8b0SliJTL
         kl33nbYEmroWdv0yzthe/ZdY4PKO+JyvsKrj/Ko6yNNewImOEGGq88VHAomxuLNe1xoL
         0ZzMPTHu/vF98wWi+wTjQI323A+6L+cSULkh1PoqR38A+Jlf24ESeSBuoqkd8XWJugP9
         Gepmn1xfx5MhM9MpcS9sTNJztossUbWOZeQUeC6RBgveB98zZM1IodkUVQoxwhyydiow
         iKtqxQHtCedXKXFXIKKk8Qq081Ehtk+np/V2uhZNmtKYWUI5gWke2HNTNzKeG5Nw3p/8
         GAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R5JtmWglfnrBZbXEbrW0sXMeeg+zOFp6mYFu9xJ4UuE=;
        fh=/F/gHcQiUuJAHT0iLCJ0eyJ3bF05qyO0djGrR8m+uxg=;
        b=fZlPKlTnINQjnnbw6aqKegkpoKl3PHFt+CCk/ei7q7X6N+tFWDQ4nI7jBfVE5zxEkl
         UjnYjjBiQjBeTN1nHhYbkPohwQca26i5lQ08ymf90fAWBadDFmF0zvRzmAw85zjPpxli
         vlwazzFlnoosCAT4Y00zSqcMKLHqBW5I8xvM68yx1oNHvpbwzQsjHJOrSqjfvSddrJdV
         Hlra8Yp6sXNpLFpaPNE9aszmC4pPMfMnVSWbLRnAVxU2EUqVKyqr72pLL2fjbJSbftjw
         XKRFRAyXqUiI1XoNf0XArUJNpNwELrRj3mU63HA9Z2ZqYDlv0KIYJYsWQVcC49HEHcQt
         EIYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781852765; x=1782457565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R5JtmWglfnrBZbXEbrW0sXMeeg+zOFp6mYFu9xJ4UuE=;
        b=eEevzfr2IQUU9GWgSNHtJWwEzbhFAO8lVJ/mnPIHG2w7+V0tXGVnB59AySlH2LJpuZ
         Zt6PVAxG1UwXLQh2+NxDRFaH6FUOydLSNyhgNR1YB5GcU6fXVSyyo7u+U+HjJEMyOhXa
         kQj3JQApVSGDOvEhF/QtxPRyQxb8cdRfq8DLtixOFFlek+BCK4xUbmEdmL0rubnL87Id
         pwrO2906+V9vp979s4gmANHw762BZvFlwr6d9Hg35MR8zyZKK3V/gPWymVXk6NZgLCYm
         BJt+jk2lKRXtYomqwdsk1uwiwJiAhQ0Jawv3KdwDJWXt/9Fu6GtyeYydEtMna5CbN7Ch
         vcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852765; x=1782457565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5JtmWglfnrBZbXEbrW0sXMeeg+zOFp6mYFu9xJ4UuE=;
        b=J9oZZ89Lt8KSYOMUGdKKZq1zYw35SiuCElKvcBWDh1UOnHTZWO9tCHp4K6MukOYAGS
         E3rfNqXulSlYMIx2fXBjlraYe9QdpkOrgyOoLm0UWQcfa4h+Xi29gMuNrhsE+9ByvP9M
         zlgp6lcfkIp2fxlm1Ad1HNAKty1OcJHRYYaeAO9SKq8Nh7D7RpR4qXu6+pXpR3GN+N2X
         YJaSVMaOmWcTElXr/O7cWVWMIfTTWB1FO7QmO9XHtPe4BB5RVdRxOfrHA1r+ftUvr5n3
         QxPX5tXo5Fb/IIWjfP+7O6w4J+dQYSO3ReQnW39fdK1XsDciX5s0iU7Ps6I92Oe5Kjg5
         Qlkw==
X-Forwarded-Encrypted: i=1; AFNElJ8dle7n7GQZTHS6rfjiy1Ahb1wlAykDZ5gLsYc1QEL2TC/vIShYftY1sYqdob2twwvkGNClDUuEtVtXiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9EbFXXOWpXmIAB9BzT0lwYtAuGBkKJdj2xgd6740dDzhWc5/
	kLlQ75kczUzjcBXKA8xKYtr1ARbMkdLR3wdW3FHVn8fqyYARuu45YPf4GNVJg3a17oTMTiKP5A+
	vs6pFdJJHyAeAgMi067tL1J1ZTmIh7Ns=
X-Gm-Gg: AfdE7clKj78+H0kZTkoWI/rWulGSFVC2p/miMG57SLH/XjG/c81FB1tCeAg4X+mCGA3
	B3GR+pf7XhCP0ZaqQdjtoRILKGF0UwiDKSKnaf+lOn1dzF63iCyePJ8DXI9G4T2H7cqeUhQ2jDy
	DEB2miMRAI+cViy7T3yQXW3JqKhFflOQUH+wY62dLExsKmqrJcpfJ+lC1ehSc4syvpvmwWwDuSC
	MNsIqXNu/bKiKws7CTaxyhX2GoDsX9IwX+M85toVUeX0w2oIFGcnQ24FBnBUll7nwdTJEUY70+l
	3ay1WM0vXwWZzUjvsb8Y1V6a5C7CSybi6XKmiQ==
X-Received: by 2002:a05:6a20:ce4b:b0:3ba:cd5b:3dca with SMTP id
 adf61e73a8af0-3bb3498427cmr2823429637.37.1781852764611; Fri, 19 Jun 2026
 00:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618110649.227062-1-phucduc.bui@gmail.com>
 <20260618110649.227062-3-phucduc.bui@gmail.com> <a3aa032c-a106-47b5-a90f-62e99e788641@sirena.org.uk>
In-Reply-To: <a3aa032c-a106-47b5-a90f-62e99e788641@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 19 Jun 2026 14:05:53 +0700
X-Gm-Features: AVVi8Cfpo4My71zZqIIH08Kk6WOOuwcr-Jfx5WWSweGiIdq6NVnjRVVMt_ZH-3Q
Message-ID: <CAABR9nGO4nS9S4M+Bf7PQkboig9qm9rRZoeJop-nAkGznDZK1w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: Intel: avs: Use scoped_guard() for scoped locking
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thanks for the review.

> >                       reinit_completion(&ipc->busy_completion);
> > -                     spin_unlock(&ipc->rx_lock);
> >                       goto again;
> >               }
> > -
> > -             spin_unlock(&ipc->rx_lock);
> > -             return -ETIMEDOUT;
> >       }
>
> This has a goto from a scoped_guard().

I think converting this code to use `scoped_guard()` is not appropriate here.
I'll leave this function unchanged in the next version.

Best regards,
Phuc
