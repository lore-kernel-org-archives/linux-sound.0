Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020730;
	b=c57KAq61tUO0o+0cXicZ3kDpQCp9c7vBNRQXAHJKoH9NVMU6prGdZMeKhgywQhDibrGk
	 GO3KN96jn0BAhx1Sf4xlTaq+LJnWbGvyHsx/Mdbw3ENpw6e8BE28uRnp7xl9fHjKo21w1
	 k0ZKjcZ4KOzCbgY2yh/1WP+47N/e6JlK8LqdcAQgibuPc05gvMENb+vvSuaTL+V/9/IjW
	 wbKus7GNbElI5VzXTfCdUnfp9oSSKvzTmI0Dp5cMC5oPKFEJZMKB4n2+9FCUgTWyfsKza
	 kjoR5uSEykt72/lHchcgXdvnYr5ocx37cc7XcxGnsxdqp14+fnqNnoQwViTH0H/+o7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020730;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lJ3gh8fF1sznH1UyqYIsZwkXnhNFTYwj8v4Ap7L4Yaw=;
	b=tv48nY30QCpOZ39CM4Yt00jEEpPLPijjngDrwBgQKVP8otyyIzk0wugNoZFbuUm4MoFa
	 AY+tKVeA5CyEXKRTT3O8F3r8NNulayXUSZ48zEaJqnuPe1O7hKNEE838zwSPF47h5Ueek
	 LYQxuOHLtS8IEBCKoQ4lx2oKBa50aIAOJMXcK7b09sSHm33tCtdiacAE9ofLSOLvTO9XC
	 VTyoHWUC7ZKJRRmYdNFih4GO/XtgwU+xbZ89gQhT/csl4RpvX/JWTV0j7nMpFFbZKypub
	 TFMCks9zluo2Rdy8EUuQdDEt+14fhyGIFzp46htRtBRy+YPl4X0JjMMMKnuhVJegUHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=midxCqij;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F81606A329
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=midxCqij
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A341F031E9;
	Mon, 26 Oct 2026 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793020730;
	bh=lJ3gh8fF1sznH1UyqYIsZwkXnhNFTYwj8v4Ap7L4Yaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=midxCqijESJMhtrzvCc9oymWX8E8b8tCyTKwIV+50mOb5QyXHn8A2QInYfaMdEGwE
	 4b9Tmem+DBt905k/VlJTP9+Ll+tTpZ367BKKpSl45ANX2xPlhwdqABaB5pGcD58qMQ
	 1UQGx1EPGbsxnj2T4NL8T3WaU0xSd4KuirKZuV2e79bC/66717aP9L6dCx+EwFDo1E
	 ltel/GFtj4rXf18+iss/TH0AzqOlBQhaC1iiCOhbiVsVX+OGIMha1WrQ7vpRe/3jiH
	 egLSEHSC8OxNPKGE+afBvLrvjPylK+8bCb9wlCu6+jyK01q02rIRZ3YiNV0k7dcZ6c
	 GODKFagJcJmaQ==
Message-ID: <sashiko-outbox-185296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is
 stuck
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stjepan Poljak" <stjepan.poljak@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
References: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 13:18:49 +0000
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
- [High] ALSA: usb-audio: stale failing state in snd_usbmidi_in_error() res=
ets device
- [Medium] ALSA: usb-audio: duplicate device resets from per-endpoint reset=
_queued state
--

commit c2e2b9a4ef7034463197fae2778c946cbde9e7fb
Author: Stjepan Poljak <stjepan.poljak@gmail.com>

ALSA: usb-audio: reset a MIDI device whose input is stuck

This commit delays resubmission of stalled (-EPIPE) USB MIDI input URBs via
the error timer and queues a USB device reset when an input endpoint stalls=
 or
fails without a successful URB for 2 seconds.

> diff --git a/sound/usb/midi.c b/sound/usb/midi.c
> index e3d1575540613..7f93df66e55b7 100644
> --- a/sound/usb/midi.c
> +++ b/sound/usb/midi.c

[ ... ]

> @@ -162,6 +168,10 @@ struct snd_usb_midi_in_endpoint {
>  	bool in_sysex;
>  	u8 last_cin;
>  	u8 error_resubmit;
> +	u8 failing;		/* no successful URB since the last error */
> +	u8 reset_queued;	/* at reset_at */
> +	unsigned long failing_since;
> +	unsigned long reset_at;
>  	int current_port;
>  };

[Severity: Medium]
Should reset_queued and reset_at be stored on struct snd_usb_midi rather th=
an
struct snd_usb_midi_in_endpoint?

In __snd_usbmidi_create(), a single struct snd_usb_midi bound to umidi->ifa=
ce
can have multiple input endpoints in umidi->endpoints[i].in (for example, v=
ia
snd_usbmidi_get_ms_info() or snd_usbmidi_detect_per_port_endpoints()).

When multiple input endpoints on the same interface fail,
snd_usbmidi_in_urb_complete() -> snd_usbmidi_in_error() checks
ep->reset_queued on each endpoint independently:

    ep->reset_queued =3D 1;
    ep->reset_at =3D jiffies;
    dev_warn(&ep->umidi->dev->dev,
             "MIDI input not recovering (urb status %d), resetting device\n=
",
             status);
    usb_queue_reset_device(ep->umidi->iface);

Once system_wq starts running __usb_queue_reset_device() for the first
endpoint, WORK_STRUCT_PENDING_BIT on iface->reset_ws is cleared while
usb_reset_device() is in progress. Before usb_reset_device() finishes
unbinding interfaces and killing URBs in snd_usbmidi_disconnect(), a failing
URB on a second endpoint (where ep->reset_queued is still 0) will log a
duplicate warning and call usb_queue_reset_device(ep->umidi->iface) again.

Because neither usb_reset_device() nor usb_unbind_interface() cancels
iface->reset_ws, can that re-queued work run after the first reset finishes
and immediately reset the newly re-probed device a second time?

> @@ -234,6 +244,36 @@ static void dump_urb(const char *type, const u8 *dat=
a, int length)
>  #define dump_urb(type, data, length) /* nothing */
>  #endif
> =20
> +/*
> + * A device that was power cycled without the hub noticing (e.g. a bus
> + * powered keyboard switched off and on again) has lost its configuratio=
n:
> + * it stalls the input endpoint or stops answering, and resubmitting the
> + * URBs never recovers it. Reset it instead; snd-usb-audio has no
> + * pre_reset/post_reset, so this unbinds and re-probes the card.
> + * A queued reset is skipped if usb_lock_device_for_reset() fails, so if
> + * we're still here a while later, ask again.
> + */
> +static void snd_usbmidi_in_error(struct snd_usb_midi_in_endpoint *ep,
> +				 int status)
> +{
> +	if (!ep->failing) {
> +		ep->failing =3D 1;
> +		ep->failing_since =3D jiffies;
> +	}
> +	if (ep->reset_queued &&
> +	    time_before(jiffies, ep->reset_at + RESET_DELAY_JIFFIES))
> +		return;
> +	if (status !=3D -EPIPE &&
> +	    time_before(jiffies, ep->failing_since + RESET_DELAY_JIFFIES))
> +		return;
> +	ep->reset_queued =3D 1;
> +	ep->reset_at =3D jiffies;
> +	dev_warn(&ep->umidi->dev->dev,
> +		 "MIDI input not recovering (urb status %d), resetting device\n",
> +		 status);
> +	usb_queue_reset_device(ep->umidi->iface);
> +}
> +
>  /*
>   * Processes the data read from the device.
>   */
> @@ -242,13 +282,16 @@ static void snd_usbmidi_in_urb_complete(struct urb =
*urb)
>  	struct snd_usb_midi_in_endpoint *ep =3D urb->context;
> =20
>  	if (urb->status =3D=3D 0) {
> +		ep->failing =3D 0;

[Severity: High]
Can ep->failing and ep->failing_since stay latched across idle periods and
trigger a false-positive device reset on the next isolated error?

Unlike isochronous audio endpoints, USB MIDI input endpoints created in
snd_usbmidi_in_endpoint_create() are bulk or interrupt IN endpoints. When a
healthy MIDI device is idle and not transmitting MIDI data, it NAKs IN toke=
ns
and submitted IN URBs remain pending without completing.

If a single transient bus error (-EPROTO, -ETIME, or -EILSEQ) occurs while =
the
device is idle:

1. snd_usbmidi_in_urb_complete() -> snd_usbmidi_in_error() sets
   ep->failing =3D 1 and latches ep->failing_since =3D jiffies.
2. snd_usbmidi_error_timer() resubmits the URB after ERROR_DELAY_JIFFIES
   (100 ms).
3. Because the device is healthy and idle, the resubmitted URB stays pending
   on the bus without completing. Since ep->failing is only cleared in
   snd_usbmidi_in_urb_complete() when an URB completes with urb->status =3D=
=3D 0
   (and is also not cleared in snd_usbmidi_input_stop() or
   snd_usbmidi_input_start() when usb_kill_urb() completes URBs with
   -ENOENT), ep->failing remains 1 and ep->failing_since stays latched at t=
he
   old timestamp indefinitely.

If another single transient error (or the first -EPROTO of a normal cable
unplug) occurs more than 2 seconds later without any MIDI notes having been
received in between, time_before(jiffies, ep->failing_since +
RESET_DELAY_JIFFIES) in snd_usbmidi_in_error() evaluates to false on the ve=
ry
first failing URB.

Won't this immediately call usb_queue_reset_device(ep->umidi->iface) and
unbind the entire ALSA card (including any active PCM audio or MIDI output
streams on a composite device) without input having continuously failed for=
 2
seconds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026125751.1700=
779-1-stjepan.poljak@gmail.com?part=3D1
