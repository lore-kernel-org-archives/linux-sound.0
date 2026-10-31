Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793473183;
	b=i9TMHcxGCbMwcNKdRX7PPUTqFGs7yp/Pr8Z7M0gNu+Y2HnJvEag9RXxpEBJY25JjuAK3
	 h1CSEKDadYvZUpekC/JAZaDJ41hl6PQ0I2com9xbWFQzxDz33V5wuL49ejg1N5w8zUe3V
	 7Xq8/vcrYMhkaEIvnQL3gSaxWVvMcyoKQbsYBf+K0iP8pO/eARdIzbnffgN4/0Jfwob8x
	 GLGtLaJWJM74AnP5NATHVQCDiXNRIr0dZHLykJq21uLE9RtTVZTkVIxrJ5IW9J+jgmFsK
	 QnqrM8dbfkZqoLWjFcnSJRtH3zFDMnWeWG7nZ1Q6V1IEUz/NgvvEWVSa9aymALgamgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793473183;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+JxpSbTGbV0VU+1MohgutBHCcnw8xPONz/KsQxC+b0g=;
	b=W33gMtvR+9NI76xWAwOaBACuyWND6GtG1xquvP8PicLQp3VHhbwRTo3eUv5pF1vjo3r9
	 911SBRJs7WBNc2DtHdQ9yVH4Iyf0wicq/hEDmKr90qYzIHYewdmQ/xmIwUNpKDvA2D5C0
	 eN4H4M6Jxi0/F/8LhD+DnzIKY2wRAO2DYItNC545BV22gC4VUJ8kxKLAd//3qz5IuYgbe
	 MYIOzpj8qiIH9AhERgIYkMfwFehFGNYdG4Zun2ljp9CLsOhaCPwx27Da0SH1NnKzxZ4g1
	 yee3s/qfxfIuGhxZDTibHlo7BJAmbPqxGjnJI9f6+HZNd0g5QvAqPcgd/dakMycpKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxC7+WaF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90B606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 18:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NxC7+WaF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720CF1F000C1;
	Sat, 31 Oct 2026 18:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793473182;
	bh=+JxpSbTGbV0VU+1MohgutBHCcnw8xPONz/KsQxC+b0g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NxC7+WaFDEL7QJU+kWGmaWApdcctZ1dRjKPzmbJYjeu16scKYDuhRkq8kkRVs17G4
	 tS3NdAZ8a5f7xzq4e1VocDhtBg7Rn8VzRdmM51e5w+fjRvXQzFZeSXBTe7i5ajN8Q0
	 jbdqyblsCls9IkVdOves5FpxI61cM0W2ykYTbvGRQ8cBXzgHdCgaFe8GPMzbleKYUC
	 D67gy9qHEJ57jdTkFt5IutXcDBoL04rb0LLCka22n+tdkdnbT7cn1U6qTo4hmjq9B+
	 VNeYG5G4mnl/1sJmHIw+cS2eNihqKrYeMgCUkUWaOg5GBeHdtTqPUKQBzAJSnKEdlv
	 eWFN8K+GERKlg==
Message-ID: <sashiko-outbox-192100@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: bcd2000: Wait for open files before freeing
 the MIDI URBs
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261031184405.15307-1-25031212351@stu.xidian.edu.cn>
References: <874ie1rbge.wl-tiwai@suse.de>
 <20261031184405.15307-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 18:59:41 +0000
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
- [High] ALSA: bcd2000: deadlock in bcd2000_disconnect() via snd_card_disco=
nnect_sync()
--

commit b86f69d1ff1d65cb943f4d36efce05abcc0a498d
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: bcd2000: Wait for open files before freeing the MIDI URBs

This commit replaces snd_card_disconnect() with snd_card_disconnect_sync() =
in
bcd2000_disconnect() so that open rawmidi files are closed before freeing t=
he
MIDI URBs.

> diff --git a/sound/usb/bcd2000/bcd2000.c b/sound/usb/bcd2000/bcd2000.c
> index 2bd49bf827489..a5e8ea92532c5 100644
> --- a/sound/usb/bcd2000/bcd2000.c
> +++ b/sound/usb/bcd2000/bcd2000.c
> @@ -451,8 +451,13 @@ static void bcd2000_disconnect(struct usb_interface =
*interface)
> =20
>  	guard(mutex)(&devices_mutex);
> =20
> -	/* make sure that userspace cannot create new requests */
> -	snd_card_disconnect(bcd2k->card);
> +	/*
> +	 * Make sure that userspace cannot create new requests, and wait
> +	 * until all already-open files are closed so that the rawmidi
> +	 * close callbacks (which may kill the out URB) run while the
> +	 * URBs are still valid.
> +	 */
> +	snd_card_disconnect_sync(bcd2k->card);

[Severity: High]
Can calling snd_card_disconnect_sync() inside bcd2000_disconnect() deadlock=
 or
stall USB disconnect processing?

In sound/core/init.c, snd_card_disconnect_sync() sleeps uninterruptibly unt=
il
all open file descriptors on the card are closed:

sound/core/init.c:snd_card_disconnect_sync() {
	snd_card_disconnect(card);

	guard(spinlock_irq)(&card->files_lock);
	wait_event_lock_irq(card->remove_sleep,
			    list_empty(&card->files_list),
			    card->files_lock);
}

However, bcd2000_disconnect() is invoked by usb_unbind_interface() with
device_lock(&interface->dev) held, and from usb_disconnect() ->
usb_disable_device() or usbfs ioctls (usbdev_do_ioctl()) with
usb_lock_device(udev) held, and then acquires devices_mutex.

If a process holding an open ALSA fd on bcd2k->card unbinds the driver via
sysfs (/sys/bus/usb/drivers/snd-bcd2000/unbind) or issues a usbfs ioctl that
unbinds the interface (such as USBDEVFS_DISCONNECT, USBDEVFS_DISCONNECT_CLA=
IM,
USBDEVFS_RESET, or USBDEVFS_SETCONFIGURATION), bcd2000_disconnect() runs
synchronously in that process's syscall context and sleeps in
snd_card_disconnect_sync() waiting for that same process to close its ALSA =
fd.

An ABBA deadlock with usb_lock_device(udev) is also possible during
usb_disconnect(): the hub worker holds usb_lock_device(udev) while waiting =
in
snd_card_disconnect_sync() for open ALSA fds to close. If a process holds b=
oth
a usbfs fd (/dev/bus/usb/...) with a lower fd number and an ALSA fd on the
same device and exits (do_exit() -> close_files()) or closes the usbfs fd
first, usbdev_release() blocks on usb_lock_device(udev) before the process =
can
close the ALSA fd.

Even on a normal physical unplug, waiting in bcd2000_disconnect() for
userspace to close all ALSA fds blocks hub_event() on hub_wq in
TASK_UNINTERRUPTIBLE while holding devices_mutex and before device_del() em=
its
remove uevents, defeating the asynchronous teardown intended by
snd_card_free_when_closed(bcd2k->card) at the end of bcd2000_disconnect().

Instead of blocking in snd_card_disconnect_sync(), would it be safer to keep
snd_card_disconnect() and Either serialize midi_out_urb in
bcd2000_midi_output_close() or defer usb_free_urb() to a card->private_free
callback that runs when snd_card_free_when_closed() finishes?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031184405.1530=
7-1-25031212351@stu.xidian.edu.cn?part=3D1
