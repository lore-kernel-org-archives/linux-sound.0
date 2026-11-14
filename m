Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679183;
	b=hX0ULCrpD0z5R7q1sMOZQRUWMAu9fN5c9kskUyuN4xBP0GrBQch0bkT0VlH7cloc4cXv
	 8lrZO6CjbgJhc3RoT+QrQxHSlWowSPL1nD6M4dW1ff6fBWlTOn460iLrF7sGlRwpvFk9y
	 OEYpK9S//qpZqokibXk0mD1R1PHUBTFBFncBwrYDkua2P106LsOLzh5OZZ9clxPwcmCQP
	 V8/viBvnHnSLi6DasS5QFxNkxdjr2eVLlF129lW0P/251kRyyrVVPPLmfwNPwkuUp54nk
	 EklRB8+HdJrYehSnNdT0D8dPkz2bhMNJypU7/7gJgOobO+sA+UeMceBJJrFU4cyGIow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679183;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rWuPUIRVjl0DEQV/JX2u6TkzHhXa9WAsvHSlQTrfyRk=;
	b=KvEnpqMCuKXZMxcaIw7pTOMO5ZY53x0u0U25ODEPPYjnTVrp+odhpFSUzIlAzzbrGd+R
	 aUcySTmBXkvw0EW/F9ZAs6JgwxsyRPF84YrXn+iPybPJD5pTWQu8h/UELRYNmoMbpsuli
	 fYcJrAA7vLpLTPw6+BFgGLvYiwm07XbSUYoDmnZKvxKULdC/BaWu2gPH4AXKgepk0nYnD
	 9B4a0dAfgJUXIkV/les5MK0mu22SJxVYnVoNbrxT+RSWiDy4Sx3Jm1jLuELTLl36tQWtf
	 vrwyw1+si+7gJoGWv+l7gMA4iKCZHA/RdmrPLhLErVb8Ijc497xHZF5atPAvprh5PLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0WAXPCr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D90606A323
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 17:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d0WAXPCr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6610F1F000C4;
	Sat, 14 Nov 2026 17:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794679183;
	bh=rWuPUIRVjl0DEQV/JX2u6TkzHhXa9WAsvHSlQTrfyRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d0WAXPCr/y7zhjzFmUS0VH/WBIUJgfKV7IEDed+bVaVquuI4ZUx3Qie7DpUvDH4O2
	 SfYnSc0wYUrtebRzIr2/8NCL1Qy64hoLT81xq6QDdymTZU3nUoi+VOf6vrC96duDCd
	 nF8gI2i+YLM+/YmzVdNFVZw24KhH15yvOxzh9c2Iq5qcAMmIoaim2/q3e/XkPgjOqV
	 4Rx6VrYUW5o9BE4JjPJGBetx4vvCgNe+A1LnKTT2R0Qa16Vi15iOmde+toPVHGG+Mv
	 Lnftnm+eRUDzIrF3ZnpXtVmUIkklb1or0agNdpZqZp0uL9hOJAfcIWbIyv0YGptwzR
	 qdbTR6gTcRomA==
Message-ID: <sashiko-outbox-214863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] ALSA: usx2y: us144mkii: wait for the URB completion
 handlers on stop and close
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Becholey" <alex@becholey.ch>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261114172806.88710-5-alex@becholey.ch>
References: <20261114172806.88710-1-alex@becholey.ch>
 <20261114172806.88710-5-alex@becholey.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:59:42 +0000
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
- [Medium] ALSA: usx2y: us144mkii: missing rcu_assign_pointer() in PCM
  open callbacks
--

commit 6a69f01bf459c14f59000c815994e8cebf887174
Author: Alexandre Becholey <alex@becholey.ch>

ALSA: usx2y: us144mkii: wait for the URB completion handlers on stop and cl=
ose

This commit protects the playback and capture substream accesses in the
URB completion handlers with RCU read-side critical sections and waits for
grace periods in the PCM .close and .sync_stop callbacks.

> diff --git a/sound/usb/usx2y/us144mkii_playback.c b/sound/usb/usx2y/us144=
mkii_playback.c
> index e6266488cf325..36d5417d9975a 100644
> --- a/sound/usb/usx2y/us144mkii_playback.c
> +++ b/sound/usb/usx2y/us144mkii_playback.c
[ ... ]
> @@ -180,9 +183,13 @@ void playback_urb_complete(struct urb *urb)
>  	if (!tascam || !atomic_read(&tascam->playback_active))
>  		goto out;
> =20
> -	substream =3D tascam->playback_substream;
> -	if (!substream || !substream->runtime)
> +	/* Pairs with synchronize_rcu() in close and sync_stop. */
> +	rcu_read_lock();
> +	substream =3D READ_ONCE(tascam->playback_substream);
> +	if (!substream || !substream->runtime) {
> +		rcu_read_unlock();
>  		goto out;
> +	}
>  	runtime =3D substream->runtime;
[ ... ]
> @@ -295,12 +303,16 @@ void feedback_urb_complete(struct urb *urb)
>  	if (!tascam || !atomic_read(&tascam->playback_active))
>  		goto out;
> =20
> -	playback_ss =3D tascam->playback_substream;
> -	if (!playback_ss || !playback_ss->runtime)
> +	/* Pairs with synchronize_rcu() in close and sync_stop. */
> +	rcu_read_lock();
> +	playback_ss =3D READ_ONCE(tascam->playback_substream);
> +	if (!playback_ss || !playback_ss->runtime) {
> +		rcu_read_unlock();
>  		goto out;
> +	}
>  	playback_rt =3D playback_ss->runtime;
> =20
> -	capture_ss =3D tascam->capture_substream;
> +	capture_ss =3D READ_ONCE(tascam->capture_substream);
>  	capture_rt =3D capture_ss ? capture_ss->runtime : NULL;

[Severity: Medium]
Can playback_urb_complete() and feedback_urb_complete() observe a non-NULL
playback_substream or capture_substream before substream->runtime and the
newly allocated struct snd_pcm_runtime are initialized?

tascam_playback_open() and tascam_capture_open() publish
tascam->playback_substream and tascam->capture_substream with plain stores
without a release barrier:

sound/usb/usx2y/us144mkii_playback.c:tascam_playback_open() {
	struct tascam_card *tascam =3D snd_pcm_substream_chip(substream);

	substream->runtime->hw =3D tascam_pcm_hw;
	tascam->playback_substream =3D substream;
	atomic_set(&tascam->playback_active, 0);

Because struct snd_pcm_substream is preallocated when the card is created,
there is no address dependency from the runtime allocation in
snd_pcm_attach_substream() to the substream pointer itself.  If one
substream is opened while the other direction already has the URBs running,
the completion handlers on a weakly-ordered CPU can observe the published
substream pointer while seeing either a NULL substream->runtime (causing
playback_urb_complete() or feedback_urb_complete() to bail out without
resubmitting the URB) or stale fields in a reused struct snd_pcm_runtime
before its zero-initialization becomes visible.

Using rcu_assign_pointer() in tascam_playback_open() and
tascam_capture_open() (paired with rcu_dereference() here, and NULLing the
pointers with RCU_INIT_POINTER() in the .close callbacks) would order the
runtime initialization before the substream pointer publication.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114172806.8871=
0-1-alex@becholey.ch?part=3D4
