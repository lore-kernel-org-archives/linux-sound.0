Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AED29B77E
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916517; cv=pass; b=gOjHBDTriKvrJ7ZSZGc8RIKb/zzyQSBSJp+kRa2T5KK2WjBrVoxqfT7tLZryPfuylzIspwbj+01inwMfjlNlafgn+rTnfqV4xmFqndev1KxTHoLKpy6ZYBKA+0UCZhsR2eaM/NR2e+QggwIohEsOrYjkGcihEtXoA8N1+aPK/1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916517; c=relaxed/simple;
	bh=ONm94510NvE+rTU8noOpilGgyC63W9CbOfLvEbHcUkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+7O8pGHIWKsfqK7HQ5dxAkLh4Ih4oB49nIW0SQiFV+TFhb2fNcvYRy7JPUikvvELphPn3AuqBDzlmmWvJhMRD3ySTy2K45hRB7SCIXlzpKdN1SnLcseRwmm66odKoeBbWl7rI0+wt9sG6GAWEd1dlAnp4iPxMz555PRRkWGTbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJ7SR+kp; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJ7SR+kp"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8589498839so1735936a12.2
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 04:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780916516; cv=none;
        d=google.com; s=arc-20240605;
        b=cXDCYZIil78c3rPxPzQEu53iPLyViA8sawG33sT0gWAjPVD0DhgaRAOL4j0RhO9tS9
         hBug9+8ZlmJ1+ldfvO3pcHvXwKDGN7hn4vJnZ/VgOI3fmwiEqN5m12R3PSe/3YCXceEc
         W0ULFDG4wluBOmqY3paeAeG+EAPi/qAgNnUm2oY0vVOh4Bhou6CoDNJunq3FzyLqx4B4
         9ugOrTfrANshhm1+CFKW6gwiPorAerlF0t3trMeBRNxu3jqXdVXIqy+TaPbtmao1CoAo
         68SEhOBtUhsQ4xW7alV/M+VIL3ZL2ZmgFOpxZZ17aQ8rBIAYqHyH1guisiGbmWAuT7Qa
         rN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        fh=A/9vSHMGMtcrADQNbc2e/atfTgs2iBtNePAZNAV/VH8=;
        b=Jn++vQpIWBkw3xH4dAvWCJPsLaKL1byclKseBA3e5jIMNLXinNc7FZYMLovdwphewe
         rNxf9lyTRG0la6ET1cxjJaSOGhSRoyHVcBXiOui3KSpWFCoMJC4tZ1799fAZmq5dCjQn
         y8PBuC/HwX3fYL4Dm2NUPW9StrqZ/RahjMiqqcZ8mKEOdfILoLJijZ+q/XtIfQIL5rkw
         P4qtedvmOxJ6am7P8cQefCOz6OoaW85RnCeq51uBrAX99wvX1qsETPDWdQn0M18IJAuM
         3uhp0gaGLNK2e7q5uBm1rKdsOQmKm80SOEB3F6u7Pa1yFTirK+jRrlRL1CA8nyUc0amQ
         mA6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780916516; x=1781521316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        b=aJ7SR+kpKlnNp4avZNM+O6GCA4unLNAJio5XAehXMdoLsi+KxK+2tUMW+hAo8qi8UV
         TJ6h7vYjoEkPyDzhE84JdK7yyrjV3GvKZD0U2AZLTdkOWyfD2S9k9TOU0vp4IHiZLLOC
         +J8mTwU+jvB8I8w9jObrs2Tn7ti6HNlZT+lyKr53Sbjj09GF1G76PmXguWzezLjqRPb0
         5w/BN3M9OAZCdkWkk7FrmaGiVh2xzByuleGlOMHejjKS9tjuTHru/W8t4/eCwZylzMd2
         sBpAjwHotk1ht2A66Jd0YwdHSXshAYaG5mJT3NkUYWay5AKOZdga8QH2XnYHVQ6bjNBJ
         HQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780916516; x=1781521316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0epkiE6i5vofqrFH2ymbPEymHtg3jAbv1O27kdOmNY=;
        b=tZa8yfrPj8B8uV437gtuOZR1So+OKFkl8slXcLzZ3pQACOh5mywaLqoJxaXhh/QRau
         qd3R4Ouk07LSNXI5aNnvJu8/hx5ugUQwb3mSqMZPhNvzdnXhUQdIqxGG/HEeliffelOP
         XDtYpLeMr1EhdK8NV/0DMxRQ053Owcpfox9xJUJxsotX/md0h8FNkhLBCljXg85sOqTS
         jhV5GHvK+wgxDWB6hDVa80R+DjuzuDTKbeKznyUEmwvkhz/uPhqiqdvCUbQm7nODlkjM
         Wnsev7iam37ussS1plZSk1Obsr89zAmChmJbD2VLJNi4ok8Z/dQm6+MziK+mKvcP/w4N
         r1pg==
X-Forwarded-Encrypted: i=1; AFNElJ8xl+BhzIOUKcRteoFD2vIiJy6U4NDSo51WPpAkTIxb/9kItaafnjmoQv98WQ0HqjnWbLcUcYymFl5IxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Ps4kiCmo2ZeZ/+Q+EQ9ckzPGh3iFFOtbsbUWabJZTdb+42gv
	IuUGXajfts+hnaBu8iv+Cl2EB7VckiH+yosVQhzSgDWETgWvzkYOnLBqGJjpnzyXtu/P06fGhJA
	3bENDQD58eOZCAmqyOkAJdPRzPmqZeH8=
X-Gm-Gg: Acq92OGZBqu4o8NO1b5C+P/kYwKy+3AcgEfV9a94V1tLsYDNB6w7Hp+kV5ahN0Jdgk3
	okNklEIApu1V9BgAJ/ty0MX/JRJsvU54RkSkeqokmyJTZg9AASCaAgtKghC90T4RJJo7Ike8Lyn
	tDzPBBpc3bjPHURbhIvkYZiKLRUMZJitKVzgUTzjFB8kXjwxL5YKzWLDdew+wROK1D+nxiVFDq3
	+QSFZCZCrzdWALnBh6+Ifs+bYBeonFJ6dyQBaJHRH/woPsJDKvZl1Q7FcnArQdNNETlNTSXEk9S
	quVEUUXvKlbszlaw9aToon4NRuSZgE0Bz74Ys4+8mL7eNPdL
X-Received: by 2002:a05:6a00:4098:b0:842:38c7:9925 with SMTP id
 d2e1a72fcca58-842b0e3367emr15279810b3a.2.1780916516054; Mon, 08 Jun 2026
 04:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
 <20260605121955.105661-9-phucduc.bui@gmail.com> <8733yxgajv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8733yxgajv.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 8 Jun 2026 18:01:44 +0700
X-Gm-Features: AVVi8CedRoipr9OOnup0ZkfX76Kd7vpaIrvqocnniiuTgV7U4RTC5IPNi4Uv0W4
Message-ID: <CAABR9nExkENpP17sMxOeCLA288kU24ftvDBmXC6ox0wdo6+6Yg@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock initialization
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thank you for the review.

> In my understanding,
>
>         [07/10] patch
> (A)      - devm_clk_get() -> devm_clk_get_optional()
> (B)      - use dev_err_probe()
>
>         [08/10] patch
> (C)      - add clk_spu
> (D)      - call fsi_clk_init() from probe()
>
> I think...
>         (A) should be 1 patch
>         (B) and (D) can be merged into 1 patch
>         (C) should be 1 patch

I understand your suggestion regarding the patch split and will
rework the series accordingly. I will send the next version soon.

Thank you for your help !

Best regards,
Phuc
