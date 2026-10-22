Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667854;
	b=HQgzDWVE75ELvn1X4rAtKPcmihB/jqx/iKdcLfQuF4zu3jlmMuZh5/qNPVOxv34NRD/q
	 j/ctsjfkopTtdz/9K9y223mavQ9IRfNn7AuhxvbLigy9Z3xkciRSl5EQ7hJoCClK7yl1E
	 0z9v8XWyTK9Os2yXbdy4FPk/oaoEkm96xhQp8f9ZAXVzBzkgykUPt0k9pO8V745pN3KIo
	 btFn9k0jJjPfQSLnM96hl/g5VY1qmlBrHM9La4VGqkK4ze0YL/AMP+FZiF+1MdZinWzg4
	 y73P1LRcv2N+RwhS+yNFdGNsa0Ot1ugjYVSBIuhkl0hGdK2nXSOXo8Uj1F5yxqx9x/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667854;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tGJ/Mq4WH0KQ7DbbCNAVAi8cUs6xpJHwcPzoiEpeZmQ=;
	b=u+8rffnYq/L1fqUVrBu/PaFYgh/edRp+VrOG7EQ3WgcT2XqgL0xPcX6YbO3syu5bNu8I
	 e1JACv/5RZCmacrj+V157qvBhKKMqUmyI8mHNEkB+Yob5lSdOJ7613yKIAWBQ2lJ05TGr
	 NotV6dTWey//lEYMpB/Jep1L4NqI4QMs0DHTc824EpOaPdSSBHxp2kM+qjVQxCAgifPem
	 lu3DPugKFTTot9HOhtPC6Fl17xnHqYwv9Ov3Trogd3DU79GZVANxMKGaJOJgB8AFAes9V
	 1IlzkQLKwkehOOnK5F4/Q382A5ZVc/VuIYYnReez4/qdn9RSBPopUyVI1aNXQWWTkNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpvSGzyO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F416606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IpvSGzyO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8793F1F000C1;
	Thu, 22 Oct 2026 11:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792667853;
	bh=tGJ/Mq4WH0KQ7DbbCNAVAi8cUs6xpJHwcPzoiEpeZmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpvSGzyOqKVVI1o5AriClJ/hYfHfD6Oitff/C8gc3mG0/oq2hDCwr6guvuq4vl6eD
	 Mg8QYXh+3d+CcttmDYzHIfKQAQV1SZN+t/8m/MbGJldoY8oETCP1HQhNen9neIxbAM
	 QQ31P6x8e3DsA4SA92kjlfAnTP0aoshdTMSnlV1DJTolLy2ZuG3pRAgvspFK+iMqFe
	 gfhze28BQ2jcQISzoImOy+rH9tkgX9TtOMag37BoN6nvI8GlBaM3dea4dr7+annbd7
	 9e6EOk5TZBc7JPNP0SePfWHnWQq72RsbWQ3YnEkL3LGrIPCRaKvAaeNwhOTcPlB22a
	 hHenmLx+K2hew==
Message-ID: <sashiko-outbox-181365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] ALSA: pcm: Drain proc callbacks at device disconnect
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cen Zhang" <zzzccc427@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <pm-pmb-2439c851f82c443c3600-v7-2774a482b7f03e1fef60@gmail.com>
References: <pm-pmb-2439c851f82c443c3600-v7-2774a482b7f03e1fef60@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 11:17:33 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ALSA: info: snd_info_disconnect_entry() allows proc subtree republ=
ishing
--

commit 734aaf0e640d58ff92175c5964010543a8f73ca6
Author: Cen Zhang <zzzccc427@gmail.com>

ALSA: pcm: Drain proc callbacks at device disconnect

This commit introduces snd_info_disconnect_entry() to remove procfs nodes a=
nd
drain their callbacks without freeing the info entries, and calls it from
snd_pcm_dev_disconnect() after dropping open_mutex so that buffered prealloc
proc writes cannot run after PCM buffer teardown.

> diff --git a/sound/core/info.c b/sound/core/info.c
> index c4d57d0809adf..023b4736aa6de 100644
> --- a/sound/core/info.c
> +++ b/sound/core/info.c
> @@ -737,6 +737,23 @@ static void snd_info_clear_entries(struct snd_info_e=
ntry *entry)
>  	entry->p =3D NULL;
>  }
> =20
> +/**
> + * snd_info_disconnect_entry - remove proc nodes and drain their callbac=
ks
> + * @entry: root of the info entry subtree
> + *
> + * Retains the info entries for snd_info_free_entry().  Callers must ser=
ialize
> + * registration and destruction, and must not hold locks needed by callb=
acks.
> + */
> +void snd_info_disconnect_entry(struct snd_info_entry *entry)
> +{
> +	if (entry && entry->p) {
> +		proc_remove(entry->p);
> +		guard(mutex)(&info_mutex);
> +		snd_info_clear_entries(entry);
> +	}
> +}
> +EXPORT_SYMBOL(snd_info_disconnect_entry);

[Severity: High]
Can a disconnected PCM stream proc subtree be republished if
snd_info_card_register() runs before snd_pcm_free_stream() frees the
entries?

In sound/core/pcm.c, snd_pcm_stream_proc_init() attaches pstr->proc_root to
pcm->card->proc_root->children via snd_info_create_card_entry(). When
snd_pcm_dev_disconnect() calls snd_pcm_stream_proc_disconnect() ->
snd_info_disconnect_entry(pstr->proc_root), snd_info_clear_entries() clears
entry->p to NULL across the subtree while leaving pstr->proc_root linked on
card->proc_root->children:

sound/core/info.c:snd_info_clear_entries() {
	if (!entry->p)
		return;
	list_for_each_entry(p, &entry->children, list)
		snd_info_clear_entries(p);
	entry->p =3D NULL;
}

During HDA codec unbind in sound/hda/common/bind.c,
hda_codec_driver_remove() disconnects the codec PCMs and then waits for
active references before freeing the PCM devices:

sound/hda/common/bind.c:hda_codec_driver_remove() {
	...
	snd_hda_codec_disconnect_pcms(codec);
	snd_hda_jack_tbl_disconnect(codec);
	snd_refcount_sync(&codec->pcm_ref);
	snd_power_sync_ref(codec->bus->card);

	if (driver->ops->remove)
		driver->ops->remove(codec);
	snd_hda_codec_cleanup_for_unbind(codec);
}

While hda_codec_driver_remove() is waiting in snd_refcount_sync() (for
example, while userspace holds an open PCM file descriptor on that codec),
binding or reconfiguring another codec on the same card calls
hda_codec_driver_probe() (in sound/hda/common/bind.c) or reconfig_codec()
(in sound/hda/common/sysfs.c) -> snd_card_register() ->
snd_info_card_register() -> snd_info_register(card->proc_root):

sound/core/info.c:snd_info_register() {
	if (!entry->p) {
		err =3D __snd_info_register(entry);
		if (err < 0)
			return err;
	}

	list_for_each_entry(p, &entry->children, list) {
		err =3D snd_info_register(p);
		if (err < 0)
			return err;
	}
}

Because the disconnected pstr->proc_root subtree is still on
card->proc_root->children with entry->p =3D=3D NULL, snd_info_register() tr=
eats
it as unregistered and calls __snd_info_register() on the subtree,
recreating the procfs nodes (including subN/prealloc).

When the unbinding codec then reaches snd_hda_codec_cleanup_for_unbind() ->
codec_release_pcms() -> snd_device_free(), __snd_device_disconnect() (in
sound/core/device.c) is skipped because dev->state is already
SNDRV_DEV_DISCONNECTED. snd_pcm_free() then calls
snd_pcm_lib_preallocate_free_for_all() while the republished prealloc proc
node is still active, reintroducing the race with
snd_info_text_entry_release() -> snd_pcm_lib_preallocate_proc_write() and
allowing concurrent list traversal on card->proc_root->children between
snd_info_register() and snd_info_free_entry().

Should snd_info_disconnect_entry() unlink the entry from
entry->parent->children or otherwise prevent snd_info_register() from
re-registering a disconnected subtree?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/pm-pmb-2439c851f82c=
443c3600-v7-2774a482b7f03e1fef60@gmail.com?part=3D1
