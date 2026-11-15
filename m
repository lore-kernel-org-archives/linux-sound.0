Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794713756;
	b=RW/pMnfFpYDVt1vgT1W9uAkrPyFnEmYqi1bR/HPG+5FpvyXJjJB09iMgonI9GErO8lTS
	 FGTEtlb4PTp1tiWGxzhoSBKLyzYUXCtAD7TNmZ818p1qYqSyGWMh/lM6fDj+Jv1312kLq
	 XeGKSo7yw/4f5vc5Ssz75nHjprd6+AAJxt1sQ4iGF38AYZBgw66+xDBijiAE9Ze2Soavd
	 QjiA7UuO76cgBSHTpk7R4Bb615EWpIJ1iorjLNUsarKZ2iDSAlASqeXNEvcQYCPdM1N1e
	 j2KR9tSRTkfnSSeVDx0n/73+BO7dKFljZyqFLGkDK6OSC7ZTZbbYDDMWHwyHdVAvrgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794713756;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jKlSId2IMbDND1zLxPKa4n/vS+9Oqdq7KJcFWCXjilY=;
	b=5m92jqYkKHoF0pZrKBpu6mYtN6dSQL5PKvti05T7pg3EudqVKZ1Zqe8VIwLPnYX3nhJr
	 BoRoeMODz/DDQpES3Q7LclFUccWPzLEHcVye0f0sTxKJ5j9f3uhsVDtB/XrCDT9OObPin
	 cF6i2WMTdn7H0HLokzvXcBNbKsWTNm64hzH1gIT3Mg/hVRQsGBypG8dwPJCn0u2A8nkhq
	 pg7GGeUBUlMOZmpcNhKiSxe0epQTYzEBlx86Rv73rVq3E43862R8oZbBlZcl83avOdZEK
	 h79+KPnnqnTPYZ0oHRqRXSG31S64Tj8Ii0S4qx88F0qwHoPcxxMQyBCIaslQTKS71UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDuIzK+j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442C0606A32E
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SDuIzK+j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B241F000C5;
	Sun, 15 Nov 2026 03:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794713756;
	bh=jKlSId2IMbDND1zLxPKa4n/vS+9Oqdq7KJcFWCXjilY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SDuIzK+jGZjF7sIrHk/bF5mmqmA7GuYfxPKCOPwqNWZxnkgYBTefqcXAggC4d3z2E
	 UdlulOmqF2hfqRN6MbKKV3Az13XmiKSAq+hj/obXR0kEAlEXcP5E67nb4SZJAWMOpi
	 FSj8LZENSjzhAnQVY1wFumII6vSPYGbP56WmtdKfKLkUVdWOoat4Y9PlNWiC6yjwlL
	 5pBo1uRDeLKux0sUC4icYeVoTELKrY6B2lNTTHjaJfXjasWb9GcyRePQh4sHkLS77C
	 BntbTpSvRCk0IPlmeBom5ir3wIf3e7eNEl6V0kN8nqi5H7nLTe/Di8+E05qgDnx9yy
	 72OfQyeUBAyhg==
Message-ID: <sashiko-outbox-215203@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ASoC: qcom: q6prm: Keep the clock controller across
 DSP restarts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261115032027.414953-4-shengchao.guo@oss.qualcomm.com>
References: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
 <20261115032027.414953-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 03:35:55 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ASoC: qcom: q6prm: clock restore in prm_probe() times out
  before callback setup
--

commit 02c1625331bd9fcb6147637d9b08efb05abcc888
Author: Shawn Guo <shengchao.guo@oss.qualcomm.com>

ASoC: qcom: q6prm: Keep the clock controller across DSP restarts

This commit keeps the q6prm LPASS clock controller platform device alive
across DSP restarts and restores prepared clocks when the q6prm GPR device
probes again.

> diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
> index 73b5a96e83119..861d48bdb5eaf 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.c
> +++ b/sound/soc/qcom/qdsp6/q6prm.c
[ ... ]
> @@ -230,7 +350,29 @@ static int prm_probe(gpr_device_t *gdev)
>  	if (!q6apm_is_adsp_ready())
>  		return -EPROBE_DEFER;
> =20
> -	return devm_of_platform_populate(dev);
> +	ret =3D q6prm_clkctl_attach(cc);
> +	if (ret)
> +		return ret;
> +
> +	if (cc->clkctl)
> +		q6dsp_clock_dsp_up(&cc->clkctl->pdev->dev);
> +
> +	return 0;
> +}

[Severity: High]
Will q6dsp_clock_dsp_up() always time out when restoring lost clocks inside
prm_probe()?

apr_device_probe() only installs adrv->gpr_callback into adev->svc.callback
after adrv->probe() returns 0:

drivers/soc/qcom/apr.c:apr_device_probe() {
    ...
	ret =3D adrv->probe(adev);
	if (!ret)
		adev->svc.callback =3D adrv->gpr_callback;
    ...
}

When q6dsp_clock_dsp_up() sends PRM_CMD_REQUEST_HW_RSC via
q6prm_send_cmd_sync() -> audioreach_send_cmd_sync() and waits on prm->wait,
gdev->svc.callback is still NULL, so gpr_do_rx_callback() drops the DSP
response without calling prm_callback(). Every lost clock waits 5 seconds
and fails with -ETIMEDOUT, leaving clk->lost set. The same happens if a
consumer requests a clock after q6prm_clkctl_attach() sets ctl->prm and
calls of_platform_device_create() before prm_probe() returns.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115032027.4149=
53-1-shengchao.guo@oss.qualcomm.com?part=3D3
