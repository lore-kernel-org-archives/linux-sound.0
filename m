Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365080;
	b=GrUtbsRiWhMmshhr5mY92PTyReQ4Uj785XYcOKBdMXzZ75GZ4NhkxAUUwS+glg2Kd9DY
	 DO2956s2hGWKKFrean/MQX1BlMbM2V0mgxB/AgevdWBf6KvHfTKDu4ToB6ONvZjCErwR/
	 5+c5hFXeB8rV9Me/pnWodFNjhGsH/oZp3tDSr1h9JXcbxiIcr1Sp57yqJUHo9cTBNFJSW
	 sfh/oJRjvdifeju8MXvndB05jyipljFEOdmNIx1S0rBP6WNu1/wl55o4onZdBhTtE2sm6
	 NyrBCr8GnZwKU+ExVCsWtmU74/g/a49QYw7M283DiMQncpLqlxvJlqKvgWtH86pqk9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365080;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6jpCgkKkFSN/ZNkXPQMfiPKVXOtah+iHNUTmZLDbgYw=;
	b=LwtEfWOGe9SKcFygMGlcvEkFaFFN4MjvenRTQojlQdQRU85P0ANUlunz14kZAK/n/QJu
	 PwnH1owQBHUNFILXxNt2n1N56QttXXeVWnd+dLM/6G2heztsKEZg1m2/i1uQty1m7dqhV
	 74ZWAhbxssV7K7ieUCc8wWWIDYdcEqS+sx1Dc7S7PgftM0c6Bu2PhrtxRtUcDSQdM52x9
	 pUGt/UXrsEHDiwFyw7bHVr59EbRB0BU+pNKGk5YePLLQ+ME+bYsDZPBlQm6sqEz2ayr+I
	 4L3C8lmc6CjD94CoJYdZT71U+sXldBm9R2dGO1uzqaOLLTMOHGHMzs/vrILGDVHitvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GYhkR/Sm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30778606A32A;
	Sun, 22 Nov 2026 16:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYhkR/Sm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2D01F000C4;
	Sun, 22 Nov 2026 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365080;
	bh=6jpCgkKkFSN/ZNkXPQMfiPKVXOtah+iHNUTmZLDbgYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GYhkR/SmcA2QyRN50+FS1/S6FVga+v1IqSQuZPQjdK8qM/l3NHkC0/qsbnFQmtIrY
	 avjA2GbYi3QLkZszRAF6BxKj+zCr/5OK52QoclsoI8sG95KNl9ESWBpDeW1bEavUH8
	 hC6l1JJx08WSLq1ybJk4SxWrpK3/KuPAoQ8KdDvCrckh6b92CO+smnG7CvnjO1Amvu
	 3TFzM8S7shpQ9sadpeTtIZpSuKfNS7noAQLB5NMsIyeyAWECtbdlxGSxzV2zuj5nu2
	 FbbqRNC8YjGUh29OTksOxKi97IW1PM1uwjmc0GLd7WrSpYTiBSOtfdjpgtRVdARZLW
	 kkLvq8UKFwMlA==
Message-ID: <sashiko-outbox-228103@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/24] ASoC: qcom: audioreach: add speaker protection
 calibration trigger infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-14-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-14-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:31:19 +0000
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
- [High] ASoC: qcom: audioreach: missing cancel_delayed_work_sync() on
  module unload
- [Medium] ASoC: qcom: audioreach: watchdog race in
  audioreach_sp_finish_calibration()
- [Medium] ASoC: qcom: audioreach: desynchronized calibration state on
  timeout or error
- [Medium] ASoC: qcom: audioreach: split sp_operation_mode read across
  SP and VI modules
--

commit 7fe6f8691f5f7dafda5123fc19c6776f167efe98
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: qcom: audioreach: add speaker protection calibration trigger infrastr=
ucture

This commit introduces an internal speaker protection operation mode state
and an edge-triggered calibration helper backed by a 60-second delayed-work
watchdog.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index 2b5c083b8ae56..130298a287496 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
[ ... ]
> @@ -1482,6 +1485,48 @@ static int audioreach_gain_set(struct q6apm_graph =
*graph,
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }
> =20
> +u32 audioreach_get_sp_operation_mode(void)
> +{
> +	return READ_ONCE(sp_operation_mode);
> +}
> +
> +/*
> + * Calibration is edge-triggered rather than a user-visible mode.  Guard
> + * against a trigger write while a run is still in flight, and bound the
> + * armed state with a watchdog so a trigger without a matching playback
> + * does not leave the system in Calibration forever.
> + */
> +#define SP_CAL_WATCHDOG_SECS	60
> +
> +static void audioreach_sp_cal_watchdog_fn(struct work_struct *work);
> +static DECLARE_DELAYED_WORK(sp_cal_watchdog, audioreach_sp_cal_watchdog_=
fn);
> +
> +static void audioreach_sp_cal_watchdog_fn(struct work_struct *work)
> +{
> +	if (cmpxchg(&sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_CALIBRATION,
> +		    PARAM_ID_SP_VI_OP_MODE_NORMAL) =3D=3D
> +	    PARAM_ID_SP_VI_OP_MODE_CALIBRATION)
> +		pr_info("audioreach: SP calibration watchdog fired, back to Normal\n");
> +}
> +
> +static void audioreach_sp_finish_calibration(void)
> +{
> +	WRITE_ONCE(sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_NORMAL);
> +	cancel_delayed_work(&sp_cal_watchdog);
> +}

[Severity: Medium]
Can audioreach_sp_finish_calibration() race with a new calibration trigger
or an already dequeued sp_cal_watchdog work item?

Because sp_operation_mode is reset to PARAM_ID_SP_VI_OP_MODE_NORMAL before
cancel_delayed_work(&sp_cal_watchdog) runs, a concurrent call to
audioreach_trigger_sp_calibration() can transition back to
PARAM_ID_SP_VI_OP_MODE_CALIBRATION in the window between the two lines:

CPU0                                     CPU1
audioreach_sp_finish_calibration()
  WRITE_ONCE(sp_operation_mode, ..._NORMAL)
                                         audioreach_trigger_sp_calibration()
                                           cmpxchg(...) -> ..._CALIBRATION
                                           schedule_delayed_work(&sp_cal_wa=
tchdog, ...)
  cancel_delayed_work(&sp_cal_watchdog)
    <-- cancels the new run's watchdog

If no playback completes after that, sp_operation_mode stays stuck in
PARAM_ID_SP_VI_OP_MODE_CALIBRATION with no pending watchdog, causing all
subsequent triggers to fail with -EBUSY.

Similarly, because cancel_delayed_work() is non-synchronous, an older run's
audioreach_sp_cal_watchdog_fn() that was just dequeued on another CPU can
execute its cmpxchg() after a new run has already been triggered, flipping
the new run prematurely back to PARAM_ID_SP_VI_OP_MODE_NORMAL.

> +
> +int audioreach_trigger_sp_calibration(void)
> +{
> +	if (cmpxchg(&sp_operation_mode, PARAM_ID_SP_VI_OP_MODE_NORMAL,
> +		    PARAM_ID_SP_VI_OP_MODE_CALIBRATION) !=3D
> +	    PARAM_ID_SP_VI_OP_MODE_NORMAL)
> +		return -EBUSY;
> +
> +	schedule_delayed_work(&sp_cal_watchdog,
> +			      SP_CAL_WATCHDOG_SECS * HZ);
> +	return 0;
> +}

[Severity: High]
Can unloading snd-q6apm while sp_cal_watchdog is pending cause a
use-after-free?

audioreach.o is linked into the tristate snd-q6apm module
(CONFIG_SND_SOC_QDSP6_APM), and audioreach_trigger_sp_calibration() queues
the static sp_cal_watchdog delayed work for 60 seconds.  Neither
apm_remove() nor any other teardown path calls
cancel_delayed_work_sync(&sp_cal_watchdog), so if the driver is unbound or
the module is unloaded while the timer is pending or the work callback is
running, the timer fires into freed module text and data.

> +
>  static bool sp_vi_cali_state_is_failure(u32 state)
>  {
>  	return state =3D=3D VI_CALIBRATION_STATE_FAILED ||
> @@ -1588,14 +1633,16 @@ void audioreach_vi_calibration_event(struct devic=
e *dev,
>  	}
> =20
>  	dev_info(dev, "VI calibration complete: %s\n", success ? "success" : "f=
ailed");
> +
> +	/* Edge-triggered: the mode auto-returns to Normal on terminal state. */
> +	audioreach_sp_finish_calibration();
>  }
> =20
>  static int audioreach_speaker_protection(struct q6apm_graph *graph,
> -					 const struct audioreach_module *module,
> -					 uint32_t operation_mode)
> +					 const struct audioreach_module *module)
>  {
>  	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
> -					 operation_mode);
> +					 READ_ONCE(sp_operation_mode));
>  }
> =20
>  static int audioreach_register_events(struct q6apm_graph *graph,
> @@ -1639,6 +1686,7 @@ static int audioreach_speaker_protection_vi(struct =
q6apm_graph *graph,
>  					    const struct audioreach_module *module,
>  					    const struct audioreach_module_config *mcfg)
>  {
> +	u32 mode =3D READ_ONCE(sp_operation_mode);

[Severity: Medium]
Can MODULE_ID_SPEAKER_PROTECTION and MODULE_ID_SPEAKER_PROTECTION_VI be
configured with different operation modes when sp_operation_mode changes
mid-prepare?

q6apm_graph_media_format_pcm() iterates over the modules in the graph and
sleeps in q6apm_send_cmd_sync() for each one.  Because
audioreach_speaker_protection() and audioreach_speaker_protection_vi() read
sp_operation_mode independently without a shared lock across graph
configuration, a concurrent audioreach_trigger_sp_calibration() call or
sp_cal_watchdog expiration between the two IPC calls configures one module
in Normal mode and the other in Calibration mode.  If VI is configured in
Calibration while SP was configured in Normal, the DSP reports
VI_CALIBRATION_STATE_INCORRECT_OP_MODE; if SP is configured in Calibration
while VI is configured in Normal, sp_vi_r0 is not armed and events are not
registered, leaving sp_operation_mode in Calibration until the watchdog
expires.

>  	u32 num_channels =3D mcfg->num_channels;
>  	struct apm_module_sp_vi_op_mode_cfg *op_cfg;
>  	struct apm_module_sp_vi_channel_map_cfg *cm_cfg;
> @@ -1662,11 +1710,13 @@ static int audioreach_speaker_protection_vi(struc=
t q6apm_graph *graph,
>  		return -EINVAL;
>  	}
> =20
> -	audioreach_arm_vi_calibration();
> +	if (mode =3D=3D PARAM_ID_SP_VI_OP_MODE_CALIBRATION) {
> +		audioreach_arm_vi_calibration();
> =20
> -	rc =3D audioreach_register_events(graph, module);
> -	if (rc)
> -		return rc;
> +		rc =3D audioreach_register_events(graph, module);
> +		if (rc)
> +			return rc;
> +	}

[Severity: Medium]
Does sp_vi_r0.armed stay desynchronized from sp_operation_mode when the
watchdog expires during an active run or when VI configuration fails?

When audioreach_sp_cal_watchdog_fn() fires 60 seconds after the trigger, it
flips sp_operation_mode back to PARAM_ID_SP_VI_OP_MODE_NORMAL without
acquiring sp_vi_r0_lock to clear sp_vi_r0.armed.  Because
audioreach_speaker_protection_vi() neither cancels nor extends
sp_cal_watchdog when a calibration playback starts, a stream that starts
near the end of the 60-second window (or takes longer than 60 seconds to
reach a decisive state) will have sp_operation_mode reset to Normal while
calibration is still armed and running.  A subsequent
audioreach_trigger_sp_calibration() call can then succeed instead of
returning -EBUSY, only to be clobbered when the first stream finishes and
calls audioreach_sp_finish_calibration().

In addition, audioreach_arm_vi_calibration() sets sp_vi_r0.armed =3D true
before audioreach_register_events(), audioreach_alloc_apm_cmd_pkt(), and
q6apm_send_cmd_sync(), so an error from any of those calls returns early
with sp_vi_r0.armed still set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D13
