Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795365113;
	b=QAXi7xCiuDUPoE93SNZQBgBQ4ouZMmpoAH5iMrDNUaQf/b0qdPUxaGgC0I3JmjIAJ9qh
	 CH0V1PuzWoUmKOBdJ4UeG5vBuPRl93+rQrY8QheLKOUIqk7lewFNFwv2J/YAyBraip9rI
	 FIt5gVQcaBjqTiQ6Pnd1VvX+bZFeLuISCrx1hplu2jz9MbH1cE7Jge/m5Fn/DoISGyCr+
	 yp9TaRnH4C0cawwJpSJtHi+BT6XZoZYlPyRw4MhkMcrWZh9vboGKERhaAeJq5HdJjeZev
	 h0NjnaP8TT5/4GjvsAJH3V4Q55+7o+CPd8/LHXCorMq6Gd0J+eQO3N0DBMPhaNuxYrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795365113;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nPxeI1fs2KgXTQOuzqyCkppoLNquMY/CAmHNY/ZxNfY=;
	b=qn+UJr/RBW9/LE6gAkMRgZvEbyltCYz6qktGDb3rzr7xT6u0DAHE4K3aRMpCNyUdiH2O
	 pDdOUaNwmy9JRMlSgFbaqhwdrDAY8XEU88vkiPEsOR5xzepMx6rdkiI46GQeTPcjIQ6Ca
	 27vBPY1JdGhN3OAxTlVa0wnfv0lpAGjU6FS3TpjrTzTPL+w+b/aDdxnRpc1WTj/G+G4gs
	 emviPJAXVVuuvmrATAnLPoxrS67de1NxaNC0hewYHSKI5dAg3lpJ6xmLLQFcKbj6qTorB
	 21TIGOWaC41NIe8CurA/i0QMRMbNNQAigUYdGVbZe+2ffAoZu021mnP+FuGjyOvOvPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKVl6Pxy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B75606A320;
	Sun, 22 Nov 2026 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKVl6Pxy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042FB1F000C0;
	Sun, 22 Nov 2026 16:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795365112;
	bh=nPxeI1fs2KgXTQOuzqyCkppoLNquMY/CAmHNY/ZxNfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kKVl6PxyyCmRLb+BZJGf/qJbgZ465cwkP3FearQZaznfi8YbM8Zg5kb2D22/Vtfax
	 0ITDeMGEjEScdYZR8slfRFhaoZ11dgpNjDK344/OfUVcGGjSqDu+wjbrRjBFLQBIHt
	 pEsFcIbvKIkLWFf7L0qXuGb+KNgzs+b9vVZ6Lwo+joPTVYujh9lZgHYZlWJMOnhri+
	 1tdyEVV2q5F/NToOm6o4cwxJHaZVRpux7oMM6cyFslCQAlJEmJvhwR3qc0htTO61xH
	 uXWI7unOBbHW0cMxi4Ul2S0Kg5sLA1Sf5s2DmXO81q9ymmdZQEiu7WE8PKF4y8hhiI
	 bdiO33cRchtkA==
Message-ID: <sashiko-outbox-228106@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/24] ASoC: soc-core: always allocate default
 ch_maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261122161437.5994-2-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 16:31:51 +0000
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
- [High] ASoC: soc-core: use-after-free write in snd_soc_clear_ch_maps()
--

commit 60ecf0d83132d848d26d62ada9e8bfdded707649
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

ASoC: soc-core: always allocate default ch_maps

This commit replaces the static 12-entry default channel map tables with a
per-link devm allocation on card->dev and registers a devm action to clear
dai_link->ch_maps on release.

> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 7dfd79b4ca3e5..ccd1cb5ee673f 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -766,63 +766,20 @@ static int soc_dai_link_sanity_check(struct snd_soc=
_card *card,
>  	return -EINVAL;
>  }
> =20
[ ... ]
> +static void snd_soc_clear_ch_maps(void *data)
> +{
> +	struct snd_soc_dai_link *dai_link =3D data;
> +
> +	dai_link->ch_maps =3D NULL;
> +}
> +
>  static int snd_soc_compensate_channel_connection_map(struct snd_soc_card=
 *card,
>  						     struct snd_soc_dai_link *dai_link)
>  {
[ ... ]
> @@ -830,24 +787,38 @@ static int snd_soc_compensate_channel_connection_ma=
p(struct snd_soc_card *card,
[ ... ]
> +	dai_link->ch_maps =3D ch_maps;
> +	ret =3D devm_add_action_or_reset(card->dev, snd_soc_clear_ch_maps, dai_=
link);
> +	if (ret)
> +		return ret;

[Severity: High]
Can snd_soc_clear_ch_maps() cause a use-after-free write when dai_link is
not static or devm-allocated?

A driver's .remove() callback (and .probe() error cleanup) runs before
device_unbind_cleanup() calls devres_release_all(card->dev).  Drivers such
as sound/soc/meson/meson-card-utils.c allocate card->dai_link with
krealloc() and kfree() it in meson_card_clean_references() during .remove()
and on .probe() failure, so snd_soc_clear_ch_maps() will write NULL into
freed heap memory when devres tears down card->dev.

Also, devres on card->dev does not run across component-triggered card
unbind/rebind cycles (snd_soc_card_unbind() / snd_soc_card_bind()), so
dynamically created topology DAI links (e.g. soc_tplg_fe_link_create())
will accumulate unreleased ch_maps allocations and devres actions on
card->dev across rebinds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122161437.5994=
-1-srinivas.kandagatla@oss.qualcomm.com?part=3D1
