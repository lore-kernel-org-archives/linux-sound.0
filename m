Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794738651;
	b=bdg5dIWE1+MljzCsjhjcbA129cMpUPVd3Z4tyMn1YDkB1RlN7BoJIgRz+W4Pmuq/4T6Y
	 3lqeK+lD6DdrUiTJFZMUC2gUgMh8ZiaNmTC6zTBz+Dfe6y+n0SwjVpNQYqIweMtAcVSRB
	 BAFiJpsOFNB/ycHamqayJgVg2uoSEulBKicAIeX/S5R32k3/GDn+cJwpda73xB1kWwjBW
	 6VUe5gd4to54AI7z7U7NJiqY0Z0rhtrj2mhKhOJM6wMpRGtrjNkijfFcmy4NyWsjSbeX8
	 BHpMmRifBux2rA2INVyTvfZy1Sgd7cK1JalRoY4D98A0Xm9nr3/H7db+1pq9OzrH2aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794738651;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eefIKRWT77eKwMDF3UUWJU6WdoCpfOODCEz84JR98A4=;
	b=j1g/ZuHlJFqhKMq88lfF8lgQpNBBVXc6Ko25pswYOTDYaisrTVy+K/FkwCrr78mGvZsR
	 Wozc71pHjiL+pf49jIqDskgRcaHsiUjW4eXF6WE90Qj7AUTKFZKSZOBPpYQbp928VfhLv
	 TTRNWI3NpamaZ79EzeiG396nRPiP/Egv+DDAsaiRzjAGUrG2v9UsXB9uk0qsTj965uZUk
	 8PKU3yH3UdaSyRuTmZCfYzieLj00IkcKrFsEwBtcLL+DUtYgsiTta0rtlisJxErXOqMU1
	 qx/IAMPScW+h9by4njBA76ThJPJ2I7kK+yerNtJdJdPcHkByU7JR69HjTC59h3rzZcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBDTTMx5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102C0606A31A
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NBDTTMx5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79ED31F000C4;
	Sun, 15 Nov 2026 10:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794738650;
	bh=eefIKRWT77eKwMDF3UUWJU6WdoCpfOODCEz84JR98A4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NBDTTMx5iAXhSrA+ZO5xA8YhNiQ+wPA3jogQrbjyvEzYG/LCRLYzvwRnZjV10jxct
	 Q8emFFs9O3dNWkOvBzzUJe60/225zXm5i62VPqRN42eRGT8QJYcqNVDqNho+Gj1oFa
	 fG7nJ5VF0aEtQx+kJ44oHNPf5RUBx6/4AytcG/CAgL9yE+PgnZpscjDBZZ2Hnauf91
	 6TuPZazwnte978T0VD7FVSjulLUhN5irGWfGY1iXqiSclF86QnV+GGi09mcW7xW0QP
	 UhPsw+zYEUXjauV/Dj2f32dZIqnt/syiXFWtR/ymnEaeG+UTtxssQvIunjwgTTi8Ee
	 xUn/pPuH/iIeA==
Message-ID: <sashiko-outbox-215387@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: jack: Fix control leak on jack allocation failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
References: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:30:50 +0000
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
- [Medium] ALSA: jack: incomplete jack_kctl cleanup on error paths in
  snd_jack_new()
- [Low] ALSA: jack: missing Fixes trailer in commit message for
  snd_jack_new() fix
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] ALSA: jack: NULL pointer dereference in
  snd_jack_kctl_private_free() [1]
--

commit 6c7b3553bfb569b822fa9be95c5962addb3dfa31
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: jack: Fix control leak on jack allocation failure
>
> snd_jack_new() creates an ALSA jack control before allocating the
> jack structure.
>
> If the jack structure allocation fails, the function returns
> -ENOMEM without removing the previously created control.
>
> Remove the control using snd_ctl_remove() to release the control
> and its private data before returning -ENOMEM.
>
> Initialize the control list before removal so that the
> private_free callback can safely remove the list entry.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Should this include a Fixes tag for the commit that moved initial control
creation ahead of the jack allocation?

  Fixes: 4e3f0dc65883 ("ALSA: jack: extend snd_jack_new to support phantom =
jack")

> diff --git a/sound/core/jack.c b/sound/core/jack.c
> index af2dc2cfbe197..92febcb42a8df 100644
> --- a/sound/core/jack.c
> +++ b/sound/core/jack.c
> @@ -555,8 +555,14 @@ int snd_jack_new(struct snd_card *card, const char *=
id, int type,
>  	}
> =20
>  	jack =3D kzalloc_obj(struct snd_jack);
> -	if (jack =3D=3D NULL)
> +	if (!jack) {
> +		if (jack_kctl) {
> +			INIT_LIST_HEAD(&jack_kctl->list);
> +			snd_ctl_remove(card, jack_kctl->kctl);
> +		}
> +
>  		return -ENOMEM;
> +	}

[Severity: Medium]
What happens to jack_kctl if input_allocate_device() or snd_device_new()
fails later in snd_jack_new() and jumps to fail_input?

Only the struct snd_jack allocation failure branch initializes
jack_kctl->list and removes jack_kctl->kctl.  A failure at fail_input still
leaves the control attached to card->controls with jack_kctl->list
zero-initialized, which leaks the control on error return and triggers a
NULL pointer dereference in snd_jack_kctl_private_free() -> list_del() when
the card is later freed.

Initializing jack_kctl->list in snd_jack_kctl_new() and routing all failure
paths in snd_jack_new() through shared cleanup labels that call
snd_ctl_remove(card, jack_kctl->kctl) would handle all error paths
uniformly.

> =20
>  	jack->id =3D kstrdup(id, GFP_KERNEL);
>  	if (jack->id =3D=3D NULL) {

[Severity: High]
This problem wasn't introduced by this patch, but does a kstrdup() failure
here [1] also leave jack_kctl attached to the card with an
uninitialized list head?

sound/core/jack.c:snd_jack_new() {
    ...
	jack->id =3D kstrdup(id, GFP_KERNEL);
	if (jack->id =3D=3D NULL) {
		kfree(jack);
		return -ENOMEM;
	}
    ...
}

When initial_kctl is true and kstrdup() returns NULL, snd_jack_new() frees
jack and returns -ENOMEM without calling snd_ctl_remove(card,
jack_kctl->kctl) or reaching snd_jack_kctl_add().  During subsequent card
teardown, snd_ctl_free_one() invokes snd_jack_kctl_private_free(), which
calls list_del(&jack_kctl->list) on NULL list pointers and crashes.

[1] https://sashiko.dev/#/bug/linux-b6f08fef-7427-40d4-a8d0-ec2dd4aa9cfa

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115101949.2483=
-1-sreekuttan2156239@gmail.com?part=3D1
