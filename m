Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681138;
	b=GJLyUiD+fzqmmqifa2nKCs2vAMA6VpeZQ4iAx6qQRdnRjdW1WloabddF2ToEHKuiPqDf
	 Hr5uSGlxcLYXwYcyUJwdaKUAJ/iDkpKfgAjG9TehmAWp/u7pqwZHQUVzrk8d+4FvxpyR8
	 drm0kdJaEEfmiz/p2iWSN2yKUCYX+h34YHS93CUG1SmZ9MskkBBGrPKLkv6IZ5Yw1tHuU
	 xlzs64MWjXoLQAOt2JyA2MghsMrONekkyQ1nXRPx6JqN6t5yEMLSYbJOO5XQ7CA2Zg6HE
	 NzhxZpy6pLqzyfxIGMRWgJkqt7T5x2+vVEbpRMmJsa6me8vWoMfkKnKWg+WwRbZ5xVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681138;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=8q3ym2FjEbcaF/NkA2AID4Efpmn3bECd2JooSGvuBmU=;
	b=IAoEm5pcMDdwgs+PbG/34xSATlYhijU8Z8aoxgTKO4qh4sd5qif1Nv1vnaSy1ztV4Ke8
	 rz9JZyyo/6JTg8RlG60tgNSdZZKZqkmIXc+bVYEZceKwiXlcFzC/0yoq8+igpLUqDCQvs
	 wBCalR8FhgNYOU/uWrOKObI4zBk3WrwbTsmzKmiVG7rTGsaQBaC1fU5/aSqOxQhErYWoK
	 aX0IbGL5zEw/8JMSDjWHOjRaaEM7Juq1izrifPUwf0MqO0z4rdkCr9++d76Wv47P6lwAB
	 9pI9gHPFWzHbRuYDRc12QA/+9m2R5E4f98YyAJrVW8+EWMSIginEh7INtg4AN9x33xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCW8gRFk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03047606A31B
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZCW8gRFk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DF21F000C1;
	Thu, 22 Oct 2026 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792681137;
	bh=8q3ym2FjEbcaF/NkA2AID4Efpmn3bECd2JooSGvuBmU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZCW8gRFkMIZ7MjV243clFVrd4tIuagpJwh18OokpUZWDaYrmC2DlOVYtOh8HeTg3T
	 aH+bXiy02FOgsW3w35gNBj2VHE9dLFuSYIgsHJdD22X7xn36FaZURZMIcp5Sj8wjeP
	 DAHQAbCgBNFsB1tvCzOZiOCqG/v2jZoHKX/DxNKcxM3uprCSqH7LK4MKWXSYCicjcb
	 SvaPzIXJQuFv1/AcLdDaPwmvNAL/jIYIC0NYQeF3mG87NTaqZAe19yGrOkT23barpB
	 04JONe6pMmp5UvBfjYPJYEiqAP84BuQHdcbdeBpvHyAB3LV6VLKEzgf1Vi4B5hGz5A
	 ECcFAsUi0wgfQ==
Message-ID: <sashiko-outbox-181665@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: apr: Publish GPR callback before client
 probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohit Sharma" <mohit.sharma@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
 <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 14:58:56 +0000
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
- [High] soc: qcom: apr: race with gpr_do_rx_callback() on apr_device_probe=
() failure
--

commit b8085aea7f4dfac0f85898613864891fa165e4b0
Author: Mohit Sharma <mohit.sharma@oss.qualcomm.com>

soc: qcom: apr: Publish GPR callback before client probe

This commit installs the service callback in apr_device_probe() before call=
ing
the client driver's probe function when the packet router type is GPR, so t=
hat
responses to commands sent during probe can be dispatched. If the client pr=
obe
fails, it clears the callback before returning the error.

> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index ea7f83916d8d8..829e5c8fdf984 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -365,13 +365,24 @@ static int apr_device_probe(struct device *dev)
>  {
>  	struct apr_device *adev =3D to_apr_device(dev);
>  	struct apr_driver *adrv =3D to_apr_driver(dev->driver);
> +	struct packet_router *apr =3D dev_get_drvdata(dev->parent);
>  	int ret;
> =20
> +	if (apr->type =3D=3D PR_TYPE_GPR)
> +		adev->svc.callback =3D adrv->gpr_callback;
> +
>  	ret =3D adrv->probe(adev);
> -	if (!ret)
> +	if (ret) {
> +		if (apr->type =3D=3D PR_TYPE_GPR)
> +			adev->svc.callback =3D NULL;
> +
> +		return ret;
> +	}

[Severity: High]
Can clearing adev->svc.callback on probe failure without synchronizing with
apr->rxwq race with an in-flight gpr_do_rx_callback() execution and cause a
use-after-free on devm-allocated driver data?

In drivers/soc/qcom/apr.c, apr_add_device() inserts &adev->svc into
apr->svcs_idr before calling device_register(&adev->dev). Once
apr_device_probe() sets adev->svc.callback =3D adrv->gpr_callback, incoming
packets for that port on apr->rxwq can invoke svc->callback via
gpr_do_rx_callback():

drivers/soc/qcom/apr.c:gpr_do_rx_callback() {
	spin_lock_irqsave(&gpr->svcs_lock, flags);
	svc =3D idr_find(&gpr->svcs_idr, hdr->dest_port);
	spin_unlock_irqrestore(&gpr->svcs_lock, flags);

	if (!svc) {
		dev_err(gpr->dev, "GPR: Port(%x) is not registered\n",
			hdr->dest_port);
		return -EINVAL;
	}

	if (svc->callback)
		svc->callback(&resp, svc->priv, 0);
}

During adrv->probe(adev), client drivers such as apm_probe() in
sound/soc/qcom/qdsp6/q6apm.c and prm_probe() in sound/soc/qcom/qdsp6/q6prm.c
allocate their private state with devm_kzalloc(), publish it via
dev_set_drvdata(), and can then fail or defer probe after sending commands =
or
while unsolicited packets arrive:

sound/soc/qcom/qdsp6/q6apm.c:apm_probe() {
	...
	dev_set_drvdata(dev, apm);
	g_apm =3D apm;

	q6apm_get_apm_state(apm);

	ret =3D snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
	if (ret < 0) {
		dev_err(dev, "failed to register q6apm: %d\n", ret);
		return ret;
	}

	ret =3D of_platform_populate(dev->of_node, NULL, NULL, dev);
	if (ret)
		snd_soc_unregister_component(dev);

	return ret;
}

sound/soc/qcom/qdsp6/q6prm.c:prm_probe() {
	...
	dev_set_drvdata(dev, cc);

	if (!q6apm_is_adsp_ready())
		return -EPROBE_DEFER;

	return devm_of_platform_populate(dev);
}

When adrv->probe(adev) returns an error, apr_device_probe() clears
adev->svc.callback =3D NULL with a plain store and returns immediately to
really_probe() -> device_unbind_cleanup(), which frees devres allocations
before clearing drvdata:

drivers/base/dd.c:device_unbind_cleanup() {
	devres_release_all(dev);
	arch_teardown_dma_ops(dev);
	kfree(dev->dma_range_map);
	dev->dma_range_map =3D NULL;
	device_set_driver(dev, NULL);
	dev_set_drvdata(dev, NULL);
}

If gpr_do_rx_callback() on apr->rxwq has already passed the svc->callback
check, could apm_callback() or prm_callback() concurrently dereference and
write to the freed struct q6apm or struct q6prm obtained from
dev_get_drvdata(&gdev->dev) (or hit a NULL function pointer dereference if
svc->callback is reloaded after the unlocked check in gpr_do_rx_callback())?

Should adev->svc.callback be updated with READ_ONCE()/WRITE_ONCE() (or under
lock) and apr->rxwq be flushed after clearing adev->svc.callback on the pro=
be
error path before returning?

> +
> +	if (apr->type !=3D PR_TYPE_GPR)
>  		adev->svc.callback =3D adrv->gpr_callback;
> =20
> -	return ret;
> +	return 0;
>  }
> =20
>  static void apr_device_remove(struct device *dev)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022144130.2443=
667-2-mohit.sharma@oss.qualcomm.com?part=3D2
