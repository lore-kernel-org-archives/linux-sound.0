Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714856;
	b=buNM70N18eLc2nbF/m1QU/rhFPLaiojFrs79BWdSyv04FGAcizcmFlxirPzU5bWgzjhh
	 czqJ4obcwn16Di5oWtnHte/i/n8xyFx0u25QxNFKcEXcspyJGGqfrzTsf6GZCJY6TIVUv
	 rpTTwCK2ik2RZP75+c3LJ4jNvMMSMi8lJe09apo1NpwB8388Z2o1ovYlXGArkIEbm5xn5
	 DIDATqQ93xGQX++AV+zbQyTGhUGeKojJXwKgoX5UMJtShZrxLXvopn2Z+2oQICuUa9OCU
	 WDEogbMXxdwEs2XSLelO//sxKWL6t4zKheZ2+lQwQP/z3QxBlXG3Jpi1evEtBjGbtRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714856;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xsj6ys3gjOqkCmLmoDRcmA2OK26VfLzzn39dRuPI0zI=;
	b=xXVAcOx5kWl4Qpn2FKoTPlym89BcYnrGbww9fwMOncxC3URD4gzDsHkf/l6yjnaYxYWG
	 mSyvbRBLAkm4r+2b8nriZhzlPlreHiKkxJLUNK3o1HL6Y6wCvqErjeZjZPHFNNi62Co1Q
	 1qGP1oRVVDmRc/dTZ23QpgfmV6WrNwEDkTsCxaOFlrm0XtPqQacxVdBdhwKXZm0w6OL11
	 fpM+OMd+Tn49XeNieWf8espGCyIwKQseJwWzc5dnr+Q7qszNlY+MXz/U3BhjuTrNtA/RJ
	 TBNFVVS5uZMmPBUo2SPjPKY2IMrAxrJZXw3b7r89JwAgJ5VksH+83eb08w3jcxJezkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUVXqlH6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DB5606A326
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DUVXqlH6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91ED81F000C1;
	Tue,  3 Nov 2026 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793714855;
	bh=xsj6ys3gjOqkCmLmoDRcmA2OK26VfLzzn39dRuPI0zI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DUVXqlH6KOzhcwUft/GEtc7+ApfprB6CfhMjrzZsSnVkI0rvaZuFubv0Z51H1AfaH
	 u9MeFla64/g2AxIE6L8tub+Tj/3+lZ7MYMMCD7sxhUhQqk7QWkdoNMS5KBEVYtEUbb
	 mpGyNYVm1Fir3Sk4SXB/SlwEa7qORunFuqnfMM2IXscKsOC8S8oV4CSgh7pTJJ64eh
	 lTqUDmFCizUhvrhcqJdkIaEtibu2hTvyKloBGvLKhFp3DZJ5ru0hrLyoI3uZEZz3pO
	 YWokCV7AnRwzEwzyFHXEZwiAgE7AJCUn0N7I00kO6ze47uzYllVE8xw8XCjq8baS0D
	 OEOT5pUqpAClQ==
Message-ID: <sashiko-outbox-195420@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] ASoC: Intel: avs: SoundWire PCM BE operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261103134958.2089136-8-cezary.rojewski@intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <20261103134958.2089136-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:07:35 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: Intel: avs: broken sdw_suspended tracking in pcm_sdw.c
- [High] ASoC: Intel: avs: m_rt leak and UAF in avs_sdw_dai_hw_params()
--

commit 74a0d17712722615078fab6499f5e8443f22cefa
Author: Cezary Rojewski <cezary.rojewski@intel.com>

ASoC: Intel: avs: SoundWire PCM BE operations

This commit implements the back-end PCM operations for SoundWire links in
the Intel AVS driver to support audio data transfer over the SoundWire
interface.

> diff --git a/sound/soc/intel/avs/pcm_sdw.c b/sound/soc/intel/avs/pcm_sdw.c
> new file mode 100644
> index 0000000000000..54caa84fbd75f
> --- /dev/null
> +++ b/sound/soc/intel/avs/pcm_sdw.c

[ ... ]

> +static void avs_sdw_dai_shutdown(struct snd_pcm_substream *substream, st=
ruct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_acpi_mach *mach;
> +	struct snd_soc_dai *codec_dai;
> +	struct avs_dma_data *data;
> +	struct sdw_slave *codec;
> +
> +	codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +	mach =3D dev_get_platdata(dai->component->card->dev);
> +	codec =3D mach->pdata;
> +
> +	snd_soc_dai_set_stream(codec_dai, NULL, substream->stream);
> +	sdw_cdns_release_pdi(codec->bus, data->pdi);
> +	sdw_release_stream(data->sdw_stream);
> +	avs_dai_shutdown(substream, dai);
> +}
> +
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
> +	if (data->sdw_suspended)
> +		return avs_dai_be_hw_params(substream, hw_params, dai, pdi->intel_alh_=
id);
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

[Severity: High]
As reported by Sashiko on v1 [1], can a failure in sdw_stream_add_master()
here leak the struct sdw_master_runtime (m_rt) and leave a dangling pointer=
 to
data->sdw_stream on codec->bus->m_rt_list?

In __soc_pcm_hw_params(), codec DAI hw_params callbacks run before CPU DAI
hw_params callbacks:

__soc_pcm_hw_params()
  -> snd_soc_dai_hw_params(codec_dai)
       -> sdw_stream_add_slave()
            -> sdw_master_rt_alloc()
  -> snd_soc_dai_hw_params(cpu_dai)
       -> avs_sdw_dai_hw_params()
            -> sdw_stream_add_master()

Because sdw_stream_add_slave() already allocated m_rt and linked it onto
data->sdw_stream->master_list and codec->bus->m_rt_list,
sdw_stream_add_master() finds the existing m_rt via sdw_master_rt_find() and
leaves alloc_master_rt as false.

If sdw_master_port_alloc(), sdw_master_rt_config(), sdw_config_stream(), or
sdw_master_port_config() then fails inside sdw_stream_add_master(), m_rt (a=
nd
any allocated master ports) is not freed by sdw_stream_add_master(), and
avs_sdw_dai_hw_params() returns early without calling
sdw_stream_remove_master() and with data->path still NULL.

During __soc_pcm_hw_params() error rollback, soc_pcm_hw_clean() calls the
codec DAI hw_free callback (which calls sdw_stream_remove_slave(), freeing
only s_rt and slave ports), while avs_sdw_dai_hw_free() is either skipped or
returns early because data->path is NULL. When avs_sdw_dai_shutdown() later
calls sdw_release_stream(data->sdw_stream), data->sdw_stream is freed while
m_rt remains on codec->bus->m_rt_list with m_rt->stream pointing to freed
memory.

Should avs_sdw_dai_hw_params() call sdw_stream_remove_master() when
sdw_stream_add_master() fails, or should sdw_stream_remove_master() be
guaranteed on teardown even when data->path is NULL?

> +
> +	ret =3D avs_dai_be_hw_params(substream, hw_params, dai, pdi->intel_alh_=
id);
> +	if (ret)
> +		sdw_stream_remove_master(codec->bus, data->sdw_stream);
> +	return ret;
> +}
> +
> +static int avs_sdw_dai_hw_free(struct snd_pcm_substream *substream, stru=
ct snd_soc_dai *dai)
> +{
> +	struct snd_soc_acpi_mach *mach;
> +	struct avs_dma_data *data;
> +	struct sdw_slave *codec;
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +	if (!data->path)
> +		return 0;
> +
> +	mach =3D dev_get_platdata(dai->component->card->dev);
> +	codec =3D mach->pdata;
> +
> +	avs_path_reset(data->path);
> +	avs_path_free(data->path);
> +	data->path =3D NULL;
> +	sdw_deprepare_stream(data->sdw_stream);
> +	if (!data->sdw_suspended)
> +		sdw_stream_remove_master(codec->bus, data->sdw_stream);
> +
> +	return 0;
> +}
> +
> +static int avs_sdw_dai_prepare(struct snd_pcm_substream *substream, stru=
ct snd_soc_dai *dai)
> +{
> +	struct avs_dma_data *data;
> +	int ret;
> +
> +	data =3D snd_soc_dai_get_dma_data(dai, substream);
> +
> +	/*
> +	 * There is no guarantee trigger(RESUME) fires, so reset the flag here.
> +	 * Ensures there is no sdw_master leak should hw_free() occur without r=
esuming.
> +	 */
> +	data->sdw_suspended =3D false;
> +
> +	ret =3D sdw_prepare_stream(data->sdw_stream);
> +	if (ret) {
> +		dev_err(dai->dev, "sdw stream prepare failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D avs_dai_prepare(substream, dai);
> +	if (ret)
> +		sdw_deprepare_stream(data->sdw_stream);
> +	return ret;
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
> +		if (ret)
> +			sdw_disable_stream(data->sdw_stream);
> +		break;
> +
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +		if (rtd->dai_link->ignore_suspend)
> +			break;
> +		data->sdw_suspended =3D true;
> +		fallthrough;

[Severity: High]
As reported by Sashiko on v1 [2], does tracking suspend state via
data->sdw_suspended in avs_sdw_dai_trigger() and clearing it only in
avs_sdw_dai_prepare() break suspend/resume for non-running streams and risk=
 a
use-after-free if resume hw_params fails?

First, during system suspend, snd_pcm_do_suspend() only triggers
SNDRV_PCM_TRIGGER_SUSPEND when snd_pcm_running(substream) is true, and
dpcm_be_dai_trigger() only forwards SNDRV_PCM_TRIGGER_SUSPEND when the BE is
in SND_SOC_DPCM_STATE_START. If an open, configured stream (data->path !=3D
NULL) is in SNDRV_PCM_STATE_PAUSED, SNDRV_PCM_STATE_PREPARED,
SNDRV_PCM_STATE_SETUP, or SNDRV_PCM_STATE_XRUN at suspend time,
avs_sdw_dai_trigger() is never called and data->sdw_suspended stays false.

When avs_component_suspend() then runs:

avs_component_suspend()
  -> avs_component_suspend_hw_free()
       -> avs_dai_suspend_be_hw_free()
            -> avs_sdw_dai_hw_free()
                 -> sdw_stream_remove_master()

Because data->sdw_suspended is false, avs_sdw_dai_hw_free() calls
sdw_stream_remove_master(), which invokes sdw_master_rt_free() to free both
m_rt and all attached codec slave runtimes (s_rt) and sets
data->sdw_stream->state to SDW_STREAM_RELEASED. On resume,
avs_component_resume() only invokes CPU DAI callbacks (avs_sdw_dai_hw_param=
s()
and avs_sdw_dai_prepare()) without calling the codec DAI hw_params callback.
sdw_stream_add_master() allocates a new m_rt with no slave runtime and leav=
es
data->sdw_stream->state as SDW_STREAM_RELEASED, causing sdw_prepare_stream()
in avs_sdw_dai_prepare() to fail with -EINVAL and disconnecting the substre=
am.

Second, for a stream that was running at suspend (data->sdw_suspended =3D=3D
true), avs_sdw_dai_hw_free() sets data->path =3D NULL while keeping m_rt on
codec->bus->m_rt_list. On resume, avs_component_resume() runs
avs_component_resume_hw_params() for all BE and FE links before calling
avs_component_resume_prepare(). If avs_dai_be_hw_params() fails in
avs_sdw_dai_hw_params() (leaving data->path NULL) or if FE hw_params fails
before avs_sdw_dai_prepare() is reached (leaving data->sdw_suspended true),
closing the substream causes avs_sdw_dai_hw_free() to skip
sdw_stream_remove_master(), and avs_sdw_dai_shutdown() then frees
data->sdw_stream via sdw_release_stream() while m_rt is still linked on
codec->bus->m_rt_list.

[1] https://lore.kernel.org/r/20261102181042.1922005-8-cezary.rojewski@inte=
l.com
[2] https://lore.kernel.org/r/20261102181042.1922005-8-cezary.rojewski@inte=
l.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103134958.2089=
136-1-cezary.rojewski@intel.com?part=3D7
