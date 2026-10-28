Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184265;
	b=je7WFg4QaO++x0fYIfbepOXFatiHJcuBcaI3DDqvl2fXE99gX+xydnd9OCSM4Xgk2lD6
	 m8QrY4g8toqcmYn/hC2EA8WK0KL7BxsozpAEBve5lpxlANwKiYOA0hsYfGpIYGt/mSzXE
	 5ENV/cuHy6hR/RPiAmmoX2GRGMg7F0nZ+Sd9aTDEQoX8LK7fA62gAVE32Q2f0Qf9a2KIN
	 TNtupMxIA0JxoPv+6JXgL+JbhxgunWDzAoKQr8STKIUFbVV9XkKM5didERixI5zydVOX6
	 iGJSPVbhPZ2m3BQjqcyohMth9bmLlrc4o/FCZsNIuem4rzG558xJZvIU+0g4Yq/+omg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184265;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pUd4tUObuBqapRDQCPlcng7hCi7T166IM1bWGq0N2/g=;
	b=vecwDb6XphJJtA5vwxKqsc2wQRUcdRrTUCqulkzIz0HvxynJcaZYEBq+uiY0zmEvLfmk
	 eOGGe+5nstPXV4Wbz89bBWOA7pHTdgJb0f0rdQPe2lqf2ChRpoqSGx2AIJ0BNsHNsYj+2
	 +9xcY2jm4chNWckqLpSMvfiduLk7j7xg78RqzyWdnOoz1Z97MFLuoLFue36uh0bw1K1qv
	 a44HPJEEXAdzW2hb6yZUh1zV1m01aLFyTaO8bQIm+brmTRhki7IYIzWSiGqCsaDd1P1Ws
	 jvvq+ZH5tiwC5AmqQvuKwELuil7J3s4chPq3PZZMpRHnY78bvmMBwnANbqIC3FNB5DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="V/0oNVuu";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02463606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V/0oNVuu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7969E1F01825;
	Wed, 28 Oct 2026 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793184264;
	bh=pUd4tUObuBqapRDQCPlcng7hCi7T166IM1bWGq0N2/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V/0oNVuuS1DKfHnOU5cRQsoL50aqsB498WD0yIg7ozFQo1mJ57iXvpXdn1805QNnA
	 w0igiXmO+PT3gPmwgoIXOYdvFzUvwjBolpM3E6pJoB/MoNHmg6tXPNoniX6OxZVU40
	 fBsGsQPwzDFQXUh66k/IyQ9A7URdbZRpff/xDbpXIE9XvrHHfRzWfb8Y4IaOOQ+AAt
	 o7XDajvFmOTBbCNLpcuwEpk2ViVgJ5ftgjBxfQSzIN7xHs/mgwR39Cb7JhpSdMPEMm
	 di49EMNKPcLXo3c3RitpgSIDlwb/p+13VETUqTLNJbhAqo2S0Af1TQfhnT9Z4LRZqL
	 F62fEMYbEMKUg==
Message-ID: <sashiko-outbox-187764@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: usx2y: Initialize idle URBs before submitting
 streams
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261028103158.22996-1-25031212351@stu.xidian.edu.cn>
References: <20261028103158.22996-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 10:44:24 +0000
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
- [Medium] ALSA: usx2y: race in usb_stream_start() when URB 0 completes bef=
ore URB 1
--

commit 136073d2c8fceba09fe79c9e8359e6b5813457a2
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: usx2y: Initialize idle URBs before submitting streams

This commit moves the initialization of sk->idle_inurb, sk->idle_outurb,
sk->completed_inurb, and sk->completed_outurb before the URB submission loop
in usb_stream_start() so that early URB completion callbacks do not
dereference NULL pointers.

> diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
> index 3122cf653273d..7d621280fba33 100644
> --- a/sound/usb/usx2y/usb_stream.c
> +++ b/sound/usb/usx2y/usb_stream.c
> @@ -682,6 +682,10 @@ int usb_stream_start(struct usb_stream_kernel *sk)
>  	s->sync_packet =3D -1;
>  	s->inpacket_head =3D -1;
>  	sk->iso_frame_balance =3D 0;
> +	sk->idle_inurb =3D sk->inurb[USB_STREAM_NURBS - 2];
> +	sk->idle_outurb =3D sk->outurb[USB_STREAM_NURBS - 2];
> +	sk->completed_inurb =3D sk->inurb[USB_STREAM_NURBS - 1];
> +	sk->completed_outurb =3D sk->outurb[USB_STREAM_NURBS - 1];
>  	++try;
>  	for (u =3D 0; u < 2; u++) {
>  		struct urb *inurb =3D sk->inurb[u];

[Severity: Medium]
If both sk->inurb[0] and sk->outurb[0] complete in softirq context after
iteration u =3D 0 submits them, but before iteration u =3D 1 finishes in pr=
ocess
context, can stream_start() race with usb_stream_start() and submit URB 2
ahead of URB 1?

In sound/usb/usx2y/usb_stream.c, iteration u =3D 0 prepares sk->outurb[0] a=
nd
sk->inurb[0] with equal number_of_packets and submits both via
usb_submit_urb(). When both complete in softirq context via
i_capture_start() and i_playback_start(), balance_capture() and
balance_playback() bring sk->iso_frame_balance back to 0 and call
stream_start():

sound/usb/usx2y/usb_stream.c:stream_start() {
	...
	} else
		playback_prep_freqn(sk, sk->idle_outurb);

	if (submit_urbs(sk, inurb, outurb) < 0)
		return;
	...
}

While s->state is below usb_stream_sync1, stream_start() calls
playback_prep_freqn(sk, sk->idle_outurb) on sk->outurb[2] in softirq context
at the same time usb_stream_start() is running playback_prep_freqn(sk,
sk->outurb[1]) for u =3D 1 in process context:

sound/usb/usx2y/usb_stream.c:playback_prep_freqn() {
	struct usb_stream *s =3D sk->s;
	int pack, lb =3D 0;

	for (pack =3D 0; pack < sk->n_o_ps; pack++) {
		int l =3D usb_stream_next_packet_size(sk);

		if (s->idle_outsize + lb + l > s->period_size)
			goto check;

		sk->out_phase =3D sk->out_phase_peeked;
		urb->iso_frame_desc[pack].offset =3D lb;
		urb->iso_frame_desc[pack].length =3D l;
		lb +=3D l;
	}

check:
	urb->number_of_packets =3D pack;
	urb->transfer_buffer_length =3D lb;
	s->idle_outsize +=3D lb - s->period_size;
}

Because there is no synchronization between process context and the softirq
completion handler, both calls concurrently read and update sk->out_phase,
sk->out_phase_peeked, and s->idle_outsize. Immediately afterwards,
stream_start() calls submit_urbs(), which submits sk->inurb[2] and
sk->outurb[2] and rotates the idle/completed URB pointers before iteration
u =3D 1 has submitted sk->inurb[1] and sk->outurb[1].

Should both sk->outurb[0] and sk->outurb[1] be prepared before submitting t=
he
initial URBs, or should softirqs be disabled around the initial preparation
and submission loop in usb_stream_start()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028103158.2299=
6-1-25031212351@stu.xidian.edu.cn?part=3D1
