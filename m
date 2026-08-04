Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE442E7623
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785836764; cv=pass; b=DOvcABxBNSt4uVAnewWndxcvOCgyiEb0yzFn8PUhXh6owzKHE0T/WaSqrfOW4IIb43xLmJP1G/bbCOUiZXaGNLm2Dq+mV+z4X7zjPSVf1H0cjeSoTWaBqgYlkfJrdc4nYSy72/0dQTPuIkb5SjZJKm+F4b93EgcSTxxUh8k9rdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785836764; c=relaxed/simple;
	bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyiBlp51unphgB9fT9VVo7cUt3McT8EHOltHhhs+/soDgVu2m1hn1NtYZkAqSJKPp22/ZwcTWPoX1tmIpWNJlBcRnnwe2GZ7BBcmFZ9blmEZIZqZZEtYYAgLJTKH2g4XsDbDnAz03K55SxrC1vLLBsdSb2LE1ZLqsbc2NFPwHdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNgW8u35; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNgW8u35"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ceab75934dso51754975ad.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 02:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785836762; cv=none;
        d=google.com; s=arc-20260327;
        b=WFi7CKOu6WSnR1xHyTDWwgw1Vs5WpyswwOksZ5ezdbMnUJ+U9j9U2Pk7uMdv1CeqG9
         I0q2+gPRITrau8lotCWMZYmfBS63vOVJt92j5fTa2MA+Kg8bT4SDzoxVfpkJbXlmnnpm
         K/pu9eTld3y6X7Wv6Cw6dZFD2CwN1Od6w4WpZxhvhEM6XLezf/lYW2/Xd7hkhTrw1NvC
         3vJ9ETAKficAReKnZUlH/Ma7wlCexVu0wF/GzyPtsZLd9Qf69SFy4IkhhJ48f5Afzd1j
         L8uvEqTfEDX72s2biZaWVhum19zuQ25ptQnlIVa0FjbwhSj7Kiolcce/yXgEi/+cQB4d
         eYSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        fh=vt2hBn6omn6iemXtYBqWviDOcMORTc277XF3/HnRjXk=;
        b=L1Bw0qARHQeVCbf6+YtlYTzF7B2yWIlcJLTGqsgZt1gnXq1/5RfhOS0JGFlhPCDy4p
         DpAj5aqupmeMYhVsSSL5d4zLfx/bcnWtg+2H0Tg/alOg1y83nHgA2hKXO3jcoexIkfYd
         EtYhhl7dPDm61km2RhPSjf6VUYOYdrY2dsNUJNeVl/RtxULJFu1W6enV3eEYoRXnv70t
         A2+3YsFZUPzRngTYuTeWuIyRUJDggdyyZVzLEQFbI0lSAMXpkyW2f0QFPgtHgsFAQWgt
         gKNUpOWRXLp3eHOQhFmSX63ZaVLEGlkrexZXMETXTwxzo5xGm96vOrzHXOsFr72VVKYO
         MclA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785836762; x=1786441562; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        b=TNgW8u35Wf7yB0BUvXY1EiITdHlTd2IT9YhVzrFsYNxbLReeyDuvuz9kAlRhDpoMHO
         PqMLY6ZSgVjR8lCvhxZXs3p9Rx1XWLZh1FXCycQPD/5+SpMDHQo6+1QJUOkDCsOrOkG1
         tVfzFhQvWy2ZpSslec2OLSotyN9IbK+uGob8vuHRXYWUoSrGUfQKaGyL8xG5lhsW8TtV
         bFkQ0hOg/B+m4P4Tjro1kXXuuQ+vrWey7HSltFTHpBnd/mZ4sQT5z0p92ErzObU3R2H4
         m1TseA9E00c2wxp66EETqjioOen8CITZqbqPAbIqOiJeWDStDTwZEyNyL2TxvESfQOoQ
         S2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785836762; x=1786441562;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B+ug8BAHEGyoCAw8DucRTEAi4NpWplnsoASlAual2G0=;
        b=kLSc0E9XNS91urPAggVyCC3rAQRzg6/C3CiDkGGkmQFKp5hm25Ockld8YpyLakvyVL
         4ZGuNvNhqfXlStmxg5BTRFignGg2sqksZzrsiq36MNvgCWaSCN4VkEKiK0n32PynWFDi
         Le8fpLflCRBn8gjV/mcfPBiCYepPCgwW29TCHa8thUOmxIesG7fOWM24knTnTRCDA1/F
         UNZwjByRKe5CDy8ZGahNcRE6hzZQ9C3c2NBfziwI5CojIVHEBTEuCOKxnQKs7+DXwU2A
         NlntCDA5mSKtCgcB0NIx8O1gXrTUM04Vw4kqyvuhjIECd/5HR+42+r1R6Fj2D3OqC3Rl
         4hiQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6TS6JIOQG90PpzpEaHQKAHCvb0OuEhIqMQ3hrdSPuD9YppmLoi7tEX5tTIcs6JraEo05mk2rXmP3ZnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTNeLFiPqsILjwkbHqsHwatViAr0VAt+foTCxeJNG+lzPKUje3
	UrEwoJMmwi9SLrTX80gQe5JoxumHSD2gQioZ/2bHmGy/tqbAYt0IZ9ptfN1iHNHxDgblcLXECiy
	bGhJsscnJYj4bArAAHjKKMHJQy99XZvI=
X-Gm-Gg: AR+sD12M4fnJ7aoFyVIfsdxud0BhmIrzVqc2k3/fpa0i2xKYY8FOl3nkT0n/TVhPPvB
	1i5XgM1I9dQzGRQABpOpyt5UuaEp/kwyfL5XnIBfAXt19ltOf+QGvg1UOBcedvLI49UczvLxp9t
	A6v7susay8ByigoomynENM0iUWNS6B9nM4N4pUqwrkTfyGSzBzYHoyPZG7n79WC6GL1te/iSOIZ
	WuFc0CODXNSsZux4JaGl1KBml600BfB9+HFKPxbh5qDAx43KpkBrFvgdWZk91qhhAFl0V0zIUv2
	bDzSIGefBNzkVHa/gmDU2PfSrj4hVDKCEC+Dik9f8e8EIFVmuLnrVt8ZzL/nRTXyoPYnFRFvT00
	SCFOJt15cppa2YxAjT6QJv43L/fIjnRx+KzanmjvJnwz/a5tXPVg1OTJzIg==
X-Received: by 2002:a17:902:ea04:b0:2ca:3df2:919a with SMTP id
 d9443c01a7336-2d0524a6a14mr133306145ad.33.1785836762473; Tue, 04 Aug 2026
 02:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804043036.22065-1-phucduc.bui@gmail.com> <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
In-Reply-To: <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 16:45:51 +0700
X-Gm-Features: AUfX_mzLmpOk076Xm-y3rQ56B_xdDiTseD6kbd_RoFN_z5sig_vDzkkt73AmOmY
Message-ID: <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Troy,

Thank you for your feedback.

>
> Initializing these fields conditionally preserves the existing
> capabilities for devices with both "tx" and "rx" DMA channels, while
> correctly disabling directions without a corresponding DMA channel. The
> added rate_min and rate_max assignments also preserve the existing rate
> constraints.
>

Yes, I agree. That's also the conclusion I reached after reading
rockchip_i2s_init_dai().

>
> With the current static initialization, channels_min is nonzero for both
> directions before dma-names is examined. snd_soc_dai_stream_valid()
> therefore considers capture valid even when the device only provides a
> "tx" DMA channel, which is permitted by the binding. The DMAengine PCM
> code may then create a capture substream without an RX DMA channel and
> fail during PCM creation.
>

I traced the probe path and confirmed that snd_soc_dai_stream_valid()
is called from soc_new_pcm().
However, I still couldn't see where a nonzero channels_min alone leads
to creating a capture substream
without an RX DMA channel.
To avoid confusion, I'm referring specifically to the DMA-based
configuration, not PIO mode.
Could you point me to the relevant call path?

Best regards,
Phuc
