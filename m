Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708694;
	b=qv+i0g8dUxRXtABuYd0Wu72BLHr7Waqx/Ud/WdbDFSctMxay3LDI4czvy0xwVCyX0i7C
	 oVMlmzFJQk8aFAzMFMRFjnE55ENa9szrQulaRdX/cZiZMJnqbwg/3dW08/ghnUo2eD5mc
	 R44ukj/K5SgZM5XyVJgJLKEtYGVsjcVS8VeRpgZLdip38E5IK8oOIxdRT09zZF6ilIld3
	 UUcRoMirzSSei1IIaOcxt1GnmXTSro3k/XuUR99ElcI05ED/Z2CU7Z+dKyr8nrz6nuqLR
	 niyVInxcFUDGxR4z2Vga0TM12T4Z8PBPS7Eo8JOlA2B/y8LAE8QPi1ulomoWyLlITDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708694;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=me8J2uYLMQkuoqe5/vPxb7HHNlUwI5nJJ5By45iGNB4=;
	b=mSepJRP/EyMLvVZg4BGWaQSQJ7CWobtnKqOw043hWxzPRZ06fZBobwZBZZGtPVJKqWK4
	 UDndsU00RBzgaQcaXy1PRXEg8/mFc027WxUPdemQnf+BKYjFwxJZp0mRPkhO4EZjMZuv1
	 KTuAyZYJuNCDAfW03p6m37cMRtboR1gxaaCXpzD1AFireayQX+FZnUGKgsKCACtbVoynO
	 M25cujkzROmKcqKvqKvJ0omNtom3YDl8TTuXfFHmmfCx85mzeSVUaiLRP2CPFgq3jyyOO
	 y5qlSg01/GSG++lRbPUXSRFu+2u37bJdcOQ3ULLgsCJIvTX82wcl6OLzzpu5PdyBr4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XInZzJ3p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB8606A327
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XInZzJ3p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0271F0093A;
	Tue,  3 Nov 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793708693;
	bh=me8J2uYLMQkuoqe5/vPxb7HHNlUwI5nJJ5By45iGNB4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XInZzJ3pkKJW/kNgRUl7AEIPxKQZwgyJ6QhJ5Q0RhsIHgoq3WXGWi3tIq3PPf11em
	 z5c7OlaZmbrnBai7FmskV94XEUdss+l7pJPCdgGvKLP4b29k7REZJsocWePBN+RGu/
	 em/ZtQXbyAQgfVBMSqzfBJ73bDWq/PYTsif/ToA6GMBszyeU7rMz1wEUVGdmifJnSt
	 gWyiP7FRr3yNj2JIGn04uiaiS+VcuBS0cfCnour+ynAxels1HbK1QZdOymhwjK7spj
	 b6OoxQRLnhDn1MOiGj5n9Ot0ptTmOWhuDdT2s+rzx9HKj8+IDOMriY1X7X6+ml/2tx
	 X0jtJFaOZPRsA==
Message-ID: <sashiko-outbox-195233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: line6: Bound capture copies by the PCM buffer
 size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sinan Turunc" <enscrpt@pm.me>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261103120723.328-1-enscrpt@pm.me>
References: <20261103120723.328-1-enscrpt@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 12:24:53 +0000
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
- [High] ALSA: line6: clamping frames to buffer_size in line6_capture_copy(=
) stalls PCM
--

commit dece7d69941f7080a104841df1e03f3fae6b7577
Author: Sinan Turunc <enscrpt@pm.me>

ALSA: line6: Bound capture copies by the PCM buffer size

This patch clamps the number of captured frames in line6_capture_copy() to
runtime->buffer_size so that oversized incoming USB packets do not overflow
the single ring-buffer wrap calculation.

> diff --git a/sound/usb/line6/capture.c b/sound/usb/line6/capture.c
> index 17f49f567efbf..8b6a0dd2ddde2 100644
> --- a/sound/usb/line6/capture.c
> +++ b/sound/usb/line6/capture.c
> @@ -94,6 +94,17 @@ void line6_capture_copy(struct snd_line6_pcm *line6pcm=
, char *fbuf, int fsize)
>  	if (runtime =3D=3D NULL)
>  		return;
> =20
> +	/*
> +	 * A packet can carry up to max_packet_size_in, which the device
> +	 * chooses, while the ring buffer can be as small as one 64-byte
> +	 * period. The single wrap below is only valid for
> +	 * frames <=3D buffer_size, so keep what fits.
> +	 */
> +	if (unlikely(frames > runtime->buffer_size)) {
> +		frames =3D runtime->buffer_size;
> +		fsize =3D frames * bytes_per_frame;
> +	}

[Severity: High]
Does clamping frames to runtime->buffer_size here cause the capture stream
to stall whenever an incoming packet exceeds the buffer size (for example,
when a user configures a 1-period 64-byte capture buffer of 11 or 16 frames
and receives a regular 44- or 48-frame 1 ms packet or a larger USB/IP
packet)?

At the end of line6_capture_copy(), pos_done is updated with:

sound/usb/line6/capture.c:line6_capture_copy() {
	...
	line6pcm->in.pos_done +=3D frames;
	if (line6pcm->in.pos_done >=3D runtime->buffer_size)
		line6pcm->in.pos_done -=3D runtime->buffer_size;
}

When frames is clamped to runtime->buffer_size, adding and immediately
subtracting runtime->buffer_size leaves line6pcm->in.pos_done unchanged on
every packet.

When audio_in_callback() then calls snd_pcm_period_elapsed(),
snd_pcm_update_hw_ptr0() reads the same position via snd_line6_pointer().
In the interrupt path, snd_pcm_update_hw_ptr0() only treats an unchanged
pointer as a full-buffer wrap when hdelta exceeds
runtime->hw_ptr_buffer_jiffies / 2 + 1:

sound/core/pcm_lib.c:snd_pcm_update_hw_ptr0() {
	...
	if (in_interrupt) {
		/* we know that one period was processed */
		/* delta =3D "expected next hw_ptr" for in_interrupt !=3D 0 */
		delta =3D runtime->hw_ptr_interrupt + runtime->period_size;
		if (delta > new_hw_ptr) {
			/* check for double acknowledged interrupts */
			hdelta =3D curr_jiffies - runtime->hw_ptr_jiffies;
			if (hdelta > runtime->hw_ptr_buffer_jiffies/2 + 1) {
				hw_base +=3D runtime->buffer_size;
				...
			}
		}
	}
	/* new_hw_ptr might be lower than old_hw_ptr in case of */
	/* pointer crosses the end of the ring buffer */
	if (runtime->status->hw_ptr =3D=3D new_hw_ptr) {
		runtime->hw_ptr_jiffies =3D curr_jiffies;
		update_audio_tstamp(substream, &curr_tstamp, &audio_tstamp);
		return 0;
	}
}

Because isochronous URBs complete every 1 ms (or 125 us), hdelta is at most
1 jiffy, so snd_pcm_update_hw_ptr0() takes the
runtime->status->hw_ptr =3D=3D new_hw_ptr return path and refreshes
runtime->hw_ptr_jiffies on every URB without ever advancing hw_ptr or waking
user space.

Also, fsize is not read again after frames is computed at the top of
line6_capture_copy(), so is the assignment to fsize here unused?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103120723.328-=
1-enscrpt@pm.me?part=3D1
