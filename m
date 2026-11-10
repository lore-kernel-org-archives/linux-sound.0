Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289331;
	b=seCz3MBMgOvxb6FAr1YybefT3oepG3wiPptTyUN6o3UuiICA8pHIXdmZreHeQtjwPist
	 4B9gSqU32uJjX68lEKg5uEI/oGdLGosJE6eXHY36qsHaygazvp7m2gXBV8ZONBZaltTGV
	 kXUD6rmZcVjYq/ew90OMRFxpBKz2eHRqHDiP7GWehDc3Iao4RHF0sepCv9yHGb5oXw/c5
	 SrvYHnpUOekp4vGL4ns7KNi8oArsbazF5qohiUkfdVKbcDxTddHFj5B/VMBLjrLbRQ/Ej
	 pzdV7HETiuj5aUnIPHpe8O/JaSwqmovP32Zrd9uhTHUKRHAKLjGe89J0TxoyDc9Pl4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289331;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oKvO+wnbUwCVqw57l9Gs6oNTEOuIeEIal+kDIoWrZfo=;
	b=I6v2gD4IHIQzEt83APIfAlgoupilVlEe+b6Sjw7iBBACJEQdUmYT2E6pgjf54QdHyQ8p
	 c7PGA2Old0F2zkZOsYUAKFh3/GyH0JSf13K5NE4njpLglVrCi9zSp5RpKt8MJ45fwblma
	 yijL7ZzydoowNTKIkzfEG14NlI3BNSAPJqoBhW7Om4fGv5pVvySz09qYqnZbrSV0eaZdn
	 3VRhyvZV02G2yUZjY+DFlMI7UswWHTx6Cz4Z9QNKQtUSocLYW1R2LwUHzdkRpcL1cfl0E
	 pMDUqnywx/92TzoHuTvj9oza/4uwSXX0pAtYOQxHCGp1tR7ILBkkrRsVxO5NfGz5InA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSCcHOql;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8B606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WSCcHOql
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D12391F008A2;
	Tue, 10 Nov 2026 05:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289331;
	bh=oKvO+wnbUwCVqw57l9Gs6oNTEOuIeEIal+kDIoWrZfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WSCcHOqleytooTolKDCp8BAx39aGhKCPbUUD2Gr4Qbab8gIkjrhgg9NWu5G3awxcB
	 LtguKNp1Umwz+r5bomqt0vBABR68kvXNXvsyTJVdVPrcX8+gosQLlydVclN4DymLbg
	 eRTvA7WS68d7l/Y+7/KwT2YN6ewwOhI2BpgOr1If8v2Y8O6QHYBu9NOHfiqLsC4dDY
	 tDyy3Oxhtg967dQ7xC9ro1X4buaQv5CmjgN+0XQISk2obhtmoKQR4esA8j4y+/8vJs
	 qCwJNxRvrUDVicSCVB2Y/FBzEViVLiwj3gZp3dVA4Z+NlJPx5kfA4Fk4WFvN0T6i6L
	 mdNfk4iwHYleA==
Message-ID: <sashiko-outbox-206330@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/20] ASoC: soc-component: add
 snd_soc_component_to_regmap()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87qzgtmf70.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
 <87qzgtmf70.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 05:42:10 +0000
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
- [Medium] ASoC: soc-component: snd_soc_component_to_regmap() ordered
  after its callers
--

commit 1b181762257030814f72c0850502aed04e2f536a
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-component: add snd_soc_component_to_regmap()

This commit adds the snd_soc_component_to_regmap() helper function to
retrieve the regmap pointer from struct snd_soc_component.

> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 3ba4e2c84e4b4..4a72cfb5401a9 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -278,6 +278,7 @@ const struct snd_soc_component_driver
>  *snd_soc_component_to_driver(struct snd_soc_component *component);
>  struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component =
*component);
>  struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_componen=
t *component);
> +struct regmap *snd_soc_component_to_regmap(struct snd_soc_component *com=
ponent);
>  struct snd_soc_component *snd_soc_component_new(struct device *dev, cons=
t char *name,
>  						const struct snd_soc_component_driver *driver);
>  int snd_soc_component_register(struct snd_soc_component *component,
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index ebeac81355901..d8274273bb013 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -92,6 +92,12 @@ struct dentry *snd_soc_component_to_debugfs_root(struc=
t snd_soc_component *compo
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_component_to_debugfs_root);
> =20
> +struct regmap *snd_soc_component_to_regmap(struct snd_soc_component *com=
ponent)
> +{
> +	return component->regmap;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_component_to_regmap);

[Severity: Medium]
Should this patch be ordered before commit "ASoC: soc-component: makes
regmap function to inline macro" in the series?

That earlier commit converts snd_soc_component_regmap_get_val_bytes() and
related helpers in include/sound/soc-component.h into static inline
functions that call snd_soc_component_to_regmap(), so the six intermediate
commits fail to compile with an implicit function declaration error and
break git bisect.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/878q31nttj.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D12
