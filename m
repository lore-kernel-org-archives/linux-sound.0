Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980547;
	b=bZrS9s4GoaExL7KlZZiCv+qqTNsUIo73b72zXx8lfDL/pLcqdfw7FYXTcbTmHMFRa2Gz
	 choH+lWlgL7rWWya5P1RSsfZJFhfiKoPr3BQNmLiKVz0Ufian13NR787mONNG5qe7Vgvm
	 Xuy+gVGqamLIk+ewdWk/UIRfFw0UGgM1Wydhdo9sxG0eFcWFihQp43tLH45aM3SYoyJA5
	 1HRXug397iTySzSA+YCkFhxPo3g8wOwRNMdXjPs95StWuUbF+m8Y3wvt0Z9xIOr/3vWV2
	 3teOUUsHOO/cdoq+MwOrZz3UITgfPC62vPAjTrLMDuWv5unEXfFeqbq9nTMZln22Hng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980547;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9RI3QI1rwBUdIa++FPHBJyeRrlPAdNvnGDZD89tirLE=;
	b=5SM75ambpC848naOKTOBg2MU+TOgv0y8IZF4o4J+NE+Ef9gRHZkC45MyX46EtUJ43gqA
	 nwrx+0Ruh27F7y9UFDJQG33q79EMG0VvYUgaRzMYVtLu2aUz2RFlpkBUpJAEDg17L3ydF
	 UkJVbJ93t2hrGVn49FhYE1FvOkTCLhAUZ3tm66LTivJM+5E5a6ZEW4e/8kcevi/i7zCRY
	 GlHyvJuwG+jXoaEMoxp/tUtMyP9G/Nce426qyR6zHjtVvZrRjwfSDsrAgACOwJ2/9Wvh7
	 Roryq/Xq0X1HDnvNVW/U2Ckyc4AW4To3qBwgrJXMFPOQraqz4deBufvNWVXlrYa2xfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDcjGXyM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D64606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDcjGXyM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B231F0089F;
	Fri,  6 Nov 2026 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793980547;
	bh=9RI3QI1rwBUdIa++FPHBJyeRrlPAdNvnGDZD89tirLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WDcjGXyMtDaYIYX90y5PPnZRSNtg9VYop0t5WbQkpbO6CWnQWWh+pGDRfFpjNvOtv
	 DSEdIm9JuDydMrcExV6SY4EC/GZfADtQPv5p5R762ARt84TcTOXIdAmNe1k5z/+Qbf
	 gBRZ0IADRfE0qbHOpSo19LNsi4kwcqe8wpwODXASF4qT+OoMjkoS6fW9LAI4Zcl+c5
	 zmbUwm/VKjT74yWD3qJEvddre9iGT+Dd02ocSMA0Q0XIsBe5WKWQE4ydvQ/sV2dcXN
	 HQf6LnQUCKLoEEj7tZUMitAg8RY93dYEiGqBxwYSUR3FjiFImst7LfwrNif9JnXkuN
	 E5KGGgk8MAh2w==
Message-ID: <sashiko-outbox-201745@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: es9356: fix the capture gain dB scale
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zachary Huang" <zuzhenhuang365@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <179398005797.39773.18432202435074682955@gmail.com>
References: <179398005797.39773.18432202435074682955@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 15:55:46 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] ASoC: es9356: missing Fixes trailer for commit 5d9cb740cd38
--

commit 52267100487603f3acb6a660175cdbfe55292773
Author: Zachary Huang <zuzhenhuang365@gmail.com>

> ASoC: es9356: fix the capture gain dB scale
>
> The two capture gain controls are declared with a TLV step of 3 (FU33,
> analog mic) and 6 (FU11, DMIC).  The TLV step is expressed in 0.01 dB
> units, so this advertises 0.03 dB and 0.06 dB per step: with a value
> range of 0..10 and 0..3 the whole controls appear to span only 0.30 dB
> and 0.18 dB.
>
> The hardware steps are 3 dB and 6 dB, i.e. 0..30 dB and 0..18 dB.
> Measured on a MECHREVO WUJIE 14SAH (ES9356 on SoundWire link 0) by
> recording the same signal at all four FU11 settings:
>
>     FU11=3D0   rms  523  (-35.9 dBFS)
>     FU11=3D1   rms 1007  (-30.3 dBFS)
>     FU11=3D2   rms 2011  (-24.2 dBFS)
>     FU11=3D3   rms 3794  (-18.7 dBFS)
>
> That is about +6 dB per step, matching the hardware definition rather
> than the advertised 0.06 dB.
>
> Because userspace (alsamixer, PipeWire/WirePlumber) derives the volume
> from this TLV, the capture gain currently looks like a control without
> any usable range, which is also why the default setting seems impossible
> to raise from the desktop.
>
> Assisted-by: LLM
> Signed-off-by: Zachary Huang <zuzhenhuang365@gmail.com>

[Severity: Low]
Should this bug fix include a Fixes: tag for the commit that introduced
the driver with the wrong TLV step units:

  Fixes: 5d9cb740cd38 ("ASoC: es9356-sdca: Add ES9356 SDCA driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179398005797.39773.=
18432202435074682955@gmail.com?part=3D1
