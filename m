Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604792;
	b=qfquu/7pPVs9+XJkLm1uinn7MHFuRyCnEmDVpFTWp3Ju2RQnW7oM/WeKuOqkCYruDDRe
	 9XtBzdowvDo/xpo9hQqc+vDnmeBwB3YBag3Mep+Bs1U6QKyA/ZwpPP5G0FycI9ov4lvhn
	 /maVjKiCGfI/FeCzcnLclTm9HXIzm5G4mm/4jmB3qTz7qFMLtmzZ9o3bTkYF95zre+xBB
	 gDs6mj0AtS1XoktxzMjn7gIW3kJfLQmgohUBpUbIV9uxB8O+cChyPYUHe+X4wYILPhbT8
	 8r2MI6myF5fSeNubdczZDFDvhLmDqeSrFoY6VluWZ1qWlUrlKvbQUVaycT799WWmvRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604792;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qpcuZoI7rti9L/s8LCfZ61Hovkq23X2BEPvpIYDdA3c=;
	b=zk0e4nOy++Zl8PBegXVz14Fy/hBG/j1XwGgXcHkU2ybswp6lyFs51FxtEBfe7b5eafDX
	 MJ9Zo6qSoui+ExC3HUbCB4hdI03bO9Szqlvcmd5IVAiputHex+t+i0BF7T0LDTCW4rw5h
	 jcsOXEC4VdnP52IzhPCAAjV8Klt3aAOVOEQ+/EG194CxKfKvPQ5VZwbEclr+wfqPSe6Sk
	 Qa06UurjnAkDgPusI3Zdr8mJZ521XunSeumBs/JJFFJ2x22nL/b5pb/ykA+TmCY+bLvSJ
	 SdggmuGB3lI8BERLxE/gWwPRhbLOlRuW8r9xW9LbXIRVGdopyTCyi29mM84PmOGFJ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMn0PkOh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA9606A323;
	Fri, 13 Nov 2026 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMn0PkOh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C16E1F000C4;
	Fri, 13 Nov 2026 21:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794604791;
	bh=qpcuZoI7rti9L/s8LCfZ61Hovkq23X2BEPvpIYDdA3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMn0PkOhPm7hJhU/qfS1Dj7xU8UPbl3T4ugsQpIt2KXtCxaXg23d9ZM/AGs9wLTVv
	 3RgrdMzwfodKU8KpUoeaJ69h5TXJ1tu6JSBNhUpHjSb4ffR/wt4wQGqsu1Rsh+KDtL
	 F50jjII45DyI19AeY13JW8nl0jmUhM3Qm8zcuwYG5W5+Urtp96QWYdeooA1t290O95
	 MJmlZj63AcxOMX7aZLeQgNaGqkqaKSepy+jHdvYNx/G8M2k56EIR10KCAYDeoCjkpj
	 /c9fOusWS6lB/BHieWNb5t6KXv+TbONU+QOXdSZfeEHC/Q3g5w0Cxp7LH6qZ47nwQG
	 QHwC79uOfCjmQ==
Message-ID: <sashiko-outbox-213709@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] ASoC: qcom: lpass macro / soundwire:
 asynchronous probe with clock retry
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Carter" <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <4aaa766cace2455ab6c75ab801df357f@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
 <4aaa766cace2455ab6c75ab801df357f@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 21:19:51 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] soundwire: qcom: infinite recursion in clk_get_retry()
- [Medium] ASoC: qcom: 30s msleep() polling on -EPROBE_DEFER in
  lpass_macro_clk_get_retry()
--

commit 6bd2e1b16c32b85c538fe58be015563a596b1d7d
Author: Daniel Carter <yass27106@gmail.com>

ASoC: qcom: lpass macro / soundwire: asynchronous probe with clock retry

This commit adds 30-second polling retry helpers around clock acquisition
and sets PROBE_PREFER_ASYNCHRONOUS in the Qualcomm SoundWire and LPASS
macro drivers.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index c31d921f679f9..0bdeb076a2e0e 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -21,6 +21,27 @@
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include "bus.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider
> + * registration does not trigger deferred-probe retries, so a consumer
> + * that loses the probe-order race stays deferred forever. Wait up to
> + * 30 s for providers that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
> +{
> +	struct clk *c;
> +	int i;
> +
> +	for (i =3D 0; i < 60; i++) {
> +		c =3D clk_get_retry(dev, id);
> +		if (!IS_ERR(c) || PTR_ERR(c) !=3D -EPROBE_DEFER)
> +			return c;
> +		msleep(500);
> +	}
> +	return c;
> +}

[Severity: High]
Does clk_get_retry() call itself instead of devm_clk_get(dev, id) here?
When qcom_swrm_probe() calls clk_get_retry(dev, "iface"), this recurses
infinitely and overflows the kernel stack.  Also, the commit message says
the retry helpers are shared through lpass-macro-common.h, whereas a
separate copy is defined here.

> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpa=
ss-macro-common.h
> index 10ad682019fa7..83bc7075a281c 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
[ ... ]
> @@ -74,4 +77,41 @@ static inline const char *lpass_macro_get_codec_versio=
n_string(int version)
>  	return "NA";
>  }
> =20
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider
> + * registration does not trigger deferred-probe retries, so a consumer
> + * that loses the probe-order race stays deferred forever. Wait up to
> + * 30 s for providers that are registered milliseconds later.
> + */
> +static inline struct clk *
> +lpass_macro_clk_get_retry(struct device *dev, const char *id)
> +{
> +	struct clk *c;
> +	int i;
> +
> +	for (i =3D 0; i < 60; i++) {
> +		c =3D devm_clk_get(dev, id);
> +		if (!IS_ERR(c) || PTR_ERR(c) !=3D -EPROBE_DEFER)
> +			return c;
> +		msleep(500);
> +	}
> +	return c;
> +}
> +
> +static inline struct clk *
> +lpass_macro_clk_get_retry_optional(struct device *dev, const char *id)
> +{
> +	struct clk *c;
> +	int i;
> +
> +	for (i =3D 0; i < 60; i++) {
> +		c =3D devm_clk_get_optional(dev, id);
> +		if (!IS_ERR(c) || PTR_ERR(c) !=3D -EPROBE_DEFER)
> +			return c;
> +		msleep(500);
> +	}
> +	return c;
> +}
> +
>  #endif /* __LPASS_MACRO_COMMON_H__ */

[Severity: Medium]
Why poll with msleep(500) for up to 30 seconds on -EPROBE_DEFER instead of
returning -EPROBE_DEFER to the driver core?

Both suppliers mentioned in the commit message (q6dsp_clock_dev_probe() and
va_macro_register_fsgen_output()) register their clock providers inside
platform_driver probe callbacks, which trigger driver_deferred_probe_trigge=
r()
through really_probe() -> driver_bound() once bound.  Even with
PROBE_PREFER_ASYNCHRONOUS, sleeping for 30 seconds inside probe while holdi=
ng
device_lock(dev) stalls async_synchronize_full() and wait_for_device_probe()
callers (such as do_init_module() and kernel_init()) whenever a clock suppl=
ier
is delayed, missing firmware, or disabled in DT, and repeats the 30-second
stall on subsequent deferred-probe passes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1ce6d7664e48413d9a5=
a8b11a986f746@gmail.com?part=3D3
