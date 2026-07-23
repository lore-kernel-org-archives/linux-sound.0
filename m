Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190D486B99
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828111; cv=none; b=RpHDFDNTwjnfn69qHCU1Gewe6qPKtD+mY9QEAHJkhZ0jYm4cqe8O/WtpYKx9+HsHzF//UZoN/ngQn+fSD00LXEdUEkzQ0nTTEX77ksh0qslhRIFINrnrpFkKFVa4JW6uv45vQIfMjEYlWpqygLhStBWfiY/YbKLUbMh5LnydTrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828111; c=relaxed/simple;
	bh=rjX3XZQ0cw76ylh1VHR6fxCoj9qCmPbJxyJY9ZsSXdA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MV8t3Ltxa9+j4Qh/e9sywDozFcGM+vHDcEd8jdlqH4NL+UmZj03S158p2rJWLAHIgQkfjt64WyP7yqoFP3PKUHgZWlSweFWE+Zchy1GbCGvoRuOT2fvtI3PU3UPuSxg9FjZMnSr0Bim9Nnfx9Bqg9g+VcAkDWdYn3o07lwWwp6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vHRN43Ks; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vHRN43Ks"
Message-ID: <9bd4ea7b-1297-4adb-93df-b32622523ae1@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784828105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ao22s2z4EVHFmny9avXyZ9QHiht7SxhM3/y4KZ7VrKo=;
	b=vHRN43Ks3PDBbzXLAboiakuM3WEstyc9ANXR40T8HG2ubIt6CHz8QfC4qPkyiwpyjmoETI
	X9HMtwic1G7b3Ew7WOnyvgbp5x044syNHp63Ay2UydpojzjpmpVERGmqrmrnwYEO+Zwdx/
	Xlw7RTWmqpUaXrp6KQSiDsJW9+2xjaI=
Date: Thu, 23 Jul 2026 19:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IFvigJlQQVRDSOKAmSAxLzNdIEFTb0M6IGNvZGVjczogYWRkIG5l?=
 =?UTF-8?Q?w_SoundWire-based_SN624x?=
To: ming cong <ming.cong@senarytech.com>, broonie@kernel.org,
 julianbraha@gmail.com
Cc: qianghua.wang@senarytech.com, jim.tang@senarytech.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Arnd Bergmann <arnd@arndb.de>, Niranjan H Y <niranjan.hy@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>, Nick Li <nick.li@foursemi.com>,
 Peng Fan <peng.fan@nxp.com>, "Dr. David Alan Gilbert" <linux@treblig.org>,
 Chancel Liu <chancel.liu@nxp.com>, Oder Chiou <oder_chiou@realtek.com>,
 Weidong Wang <wangweidong.a@awinic.com>, David Lin <david.lin@intel.com>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Zhang Yi <zhangyi@everest-semi.com>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20260723063044.9026-1-ming.cong@senarytech.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260723063044.9026-1-ming.cong@senarytech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

You really want a cover letter, mention this is v2 and list the changes
since v1 (shared on 6/29/26).

Also add the linux-sound mailing list in CC:

> diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
> new file mode 100644
> index 000000000000..17a0c9a14cf0
> --- /dev/null
> +++ b/sound/soc/codecs/sn624x-sdca-sdw.c
> @@ -0,0 +1,1955 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// sn624x-sdw-sdca.c -- SN624X SDCA ALSA SoC SoundWire audio driver
> +//
> +// Copyright(c) 2021 Realtek Semiconductor Corp.
> +// Copyright(c) 2025 Senary Semiconductor Corp.
> +//
> +
> +#include <linux/atomic.h>
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/find.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/jiffies.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/soundwire/sdw_type.h>
> +
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +
> +#include "sn624x-sdca.h"
> +
> +#define VERSION_MAJOR		1
> +#define VERSION_MINOR		0
> +#define VERSION_REVISION	0
> +#define VERSION_BUILD		0

are those defines useful?

> +
> +/* Resume wait after bus re-enumeration (rt722-style probe timeout) */
> +#define SN624X_PROBE_TIMEOUT_MS			5000U
> +#define SN624X_PWR_D0				0
> +#define SN624X_PWR_D3				3
> +#define SN624X_MUTE_ON				1
> +/* PDE Actual PS poll budget (~2s), same idea as rt1320_pde_transition_delay */
> +#define SN624X_PDE_PS_POLL_MAX			2000U
> +#define SN624X_PDE_PS_POLL_US_MIN		1000
> +#define SN624X_PDE_PS_POLL_US_MAX		1500
> +
> +/*
> + * Trace helper: load with trace=1 or:
> + *   echo 1 > /sys/module/snd_soc_sn624x_sdca/parameters/trace
> + * For finer logs without trace=1, enable dynamic_debug on this file.
> + */
> +static bool sn624x_trace;
> +module_param_named(trace, sn624x_trace, bool, 0644);
> +MODULE_PARM_DESC(trace,
> +		 "extra dev_dbg for probe, jack, SDW status (default off)");
> +
> +/* Register dump in hw_params (PWR/ch/rate/vol/mute); independent of trace=1 */
> +static bool sn624x_codec_diag = true;
> +module_param_named(codec_diag, sn624x_codec_diag, bool, 0644);
> +MODULE_PARM_DESC(codec_diag,
> +		 "log codec regs in hw_params (default on; echo 0 to disable spam)");
> +
> +static bool sn624x_mask_sdca_irqs = true;
> +module_param_named(mask_sdca_irqs, sn624x_mask_sdca_irqs, bool, 0644);
> +MODULE_PARM_DESC(mask_sdca_irqs,
> +		 "Mask all SDCA IRQs (default Y). Jack detection is poll-primary via jack_detect_work; set N to also unmask SDCA_0/8 for IRQ-accelerated polling once SDCA interrupt handling is stable");
> +
> +struct sn624x_sdca_priv;
> +
> +static void sn624x_sdca_sdca_irq_mask_all(struct sn624x_sdca_priv *sn624x);
> +static int sn624x_jack_out_pwr_request_d0(struct device *dev,
> +	struct sn624x_sdca_priv *sn624x);
> +#define SN624X_DBG(dev, fmt, ...) dev_dbg(dev, "sn624x: " fmt, ##__VA_ARGS__)
> +#define SN624X_TRC(dev, fmt, ...) do {					\
> +	if (sn624x_trace)						\
> +		dev_dbg(dev, "sn624x: " fmt, ##__VA_ARGS__);		\
> +} while (0)
> +
> +/* Reg 0x2124: vendor power/mode latch; once per boot avoids dmesg spam */
> +static atomic_t sn624x_power_mode_logged =
> +	ATOMIC_INIT(0);
> +
> +static void sn624x_log_power_mode_once(struct device *dev,
> +				       struct sn624x_sdca_priv *sn624x)
> +{
> +	unsigned int pm;
> +	int ret;
> +
> +	if (!sn624x || !sn624x->regmap)
> +		return;
> +	if (atomic_xchg(&sn624x_power_mode_logged, 1) != 0)
> +		return;
> +
> +	ret = regmap_read_bypassed(sn624x->regmap, 0x00002124, &pm);

this magic register should be replaced by a define...

> +	if (ret < 0)
> +		dev_err(dev, "sn624x: power_mode read failed reg 0x2124 (%d)\n", ret);
> +	else
> +		dev_dbg(dev,
> +			 "sn624x: power_mode=0x%x (reg 0x2124; e.g. 0xf powered)\n",
> +			 pm);
> +}
> +
> +/*
> + * SDCA control addresses via SDW_SDCA_CTL(fun, ent, ctl, ch).

the CH is only needed for things with more than one channel really. It's
silly to add CH_0 for e.g. power.

> + * CH_ENABLE_* are not SDCA Control Prefix addresses — keep as raw windows.
> + */
> +/* Speaker amp (function 4) — PDE/FU power/mute/vol; rate on CS01 */
> +#define SN624X_REG_PWR_STATE \
> +	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_PDE03, \
> +		     SN624X_SDCA_CTL_ACTUAL_POWER_STATE, SN624X_SDCA_CH_0)

> +static int sn624x_pde_request_ps(struct device *dev, struct regmap *regmap,
> +				 unsigned int fun, unsigned int ent,
> +				 unsigned int ps)
> +{
> +	unsigned int req = SDW_SDCA_CTL(fun, ent, SN624X_SDCA_CTL_REQ_POWER_STATE,
> +					SN624X_SDCA_CH_0);
> +	unsigned int act = SDW_SDCA_CTL(fun, ent, SN624X_SDCA_CTL_ACTUAL_POWER_STATE,
> +					SN624X_SDCA_CH_0);
> +	unsigned int val = 0;
> +	unsigned int polls = SN624X_PDE_PS_POLL_MAX;
> +	int ret;
> +
> +	ret = regmap_write(regmap, req, ps);
> +	if (ret < 0) {
> +		dev_warn(dev,
> +			 "sn624x: PDE fun=%u ent=0x%x REQUESTED_PS=%u write failed (%d)\n",
> +			 fun, ent, ps, ret);
> +		return ret;
> +	}
> +
> +	while (polls--) {
> +		ret = regmap_read(regmap, act, &val);
> +		if (ret < 0) {
> +			dev_warn(dev,
> +				 "sn624x: PDE fun=%u ent=0x%x ACTUAL_PS read failed (%d)\n",
> +				 fun, ent, ret);
> +			return ret;
> +		}
> +		if ((val & 0xffu) == ps)
> +			return 0;
> +		usleep_range(SN624X_PDE_PS_POLL_US_MIN, SN624X_PDE_PS_POLL_US_MAX);
> +	}
> +
> +	dev_warn(dev,
> +		 "sn624x: PDE fun=%u ent=0x%x ACTUAL_PS timeout (want %u got %#x)\n",
> +		 fun, ent, ps, val);
> +	return -ETIMEDOUT;
> +}
> +
> +static int sn624x_pwr_request_d0(struct device *dev, struct sn624x_sdca_priv *sn624x)
> +{
> +	if (!sn624x || !sn624x->regmap)
> +		return -ENODEV;
> +
> +	return sn624x_pde_request_ps(dev, sn624x->regmap,
> +				     SN624X_FUNC_NUM_SPEAKER_AMP,
> +				     SN624X_SDCA_ENT_PDE03, SN624X_PWR_D0);
> +}

you need to use the existing helper for power management, see
sdca_asoc_pde_poll_actual_ps()
> +
> +static int sn624x_jack_cap_pwr_request_d0(struct device *dev,
> +					  struct sn624x_sdca_priv *sn624x)
> +{
> +	if (!sn624x || !sn624x->regmap)
> +		return -ENODEV;
> +
> +	return sn624x_pde_request_ps(dev, sn624x->regmap,
> +				     SN624X_FUNC_NUM_JACK_CODEC,
> +				     SN624X_SDCA_ENT_PDE04, SN624X_PWR_D0);
> +}
> +
> +static int sn624x_jack_out_pwr_request_d0(struct device *dev,
> +					  struct sn624x_sdca_priv *sn624x)
> +{
> +	if (!sn624x || !sn624x->regmap)
> +		return -ENODEV;
> +
> +	return sn624x_pde_request_ps(dev, sn624x->regmap,
> +				     SN624X_FUNC_NUM_JACK_CODEC,
> +				     SN624X_SDCA_ENT_PDE03, SN624X_PWR_D0);
> +}
> +
> +static int sn624x_dmic_cap_pwr_request_d0(struct device *dev,
> +					  struct sn624x_sdca_priv *sn624x)
> +{
> +	if (!sn624x || !sn624x->regmap)
> +		return -ENODEV;
> +
> +	return sn624x_pde_request_ps(dev, sn624x->regmap,
> +				     SN624X_FUNC_NUM_MIC_ARRAY,
> +				     SN624X_SDCA_ENT_PDE03, SN624X_PWR_D0);
> +}

same for all power management, write the requested power and use the
helper to poll for actual power.

> +static int sn624x_hw_params_port(struct snd_soc_dai *dai,
> +				 struct snd_pcm_substream *substream)
> +{
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		if (dai->id == SN624X_DAI_JACK)
> +			return SN624X_PORT_JACK_PLAYBACK;
> +		if (dai->id == SN624X_DAI_SPEAKER)
> +			return SN624X_PORT_SPEAKER_PLAYBACK;
> +	} else {
> +		if (dai->id == SN624X_DAI_JACK)
> +			return SN624X_PORT_JACK_CAPTURE;
> +		if (dai->id == SN624X_DAI_DMIC)
> +			return SN624X_PORT_DMIC_CAPTURE;
> +	}
> +	return -EINVAL;
> +}
> +
> +/*
> + * Tear down a stream in two phases:
> + *  1) assert FU mute and wait for the hardware mute ramp to finish
> + *  2) only then request PDE PS3 and poll ACTUAL_PS
> + * Collapsing mute+D3 into back-to-back register writes cuts power before the
> + * ramp completes and can pop / leave the path half-muted.

that's a good change compared to v1!

> + */
> +static void sn624x_port_teardown_d3_mute(struct device *dev,
> +					 struct sn624x_sdca_priv *sn624x,
> +					 int port, bool route_switch)
> +{
> +	unsigned int mute_l = 0, mute_r = 0;
> +	unsigned int fun = 0, ent = 0;
> +	int ret;
> +
> +	if (!sn624x || !sn624x->regmap)
> +		return;
> +
> +	switch (port) {
> +	case SN624X_PORT_JACK_PLAYBACK:
> +		mute_l = SN624X_REG_JACK_OUT_MUTE;
> +		fun = SN624X_FUNC_NUM_JACK_CODEC;
> +		ent = SN624X_SDCA_ENT_PDE03;
> +		break;
> +	case SN624X_PORT_SPEAKER_PLAYBACK:
> +		mute_l = SN624X_REG_MUTE;
> +		mute_r = SN624X_REG_RIGHT_MUTE;
> +		fun = SN624X_FUNC_NUM_SPEAKER_AMP;
> +		ent = SN624X_SDCA_ENT_PDE03;
> +		break;
> +	case SN624X_PORT_JACK_CAPTURE:
> +		mute_l = SN624X_REG_JACK_CAP_MUTE;
> +		fun = SN624X_FUNC_NUM_JACK_CODEC;
> +		ent = SN624X_SDCA_ENT_PDE04;
> +		break;
> +	case SN624X_PORT_DMIC_CAPTURE:
> +		mute_l = SN624X_REG_DMIC_CAP_MUTE;
> +		mute_r = SN624X_REG_DMIC_CAP_CHR_MUTE;
> +		fun = SN624X_FUNC_NUM_MIC_ARRAY;
> +		ent = SN624X_SDCA_ENT_PDE03;
> +		break;
> +	default:
> +		dev_warn(dev, "sn624x: hw_free: unknown port %d\n", port);
> +		return;
> +	}
> +
> +	/* Phase 1: mute, then allow soft-ramp / analog settle */
> +	ret = regmap_write(sn624x->regmap, mute_l, SN624X_MUTE_ON);
> +	if (ret < 0)
> +		dev_warn(dev, "sn624x: port %d mute(L) failed (%d)%s\n", port, ret,
> +			 route_switch ? " (route)" : "");
> +	if (mute_r) {
> +		ret = regmap_write(sn624x->regmap, mute_r, SN624X_MUTE_ON);
> +		if (ret < 0)
> +			dev_warn(dev, "sn624x: port %d mute(R) failed (%d)%s\n",
> +				 port, ret, route_switch ? " (route)" : "");
> +	}
> +	usleep_range(SN624X_ROUTE_AFTER_MUTE_US_MIN, SN624X_ROUTE_AFTER_MUTE_US_MAX);
> +
> +	/* Phase 2: power domain to D3 only after mute has had time to take effect */
> +	ret = sn624x_pde_request_ps(dev, sn624x->regmap, fun, ent, SN624X_PWR_D3);
> +	if (ret < 0)
> +		dev_warn(dev, "sn624x: port %d PWR -> D3 failed (%d)%s\n", port, ret,
> +			 route_switch ? " (route)" : "");
> +	else
> +		dev_dbg(dev, "sn624x: port %d muted then PWR -> D3%s\n", port,
> +			route_switch ? " (route switch)" : "");
> +}
> +
> +static int sn624x_uaj_pde_request_d0(struct device *dev,
> +				     struct sn624x_sdca_priv *sn624x,
> +				     unsigned int ent)
> +{
> +	int ret;
> +
> +	ret = sn624x_pde_request_ps(dev, sn624x->regmap,
> +				    SN624X_FUNC_NUM_JACK_CODEC, ent,
> +				    SN624X_PWR_D0);
> +	if (ret < 0)
> +		dev_warn(dev,
> +			 "sn624x: jack_cap: PDE%02X to D0 failed (%d)\n",
> +			 ent, ret);
> +	return ret;
> +}
> +
> +static int sn624x_uaj_ge35_select_mode(struct device *dev,
> +				       struct sn624x_sdca_priv *sn624x,
> +				       unsigned int mode)
> +{
> +	int ret;
> +
> +	ret = regmap_write(sn624x->regmap,
> +			   SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC,
> +					SN624X_SDCA_ENT_GE35,
> +					SN624X_SDCA_CTL_SELECTED_MODE, 0),
> +			   mode);
> +	if (ret < 0)
> +		dev_warn(dev,
> +			 "sn624x: jack_cap: GE35 SELECTED_MODE=0x%x failed (%d)\n",
> +			 mode, ret);
> +	else
> +		dev_dbg(dev,
> +			 "sn624x: jack_cap: GE35 SELECTED_MODE=0x%x\n",
> +			 mode);
> +	return ret;
> +}
> +
> +/*
> + * Follow DETECTED_MODE → SELECTED_MODE (rt711/rt722 pattern). Never force
> + * headset: mic path is only valid when the jack hardware reports one.
> + */
> +static int sn624x_uaj_ge35_apply_detected_mode(struct device *dev,
> +					       struct sn624x_sdca_priv *sn624x)
> +{
> +	unsigned int det_mode = 0;
> +	int ret;
> +
> +	ret = regmap_read(sn624x->regmap,
> +			  SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC,
> +				       SN624X_SDCA_ENT_GE35,
> +				       SN624X_SDCA_CTL_DETECTED_MODE, 0),
> +			  &det_mode);
> +	if (ret < 0) {
> +		dev_warn(dev,
> +			 "sn624x: jack_cap: GE35 DETECTED_MODE read failed (%d)\n",
> +			 ret);
> +		return ret;
> +	}
> +
> +	dev_dbg(dev, "sn624x: jack_cap: GE35 DETECTED_MODE=0x%x\n", det_mode);
> +
> +	if (!det_mode) {
> +		dev_dbg(dev,
> +			"sn624x: jack_cap: no jack detected — skip SELECTED_MODE\n");
> +		return 0;
> +	}
> +
> +	return sn624x_uaj_ge35_select_mode(dev, sn624x, det_mode);
> +}
> +
> +static const char *sn624x_rate_sel_str(unsigned int v)
> +{
> +	switch (v & 0xffu) {
> +	case 1:
> +		return "48k";
> +	case 2:
> +		return "96k";
> +	case 3:
> +		return "192k";
> +	default:
> +		return "?";
> +	}
> +}
> +
> +static void sn624x_hw_params_jack_playback(struct snd_soc_dai *dai,
> +					   struct snd_pcm_substream *substream,
> +					   struct sn624x_sdca_priv *sn624x)
> +{
> +	struct device *dev = dai->dev;
> +	unsigned int v;
> +	int r;
> +
> +	if (!sn624x_codec_diag || !sn624x->regmap)
> +		return;
> +
> +	if (sn624x_mask_sdca_irqs)
> +		sn624x_sdca_sdca_irq_mask_all(sn624x);
> +
> +	if (sn624x->slave)
> +		dev_dbg(dev,
> +			 "sn624x: jack_out diag: prelude hw_init=%d first_hw_init=%d sdw_status=%s(%d) dev_num=%u\n",
> +			 sn624x->hw_init, sn624x->first_hw_init,
> +			 sn624x_slave_status_sym(sn624x->slave->status),
> +			 sn624x->slave->status, sn624x->slave->dev_num);
> +
> +	r = regmap_read_bypassed(sn624x->regmap, SN624X_REG_JACK_OUT_PWR_STATE, &v);
> +	if (r == 0 && (v & 0x3u) == 3u)
> +		sn624x_jack_out_pwr_request_d0(dev, sn624x);

I am not sure this is the right way to deal with power management, in
previous drivers the power is managed via DAPM events. Doing a manual
power management in the hw_params looks very odd.

> +
> +	{
> +		const struct reg_sequence mute_vol[] = {
> +			REG_SEQ0(SN624X_REG_JACK_OUT_MUTE, 0),
> +			REG_SEQ0(SN624X_REG_JACK_OUT_VOL, 0),
> +			REG_SEQ0(SN624X_REG_JACK_OUT_CHR_VOL, 0),

That's odd, why do you need to both mute and set the volume to zero?

> +		};
> +
> +		r = regmap_multi_reg_write_bypassed(sn624x->regmap, mute_vol,
> +						    ARRAY_SIZE(mute_vol));
> +		if (r < 0)
> +			dev_dbg(dev,
> +				 "sn624x: jack_out diag: write MUTE/VOL err %d\n",
> +				 r);
> +	}
> +}
> +
> +static void sn624x_hw_params_speaker_playback(struct snd_soc_dai *dai,
> +					     struct snd_pcm_substream *substream,
> +					     struct sn624x_sdca_priv *sn624x)
> +{
> +	struct device *dev = dai->dev;
> +	unsigned int v;
> +	int r;
> +
> +	if (!sn624x_codec_diag || !sn624x->regmap)
> +		return;
> +
> +	if (sn624x_mask_sdca_irqs)
> +		sn624x_sdca_sdca_irq_mask_all(sn624x);
> +
> +	if (sn624x->slave)
> +		dev_dbg(dev,
> +			 "sn624x: diag: prelude hw_init=%d first_hw_init=%d sdw_status=%s(%d) dev_num=%u\n",
> +			 sn624x->hw_init, sn624x->first_hw_init,
> +			 sn624x_slave_status_sym(sn624x->slave->status),
> +			 sn624x->slave->status, sn624x->slave->dev_num);
> +
> +	r = regmap_read_bypassed(sn624x->regmap, SN624X_REG_PWR_STATE, &v);
> +	if (r == 0 && (v & 0x3u) == 3u)
> +		sn624x_pwr_request_d0(dev, sn624x);
> +	{
> +		const struct reg_sequence mute_vol[] = {
> +			REG_SEQ0(SN624X_REG_MUTE, 0),
> +			REG_SEQ0(SN624X_REG_RIGHT_MUTE, 0),
> +			REG_SEQ0(SN624X_REG_VOL, 0),
> +			REG_SEQ0(SN624X_REG_CHR_VOL, 0),
> +		};
> +
> +		r = regmap_multi_reg_write_bypassed(sn624x->regmap, mute_vol,
> +						    ARRAY_SIZE(mute_vol));
> +		if (r < 0)
> +			dev_dbg(dev, "sn624x: diag: write MUTE/VOL err %d\n", r);
> +	}

same comments for speaker as for jack.

> +}
> +
> +static void sn624x_hw_params_jack_capture(struct snd_soc_dai *dai,
> +					  struct snd_pcm_substream *substream,
> +					  struct sn624x_sdca_priv *sn624x)
> +{
> +	struct device *dev = dai->dev;
> +	struct snd_soc_component *component = dai->component;
> +	int r;
> +
> +	if (!sn624x->regmap || !sn624x->slave)
> +		return;
> +
> +	if (component && component->card)
> +		snd_soc_dapm_enable_pin(snd_soc_card_to_dapm(component->card),
> +					"Headset Mic");

this doesn't seem right, the pins are usually managed at the card level, no?

> +
> +	r = sn624x_jack_cap_pwr_request_d0(dev, sn624x);
> +	if (r < 0)
> +		dev_warn(dev,
> +			 "sn624x: jack_cap: vendor PWR D0 request failed (%d)\n",
> +			 r);
> +
> +	sn624x_uaj_pde_request_d0(dev, sn624x, SN624X_UAJ_ENT_PDE34);
> +	sn624x_uaj_pde_request_d0(dev, sn624x, SN624X_UAJ_ENT_PDE47);

a comment on why you have two PDEs wouldn't hurt, I don't remember what
this topology looks like and don't know which options are enabled by
this device.

> +
> +	sn624x_uaj_ge35_apply_detected_mode(dev, sn624x);
> +
> +	{
> +		const struct reg_sequence cap_gain[] = {
> +			REG_SEQ0(SN624X_REG_JACK_CAP_VOL, SN624X_VOL_Q78(6, 0)),
> +			REG_SEQ0(SN624X_REG_JACK_CAP_CHR_VOL, SN624X_VOL_Q78(6, 0)),
> +			REG_SEQ0(SN624X_REG_JACK_CAP_MUTE, 0),
> +		};
> +
> +		r = regmap_multi_reg_write_bypassed(sn624x->regmap, cap_gain,
> +						    ARRAY_SIZE(cap_gain));
> +		if (r < 0)
> +			dev_warn(dev, "sn624x: jack_cap: write INT/FRAC/MUTE err %d\n", r);
> +	}

not sure why you used this intendation, in all those hw_params, those
parentheses are odd.

> +
> +	if (!sn624x_codec_diag)
> +		return;
> +}
> +static void sn624x_hw_params_dmic_capture(struct snd_soc_dai *dai,
> +					  struct snd_pcm_substream *substream,
> +					  struct sn624x_sdca_priv *sn624x)
> +{
> +	struct device *dev = dai->dev;
> +	unsigned int vol, mute, rate;
> +	int r;
> +
> +	if (!sn624x->regmap || !sn624x->slave)
> +		return;
> +
> +	r = sn624x_dmic_cap_pwr_request_d0(dev, sn624x);
> +	if (r < 0)
> +		dev_warn(dev,
> +			 "sn624x: dmic_cap: vendor PWR D0 request failed (%d)\n",
> +			 r);
> +
> +	{
> +		const struct reg_sequence cap_gain[] = {
> +			REG_SEQ0(SN624X_REG_DMIC_CAP_VOL, SN624X_VOL_Q78(6, 0)),
> +			REG_SEQ0(SN624X_REG_DMIC_CAP_CHR_VOL, SN624X_VOL_Q78(6, 0)),
> +			REG_SEQ0(SN624X_REG_DMIC_CAP_MUTE, 0),
> +			REG_SEQ0(SN624X_REG_DMIC_CAP_CHR_MUTE, 0),
> +		};
> +
> +		r = regmap_multi_reg_write_bypassed(sn624x->regmap, cap_gain,
> +						    ARRAY_SIZE(cap_gain));
> +		if (r < 0)
> +			dev_warn(dev, "sn624x: dmic_cap: write VOL/MUTE err %d\n", r);
> +	}
> +
> +	r = regmap_read_bypassed(sn624x->regmap, SN624X_REG_DMIC_CAP_RATE_SEL,
> +				 &rate);
> +	if (r < 0)
> +		dev_warn(dev, "sn624x: dmic_cap: read RATE 0x%x err %d\n",
> +			 (unsigned int)SN624X_REG_DMIC_CAP_RATE_SEL, r);
> +	else
> +		dev_dbg(dev,
> +			 "sn624x: dmic_cap: sample_rate_sel[0x%x]=0x%x (%s)\n",
> +			 (unsigned int)SN624X_REG_DMIC_CAP_RATE_SEL, rate & 0xffu,
> +			 sn624x_rate_sel_str(rate));
> +
> +	if (!sn624x_codec_diag)
> +		return;
> +
> +	r = regmap_read_bypassed(sn624x->regmap, SN624X_REG_DMIC_CAP_VOL, &vol);
> +	if (r < 0)
> +		dev_dbg(dev, "sn624x: dmic_cap: read VOL 0x%x err %d\n",
> +			 (unsigned int)SN624X_REG_DMIC_CAP_VOL, r);
> +	else
> +		dev_dbg(dev,
> +			 "sn624x: dmic_cap: vol[0x%x]=0x%x (int=%u frac=%u)\n",
> +			 (unsigned int)SN624X_REG_DMIC_CAP_VOL, vol,
> +			 (vol >> 8) & 0xff, vol & 0xff);
> +
> +	r = regmap_read_bypassed(sn624x->regmap, SN624X_REG_DMIC_CAP_MUTE, &mute);
> +	if (r < 0)
> +		dev_dbg(dev, "sn624x: dmic_cap: read MUTE 0x%x err %d\n",
> +			 (unsigned int)SN624X_REG_DMIC_CAP_MUTE, r);
> +	else
> +		dev_dbg(dev, "sn624x: dmic_cap: mute[0x%x]=0x%x (%s)\n",
> +			 (unsigned int)SN624X_REG_DMIC_CAP_MUTE, mute & 0xffu,
> +			 (mute & 0xffu) ? "muted" : "unmuted");

what's the point of reading the volume from the registers? in all other
hw_params you only write, not read.


> +static bool sn624x_sdca_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	if (!SDW_SDCA_VALID_CTL(reg))
> +		return true;
> +
> +	/* Do not match by csel alone: 0x02 is also FU_VOLUME, 0x10 is shared. */

confusing comment, consider rewording.

> +	switch (reg) {
> +	case SN624X_REG_PWR_STATE:
> +	case SN624X_REG_JACK_OUT_PWR_STATE:
> +	case SN624X_REG_JACK_CAP_PWR_STATE:
> +	case SN624X_REG_DMIC_CAP_PWR_STATE:
> +	case SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_GE35,
> +			  SN624X_SDCA_CTL_DETECTED_MODE, 0):
> +		return true;
> +	default:
> +		if (SDW_SDCA_CTL_CSEL(reg) == SN624X_SDCA_CTL_ACTUAL_POWER_STATE)
> +			return true;

that's my previous comment, using a channel selector for power
management makes no sense.

> +		return false;
> +	}
> +}
> +

> +static const struct regmap_config sn624x_sdca_regmap = {
> +	.reg_bits = 32,
> +	.val_bits = 16,
> +	.readable_reg = sn624x_sdca_readable_register,
> +	.volatile_reg = sn624x_sdca_volatile_register,
> +	.max_register = 0xffffffff,
> +	.reg_defaults = sn624x_sdca_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(sn624x_sdca_reg_defaults),
> +	/*
> +	 * MAPLE + regcache_cache_only(true) in sn624x_sdca_init() defers bus I/O
> +	 * until io_init(); plain regmap_read before then returns -EBUSY.

confusing comment.

> +	 */
> +	.cache_type = REGCACHE_MAPLE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};
> +
> +/*
> + * UAJ jack defaults via SDCA controls (MFPU36 input delay, block charge pump).
> + * Hardcoded from OEM bring-up; this driver does not read the ACPI
> + * mipi-sdca-function-initialization-table. Run on every io_init so attach and

there should be an option to use the function-initialization-table,
otherwise you will have to quirk this driver endlessly. OEM settings
shouldn't be hard-coded here IMHO.

> + * resume restore jack path state. When Entity0 reports NeedsInitialization,
> + * sn624x_jack_init_table() also programs the same parameters through vendor
> + * SCP windows — different address map, same validated values.
> + */
> +static void sn624x_uaj_apply_io_defaults(struct sn624x_sdca_priv *sn624x)
> +{
> +	struct device *dev = &sn624x->slave->dev;
> +	int ret;
> +
> +	/* Called only from io_init() after SDW_SLAVE_ATTACHED. */
> +	SN624X_TRC(dev, "apply UAJ io defaults (input delay, charge pump)\n");
> +	ret = regmap_write(sn624x->regmap,
> +			   SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_UAJ_ENT_MFPU36,
> +					SN624X_UAJ_CTL_INPUT_DELAY, 0),
> +			   0x0f);
> +	if (ret < 0)
> +		dev_warn(dev, "UAJ input delay: write failed (%d)\n", ret);
> +
> +	ret = regmap_write(sn624x->regmap,
> +			   SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_UAJ_ENT_BLOCK,
> +					SN624X_UAJ_CTL_CHARGE_PUMP, 0),
> +			   0x0b);
> +	if (ret < 0)
> +		dev_warn(dev, "UAJ charge pump: write failed (%d)\n", ret);

and I don't see anything that really applies io_defaults. What is this
routine about really?


> +/*
> + * Jack detection path (poll-primary when mask_sdca_irqs=true, the default).
> + *
> + * jack_detect_work calls this every SN624X_JACK_POLL_MS. SDCA IRQs are masked
> + * by default to avoid IRQ/alert interaction with speaker PWR/MUTE bring-up;

what interaction are you referring to? The speaker and jack are
different functions thus should have different IRQs.

You've said too much or too little here.

> + * the poll is therefore the sole detection path unless mask_sdca_irqs=N.
> + *
> + * @full: pulse UAJ jack-detect (hardware stimulus during poll, not an IRQ
> + * handler), read GE35 Detected_Mode, write Selected_Mode to match, then clear
> + * the pulse. When false, only read Detected_Mode. All callers currently pass
> + * true. With mask_sdca_irqs=N, interrupt_callback can accelerate polling.
> + */
> +static int sn624x_sdca_headset_detect(struct sn624x_sdca_priv *sn624x, bool full)

I may be thick but couldn't figure out what 'full' means.

maybe you meant something like 'force_detection'?

> +{
> +	unsigned int det_mode;
> +	int ret;
> +
> +	if (full) {
> +		SN624X_DBG(&sn624x->slave->dev,
> +			   "headset_detect: pulse UAJ jack-detect, read GE35\n");
> +		ret = regmap_write(sn624x->regmap,
> +				   SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC,
> +						SN624X_UAJ_ENT_BLOCK,
> +						SN624X_UAJ_CTL_JACK_DETECT, 0),
> +				   0x08);
> +		if (ret < 0)
> +			goto io_error;
> +
> +		usleep_range(5000, 5500);
> +	}
> +
> +	ret = regmap_read(sn624x->regmap,
> +			  SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_GE35,
> +				       SN624X_SDCA_CTL_DETECTED_MODE, 0),
> +			  &det_mode);
> +	if (ret < 0)
> +		goto io_error;
> +
> +	if (full) {
> +		regmap_write(sn624x->regmap,
> +			     SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_UAJ_ENT_BLOCK,
> +					  SN624X_UAJ_CTL_JACK_DETECT, 0),
> +			     0x00);
> +	}
> +
> +	sn624x_jack_type_from_det_mode(sn624x, det_mode);
> +
> +	if (full && det_mode) {
> +		ret = regmap_write(sn624x->regmap,
> +				   SDW_SDCA_CTL(SN624X_FUNC_NUM_JACK_CODEC, SN624X_SDCA_ENT_GE35,
> +						SN624X_SDCA_CTL_SELECTED_MODE, 0),
> +				   det_mode);
> +		if (ret < 0)
> +			goto io_error;
> +	}
> +
> +	SN624X_DBG(&sn624x->slave->dev,
> +		   "headset_detect: %s detected_mode=0x%x jack_type=0x%x\n",
> +		   full ? "full" : "light", det_mode, sn624x->jack_type);
> +
> +	return 0;
> +
> +io_error:
> +	if (ret == -ENODATA)
> +		SN624X_DBG(&sn624x->slave->dev,
> +			   "%s: UAJ/GE35 access ignored (-ENODATA)\n", __func__);
> +	else
> +		dev_err_ratelimited(&sn624x->slave->dev, "%s failed (%d)\n",
> +				    __func__, ret);
> +	return ret;

the other comment is that you already have code to deal with
Detected/selected mode in sn624x_uaj_ge35_apply_detected_mode().

Can your refactor and use common code?


> +static void sn624x_sdca_jack_detect_handler(struct work_struct *work)
> +{
> +	struct sn624x_sdca_priv *sn624x =
> +		container_of(work, struct sn624x_sdca_priv, jack_detect_work.work);
> +	struct device *dev;
> +	struct snd_soc_component *component;
> +	int pm_ret;
> +	bool got_pm = false;
> +
> +	if (!sn624x->slave) {
> +		sn624x_jack_schedule_poll(sn624x);
> +		return;
> +	}
> +
> +	dev = &sn624x->slave->dev;
> +	component = sn624x->component;
> +	if (component) {
> +		pm_ret = pm_runtime_resume_and_get(component->dev);
> +		if (pm_ret >= 0)
> +			got_pm = true;
> +		else if (pm_ret != -EACCES)
> +			SN624X_DBG(dev, "jack_work: pm resume failed (%d)\n", pm_ret);
> +	}
> +
> +	if (!sn624x->hs_jack) {
> +		SN624X_DBG(dev, "jack_work: skip (no hs_jack)\n");
> +		goto out_reschedule;
> +	}
> +
> +	/* Registers are only valid after ATTACHED → io_init (hw_init). */
> +	if (!sn624x->hw_init) {
> +		SN624X_DBG(dev, "jack_work: skip (hw_init not ready)\n");
> +		goto out_reschedule;
> +	}
> +
> +	/* Poll GE35 every interval; do not rely on SDCA_0 IRQ or PCM activity */
> +	sn624x_sdca_headset_detect(sn624x, true);
> +
> +	if (sn624x->jack_type != sn624x->jack_type_last) {
> +		dev_dbg(dev,
> +			 "sn624x: jack event: %s (jack_type=0x%x; HP=0x%x HS=0x%x)\n",
> +			 sn624x->jack_type ? "plug" : "unplug",
> +			 sn624x->jack_type, SND_JACK_HEADPHONE, SND_JACK_HEADSET);
> +		sn624x->jack_type_last = sn624x->jack_type;
> +
> +		snd_soc_jack_report(sn624x->hs_jack, sn624x->jack_type,
> +				    SND_JACK_HEADSET | SND_JACK_HEADPHONE);
> +	}
> +
> +out_reschedule:
> +	sn624x_jack_schedule_poll(sn624x);
> +	if (got_pm) {
> +		pm_runtime_mark_last_busy(component->dev);
> +		pm_runtime_put_autosuspend(component->dev);
> +	}
> +}
> +
> +static void sn624x_sdca_jack_init(struct sn624x_sdca_priv *sn624x)
> +{
> +	if (!sn624x->hs_jack)
> +		return;
> +
> +	sn624x_sdca_jack_irq_unmask(sn624x);
> +	sn624x_sdca_jack_poll_and_report(sn624x);
> +	sn624x_jack_schedule_poll(sn624x);

is this saying that jack detection is not supported or broken on this
device?

if that's the case, then you would need to detect the mode at every
resume to make sure the jack insertion isn't lost if it happened during
suspend.

> +
> +	dev_dbg(&sn624x->slave->dev,
> +		 "sn624x: jack_init: poll scheduled every %ums\n", SN624X_JACK_POLL_MS);
> +	SN624X_DBG(&sn624x->slave->dev, "jack_init: SDCA INTMASK1/2 unmasked\n");
> +	SN624X_TRC(&sn624x->slave->dev, "jack detection IRQ unmasked\n");
> +}
> +
> +static int sn624x_sdca_set_jack_detect(struct snd_soc_component *component,
> +				       struct snd_soc_jack *hs_jack, void *data)
> +{
> +	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	sn624x->hs_jack = hs_jack;
> +	sn624x->jack_type_last = -1;
> +	dev_dbg(component->dev,
> +		 "sn624x: set_jack: hs_jack=%p first_hw_init=%d hw_init=%d\n",
> +		 hs_jack, sn624x->first_hw_init, sn624x->hw_init);
> +
> +	if (!sn624x->first_hw_init) {
> +		/*
> +		 * Machine set_jack often runs before io_init(); start the poll
> +		 * work now so jack_detect_handler runs once hw is ready.
> +		 */

humm, what happens after a resume? You would need to reprogram the polls
on resume, and stop them on suspend. If you only do this for the first
init it'd be very odd.

> +		sn624x_jack_schedule_poll(sn624x);
> +		dev_dbg(component->dev,
> +			 "sn624x: set_jack: deferred jack_init, poll scheduled\n");
> +		return 0;
> +	}
> +
> +	ret = pm_runtime_resume_and_get(component->dev);
> +	if (ret < 0) {
> +		if (ret != -EACCES) {
> +			dev_err(component->dev, "%s: resume failed (%d)\n", __func__, ret);
> +			return ret;
> +		}
> +		sn624x_jack_schedule_poll(sn624x);
> +		dev_dbg(component->dev,
> +			 "sn624x: set_jack: pm not ready, poll scheduled only\n");
> +		return 0;
> +	}
> +
> +	sn624x_sdca_jack_init(sn624x);
> +	pm_runtime_put_autosuspend(component->dev);
> +
> +	return 0;
> +}
> +
> +static int sn624x_jack_init_table(struct device *dev, struct sn624x_sdca_priv *sn624x)
> +{
> +	int ret;
> +	/*
> +	 * Full vendor-window init when Entity0 NeedsInitialization is set.
> +	 * INPUT_DELAY_TIME / PORTA_CHARGE_PUMP mirror sn624x_uaj_apply_io_defaults()
> +	 * (0x0f / 0x0b) but through SCP vendor addresses required on function reset.
> +	 */
> +	const struct reg_sequence jack_init_table[] = {
> +		REG_SEQ0(SN624X_UAJ_CTL_IT33_MIC_BIAS, 0x06),
> +		REG_SEQ0(SN624X_UAJ_CTL_IT31_MIC_BIAS, 0x06),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU41_CH1_MUTE, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU41_CH2_MUTE, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU31_CH0_MUTE, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU32_CH0_MUTE, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU33_CH0_MUTE, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU36_CH1_MUTE, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU36_CH2_MUTE, 0x00),

are those really initialization or defaults.

> +		REG_SEQ0(SN624X_UAJ_CTL_FU31_CH0_GAIN_HIGH, 0x12),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU31_CH0_GAIN_LOW, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU32_CH0_GAIN_HIGH, 0x0C),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU32_CH0_GAIN_LOW, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU33_CH0_GAIN_HIGH, 0x12),
> +		REG_SEQ0(SN624X_UAJ_CTL_FU33_CH0_GAIN_LOW, 0x00),
> +		REG_SEQ0(SN624X_UAJ_CTL_INPUT_DELAY_TIME, 0x0F),
> +		REG_SEQ0(SN624X_UAJ_CTL_PORTA_CHARGE_PUMP, 0x0B),
> +	};

Those to look like OEM-specific of product-specific settings.

same comments as before, you probably need to have an option to read the
initialization table from firmware, or look at ways to quirk this if
different OEMs do different things.

> +	if (!sn624x || !sn624x->regmap || !sn624x->slave)
> +		return -ENODEV;
> +
> +	ret = regmap_multi_reg_write_bypassed(
> +		sn624x->regmap, jack_init_table, ARRAY_SIZE(jack_init_table));
> +	if (ret < 0) {
> +		dev_warn(dev,
> +			 "sn624x: io_init: JACK FUN STATUS CTL write 0x%x=0 failed (%d)\n",
> +			 (unsigned int)SN624X_REG_JACK_FUN_STATUS_CTL, ret);
> +		return ret;
> +	}
> +
> +	usleep_range(1000, 1500);
> +	return 0;
> +}
> +static int sn624x_dmic_init_table(struct device *dev, struct sn624x_sdca_priv *sn624x)
> +{
> +	int ret;
> +	const struct reg_sequence dmic_init_table[] = {
> +		REG_SEQ0(0x00002041, 0x00),
> +		REG_SEQ0(SN624X_UAJ_DMIC_PPU11, 0x30),
> +		REG_SEQ0(0x00002105, 0x66),
> +		REG_SEQ0(0x00002107, 0x26),
> +		REG_SEQ0(0x00002109, 0x62),
> +		REG_SEQ0(0x40800a09, 0x00),
> +		REG_SEQ0(0x40800a0a, 0x00),
> +		REG_SEQ0(0x40802a11, 0x00),
> +		REG_SEQ0(0x40800a11, 0x00),
> +		REG_SEQ0(0x40802a12, 0x00),
> +		REG_SEQ0(0x40800a12, 0x00),
> +		REG_SEQ0(0x40802a13, 0x00),
> +		REG_SEQ0(0x40800a13, 0x00),
> +		REG_SEQ0(0x40802a14, 0x00),
> +		REG_SEQ0(0x40800a14, 0x00),
> +		REG_SEQ0(0x408029d8, 0x0c),
> +		REG_SEQ0(0x408009d8, 0x00),
> +		REG_SEQ0(0x408029d9, 0x0c),
> +		REG_SEQ0(0x408009d9, 0x00),
> +		REG_SEQ0(0x00002140, 0x18),
> +		REG_SEQ0(0x00002045, 0x01),
> +	};

same here, can this be read from firmware.

> +	if (!sn624x || !sn624x->regmap || !sn624x->slave)
> +		return -ENODEV;
> +
> +	ret = regmap_multi_reg_write_bypassed(
> +		sn624x->regmap, dmic_init_table, ARRAY_SIZE(dmic_init_table));
> +	if (ret < 0) {
> +		dev_warn(dev,
> +			 "sn624x: io_init: DMIC FUN STATUS CTL write 0x%x=0 failed (%d)\n",
> +			 (unsigned int)SN624X_REG_DMIC_FUN_STATUS_CTL, ret);
> +		return ret;
> +	}
> +
> +	usleep_range(1000, 1500);
> +	return 0;
> +}
> +
> +static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave *slave)
> +{
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +	int ret;
> +	unsigned int jack_func_status, dmic_func_status;
> +
> +	if (sn624x->hw_init) {
> +		SN624X_DBG(dev, "io_init: skip (hw_init already true)\n");
> +		return 0;
> +	}
> +
> +	SN624X_TRC(dev, "io_init: start (first hardware bring-up)\n");
> +	sn624x->disable_irq = false;
> +
> +	if (sn624x_mask_sdca_irqs)
> +		sn624x_sdca_sdca_irq_mask_all(sn624x);
> +
> +	regcache_cache_only(sn624x->regmap, false);
> +
> +	pm_runtime_get_noresume(dev);
> +
> +	ret = sn624x_pwr_request_d0(dev, sn624x);
> +	if (ret < 0)
> +		SN624X_DBG(dev, "io_init: PWR D0 request failed (%d), continuing\n", ret);
> +
> +	ret = sn624x_jack_cap_pwr_request_d0(dev, sn624x);

why do you need to play with power states here? It's quite odd because
you don't go back to PS3, do you?

> +	if (ret < 0)
> +		SN624X_DBG(dev, "io_init: Jack Cap PWR D0 request failed (%d), continuing\n",
> +			   ret);
> +
> +	sn624x_uaj_apply_io_defaults(sn624x);
> +
> +	if (sn624x->hs_jack)
> +		sn624x_sdca_jack_init(sn624x);
> +
> +	ret = regmap_read_bypassed(sn624x->regmap,
> +		SN624X_REG_SPEAKER_FUN_STATUS_CTL,
> +		&jack_func_status);

No, you have the registers wrong, this should be
SN624X_REG_JACK_FUN_STATUS_CTL or this should be &speaker_status.

> +	if (ret < 0) {
> +		dev_dbg(dev,
> +			"sn624x: io_init: SPEAKER FUN STATUS read failed (%d)\n",
> +			ret);
> +	}

or maybe you don't need to read that register at all if you only care
about the jack below...

> +	ret = regmap_read_bypassed(sn624x->regmap,
> +					SN624X_REG_JACK_FUN_STATUS_CTL,
> +					&jack_func_status);
> +	if (ret < 0) {
> +		dev_dbg(dev,
> +			"sn624x: io_init: JACK FUN STATUS read failed (%d)\n",
> +			ret);
> +		goto io_init_next;
> +	}
> +	if (jack_func_status & (SN624X_JACK_FUN_NEEDS_INIT |
> +				SN624X_JACK_FUN_HAS_BEEN_RESET)) {
> +		const struct reg_sequence clear_status =
> +			REG_SEQ0(SN624X_REG_JACK_FUN_STATUS_CTL, 0x61);
> +
> +		ret = sn624x_jack_init_table(dev, sn624x);
> +		if (ret < 0) {
> +			dev_warn(dev,
> +					"sn624x: io_init: jack init table failed (%d)\n",
> +					ret);
> +			goto io_init_next;
> +		}
> +		ret = regmap_multi_reg_write_bypassed(
> +			sn624x->regmap, &clear_status, 1);
> +		if (ret < 0) {
> +			dev_warn(dev,
> +					"sn624x: io_init: JACK FUN STATUS clear write failed (%d)\n",
> +					ret);
> +			goto io_init_next;
> +		}
> +		usleep_range(1000, 1500);
> +	}
> +
> +io_init_next:
> +	ret = regmap_read_bypassed(sn624x->regmap,
> +					SN624X_REG_DMIC_FUN_STATUS_CTL,
> +					&dmic_func_status);
> +	if (ret < 0) {
> +		dev_dbg(dev,
> +			"sn624x: io_init: DMIC FUN STATUS read failed (%d)\n",
> +			ret);
> +		goto io_init_end;
> +	}
> +
> +	if (dmic_func_status & (SN624X_JACK_FUN_NEEDS_INIT |
> +				SN624X_JACK_FUN_HAS_BEEN_RESET)){
> +		const struct reg_sequence clear_status =
> +			REG_SEQ0(SN624X_REG_DMIC_FUN_STATUS_CTL, 0x61);
> +		ret = sn624x_dmic_init_table(dev, sn624x);
> +		if (ret < 0) {
> +			dev_warn(dev,
> +					"sn624x: io_init: dmic init table failed (%d)\n",
> +					ret);
> +			goto io_init_end;
> +		}
> +		ret = regmap_multi_reg_write_bypassed(sn624x->regmap,
> +								&clear_status,
> +								1);
> +		if (ret < 0) {
> +			dev_warn(dev,
> +					"sn624x: io_init: DMIC FUN STATUS clear write failed (%d)\n",
> +					ret);
> +			goto io_init_end;
> +		}
> +		usleep_range(1000, 1500);
> +	}
> +
> +io_init_end:
> +	pm_runtime_set_active(dev);
> +
> +	sn624x->hw_init = true;
> +	sn624x->first_hw_init = true;
> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	sn624x_log_power_mode_once(dev, sn624x);
> +
> +	SN624X_DBG(dev, "io_init: complete (hw_init set)\n");
> +	SN624X_TRC(dev, "io_init: done, jack %s\n",
> +		   sn624x->hs_jack ? "will init" : "not registered yet");
> +	return 0;
> +}
> +
> +/*
> + * Bus lifecycle (same as rt722): enumerate → assign dev_num → ATTACHED →
> + * io_init(). Do not poll enumeration/init around each register access; after
> + * unattach, resume waits once on initialization_complete then regcache_sync.
> + */
> +static int sn624x_sdca_update_status(struct sdw_slave *slave,
> +				     enum sdw_slave_status status)
> +{
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(&slave->dev);
> +
> +	SN624X_DBG(&slave->dev, "update_status: %s hw_init=%d dev_num=%u\n",
> +		   sn624x_status_str(status), sn624x->hw_init, slave->dev_num);
> +	SN624X_TRC(&slave->dev, "SDW status=%s (hw_init=%d)\n",
> +		   sn624x_status_str(status), sn624x->hw_init);
> +
> +	if (status == SDW_SLAVE_UNATTACHED) {
> +		cancel_delayed_work_sync(&sn624x->jack_detect_work);
> +		sn624x->hw_init = false;
> +		SN624X_TRC(&slave->dev, "slave UNATTACHED: cleared hw_init, jack work cancelled\n");
> +	}
> +
> +	if (status == SDW_SLAVE_ATTACHED) {
> +		if (sn624x_mask_sdca_irqs)
> +			sn624x_sdca_sdca_irq_mask_all(sn624x);
> +
> +		if (sn624x->hs_jack && sn624x->hw_init) {
> +			sn624x_sdca_jack_irq_unmask(sn624x);
> +			sn624x_sdca_jack_poll_and_report(sn624x);
> +			sn624x_jack_schedule_poll(sn624x);
> +		}

shouldn't you do the jack polling stuff *after* the basic initializations?

> +	}
> +
> +	if (status != SDW_SLAVE_ATTACHED)
> +		return 0;
> +
> +	if (sn624x->hw_init) {
> +		dev_dbg(&slave->dev,
> +			"sn624x: update_status ATTACHED: io_init already done\n");
> +		return 0;
> +	}
> +
> +	dev_notice(&slave->dev, "sn624x: update_status ATTACHED -> io_init()\n");
> +
> +	SN624X_TRC(&slave->dev, "calling io_init from ATTACHED\n");
> +	return sn624x_sdca_io_init(&slave->dev, slave);
> +}
> +
> +static int sn624x_sdca_read_prop(struct sdw_slave *slave)
> +{
> +	struct sdw_slave_prop *prop = &slave->prop;
> +	struct sdw_dpn_prop *dpn;
> +	unsigned long addr;
> +	unsigned int bit;
> +	int nval;
> +	int i, j;
> +
> +	sdw_slave_read_lane_mapping(slave);
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
> +	prop->paging_support = true;
> +	prop->use_domain_irq = true;
> +	prop->wake_capable = true;
> +
> +	prop->source_ports = BIT(SN624X_PORT_JACK_CAPTURE) |
> +			     BIT(SN624X_PORT_DMIC_CAPTURE);
> +	prop->sink_ports = BIT(SN624X_PORT_JACK_PLAYBACK) |
> +			   BIT(SN624X_PORT_SPEAKER_PLAYBACK);
> +
> +	nval = hweight32(prop->source_ports);
> +	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +					   sizeof(*prop->src_dpn_prop), GFP_KERNEL);
> +	if (!prop->src_dpn_prop)
> +		return -ENOMEM;
> +	i = 0;
> +	dpn = prop->src_dpn_prop;
> +	addr = prop->source_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[i].num = bit;
> +		dpn[i].type = SDW_DPN_FULL;
> +		dpn[i].simple_ch_prep_sm = true;
> +		dpn[i].ch_prep_timeout = 10;
> +		i++;
> +	}
> +	nval = hweight32(prop->sink_ports);
> +	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +					   sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
> +	if (!prop->sink_dpn_prop)
> +		return -ENOMEM;
> +	j = 0;
> +	dpn = prop->sink_dpn_prop;
> +	addr = prop->sink_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[j].num = bit;
> +		dpn[j].type = SDW_DPN_FULL;
> +		dpn[j].simple_ch_prep_sm = true;
> +		dpn[j].ch_prep_timeout = 10;
> +		j++;
> +	}
> +	prop->clk_stop_timeout = 900;
> +	/*
> +	 * Use MIPI simple clock-stop: avoids sdw_bus_wait_for_clk_prep_deprep()
> +	 * on SDW_BROADCAST_DEV_NUM (15). Kernel logs "slave:15" for that wait,
> +	 * not a second physical device — SN624X is typically dev_num 6 on LNL.
> +	 */

confusing comment, what are you trying to say?

Device 15 is an alias for 'all devices'. You shouldn't make any
assumptions on how the manager enumerates devices and which dev_num is
assigned.

> +	prop->simple_clk_stop_capable = true;
> +	prop->lane_control_support = true;
> +	SN624X_DBG(&slave->dev,
> +		   "read_prop: src_ports=0x%x sink_ports=0x%x lane irq paging\n",
> +		   prop->source_ports, prop->sink_ports);
> +	SN624X_TRC(&slave->dev, "read_prop: slave properties filled\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * Clear SDCA INT1/2 only. DP0_INT standard fields (PORT_READY, etc.) are
> + * owned by the SoundWire bus core; cascade clears when SDCA status is clear.
> + * Pending SDCA IRQs can block clock-stop prepare (CLK_STP_NF -> -ETIMEDOUT).
> + */
> +static int sn624x_sdca_flush_pending_irqs(struct sn624x_sdca_priv *sn624x,
> +					  struct device *dev)
> +{
> +	int ret, stat = 0;
> +	int count = 0;
> +	const int retry = 3;
> +	unsigned int scp_sdca_stat1, scp_sdca_stat2 = 0;
> +
> +	if (!sn624x || !sn624x->slave)
> +		return 0;
> +
> +	ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1);
> +	if (ret < 0)
> +		return ret;
> +	sn624x->scp_sdca_stat1 = ret;
> +
> +	ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2);
> +	if (ret < 0)
> +		return ret;
> +	sn624x->scp_sdca_stat2 = ret;
> +
> +	do {
> +		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1);
> +		if (ret < 0)
> +			return ret;
> +		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_0) {
> +			ret = sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1,
> +					      SDW_SCP_SDCA_INTMASK_SDCA_0);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2);
> +		if (ret < 0)
> +			return ret;
> +		if (ret & SDW_SCP_SDCA_INTMASK_SDCA_8) {
> +			ret = sdw_write_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2,
> +					      SDW_SCP_SDCA_INTMASK_SDCA_8);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT1);
> +		if (ret < 0)
> +			return ret;
> +		scp_sdca_stat1 = ret & SDW_SCP_SDCA_INTMASK_SDCA_0;
> +
> +		ret = sdw_read_no_pm(sn624x->slave, SDW_SCP_SDCA_INT2);
> +		if (ret < 0)
> +			return ret;
> +		scp_sdca_stat2 = ret & SDW_SCP_SDCA_INTMASK_SDCA_8;
> +
> +		stat = scp_sdca_stat1 || scp_sdca_stat2;
> +		count++;
> +	} while (stat != 0 && count < retry);
> +
> +	if (stat && dev)
> +		dev_warn(dev,
> +			 "sn624x: SDCA IRQ flush incomplete (stat=%u)\n", stat);
> +
> +	return stat ? -EBUSY : 0;
> +}

one day we'll need to refactor all this, all drivers use the same code
to deal with interrupts...


> +static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config;
> +	struct sdw_port_config port_config;
> +	enum sdw_data_direction direction;
> +	struct sdw_stream_runtime *sdw_stream;
> +	unsigned int ch = params_channels(params);
> +	int port;
> +	int ret;
> +	bool got_pm = false;
> +
> +	dev_dbg(dai->dev,
> +		 "sn624x: hw_params: entered dai=%s id=%d stream=%s\n",
> +		 dai->name, dai->id, snd_pcm_stream_str(substream));
> +
> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +	if (!sdw_stream) {
> +		dev_warn(dai->dev,
> +			 "sn624x: hw_params: no SDW stream (set_stream not run yet?)\n");
> +		return -EINVAL;
> +	}
> +	if (!sn624x->slave) {
> +		dev_warn(dai->dev, "sn624x: hw_params: slave NULL\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Resume before diag/stream: runtime suspend leaves regcache_cache_only(true);
> +	 * bypassed reads still behave better with an active runtime count.

erm, what are you trying to say?

> +	 */
> +	ret = pm_runtime_resume_and_get(component->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_err(dai->dev,
> +			"sn624x: hw_params: pm_runtime_resume_and_get failed (%d)\n",
> +			ret);
> +		return ret;
> +	}
> +	if (ret == 0)
> +		got_pm = true;

I believe got_pm is always true then, do you need this variable at all?

> +
> +	if (sn624x->hw_init)
> +		sn624x_log_power_mode_once(dai->dev, sn624x);
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		direction = SDW_DATA_DIR_RX;
> +		if (dai->id == SN624X_DAI_JACK) {
> +			sn624x_hw_params_jack_playback(dai, substream, sn624x);
> +			port = SN624X_PORT_JACK_PLAYBACK;
> +		} else if (dai->id == SN624X_DAI_SPEAKER) {
> +			sn624x_hw_params_speaker_playback(dai, substream, sn624x);
> +			port = SN624X_PORT_SPEAKER_PLAYBACK;
> +		}
> +
> +		else {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +	} else {
> +		direction = SDW_DATA_DIR_TX;
> +		if (dai->id == SN624X_DAI_JACK) {
> +			port = SN624X_PORT_JACK_CAPTURE;
> +			sn624x_hw_params_jack_capture(dai, substream, sn624x);
> +		} else if (dai->id == SN624X_DAI_DMIC) {
> +			port = SN624X_PORT_DMIC_CAPTURE;
> +			sn624x_hw_params_dmic_capture(dai, substream, sn624x);
> +		} else {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +	}
> +	stream_config.frame_rate = params_rate(params);
> +	stream_config.ch_count = ch;
> +	stream_config.bps = snd_pcm_format_width(params_format(params));
> +	stream_config.direction = direction;
> +	port_config.ch_mask = GENMASK(ch - 1, 0);
> +	port_config.num = port;
> +
> +	ret = sdw_stream_add_slave(sn624x->slave, &stream_config,
> +				   &port_config, 1, sdw_stream);
> +
> +	if (ret) {
> +		dev_err(dai->dev, "%s: sdw_stream_add_slave port %d failed: %d\n",
> +			__func__, port, ret);
> +		goto out;
> +	}
> +out:
> +	if (got_pm) {
> +		pm_runtime_mark_last_busy(component->dev);
> +		pm_runtime_put_autosuspend(component->dev);
> +	}

can't you just deal with pm_runtime unconditionally?

> +	return ret;
> +}
> +
> +static int sn624x_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
> +				   struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct sn624x_sdca_priv *sn624x = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_runtime *sdw_stream =
> +		snd_soc_dai_get_dma_data(dai, substream);
> +	int port;
> +	bool got_pm = false;
> +	int ret;
> +
> +	if (!sn624x->slave)
> +		return -EINVAL;
> +
> +	port = sn624x_hw_params_port(dai, substream);
> +	if (port < 0)
> +		return port;
> +
> +	ret = pm_runtime_resume_and_get(component->dev);
> +	if (ret < 0 && ret != -EACCES)
> +		return ret;
> +	if (ret == 0)
> +		got_pm = true;

same here, doesn't seem useful.
> +
> +	cancel_delayed_work_sync(&sn624x->jack_detect_work);
> +	sdw_stream_remove_slave(sn624x->slave, sdw_stream);
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		if (dai->id == SN624X_DAI_JACK)
> +			sn624x->playback_active &= ~SN624X_PB_ACTIVE_JACK;
> +		else if (dai->id == SN624X_DAI_SPEAKER)
> +			sn624x->playback_active &= ~SN624X_PB_ACTIVE_SPK;
> +	}
> +
> +	sn624x_port_teardown_d3_mute(dai->dev, sn624x, port, false);
> +
> +	sn624x_jack_schedule_poll(sn624x);

so just above you cancelled the jack_detect_work but here you schedule
the poll? Confusing?

Also these hw_params aren't jack-specific, not sure why a hw_free on
speakers should do for the jack.

> +
> +	if (got_pm) {
> +		pm_runtime_mark_last_busy(component->dev);
> +		pm_runtime_put_autosuspend(component->dev);
> +	}
> +	return 0;
> +}

> +static int sn624x_sdca_dev_suspend(struct device *dev)
> +{
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +
> +	if (!sn624x->first_hw_init)
> +		return 0;
> +
> +	/*
> +	 * Keep jack_detect_work scheduled across runtime suspend (org PoC
> +	 * behavior). With mask_sdca_irqs=true the 1s poll is the only jack
> +	 * path; cancelling it here leaves the UI without plug/unplug events.
> +	 * The work itself pm_runtime_resume_and_get() before GE35 access.
> +	 */
> +	SN624X_DBG(dev, "runtime suspend (jack poll kept scheduled)\n");

how on earth can you do a poll on a device by reading from cache?

also what is the deal with the sn624x->disable_irq done below in [1]?

> +	regcache_cache_only(sn624x->regmap, true);
> +
> +	return 0;
> +}
> +
> +static int sn624x_sdca_dev_system_suspend(struct device *dev)
> +{
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +
> +	if (!sn624x->first_hw_init)
> +		return 0;
> +
> +	SN624X_DBG(dev, "system suspend: mask jack IRQs\n");
> +	mutex_lock(&sn624x->disable_irq_lock);
> +	sn624x->disable_irq = true;
> +	sn624x_sdca_jack_irq_mask(sn624x);
> +	mutex_unlock(&sn624x->disable_irq_lock);
> +
> +	return sn624x_sdca_dev_suspend(dev);
> +}
> +
> +static int sn624x_sdca_dev_resume(struct device *dev)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(dev);
> +	unsigned long time;
> +
> +	if (!sn624x->first_hw_init)
> +		return 0;
> +
> +	SN624X_DBG(dev, "resume: unattach_request=%u\n", slave->unattach_request);
> +	if (!slave->unattach_request) {
> +		mutex_lock(&sn624x->disable_irq_lock);
> +		if (sn624x->disable_irq) {
> +			sn624x_sdca_jack_irq_unmask(sn624x);
> +			sn624x->disable_irq = false;
> +		}
> +		mutex_unlock(&sn624x->disable_irq_lock);
> +		goto regmap_sync;
> +	}
> +
> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(SN624X_PROBE_TIMEOUT_MS));
> +	if (!time) {
> +		dev_err(dev, "%s: initialization timed out\n", __func__);
> +		sdw_show_ping_status(slave->bus, true);
> +		return -ETIMEDOUT;
> +	}
> +
> +regmap_sync:
> +	slave->unattach_request = 0;
> +	regcache_cache_only(sn624x->regmap, false);
> +	regcache_sync(sn624x->regmap);
> +
> +	if (sn624x->hs_jack && !sn624x->disable_irq)
> +		sn624x_jack_schedule_poll(sn624x);

[1] this isn't symmetrical with the suspend part.
> +
> +	return 0;
> +}

> +struct sn624x_sdca_priv {
> +	struct regmap *regmap;
> +	struct snd_soc_component *component;
> +	struct sdw_slave *slave;
> +	bool hw_init;
> +	bool first_hw_init;
> +	struct snd_soc_jack *hs_jack;
> +	struct delayed_work jack_detect_work;
> +	struct mutex disable_irq_lock;
> +	bool disable_irq;
> +	int jack_type;
> +	int jack_type_last;
> +	unsigned int playback_active;	/* SN624X_PB_ACTIVE_* while PCM open */

why do you need this plackback_active ?

> +	unsigned int scp_sdca_stat1;
> +	unsigned int scp_sdca_stat2;
> +};

> +#endif /* __SN624X_H__ */
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index cddbd2aa424e..2f2692cd8135 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -519,6 +519,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
>  	select SND_SOC_RT715_SDCA_SDW
>  	select SND_SOC_RT721_SDCA_SDW
>  	select SND_SOC_RT722_SDCA_SDW
> +	select SND_SOC_SN624X_SDCA_SDW

please don't insert your driver in the middle of Realtek things...

>  	select SND_SOC_RT1308_SDW
>  	select SND_SOC_RT1308
>  	select SND_SOC_RT1316_SDW

