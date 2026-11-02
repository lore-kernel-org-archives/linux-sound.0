Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644008;
	b=v68NVgsrerKMuJ1VDodZhOPVG13dej+AijSOuV/YNfkeC0fSZnCO7EOyvy6Fy4N+GpfO
	 EOdJq56nCD/A81zgMkjbWiLknv9Rv9t61aHP27V1O0XqNxEk4HKbExGpbTdS5K4Fs0koY
	 88Ka1CxtPxti3xsTrDqhC0EVqzZtC9EYgWUV0zKaDlOyDNkTxjgMItIhQpyV6xPCP1rPQ
	 R6ajv6MelMQanVLGmM7ZDmsCZNcSfU58e1mFb9D50vWQPfcgy8vG2126m6M3VAcy+u3kY
	 PbzvOnliJldgo36qHlizXr3CezMn9TO4KrxM1wKUse4To0jiIXXLFpxUp6z41fhKqNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644008;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oQ5o5ZgoHIY2Nk12lacf3grs12WTeT6DSiIfYTs6xWo=;
	b=qpUTV/aO2ogGlkL7TBkR34NFAYDjbk5/SUFTn7aSpWMnik3WmYUHRicYOv8sJfgNYSRC
	 3vM08lmRz6LjovboflwsKR5Ce6H90cxyJQraWY+z7yj6E/Cmd71S7j0DsbR3SdbpJ3IJE
	 Kba5hjV6FqP6Ed6Xx7W0NCZOnmFZmjM7jmyBWND9VOraeROoosdFL1pvGgwJ/Se3EU1Y5
	 RycDPJbcKOIFuait2Voau7AFPbUqCsR4NqMa4qWUkUUk869wwSQJNyc4NCV3vfK0o7NXX
	 XPjC9lkSWIVwxfyDpZUpjzXB2Ld2bo2kuvmYJeTGp6HwimPRRoAlWoNNg4BcxtP66VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBBwKkSE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7AB606A324
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBBwKkSE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F09F1F00A17;
	Mon,  2 Nov 2026 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793644007;
	bh=oQ5o5ZgoHIY2Nk12lacf3grs12WTeT6DSiIfYTs6xWo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=fBBwKkSERLCLV62QWrpSwy6HrsNp/ksgGZBwmz86GAf+hjtYMIcBrT0BbdKrhFLC3
	 pWXHt5T4QBZIOPgJ0hYDR55YgAwBzI0itcAupuRkxktWiUG29171iYsPMFJ3MjZf47
	 cjgndqIwi5kOf3n+fQXkaJhfyWB/Pg1+Hu0x+atIiSfOaJCAebcLv+SVJzgdS8DDLD
	 esvkPrvs4mKztOm3kEhzcPtGwPKJ5cP1ut6++gm69np43Hz+AgQtG9nRTQw4crDHyn
	 ZYa3a0FIPpmjJVAbMFjMPVvUXBGPThkdBgkmJ6BWGUqdyaK06Ja0SjNg4dz9st4Cbo
	 Lb+43M8YDwk6A==
Message-ID: <sashiko-outbox-193935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] ASoC: Intel: avs: SoundWire PCM BE operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102181042.1922005-8-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:26:47 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] ASoC: Intel: avs: broken suspend/resume due to avs_sdw_dai_hw_free=
()
- [High] ASoC: Intel: avs: m_rt leak and UAF on sdw_stream_add_master() err=
or in avs_sdw_dai_hw_params()
- [Medium] ASoC: Intel: avs: dangling codec stream pointer in avs_sdw_dai_s=
hutdown()
- [Medium] ASoC: Intel: avs: missing stream disable rollback in avs_sdw_dai=
_trigger()
- [Low] ASoC: Intel: avs: link failure when SND_SOC_INTEL_AVS=3Dy and SOUND=
WIRE_INTEL=3Dm
--

commit b4101c2b87dd19b6fc2e6be967189ca74f738d4e
Author: Cezary Rojewski <cezary.rojewski@intel.com>

ASoC: Intel: avs: SoundWire PCM BE operations

This commit implements back-end PCM operations for the SoundWire link in
the Intel AVS driver, wiring up DAI startup, shutdown, hw_params, hw_free,
prepare, and trigger callbacks to the SoundWire core and Cadence helpers.

> diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
> index 1d48953c7a31c..07a82a6f5b23e 100644
> --- a/sound/soc/intel/avs/Makefile
> +++ b/sound/soc/intel/avs/Makefile
> @@ -15,7 +15,7 @@ snd-soc-avs-y +=3D probes.o debugfs.o
>  endif
> =20
>  ifneq ($(CONFIG_SOUNDWIRE_INTEL),)
> -snd-soc-avs-y +=3D soundwire.o
> +snd-soc-avs-y +=3D soundwire.o pcm_sdw.o
>  endif
> =20
>  obj-$(CONFIG_SND_SOC_INTEL_AVS) +=3D snd-soc-avs.o

[Severity: Low]
Can this fail to link when CONFIG_SND_SOC_INTEL_AVS=3Dy and
CONFIG_SOUNDWIRE_INTEL=3Dm?

In sound/soc/intel/Kconfig, SND_SOC_INTEL_AVS is tristate and does not
depend on SOUNDWIRE_INTEL || !SOUNDWIRE_INTEL. When SND_SOC_INTEL_AVS=3Dy
and SOUNDWIRE_INTEL=3Dm (with SOUNDWIRE=3Dm and SOUNDWIRE_CADENCE=3Dm),
ifneq ($(CONFIG_SOUNDWIRE_INTEL),) is still true and links pcm_sdw.o into
the built-in snd-soc-avs.o, while sdw_alloc_stream(),
sdw_cdns_assign_pdi(), and the other SoundWire helpers live in loadable
modules.

> diff --git a/sound/soc/intel/avs/pcm_sdw.c b/sound/soc/intel/avs/pcm_sdw.c
> new file mode 100644
> index 0000000000000..27cb285eca091
> --- /dev/null
> +++ b/sound/soc/intel/avs/pcm_sdw.c
> @@ -0,0 +1,276 @@

[ ... ]

> +static int avs_sdw_dai_startup(struct snd_pcm_substream *substream, stru=
ct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct sdw_stream_runtime *sdw_stream;
> +	struct snd_soc_acpi_mach *mach;
> +	struct snd_soc_dai *codec_dai;
> +	struct avs_dma_data *data;
> +	struct sdw_cdns_pdi *pdi;
> +	struct sdw_slave *codec;
> +	int dir, ret;
> +
> +	mach =3D dev_get_platdata(dai->component->card->dev);
> +	codec =3D mach->pdata;
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +		dir =3D SDW_DATA_DIR_RX;
> +	else
> +		dir =3D SDW_DATA_DIR_TX;
> +
> +	ret =3D avs_dai_startup(substream, dai);
> +	if (ret)
> +		return ret;
> +
> +	sdw_stream =3D sdw_alloc_stream(substream->name, SDW_STREAM_PCM);
> +	if (!sdw_stream) {
> +		ret =3D -ENOMEM;
> +		goto err_alloc_stream;
> +	}
> +
> +	pdi =3D sdw_cdns_assign_pdi(codec->bus, dir);
> +	if (!pdi) {
> +		ret =3D -EBUSY;
> +		goto err_assign_pdi;
> +	}
> +
> +	/* Fulfill the codec needs by setting the sdw_stream. */
> +	codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +	snd_soc_dai_set_stream(codec_dai, sdw_stream, substream->stream);
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +	data->sdw_stream =3D sdw_stream;
> +	data->pdi =3D pdi;
> +	return 0;
> +
> +err_assign_pdi:
> +	sdw_release_stream(sdw_stream);
> +err_alloc_stream:
> +	avs_dai_shutdown(substream, dai);
> +	return ret;
> +}
> +
> +static void avs_sdw_dai_shutdown(struct snd_pcm_substream *substream, st=
ruct snd_soc_dai *dai)
> +{
> +	struct snd_soc_acpi_mach *mach;
> +	struct avs_dma_data *data;
> +	struct sdw_slave *codec;
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +	mach =3D dev_get_platdata(dai->component->card->dev);
> +	codec =3D mach->pdata;
> +
> +	sdw_cdns_release_pdi(codec->bus, data->pdi);
> +	sdw_release_stream(data->sdw_stream);
> +	avs_dai_shutdown(substream, dai);
> +}

[Severity: Medium]
Should avs_sdw_dai_startup() check the return value of
snd_soc_dai_set_stream(), and should avs_sdw_dai_shutdown() clear the
stream pointer on codec_dai before freeing data->sdw_stream?

In avs_sdw_dai_shutdown(), sdw_release_stream(data->sdw_stream) frees
data->sdw_stream without calling
snd_soc_dai_set_stream(codec_dai, NULL, substream->stream) (unlike
sdw_shutdown_stream()). If a SoundWire codec driver does not clear its
stream pointer in a .shutdown callback, or if __soc_pcm_open() fails
during codec_dai startup after avs_sdw_dai_startup() has already run (so
soc_pcm_clean() skips codec_dai shutdown during rollback), codec_dai is
left holding a dangling pointer to the freed sdw_stream_runtime.

> +static int avs_sdw_dai_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *hw_params,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct sdw_stream_config sconfig =3D {0};
> +	struct sdw_port_config pconfig =3D {0};
> +	struct snd_soc_acpi_mach *mach;
> +	struct avs_dma_data *data;
> +	struct sdw_cdns_pdi *pdi;
> +	struct sdw_slave *codec;
> +	int ret;
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +	if (data->path)
> +		return 0;
> +
> +	mach =3D dev_get_platdata(dai->component->card->dev);
> +	codec =3D mach->pdata;
> +	pdi =3D data->pdi;
> +	pdi->ch_count =3D params_channels(hw_params);
> +	pdi->h_ch_num =3D pdi->ch_count - 1;
> +	pdi->l_ch_num =3D 0;
> +	sdw_intel_pdi_config(codec->bus, pdi);
> +
> +	sconfig.direction =3D pdi->dir;
> +	sconfig.ch_count =3D pdi->ch_count;
> +	sconfig.frame_rate =3D params_rate(hw_params);
> +	sconfig.type =3D SDW_STREAM_PCM;
> +	sconfig.bps =3D snd_pcm_format_width(params_format(hw_params));
> +	pconfig.num =3D pdi->num;
> +	pconfig.ch_mask =3D (1 << pdi->ch_count) - 1;
> +
> +	ret =3D sdw_stream_add_master(codec->bus, &sconfig, &pconfig, 1, data->=
sdw_stream);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D avs_dai_be_hw_params(substream, hw_params, dai, pdi->intel_alh_=
id);
> +	if (ret)
> +		sdw_stream_remove_master(codec->bus, data->sdw_stream);
> +	return ret;
> +}

[Severity: High]
If sdw_stream_add_master() fails here in avs_sdw_dai_hw_params(), does
this leak struct sdw_master_runtime and leave a dangling m_rt->stream
pointer on codec->bus->m_rt_list?

During __soc_pcm_hw_params(), the codec DAI hw_params runs before the CPU
DAI hw_params:

  __soc_pcm_hw_params()
    soc_pcm_hw_params() [codec DAI]
      sdw_stream_add_slave()
        sdw_master_rt_alloc() -> allocates m_rt, links onto
                                 codec->bus->m_rt_list with
                                 m_rt->stream =3D data->sdw_stream
    soc_pcm_hw_params() [CPU DAI: avs_sdw_dai_hw_params()]
      sdw_stream_add_master()

Because m_rt was already allocated by sdw_stream_add_slave(),
sdw_stream_add_master() sets alloc_master_rt =3D false and does not free
m_rt (or any allocated master ports) if sdw_master_port_alloc(),
sdw_master_rt_config(), sdw_config_stream(), or sdw_master_port_config()
fails.

When avs_sdw_dai_hw_params() returns that error without calling
sdw_stream_remove_master(), data->path remains NULL. Rollback in
soc_pcm_hw_clean() only calls sdw_stream_remove_slave() on the codec DAI
(which frees s_rt, not m_rt) and skips avs_sdw_dai_hw_free(). When the
substream is then closed, avs_sdw_dai_shutdown() frees data->sdw_stream
while m_rt is still linked on codec->bus->m_rt_list with m_rt->stream
pointing to the freed stream.

> +
> +static int avs_sdw_dai_hw_free(struct snd_pcm_substream *substream, stru=
ct snd_soc_dai *dai)
> +{
> +	struct snd_soc_acpi_mach *mach;
> +	struct avs_dma_data *data;
> +	struct sdw_slave *codec;
> +	int ret;
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +	if (!data->path)
> +		return 0;
> +
> +	mach =3D dev_get_platdata(dai->component->card->dev);
> +	codec =3D mach->pdata;
> +
> +	ret =3D avs_path_reset(data->path);
> +	if (ret < 0)
> +		dev_err(dai->dev, "reset BE path failed: %d\n", ret);
> +	avs_path_free(data->path);
> +	data->path =3D NULL;
> +	sdw_deprepare_stream(data->sdw_stream);
> +	sdw_stream_remove_master(codec->bus, data->sdw_stream);
> +
> +	return 0;
> +}

[Severity: High]
Won't calling sdw_stream_remove_master() in avs_sdw_dai_hw_free() break
system suspend and resume when a SoundWire stream is active?

avs_register_sdw_component() registers the component with
avs_component_driver, which uses avs_component_suspend() and
avs_component_resume():

  avs_component_suspend()
    avs_component_suspend_hw_free()
      avs_dai_suspend_be_hw_free()
        dai->driver->ops->hw_free() -> avs_sdw_dai_hw_free()

During suspend, avs_dai_suspend_be_hw_free() invokes hw_free only on the
AVS CPU DAI (ASoC does not call hw_free or hw_params on the codec DAI
across suspend/resume). In avs_sdw_dai_hw_free(),
sdw_stream_remove_master() calls sdw_master_rt_free(), which frees both
the master runtime and all attached codec slave runtimes on
m_rt->slave_rt_list, and sets data->sdw_stream->state to
SDW_STREAM_RELEASED.

On resume:

  avs_component_resume()
    avs_component_resume_hw_params()
      avs_dai_resume_hw_params()
        avs_sdw_dai_hw_params()
          sdw_stream_add_master()
    avs_component_resume_prepare()
      avs_dai_resume_be_prepare()
        avs_sdw_dai_prepare()
          sdw_prepare_stream()

Because codec DAI hw_params (sdw_stream_add_slave()) is never called on
resume, m_rt->slave_rt_list remains empty and data->sdw_stream->state
remains SDW_STREAM_RELEASED (only sdw_stream_add_slave() transitions the
stream state to SDW_STREAM_CONFIGURED). Consequently,
sdw_prepare_stream() in avs_sdw_dai_prepare() fails with -EINVAL and
avs_component_pm_op() disconnects the substream.

> +
> +static int avs_sdw_dai_prepare(struct snd_pcm_substream *substream, stru=
ct snd_soc_dai *dai)
> +{
> +	struct avs_dma_data *data;
> +	int ret;
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +
> +	ret =3D sdw_prepare_stream(data->sdw_stream);
> +	if (ret) {
> +		dev_err(dai->dev, "sdw stream prepare failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return avs_dai_prepare(substream, dai);
> +}
> +
> +static int avs_sdw_dai_trigger(struct snd_pcm_substream *substream, int =
cmd,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct avs_dma_data *data;
> +	int ret =3D 0;
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		if (rtd->dai_link->ignore_suspend)
> +			break;
> +		fallthrough;
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret =3D sdw_enable_stream(data->sdw_stream);
> +		if (ret)
> +			break;
> +
> +		ret =3D avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
> +		if (ret < 0)
> +			dev_err(dai->dev, "run BE path failed: %d\n", ret);
> +		break;
> +
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +		if (rtd->dai_link->ignore_suspend)
> +			break;
> +		fallthrough;
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		ret =3D avs_path_pause(data->path);
> +		if (ret < 0)
> +			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
> +
> +		ret =3D sdw_disable_stream(data->sdw_stream);
> +		if (ret)
> +			dev_err(dai->dev, "disable sdw stream failed: %d\n", ret);
> +		break;

[Severity: Medium]
If avs_path_run() fails in avs_sdw_dai_trigger(), should
sdw_disable_stream(data->sdw_stream) be called to roll back
sdw_enable_stream()?

When avs_sdw_dai_trigger() returns an error from avs_path_run(), ASoC
does not mark the DAI as triggered or transition the BE to
SND_SOC_DPCM_STATE_START, so STOP will not be called on this DAI. That
leaves data->sdw_stream in SDW_STREAM_ENABLED, causing
sdw_deprepare_stream() in avs_sdw_dai_hw_free() to fail with -EINVAL and
leak the stream's bus bandwidth allocation on codec->bus.

Also, in the SUSPEND/PAUSE_PUSH/STOP case, assigning
ret =3D sdw_disable_stream(data->sdw_stream) unconditionally overwrites any
negative error returned by avs_path_pause(data->path).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102181042.1922=
005-1-cezary.rojewski@intel.com?part=3D7
