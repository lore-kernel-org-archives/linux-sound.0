Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789784;
	b=16d2GJp/YMu/sqvsivtW1jMyPc9Zkt40beDYx85K8JMnocGTgsHWNiSFaCgImWw4GkAk
	 ZDutj4A4GNIgzVwlEnDbyl0UGQrmq94yWerKBxJ0mB2ns8YBwP3PXHBl4aSK+E7HRQC90
	 HHzNpI4K8uaqdg/uGmT4CCoDWSAKJye0TLQua+J4PYBy/Xl2bZy17K9B39TS6WTHG1A8Z
	 BqKLyxG2AnIWFhTfPX85M0v0yAv/l0Kvj/Sy/XJ+5X+u7fwdbw7y2yK947Jlv8ze3DzVN
	 2nmy4F/LnmwdnLtC+gn5xiEo/wqA4L1iEtikVZK1TZPLD23fzBrbZQgGXVD7EV4P3Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789784;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s/1hPBZu01s2ZNz7d0TvetILBoh7XJdnITj5CEg3tqo=;
	b=PzvpK0R5dZcWUsiv2ljdYpHWQajAQcTSmltS2UQf7RxmlFy/1hwXWFWBGfrOBKJzYNim
	 rW6DEFdTbLvXUXDoL3mV9Dw/dDvKm+1ThQIcf0SZjARHjiMXGDLlMC8Qq8HjhBM1dsP7A
	 Tm8biILg/bfIfjMiJiuBVvw3z8n34w90qiMtEoIbYJ/mBjrvLtHQxGyM4cnX3OFcocqq+
	 OO5ak6hSLb0n9EpZw2aSR4dNnB3hlbqwWH5cc8+HFcXO6Rq4KF3TBZxlePyAObdeEJINZ
	 Rx6019GsWvGD/RK/TlQZBKUVDssu6w1o0RBgj8iN47rNkXr6SBukYw4+1rpZbk8pg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS6SdwJc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A119606C724;
	Fri, 27 Nov 2026 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZS6SdwJc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F03F1F00897;
	Fri, 27 Nov 2026 14:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789783;
	bh=s/1hPBZu01s2ZNz7d0TvetILBoh7XJdnITj5CEg3tqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZS6SdwJcLANXBaMTALnNkAXcFFTFJUXmvv30IyHbW0arApDgfjMFkKOtdXBdcKNJC
	 GwpLbLKA+KGRUY3MlwkgTGHIiVbZm7MJ1wXAHeUL9ijqx9K0LXjKsUmH8LTbOHlUH+
	 1IZYENOZSXUb9ONzfiPkxbD4xVgDrSOspJc7X6G12uaWiv+6KcGrcrvPTMlRCibAwm
	 l+ZVCrQv/ZZ9kcN8dR2rxZYrf3LbQz+sXaJbPvny0lYO9/i4+iNqk6eb6GDHT+hX1K
	 GGySzxZrkC3tVQN3gRiqzHim5h7KwzhlS9SZZhwdg5+U81pgAv7pg6b0MqONZP1l7D
	 n6r9/Ws4LPj9g==
Message-ID: <sashiko-outbox-237561@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: codecs: wcd9378: add non-SDCA (mobile)
 mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ravi Hothi" <ravi.hothi@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-b4-wcd9378-v3-v3-2-397e5ba2da55@oss.qualcomm.com>
References: <20261127-b4-wcd9378-v3-v3-0-397e5ba2da55@oss.qualcomm.com>
 <20261127-b4-wcd9378-v3-v3-2-397e5ba2da55@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 14:29:42 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential
issues to consider:
- [High] ASoC: wcd9378: NULL slave_irq or regmap deref in
  wcd9378_interrupt_callback()
- [Medium] ASoC: wcd9378: broken rx_clk_cnt refcounting in
  wcd9378_rx_clk_enable()
- [Medium] ASoC: wcd9378: IRQ domain leak and devm mismatch in
  wcd9378_irq_init()
- [Medium] ASoC: wcd9378: per-port switch tracking in
  wcd9378_get/set_swr_port()
- [Medium] ASoC: wcd9378: unchecked txdev runtime PM resume in HPH DAPM
  events
- [Medium] ASoC: wcd9378: unhandled wcd9378_sys_usage_update() errors in
  DAPM
- [Medium] ASoC: wcd9378: stale MB_PULLUP_EN bit in
  wcd9378_micbias_control()
- [Medium] ASoC: wcd9378: codec probe runs in cache-only mode during
  synchronous bind
- [Medium] ASoC: wcd9378: stale Class-AB and compander bits on HPH mode
  switch
- [Low] ASoC: wcd9378: commit message claims unimplemented DMIC0-5
  capture support
- [Low] ASoC: wcd9378: unchecked regcache_sync() return in
  wcd9378_runtime_resume()
- [Low] ASoC: wcd9378: unsorted reg_defaults in wcd9378_defaults[]
  triggers warning
- [Low] ASoC: wcd9378: missing enum bounds check in
  wcd9378_rx_hph_mode_put()
--

commit 3efff0a28bcb4ca9fa2daba4e11c040c70206084
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

ASoC: codecs: wcd9378: add non-SDCA (mobile) mode support

This commit adds ASoC codec support for the non-SDCA (mobile) fusing of
the Qualcomm WCD9378 SoundWire audio codec, dispatching between SDCA and
non-SDCA modes in the shared SoundWire slave driver.

> Capture covers ADC1-3 fed from AMIC1-4 plus DMIC0-5, with mic bias 1-3.

[Severity: Low]
This isn't a runtime bug, but the commit message claims capture covers
DMIC0-5, whereas wcd9378.c only implements controls, DAPM widgets, and
routes for ADC1-3 and AMIC1-4.

> diff --git a/sound/soc/codecs/wcd9378-sdw.c b/sound/soc/codecs/wcd9378-sd=
w.c
> index 52295e7646cf0..cb9a9fc15272c 100644
> --- a/sound/soc/codecs/wcd9378-sdw.c
> +++ b/sound/soc/codecs/wcd9378-sdw.c
[ ... ]
> +/*
> + * Handle a SoundWire out-of-band interrupt event by triggering the
> + * first irq of the slave_irq domain, which is then handled by the
> + * regmap_irq threaded irq.
> + */
> +static int wcd9378_interrupt_callback(struct sdw_slave *slave,
> +				      struct sdw_slave_intr_status *status)
> +{
> +	struct wcd9378_sdw_priv *wcd;
> +
> +	if (wcd9378_is_sdca(&slave->dev))
> +		return 0;
> +
> +	wcd =3D dev_get_drvdata(&slave->dev);
> +
> +	return wcd_interrupt_callback(slave, wcd->slave_irq,
> +				      WCD9378_SWRS_SCP_SDCA_INTSTAT_1,
> +				      WCD9378_SWRS_SCP_SDCA_INTSTAT_2,
> +				      WCD9378_SWRS_SCP_SDCA_INTSTAT_3);
> +}

[Severity: High]
Can wcd9378_interrupt_callback() dereference a NULL regmap or a NULL
wcd->slave_irq inside wcd_interrupt_callback()?

Both the TX and RX slaves unmask SDW_SCP_INT1_IMPL_DEF in
wcd9378_sdw_probe(), and wcd9378_soc_codec_probe() sets slave_irq on
both slaves.  However, only the TX slave initializes a regmap, so an
alert on the RX slave causes wcd_interrupt_callback() to pass a NULL
regmap from dev_get_regmap() to regmap_read().

In addition, wcd->slave_irq is not populated until the end of
wcd9378_soc_codec_probe() (and is not cleared in
wcd9378_soc_codec_remove()), while sdw_initialize_slave() unmasks
SDW_SCP_INT1_IMPL_DEF as soon as the slave attaches after
wcd9378_reset().  An alert arriving before wcd9378_soc_codec_probe()
sets wcd->slave_irq passes NULL to irq_find_mapping(slave_irq, 0) and
calls handle_nested_irq(0).

[ ... ]

> +static const struct reg_default wcd9378_defaults[] =3D {
> +	{ WCD9378_ANA_BIAS,			0x00 },
[ ... ]
> +	{ WCD9378_SMP_MIC_PDE11_REQ_PS(2),	0x03 },
> +	{ WCD9378_SMP_MIC_FUNC_ACT(2),		0x00 },
> +	/* All SDCA interrupts are disabled out of reset; regmap-irq owns these=
 */
> +	{ WCD9378_SWRS_SCP_SDCA_INTMASK_1,	0x00 },
> +	{ WCD9378_SWRS_SCP_SDCA_INTMASK_2,	0x00 },
> +	{ WCD9378_SWRS_SCP_SDCA_INTMASK_3,	0x00 },
> +	{ WCD9378_SWRS_SCP_SDCA_INTRTYPE_1,	0x00 },
> +	{ WCD9378_SWRS_SCP_SDCA_INTRTYPE_2,	0x00 },
> +	{ WCD9378_SWRS_SCP_SDCA_INTRTYPE_3,	0x00 },
> +};

[Severity: Low]
Does placing the 0x5c..0xfc SCP registers at the end of
wcd9378_defaults[] after 0x41880008 trigger the "Unsorted reg_defaults"
warning in regcache_init() on every TX slave probe?

[ ... ]

> +static int wcd9378_runtime_resume(struct device *dev)
> +{
> +	struct wcd9378_sdw_priv *wcd;
> +
> +	if (wcd9378_is_sdca(dev))
> +		return wcd9378_sdca_runtime_resume(dev);
> +
> +	wcd =3D dev_get_drvdata(dev);
> +
> +	if (wcd->regmap) {
> +		regcache_cache_only(wcd->regmap, false);
> +		regcache_sync(wcd->regmap);
> +	}
> +
> +	return 0;
> +}

[Severity: Low]
Should wcd9378_runtime_resume() check the return value of
regcache_sync() and restore cache-only/dirty state on error, or at least
propagate the error instead of leaving the device runtime-active with an
unsynchronized register cache?

> diff --git a/sound/soc/codecs/wcd9378.c b/sound/soc/codecs/wcd9378.c
> new file mode 100644
> index 0000000000000..8a771a027127c
> --- /dev/null
> +++ b/sound/soc/codecs/wcd9378.c
[ ... ]
> +static int wcd9378_tx_sequencer_enable(struct snd_soc_dapm_widget *w,
> +				       struct snd_kcontrol *kcontrol,
> +				       int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +	const struct wcd9378_smp_fn *fn;
> +	int adc =3D w->shift;
> +	bool is_jack =3D false;
> +	int sys_bit, retries;
> +	u32 val;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		sys_bit =3D wcd9378_sys_usage_bit_get(component, adc, &is_jack);
> +		if (sys_bit < 0)
> +			return sys_bit;
> +
> +		/*
> +		 * Latch the profile bit and the target function: the input
> +		 * mux can be rewritten while the path is powered, and
> +		 * power-down must tear down what was actually powered up.
> +		 */
> +		wcd9378->tx_sys_bit[adc] =3D sys_bit;
> +		wcd9378->tx_is_jack[adc] =3D is_jack;
> +		if (is_jack)
> +			fn =3D &wcd9378_smp_jack_adc2;
> +		else
> +			fn =3D &wcd9378_smp_mic[adc];
> +
> +		if (wcd9378_sys_usage_update(component, sys_bit, true))
> +			return -EINVAL;

[Severity: Medium]
If wcd9378_sys_usage_update() fails here, does latching
wcd9378->tx_sys_bit[adc] beforehand cause SND_SOC_DAPM_POST_PMD to tear
down hardware registers and clear sys_bit in wcd9378->sys_usage_mask for
a sequencer that never powered up?

In wcd9378_hph_sequencer_enable() below, the return value of
wcd9378_sys_usage_update(component, WCD9378_SYS_USAGE_RX0_RX1_HPH, true)
is also ignored, so an incompatible profile combination continues
programming PDE47 and waits 40 ms in wcd9378_pde_act_ps_check() before
timing out.

[ ... ]

> +static int wcd9378_rx_clk_enable(struct snd_soc_component *component)
> +{
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +
> +	if (atomic_read(&wcd9378->rx_clk_cnt))
> +		return 0;
> +
> +	snd_soc_component_update_bits(component,
> +				      WCD9378_ANA_RX_SUPPLIES, BIT(0), BIT(0));
> +	atomic_inc(&wcd9378->rx_clk_cnt);
> +
> +	return 0;
> +}
> +
> +static int wcd9378_rx_clk_disable(struct snd_soc_component *component)
> +{
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +
> +	if (!atomic_read(&wcd9378->rx_clk_cnt)) {
> +		dev_err(component->dev, "clk already disabled\n");
> +		return 0;
> +	}
> +
> +	atomic_dec(&wcd9378->rx_clk_cnt);
> +	snd_soc_component_update_bits(component,
> +				      WCD9378_ANA_RX_SUPPLIES, BIT(0), 0x00);
> +
> +	return 0;
> +}

[Severity: Medium]
Does returning early in wcd9378_rx_clk_enable() when rx_clk_cnt is
non-zero keep rx_clk_cnt from ever exceeding 1?

When stereo playback powers up both RDAC1 and RDAC2, rx_clk_cnt stays at
1, and wcd9378_rx_clk_disable() unconditionally clears BIT(0) of
WCD9378_ANA_RX_SUPPLIES on the first disable call and logs "clk already
disabled" on the second.  Note also that wcd9378_rx_clk_enable() is
called from RDAC1 and RDAC2 (downstream of HPH SEQUENCER), while
wcd9378_rx_clk_disable() is called from RX1 and RX2 (upstream of HPH
SEQUENCER), so powering even a single RDAC powers both RX1 and RX2 and
calls wcd9378_rx_clk_disable() twice on teardown.

[ ... ]

> +static int wcd9378_hph_sequencer_enable(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +	int hph_mode =3D wcd9378->hph_mode;
> +	int ret =3D 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
[ ... ]
> +		if (!wcd9378->comp1_enable || !wcd9378->comp2_enable) {
> +			snd_soc_component_update_bits(component, WCD9378_HPH_UP_T7, 0x07, 0x0=
7);
> +			snd_soc_component_update_bits(component, WCD9378_HPH_DN_T1, 0x07, 0x0=
7);
> +		}
> +
> +		if (hph_mode =3D=3D CLS_AB || hph_mode =3D=3D CLS_AB_HIFI ||
> +		    hph_mode =3D=3D CLS_AB_LP || hph_mode =3D=3D CLS_AB_LOHIFI)
> +			snd_soc_component_update_bits(component, WCD9378_CP_CP_DTOP_CTRL_14,
> +						      BIT(7), BIT(7));

[Severity: Medium]
Are WCD9378_CP_CP_DTOP_CTRL_14 BIT(7), WCD9378_ANA_RX_SUPPLIES BIT(1)
(set in wcd9378_codec_enable_hphl_pa() and
wcd9378_codec_enable_hphr_pa()), and WCD9378_HPH_UP_T7 /
WCD9378_HPH_DN_T1 ever cleared when switching away from Class-AB or
enabling both companders?

Once playback runs in a Class-AB mode or with a compander disabled,
those bits stay set in hardware and the register cache on subsequent
Class-H or compander-enabled streams.

[ ... ]

> +static int wcd9378_codec_hphl_dac_event(struct snd_soc_dapm_widget *w,
> +					struct snd_kcontrol *kcontrol,
> +					int event)
> +{
> +	struct snd_soc_component *component =3D snd_soc_dapm_to_component(w->da=
pm);
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +	int hph_mode =3D wcd9378->hph_mode;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		if (wcd9378->txdev)
> +			pm_runtime_resume_and_get(wcd9378->txdev);
[ ... ]
> +	case SND_SOC_DAPM_POST_PMD:
> +		snd_soc_component_update_bits(component,
> +					      WCD9378_HPH_RDAC_HD2_CTL_L,
> +					      0x0f, BIT(0));
> +		snd_soc_component_update_bits(component,
> +					      WCD9378_CDC_HPH_GAIN_CTL,
> +					      WCD9378_CDC_HPH_GAIN_CTL_HPHL_RX_EN, 0);
> +		if (wcd9378->txdev)
> +			pm_runtime_put_autosuspend(wcd9378->txdev);
> +		break;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
If pm_runtime_resume_and_get(wcd9378->txdev) fails in
SND_SOC_DAPM_PRE_PMU, does the unconditional pm_runtime_put_autosuspend()
in SND_SOC_DAPM_POST_PMD drop the runtime PM reference held by
wcd9378_bind()?

wcd9378_codec_enable_hphl_pa() and wcd9378_codec_enable_hphr_pa() also
call pm_runtime_get_sync(wcd9378->txdev) without checking for failure
before writing registers.

[ ... ]

> +static int wcd9378_micbias_control(struct snd_soc_component *component,
> +				   int micb_num, int req)
> +{
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +	int mb_index =3D micb_num - 1;
> +	u32 usage_reg;
> +	u8 usage_val;
> +	u8 pullup_bit;
> +
> +	if (micb_num < MIC_BIAS_1 || micb_num > MIC_BIAS_3)
> +		return -EINVAL;
> +
> +	usage_reg =3D wcd9378_smp_mic[mb_index].micb_reg;
> +	usage_val =3D wcd9378->micb_usage_val[mb_index];
> +	pullup_bit =3D BIT(mb_index);
> +
> +	mutex_lock(&wcd9378->micb_lock);
> +
> +	switch (req) {
> +	case MICB_ENABLE:
> +		wcd9378->micb_ref[mb_index]++;
> +		if (wcd9378->micb_ref[mb_index] =3D=3D 1) {
> +			if (micb_num =3D=3D MIC_BIAS_2) {
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_ANA_MICB2_RAMP,
> +							      WCD9378_ANA_MICB2_RAMP_SHIFT_CTL_MASK,
> +							      0x0c);
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_ANA_MICB2_RAMP,
> +							      WCD9378_ANA_MICB2_RAMP_EN, 0x00);
> +			}
> +			snd_soc_component_update_bits(component, usage_reg,
> +						      0xff, usage_val);
> +			if (micb_num =3D=3D MIC_BIAS_2)
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_SMP_JACK_IT31_MICB,
> +							      0xff, usage_val);
> +		}
> +		break;
> +	case MICB_DISABLE:
> +		if (wcd9378->micb_ref[mb_index] > 0)
> +			wcd9378->micb_ref[mb_index]--;
> +		if (wcd9378->micb_ref[mb_index] =3D=3D 0 &&
> +		    wcd9378->pullup_ref[mb_index] > 0) {
> +			snd_soc_component_update_bits(component,
> +						      WCD9378_MB_PULLUP_EN,
> +						      pullup_bit, pullup_bit);
> +			snd_soc_component_update_bits(component, usage_reg, 0xff,
> +						      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
> +			if (micb_num =3D=3D MIC_BIAS_2)
> +				snd_soc_component_update_bits(component,
> +							      WCD9378_SMP_JACK_IT31_MICB, 0xff,
> +							      WCD9378_MICB_USAGE_1P8V_OR_PULLUP);
> +		} else if (wcd9378->micb_ref[mb_index] =3D=3D 0) {
> +			snd_soc_component_update_bits(component, usage_reg,
> +						      0xff, WCD9378_MICB_USAGE_OFF);

[Severity: Medium]
Does wcd9378_micbias_control() leave pullup_bit set in
WCD9378_MB_PULLUP_EN when MICB_ENABLE is requested while pull-up is
active, or when MICB_PULLUP_DISABLE runs while micb_ref > 0 and
MICB_DISABLE runs later?

MICB_ENABLE never clears pullup_bit in WCD9378_MB_PULLUP_EN (even though
MICB_DISABLE re-sets it when pullup_ref > 0), and the
`else if (wcd9378->micb_ref[mb_index] =3D=3D 0)` branch in MICB_DISABLE
never clears pullup_bit if pullup_ref dropped to 0 while micb_ref was
still non-zero.

[ ... ]

> +static int wcd9378_get_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer =3D (struct soc_mixer_control *)kcontro=
l->private_value;
> +	struct snd_soc_component *comp =3D snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(comp->dev);
> +	struct wcd9378_sdw_priv *wcd;
> +	int dai_id =3D mixer->shift;
> +	int ch_idx =3D mixer->reg;
> +	int portidx;
> +
> +	wcd =3D wcd9378->sdw_priv[dai_id];
> +	portidx =3D wcd->ch_info[ch_idx].port_num;
> +
> +	ucontrol->value.integer.value[0] =3D wcd->port_enable[portidx];
> +
> +	return 0;
> +}
> +
> +static int wcd9378_set_swr_port(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct soc_mixer_control *mixer =3D (struct soc_mixer_control *)kcontro=
l->private_value;
> +	struct snd_soc_component *comp =3D snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(comp->dev);
> +	struct wcd9378_sdw_priv *wcd;
> +	int dai_id =3D mixer->shift;
> +	int ch_idx =3D mixer->reg;
> +	int portidx;
> +	bool enable;
> +
> +	wcd =3D wcd9378->sdw_priv[dai_id];
> +	portidx =3D wcd->ch_info[ch_idx].port_num;
> +
> +	enable =3D ucontrol->value.integer.value[0];
> +
> +	if (enable =3D=3D wcd->port_enable[portidx]) {
> +		wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +		return 0;
> +	}
> +
> +	wcd->port_enable[portidx] =3D enable;
> +	wcd9378_connect_port(wcd, portidx, ch_idx, enable);
> +
> +	return 1;
> +}

[Severity: Medium]
Does indexing wcd->port_enable[] by portidx instead of ch_idx cause
"HPHL Switch" and "HPHR Switch" to overwrite each other's state?

WCD9378_HPH_L and WCD9378_HPH_R both use WCD9378_HPH_PORT (port 1).
Enabling "HPHL Switch" sets wcd->port_enable[1] =3D true, so reading "HPHR
Switch" returns 1 even though BIT(1) is not set in port_config[0].ch_mask
(causing userspace tools that read before writing to skip enabling the
right channel), and disabling either switch causes the other to read back
as 0.  See commit e7860dc5d8d4 ("ASoC: codecs: wcd939x: Fix logic of get
and set swr port").

[ ... ]

> +static int wcd9378_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +	u32 mode_val =3D ucontrol->value.enumerated.item[0];
> +
> +	if (mode_val =3D=3D wcd9378->hph_mode)
> +		return 0;
> +
> +	wcd9378->hph_mode =3D mode_val;
> +
> +	return 1;
> +}

[Severity: Low]
Should wcd9378_rx_hph_mode_put() reject `mode_val >=3D e->items` with
-EINVAL, matching wcd9378_tx_mode_put() right above it?

[ ... ]

> +static int wcd9378_irq_init(struct wcd9378_priv *wcd9378, struct device =
*dev)
> +{
> +	struct regmap_irq_chip *chip_desc;
> +
> +	wcd9378->virq =3D irq_domain_create_linear(NULL, 1, &wcd9378_domain_ops=
, NULL);
> +	if (!wcd9378->virq) {
> +		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * regmap-irq keeps the descriptor by reference and passes
> +	 * irq_drv_data to handle_post_irq(), so take a per-instance
> +	 * copy and point it at this codec.
> +	 */
> +	chip_desc =3D devm_kmemdup(dev, &wcd9378_regmap_irq_chip,
> +				 sizeof(wcd9378_regmap_irq_chip), GFP_KERNEL);
> +	if (!chip_desc)
> +		return -ENOMEM;
> +
> +	chip_desc->irq_drv_data =3D wcd9378;
> +	wcd9378->chip_desc =3D chip_desc;
> +
> +	return devm_regmap_add_irq_chip(dev, wcd9378->regmap,
> +					irq_create_mapping(wcd9378->virq, 0),
> +					IRQF_ONESHOT, 0,
> +					wcd9378->chip_desc,
> +					&wcd9378->irq_chip);
> +}
[ ... ]
> +static int wcd9378_soc_codec_probe(struct snd_soc_component *component)
> +{
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +	struct device *dev =3D component->dev;
> +	unsigned int part0 =3D 0, part1 =3D 0;
> +	int ret;
> +
> +	/*
> +	 * Flow up to this point: the TX probe reset the codec and added the
> +	 * component master, the RX probe registered its component, and the
> +	 * master's bind then registered this snd_soc component. io_init()
> +	 * below programs the analog core and must hit an enumerated codec
> +	 * with the bus clock indicated, so first wait out both slaves'
> +	 * post-reset (re-)enumeration; this codec probe is the earliest
> +	 * point where all of that holds.
> +	 */
> +	ret =3D sdw_slave_wait_for_init(wcd9378->tx_sdw_dev, 5000);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sdw_slave_wait_for_init(dev_to_sdw_dev(wcd9378->rxdev), 5000);
> +	if (ret)
> +		return ret;
> +
> +	snd_soc_component_init_regmap(component, wcd9378->regmap);
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;

[Severity: Medium]
Can wcd9378_soc_codec_probe() run while wcd9378->regmap is still in
cache-only mode?

If the RX slave has already probed and the sound card is waiting to
bind, component_master_add_with_match() in wcd9378_tx_master_probe()
synchronously calls wcd9378_bind() -> snd_soc_register_component() ->
wcd9378_soc_codec_probe() before wcd9378_sdw_probe() returns to
sdw_bus_probe(), where slave->probed is set to true.  While
wcd9378_soc_codec_probe() waits in sdw_slave_wait_for_init(),
sdw_handle_slave_status() skips wcd9378_update_status() because
slave->probed is still false, and then completes
slave->initialization_complete.  Because wcd9378_tx_master_probe()
already marked dev RPM_ACTIVE via devm_pm_runtime_set_active_enabled(),
pm_runtime_resume_and_get(dev) is a no-op and never invokes
wcd9378_runtime_resume(), leaving wcd9378->regmap cache-only during
wcd9378_io_init() and wcd9378_class_load().

> +
> +	regmap_read(wcd9378->regmap, WCD9378_DEV_PART_ID_0, &part0);
[ ... ]
> +	ret =3D wcd9378_irq_init(wcd9378, dev);
> +	if (ret) {
> +		dev_err(dev, "IRQ init failed: %d\n", ret);
> +		goto err_pm_put;
> +	}
[ ... ]
> +static void wcd9378_soc_codec_remove(struct snd_soc_component *component)
> +{
> +	struct wcd9378_priv *wcd9378 =3D wcd9378_dev_priv(component->dev);
> +
> +	free_irq(wcd9378->hphl_pdm_wd_int, wcd9378);
> +	free_irq(wcd9378->hphr_pdm_wd_int, wcd9378);
> +}

[Severity: Medium]
Does calling wcd9378_irq_init() from the ASoC component probe callback
leak wcd9378->virq and duplicate the devm_regmap_add_irq_chip()
registration across sound card probe deferral or card unbind/rebind?

wcd9378->virq is allocated with irq_domain_create_linear() and never
disposed or removed in wcd9378_soc_codec_remove() or on driver removal,
and devm_regmap_add_irq_chip() is tied to the TX slave device rather
than the ASoC component lifecycle.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-b4-wcd9378=
-v3-v3-0-397e5ba2da55@oss.qualcomm.com?part=3D2
