Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694539;
	b=DrJ5sHEaW0NBj0PCI1Pdt3LkzXP6Xfh5/+u9xKJIB/Q6rKejf9R583eRdkibhjBKoTQk
	 PDMCIBibddyfGJYhSeHg5UxDvhrbsXN6wnvQdvpaZhwzvykZiyYaxjUMRS6C3P4hc4LIN
	 kPan82S9K7/+CxdIlutvOp4RqGLPf9XRw3dn7GQyFj9voAbduw9t0pJ1P67jq7O3ylQ1k
	 U10AOQay4A7KESg4BexbIPot8C9qsjeh3/KORUgJNOhFmdVcfHWmQX6FFyzclrFepEFw5
	 A17I5fKBRm4Nf41TbgaYkd/SwdsNULmumXmHccSi+Eg8l/3Ah7tK32x49wqGIL74mqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694539;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IftVdBI69CsESGRe4PbJdIBmB9aVffPvuk46QbCRY40=;
	b=tAYCV1iL8SGABmnHe0RNBpzZfKBaXDYluZO1ASabch6gTCGphVmECiarYC7XYfM5+MFy
	 gg9MIvN4c+DvscFAJshXOHqXlxU0XlTegDnAs2zdzeLrRBKD3jt38SoRn1SgelidgaPvY
	 oRFAwEYCr8LZt2cd4s/t5U91xi7kPCwCI6k1Dahnllc2/u5o5nrcq09NJgzZtOtxj1InV
	 qTrugDSXoLmn4h4dMm54G27yfgAQl/iOT+ejbgwHSy+YDuir1ouONS7LyXty5gbt0O6Ut
	 P+1O9bZIGv00jzb3hY9Hyu1aiTuNls/l+lr2d11+20tIix27+Hh5Oho6RedLKtaoDtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NI/H5kHd";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0725606A329;
	Tue,  3 Nov 2026 08:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NI/H5kHd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5021F000C1;
	Tue,  3 Nov 2026 08:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793694538;
	bh=IftVdBI69CsESGRe4PbJdIBmB9aVffPvuk46QbCRY40=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NI/H5kHdzBQLElenC5k+nV0X1ikVI9TtSxxW9wTHmDxoxIGDW1lYFsoWT43rPlb+/
	 6MTY6KZOLm2A4LsNFhfUPbSlWlZFSG5fEylCvHpsyaojiuzMy1075QVUm42rgssdXz
	 bZFMePai0yerkUBOtVp4LYsusd4RuL5JHMIqk6Jcr3opjI8HRZ2QyIm6J58uJ9uqxB
	 PD4tVQi2KFTPM6sFKSrngw+bk0GMHF8gEsnI69IWeoybDUsgb3N5JR+s4ZrRqk1roV
	 wviFn7V25rKF+a8dk5zMVPfn30sLrRVpI9jq1tj0HXePUt67misjHrbmdasOfoFuJG
	 5eMjgR6HQLIxA==
Message-ID: <sashiko-outbox-194828@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 09/22] ASoC: apple: Add macaudio machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Calligeros" <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103-macaudio-v4-9-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-9-637484efe46d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 08:28:57 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] ASoC: apple: macaudio: AB-BA deadlock in macaudio_vlimit_update()
- [High] ASoC: apple: macaudio: UAF from canceling works after card teardown
- [High] ASoC: apple: macaudio: zeroing rate in macaudio_dpcm_hw_params()
- [High] ASoC: apple: macaudio: sleeping mutex lock in DMA tasklet via nona=
tomic links
- [Medium] ASoC: apple: macaudio: leak of DAI link OF nodes on unbind and e=
rror
- [Medium] ASoC: apple: macaudio: overwritten error in macaudio_be_assign_t=
dm()
- [Medium] ASoC: apple: macaudio: timeout race with cancel_delayed_work()
--

commit 2cdf88f52057f61693fcf4754466c5850f0fe004
Author: Martin Povi=C5=A1er <povik+lin@cutebit.org>

ASoC: apple: Add macaudio machine driver

This commit adds an ASoC machine driver for Apple Silicon Macs, linking MCA
I2S ports and multiple speaker/headset codecs as DPCM backends to synthetic
frontends, along with speaker volume safety limiting and jack detection.

> diff --git a/sound/soc/apple/macaudio.c b/sound/soc/apple/macaudio.c
> new file mode 100644
> index 0000000000000..2baabf5f3016b
> --- /dev/null
> +++ b/sound/soc/apple/macaudio.c

[ ... ]

> +static void macaudio_vlimit_update(struct macaudio_snd_data *ma, bool ta=
ke_rwsem)
> +{
> +	bool unlock =3D true;
> +	const char *reason;
> +
> +	/* Do nothing if there is no safety configured */
> +	if (!ma->has_safety)
> +		return;
> +
> +	/* Check that the control has been pinged within the timeout */
> +	if (ma->speaker_lock_remain <=3D 0) {
> +		reason =3D "Lock timeout";
> +		unlock =3D false;
> +	}
> +
> +	/*
> +	 * If this has been called from either of the safety interlock
> +	 * workqueues, the core API has not taken controls_rwsem for us.
> +	 * Take the write semaphore since macaudio_vlimit_unlock writes
> +	 * to the kcontrols.
> +	 */
> +	if (take_rwsem)
> +		down_write(&ma->card.snd_card->controls_rwsem);

[Severity: High]
As reported by Sashiko on v3 [1], can this lock ordering in
macaudio_vlimit_update() cause an AB-BA deadlock between the ALSA control
write path and the speaker volume-limit workqueue handlers?

When userspace writes to the Speaker Volume Unlock mixer control via
snd_ctl_elem_write(), the ALSA core acquires controls_rwsem for write before
calling macaudio_slk_put(), which then acquires ma->volume_lock_mutex:

  snd_ctl_elem_write()
    down_write(&card->controls_rwsem)
    macaudio_slk_put()
      guard(mutex)(&ma->volume_lock_mutex)

Conversely, when macaudio_vlimit_enable_timeout(),
macaudio_vlimit_disable_timeout(), or macaudio_vlimit_timeout_work() runs f=
rom
workqueue context, each function acquires ma->volume_lock_mutex first and t=
hen
calls macaudio_vlimit_update(ma, true), which takes controls_rwsem:

  macaudio_vlimit_timeout_work()
    guard(mutex)(&ma->volume_lock_mutex)
    macaudio_vlimit_update(ma, true)
      down_write(&ma->card.snd_card->controls_rwsem)

If a control write races with either workqueue handler, could the two threa=
ds
deadlock waiting on each other's lock?

> +
> +	if (unlock !=3D ma->speaker_volume_unlocked) {
> +		if (unlock) {
> +			dev_info(ma->card.dev, "Speaker volumes unlocked\n");
> +		} else  {
> +			dev_info(ma->card.dev, "Speaker volumes locked: %s\n", reason);
> +			ma->speaker_volume_was_locked =3D true;
> +		}
> +
> +		macaudio_vlimit_unlock(ma, unlock);
> +		ma->speaker_volume_unlocked =3D unlock;
> +		snd_ctl_notify(ma->card.snd_card, SNDRV_CTL_EVENT_MASK_VALUE,
> +			       &ma->speaker_lock_kctl->id);
> +	}
> +
> +	if (take_rwsem)
> +		up_write(&ma->card.snd_card->controls_rwsem);
> +}

[ ... ]

> +static void macaudio_vlimit_disable_timeout(struct macaudio_snd_data *ma)
> +{
> +	ktime_t now;
> +
> +	guard(mutex)(&ma->volume_lock_mutex);
> +
> +	if (!ma->speaker_lock_timeout_enabled) {
> +		return;
> +	}
> +
> +	now =3D ktime_get();
> +
> +	cancel_delayed_work(&ma->lock_timeout_work);
> +
> +	if (ktime_after(now, ma->speaker_lock_timeout))
> +		ma->speaker_lock_remain =3D 0;
> +	else if (ma->speaker_lock_remain > 0)
> +		ma->speaker_lock_remain =3D ktime_sub(ma->speaker_lock_timeout, now);
> +
> +	dev_dbg(ma->card.dev, "Disabling volume limit timeout: %ld us left\n",
> +		(long)ktime_to_us(ma->speaker_lock_remain));
> +
> +	macaudio_vlimit_update(ma, true);
> +
> +	ma->speaker_lock_timeout_enabled =3D false;
> +}
> +
> +static void macaudio_vlimit_timeout_work(struct work_struct *wrk)
> +{
> +	struct macaudio_snd_data *ma =3D container_of(to_delayed_work(wrk),
> +						    struct macaudio_snd_data, lock_timeout_work);
> +
> +	guard(mutex)(&ma->volume_lock_mutex);
> +	ma->speaker_lock_remain =3D 0;
> +	macaudio_vlimit_update(ma, true);
> +}

[Severity: Medium]
As reported by Sashiko on v3 [2], what happens if lock_timeout_work expires
just as macaudio_slk_put() or macaudio_vlimit_disable_timeout() acquires
ma->volume_lock_mutex?

If macaudio_vlimit_timeout_work() has already been dispatched and is waiting
on guard(mutex)(&ma->volume_lock_mutex), the non-synchronous
cancel_delayed_work(&ma->lock_timeout_work) calls in macaudio_slk_put() and
macaudio_vlimit_disable_timeout() will not stop it.

Once macaudio_slk_put() refreshes ma->speaker_lock_remain and releases
ma->volume_lock_mutex (or macaudio_vlimit_disable_timeout() disables the
timeout and releases the mutex), wouldn't macaudio_vlimit_timeout_work()
immediately acquire ma->volume_lock_mutex, unconditionally zero
ma->speaker_lock_remain, and lock the speaker volumes?

[ ... ]

> +static int macaudio_dpcm_hw_params(struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +	struct snd_interval *rate =3D hw_param_interval(params,
> +						      SNDRV_PCM_HW_PARAM_RATE);
> +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> +	int i;
> +
> +	if (props->is_sense) {
> +		/*
> +		 * The sense FE is opened exclusively by speakersafetyd in blocking
> +		 * mode. At the time of opening, this sample rate may be 0 if the
> +		 * speaker BE is not running. This does not matter, as speakersafetyd
> +		 * only cares about the active sample rate exported to the virtual
> +		 * sample rate kcontrol below.
> +		 */
> +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> +		return 0;
> +	}
> +
> +	/* Speakers BE */
> +	if (props->is_speakers) {
> +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
> +			/* Sense PCM: keep the existing BE rate (0 if not already running) */
> +			rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> +
> +			return 0;
> +		}

[Severity: High]
As reported by Mark Brown on v1 [3], can setting rate->min =3D rate->max =3D
cpu_dai->symmetric_rate on the Speaker Sense capture paths corrupt the PCM
runtime rate and fail when speaker playback is not active?

First, on the Speaker BE capture path (props->is_speakers &&
substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE), if speaker playback is =
not
running yet, cpu_dai->symmetric_rate is 0. Overwriting the BE hw_params rate
with 0 causes the codec hw_params callback (such as tas2764_hw_params() or
tas2770_hw_params()) to see params_rate(params) =3D=3D 0 and fail with -EIN=
VAL.

Second, on the Speaker Sense FE path (props->is_sense), macaudio_fe_hw_para=
ms()
passes the FE substream's struct snd_pcm_hw_params directly to
macaudio_dpcm_hw_params(). Because the Sense FE's CPU DAI (mca-pcm-2) is
capture-only and distinct from the Speaker BE CPU DAI, its
cpu_dai->symmetric_rate remains 0 even when speaker playback is running.

When dpcm_fe_dai_hw_params() returns to snd_pcm_hw_params(), doesn't
runtime->rate =3D params_rate(params) set runtime->rate to 0, triggering
snd_BUG_ON(!rate) in snd_pcm_timer_resolution_change() and a division by ze=
ro
in snd_pcm_post_start() at (runtime->buffer_size * HZ) / runtime->rate?

[ ... ]

> +static int macaudio_be_trigger(struct snd_pcm_substream *substream, int =
cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +
> +	/* Speaker link is marked nonatomic */
> +	if (props->is_speakers && substream->stream =3D=3D SNDRV_PCM_STREAM_PLA=
YBACK) {
> +		scoped_guard(mutex, &ma->be_link_mutex) {

[Severity: High]
As reported by Ajay Kumar Nandam on v2 [4], does marking the Secondary FE,
Speaker Sense FE, and Speaker BE DAI links as nonatomic cause sleeping in
atomic context during DMA completion?

In macaudio_fe_links and macaudio_parse_of(), .nonatomic =3D 1 is set on th=
ese
DAI links, which causes soc_new_pcm() to set pcm->nonatomic =3D true. Howev=
er,
the MCA platform driver (sound/soc/apple/mca.c) uses generic dmaengine PCM
with the Apple ADMAC controller (drivers/dma/apple-admac.c), which invokes
dmaengine_pcm_dma_complete() from admac_chan_tasklet() in softirq context:

  admac_chan_tasklet() [softirq]
    dmaengine_pcm_dma_complete()
      snd_pcm_period_elapsed()
        _snd_pcm_stream_lock_irqsave()
          mutex_lock(&substream->self_group.mutex)

Furthermore, if an XRUN or drain stop occurs inside
snd_pcm_period_elapsed_under_stream_lock(), it triggers the PCM stop path f=
rom
that same tasklet, which calls macaudio_be_trigger() and acquires
ma->be_link_mutex in softirq context.

Should the DAI links remain atomic and macaudio_be_trigger() avoid sleeping
locks, or how should this interact with ADMAC's tasklet completion path?

> +			switch (cmd) {
> +			case SNDRV_PCM_TRIGGER_START:
> +			case SNDRV_PCM_TRIGGER_RESUME:
> +			case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +				ma->bes_active |=3D BIT(rtd->dai_link->id);
> +				break;
> +			case SNDRV_PCM_TRIGGER_SUSPEND:
> +			case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +			case SNDRV_PCM_TRIGGER_STOP:
> +				ma->bes_active &=3D ~BIT(rtd->dai_link->id);
> +				break;
> +			default:
> +				return -EINVAL;
> +			}
> +		}
> +
> +		if (ma->has_safety)
> +			schedule_work(&ma->lock_update_work);
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int macaudio_be_assign_tdm(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card =3D rtd->card;
> +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(card);
> +	struct macaudio_link_props *props =3D &ma->link_props[rtd->dai_link->id=
];
> +	struct snd_soc_dai *dai;
> +	unsigned int mask;
> +	int nslots, ret, i;
> +
> +	if (!props->tdm_mask)
> +		return 0;
> +
> +	mask =3D props->tdm_mask;
> +	nslots =3D __fls(mask) + 1;
> +
> +	if (rtd->dai_link->num_codecs =3D=3D 1) {
> +		dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +		ret =3D snd_soc_dai_set_tdm_slot(dai, mask, 0, nslots, MACAUDIO_SLOTWI=
DTH);
> +
> +		/*
> +		 * Headphones get a pass on -ENOTSUPP (see the comment
> +		 * around bclk_ratio value for primary FE).
> +		 */
> +		if (ret =3D=3D -ENOTSUPP && props->is_headphones)
> +			return 0;
> +
> +		if (props->codecs[0].idle_mode) {
> +			ret =3D snd_soc_dai_set_tdm_idle(dai, props->codecs[0].idle_mask,
> +						       0, props->codecs[0].idle_mode, 0);

[Severity: Medium]
In macaudio_be_assign_tdm(), when rtd->dai_link->num_codecs =3D=3D 1 and
snd_soc_dai_set_tdm_slot() returns an error other than -ENOTSUPP on headpho=
nes,
shouldn't this return ret before checking props->codecs[0].idle_mode?

As written, if props->codecs[0].idle_mode is set, the error in ret from
snd_soc_dai_set_tdm_slot() is overwritten by snd_soc_dai_set_tdm_idle().

[ ... ]

> +static void macaudio_devm_release(void *data)
> +{
> +	struct macaudio_snd_data *ma =3D data;
> +
> +	cancel_work_sync(&ma->lock_update_work);
> +	cancel_delayed_work_sync(&ma->lock_timeout_work);
> +}
> +
> +static int macaudio_snd_platform_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	INIT_WORK(&data->lock_update_work, macaudio_vlimit_update_work);
> +	INIT_DELAYED_WORK(&data->lock_timeout_work, macaudio_vlimit_timeout_wor=
k);
> +
> +	ret =3D devm_add_action(dev, macaudio_devm_release, data);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_snd_soc_register_card(dev, &data->card);
> +	if (ret) {
> +		for_each_card_prelinks(&data->card, i, link) {
> +			snd_soc_of_put_dai_link_codecs(link);
> +			snd_soc_of_put_dai_link_cpus(link);
> +		}
> +
> +		return ret;
> +	}

[Severity: High]
As reported by Sashiko on v3 [5], can registering macaudio_devm_release()
before devm_snd_soc_register_card() lead to a use-after-free or NULL pointer
dereference of ma->card.snd_card and ma->speaker_lock_kctl in workqueue
context during card teardown?

Because devres actions run in reverse order on driver unbind (and
devm_snd_soc_bind_card() registers devm_card_bind_release() when the card
binds), soc_cleanup_card_resources() runs before macaudio_devm_release()
cancels lock_update_work and lock_timeout_work. Similarly, if a component
device unbinds while macaudio stays bound, snd_soc_unbind_card() runs
soc_cleanup_card_resources() without triggering macaudio_devm_release() at =
all.

During soc_cleanup_card_resources(), snd_card_disconnect_sync() stops active
PCM streams, which calls macaudio_be_trigger() with SNDRV_PCM_TRIGGER_STOP =
and
schedules ma->lock_update_work. soc_cleanup_card_resources() then frees all
kcontrols (including ma->speaker_lock_kctl), frees card->snd_card, and sets
card->snd_card =3D NULL.

If lock_update_work or lock_timeout_work executes before
macaudio_devm_release() runs, won't macaudio_vlimit_update() and
macaudio_vlimit_unlock() dereference ma->card.snd_card and
ma->speaker_lock_kctl after they have been freed?

[Severity: Medium]
As reported by Sashiko on v3 [6], does macaudio_snd_platform_probe() leak t=
he
backend CPU and CODEC device_node references acquired in
macaudio_parse_of_component() when the driver is later unbound or if
devm_add_action() fails?

In macaudio_snd_platform_probe(), snd_soc_of_put_dai_link_codecs() and
snd_soc_of_put_dai_link_cpus() are only called when
devm_snd_soc_register_card() fails, and are not called in
macaudio_devm_release() or on the devm_add_action() error path.

[1] https://lore.kernel.org/r/20261018-macaudio-v3-8-abdff7741dea@gmail.com
[2] https://lore.kernel.org/r/20261018-macaudio-v3-8-abdff7741dea@gmail.com
[3] https://lore.kernel.org/r/arJMrsl45g2_bLPB@sirena.co.uk
[4] https://lore.kernel.org/r/a166844a-ba68-46b2-b37b-111ce54dbba3@oss.qual=
comm.com
[5] https://lore.kernel.org/r/20261018-macaudio-v3-8-abdff7741dea@gmail.com
[6] https://lore.kernel.org/r/20261018-macaudio-v3-8-abdff7741dea@gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-macaudio-v=
4-0-637484efe46d@gmail.com?part=3D9
