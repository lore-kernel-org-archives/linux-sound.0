Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968874;
	b=C9XP6vc/xrJEiCa0GakRO47pg6qzvsq5pgXfVYpVSiTQQMn1YSuw2yLDM+Yua08qB58G
	 FpIqnZlFR6smjLEbuCC47w+uNJzjAGPd7WhEumexOYCO+aA5rVF8mbXgiC3r9VoElUGC8
	 irBVWloyKjB0Ck54hjdV5RKaQbjiA7rXv3lU6rKXqdyvN7rZJRwFpzWrcSnJoq6i1b1ff
	 9GmUJYTgdP28Kl0qjwzpmv7UYc3J5nuacRC9gkgGFp6XNVrSziuuFCWB/pbCmmzSxdrON
	 vMNgyZ9ZHVine+NfnjSwg4dhJb4tHsIpBHGxy0aoOK1FKpUfCt36nJbVWAZE6pUYWuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968874;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wPOwNCwxC0sUEFg+m45o+hvr8QAS95vckaUXoDTgPHs=;
	b=T6FGkdcLaLHMbFMobQd3/Uel56rjo1zo/2zvLEerZHjciWyelReI/BucU6xOM882sx/1
	 cLhI/4vyAOBtJeZXWETzQM9o3344DTECRamC5G5rUHs6UAtqRRkanyTfA2R5ydWQIgH40
	 /EUMxwpChAXIV6MWeDv696SJd0z6/gQD9FeTLedukCA1aZRWwKIEvrTDgG4YLwRrpK02Z
	 jjvtIMDDkq8+/+JH4s2wA9xFmU3XQYlTPDHT2HzDkilWQZBwl5PkxRXLo9cyoWqu2scOD
	 M0dQI8PdGwZ0C89JeFHyH1vjOSioAHM/SutjqcBUfj5RMphyZ3N7qWPbLB7WxXVxh5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+xS6uWH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615A606A32C
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+xS6uWH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D461F008A6;
	Fri,  6 Nov 2026 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793968873;
	bh=wPOwNCwxC0sUEFg+m45o+hvr8QAS95vckaUXoDTgPHs=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=N+xS6uWHS2BuPKpEIWX05l5fFDEBJEaqtcVKXCtHtuvpjcVEnUus16g8d/vMc4low
	 hVIVH/clRIoXtYcgClHRKDPVyylXL/+O/tQ1V+4hACRlvE+dTZbWaXzf9QKjaL74s+
	 9X2xf2iFYFyq3SQzjK3VESEPWSNC4TknYhcJbmBLlzE+BT/5YRzgAnMkBgzDI3oxd3
	 MpRQWDj3hOXR5e6WevnHjyeZod8ff1LgqrKvWM83RgZBWMjd6fZIiPDO7jnRtxynn7
	 1C09u4seZlc+Oc7VE2TiBs5uHrANO+Eo7hCz6VKus5LSjnUdsCvNe7FqTYuLPql65y
	 2dhy4JROdaMZw==
Message-ID: <sashiko-outbox-201406@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] ASoC: Intel: avs: SoundWire PCM BE operations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261106121557.2338556-8-cezary.rojewski@intel.com>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 12:41:13 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ASoC: Intel: avs: broken sdw_suspended state and m_rt lifecycle
  in pcm_sdw.c
- [High] ASoC: Intel: avs: stream left in SDW_STREAM_DEPREPARED on
  resume in pcm_sdw.c
- [High] ASoC: Intel: avs: bulk PDIs 0 and 1 assigned to PCM streams in
  avs_sdw_dai_startup()
--

commit 18beef33b6f436db2bab29aa861b96311ce4d2f9
Author: Cezary Rojewski <cezary.rojewski@intel.com>

ASoC: Intel: avs: SoundWire PCM BE operations

This commit adds back-end DAI operations and component registration for
SoundWire PCM streams in the Intel AVS driver.

> diff --git a/sound/soc/intel/avs/pcm_sdw.c b/sound/soc/intel/avs/pcm_sdw.c
> new file mode 100644
> index 0000000000000..578162e9fc4dc
> --- /dev/null
> +++ b/sound/soc/intel/avs/pcm_sdw.c
> @@ -0,0 +1,291 @@

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

[Severity: High]
Does sdw_cdns_assign_pdi() assign bulk PDIs 0 and 1 to the first two PCM
substreams on a link?

On Intel cAVS SoundWire controllers, SDW_SHIM_PCMSCAP reports bidirectional
streams in pcm_bd with pcm_in and pcm_out set to 0, where PDI 0 and PDI 1
are reserved for 1-channel bulk transfers and PCM PDIs start at index 2.
Because sdw_cdns_assign_pdi() searches stream->bd starting from index 0,
passing the resulting pdi to sdw_intel_pdi_config() and
sdw_stream_add_master() in avs_sdw_dai_hw_params() enables
CDNS_PORTCTRL_BULK_ENABLE on TX, maps PDI 1 to DataPort 0 in
CDNS_PDI_CONFIG(1) while configuring DataPort 1 in pconfig.num, and
computes bulk ALH stream IDs instead of PCM ALH stream IDs.

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
> +	if (ret) {
> +		sdw_stream_remove_master(codec->bus, data->sdw_stream);
> +		return ret;
> +	}
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

[Severity: High]
When a suspended stream resumes, does leaving data->sdw_stream in
SDW_STREAM_DEPREPARED cause sdw_prepare_stream() to skip computing its port
and transport parameters?

During suspend, avs_sdw_dai_hw_free() calls sdw_deprepare_stream(), which
sets data->sdw_stream->state to SDW_STREAM_DEPREPARED and subtracts the
stream bandwidth from bus->params.bandwidth.  On resume,
avs_sdw_dai_hw_params() returns early when data->sdw_suspended is set
without restoring the state to SDW_STREAM_CONFIGURED, so
sdw_prepare_stream() runs with update_params set to true while
sdw_compute_port_params() ignores streams in SDW_STREAM_DEPREPARED:

drivers/soundwire/generic_bandwidth_allocation.c:sdw_compute_group_params()=
 {
    ...
		if (m_rt->stream =3D=3D stream) {
			/* Only runtime during prepare should be added */
			if (stream->state !=3D SDW_STREAM_CONFIGURED)
				continue;
		} else {
			/* Include streams withPrepared or Enabled seamlessly */
			if (m_rt->stream->state !=3D SDW_STREAM_PREPARED &&
			    m_rt->stream->state !=3D SDW_STREAM_ENABLED)
				continue;
		}
    ...
}

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
Can tracking suspend via data->sdw_suspended in avs_sdw_dai_trigger() break
resume for non-running streams and leave a freed data->sdw_stream linked on
codec->bus->m_rt_list if resume fails?

snd_pcm_do_suspend() only issues SNDRV_PCM_TRIGGER_SUSPEND when the
substream is running, so a configured substream in PAUSED, PREPARED, SETUP,
or XRUN state enters avs_component_suspend() with data->sdw_suspended still
false.  avs_sdw_dai_hw_free() then calls sdw_stream_remove_master(), which
frees the master and codec slave runtimes and sets data->sdw_stream->state
to SDW_STREAM_RELEASED, but avs_component_resume() only re-runs CPU DAI
hw_params and never calls the codec DAI's hw_params (sdw_stream_add_slave()=
),
causing sdw_prepare_stream() in avs_sdw_dai_prepare() to fail with -EINVAL
and disconnect the substream.

Conversely, when a running stream suspends (setting data->sdw_suspended =3D
true) and avs_component_resume_hw_params() fails before
avs_sdw_dai_prepare() clears data->sdw_suspended, closing the substream
skips sdw_stream_remove_master() in avs_sdw_dai_hw_free() (because
!data->path or data->sdw_suspended is true) and frees data->sdw_stream in
avs_sdw_dai_shutdown(), leaving m_rt on codec->bus->m_rt_list with a
dangling m_rt->stream pointer (use-after-free on subsequent SoundWire bus
operations).  The same dangling m_rt occurs if codec DAI hw_params fails
after sdw_stream_add_slave() allocates m_rt on codec->bus before
avs_sdw_dai_hw_params() sets data->path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106121557.2338=
556-1-cezary.rojewski@intel.com?part=3D7
