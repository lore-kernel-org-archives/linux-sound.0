Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794714153;
	b=icscRTsFkMJ2nK+dWMQRc78PImGVYCHhdGbDcWEclAyXGhqh0O6bjPGNTGSGdhSgvzEX
	 0ciM7y/mrCnrFYXdgPFiVWKEVBD1ZrAwhoLzLuQ5PwnJxeujA2xVofiW8KG/n0nY6+D3a
	 aL2pfP2PwTPAYx1qcrIT214eZxxq/AKIwLfqsySniOu2n5lBgilsw216wmLfpOXfyX7Au
	 y/jhXFurlJuAuHd07l1Q4uBPnHCyg4DuVNIGpZuLIAL6UpqKJdEQYvVT0/hN1d3GByUlV
	 NnRikHkYNuWwRU7z9hfag8gSW8fk6vheHgAe76xZ91sonNwymGJ4/I2gLEJjlO6Z7Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794714153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1bC8lFxkgvjKqOyFUiC2Mz9ZRxZsr5zar2CJtw1T7cM=;
	b=alO12dct93L3T7MTJQyi7RdWQphLJjUVGBV8fMYLiFxUZnzEXH30hHUzReNAeOnESUlK
	 AwkdrXkLFWjKE/JV9LZYJDpBwK4wn7dkqyZEOcr92tr72WizsVxv7JKI/HvOh2ius6MGK
	 /Ore0bWHAQ6HV1mfctQ1uwX5HON32CgQ343YA/R+bRplBpCDYSF+EWCZTUuv6AQa1+pvj
	 hfWSTOh/eFTGjqvCZ+slLMy4ADcBTSyJkr8k2Cc6Vqx21XnPcTuqk96sLG5AkRN5jcvMx
	 wDp8TkCei0tN67LCYLBOu3QozBmZ37TRVj1bSvBCw3S2+nnw9hkRz+YdU72cEh8wgRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oe4Di+Bc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14090606A327
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oe4Di+Bc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC021F000C4;
	Sun, 15 Nov 2026 03:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794714152;
	bh=1bC8lFxkgvjKqOyFUiC2Mz9ZRxZsr5zar2CJtw1T7cM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oe4Di+BcyCpDICx4JyM1t3v8Cf/uAlOzzMyN2RyegkQtp/AF7iFNxwZge+dlx6eiB
	 xmOCr9gQEtSZaC+7YAJFHw9utpzE8dhUVgf/B3/xbLdatIK1WBgfwbk5bCQYfsi+0c
	 mKoHkGOoDyKr7wEPvTl0r3SOqT/sSi4+FlV6gwJ79rl6cSVTbaIdH1yX6OHO+DtDwc
	 RrHVE+QR2eb9zsUOc9cC2efhhUpjNUPq8Cevw/XQIhTqkWBWOpP/lxRe0snJWl4oxc
	 abvRUtKQQHh18q53RcJjbjHHljrmT1Mwstd8jF+3SaFmdmf7LdEhLrJJc8l8id/tGn
	 7EsQ7hXAIb6dA==
Message-ID: <sashiko-outbox-215205@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ASoC: qcom: q6apm: Wait for SPF to be ready before
 registering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261115032027.414953-2-shengchao.guo@oss.qualcomm.com>
References: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
 <20261115032027.414953-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 03:42:31 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: qcom: q6apm: unsynchronized state polling in
  q6apm_wait_spf_ready()
- [Low] ASoC: qcom: q6apm: missing Fixes trailer for apm_probe()
  readiness fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] ASoC: qdsp6: use-after-free in apm_probe() [1]
--

commit 57c0d12f224a6a066f01b2ff52ff14b9359892f8
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

> ASoC: qcom: q6apm: Wait for SPF to be ready before registering
>
> apm_probe() sends APM_CMD_GET_SPF_STATE once and ignores the result.
> At cold boot this is harmless: module loading and PDR lookup delay the
> probe by tens of milliseconds after the DSP is up, so SPF is listening
> by the time the command is sent.
>
> After an ADSP restart, everything is already loaded and PDR reports the
> audio PD up at once. The GPR service is added about 0.5 ms after the
> remoteproc reports the DSP up, and SPF drops a command sent that early
> without replying:
>
>   remoteproc remoteproc0: remote processor adsp is now up
>   qcom,apr ...: Adding APR/GPR dev: gprsvc:service:2:1
>   qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>
> Once the q6apm component is registered, a sound card whose other
> components are still bound can bind right away, inside apm_probe(), and
> issue APM_CMD_SHARED_MEM_MAP_REGIONS before SPF can handle it. The map
> times out and the card fails to come up:
>
>   qcom-apm gprsvc:service:2:1: CMD timeout for [100100c] opcode
>
> Poll GET_SPF_STATE before registering the component. Simply retrying
> q6apm_get_apm_state() is not enough: it goes through
> audioreach_send_cmd_sync(), whose 5 second timeout makes every dropped
> command stall the probe, and the card with it, for 5 seconds. Instead,
> send the command directly and wait only 100 ms for the reply, for up to
> 5 seconds in total, which is the worst case of the single command sent
> before. A timed out try is retried at once, while a "not ready" reply
> or a send failure backs off for 100 ms first. On Nord, SPF answers
> within 100-200 ms of the restart. If it still does not answer, warn and
> carry on as before rather than failing the probe.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

[Severity: Low]
Should this bug fix include a Fixes: tag for the commit that added the
unchecked q6apm_get_apm_state() call in apm_probe()?

  Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")

> diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
> index 4cb597d737b16..e7ba6bc931421 100644
> --- a/sound/soc/qcom/qdsp6/q6apm.c
> +++ b/sound/soc/qcom/qdsp6/q6apm.c

[ ... ]

> @@ -154,6 +156,47 @@ static int q6apm_get_apm_state(struct q6apm *apm)
>  	return apm->state;
>  }
> =20
> +/*
> + * Right after the DSP boots, the SPF drops commands without replying. P=
oll
> + * GET_SPF_STATE with a short timeout per try instead of the 5 s one of
> + * q6apm_send_cmd_sync(), so a dropped command does not stall the probe.
> + */
> +static bool q6apm_wait_spf_ready(struct q6apm *apm)
> +{
> +	unsigned long timeout =3D jiffies + msecs_to_jiffies(Q6APM_SPF_READY_MS=
);
> +	gpr_device_t *gdev =3D apm->gdev;
> +
> +	do {
> +		struct gpr_pkt *pkt __free(kfree) =3D
> +			audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0);
> +		long rc;
> +
> +		if (IS_ERR(pkt))
> +			return false;
> +
> +		pkt->hdr.dest_domain =3D audioreach_gpr_dest_domain(gdev);
> +
> +		mutex_lock(&apm->lock);
> +		apm->result.opcode =3D 0;
> +		apm->state =3D 0;
> +		rc =3D gpr_send_pkt(gdev, pkt);
> +		if (rc >=3D 0)
> +			rc =3D wait_event_timeout(apm->wait,
> +					apm->result.opcode =3D=3D APM_CMD_RSP_GET_SPF_STATE,
> +					msecs_to_jiffies(Q6APM_SPF_POLL_MS));
> +		mutex_unlock(&apm->lock);
> +
> +		if (apm->state)
> +			return true;

[Severity: Medium]
Can q6apm_wait_spf_ready() race with apm_callback() on apm->result.opcode
and apm->state?

sound/soc/qcom/qdsp6/q6apm.c:apm_callback() {
    ...
	case APM_CMD_RSP_GET_SPF_STATE:
		apm->result.opcode =3D hdr->opcode;
		apm->result.status =3D 0;
		/* First word of result it state */
		apm->state =3D result->opcode;
		wake_up(&apm->wait);
		break;
    ...
}

CPU0                              CPU1 (apr_rxwq)
q6apm_wait_spf_ready()
  wait_event_timeout() -> 0
  /* next iteration */
  mutex_lock(&apm->lock)
  apm->result.opcode =3D 0
                                  apm_callback()
                                    apm->result.opcode =3D
                                      APM_CMD_RSP_GET_SPF_STATE
                                    apm->state =3D 1
  apm->state =3D 0  <-- clobbers state
  gpr_send_pkt()
  wait_event_timeout()
    /* opcode already set */
  if (apm->state) /* 0 */

When a poll attempt times out just as a delayed reply arrives, the next
iteration can overwrite apm->state =3D 1 with 0 while leaving
apm->result.opcode set, or return true on the stale reply while the newly
sent APM_CMD_GET_SPF_STATE is still in flight to overwrite apm->result
during a later command.

Also, apm_callback() writes apm->result.opcode before apm->state without
a lock or barrier, so wait_event_timeout() can observe the opcode update
before apm->state is visible. Because apm_probe() sets g_apm =3D apm before
calling q6apm_wait_spf_ready(), resetting apm->state =3D 0 and reading it
outside apm->lock also races with concurrent q6apm_is_adsp_ready() calls.

[ ... ]

> @@ -906,7 +949,12 @@ static int apm_probe(gpr_device_t *gdev)
>  	dev_set_drvdata(dev, apm);
>  	g_apm =3D apm;
> =20
> -	q6apm_get_apm_state(apm);
> +	/*
> +	 * Once the component is registered a card can bind and send commands
> +	 * at once, so wait for the SPF first.
> +	 */
> +	if (!q6apm_wait_spf_ready(apm))
> +		dev_warn(dev, "SPF not ready\n");
> =20
>  	ret =3D snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0=
);
>  	if (ret < 0) {

[Severity: Critical]
This problem wasn't introduced by this patch, but can a failure in
snd_soc_register_component() or of_platform_populate() leave g_apm
pointing to freed memory [1]?

apm is allocated with devm_kzalloc_obj(), and g_apm =3D apm is set before
snd_soc_register_component() and of_platform_populate(). If either call
fails, devres frees apm while g_apm remains non-NULL, causing a
use-after-free when a later caller such as q6apm_is_adsp_ready()
dereferences g_apm.

[1] https://sashiko.dev/#/bug/linux-8f66e185-2dfb-43c1-bfaa-a2be8b96868d

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115032027.4149=
53-1-shengchao.guo@oss.qualcomm.com?part=3D1
