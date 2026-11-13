Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577407;
	b=P7tEptqwTmReF9WY7IlCb4BnV/wHEc5YOeL+5mE/tlS5hcMCNkOo0CK/oE3g0bjda+eb
	 AOZp0Rqy7AGWbnpGpiKbs/o7cYBPqqQSeRFpJ7oABQEvVsGiOfbI7WtVIAGR0fjQ0ckMF
	 R4CgCL75feJBmTPd+ZtNjzwY9kO19Zyv0ZyIRb3t6Cwj9fmSBNbYM6/k+YqgKLWSMCVP/
	 NL3Zs9X+H/WFN2yRaJJpp3fOBG6cTcRZYVNI1GystRj86LTuA1rGCe0rLj0mgnSM8Mm5x
	 EyFKCJLV9Sgm4DDinELHhWveCZhWZRMZbT1S65AFF2fEW5uQQw0HGjXBRH7UJNv9zIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577407;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dzwDJHBkEXXVALgb2lHIjFh1vM/B+fdXCyhipvmkY4s=;
	b=3kegj5/VKJ8LDzq39NX28KVvBSzjoQZXXQige8j7lRzh3A5vxq4O7hFbVtn/uO8HJagQ
	 zPJENeOx761zBMdQsvLMg8jg/08gQbv4DxtT5b0gMrrvWjz1m8ow91POQeFwuG5mTSy//
	 mq5x/Nh+qaUyiax5UoSWd1VkgYiOmrOx4/Brx1TNUZwDPjW+UXL3CGzy1VHnrvTkcGF/W
	 JyA84uRACb2RJfJOPoQTML5A5t5iZABM88RYNz8mhd1k9rOC4tkVw3pOKjOd+8GrXBAZj
	 5plvA4ZgCET5kLdxRtjaeD6F191NujT4fWybsoMeRacrii4blAJoLxv6c7teEAsGU0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLmAQcCq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCA9606A323;
	Fri, 13 Nov 2026 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fLmAQcCq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D691F000C4;
	Fri, 13 Nov 2026 13:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794577406;
	bh=dzwDJHBkEXXVALgb2lHIjFh1vM/B+fdXCyhipvmkY4s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fLmAQcCqLgxe/TAZjJRzfnr0cdvLLFpF0sfRFj0iktCjsx/hq97IHYeZuUeQQ1Fu1
	 WJRrO4odNVqi5W9cNwf3zsBAZdT+cpX1M9l5cIY4IYwq/OkLZjxcJsQexIjMXNrYRS
	 1FdICpvm/uOCsVQEsseaZZtd07SOAa63uGiuwyC4/2lzgipQZKI/2lXYwFWsiy8PDm
	 MezC2bdoClENarshSEGQxG9B6gAx5uq3yzsq3udZzDc5UBhjYsRLbvLEwwpcwkOHo2
	 cRjHdEy+qgx52DNp3lCwkJhRHrSp4O0hfShAIshNTgAAr9PgXzCS/Jfwv1k0DxotFZ
	 +qXoRe640VY4g==
Message-ID: <sashiko-outbox-212916@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: lpass macro / soundwire: retry deferred
 clock acquisition
Reply-To: sashiko-reviews@lists.linux.dev
To: yass27106 <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <90d9d32bd8d44c4f97ca3af4e1bc5481@gmail.com>
References: <5cfd0705da5845b88ffe6d9e8bfeb966@gmail.com>
 <90d9d32bd8d44c4f97ca3af4e1bc5481@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 13:43:25 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] ASoC: qcom: 30s sleep in clk_get_retry() stalls sequential
  probe
- [High] soundwire: qcom: unused clk_get_retry_optional() breaks -Werror
  build
- [High] ASoC: qcom: missing Signed-off-by trailer and commit message
  body
- [Low] ASoC: qcom: duplicate clk_get_retry() helpers across five
  drivers
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] soundwire: qcom: ignored clk_prepare_enable() return values [1]
--

commit e7d8a177bfe78eb7a13933e19bc2397f7ed88249
Author: yass27106 <yass27106@gmail.com>

> ASoC: qcom: lpass macro / soundwire: retry deferred clock acquisition
>=20
> drivers/soundwire/qcom.c           | 37 +++++++++++++++++++++++-
>  sound/soc/codecs/lpass-rx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-tx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-va-macro.c  | 43 +++++++++++++++++++++++++---
>  sound/soc/codecs/lpass-wsa-macro.c | 45 ++++++++++++++++++++++++++----
>  5 files changed, 195 insertions(+), 20 deletions(-)

[Severity: High]
This commit is missing a Signed-off-by trailer and a changelog description
explaining the problem and the reason for the change; the commit body only
contains a diffstat.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index c31d921f679f9..afb71624dae2a 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -21,6 +21,41 @@
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include "bus.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registrati=
on
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
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

[Severity: High]
Won't sleeping for 30 seconds in clk_get_retry() and clk_get_retry_optional=
()
on -EPROBE_DEFER stall the same thread that needs to probe the clock
provider?

When any clock provider finishes probing, really_probe() -> driver_bound()
calls driver_deferred_probe_trigger() to schedule deferred_probe_work.
Because none of these drivers set PROBE_PREFER_ASYNCHRONOUS, both initial
probing in do_initcalls() and retries in deferred_probe_work_func() run
sequentially on a single thread.

In both link order and Device Tree node order, consumers are queued before
their suppliers: wsa_macro_probe(), rx_macro_probe(), and tx_macro_probe()
request the fsgen clock registered by va_macro_probe(), and qcom_swrm_probe=
()
requests the iface clock registered by the macro drivers.  Sleeping inside =
the
consumer's probe callback blocks the initcall or deferred_probe_work thread
from advancing to probe the supplier, guaranteeing the clock cannot appear
during the 30-second sleep while holding device_lock(dev) (and active power
domains in va_macro_probe()).

> +
> +static struct clk *clk_get_retry_optional(struct device *dev, const char=
 *id)
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

[Severity: High]
Does clk_get_retry_optional() have any callers in drivers/soundwire/qcom.c?
qcom_swrm_probe() only calls clk_get_retry(), so defining
clk_get_retry_optional() here triggers a -Wunused-function warning and brea=
ks
builds with CONFIG_WERROR=3Dy.

> @@ -1669,7 +1704,7 @@ static int qcom_swrm_probe(struct platform_device *=
pdev)
>  		goto err_init;
>  	}
> =20
> -	ctrl->hclk =3D devm_clk_get(dev, "iface");
> +	ctrl->hclk =3D clk_get_retry(dev, "iface");
>  	if (IS_ERR(ctrl->hclk)) {
>  		ret =3D dev_err_probe(dev, PTR_ERR(ctrl->hclk), "unable to get iface c=
lock\n");
>  		goto err_init;

[Severity: High]
This problem wasn't introduced by this patch, but clk_prepare_enable() on
ctrl->hclk is called without checking its return value in qcom_swrm_probe(),
qcom_swrm_irq_handler(), and swrm_runtime_resume() [1]:

drivers/soundwire/qcom.c:qcom_swrm_irq_handler() {
	...
	clk_prepare_enable(ctrl->hclk);

	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
		       &intr_sts);
	...
}

If clk_prepare_enable() fails, subsequent MMIO reads and writes access
unclocked SoundWire controller registers, triggering a synchronous external
abort on Qualcomm platforms.

> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-r=
x-macro.c
> index ab8a1c2b0489b..c953054eb7a38 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -18,6 +18,41 @@
>  #include <linux/clk-provider.h>
> =20
>  #include "lpass-macro-common.h"
> +#include <linux/delay.h>
> +
> +/*
> + * Bounded retry for deferred clock providers. Clock-provider registrati=
on
> + * does not trigger deferred-probe retries, so a consumer that loses the
> + * probe-order race stays deferred forever. Wait up to 30 s for providers
> + * that are registered milliseconds later.
> + */
> +static struct clk *clk_get_retry(struct device *dev, const char *id)
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
> +static struct clk *clk_get_retry_optional(struct device *dev, const char=
 *id)
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

[Severity: Low]
clk_get_retry() and clk_get_retry_optional() are duplicated verbatim across
drivers/soundwire/qcom.c, lpass-rx-macro.c, lpass-tx-macro.c,
lpass-va-macro.c, and lpass-wsa-macro.c, even though the four LPASS macro
drivers already share lpass-macro-common.h.

[1] https://sashiko.dev/#/bug/linux-f65cddc9-08ff-4531-9acf-76981d74d914

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/01b2c920412848ab854=
93acc2d4f5fc1@gmail.com?part=3D2
