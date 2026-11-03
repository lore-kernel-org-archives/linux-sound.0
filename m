Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712861;
	b=XBUCG677Z746sFhSa1T6yQSSPOT6rCfeZNkrUEb6xhquRQ8hnAgm7NPoktsVlJZCWNuA
	 GVejGz7dyJR47USHIiYPDQXpV1oJQuOpD2xDnTqAN0Bbk7f5K8upR/tlHOZ1kZ7nDDEXK
	 HFDjti3YnT0GJxe+pYJd+NtO2BWHxlyda2oHuweNQ2raMfv8ay498KCA+JGMPwK3Mp8hP
	 GcRLJ9RmZ+JF5VLyIwydKV+/0an7QgeTMg22zGqWOqQWbttuBVSctfFmJRVXpeLzaCmJx
	 dIdvJ2ieRAuin8bKVFnIB2r4NdaEVbUi02MfgunU/22n2yc4MWBqh4ayCF3htyqCMMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712861;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J3XCfTnQ0bmxQnFnr1883GNTbiR1HlZNkVk9cuWiAqI=;
	b=RcOZV3KEG1UZPgASP3uEcLklc1lE+fsbxSAZitPvkjHJt5HulUnp1Mw62lWErsgkWXrw
	 PcrZo0sAjkAH/y1lnbIirUhuGpOPTFaKgfd8Hq2vJg/XpwHbTkNVLbuxxuZQzo9VyLVpV
	 BiDqjRFAhqFKoid4lBES5vxJ6a83nqOXEXKzIAfN+/7hgt5azROTWAwb8XixVp2+V4Gol
	 QfGsublgZDYA4IPn54sb9HI7mJieyGFcRJT28gXd9JtGI+w8+llOxJHaeyMw8eGvDoYGV
	 CntggLXFpSbfnKJqH1nJq8y3rCr2ruY8II0F6TF9GCGlbcQswCVRMh6gYeN3RAgrcnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpCdi7xo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE284606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LpCdi7xo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A347A1F00A02;
	Tue,  3 Nov 2026 13:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793712860;
	bh=J3XCfTnQ0bmxQnFnr1883GNTbiR1HlZNkVk9cuWiAqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LpCdi7xold68sL4efX1vx1+IXja/eFP4zvNncWjU5QtL9HdlQ8/o8uQZfVE2YClaW
	 xMv0GoBLj88wERkpqHf0R19blTojwuLXz+4ZWQjN3LA04kZjrnAwPvmoewfmwWOBj0
	 9xPe08M4Ig3rgAj9/wzuFosJCVJkrfN5ME6LcABoIjQXwL+5l9OhoFtO5EMsNRXKVf
	 ceiA2WkMzIDi6OD4DnlL29eAqHmBMX5ntlMtK/ptTkE+nno9SXjPI2tyaWtm/OweTE
	 h5YTu1C2m+hUpj2MS4HgtvARdQKQDRqvZoC01rcBz0ZTN+kXOccyJSlXObfJub22JB
	 KXlIGlVoW930w==
Message-ID: <sashiko-outbox-195366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: usx2y: Reject buffers smaller than two packets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sinan Turunc" <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261103132247.713-1-enscrpt@pm.me>
References: <20261103132247.713-1-enscrpt@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 13:34:20 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] ALSA: usx2y: playback buffer constraint in snd_usx2y_pcm_open(=
) is too small
- [Medium] ALSA: usx2y: snd_usx2y_pcm_open() queries usb_maxpacket() before=
 altsetting
--

commit eebe8fbe46c3cb8c8efeb19dc1b855c69b38b38e
Author: Sinan Turunc <enscrpt@pm.me>

ALSA: usx2y: Reject buffers smaller than two packets

This commit constrains SNDRV_PCM_HW_PARAM_BUFFER_BYTES in
snd_usx2y_pcm_open() to at least twice the endpoint's maximum packet size
and adds a defensive check in usx2y_urb_capt_retire() to drop packets
larger than runtime->buffer_size.

> diff --git a/sound/usb/usx2y/usbusx2yaudio.c b/sound/usb/usx2y/usbusx2yau=
dio.c
> index a3a0bc13632b8..d1ddc2b425dbb 100644
> --- a/sound/usb/usx2y/usbusx2yaudio.c
> +++ b/sound/usb/usx2y/usbusx2yaudio.c

[ ... ]

> @@ -888,6 +900,18 @@ static int snd_usx2y_pcm_open(struct snd_pcm_substre=
am *substream)
>  	runtime->private_data =3D subs;
>  	subs->pcm_substream =3D substream;
>  	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_PERIOD_TIME, 1=
000, 200000);
> +	/*
> +	 * The capture and playback copies wrap the ring buffer once per
> +	 * packet and advance the position by the packet, which only works
> +	 * when the buffer holds more than one packet. The packet size is the
> +	 * endpoint's, so bound the buffer by two packets here.
> +	 */
> +	pipe =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK ?
> +		usb_sndisocpipe(subs->usx2y->dev, subs->endpoint) :
> +		usb_rcvisocpipe(subs->usx2y->dev, subs->endpoint);
> +	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +				     2 * usb_maxpacket(subs->usx2y->dev, pipe),
> +				     UINT_MAX);

[Severity: Critical]
Is bounding the playback buffer to two packets sufficient for
usx2y_urb_play_prepare() and usx2y_urb_play_retire()?

Unlike usx2y_urb_capt_retire(), which copies and wraps hwptr_done per
packet inside the packet loop, usx2y_urb_play_prepare() in
sound/usb/usx2y/usbusx2yaudio.c accumulates count across all nr_of_packs()
packets in the URB and then performs a single split copy and a single wrap
for the entire URB:

	count =3D 0;
	for (pack =3D 0; pack <  nr_of_packs(); pack++) {
		/* calculate the size of a packet */
		counts =3D cap_urb->iso_frame_desc[pack].actual_length / usx2y->stride;
		count +=3D counts;
		if (counts < 43 || counts > 50) {
			dev_err(&usx2y->dev->dev, "%s: should not be here with counts=3D%i\n",
				__func__, counts);
			return -EPIPE;
		}
		...
	}
	if (atomic_read(&subs->state) >=3D STATE_PRERUNNING) {
		if (subs->hwptr + count > runtime->buffer_size) {
			len =3D runtime->buffer_size - subs->hwptr;
			urb->transfer_buffer =3D subs->tmpbuf;
			memcpy(subs->tmpbuf, runtime->dma_area +
			       subs->hwptr * usx2y->stride, len * usx2y->stride);
			memcpy(subs->tmpbuf + len * usx2y->stride,
			       runtime->dma_area, (count - len) * usx2y->stride);
			subs->hwptr +=3D count;
			subs->hwptr -=3D runtime->buffer_size;

Likewise, usx2y_urb_play_retire() advances subs->hwptr_done by
urb->actual_length / subs->usx2y->stride for the whole URB and subtracts
runtime->buffer_size only once.

If a user configures a playback buffer that holds at least two packets
(satisfying 2 * usb_maxpacket()) but fewer frames than a full URB of
nr_of_packs() packets (4 packets by default, or up to USX2Y_NRPACKS_MAX
via the nrpacks module parameter), count exceeds runtime->buffer_size.
When that happens in usx2y_urb_play_prepare(), there is no guard against
count > runtime->buffer_size: the second memcpy() can read past the end of
runtime->dma_area, and subs->hwptr grows past runtime->buffer_size so that
len =3D runtime->buffer_size - subs->hwptr becomes negative on the next URB,
passing a negative length converted to size_t into memcpy() and overflowing
subs->tmpbuf.

In addition, usx2y_urb_play_prepare() sizes each playback packet from
cap_urb->iso_frame_desc[pack].actual_length rather than the playback
endpoint's maxpacksize. If a non-conforming device reports a smaller
wMaxPacketSize on the playback endpoint than the capture packet length,
could count * usx2y->stride also overflow subs->tmpbuf (which is allocated
in usx2y_urbs_allocate() as kcalloc(nr_of_packs(), subs->maxpacksize,
GFP_KERNEL))?

[Severity: Medium]
Can usb_maxpacket() return a stale packet size or 0 when called here in
snd_usx2y_pcm_open()?

In sound/usb/usx2y/usbusx2yaudio.c, the USB interface alternate setting is
not selected until snd_usx2y_pcm_prepare() -> usx2y_format_set() calls
usb_set_interface(usx2y->dev, 0, alternate) to switch between alternate
setting 1 (SNDRV_PCM_FORMAT_S16_LE, stride 4) and alternate setting 2
(SNDRV_PCM_FORMAT_S24_3LE, stride 6), after which usx2y_urbs_allocate()
queries usb_maxpacket():

	if (format =3D=3D SNDRV_PCM_FORMAT_S24_3LE) {
		alternate =3D 2;
		usx2y->stride =3D 6;
	} else {
		alternate =3D 1;
		usx2y->stride =3D 4;
	}
	...
	err =3D usb_set_interface(usx2y->dev, 0, alternate);

Because usb_maxpacket() reads udev->ep_in[epnum] or udev->ep_out[epnum]
from whichever alternate setting happens to be active when
snd_usx2y_pcm_open() runs, won't opening a stream while interface 0 is in
alternate setting 1 and then configuring SNDRV_PCM_FORMAT_S24_3LE constrain
SNDRV_PCM_HW_PARAM_BUFFER_BYTES using alternate setting 1's wMaxPacketSize
instead of alternate setting 2's?

Also, since snd_usx2y_pcm_open() does not hold usx2y->pcm_mutex, if another
substream is concurrently running usx2y_format_set() -> usb_set_interface(),
usb_disable_interface() temporarily clears udev->ep_in and udev->ep_out to
NULL before usb_enable_interface() installs the new descriptors. Could
usb_maxpacket() return 0 in that window and leave the minimum buffer size
unconstrained?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103132247.713-=
1-enscrpt@pm.me?part=3D1
