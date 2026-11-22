Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365524;
	b=K2zRHvxKicAN+KF+IwwrY7ODSMR+6736wa+LzMgq9l9Xm/xpDbiw1nxibrH6gP9NypaP
	 DKzcKFTbyFC20wfyFO/JuANmv7tp5w93AabXGwvSuYVcBDWmh3F704XgwZv/Dftldpc6d
	 5UlUrKmwIFEPvyLcWA8ACbMZXo1snEv5qNmctnFNLFRMkDm+Uf4vMBNefdw6JANCFVCR2
	 uc9Ce/Gziy/GwzkyEsp64iEWf4bZk5shQ6O+/t7P2o3F0+b2HjvAyPe3mgz0FzBnOs8iB
	 jTj3MTX0tWRZNugWq2SRbvmif9PONd6FvBmUtcBRTGoIhkRfppPz6GnINxATt8q58BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365524;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/AumErtbyBiemkYLSMRwh2BVayLS1+3TTsaeE03p3MQ=;
	b=bnHkVyhBtnPN68bva4TGsOv36tlTlWZGD8/01/jsLkbZ2jbeVnLx5y+BXDgcpgVT2lGE
	 zvGCDkOSWcCFzZCSAlZyDuapy1wBe11h17jADJhdfHIu6cw288NetyRh6X5pmoFLfkYXf
	 JKZjINguuf+XMmM/Yfc0dmXnLm5fJHJcAOnV9J5kyChmX+FcSZRyqUfyxHwuxycts9vcF
	 jOny2X9Gn6Cbevi5v+rc9rhk2ATX4X61FdLBUB89rg0daWPAeBhUeElcUX4qyLZoRVVim
	 D6YTgetFW+7caVwwhyjAkm+usnPtntHReWgiUj5sg5n6KRgsrrwbYexLBx+x79hRkng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYbrsHHk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F22606A320;
	Sun, 22 Nov 2026 16:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EYbrsHHk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6D11F000CF;
	Sun, 22 Nov 2026 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365524;
	bh=/AumErtbyBiemkYLSMRwh2BVayLS1+3TTsaeE03p3MQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EYbrsHHku+82KO+UVlJ+koF0yw0nfm7VUcm1tfd7GEVg3+Ote1y6grjim+nD2P+hH
	 yGEHGo/OFiuvixHfOT4nuMqIRBdD7XOlsxela1a+RQC+AziOOa1UEM5GZ8Oyu+ZDTN
	 GUYEGkVXuGUyV3ofWdRIUjqcrYIZKfBn+ADOHfSs9KnGGCozoih/BQ+atLjcKsiYRq
	 fBX0I1ve5f4eVrRT19ofurYmKzGtrmJbJbqfF4OUSwpiXuIXZzKSfN4MuZgm1qfId4
	 L9Xgk6vAz9INrp/m7eEuQvxt6N0YNlbMvHWsRKLfdrAfDK4gjDq10wl7S4ZkqTT/JD
	 N7bqdN6hjZOHA==
Message-ID: <sashiko-outbox-228113@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/24] ASoC: qcom: sdw: add per-direction stream
 runtimes for multi_direction links
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-5-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:38:43 +0000
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
- [High] ASoC: qcom: sdw: dangling DAI stream pointers on stream release
- [High] ASoC: qcom: sdw: stream runtime leak in
  qcom_snd_sdw_setup_dir()
- [Medium] ASoC: qcom: sdw: missing direction check in
  qcom_snd_sdw_get_stream()
- [Low] ASoC: qcom: sdw: missing DAI ID check in qcom_snd_sdw_shutdown()
--

commit 68888aeca44192cad54581921c24aeb932a0fbd3
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links

This commit splits the SoundWire startup, prepare, hw_free, and shutdown
helpers into per-direction operations so that BE DAI links with
multi_direction_codecs allocate and manage a separate sdw_stream_runtime
for each direction.

> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
> index 6576b47a4c8c3..953a6eaae1272 100644
> --- a/sound/soc/qcom/sdw.c
> +++ b/sound/soc/qcom/sdw.c
> @@ -5,9 +5,55 @@
>  #include <dt-bindings/sound/qcom,lpass.h>
>  #include <dt-bindings/sound/qcom,q6afe.h>
>  #include <linux/module.h>
> +#include <linux/slab.h>
>  #include <sound/soc.h>
>  #include "sdw.h"
> =20
> +static struct sdw_stream_runtime *
> +qcom_snd_sdw_alloc_stream(const char *cpu_name, int dir)
> +{
> +	const char *suffix =3D (dir =3D=3D SNDRV_PCM_STREAM_PLAYBACK) ?
> +			     "Playback" : "Capture";
> +	struct sdw_stream_runtime *sr;
> +	char *name;
> +
> +	name =3D kasprintf(GFP_KERNEL, "%s-%s", cpu_name, suffix);
> +	if (!name)
> +		return NULL;
> +
> +	sr =3D sdw_alloc_stream(name, SDW_STREAM_PCM);
> +	if (!sr) {
> +		kfree(name);
> +		return NULL;
> +	}
> +	return sr;
> +}
> +
> +static void qcom_snd_sdw_release_stream(struct sdw_stream_runtime *sr)
> +{
> +	if (!sr)
> +		return;
> +	kfree(sr->name);
> +	sdw_release_stream(sr);
> +}

[Severity: High]
Does releasing sr without clearing the stream pointer on the codec DAIs
leave a dangling sdw_stream_runtime pointer behind?

qcom_snd_sdw_setup_dir() stores sruntime in each codec DAI via
snd_soc_dai_set_stream(codec_dai, sruntime, dir) (for example in
ctrl->sruntime[dai->id] in qcom_swrm_set_sdw_stream()).  When
qcom_snd_sdw_shutdown() or the error unwind in qcom_snd_sdw_setup_dir() and
qcom_snd_sdw_startup() calls qcom_snd_sdw_release_stream(), sr->name and sr
are freed without calling snd_soc_dai_set_stream(codec_dai, NULL, dir).

Because qcom_swrm_get_sdw_stream() still returns ctrl->sruntime[dai->id], a
subsequent sdw_find_dir_stream() call (such as when another DAI link
sharing the same SoundWire master DAI closes, or when a later startup on a
multi-master link fails before overwriting every DAI's stream pointer)
retrieves the freed pointer and passes it to qcom_snd_sdw_release_stream()
again, causing a use-after-free on sr->name and a double free of sr->name
and sr.

> +
> +static struct sdw_stream_runtime *
> +sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
> +{
> +	struct snd_soc_dai *codec_dai;
> +	struct sdw_stream_runtime *sr;
> +	int i;
> +
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		if (!snd_soc_dai_stream_valid(codec_dai, dir))
> +			continue;
> +		sr =3D snd_soc_dai_get_stream(codec_dai, dir);
> +		if (!IS_ERR(sr) && sr)
> +			return sr;
> +	}
> +	return NULL;
> +}

[Severity: Medium]
Should qcom_snd_sdw_get_stream() also use sdw_find_dir_stream()?

qcom_swrm_get_sdw_stream() ignores its direction argument and returns
ctrl->sruntime[dai->id]:

drivers/soundwire/qcom.c:qcom_swrm_get_sdw_stream() {
	struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(dai->dev);

	return ctrl->sruntime[dai->id];
}

Because qcom_snd_sdw_get_stream() still iterates over all codec DAIs
without checking snd_soc_dai_stream_valid(codec_dai, substream->stream),
calling it on a multi_direction_codecs link can return the opposite
direction's sdw_stream_runtime when an opposite-direction SoundWire master
DAI appears earlier in the link's codec list.

[ ... ]

> @@ -49,43 +95,42 @@ static bool qcom_snd_is_sdw_dai(int id)
>  	return false;
>  }
> =20
> +/*
> + * Allocate a stream runtime for one direction and set it on the codec D=
AIs
> + * of that direction.
> + */
> +static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd, int d=
ir)
> +{
> +	const char *cpu_name =3D snd_soc_rtd_to_cpu(rtd, 0)->name;
>  	struct sdw_stream_runtime *sruntime;
>  	struct snd_soc_dai *codec_dai;
> +	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
>  	u32 rx_ch_cnt =3D 0, tx_ch_cnt =3D 0;
>  	int ret, i, j;
> +	bool used =3D false;
> =20
> +	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		if (snd_soc_dai_stream_valid(codec_dai, dir)) {
> +			used =3D true;
> +			break;
> +		}
> +	}
> +	if (!used)
> +		return 0;
> =20
> +	sruntime =3D qcom_snd_sdw_alloc_stream(cpu_name, dir);
>  	if (!sruntime)
>  		return -ENOMEM;
> =20
>  	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		if (!snd_soc_dai_stream_valid(codec_dai, dir))
> +			continue;
> +
> +		ret =3D snd_soc_dai_set_stream(codec_dai, sruntime, dir);
>  		if (ret < 0 && ret !=3D -ENOTSUPP) {
>  			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name=
);
> +			goto err;
>  		} else if (ret =3D=3D -ENOTSUPP) {
>  			continue;
>  		}

[Severity: High]
Can qcom_snd_sdw_setup_dir() leak sruntime and sruntime->name when none of
the codec DAIs in dir implement SoundWire stream callbacks?

used is set whenever any codec DAI on the link is stream-valid for dir,
so qcom_snd_sdw_alloc_stream() allocates sruntime before checking whether
those DAIs support .set_stream and .get_stream.  On links where the CPU DAI
matches qcom_snd_is_sdw_dai() (such as TX_CODEC_DMA_TX_3 or SLIMBUS_0_TX)
but the codec DAIs in dir all return -ENOTSUPP (or do not implement
.get_stream), qcom_snd_sdw_setup_dir() succeeds without storing sruntime in
any retrievable DAI.  At shutdown, sdw_find_dir_stream() returns NULL and
both sruntime and sruntime->name are leaked on every PCM open/close cycle.

[ ... ]

> @@ -187,9 +289,13 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
> =20
>  void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
>  {
> -	struct sdw_stream_runtime *sruntime =3D qcom_snd_sdw_get_stream(substre=
am);
> +	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
> +
> +	qcom_snd_sdw_release_stream(sdw_find_dir_stream(rtd, substream->stream)=
);
> =20
> -	sdw_release_stream(sruntime);
> +	if (rtd->dai_link->multi_direction_codecs)
> +		qcom_snd_sdw_release_stream(
> +			sdw_find_dir_stream(rtd, substream->stream ^ 1));
>  }
>  EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);

[Severity: Low]
Should qcom_snd_sdw_shutdown() still check qcom_snd_is_sdw_dai(cpu_dai->id)
before looking up and releasing streams?

Previously, qcom_snd_sdw_shutdown() went through qcom_snd_sdw_get_stream(),
which returned NULL when !qcom_snd_is_sdw_dai(cpu_dai->id).  Without that
check, qcom_snd_sdw_shutdown() now queries snd_soc_dai_get_stream() across
codec DAIs on non-SoundWire BE links in machine drivers that share this
shutdown callback across all DAI links.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D4
