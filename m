Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737840;
	b=P3D7eEw7mk1olk8omapuLV3e5gOSi9oflvBMzAfDYyQxx406Av98495CQ9vLGUKm/Lfb
	 AeePlmKVRpWxRbUASTl4e6gWOVIUr4dkc8YN2zleE3wvoF2+dBNxecO8Pq7lzwUrU2V16
	 lo9Zcxh5Z9bPAjbz8TrXl7Fn42RAEGHmMMgjuPVaoIlqMFCt+LoAPtuTHReKG9nCFVvMO
	 lUKDyVGqzT84ng7JW3/IzXnMyJZX30UEkuAcX0Z+V9v9OiMorex0Uu3LjVyhxCbzvGQKe
	 88LvY7HDVinN4I2lXYBJUFeAxZ6aovCBQ+kiXc7dnPR4oTNjPsNkdtj0s00ZMDJotAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n21k4scSIqsK0DFvddS8DuuNYF30hYuUWAtUbjtE5BU=;
	b=gvdotOLYaxvkB0PVFUhzvAePLJmdldST1gmGSF0EgyxKJ6oY+hxA7I1xU+HUmaKB4ktQ
	 HXoUd13bMjsmY7FX8i7+SXpnXjkrBMYONfdjMNs/9OpKL72HCm1MsCqqcuOYkqYEB7G8Z
	 rRUfIak1lQfDotZemx5ihSreHJgXLPyvG1BZzbIf8yEiyRypNq5O+ho9X1D2QCGdNk+nf
	 tPY4m9XQunlBwPXfnKduftOeDBD7mhJKBVjCtvZZZIIqgiy9I6TC/dKp6nNKaqWskqch5
	 BnJtOHyYd4+QZa1q7Im/HMySjwakrtlUlOx3nsdnX+KHWwXPnvRvosu7PktLa82ZXQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMvVom4X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735B6606A31C
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 00:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMvVom4X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B221F00893;
	Fri, 27 Nov 2026 00:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795737840;
	bh=n21k4scSIqsK0DFvddS8DuuNYF30hYuUWAtUbjtE5BU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMvVom4XwBJx9AQrK1b/LbxkdwV2ENVrk4IbH/BD0ITpGuEjXqsAD8oV4HI6NxERq
	 vQSFquBJ3IchtH9EEzhdgyuR1bYzAYesRUJuGzHZdaSNqEImnxw48tOYPT2ApcF2Hm
	 5LGdLdm0ZWxMynUuR4ByF+niHblLHhklqTCK7LHAZNjbeVitij8aGXWB/rZC0lxu/O
	 AfoRjyu0aGt3MUygIn6VDDx24zDMvru/YHT0bT4V8Zl605XluoVPcx3YYJ2zrFbWCK
	 o8ZDATu3t2QwZZ5GfRGyv9ITbgefkz0lyyCefZPFjRqj6H67fzDdcbNdIzR+dUCI18
	 3FdATkXcot2AA==
Message-ID: <sashiko-outbox-236353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] ASoC: soc-core: rename list to unbind_list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrqvqh5v.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
 <87mrqvqh5v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 00:03:59 +0000
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
- [Critical] ASoC: core: premature devres_destroy() in
  devm_snd_soc_bind_card() [1]
--

commit b28ef687acfb86f7ec423e7fb74b4c460388a35d
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC: soc-core: rename list to unbind_list

This commit renames struct snd_soc_card's list member to unbind_list and
unbind_card_list to unbind_list_head to clarify their purpose.

> diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
> index e0f617077ee80..951ae9ff13557 100644
> --- a/sound/soc/soc-card.c
> +++ b/sound/soc/soc-card.c

[ ... ]

> @@ -1093,7 +1093,7 @@ void snd_soc_card_rebind(void)
>  {
>  	struct snd_soc_card *card, *c;
> =20
> -	list_for_each_entry_safe(card, c, &unbind_card_list, list)
> +	list_for_each_entry_safe(card, c, &unbind_list_head, unbind_list)
>  		snd_soc_card_bind_call(card);
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but can a failed
devres_alloc() during rebind leave a devm-registered card on
unbind_list_head without its release callback [1]?

sound/soc/soc-card.c:devm_snd_soc_card_bind() {
    ...
	devres_destroy(dev, devm_snd_soc_card_bind_release, NULL, NULL);

	ptr =3D devres_alloc(devm_snd_soc_card_bind_release, sizeof(*ptr), GFP_KER=
NEL);
	if (!ptr)
		return -ENOMEM;

	ret =3D snd_soc_card_bind(card);
    ...
}

When snd_soc_card_rebind() calls snd_soc_card_bind_call() ->
devm_snd_soc_card_bind() for a card on unbind_list_head, the existing
devm_snd_soc_card_bind_release entry is destroyed before devres_alloc().
If devres_alloc() fails, devm_snd_soc_card_bind() returns -ENOMEM before
snd_soc_card_bind() removes card->unbind_list from unbind_list_head and
without re-adding the release callback.  When the card device is later
unbound and card is freed, snd_soc_unregister_card() is not called, leaving
a dangling entry on unbind_list_head and causing a use-after-free on the
next list traversal.

[1] https://sashiko.dev/#/bug/linux-3f727b31-7250-473d-8b80-c09bf6f2bb4c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/87v75jqh7j.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D6
