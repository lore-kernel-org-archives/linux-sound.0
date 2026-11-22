Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364935;
	b=fUId8WnkPy7ZpX+txaZwcowEwtcyugP/e9eWEKVr3yNF5Jm5YKv52OQlCn8uVWACreUN
	 6D4XzNSBIaNtlHvtnMI7tejbAFhYeHo/uED6o1oAxXLS725xN9ie/VA+eViv+xiJAK4sN
	 uL3EIfKkRz0l1tKcQ65hO7i61lF89fmm2mchU/1lj7WX25tu8Mz4OJaaR8VNB+ldh0Agg
	 IpqWwdYvZtqWCk4ln68IxwNpjm3FpomouK8upHFxELgBOSk0VjadSTarLIlNsAelm97XK
	 FUCWff7I5ZHmxkWwSuufBHkE2SsdP1/ErFtvxQHHnEb5CN7mu7XyuZkAheJhNDBOG1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364935;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HejxjeR6y1AWUeMKdtQ38eSl5qYCvf2sETxJ5unCVbY=;
	b=sUmQolTO781jrpyPef4IHcvdTa5XIfk3m9IBWfmb74Ps7eF6LXTS+xHMABhrHIi7n/A1
	 FMf5H0EdqmDY0zUXiSF1b4ot5sDHMEjkqZpEFaWjhNdKdE2tKbcNqBU1zgSspn5Bk4Ka5
	 Bddy7/AtQzUvH9y2KklfFMDbZzzG9bwdbRRDG7j2jXEp+vdMdBA8+p2ebEkIATqEqEgTu
	 SKSFObQikV/7fiiPnPXZ5ea3TUT0X4Rh2ukbYtyVFk2plvQsNNyZxIM7CnIRZ6juY72oG
	 r9KI4uT+MJwNLwjaD+YmVucbkRdsJLkeU+HaBJk6P8zVqqVPwXWYCifAskGbwKtmMyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UWXAB5++;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F78A606A320;
	Sun, 22 Nov 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UWXAB5++
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3411F000C4;
	Sun, 22 Nov 2026 16:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364935;
	bh=HejxjeR6y1AWUeMKdtQ38eSl5qYCvf2sETxJ5unCVbY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UWXAB5++djcbFtJPmWcMmyca6ETgAM66I92CctNus4/clV3MuUcvaEAZp90LZb5+W
	 0hH5YGMa6+YHUG6qoQGByGM5wP2ZdI5zQdwsyO/Gz+qgtlI36lIAH+jy3FV+EQUhMg
	 nNd0heXvT1GPx51BRRgHXY3HKffl349fNSDFCB+ooJZA4dVmRWE3wjeoG9VEpbuzZ3
	 gfDPs5PZo/pMT8pYsPtd2nxc7cDwph2y20nNjlyekg9Qwfa2LXNZAGzTShxGJ0MxyL
	 2gvbYJv9q53NPTEDyFx2J70j8shOE11RwhtGVBhJJ90SLKfAy7xDIYFva5IIrJN6Le
	 ++pnwbEwUzTxw==
Message-ID: <sashiko-outbox-228101@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/24] ASoC: qcom: audioreach: send cached R0/T0 to
 the VI module in normal mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-15-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-15-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:28:54 +0000
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
- [Medium] ASoC: qcom: audioreach: inconsistent sp_operation_mode check
  in audioreach_speaker_protection_vi()
- [Medium] ASoC: qcom: audioreach: sp_vi_r0t0_cfg_lock held across
  q6apm_send_cmd_sync()
- [Low] ASoC: qcom: audioreach: zero-channel VI event wipes cached R0/T0
  config
--

commit ce72288538b86abb636ed31543702f6e5e7b7bc0
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: qcom: audioreach: send cached R0/T0 to the VI module in normal mode

This commit caches per-speaker R0 and T0 calibration values, provides
helpers to read and write them with range validation, and sends
PARAM_ID_SP_TH_VI_R0T0_CFG to the VI module when configuring a graph in
normal mode.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index 130298a287496..0701006278094 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c

[ ... ]

> @@ -1632,6 +1730,14 @@ void audioreach_vi_calibration_event(struct device=
 *dev,
>  			 i, r0_int, r0_frac, sp_vi_r0.r0_cali_q24[i]);
>  	}
> =20
> +	/* Only a run where every speaker succeeded gives a usable R0/T0 set */
> +	if (success) {
> +		guard(mutex)(&sp_vi_r0t0_cfg_lock);
> +		sp_vi_r0t0_cfg.num_ch =3D num_ch;
> +		for (i =3D 0; i < num_ch; i++)
> +			sp_vi_r0t0_cfg.r0_cali_q24[i] =3D cali->cali_param[i].r0_cali_q24;
> +	}

[Severity: Low]
Can a zero-channel EVENT_ID_VI_PER_SPKR_CALIBRATION event wipe a previously
cached R0/T0 set?

q6apm_vi_calibration_event() accepts payloads with zero cali_param entries
or cali->num_ch =3D=3D 0 and passes num_ch =3D=3D 0 here.  Because the per-=
channel
loop does not run, decisive and success stay true, setting
sp_vi_r0t0_cfg.num_ch to 0.  audioreach_speaker_protection_vi() treats
sp_vi_r0t0_cfg.num_ch =3D=3D 0 as unconfigured and silently skips sending
PARAM_ID_SP_TH_VI_R0T0_CFG on subsequent normal-mode playback.

> @@ -1776,6 +1882,70 @@ static int audioreach_speaker_protection_vi(struct=
 q6apm_graph *graph,
> =20
>  	kfree(pkt);
> =20
> +	if (rc)
> +		return rc;
> +
> +	if (sp_operation_mode =3D=3D PARAM_ID_SP_VI_OP_MODE_NORMAL) {

[Severity: Medium]
Should this check the local mode snapshot instead of re-reading
sp_operation_mode?

audioreach_speaker_protection_vi() snapshots mode =3D
READ_ONCE(sp_operation_mode) at entry and sends op_cfg->cfg.operation_mode
=3D mode in the first q6apm_send_cmd_sync() call.  If sp_operation_mode
changes while that IPC blocks (for example via
audioreach_trigger_sp_calibration() or the calibration watchdog), this
second step disagrees with the mode just programmed on the DSP: a module
configured for Normal mode can be left without PARAM_ID_SP_TH_VI_R0T0_CFG,
or a module configured for Calibration mode can be sent Normal-mode R0/T0
configuration.

> +		struct apm_module_sp_th_vi_r0t0_cfg *r0t0_cfg;
> +		int r0t0_sz;
> +
> +		guard(mutex)(&sp_vi_r0t0_cfg_lock);
> +
> +		if (!sp_vi_r0t0_cfg.num_ch)
> +			return 0;
> +
> +		if (sp_vi_r0t0_cfg.num_ch !=3D num_speakers) {
> +			dev_err(graph->dev,
> +				"SP R0T0 is for %u speakers, graph has %u\n",
> +				sp_vi_r0t0_cfg.num_ch, num_speakers);
> +			return -EINVAL;
> +		}
> +
> +		r0t0_sz =3D APM_SP_TH_VI_R0T0_CFG_PSIZE(sp_vi_r0t0_cfg.num_ch);
> +		pkt =3D audioreach_alloc_apm_cmd_pkt(r0t0_sz, APM_CMD_SET_CFG, 0);
> +		if (IS_ERR(pkt))
> +			return PTR_ERR(pkt);
> +
> +		p =3D (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +		r0t0_cfg =3D p;
> +		param_data =3D &r0t0_cfg->param_data;
> +		param_data->module_instance_id =3D module->instance_id;
> +		param_data->error_code =3D 0;
> +		param_data->param_id =3D PARAM_ID_SP_TH_VI_R0T0_CFG;
> +		param_data->param_size =3D r0t0_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +		r0t0_cfg->cfg.num_ch =3D sp_vi_r0t0_cfg.num_ch;
> +		for (i =3D 0; i < sp_vi_r0t0_cfg.num_ch; i++) {
> +			r0t0_cfg->cfg.r0t0_cfg[i].r0_cali_q24 =3D sp_vi_r0t0_cfg.r0_cali_q24[=
i];
> +			r0t0_cfg->cfg.r0t0_cfg[i].t0_cali_q6 =3D sp_vi_r0t0_cfg.t0_cali_q6[i];
> +			r0t0_cfg->cfg.r0t0_cfg[i].reserved =3D 0;
> +		}
> +
> +		rc =3D q6apm_send_cmd_sync(graph->apm, pkt, 0);

[Severity: Medium]
Can holding sp_vi_r0t0_cfg_lock across q6apm_send_cmd_sync() deadlock the
APR RX workqueue until the 5-second command timeout expires?

Both APM command responses (apm_callback()) and calibration events
(graph_callback() -> q6apm_vi_calibration_event() ->
audioreach_vi_calibration_event()) are dispatched sequentially on the
single-threaded apr->rxwq workqueue:

CPU0                                  apr->rxwq
audioreach_speaker_protection_vi()
  mutex_lock(&sp_vi_r0t0_cfg_lock)
  q6apm_send_cmd_sync()
    wait_event_timeout(apm->wait, ...)
                                      apr_rxwq()
                                        ...
                                        audioreach_vi_calibration_event()
                                          mutex_lock(&sp_vi_r0t0_cfg_lock)
                                          <-- blocks apr->rxwq; apm_callbac=
k()
                                              cannot run to wake apm->wait

If a decisive calibration event arrives ahead of the APM_CMD_SET_CFG
response (for example after the calibration watchdog resets
sp_operation_mode to Normal while calibration is still armed),
q6apm_send_cmd_sync() times out with -ETIMEDOUT.  Snapshotting
sp_vi_r0t0_cfg under sp_vi_r0t0_cfg_lock before sending the packet avoids
holding the lock across the blocking IPC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D14
