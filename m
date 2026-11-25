Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571832;
	b=0WDawmjr6f2yIqR8Dld89E0vRstvVF+RRELTBzw3OVdQp8myKW3U+tH7POTuJbOqY4jh
	 qSfGZwNAV1wao21dOrqKKCuLm4vSSxK6edj5rmX1Mpz9KpaI3Zf3we0sR2CSTvR7jSX17
	 FaBgYjKuIS2xRpv0WkSb3jgLLy/aha5a+FkNraizJUAZAheU8VRSrpKb1LbAlO7zxsJfl
	 jgTD2Z68a3AOXpPRdODZfkpdegokJicA/33/4FxmCwM4CRzDa/Ef3WNZl/I6VxVa3O0qZ
	 dcMTILK8aqnTP717fIqrcv2M4uutUSjIGurYfUJfzQ6AHceysxbI6fkrwDqYVc5EiwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571832;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BNr6Qzgu7GMNLEESaC5RH86TJdK7lV4hRFZmLnVXtfM=;
	b=UgeCHnbTFjrn8S7meLWy67vSwCk8ZatGE6BBHSzuaNBSUYehNRrPj6IYJ8YU8y4lu+gy
	 06qN8ckIfO7H0fWXTrw1ubR4GZrcFJrqkkX9YJ/rr7jIxN0puHP75owjZ8xBWZOn/KwJ7
	 MTaGp5ZW249/FWqNYBsKo0zwW74PqlppzJM7mbzRbFx/brJfLmmd4M3WV6gsUiQDBZE3e
	 JLoTsDJyykej1LLqa+vootPvVLnXbL7J/iSGIQ3TPJ2tg2VXTipKcqbK/PusvrBZsme5J
	 CZONqRou+SrQLyUeP/X7tMDBSLzzXzzZarWaltWJ1z+NfwWaz6PCwFInEzwGU33wE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fVw7J/kU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85795606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fVw7J/kU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A18D1F000C0;
	Wed, 25 Nov 2026 01:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795571831;
	bh=BNr6Qzgu7GMNLEESaC5RH86TJdK7lV4hRFZmLnVXtfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fVw7J/kUubIZWYTE9fHsoXEzhVtY5p0Ytuy5hFIgFA3vKQK5MjotBuAwr7SPTgbwW
	 A9vlvQSGeKquIljRfO4uKorCXl36NTGTOxieRgK1GfDELQkOaHI4EgS+0np8PqYdq3
	 kdIXTCa1dZBSBIz2g00HAbmSBNjxtDgLsOTbrZPbGj3ocoGdDR0UxSoTnlWAux9u8E
	 BubWvwrIdeblI57KRuHvlWhPU5V1ezO1Rw05v28uvpymS6H10fhTe0zzMU6tfO1vFD
	 aIpZQJ81n/bRxRwhaQ0ZM1mvRAPslsu+FAIbdf7ws1+p/9GngbT32OowoZ75of2+6u
	 aakmOLEOshhMQ==
Message-ID: <sashiko-outbox-232374@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/27] ASoC: soc-component: move
 devm_snd_soc_component_register()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87se0pele4.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
 <87se0pele4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:57:11 +0000
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
- [High] ASoC: soc-component: double list_del() in
  devm_component_release()
- [Low] ASoC: soc-component: wrong function name in commit subject
--

commit bfd525c567e53a1ebadf8315dc6aad399a16e15a
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-component: move devm_snd_soc_component_register()

This commit moves devm_snd_soc_register_component() and its devres release
callback from sound/soc/soc-devres.c to sound/soc/soc-component.c.

> ASoC: soc-component: move devm_snd_soc_component_register()

[Severity: Low]
This isn't a bug, but the function moved by this patch is
devm_snd_soc_register_component() rather than
devm_snd_soc_component_register().

> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index ca51f976ec409..ea8ed0a662dc6 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -1766,3 +1766,54 @@ void snd_soc_unregister_component(struct device *d=
ev)
>  	}
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
> +
> +static void devm_component_release(struct device *dev, void *res)
> +{
> +	struct snd_soc_component **component =3D res;
> +
> +	snd_soc_component_unregister(*component);
> +}

[Severity: High]
Can devm_component_release() unregister *component a second time and run
list_del(&component->list) on an already-poisoned list head?

Together with commit "ASoC: soc-devres: use snd_soc_component_unregister()
for devm_snd_soc_register_component()" earlier in this series, devres now
stores the component pointer and calls snd_soc_component_unregister()
directly instead of looking the component up on component_list via
snd_soc_unregister_component_by_driver().

In sound/soc/stm/stm32_adfsdm.c, stm32_adfsdm_probe() registers a DAI
component on &pdev->dev with devm_snd_soc_register_component() and a
platform component on the same device with snd_soc_register_component().
On detach, stm32_adfsdm_remove() runs before devres release and calls
snd_soc_unregister_component(&pdev->dev), which unregisters every
component attached to &pdev->dev and deletes component->list.  When
devres_release_all() then invokes devm_component_release(),
snd_soc_component_unregister(*component) calls list_del(&component->list)
again, causing a list corruption crash or warning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/87a4mxg01k.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D12
