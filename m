Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572131;
	b=DKetkzoz58WtdzWALu6sVw/hpXKNyJrpdbpCusuF3uNp+qPNHngeIkuRgExf4opOtpbk
	 j/LoGsSn2H732QLixAqxoH5kBZZGikpfqgDx95Wnd30T6f8ALhy06UHMneE71b6fLTZCU
	 KzhUtsqfyMNTA4x7EcuC95HU0PqFM77kaZ8/AH4DyYAtWOlvamN8kn7WwRPi/09SJRhsM
	 mUhtweSUNOwXopyT9Aj6ber7PrKJijEkRMj/9/L9gWPm6pNvQ2aq7GcJDoMHHQQgKUAgG
	 d/rbxzjdCZpiDKxpNR44rY21vsf5C6CeFecB00/LSP1qpmXIPa00+202zQrTtxsUa/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tRjQt/196/e4a0AR1UIsDEsmdGNnbIeAcHX5cvkdm08=;
	b=3LvVf/PaY97IgdHUe3whPgnryL1hghrcl1jR29REN3Sg6hy4TfjK9kPQzGAqvb8CBrFq
	 0pOMExB46Sr2i/bXRwEosae0KSo2HvNTDvBiUPUrS9TaEU+aym7gSmJpxeKsLu5fbvyD7
	 b0nnVJmFk+7Oik7DvU2x5D985a4Eib5MP8dGWGpXlpCoEVl48AE2wrXXVFLMgTO0Jocdj
	 pxBiI2Ko2MYsMizjwgJV+JLWBJoumv0O46m6RmJL7ot17JfkdX9mohUn03uH4ujzbCgSQ
	 pgF/3gTnDIxmK0jEUr5l8rU8OqGBxzsF3TkLP8tL/tp+gXBufvWf5IM3Wfo185w8G7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkgmzcXT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076A1606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 02:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkgmzcXT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8358A1F000C0;
	Wed, 25 Nov 2026 02:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572130;
	bh=tRjQt/196/e4a0AR1UIsDEsmdGNnbIeAcHX5cvkdm08=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NkgmzcXT6lkyVIaYBFizoQ8SU0HfqoItMbGwE5gtKphX690f+uIQpmG5v82hk0jG8
	 nGu5Zn4ABKBwKrUSa2r0Dqi4VE4QqSb+uxwQOYPAVQCJJL3Sp2II7MB07srYA9OWyW
	 ISAfFtCTaMSz6BAmhUqaOKHyisq7kOsF9M0CWYsKNpr2ZYf7o1ru+yT6MguHArjI6H
	 q76vORLFS77QNHwCMqmH6cYLNTZbcsKhY88TKCBqissoL8JiIunFvLq1b/sYsg9aF+
	 Vs7ixKz9zc+3DMFEct3fX6mvAtKzYfXboDkKdtSOrNVZOx7rbo13pXmLh14ykDPoDc
	 SzBZlfpPSxhZw==
Message-ID: <sashiko-outbox-232386@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/27] ASoC: soc-devres: use
 snd_soc_component_unregister() for devm_snd_soc_register_component()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87wlq1eley.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
 <87wlq1eley.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 02:02:10 +0000
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

commit 2485034f94d95731614688861ce6e0f8f1b48236
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-devres: use snd_soc_component_unregister() for devm_snd_soc_regis=
ter_component()

This commit updates devm_snd_soc_register_component() to store the created
component pointer in devres and call snd_soc_component_unregister() on
release.

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
Can this run list_del(&component->list) a second time when a driver
registers a component via devm_snd_soc_register_component() and also calls
snd_soc_unregister_component(dev) in its remove path?

Previously, snd_soc_unregister_component_by_driver() looked up the
component on component_list first, so devm_component_release() was a
no-op if the component had already been removed.  Now
snd_soc_component_unregister() unconditionally calls
snd_soc_component_unregister_unlocked() -> list_del(&component->list).

For example, sound/soc/stm/stm32_adfsdm.c registers
stm32_adfsdm_dai_component with devm_snd_soc_register_component() in
stm32_adfsdm_probe() and calls snd_soc_unregister_component(&pdev->dev) in
stm32_adfsdm_remove(), which unregisters all components on the device
before devres_release_all() runs devm_component_release(), causing a
double list_del() on the poisoned list head during unbind or module
unload.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/87a4mxg01k.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D9
