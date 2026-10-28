Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156727;
	b=huKkrQBQjmnjy85JAOHzEzg0mjlVjF1jVLp/T1i26ZjGl2s5QNjhyhhPDjvkcI1c+kKD
	 7d/Ag2IVDcYkfdY4trrpszZXFjl+2FZiAhcjUtbFb3kpT9bzqbny3h3ryqQ9M0VKfwpaW
	 jbbq5hVCIITmwPI3MmutVPV/kd/Rsz1gYbP9rh9Xw4Oyzm4QXzjmKk3EJwxU6EvFEg5hA
	 NNnvb+XJnCATLtfNKBZ9MVhseOTqKlEgvazfrCUSF9bu+0oSiX6PgGSSWC8E/++a264Sl
	 +1STemB/dwKjxJs0lXjcYTuTFhLo67skDcNNQRLMoMEpsV+DL0LIoUgZD/zA07PIHTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156727;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=F1w/DlYp9zB79SeBzMQrR/SA0AJD4tgLpvxbjGIqejo=;
	b=lX5hZ23Luu7aWvt4P6c/wl/AuSHSIjRc7Sxyt/TN12wsRF2kaxYCX9SEQ9ittWL9zvMy
	 sMADVQDRGRFV7sAz/D1CeD6Jwtfy6+Wgj8A4k6Dy1ohjhXy8/a6NXvR2pHY+7v2KLm9nu
	 Xe4qcKmzAwBgOGnWQX0mEGjul7Wk7rmxLWLh8w6koBdRoNSNBggezazS6y1DkAFVYLB79
	 rpHABg+4VdLZ+oqrU76vtATQsALEetWPWBJOF+4RmKh+5/dMWFOll+U5hYro+5TTBohgI
	 X4AFAvENgsvKk0/shSNSVMixdlshK2sN0fkRiwUKVhDV0A2Ee25/CsiKp2ku/lXUWPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDXC3BCf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62174606A338
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FDXC3BCf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081981F01828;
	Wed, 28 Oct 2026 03:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793156727;
	bh=F1w/DlYp9zB79SeBzMQrR/SA0AJD4tgLpvxbjGIqejo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FDXC3BCfSJem7gdzRoWdXACdgBHmaeDgUkeyR9V4gzU+eGOe0Jn8zhZ1EUIAz6z22
	 6iPFCAPMJxt9eoKJ7olJDo3IbeDGz5rpGVPEVHcEq7AqwBsvYy5+jKvn28Nu8konIt
	 8YScC8NTzyMeK+fEG00Ef7BseU2nHxGElz/wtzLdG27YxIwnrJCk5Bqu5n5kW1mWiS
	 kY9OGhAaXFcPDtd3W8VzctijZfRjfCEu/kRbYzdrVTWhGRr9BkKT11FfGVM5JW8TpB
	 5elzBaKDspd5988pIrEqip3c2DeuArkRiuKRAiaYvmEGRreGREMArYd7JySdvsisOs
	 9G5TSQr6cr9Zw==
Message-ID: <sashiko-outbox-187372@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM
 formats
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhangfei Gao" <zhangfei.gao@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 03:05:26 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: qcom: audioreach: 1-channel mapping changed from FL to FC =
by q6dsp_map_channels()
--

commit ec2c026fe429a34883e53d19ea1d90d34c838cea
Author: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>

ASoC: qcom: audioreach: support multichannel PCM formats

This commit removes the 4-channel limit in the AudioReach PCM and shared
memory media format paths and replaces audioreach_set_default_channel_mappi=
ng()
with q6dsp_map_channels() and PCM_MAX_NUM_CHANNEL.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index d2dc5d37bccf8..e6f077a5b750f 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uin=
t32_t opcode, uint32_t token
>  }
>  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
> =20
> -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
> -{
> -	if (num_channels =3D=3D 1) {
> -		ch_map[0] =3D  PCM_CHANNEL_FL;
> -	} else if (num_channels =3D=3D 2) {
> -		ch_map[0] =3D  PCM_CHANNEL_FL;
> -		ch_map[1] =3D  PCM_CHANNEL_FR;
> -	} else if (num_channels =3D=3D 4) {
> -		ch_map[0] =3D  PCM_CHANNEL_FL;
> -		ch_map[1] =3D  PCM_CHANNEL_FR;
> -		ch_map[2] =3D  PCM_CHANNEL_LS;
> -		ch_map[3] =3D  PCM_CHANNEL_RS;
> -	}
> -}
> -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> -

[ ... ]

> @@ -1436,7 +1410,7 @@ static int audioreach_speaker_protection_vi(struct =
q6apm_graph *graph,
> =20
>  	cm_cfg->cfg.num_channels =3D num_channels * 2;
>  	/* Convert the physical mapping to a logical mapping of the channels */
> -	for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_channels; =
i++) {
> +	for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < num_channels; i++=
) {
>  		if (!mcfg->channel_map[i])
>  			continue;
>  		/*

[Severity: Medium]
Does replacing audioreach_set_default_channel_mapping() with
q6dsp_map_channels() cause a regression for 1-channel streams?

Previously, audioreach_set_default_channel_mapping() mapped num_channels =
=3D=3D 1
to PCM_CHANNEL_FL (1). In sound/soc/qcom/qdsp6/q6dsp-common.c,
q6dsp_map_channels() instead maps 1 channel to PCM_CHANNEL_FC (3):

	switch (ch) {
	case 1:
		ch_map[0] =3D PCM_CHANNEL_FC;
		break;

When a 1-channel stream is configured through q6dma_hw_params() in
sound/soc/qcom/qdsp6/q6apm-lpass-dais.c or q6apm_dai_prepare() in
sound/soc/qcom/qdsp6/q6apm-dai.c, cfg->channel_map[0] is now set to
PCM_CHANNEL_FC (3) instead of PCM_CHANNEL_FL (1) for
audioreach_mfc_set_media_format(), audioreach_pcm_set_media_format(), and
audioreach_shmem_set_media_format().

In addition, audioreach_speaker_protection_vi() in
sound/soc/qcom/qdsp6/audioreach.c computes the Vsense and Isense channel
mapping as:

		/*
		 * Map speakers into Vsense and then Isense of each channel.
		 * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
		 * [1, 2, 3, 4]
		 */
		cm_cfg->cfg.channel_mapping[2 * j] =3D (mcfg->channel_map[i] - 1) * 2 + 1;
		cm_cfg->cfg.channel_mapping[2 * j + 1] =3D (mcfg->channel_map[i] - 1) * 2=
 + 2;

With mcfg->channel_map[0] set to PCM_CHANNEL_FC (3) on a 1-channel stream,
this produces [5, 6] instead of [1, 2]. Is PCM_CHANNEL_FC intentional for
mono AudioReach streams and speaker protection VI?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028024720.9819=
71-1-zhangfei.gao@oss.qualcomm.com?part=3D1
