Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543276;
	b=IMRCvs+tYxmwuuKJBBuT7AJwucudQxnHxshuAzyQCPZo69LOtRilWRclWZWob+yrIoIg
	 k1ZPYxpSs2vR2KQKRnddFvpCn16Dj9nhso+6Prk9hbfnmtpBuo5nPiEUypDgH6GC6C9Fj
	 g7RAPL2YxnR71la1jjBFUcXfWK20a5rG63uqth8y6Zuii8FnYVwDDHpR/AVkjqePzFlYy
	 B5z1gi/PXzDW4iLP2M1vS7Vxq/sPG5gxdvNbQx+09gr5ffuWrPXXAGUwhb7N0kCJ7JOpL
	 zUPcoC/8UH1QqDVLVHTqmcAEiS2deebXame+o/sAnUU/p1GRosAlFtvqyC/d160MmzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543276;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=81xq/8PMgUhHzvnkZyzFLQ9ag/AlyDUIYItSKX9Ibqk=;
	b=Q3/HQ9nMGucJQ4gh+fDGHjuOC7pNwmOFBtjiMy5ipIlssQC9aiIfW7la9pq6m3/WCXyr
	 AKQ7aPl88Er1aijRpkkWWro0J/Xdc3jL2gzF3a4S+hJyVzpq6CM+LHiZgg67TmwG1FNFT
	 26/AzEQiFnxtClsxk1mhnAeSPze4QEC4pneluiUJ4kueFzGlu83tj+lLnCKZBIh+aUoDS
	 aurp+XGMH82xo9CF01FvzMzOa3ayUO/C0wFH+J8zLacKfwNqhZlEbyP27Ma8DheVgE2NA
	 PpYwR2Vw48v/PTVBZnZcWVdfjTsXzBWM8r86F7jCOlWMBTmm+R2ZB+aiFybBztEgKXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPXsvCWm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB27606A31E;
	Tue, 24 Nov 2026 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPXsvCWm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE7F1F000C4;
	Tue, 24 Nov 2026 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543276;
	bh=81xq/8PMgUhHzvnkZyzFLQ9ag/AlyDUIYItSKX9Ibqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OPXsvCWm/oIvD5JqJKUwZDVjpQzSPP5No5l4ZmDjbA+n2sGuxbrw8UiYdsWuLiY+G
	 PzuCFyYSV/7yqRnM07XRhCHK9a3PMoyPlXM+C3kmmRPtd8q+p0a5MWdg91vE7cI7pA
	 hqpRZjH0GZ/lsb1oT42v9EnKff8KB8d4qxCadoic/ildUjI8zd6/UO2yA+Iwov4Mg3
	 80OkGD4TZr/3aI7jYMSNfVg7pmR/ywBe24XhzbbXnN7kuDiIfSGz5QgTUHgD1+y4ew
	 rhNIiNzBzBNUhDIqHbm6RFqF9R2ssawAAK1BRrtBpiOjcLVjYEMc5pqPSeRJcc0NJx
	 ZVGJMLObWu7cw==
Message-ID: <sashiko-outbox-231761@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 15/19] ASoC: qcom: lpass: allocate LPM buffer memory
 to DAIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-topic-sm8650-el2-v2-15-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
 <20261124-topic-sm8650-el2-v2-15-174e159f0f69@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 18:01:15 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] ASoC: qcom: lpass: unchecked memremap() and invalid free of LPM
  MI2S buffer
- [High] ASoC: qcom: lpass: VA and RXTX LPAIF resources not gated when
  used for MI2S
- [High] ASoC: qcom: lpass: unchecked memremap() and missing pcm_free
  memunmap()
- [Medium] ASoC: qcom: lpass: mi2s_lpm_enable set for disabled LPM
  LPAIFs in probe
- [Medium] ASoC: qcom: lpass: LPM buffer offset 0 collision in
  lpass_platform_allocate_lpm()
--

commit 4c2b83ff038eba299bfce68560d0b64cb7efc8a7
Author: Neil Armstrong <neil.armstrong@linaro.org>

ASoC: qcom: lpass: allocate LPM buffer memory to DAIs

This commit dynamically assigns LPM SRAM buffer offsets for Codec DMA and
LPM-backed MI2S DAIs and preallocates LPM DMA buffers for MI2S ports that
cannot access DDR.

> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index a83507c2cd557..8b005a87d4088 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1169,6 +1169,8 @@ static void of_lpass_cpu_parse_dai_data(struct devi=
ce *dev,
>  			data->codec_dma_enable =3D 1;
>  			if (is_wsa_cdc_dma_port(id))
>  				data->wsa_enable =3D 1;
> +			else if (!is_rxtx_cdc_dma_port(id))
> +				data->va_enable =3D 1;
>  		} else if (is_mi2s_port_id(id)) {
>  			unsigned int port_id =3D mi2s_port_id(id);

[Severity: High]
Should drvdata->va_enable (and an equivalent rxtx_enable flag) also gate
claiming the VA and RXTX LPAIF MMIO and IRQ resources when Codec DMA is
enabled?

When a board uses RXTX or WSA Codec DMA alongside an MI2S port on
lpass-va-lpaif (with va_enable =3D=3D 0), asoc_qcom_lpass_cpu_platform_prob=
e()
still unconditionally claims "lpass-va-lpaif" via
devm_platform_ioremap_resource_byname() under if (drvdata->codec_dma_enable=
),
causing lpass_cpu_init_lpaif() for that MI2S LPAIF to fail with -EBUSY
(and asoc_qcom_lpass_platform_register() similarly requests
"lpass-irq-vaif" unconditionally).  Conversely, without an rxtx_enable
flag, enabling only VA or WSA Codec DMA unconditionally claims
"lpass-rxtx-lpaif" and reserves 2 * LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE of
rxtx_cdc_dma_lpm in lpass_platform_allocate_lpm().

[ ... ]

> @@ -1380,6 +1366,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platf=
orm_device *pdev)
>  						   variant->mi2s_desc[i].reg_name);
>  			if (ret)
>  				return ret;
> +
> +			if (variant->mi2s_desc[i].lpm_type !=3D LPASS_LPM_NONE)
> +				drvdata->mi2s_lpm_enable =3D true;
>  		}
>  	} else {

[Severity: Medium]
Does this set drvdata->mi2s_lpm_enable even when the LPM-backed LPAIF has
no ports enabled in DT?

When no port on variant->mi2s_desc[i] is set in drvdata->lpaif_port_enable,
lpass_cpu_init_lpaif() returns 0 early with drvdata->lpaif[i].drvdata left
NULL.  Checking variant->mi2s_desc[i].lpm_type without checking
drvdata->lpaif[i].drvdata sets mi2s_lpm_enable to true on every variant
whose static mi2s_desc table contains an LPM LPAIF, forcing probe to
require the Codec DMA LPM clocks and LPM memory resources even when only
core-LPAIF MI2S or HDMI/DP DAIs are used.

> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platf=
orm.c
> index 16a964e1aec1f..855f1ee193946 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c

[ ... ]

> @@ -1288,6 +1321,41 @@ static irqreturn_t lpass_platform_wsaif_irq(int ir=
q, void *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int lpass_platform_prealloc_lpm_mi2s_buffer(struct snd_soc_compon=
ent *component,
> +						    struct snd_pcm *pcm, int dai_id)
> +{
> +	struct lpass_data *drvdata =3D snd_soc_component_get_drvdata(component);
> +	unsigned int port_id =3D mi2s_port_id(dai_id);
> +	struct snd_pcm_substream *substream;
> +	struct snd_dma_buffer *buf;
> +	u32 addr;
> +	int dir;
> +
> +	if (drvdata->mi2s_lpm[port_id] =3D=3D LPASS_VA_CDC_LPM)
> +		addr =3D drvdata->va_cdc_dma_lpm_buf;
> +	else
> +		addr =3D drvdata->rxtx_cdc_dma_lpm_buf;
> +	addr +=3D drvdata->mi2s_lpm_offset[port_id];
> +
> +	/* Playback and capture buffers are allocated one after the other */
> +	for (dir =3D SNDRV_PCM_STREAM_PLAYBACK; dir <=3D SNDRV_PCM_STREAM_CAPTU=
RE; dir++) {
> +		substream =3D pcm->streams[dir].substream;
> +		if (!substream)
> +			continue;
> +
> +		buf =3D &substream->dma_buffer;
> +		buf->dev.dev =3D pcm->card->dev;
> +		buf->dev.type =3D SNDRV_DMA_TYPE_CONTINUOUS;
> +		buf->private_data =3D NULL;
> +		buf->bytes =3D lpass_platform_lpm_mi2s_hardware.buffer_bytes_max;
> +		buf->addr =3D addr + dir * LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE;
> +		buf->area =3D (unsigned char * __force)memremap(buf->addr, buf->bytes,
> +							      MEMREMAP_WC);
> +	}
> +
> +	return 0;
> +}

[Severity: High]
What happens on PCM teardown or if memremap() returns NULL here?

Because buf->dev.type is set to SNDRV_DMA_TYPE_CONTINUOUS and
lpass_component_driver has no .pcm_free callback to memunmap(buf->area) and
clear buf->area, PCM teardown in snd_pcm_free() ->
snd_pcm_lib_preallocate_free_for_all() -> do_free_pages() passes the
memremap() I/O virtual address to snd_dma_continuous_free() ->
free_pages_exact() and leaks the mapping.  In addition, if memremap()
returns NULL, lpass_platform_prealloc_lpm_mi2s_buffer() still returns 0
(leaking the playback mapping if capture fails), and a subsequent transfer
in lpass_platform_copy() dereferences a NULL runtime->dma_area.

> @@ -1412,6 +1482,7 @@ static int lpass_platform_copy(struct snd_soc_compo=
nent *component,
>  			       unsigned long pos, struct iov_iter *buf,
>  			       unsigned long bytes)
>  {
> +	struct lpass_data *drvdata =3D snd_soc_component_get_drvdata(component);
>  	struct snd_pcm_runtime *rt =3D substream->runtime;
>  	struct snd_soc_pcm_runtime *soc_runtime =3D snd_soc_substream_to_rtd(su=
bstream);
>  	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(soc_runtime, 0);
> @@ -1422,7 +1493,7 @@ static int lpass_platform_copy(struct snd_soc_compo=
nent *component,
>  				channel * (rt->dma_bytes / rt->channels));
> =20
>  	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> -		if (is_cdc_dma_port(dai_id)) {
> +		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
>  			if (copy_from_iter_toio(dma_buf, bytes, buf) !=3D bytes)
>  				ret =3D -EFAULT;
>  		} else {
> @@ -1430,7 +1501,7 @@ static int lpass_platform_copy(struct snd_soc_compo=
nent *component,
>  				ret =3D -EFAULT;
>  		}
>  	} else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
> -		if (is_cdc_dma_port(dai_id)) {
> +		if (is_cdc_dma_port(dai_id) || is_lpm_mi2s_port(drvdata, dai_id)) {
>  			if (copy_to_iter_fromio(dma_buf, bytes, buf) !=3D bytes)
>  				ret =3D -EFAULT;
>  		} else {

[Severity: High]
Should both lpass_platform_prealloc_lpm_mi2s_buffer() and
lpass_platform_prealloc_cdc_dma_buffer() return -ENOMEM if memremap()
fails, and should lpass_component_driver provide a .pcm_free callback to
memunmap() and zero substream->dma_buffer.area so that lpass_platform_copy()
cannot hit a NULL rt->dma_area and snd_pcm_free() does not call
free_pages_exact() on the remapped LPM pointer?

> @@ -1459,6 +1530,66 @@ static const struct snd_soc_component_driver lpass=
_component_driver =3D {
> =20
>  };
> =20
> +static int lpass_platform_allocate_lpm(struct lpass_data *drvdata)
> +{
> +	u32 rxtx_cdc_dma_lpm_remain =3D drvdata->rxtx_cdc_dma_lpm_size;
> +	u32 va_cdc_dma_lpm_remain =3D drvdata->va_cdc_dma_lpm_size;
> +	u32 rxtx_cdc_dma_lpm_offset =3D 0;
> +	u32 va_cdc_dma_lpm_offset =3D 0;
> +	int port_id;
> +
> +	if (drvdata->codec_dma_enable) {
> +		drvdata->rxtx_lpm_offset =3D rxtx_cdc_dma_lpm_offset;
> +		rxtx_cdc_dma_lpm_offset +=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +		rxtx_cdc_dma_lpm_remain -=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +
> +		if (drvdata->va_enable) {
> +			drvdata->va_lpm_offset =3D va_cdc_dma_lpm_offset;
> +			va_cdc_dma_lpm_offset +=3D LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
> +			va_cdc_dma_lpm_remain -=3D LPASS_VA_CDC_DMA_LPM_BUFF_SIZE;
> +		}
> +
> +		if (drvdata->wsa_enable) {
> +			drvdata->wsa_lpm_offset =3D rxtx_cdc_dma_lpm_offset;
> +			rxtx_cdc_dma_lpm_offset +=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +			rxtx_cdc_dma_lpm_remain -=3D LPASS_RXTX_CDC_DMA_LPM_BUFF_SIZE * 2;
> +		}
> +	}
> +
> +	if (!drvdata->mi2s_lpm_enable)
> +		return 0;
> +
> +	for (port_id =3D 0; port_id < LPASS_MAX_MI2S_PORTS; port_id++) {
> +		if (!test_bit(port_id, &drvdata->lpaif_port_enable))
> +			continue;
> +
> +		switch (drvdata->mi2s_lpm[port_id]) {

[Severity: Medium]
Can an MI2S port on an enabled multi-port LPM LPAIF collide at LPM offset 0
if that port has no child node in DT?

of_lpass_cpu_parse_dai_data() sets a default 8-channel SD-line mode for all
MI2S ports and only sets drvdata->lpaif_port_enable for ports with an
explicit child node, while asoc_qcom_lpass_cpu_platform_probe() populates
drvdata->mi2s_lpaif[port_id] and drvdata->mi2s_lpm[port_id] for all MI2S
DAIs and lpass_cpu_daiops_probe() only checks that the port's LPAIF was
initialized:

sound/soc/qcom/lpass-cpu.c:lpass_cpu_daiops_probe() {
    ...
	/* The LPAIF is only initialized if one of its ports is described in DT */
	if (!lpaif || !lpaif->drvdata) {
		dev_err(dai->dev, "LPAIF of this port is not enabled\n");
		return -ENODEV;
	}
    ...
}

If one port on a multi-port LPM LPAIF (such as lpass-aud-lpaif) is listed
in DT and a sibling port on the same LPAIF relies on the default SD-line
configuration without a child node, the sibling port still probes and
is_lpm_mi2s_port() returns true, but lpass_platform_allocate_lpm() skips it
and leaves drvdata->mi2s_lpm_offset[port_id] at 0, aliasing the buffer of
whichever DAI was allocated at offset 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-topic-sm86=
50-el2-v2-0-174e159f0f69@linaro.org?part=3D15
