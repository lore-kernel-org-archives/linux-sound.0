Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782A43FD05
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828116; cv=pass; b=hHR3CMBxnGVWICH++BJIzGcVfRQlmYoJWw/QviOdufk/kJR6fKK3XhsigrpuwFU6Eyxq71aqEheBJzPAYGWBQZ9HMK6AEc5OppuNt6anSqOvuCVFE3I4D/mKtZ5IzA/IjTjRQdPFGJNMN08Vdyr7vf/DTxXQjAvNjx2q7ydSH9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828116; c=relaxed/simple;
	bh=0fqy3af9PktavrL7zLUBrF1S/FaRBZ/LQmpCXI158wQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tponENQ0CALLim0G9u2hnvdMlIqMNBx6gV7BoW3jMMI9awbphXRYIgXTzRBmGD4kcfwL4vWQrHVc8c/UZZ/YIrGPH2kt8F1yZXazAnkdw66GtcNGQHsF3RIwJ2hdtQuhuuzq0KkAdFKQKyyp5uz5nrGT8ms+Ff1ApJxI+5Q+6WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOA3SN3c; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOA3SN3c"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so993644a91.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 03:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787828114; cv=none;
        d=google.com; s=arc-20260327;
        b=Vp2UGU97s8kcSDqCsF5Z0Zd3vuba4g7lrjUsitWdKW2B+ifmOnvkO4nqGhGqz30W7c
         P2ms0MqRV+yeRypMaG8cM0dIl46u2b9btOsFpTs6eBmZQ2FaHpE7HP5lKpw8TRpbRy57
         WEl48ifKZWlm2mj1IKJc6yKw1hFJKEKp6bAAHOaAzrA2B/Nv3nS+T8D0vt3Uk/QaSPoi
         BQOCi+zlAk3LviZFjd/iTDfXyznsC2KxfhFt+xeKx15Di1jLFmaVGMm9O+G0jn9Zov6n
         Ri8Nsxujr6HPvTEEyx6ymZobTQW7sz61lhhIrQoPjrFR5IXuhiqH/D53nFmP0vpGXESU
         uBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qI/lN7pL0l4yy2+hZsgq6Y+He1+tVhEiomdMwADOmaY=;
        fh=tGMUfrBaI8L7rxRaV6lz7JL/2LLd1pGUPUbj47Ioi+I=;
        b=hmp0zhZZ4ARjiLOnZCa+GAZMUFwtm4HjKq+Ox0eppZwTBWKQZPM3YF6yvE5Jr9/67t
         j9RdwexbFaA+e9g/QrkuE3p7j25o46I/d8TAu+ohe5dWNaZ/XYzJOiNcCeNSBOOBCSNk
         bOAq2yANp6foUuRn3sMbfXEsdyBesuoLiaSCR96yWBeLI+9p3RqJATH9jdUR9hsOQGJo
         ePkaX/tJQJfY0m8fEWbCdRIz+JH37iA6ONDiazAzApx1dM2SQSObEvLQeDsV5MZvltF2
         AAXIBG4P5DBK1zY0UqCpLAQCeAD+IXqzV1uz7fHZxy2uVkAwHVh5DkeXz1mahFgp2rRa
         4fnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787828114; x=1788432914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI/lN7pL0l4yy2+hZsgq6Y+He1+tVhEiomdMwADOmaY=;
        b=cOA3SN3cj2UkcbMx83ukuTqB5nSkRZvzNvA/TqgMMgy3xJjrNu36stet3eXUFVznN+
         16y9KoisE8u74D7o/Npw377gDqbixQSqDr1/VRrL21ZOCRC2duaVyfuqXnkzI9dTKXM4
         gufnIpUGGn/WWWhY3mIUuaiBju2LM+G1HE0P2FSs5IpI63u22RyP3qyR6Ugnu1LhYopB
         guVW5/XZnzIPTUQj5YQA3PcoQP4sP7PVC91hRzaYvt8rUksYPFZHCy2zLfStWKpYobx1
         H70zxTlWHFZ33xoS4uFJceXuGgT6rMX+WonRHmNhi9hTb06+mW9bLPclnK0oNY9RJ0Hu
         SPbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828114; x=1788432914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI/lN7pL0l4yy2+hZsgq6Y+He1+tVhEiomdMwADOmaY=;
        b=e/HemPnqftVVnU8WCQyoN0IT/A88KaYRgSmiWYqymjXfoLua3JGzc6d5uJJrZCw6Bz
         Ususu0l0i138yLP/Wj4SYX6LjtRTUkwXwud4qnqE+2wkO9wsoNaNr9AYtebcRNEFW/tD
         RqMGxyBnMRDb/xm8JDuZfBJ7ZoQDO1caAUR1JwuEzb4QkeSzd4ZAhr8FDwcqcl05NnL5
         04EB3ZB0H6/KEaHjjRyN5gC10DPtHHrpLCZIwpKKl9IL84czhQjdDe1SO97aJk16q1aW
         mnNVwvFG5ZksS8KJGMsplI3cQiR+VfarNguBGobEO7GBymR11aTLY+omIdKd9jdGIUSS
         P94g==
X-Forwarded-Encrypted: i=1; AHgh+RqHmKvEm5+n6r1ZcGg1bzrYAOWbdTIcQnvUJUlIg34bHIRm6NsRnWMjdaHagbK9e9kPz854vEY8oSwosg==@vger.kernel.org
X-Gm-Message-State: AFuF++nIvp/b5T085KmErPabib05TMlG3mkpV5H2PZy4id0Z7RhzuotT
	pFhQ68CMgnwA5BdOR6haYXHJFU1PWlu01C3AyxxWN2oYQR7JlK8Qxq2CLJOtK/nCDYeSnvN/edY
	9nnnmNaViMbUHySEL+WgnKdYJ7vel3C8=
X-Gm-Gg: AR+sD13O+OIJkmZpN0VsFznF3+5ebY7JVQdAisDOF34VJG+oEA4/sEmmjCSLiCOAdhy
	9/d+0xv9ShRfofRlDGP/ZDedzXyPATITUlb7KRVomt8M/vQ+AKXQY55ufkkv+WbA6Bpw++b43O/
	qOb3W2RaVSxqV7DG0SoI6H7XbErItlMjFNQpAPfzcSO1/mF7Ev3A4aSiCysykmqfRa+O0zxx3rt
	kjpaso2yjj/5PO9WuHMqWNHEdNKTsa1Ofnjw36/2Y03PoFm65ygIc+wss0uMl/iZMr6awE3Udmx
	J7fDnrvZoQMxx54Pbq6egra3yjxoYHES7NhcilydHDt9Cg==
X-Received: by 2002:a17:90b:530c:b0:396:635a:9b10 with SMTP id
 98e67ed59e1d1-3966d3dc393mr26464099a91.11.1787828114126; Thu, 27 Aug 2026
 03:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
In-Reply-To: <20260827072517.1401173-1-mauriziocasciano7@gmail.com>
From: Yauhen Kharuzhy <jekhor@gmail.com>
Date: Thu, 27 Aug 2026 13:55:02 +0300
X-Gm-Features: AcwNN1VdHEYwWlgzfD875mKEoO2bj-Q3vThq76c264VRfXQwV0io4s2nJvz1k1I
Message-ID: <CAKWEGV667AyGDpz-mJn3phTOjKZeVTC+of0Zx_OUZr4H3+_jxA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maurizio,

I am glad to see my (a bit abandoned) work to have YB1-X9* support in
mainline be continued but please don't drop
my ownership for patches when using them. Use Co-developed-by: to
mention me as co-developer
and keep my Signed-off-by: tags.

For reference, my WiP v4 tree is here:
https://github.com/jekhor/yogabook-linux-kernel/commits/b4/asoc-yogabook-v4=
/

=D1=87=D1=82, 27 =D0=B0=D0=B2=D0=B3. 2026=E2=80=AF=D0=B3. =D0=B2 10:25, Mau=
rizio Casciano <mauriziocasciano7@gmail.com>:
>
> The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 link with an
> RT5677 codec and a TS3A227E headset detector. Its amplifiers and
> headphone path also require board-specific GPIO sequencing.
>
> Add a generic Cherry Trail RT5677 machine driver and match the Yoga Book
> ACPI codec ID. The machine entry supports both the legacy SST firmware
> and the separately maintained SOF IPC3 topology.
>
> This continues Yauhen Kharuzhy's v3 work and supersedes my RFC series.
> The driver retains Yauhen's copyright and links to both his original
> implementation and the v3 posting.
>
> Changes since v3 and the RFC:
>
> - rename the driver, file and Kconfig symbol from Yoga Book-specific
>   names to generic Cherry Trail RT5677 names;
> - clone the card, DAI links and link components per device instead of
>   mutating global templates;
> - allocate the headset jack separately with the device lifetime;
> - unwind MCLK enablement on PLL or sysclk setup failures;
> - document the codec ASRC clock selections;
> - add the complete SST and SOF machine entry once, reducing the series
>   from three ASoC patches to two; and
> - carry forward Yauhen's copyright and provenance links.
>
> The series is based on ASoC for-next at 8a070652d919. Both touched C
> files passed sparse 0.6.5-rc1. Strict checkpatch reports no errors; its
> only warning is the generic new-file MAINTAINERS prompt, while the
> existing sound/soc/intel/ entry already covers the new driver. A clean
> 20-job bindeb-pkg build completed successfully.
>
> Runtime testing used an integration kernel containing these exact v4
> sources on a Lenovo Yoga Book YB1-X91L. It used the stock signed
> intel/sof/sof-cht.ri firmware, version 2.2.0-57864, and the separately
> maintained sof-cht-rt5677.tplg topology. The following passed:
>
> - UCM Speaker1 and Mic1 route enablement;
> - PCM0 playback and capture at 48 kHz stereo in S16_LE, S24_LE and
>   S32_LE formats;
> - PCM1 deep-buffer playback at 48 kHz stereo in S32_LE format;
> - a bounded routed speaker tone and a non-empty three-second Mic1
>   capture; and
> - PipeWire playback and capture with advancing PCM pointers and clean
>   PCM closure after each stream.
>
> The GNOME Settings speaker and microphone tests also passed physical
> verification. No SOF, IPC, XRUN or ASoC errors were logged during those
> tests. The SOF topology source is maintained separately at:
>
> https://github.com/Yoga-Book/Yoga-Book-Sound-Open-Firmware/commits/featur=
e/cht-rt5677-topology2-ipc3/
>
> Maurizio Casciano (2):
>   ASoC: Intel: Add Cherry Trail RT5677 machine driver
>   ASoC: Intel: cht: Add Yoga Book RT5677 machine entry
>
>  sound/soc/intel/boards/Kconfig                |  14 +
>  sound/soc/intel/boards/Makefile               |   2 +
>  sound/soc/intel/boards/cht_rt5677.c           | 611 ++++++++++++++++++
>  .../intel/common/soc-acpi-intel-cht-match.c   |   8 +
>  4 files changed, 635 insertions(+)
>  create mode 100644 sound/soc/intel/boards/cht_rt5677.c
>
>
> base-commit: 8a070652d9194babdd35bf7cbd2c6722b441e8f4
> --
> 2.53.0



--=20
Yauhen Kharuzhy
