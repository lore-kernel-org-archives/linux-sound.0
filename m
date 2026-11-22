Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365461;
	b=XaFFrcBAc4gCwsqFT//bsq6OWErv3whYArK0Aqb9CaGwhrizOaMil5r2CE8Ha/3rwT8k
	 tK7G4hhfWJszTVPwXqoUadAY2MRISx3gi2KH8RJj/j/+7JyJc45T1q1vpSMh+BITbL6Ll
	 GuiQ/pnykjZrNO9LICxeWAgiIb9XYQmw8tAL6SCNaefkRZXAZMEoDWnl6KadSuuu8Edu/
	 pWnjLFsa38QrXSo9vMTe0cE33WmsmjOsP4vRgajXlqxU/mfN9um2lhcvjJvk5rBqBfijb
	 knsIZ4e5rAOsAXqt5PzzlygC/FJxtHtI6x5UpDvKpnOxEDv15StMLKTubpnfc70lSow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365461;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nY+jX+tTjVCxVX3DPZeOwp/3aFpE5Bnh/bsfQicddJg=;
	b=vlscj/uBYRZdTCXCchIlM/oYvaKxDmothTfoG9AWC4QkkacejmZA1x9hW4fjqphTFUSe
	 rqHfQnhZWa2yN8U5WmEKDWkLXhT7Yd8DmteE64kcT6R8P+ifjJuHP29l0pqOzM27k+Adu
	 KVv5qjQ89DUYZO1pPpZpbS2Xb8AiQlDVFVh1L6g+Wzr/qlbAFInXcxPYtkznUu1zZj/fu
	 GUrFgO6UHDryEyygDUb2cdx5NdXI2BCTlby8GaUIjBWYxn9ozdPZS2M6csC+8g/3hDO5y
	 Y4MuI8ShnNdQB/i0NCympy67MNU8A7wqMEO/sbXgBB/WX1RLjA+Gqz2j92JKl1kRDHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+VI7Dtf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D522606A320;
	Sun, 22 Nov 2026 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G+VI7Dtf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80611F000C6;
	Sun, 22 Nov 2026 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365461;
	bh=nY+jX+tTjVCxVX3DPZeOwp/3aFpE5Bnh/bsfQicddJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G+VI7DtfLEDhbK7D4NtuLEc0RErYrwbeXxPBmkNHYqfvWVCpwXHC4gG8izlUB/x/L
	 n9RAlyktv6z+Io1Xj+Ckeupv6wjwCapj2vzjDCFIpltKN8HSgjcI5eB14xB9ULavDP
	 1vWY7zs+PfyDP3ICK2PXP86cdoSA4k7ZMF4fnuTav/PvqcIMT5HzEHG1+WkWoMFhn8
	 El6DL5166wh5kKhurkUEkUEhN0BcVDVmXpeukLwZ8fhk8bgEEHGYy0mutnPA7pcLV5
	 fZAGTMPwrXeKLmwgejG8h96Cy2MUOOnHafZUR6FX+uFCc4p827nUZGUgiKJ2yDWIG4
	 mw6GtaRq4qjGQ==
Message-ID: <sashiko-outbox-228110@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/24] ASoC: qcom: audioreach: add speaker protection
 calibration state control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-20-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-20-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:37:40 +0000
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
- [Medium] ASoC: qcom: audioreach: early return in
  audioreach_vi_calibration_abort()
- [Medium] ASoC: qcom: audioreach: uncanceled sp_cal_watchdog work on
  module removal
- [Medium] ASoC: qcom: audioreach: unsynchronized sp_operation_mode
  reads across sleep
- [Low] ASoC: qcom: audioreach: commit message omits calibrate control
  and abort logic
- [Low] ASoC: qcom: mode reset before cancel in
  audioreach_sp_finish_calibration()
--

commit e3b1c2c58754c22248379e200349ec50156d0cf4
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

> ASoC: qcom: audioreach: add speaker protection calibration state control
>
> Add a read-only "Speaker Protection Calibration State" control with
> each speaker's last calibration state, so userspace can follow a run.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

[Severity: Low]
This isn't a bug, but the commit title and message only mention adding the
read-only "Speaker Protection Calibration State" control.  Should the
changelog also describe the "Speaker Protection Calibrate" trigger control
and the VI calibration abort handling on graph stop and close added in
this patch?

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index 2bb56933b9de4..f1e454062ece3 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c

[ ... ]

> @@ -1805,6 +1825,46 @@ void audioreach_vi_calibration_event(struct device=
 *dev,
>  	audioreach_sp_finish_calibration();
>  }
> =20
> +/* A run cut short never reports a final state, close it out */
> +void audioreach_vi_calibration_abort(struct device *dev)
> +{
> +	unsigned int i;
> +
> +	guard(mutex)(&sp_vi_r0_lock);
> +
> +	if (!sp_vi_r0.armed)
> +		return;
> +
> +	sp_vi_r0.armed =3D false;
> +
> +	/* The DSP never reported on this run: keep the previous result */
> +	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))
> +		return;

[Severity: Medium]
Does returning here skip audioreach_sp_finish_calibration() when a run is
aborted before the DSP sends any event?

When a graph is closed without ever starting (as noted in
q6apm_graph_close()) or stopped before the first calibration event
arrives, sp_vi_r0.seen_states is still all zeros.  Returning early leaves
sp_operation_mode stuck in PARAM_ID_SP_VI_OP_MODE_CALIBRATION and
sp_cal_watchdog pending for 60 seconds, so retries of "Speaker Protection
Calibrate" fail with -EBUSY and any normal playback started during that
window configures the DSP in Calibration mode instead of Normal mode.

> +
> +	sp_vi_r0.state =3D SP_VI_CALI_ABORTED;
> +
> +	for (i =3D 0; i < MAX_SP_VI_SPEAKERS; i++) {
> +		u32 state =3D sp_vi_r0.last_state[i];
> +
> +		/* Slot never reported: not part of this run */
> +		if (!sp_vi_r0.seen_states[i])
> +			continue;
> +
> +		if (sp_vi_cali_state_is_terminal(state))
> +			continue;
> +
> +		dev_info(dev, "VI calibration channel %u: aborted while %s\n",
> +			 i, sp_vi_cali_state_name(state));
> +		sp_vi_r0.last_state[i] =3D VI_CALIBRATION_STATE_INACTIVE;
> +	}
> +
> +	dev_info(dev, "VI calibration aborted: graph stopped before the DSP fin=
ished\n");
> +
> +	/* Edge-triggered: the mode auto-returns to Normal on abort too. */
> +	audioreach_sp_finish_calibration();
> +}
> +EXPORT_SYMBOL_GPL(audioreach_vi_calibration_abort);

[Severity: Low]
Can audioreach_sp_finish_calibration() cancel a newly scheduled watchdog
if userspace triggers another calibration run concurrently?

sound/soc/qcom/qdsp6/audioreach.c:audioreach_sp_finish_calibration() {
	WRITE_ONCE(sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_NORMAL);
	cancel_delayed_work(&sp_cal_watchdog);
}

CPU0                                  CPU1
audioreach_sp_finish_calibration()
  WRITE_ONCE(sp_operation_mode,
             ..._NORMAL)
                                      audioreach_put_sp_calibrate()
                                        audioreach_trigger_sp_calibration()
                                          cmpxchg(&sp_operation_mode, ...)
                                          schedule_delayed_work(&sp_cal_wat=
chdog, ...)
  cancel_delayed_work(&sp_cal_watchdog)  <-- cancels new run's watchdog

Also, because cancel_delayed_work() is non-synchronous, an already running
audioreach_sp_cal_watchdog_fn() from the finishing run can execute its
cmpxchg() after CPU1 re-arms calibration and reset sp_operation_mode back
to Normal.  Calling cancel_delayed_work_sync(&sp_cal_watchdog) before
resetting sp_operation_mode avoids both races.

> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topol=
ogy.c
> index 0e28c68c735d2..a19efbb889a8e 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1548,6 +1548,45 @@ static int audioreach_get_sp_t0(struct snd_kcontro=
l *kcontrol,

[ ... ]

> +static int audioreach_put_sp_calibrate(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	if (!ucontrol->value.integer.value[0])
> +		return 0;
> +
> +	return audioreach_trigger_sp_calibration() ? : 1;
> +}

[Severity: Medium]
Can sp_cal_watchdog fire after snd-q6apm is unloaded?

audioreach_put_sp_calibrate() exposes audioreach_trigger_sp_calibration()
to userspace, which schedules the static 60-second sp_cal_watchdog delayed
work.  Neither apm_remove() nor q6apm_audio_remove() cancels
sp_cal_watchdog with cancel_delayed_work_sync(), so unbinding the driver
and unloading snd-q6apm while the watchdog is pending leaves the timer
queued in unmapped module memory and causes a use-after-free crash when it
fires.

> +
>  static const struct snd_kcontrol_new audioreach_sp_telemetry_controls[] =
=3D {

[ ... ]

> +	{
> +		/*
> +		 * Write-only edge trigger.  Writing 1 arms a calibration run
> +		 * for the next (or current) WSA playback graph; the mode
> +		 * returns to Normal on its own once the DSP reports terminal
> +		 * state, on graph abort, or on the watchdog timeout.
> +		 */
> +		.iface	=3D SNDRV_CTL_ELEM_IFACE_MIXER,
> +		.name	=3D "Speaker Protection Calibrate",
> +		.access	=3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
> +			  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
> +		.info	=3D audioreach_info_sp_calibrate,
> +		.get	=3D audioreach_get_sp_calibrate,
> +		.put	=3D audioreach_put_sp_calibrate,
> +	},
>  };

[Severity: Medium]
Can concurrent changes to sp_operation_mode while a graph is being
prepared send an inconsistent configuration to the DSP?

With "Speaker Protection Calibrate" and audioreach_vi_calibration_abort()
now able to flip sp_operation_mode at runtime without serialization
against q6apm_graph_media_format_pcm(), sp_operation_mode can change while
GPR commands sleep:

sound/soc/qcom/qdsp6/audioreach.c:audioreach_speaker_protection_vi() {
	u32 mode =3D READ_ONCE(sp_operation_mode);
    ...
	op_cfg->cfg.operation_mode =3D mode;
    ...
	rc =3D q6apm_send_cmd_sync(graph->apm, pkt, 0);
    ...
	if (sp_operation_mode =3D=3D PARAM_ID_SP_VI_OP_MODE_NORMAL) {

audioreach_speaker_protection_vi() snapshots sp_operation_mode into mode
for event registration and PARAM_ID_SP_VI_OP_MODE_CFG, but re-reads the
global sp_operation_mode after q6apm_send_cmd_sync() sleeps when deciding
whether to send PARAM_ID_SP_TH_VI_R0T0_CFG.  In addition,
audioreach_speaker_protection() and audioreach_speaker_protection_vi()
each read sp_operation_mode separately across sleeping GPR calls during
the same graph preparation, so a mode transition in between configures one
module in Normal mode and the other in Calibration mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D19
