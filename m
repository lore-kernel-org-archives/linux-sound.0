Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794447917;
	b=kHO+UYb8J7t7aiqnDZVKADLZ6YV04NHrzTEHmeWblI4qzrY2/NSojazJIk8y9EXRZ7IS
	 K0qwtNpONeS9k3GqcZ9Sd5xK5086HTo9AEn4fjGbAV+9jVEAGns/kxBUjmc5ZmwKRZggw
	 XXOLaEyAiTjS/nERqw5J59sok7M25+hERlbquMi1vtK7+tzU0t2Edih7hV3mMTq6lCPWs
	 4ZgNUPRCSrazN0DGhG2CWEA86PhSjuY/rdbEg/trigsIp9+uwj2ZMZeYaOVWaRl06R8ZF
	 GP6TuKvr21W1YH60SwPNxeLz/FzVTmKyO7W5w+8aSQ/OmxZKnYNiiK6BDPg19RkTOXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794447917;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0kDlyXcSRRKNuJnc66JVTtzQNZrWYK/wXSR04E+ByNU=;
	b=x8y73epIMmGsvxGhUg6gNNCbNkP5SfcLVQlcv9CSbgccJulgCBbol85IX8e2zImNZKJi
	 NYopBZ6kHmVGxD6NZhbaROakBDpN5v1bVrvOK7CGHmwQa+qChnQbRybWO2xTzZp2/SEef
	 x4j1l52dewnaeEwxcnZrlSZrcMyO2LKc1kNeV7eOE5WvXpGcmafVlj6JUX0M+0FPzcQJZ
	 SKd7+T4/YWbq9ADVLNjHRnbtTyVuGoERecHrni8xrjuMNn80oIOD6pdJ9cdf2S3ZiWWG4
	 JvXyMjWoPdPPeWnmamBRJdvaukyUlmZ5jck/C18zJhAZ8Y+4QxojMhrpfFznClVi4Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKtu1jSm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DBE606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKtu1jSm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80161F00A05;
	Thu, 12 Nov 2026 01:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794447917;
	bh=0kDlyXcSRRKNuJnc66JVTtzQNZrWYK/wXSR04E+ByNU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZKtu1jSm3H7W9SGJf50X4uot5L28ox9S6/dy7oF0lUrPd8nEueN4IkkGhHJvydLmW
	 wCB1ix43DdjwGHRyQI4BkhfHbYs0qdDqGazdH3ghzLjH8pN4NkuYC9Z9NJqHaA87ds
	 BbciZfr7BhnOdEEyZfcb7n3juQBaMjPJjEARut6wvBqLy1PdvFjNjgq3BR40Xv/OAV
	 0wtDt53cj9qloAeg79RB7LwBwwaLfZ8hhgj4Tm0I92WVWJL6djyoMb/g6wtUehTsxU
	 WB6letghPBwj7JASkS2HBDZMzMBZ+tQaaWxqQuqgdtlc7kh7HFG4Qo6pUZGeccCpD8
	 abV4uFNv6o/yw==
Message-ID: <sashiko-outbox-210088@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/27] ASoC: soc-devres: use
 snd_soc_component_unregister() for devm_snd_soc_register_component()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrre28kj.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
 <87mrre28kj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 01:45:16 +0000
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
- [High] ASoC: soc-devres: double list_del() in devm_component_release()
  on teardown
--

commit 38a63673c76cb0aea6b0a6701713c1de6335cb5e
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-devres: use snd_soc_component_unregister() for devm_snd_soc_regis=
ter_component()

This commit changes devm_snd_soc_register_component() to store the
registered struct snd_soc_component pointer in devres and pass it
directly to snd_soc_component_unregister() on release.

> diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
> index ca6c29b54f6ab..0323897c664dc 100644
> --- a/sound/soc/soc-devres.c
> +++ b/sound/soc/soc-devres.c
> @@ -11,9 +11,9 @@
> =20
>  static void devm_component_release(struct device *dev, void *res)
>  {
> -	const struct snd_soc_component_driver **cmpnt_drv =3D res;
> +	struct snd_soc_component **component =3D res;
> =20
> -	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
> +	snd_soc_component_unregister(*component);
>  }

[Severity: High]
Can devm_component_release() call list_del(&component->list) a second
time if the driver already called snd_soc_unregister_component(dev)?

Previously, snd_soc_unregister_component_by_driver() looked up the
component on component_list first, making devm_component_release() a
no-op if it had already been removed.  Now, calling
snd_soc_component_unregister(*component) directly invokes
snd_soc_component_unregister_unlocked(), which unconditionally runs
list_del(&component->list) without checking whether the component is
still linked.

Drivers that mix devm_snd_soc_register_component() with
snd_soc_unregister_component(dev) will hit a double list_del() on a
poisoned list head during teardown:

sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:mt8173_afe_pcm_dev_probe() {
	...
	ret =3D devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
					      NULL, 0);
	if (ret)
		goto err_pm;

	ret =3D snd_soc_register_component(dev,
					 &mt8173_afe_pcm_dai_component,
					 mt8173_afe_pcm_dais,
					 ARRAY_SIZE(mt8173_afe_pcm_dais));
	...
err_cleanup_components:
	snd_soc_unregister_component(dev);
	...
}

mt8173_afe_pcm_dev_remove(), stm32_adfsdm_remove(), and tas_remove() in
sound/soc/codecs/tas2783-sdw.c also call snd_soc_unregister_component()
before devres_release_all() runs devm_component_release().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/87zeve28ol.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D9
