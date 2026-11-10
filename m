Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288610;
	b=Ou4zHoz8zp9034CL0h0EmhMjVK7RdalSh57mOnS6+hKYEGHDHp68jdsxkObXM1AvLA2t
	 /Hfodwd7JpkavOEbs5P80WCKsA13ukncwQb4szBs2lCLyHnGYiEDJgN/TTjhoyFw5AVlc
	 Xgf4EIKaQsY5aSqkaz4XJejw/G3L566tOnnoqghZdi/5F5cv8FSoywWPn9zp2ne8f82iX
	 3MmO3g+RH0GTmWkuRzTy193WpAEiXtJLKria9tcyYtkoOce1QIk6Y58UIWLOF/kDkEBFm
	 ldGdQVWRWKjE3wzc+dqVtv6EISmuXOJn3ksCDIUCc/Ka6n1aarh2N1VJTRXH8FxBxRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288610;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vmeMtlvMc3TgZDdP33spp3rvQapbPOFHkf4tkd6EYwQ=;
	b=XSMIxFqdZO3zpG6Wmn0K45tUyh8Mb/3PlpwaAewWzKkMp6d3s7czT5+gMYGwGUI3K50C
	 QC0wptAqLsVZC7rfbUkeoAgayy4s2mYAUhX8oMfCmvFz6q9Ah6K0L4MfzGiJwe6GBPfET
	 5Z1Y18bd+3/LWcabXbhAJiifIFKH71Eq3LYlofZKH4kG5ZtlBoUG9Y+Qx3G3Ngby4G6uX
	 GlvTzZG09/dPncNRioUP7fL8CnqLnaCZH1i0RZDrNa8vxZ4JegJ9QhNWE+UgnPTmHXCzN
	 Uxjgdzeu1IqfBQUiLDFPmeH6zSsymN+V2T8vbIS9oEnRuZVh2LttoFjcoaxFiKrzh7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/A6AHuE";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EB5606A325
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/A6AHuE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A71C1F0089F;
	Tue, 10 Nov 2026 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794288610;
	bh=vmeMtlvMc3TgZDdP33spp3rvQapbPOFHkf4tkd6EYwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a/A6AHuEudWcnLqWrmDj4XxDnyderleMW1stAYAjLBfzgGPeaiHFGBVb5WniyGZ2S
	 bImQ4C9z/huG94S/MLYC5ULKvFHFS9WNJbRD3PFyJvl+hgNXRfNcUlLMwCmiS4FgbL
	 xbhOZG6YexfzTdkf1yVYhQcpYPiBLYp8MNgrOvQc3wRfyM2D0x0ilCOYcZk7KDTy8y
	 oLtWKybhV5SchL5Yq8NGoT2B6kcrta8ySC2RRN8iMrncVrPlXHKwIErzwKvKp/Kr3O
	 UcNtXbC0h9gitCHllQpXoL98qd1MR6oc7kBhftOOfrJ7HGbjVZ9hYayc9XHqjzUWOb
	 4Z+lQaL+0o5tA==
Message-ID: <sashiko-outbox-206296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/20] ASoC: soc-component: move
 snd_soc_register_[un]component() to soc-component.c
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <874idpntsx.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <874idpntsx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:30:09 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] ASoC: dmaengine: memory leak in
  snd_dmaengine_pcm_unregister() [1]
--

commit a5f7b09ef3fb2f0bb4b4617d3a6ce6f9faafae80
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-component: move snd_soc_register_[un]component() to soc-component=
.c

This commit moves component registration and unregistration functions and
their declarations from soc-core.c and soc.h to soc-component.c and
soc-component.h.

> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 6dad994009bdb..a2f079cd8aae2 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -1549,3 +1549,217 @@ struct snd_soc_component *snd_soc_component_looku=
p_by_name(const char *component

[ ... ]

> +void snd_soc_unregister_component_by_driver(struct device *dev,
> +					    const struct snd_soc_component_driver *component_driver)
> +{
> +	const char *driver_name =3D NULL;
> +
> +	if (component_driver)
> +		driver_name =3D component_driver->name;
> +
> +	guard(mutex)(&client_mutex);
> +
> +	while (1) {
> +		struct snd_soc_component *component;
> +
> +		component =3D snd_soc_lookup_component_nolocked(dev, driver_name);
> +		if (!component)
> +			break;
> +
> +		snd_soc_del_component_unlocked(component);
> +	}
> +}

[Severity: Medium]
This problem wasn't introduced by this patch, but can this loop cause
snd_dmaengine_pcm_unregister() to leak dmaengine_pcm structures and DMA
channels [1] when a device registers multiple dmaengine PCMs?

sound/soc/soc-generic-dmaengine-pcm.c:snd_dmaengine_pcm_unregister() {
	component =3D snd_soc_lookup_component(dev, SND_DMAENGINE_PCM_DRV_NAME);
	if (!component)
		return;

	pcm =3D snd_soc_component_to_priv(component);

	snd_soc_unregister_component_by_driver(dev, component->driver);
	dmaengine_pcm_release_chan(pcm);
	kfree(pcm);
}

When devres releases multiple PCMs registered via
devm_snd_dmaengine_pcm_register() on the same device, the first call to
snd_dmaengine_pcm_unregister() removes all components matching
SND_DMAENGINE_PCM_DRV_NAME.  Subsequent release callbacks then get NULL
from snd_soc_lookup_component() and return early without releasing their
DMA channels or freeing their pcm structures.

[1] https://sashiko.dev/#/bug/linux-259df7eb-71d4-4d88-9686-fca9af84a4de

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/878q31nttj.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D3
