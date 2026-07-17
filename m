Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065A3254BB;
	Fri, 17 Jul 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278966; cv=none; b=o3xJed4oGZ/imfRrhMUwUh0jHOcSxVQi2AsJSs/6yoHQgPBRa4rrJpNhC5HttAChhjjFyHQNSolZ1j/ZxBxaemlAEMSazozLXXMx2QMqgAF7xeRxM/9/w9qNwZx2lvD7drBJ/2Fm2yUrqCX84U6Lp3X9gBwWEwasRaFHJ3D+l5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278966; c=relaxed/simple;
	bh=NehbN4YKikETW4r9a28YWhM4y3B1oSP+pQzliSEBHBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WogitQR7P1DCVPGnHiCfzf23Vs/nYGf0Hi82Ms4C9iF5hfNFb8Y7cla1WU4yLdBKCND4JE5w32O7ExGi+QX3egQ2YCYh9mYHqO3hKfFKWKuis4D7PRRVLHcLx7C6WEId+7OedMAhcF4Wp1D+2BiL2cjOZL8hlMUKk0dXlPmAXGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1liovBt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1liovBt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58EBE1F000E9;
	Fri, 17 Jul 2026 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278965;
	bh=0rkMuhbyCe+SuxUq+i2Titkafj65wjJ3bETt3hS3Mk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c1liovBtU0E9PZxr5RN7gCSbpT5J3IAtuvgBocjZifx3F7KNZFQModGm5H7eHcsRh
	 l4OwQT33HbwkY/+J23Gto5hewSgy4i3HRTRvts0VQ6nPj6RbWO7fLlLFRjDGEgn3h4
	 HToPsK+6FzKosgSNGuSQBYodnGPKngqT4Ys7d6xmRCekc7a1NBpQzU3+3BXrW+4Hz0
	 33tEt8h2PXzKUS6IaUkect8i8i7VVX89pVHEbquFkZtXRo2tjo95YJ+tXtcOjHHbcD
	 0YUbfPg/98n0E8WQdmF3VDrKhuytfGSsza1qR7EGb5t8Cn7txqknvqxH7e5FjwsmbR
	 Jx2gYwyiub1QA==
Date: Fri, 17 Jul 2026 11:02:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] ASoC: Add LPASS VA CSR heartbeat pulse clock
Message-ID: <20260717-outgoing-bold-tanuki-d4db9e@quoll>
References: <20260717-master-v2-0-ae200627ad62@oss.qualcomm.com>
 <20260717-master-v2-3-ae200627ad62@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260717-master-v2-3-ae200627ad62@oss.qualcomm.com>

On Fri, Jul 17, 2026 at 01:21:17AM +0530, Sarath Ganapathiraju wrote:
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases
> and can serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  sound/soc/codecs/Kconfig        |  13 ++++
>  sound/soc/codecs/Makefile       |   2 +
>  sound/soc/codecs/lpass-va-csr.c | 143 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 158 insertions(+)
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 76e90144ea..5dbfa77d0e 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -2902,11 +2902,24 @@ config SND_SOC_LPASS_WSA_MACRO
>  	select SND_SOC_LPASS_MACRO_COMMON
>  	tristate "Qualcomm WSA Macro in LPASS(Low Power Audio SubSystem)"
>  
> +config SND_SOC_LPASS_VA_CSR
> +	depends on COMMON_CLK
> +	select REGMAP_MMIO
> +	tristate "Qualcomm LPASS VA CSR heartbeat pulse clock provider"
> +	help
> +	  Qualcomm LPASS VA CSR block contains the rate generator hardware
> +	  that produces the HeartBeat Pulse (also known as RateGen Pulse).
> +	  This driver models the rate generator as a clock provider so
> +	  that consumers can enable or disable it via the common clock
> +	  framework, and it can be used to synchronize the start of DMAs
> +	  and Codec Interfaces or as a periodic wakeup source for the DSP.
> +
>  config SND_SOC_LPASS_VA_MACRO
>  	depends on COMMON_CLK
>  	depends on PM_CLK
>  	select REGMAP_MMIO
>  	select SND_SOC_LPASS_MACRO_COMMON
> +	select SND_SOC_LPASS_VA_CSR
>  	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
>  
>  config SND_SOC_LPASS_RX_MACRO
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index aa0396e5b5..3e86c1bbf9 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -163,6 +163,7 @@ snd-soc-lpass-rx-macro-y := lpass-rx-macro.o
>  snd-soc-lpass-tx-macro-y := lpass-tx-macro.o
>  snd-soc-lpass-wsa-macro-y := lpass-wsa-macro.o
>  snd-soc-lpass-va-macro-y := lpass-va-macro.o
> +snd-soc-lpass-va-csr-y := lpass-va-csr.o
>  snd-soc-madera-y := madera.o
>  snd-soc-max9759-y := max9759.o
>  snd-soc-max9768-y := max9768.o
> @@ -886,6 +887,7 @@ obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
>  obj-$(CONFIG_SND_SOC_LPASS_MACRO_COMMON)	+= snd-soc-lpass-macro-common.o
>  obj-$(CONFIG_SND_SOC_LPASS_WSA_MACRO)	+= snd-soc-lpass-wsa-macro.o
>  obj-$(CONFIG_SND_SOC_LPASS_VA_MACRO)	+= snd-soc-lpass-va-macro.o
> +obj-$(CONFIG_SND_SOC_LPASS_VA_CSR)	+= snd-soc-lpass-va-csr.o
>  obj-$(CONFIG_SND_SOC_LPASS_RX_MACRO)	+= snd-soc-lpass-rx-macro.o
>  obj-$(CONFIG_SND_SOC_LPASS_TX_MACRO)	+= snd-soc-lpass-tx-macro.o
>  
> diff --git a/sound/soc/codecs/lpass-va-csr.c b/sound/soc/codecs/lpass-va-csr.c
> new file mode 100644
> index 0000000000..1d0805789e
> --- /dev/null
> +++ b/sound/soc/codecs/lpass-va-csr.c
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of_clk.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

Why a clock provider driver, which has nothing to do with ASoC and uses
nothing from the ASoC, is placed in ASoC directory?

No, this is really wrong interpretation of Linux subsystems.

Best regards,
Krzysztof

