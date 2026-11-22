Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364554;
	b=zre0/tjg72gzkOz1TTZh4CNPiTRvjeqYJgEjlQaHbuJyL+r2z4QBn57sjY9DDufvMfbA
	 9GcVmYrvErBdznWYqwjIYqfujUKrsZMnMJL6J0n7csOOCKywyutnI052SiW9+NdQOdaJ3
	 rJCA4a8FWbFY1t3aSpj/U40p8VPVEmsgEP5zSo96HpJffYsPY3VJ8pgYX5OeOLktV3Yly
	 J51frnclF+FoNpBCoxzPjNVFHyt7f+0veTKbYj7b7pjhgSyBTo2H5NdvxzQs/tIvF1vCx
	 HB/YRLK9GqjriMeYwbxUEWbOd2vK5TWXK9pRnbpf3n3gErUK+wnCfQSdi3R4hxZTLXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364554;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fCyjOOtWXDJ5XOALM5QGNepLBYeDVlP8VYNW5iLHW1k=;
	b=HT8goqr3ABRE9F5koU6MN+T8+dXtaB5+gfNpQfHJJ1meanGaWV8jJYyOryq+Ukv35GiD
	 wu6x7kq6GM3w6r4MMzrYCpLbXNmclrD5cledaQZRu5hkBtpyY9+l+l4dCWkvIdBqqhSw1
	 QnzED3cPOqhs1SV5mPjnEZzADkWvYtxSB/Ov/E2dMSNMiq/5LPCNtF2pFbeFVhkVuX9/8
	 cLJw+Cf95NkU0zxnYfKIgWC2XUKIwYW5uvwsIMUV4qo4hHgXdUlVSGAybF+qvVYrjQ/2x
	 ljb3kVAuARpQAgUi2GsSSY7SSNt+KTmW4CVWGRTyL2nAicPxvStHTW52/5My2NHh7pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVo8Rt6z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B2606A320;
	Sun, 22 Nov 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVo8Rt6z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22491F000C4;
	Sun, 22 Nov 2026 16:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795364554;
	bh=fCyjOOtWXDJ5XOALM5QGNepLBYeDVlP8VYNW5iLHW1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVo8Rt6zVE43vBSFN+oHYa7oe6bZzTWftWo3scC9gtzz0u7FFqXFILiOX1ejYs60I
	 zrrJ1AksVHD79O7Zsw+8JO3ATkvKmOt96fCZztqab/i5000HlQA9SLzS/sZU4RhGwq
	 mDgzxcHPCKtl9GN1WJGKECcWzCmmD1drGHX/xto4pgzPXsrsHWfo5GG14g7k1io3NF
	 ii8kbMciciKk6iReVtZXv8zI0L0vCz7xyUJlwIliXNuAiMFm4LS0Kf+xisDonmvi1g
	 9s3emfv7ZRKg3fTJAEBMjWbrhKOLbSjUihFVmxiCuJu7rTSmnmBlBAZoGAVAE7zsrn
	 tTXUu//cRSxVA==
Message-ID: <sashiko-outbox-228094@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/24] ASoC: qcom: audioreach: cache VI calibration
 results per speaker
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-13-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-13-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:22:33 +0000
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
- [Medium] ASoC: qcom: false success on num_ch =3D=3D 0 in
  audioreach_vi_calibration_event()
- [Low] ASoC: qcom: negative Q24 misformatting in
  sp_vi_q24_to_int_frac()
--

commit cfc96c13af943af3459ead6b6b605460ffdd651e
Author: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

ASoC: qcom: audioreach: cache VI calibration results per speaker

This commit adds a mutex-protected per-speaker cache for VI calibration
events to log state transitions once per speaker and store measured R0
values when calibration completes.

> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/aud=
ioreach.c
> index fbb9e3c4b84ae..2b5c083b8ae56 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c

[ ... ]

> @@ -1462,16 +1482,112 @@ static int audioreach_gain_set(struct q6apm_grap=
h *graph,
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }

[ ... ]

> +static int sp_vi_q24_to_int_frac(s32 val, int *frac)
> +{
> +	*frac =3D (int)(((s64)(val & 0xffffff) * 1000) >> 24);
> +
> +	return val >> 24;
> +}

[Severity: Low]
Does sp_vi_q24_to_int_frac() misformat negative Q24 values when an
out-of-range negative R0 is logged?  Because val is signed, val >> 24
floors toward negative infinity and val & 0xffffff extracts the positive
two's-complement offset above that floor, so -0.25 ohms (-4194304) prints
as -1.750 ohms instead of -0.250 ohms.

>  void audioreach_vi_calibration_event(struct device *dev,
>  				     const struct event_id_vi_per_spkr_calibration *cali,
>  				     u32 num_ch)
>  {
> +	bool decisive =3D true;
> +	bool success =3D true;
>  	unsigned int i;
> +	u32 bit;
> +
> +	guard(mutex)(&sp_vi_r0_lock);
> +
> +	if (!sp_vi_r0.armed)
> +		return;
> +
> +	/* First event of this run: drop the previous result */
> +	if (!memchr_inv(sp_vi_r0.seen_states, 0, sizeof(sp_vi_r0.seen_states)))=
 {
> +		sp_vi_r0.state =3D SP_VI_CALI_RUNNING;
> +		sp_vi_r0.num_ch =3D 0;
> +		memset(sp_vi_r0.r0_cali_q24, 0, sizeof(sp_vi_r0.r0_cali_q24));
> +	}
> +
> +	for (i =3D 0; i < num_ch; i++) {
>  		u32 state =3D cali->cali_param[i].state;
> =20
> -	/* Raised every frame; keep the per-event log at debug level */
> -	for (i =3D 0; i < num_ch; i++)
> -		dev_dbg(dev, "VI calibration channel %u: state %u\n",
> -			i, cali->cali_param[i].state);
> +		if (sp_vi_cali_state_is_failure(state))
> +			success =3D false;
> +		else if (!sp_vi_cali_state_is_terminal(state))
> +			decisive =3D false;
> +
> +		bit =3D BIT(min_t(u32, state, SP_VI_CALI_UNKNOWN_STATE_BIT));
> +		if (!(sp_vi_r0.seen_states[i] & bit)) {
> +			sp_vi_r0.seen_states[i] |=3D bit;
> +			dev_info(dev, "VI calibration channel %u: %s\n",
> +				 i, sp_vi_cali_state_name(state));
> +		}
> +	}
> +
> +	if (!decisive)
> +		return;
> +
> +	sp_vi_r0.armed =3D false;
> +	sp_vi_r0.state =3D success ? SP_VI_CALI_SUCCESS : SP_VI_CALI_FAILED;
> +	sp_vi_r0.num_ch =3D num_ch;

[Severity: Medium]
What happens if q6apm_vi_calibration_event() passes num_ch =3D=3D 0 (for
instance, if cali->num_ch is 0 or the event payload has no cali_param
entries)?  Because decisive and success start as true and the loop does
not run, audioreach_vi_calibration_event() wipes the previous cached
result, disarms sp_vi_r0.armed so later events are ignored, and records
SP_VI_CALI_SUCCESS with sp_vi_r0.num_ch =3D 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D12
