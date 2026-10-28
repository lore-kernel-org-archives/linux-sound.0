Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793153414;
	b=NLTuoB9LfBoq51lXCXs2dJ9FCaC02ZnwfPvMQvQ7dA5KOrRjV3GjPsEEPcKwk5KSOJvY
	 Cvxr7wtlSVIlxTiHWMBPJJVDF1IOYDQvyIBqMa5nStVDTcpZrkgt3ao4hjqNI5+cpJktu
	 n9TmANDUeIOcOE5gafXZWZsPWFKpZvmvibaWmw8Brynbz6bw0IwrjaE9Yh5GJ9uTiT6zc
	 +wTEUviYmaNFJ1xBoQEc6pc4o3E5hazmZQhQtxdD4MVCVySLxA5X4PyORZod76/XYPcgb
	 a+DUBBfHel420M8LEqV/JGNecRiFisjboIPwO4Nrayl+Kb9SzdoQaJJzhBYJ+EtJrRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793153414;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2kVR0iXYwksgklT+jPJl/+o2aZSAIdgcpyydY2KWQgc=;
	b=hgoR34XkJz/SLUk5A4ECWwmC/UC6Sk12HEcHMZfBq/lBso5lPb9DDlj4Ctl7Gbj2brSM
	 A9JJdH7O2e0HX6aCODz1UcznxMh4DwdRDCC724hZEtK8tZFkiaHAmShZr+atmOGYQnFVY
	 1CBJqDQlksUfFOEJ0Cjl8gGd0+5D2lIkGJwElhe5JkKkkFF+e356QH8Vpvc7SiB6lrvcY
	 QXYSsOJP/rAmZsukOddANrceua6grJQqz2d+5p/MMxV++vJq+6w1xb5Eb5x+ayAO0AaEG
	 qH22rFGJav8djklHUP5xXKrH0XOiCg3G9Ea5H2GmzJJ6IwlbVxr2MXQI0m6EbO05n4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVnxTysG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED0606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GVnxTysG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16381F01828;
	Wed, 28 Oct 2026 02:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793153413;
	bh=2kVR0iXYwksgklT+jPJl/+o2aZSAIdgcpyydY2KWQgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GVnxTysGGzUxLwnHwROjcm9LAr0JFZsbrgX3MyxawTcfglTBJyIo0lzuoVMZPXH6c
	 kd+hfc3Pi9gTAxaQ1OaOxHFtuyDvbMs7ivy5uebTV0ryjqWJRAiFGuz3Ke/TON6UdN
	 qvaYaxLibmJIokPUDZ45u4rPg5QXXPldlcaET5/PK5muviKWsjV6eACg/SapP23M/q
	 qCcrqPS4hMB0GWJjijb439LTRQn0Etmo4u8zHRhsHKyjrzk3fEhefxAb+DqvsZa/Jp
	 Xfo2DmlJfbArfEsXVSg1ewYI+KeH89rjpC8HycYS+Ab2otkOa9r/7ADwguNqjcWVKT
	 +WclkhczU3aFg==
Message-ID: <sashiko-outbox-187325@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: qdsp6: q6routing: Fix memory leak on probe
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tang Bin" <tangbin@cmss.chinamobile.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
References: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
 <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 02:10:13 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] ASoC: qdsp6: q6routing: dangling routing_data on q6pcm_routing=
_probe() failure
- [Low] ASoC: qdsp6: call to undeclared devm_kzalloc_obj() in q6pcm_routing=
_probe()
--

commit 83d5a1cc3383fe8d00d38b5b09449db5bf27546d
Author: Tang Bin <tangbin@cmss.chinamobile.com>

ASoC: qdsp6: q6routing: Fix memory leak on probe failure

This commit replaces kzalloc_obj() in q6pcm_routing_probe() with
devm_kzalloc_obj() and removes the manual kfree() in q6pcm_routing_remove()
to prevent leaking routing_data when devm_snd_soc_register_component() fail=
s.

> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6ro=
uting.c
> index ea511200c8d72..0a55d1f384d4d 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -1220,7 +1220,7 @@ static int q6pcm_routing_probe(struct platform_devi=
ce *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> =20
> -	routing_data =3D kzalloc_obj(*routing_data);
> +	routing_data =3D devm_kzalloc_obj(dev, *routing_data);

[Severity: Low]
Does sound/soc/qcom/qdsp6/q6routing.c build with CONFIG_SND_SOC_QDSP6_ROUTI=
NG
enabled?

While include/linux/slab.h defines kzalloc_obj(), neither that header nor
include/linux/device/devres.h defines devm_kzalloc_obj(), causing an
undeclared identifier error at compile time (and evaluating *routing_data as
a NULL pointer dereference rather than passing it to typeof()). Should this
use devm_kzalloc(dev, sizeof(*routing_data), GFP_KERNEL) instead?

>  	if (!routing_data)
>  		return -ENOMEM;
> =20
> @@ -1235,7 +1235,6 @@ static int q6pcm_routing_probe(struct platform_devi=
ce *pdev)
> =20
>  static void q6pcm_routing_remove(struct platform_device *pdev)
>  {
> -	kfree(routing_data);
>  	routing_data =3D NULL;
>  }

[Severity: Critical]
Can switching routing_data to a device-managed allocation leave the global
static routing_data pointer dangling if devm_snd_soc_register_component()
fails in q6pcm_routing_probe()?

In sound/soc/qcom/qdsp6/q6routing.c:q6pcm_routing_probe():

	routing_data =3D devm_kzalloc_obj(dev, *routing_data);
	if (!routing_data)
		return -ENOMEM;
	...
	return devm_snd_soc_register_component(dev, &msm_soc_routing_component,
					  NULL, 0);

When devm_snd_soc_register_component() returns an error, the driver core
runs really_probe() -> device_unbind_cleanup() -> devres_release_all()
without invoking q6pcm_routing_remove(). That frees the devres-managed
buffer while leaving the file-scope static pointer routing_data non-NULL.

Exported callers such as q6routing_stream_open() and q6routing_stream_close=
()
check whether the driver is ready by testing if (!routing_data):

sound/soc/qcom/qdsp6/q6routing.c:q6routing_stream_open() {
	if (!routing_data) {
		pr_err("Routing driver not yet ready\n");
		return -EINVAL;
	}

	session =3D &routing_data->sessions[stream_id - 1];
	...
	pdata =3D &routing_data->port_data[session->port_id];

	mutex_lock(&routing_data->lock);
}

With routing_data still non-NULL after a failed probe, subsequent calls to
q6routing_stream_open() or q6routing_stream_close() bypass the NULL check
and dereference freed slab memory, including calling mutex_lock() on
routing_data->lock.

Should q6pcm_routing_probe() only publish routing_data after
devm_snd_soc_register_component() succeeds (or clear routing_data =3D NULL =
on
failure)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028015732.1985=
-1-tangbin@cmss.chinamobile.com?part=3D1
