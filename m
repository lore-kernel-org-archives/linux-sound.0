Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5333DED5
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189606; cv=none; b=g9IR8NO7m4nsLTbLHJvUwE/WfyzaFSYJz+UdvUtzzaZMqWApMMTfJukJnDZhsDjj0P5Fd0x0jqNNeYM7sMTfcE+5+rxceoCAWNAxAJdnCUwZG0iMEEokhh3cvr+xHUhSkjp3k2tIV8Rnn7JktufUxCA9hLtf640tFHLvzSLWWLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189606; c=relaxed/simple;
	bh=BHGXzZt1d8W8ecIZ1QwyHNFQkiYMz+073p25eXAQcz8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:Mime-Version:
	 References:In-Reply-To; b=fIK30pv/W8QEfZqP9ESaKdYM7tMhd7whhylCJBoAXqOeDVMVgdkN7d9Y74aAEcWK+cq5qMgeFDtkXwkl6EuDKpdAcMcko/DWSEl03nKV4O+6Zv6YrXC1L6YuP/pOO+y/n5pCMC2MuUIVDpCIwgMEW8GW6CfM6cJ0gAET/3yrMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=GiCIbKKf; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="GiCIbKKf"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15cd3fd760so727032266b.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 01:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784189602; x=1784794402; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AeCiWXObqZMn+CXaMwaIUj0LKi01F1mPNxBE7Xp9sFM=;
        b=GiCIbKKfH1g/0PW3SwLqwBJftZrRKlH/J+yXbaV5gbzNkIHdJK+Fpx/Ty0keVU5IJy
         W4lgrg6qw9wv08GZoCakp/pRhvfKVdyWjyrYClrx6UAo9QhPwdAlgSN95sPWv1bhF1Qb
         lmKalNUi4vJY20bGREFx44Wgkj3UDu4fW562LvAzS15TDSBH0Bw4Uq+Gme0iBnyi6lVo
         yaMe8bexFwHJD3xR5bnnQ4uX3IICh/TeVDDo5IM7tx6GTnA8CrwPRSUldeJlxMHMwd3X
         tcJZg93Ueq5JQ3UFms48G3sKp7m1QX66ZwE6ATo8UbBcHiKYGhp2AzLILeDSaYDQFHbl
         dsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189602; x=1784794402;
        h=in-reply-to:references:content-transfer-encoding:mime-version:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AeCiWXObqZMn+CXaMwaIUj0LKi01F1mPNxBE7Xp9sFM=;
        b=P8DCzRc5Q/TwuYBE9SDnYdJ7Y6sCPOItpbWEV7BtBVQ6hRAI/NIub4xcKzMT1n4QOw
         cMIQjGH4hnPOtxR1GPtGRu7rr/lrwfyhPJdSPSggdj7V+NOmqIXyqxV247zUI7d3laVK
         GrHZuylH8cb8y4AQDx9vKOJvFcUonaYDsZlyr3Hc7807qt51DXIuFlVgF+VgqjZEEJZT
         xXerapY9MJxR/QNT2MczSEOSogp/dq7DF/95LyMY+/fFYBR3yz3hwYg+Ro1PyewNWZwS
         9ryZzx8gvq/vnwljUW17HQOljW2JwbZGnDfcFvEuT5UHQ44QxS8W1vCGxob07QkgczTo
         DEQA==
X-Forwarded-Encrypted: i=1; AHgh+Rpdk0NqcQ6WKxaRPySXF2xyugR0l5TvSPk8gqNTGqVW8f1/FwG311Cj9A8EN7iv+uRJed2mNiv1ix84UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YydSNQ3LGDF1Jsnze6tX/h1RVKi8YwDFy52w8avX9rKY8BAmxz1
	lnWdNB3A0rO1WI5dkZJvhmgipRnU9h8KLMj/kiWFyTsmmXyTfReLPJDJlrdAk0WchKZ4Gih7a1I
	xbo6P
X-Gm-Gg: AfdE7cmPCXnoYBEQB7+Zd07/XjWCMYWTUYVgNGr1OQDPTravyHGaJDgy1RidcAr/nHc
	VrPHLYz7XrR1wrZcEK3Yu6I2PtSvrG+1qBRHHlHt9JZmMY2rxaO73JAtSoTGsr08TFZ8CRHuaIL
	/29J6o8bqEwLWloa5ViYqMfqxSlzyViAFgeN8uLIGhbRDPnnjN9aDNUcnjLBIB7vjZnkXCvYaay
	ssCXAD5aH+neCIgPUThNa4gL6pN8+Ds5bCOhZNZjW0r4E16LaeH+1HnV+5UNGBp+D74v6AFaG//
	qZLC2Xtq6w1x9169P4UUV3P9XZ1vynPxsm6tArxwi9LjfV4LRFjVCUUGBlFmHpuvuSrGuFpNLum
	T0WDDO2bfPlNRPFBYm0aJ5swthQCLYwcyly59Vupe6xxVdjZC5I1o/WeMZ20UG9b0mqGPaGYscH
	pA9cqzL/zgNziHb5kJdFtUA7TGJVM4rGTg8WIZEppCTV4i4UE=
X-Received: by 2002:a17:906:ef0c:b0:c12:9b93:61fd with SMTP id a640c23a62f3a-c167921baa3mr388583566b.6.1784189601892;
        Thu, 16 Jul 2026 01:13:21 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687166b94sm156110066b.17.2026.07.16.01.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 01:13:21 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 10:13:21 +0200
Message-Id: <DJZUFFHFXZBK.3S5A9OPE7XYEZ@fairphone.com>
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>, "Mark Brown"
 <broonie@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Mohammad Rafi Shaik"
 <mohammad.rafi.shaik@oss.qualcomm.com>, <linux-sound@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: add the Qualcomm WCD9378 audio codec
From: "Luca Weiss" <luca.weiss@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
In-Reply-To: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>

Hi Jorijn,

On Mon Jul 6, 2026 at 9:22 PM CEST, Jorijn van der Graaf wrote:
> This series adds bindings and a codec driver for the Qualcomm WCD9378,
> found on SM7635 boards such as the Fairphone 6. The chip pairs a
> WCD937x-compatible analog core with SDCA-style function blocks whose
> built-in sequencers handle the analog power-up/down; all control
> registers, analog core included, sit in a 32-bit paged SDCA control
> address space behind the TX SoundWire slave.
>
> The driver implements the TX/capture paths (three ADCs fed from four
> analog microphone inputs, three mic bias supplies) and is modeled on
> wcd937x, reusing the wcd-common helpers. RX/playback, MBHC and the
> SmartAMP function are follow-up work. Register sequences come from the
> GPL downstream wcd9378 driver in Qualcomm's audio-kernel-ar tree; the
> chip has no public datasheet.
>
> One dependency outside this series: the paged register map needs the
> Qualcomm SoundWire controller to implement SCP address paging, posted
> separately to the soundwire tree as
> "soundwire: qcom: add SCP address paging support". Without it the
> codec enumerates but every paged register access silently reads zero.
> There is no compile-time dependency, so the two can go through their
> respective trees in any order; capture just needs both to land.
>
> Patch 1 moves the qcom,micbias4-microvolt requirement out of
> qcom,wcd93xx-common.yaml into the codecs that have four mic bias
> supplies, so the three-bias WCD9378 binding in patch 2 can reference
> the common schema. Patch 3 is the driver itself.
>
> Tested on the Fairphone 6 (SM7635): handset mic capture through the
> LPASS TX macro at 48 kHz across reboots, including UCM-driven use by
> PipeWire in a Plasma Mobile session. The board DTS follows once these
> bindings are accepted.

Many thanks for all your work on the Fairphone (Gen. 6)!

If possible, can you share also dts patches with me, so I can try out
your patches, and provide at least Tested-by?

Also for audio, UCM and AudioReach topology if it differs from
https://github.com/z3ntu/audioreach-topology/commits/fp6/ or what you've
used to test the changes.

So for NFC, speaker, microphone and magnetometer would be great.

A git branch with your changes also works of course if you have that
pushed somewhere.

Regards
Luca

>
> Jorijn van der Graaf (3):
>   ASoC: dt-bindings: qcom,wcd93xx-common: don't require micbias4
>   ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
>   ASoC: codecs: wcd9378: add TX/capture codec driver
>
>  .../bindings/sound/qcom,wcd9378-codec.yaml    |   76 +
>  .../bindings/sound/qcom,wcd9378-sdw.yaml      |  122 ++
>  .../bindings/sound/qcom,wcd937x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd938x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd939x.yaml          |    1 +
>  .../bindings/sound/qcom,wcd93xx-common.yaml   |    1 -
>  sound/soc/codecs/Kconfig                      |   19 +
>  sound/soc/codecs/Makefile                     |    7 +
>  sound/soc/codecs/wcd9378-sdw.c                |  495 ++++++
>  sound/soc/codecs/wcd9378.c                    | 1382 +++++++++++++++++
>  sound/soc/codecs/wcd9378.h                    |  246 +++
>  11 files changed, 2350 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-=
codec.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-=
sdw.yaml
>  create mode 100644 sound/soc/codecs/wcd9378-sdw.c
>  create mode 100644 sound/soc/codecs/wcd9378.c
>  create mode 100644 sound/soc/codecs/wcd9378.h

