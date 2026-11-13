Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602822;
	b=ZXeCAvbNdZZTwt9CGB2ztTcpQITvCzy92aMEXN+kjyw4A0SV/m9gRpWnNK2BFFc3Mn1m
	 gD9DK6DAqk5MLRwXzIyY2kjplbMCFLrnIvrfyxXfGnQbbt+gIRImBQiHFl1hGllaXbia5
	 0uZ8avP9ZL75XnHs1kDS1UnHkG6N50nYYsC8CdpIUS4tn8NWqTFgZXoMb+shtsf6QDTO5
	 R7Bi6/47TKbUXVVuqYDq3j/BhFVBGdnt3+m0MAKOkxNH+xv1exbbj7BsopoejAxNP0a2m
	 +AfxL5OVqM0l6s3D0arqN0hpWGwN8DlrWISEyaE7PxJHqUhlRLIeRCLvA/AJQcjpL4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602822;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AGaboZxTUqlJL9vb/7/EcydpQ6AnRo3iJ6Y2HP77rAE=;
	b=RjD5ltrnfCVj+ZWTI8Vpfy6b+t0UJxuOZ/YdgbwOzDzwYyvnHztEelMYMS4X/9e7FsOv
	 T3Fk94GnCvH0iYQ+5+ZLnTpUisq8/oZbp6SfsAFUSh1ASDQtTBJGrUq5XmSmbldph/IEZ
	 qAAgX9E923frEWGFOK811wUqWfEpynoeouAzaq0hZYOVSvpVLpMqqO+MeQwF7JdM+K6Fq
	 QWhWT9co4wzTMm6HXkSZqCirifx2uC9tD96Cshukujqzan6YFexnmtiEt7rZpAMFnN3fU
	 L/OYDs4JCIz2/OfL/VVmF/YM+D7h+kZUzq/P6ayZz5Ylm43LjmPtetSBN6G+aDtqTmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmNy2C5J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0A606A334;
	Fri, 13 Nov 2026 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EmNy2C5J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3EF1F000C4;
	Fri, 13 Nov 2026 20:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602822;
	bh=AGaboZxTUqlJL9vb/7/EcydpQ6AnRo3iJ6Y2HP77rAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EmNy2C5JBoMz83nrt/cUkyoVZJ3FsyVxtPByZYJhV8Kn4z8W7KNF4xZJMxBYonYIn
	 BzCsYfMEIYMg4hm7qHgKKu28sFf76S8+T/UtwEsvNqHgcmhf5wOOXrf9eXkyZQQdwg
	 KOTgyhBwq5U92XoWnqQ4SQPY8ZqqOgVFvSaTtmTmp4QiPlvzzr5mBKfh30bHJl0Tn2
	 KjwgEGxqtY6OpoFVbB9TrQgedlKYdBxzo4JKE/tWW+P/rZW8SZvc/R8pC0gHYXgLPi
	 pVlxwYpHeqC/BjASAAm16U37NGoqVlxezvBFpW/NdN/IBVLWDwCHwICjXHBvS0H1Fa
	 T2jCHgQ1zpN/A==
Message-ID: <sashiko-outbox-213678@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: qcom: lpass macro / soundwire: retry
 deferred clock acquisition
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Carter" <yass27106@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <c0b2628bb8824cb0a61dacb714f94af2@gmail.com>
References: <bee078b697b74da694b5f9e6f518c0fb@gmail.com>
 <c0b2628bb8824cb0a61dacb714f94af2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 20:47:01 +0000
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
- [High] ASoC: qcom: 30s msleep() retry in probe stalls
  deferred_probe_work
- [High] soundwire: qcom: unused static clk_get_retry_optional() breaks
  Werror build
- [High] ASoC: qcom: missing Signed-off-by trailer and commit message
  body
- [Low] ASoC: qcom: clk_get_retry() helpers duplicated across five
  driver files
--

commit 9ed54c71b350e8398fe1839f5ec457bda202d8b0
Author: Daniel Carter <yass27106@gmail.com>

> ASoC: qcom: lpass macro / soundwire: retry deferred clock acquisition
>=20
> drivers/soundwire/qcom.c           | 37 +++++++++++++++++++++++-
>  sound/soc/codecs/lpass-rx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-tx-macro.c  | 45 ++++++++++++++++++++++++++----
>  sound/soc/codecs/lpass-va-macro.c  | 43 +++++++++++++++++++++++++---
>  sound/soc/codecs/lpass-wsa-macro.c | 45 ++++++++++++++++++++++++++----
>  5 files changed, 195 insertions(+), 20 deletions(-)

[Severity: High]
This commit is missing a Signed-off-by: trailer, and the commit message
body contains only a diffstat without explaining why this change is
needed.

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
Does sleeping for 30 seconds in clk_get_retry() and
clk_get_retry_optional() block the very probe thread needed to register
the supplier clocks?

None of these drivers sets PROBE_PREFER_ASYNCHRONOUS, so both initcalls
and deferred_probe_work_func() run .probe() callbacks sequentially on a
single thread.  The modified drivers also supply clocks to one another:
va_macro_probe() registers the fsgen clock consumed by rx_macro_probe(),
tx_macro_probe(), and wsa_macro_probe(), while the macro drivers register
the mclk clock consumed as iface by qcom_swrm_probe().

Because drivers/soundwire/ and wsa-macro are linked and ordered in device
trees before va-macro, a consumer probing before va_macro_probe() (or
q6prmcc) sleeps for the full 30 seconds on that single thread, preventing
the supplier from probing and registering the clock until the loop gives
up and returns -EPROBE_DEFER anyway.  This stalls boot or deferred probing
for 30 seconds per device and can expire driver_deferred_probe_timeout,
while in va_macro_probe() sleeping on va->npl also leaves the va->pds
power domains powered on for 30 seconds.

In addition, clock suppliers registered from a driver .probe() callback do
trigger deferred probe retries via really_probe() -> driver_bound() ->
driver_deferred_probe_trigger().

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
> =20
>  #define SWRM_COMP_SW_RESET					0x008
>  #define SWRM_COMP_STATUS					0x014
> @@ -1669,7 +1704,7 @@ static int qcom_swrm_probe(struct platform_device *=
pdev)
>  		goto err_init;
>  	}
> =20
> -	ctrl->hclk =3D devm_clk_get(dev, "iface");
> +	ctrl->hclk =3D clk_get_retry(dev, "iface");

[Severity: High]
Does defining clk_get_retry_optional() in drivers/soundwire/qcom.c without
any callers trigger a -Wunused-function warning and break builds with
CONFIG_WERROR=3Dy?

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
This isn't a bug, but clk_get_retry() and clk_get_retry_optional() are
duplicated verbatim across five source files, four of which already share
sound/soc/codecs/lpass-macro-common.h.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2c4a807496c04047b6d=
5735e3946dd16@gmail.com?part=3D3
