Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611116;
	b=3B+uqiEtDSD2NPpUpY6PT0bTwnydmV4Qy2MwIbAw164PDDbe4k6sgtS41rDi0olU7Kif
	 QCRTV1/C7r8iVZHSQdzbZVDqi1hzpcKUq8yZA9HKiCU7Uh0zcTz3epwD49gMZlTBHCRBx
	 52/YwsMSj28iY5LY04FoBDQC9ZASUqG108QgkPRPLy4snqlESDtODLfSG0mWdBWVNJJXJ
	 eNItJtPSYElvR1Zaf4Y5JoF5EhAO7HaK3L/ajPoUqWjdJrG9wSO1KYdkDzxc8nc4VOYTK
	 xnXpXqaLuK2wLbKvGBlmVMbwtDIjd5/zMpDjq1smlhz6bcqx8WJh5+iRGDsG2NbrlkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611116;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YRTxq6RALpRL2HWwYopLJPfizskRSLa65FT5zmbL11o=;
	b=1Me28HEhwg8+19NSsK5+SLEj+5LT9HJX/qAXSh72G+Q8rGK4MGWX8C6BhcDnoVGQESLC
	 p9OHRTa85+XQr7L6Ain3mCKURz+2+TxZON28VsSLxt0C5N1bWOtolIjWUNvUQxZbRwLZi
	 kR2q4UH0QP50yoE2aaC9RTQq538XXN6Fk2j86DO7XfboHVIhZHHhXQ2639q0z1siJC8xY
	 auXsy+rxle7AtfzKm/Qr9BdZp6a/JiBwT8szG0Kml0jQtaw8QnGb7j389m5s+h6V15HnC
	 t5zw9Qrlpmg+/6fW0h7MXAJdCXfCH8psQTJwdwf0li/CN6e5C3WDahy5WpW4TRKha1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXVo6nc8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BB606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cXVo6nc8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FADB1F000C4;
	Wed, 25 Nov 2026 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611115;
	bh=YRTxq6RALpRL2HWwYopLJPfizskRSLa65FT5zmbL11o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cXVo6nc852cUINNhPMEd71U3AjxpaPMvGQn2iTQttgSp7pCHIG9AHl8OtuRS58EwD
	 6dT+LFh31v5ZCQktZoGhbWcGPOUMOmMgQeiawIYMAZ8j6aebbMB4cNT6e+uChnkaWF
	 U2WWawMd89xBtT0+Yq0eTfeqz4P1R726nnFvGv4JQZkC6NEnxHhtjZYrmhrkVejF8X
	 4XFUe21V75d8ZSq7Zk8kq3F7O7e7TcKr0CKcIqiR0/zkP7Wd24P9uQR8vd6a9fWz+T
	 BhcMWfPRRcMqb4YLg/uLNCBOtcs8VCbOQ6L1e41IkkXchhQ8fgB7XJXmBeLwbn4N2t
	 a1QuCo+nXptiA==
Message-ID: <sashiko-outbox-233400@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: sound: core: get_available_index() calls
 snd_ctl_find_id()  without controls_rwsem (UAF risk)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <35a9af21.56c.1a212be1cb2.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <34dd9f9d.2ad23.1a2024081bb.Coremail.xuhx@hust.edu.cn>
 <35a9af21.56c.1a212be1cb2.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:51:55 +0000
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
- [High] ALSA: jack: recursive controls_rwsem down_read() in
  snd_kctl_jack_new()
- [High] sound: core: missing Signed-off-by trailer in commit message
--

commit 59c1eb09f555d07cbd4068c80f23a3bf865c7b34
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> sound: core: get_available_index() calls snd_ctl_find_id() without contro=
ls_rwsem (UAF risk)
>
> get_available_index() walked the control id space via
> snd_ctl_find_id() without holding card->controls_rwsem; the
> CONFIG_SND_CTL_FAST_LOOKUP fast path does xa_load() and
> elem_id_matches() without any lock, so a concurrent
> snd_ctl_remove() (rwsem write, remove_hash_entries, list_del,
> kfree) could free the kcontrol between the xa_load() and the id
> read -- a use-after-free.
>
> Restore the upstream guard: hold controls_rwsem for reading across
> the index loop in snd_kctl_jack_new(); the read side is released
> before the caller's snd_ctl_add(), which takes the write side.

[Severity: High]
The commit message is missing a Signed-off-by trailer.

> diff --git a/sound/core/ctljack.c b/sound/core/ctljack.c
> index 36700fda79f3c..f0c7fcd663474 100644
> --- a/sound/core/ctljack.c
> +++ b/sound/core/ctljack.c
> @@ -74,7 +74,15 @@ snd_kctl_jack_new(const char *name, struct snd_card *c=
ard)
>  		return NULL;
> =20
>  	jack_kctl_name_gen(kctl->id.name, name, sizeof(kctl->id.name));
> -	kctl->id.index =3D get_available_index(card, kctl->id.name);
> +	/* get_available_index() walks the control id space through
> +	 * snd_ctl_find_id(), whose CONFIG_SND_CTL_FAST_LOOKUP fast path
> +	 * reads the candidate kcontrol's id without any lock of its own.
> +	 * Hold controls_rwsem for reading across the loop so a concurrent
> +	 * snd_ctl_remove() cannot remove and kfree() the kcontrol between
> +	 * the xa_load() and the id read.  The read side is released before
> +	 * the caller's snd_ctl_add(), which takes the write side. */
> +	scoped_guard(rwsem_read, &card->controls_rwsem)
> +		kctl->id.index =3D get_available_index(card, kctl->id.name);
>  	kctl->private_value =3D 0;
>  	return kctl;
>  }

[Severity: High]
Does this acquire card->controls_rwsem for reading a second time inside
get_available_index()?

Commit ba8c3d5fc27a ("ALSA: jack: Protect the index scan against control
removal") already added the read guard to get_available_index():

sound/core/ctljack.c:get_available_index() {
	...
	guard(rwsem_read)(&card->controls_rwsem);
	while (snd_ctl_find_id(card, &sid)) {
	...
}

Because down_read() is not recursive, every snd_kctl_jack_new() call
triggers a lockdep recursive-locking warning and deadlocks if a writer
queues between the two down_read() calls:

CPU0                                  CPU1
snd_kctl_jack_new()
  down_read(&card->controls_rwsem)
                                      snd_ctl_add()
                                        down_write(&card->controls_rwsem)
  get_available_index()
    down_read(&card->controls_rwsem)  <-- deadlocks behind waiting writer

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/35a9af21.56c.1a212b=
e1cb2.Coremail.xuhx@hust.edu.cn?part=3D1
