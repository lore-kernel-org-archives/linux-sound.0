Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678821;
	b=eFGdjNfr0t4pnA6uee8z85SX6Q4/hYrpF8dnj9nCFGPonGcLLsF9UhmwMHvLXcgLIqDy
	 n0fwTF3U06nIR+ha16Z0jrYmsuER40R7IeDFrciQd739cV/ZebyqjZGVCDKSpz1ip3we0
	 5uUoKXNz4hXiTIRLjKjqe/sTdvWby/tzvEOXovMuvtLDyd7KnErIdNrCNKZrR2XC/yci+
	 O+KuGMhWuzWInhjSj3XZ5V/t2PAW21XLS6UADd+1SWBE/Y9JILvH9PPsC7Ii8ZCe0KSNs
	 2Z6iWXXRTQXcg9vFYISEsKHE9pqhQY7SIuRQmqB2UA47qTh8ypEAD28kyrwZabGlg8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678821;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Agvv8Wd/n8N6TzkrqdKHQS+VeykaT9iCxB9YRMneWdc=;
	b=uLOtOY+82yEsehV0F0C/WCO1NUAcGpesyJD16B69AxR7/hO6c+CwO7Qd9Et6jAazY8/a
	 MY4bsfA0U24jMEDxfKqdofcTE+a1VMNYPdYvzflmqcXW4RIA+cyzjoN1k3DHfHeBQs4hw
	 WKEkYuXfZa3MSDmVjjYlfGU+xstp5o3YnB6B1TAhNdSYFrsev1ggDK2+598fjp/uPnKsQ
	 sU0NYn5EUpJv8znVLbIUhOtfA8WGzdUdeC+0dn/jT7BLjcMuMhN0s9MW3Kh0ApO3jrWSE
	 h9S/HG28gJFOAc7o0MVX9Oz4iGElUpT5P09NL/5zZh9R2RLHMVS5Kbp2FJIAj0Op9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5iAOEcQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDD5606A327
	for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 17:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K5iAOEcQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD4491F000C4;
	Sat, 14 Nov 2026 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678820;
	bh=Agvv8Wd/n8N6TzkrqdKHQS+VeykaT9iCxB9YRMneWdc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K5iAOEcQGKmlrWP/kB7bcRJoLalRTcNdGCZHmIKX55cwD8Uf3GruubEQWZXnEdVHZ
	 ol8I6tU4ryyvcw0uI4kOiJB/VFtjb1lT3DJDXhyCuIs+k7hhw/8cDyptJEAzF/nMY2
	 K/Vt7zRI8Kp/brH0MD83BUnF2DYx7dSo+MlYxIQGx73LkmcJ0B0kK3+EvwB2nh8ohk
	 rCxPWv60o7lwCb+KqL4x/3TCqLfJrj2uX7wK0iD49KeQ5fIg9kvkTofrTezHT+CtWN
	 Et9Hl1ENsSlLoM9oV/JUqLoEDouRnSxg3OLLflZEP5RqfQTEk6K0EOlw6L7iw04rvz
	 WFaRBqKs21Ckw==
Message-ID: <sashiko-outbox-214859@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] ALSA: usx2y: us144mkii: only touch the buffer of a
 running PCM stream
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Becholey" <alex@becholey.ch>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261114172806.88710-4-alex@becholey.ch>
References: <20261114172806.88710-1-alex@becholey.ch>
 <20261114172806.88710-4-alex@becholey.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:53:40 +0000
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
- [Medium] ALSA: usx2y: us144mkii: pointer desync when streams start
  sequentially
--

commit e23f2c6273b24e6b8b4a5dbee2dc9fa0b6647cd7
Author: Alexandre Becholey <alex@becholey.ch>

ALSA: usx2y: us144mkii: only touch the buffer of a running PCM stream

This commit gates DMA buffer accesses in tascam_capture_work_handler() and
playback_urb_complete() on snd_pcm_running() so that starting one PCM
direction does not read or write the other substream's buffer before it is
running.

> diff --git a/sound/usb/usx2y/us144mkii_capture.c b/sound/usb/usx2y/us144m=
kii_capture.c
> index 973bed60bfcd1..9c142a85e8b21 100644
> --- a/sound/usb/usx2y/us144mkii_capture.c
> +++ b/sound/usb/usx2y/us144mkii_capture.c
> @@ -231,7 +231,13 @@ void tascam_capture_work_handler(struct work_struct =
*work)
>  						  routed_block);
> =20
>  		scoped_guard(spinlock_irqsave, &tascam->lock) {
> -			if (atomic_read(&tascam->capture_active)) {
> +			/*
> +			 * capture_active is also set when only the playback
> +			 * stream was started; the capture buffer is only valid
> +			 * while the capture stream itself is running.
> +			 */
> +			if (atomic_read(&tascam->capture_active) &&
> +			    snd_pcm_running(substream)) {
>  				int f;
> =20
>  				for (f =3D 0; f < FRAMES_PER_DECODE_BLOCK; ++f) {
> diff --git a/sound/usb/usx2y/us144mkii_playback.c b/sound/usb/usx2y/us144=
mkii_playback.c
> index 0df95dbf585db..e6266488cf325 100644
> --- a/sound/usb/usx2y/us144mkii_playback.c
> +++ b/sound/usb/usx2y/us144mkii_playback.c
> @@ -166,6 +166,7 @@ void playback_urb_complete(struct urb *urb)
>  	size_t total_bytes_for_urb =3D 0;
>  	snd_pcm_uframes_t offset_frames;
>  	snd_pcm_uframes_t frames_to_copy;
> +	bool running;
>  	int ret, i;
> =20
>  	if (urb->status) {
> @@ -207,13 +208,25 @@ void playback_urb_complete(struct urb *urb)
>  		}
>  		urb->transfer_buffer_length =3D total_bytes_for_urb;
> =20
> -		offset_frames =3D tascam->driver_playback_pos;
> -		frames_to_copy =3D bytes_to_frames(runtime, total_bytes_for_urb);
> -		tascam->driver_playback_pos =3D
> -			(offset_frames + frames_to_copy) % runtime->buffer_size;
> +		/*
> +		 * The URBs also run when only the capture stream was started;
> +		 * the playback buffer is only valid while the playback stream
> +		 * itself is running.  Send silence otherwise.
> +		 */
> +		running =3D snd_pcm_running(substream);
> +		if (running) {
> +			offset_frames =3D tascam->driver_playback_pos;
> +			frames_to_copy =3D bytes_to_frames(runtime,
> +							 total_bytes_for_urb);
> +			tascam->driver_playback_pos =3D
> +				(offset_frames + frames_to_copy) %
> +				runtime->buffer_size;
> +		}
>  	}

[Severity: Medium]
Does holding driver_playback_pos and driver_capture_pos at 0 while the
substream is not running desynchronize them from playback_frames_consumed
and capture_frames_processed?

feedback_urb_complete() still advances both frame counters unconditionally
while the URBs are active:

sound/usb/usx2y/us144mkii_playback.c:feedback_urb_complete() {
    ...
		if (total_frames_in_urb > 0) {
			tascam->playback_frames_consumed +=3D total_frames_in_urb;
			if (atomic_read(&tascam->capture_active))
				tascam->capture_frames_processed +=3D
					total_frames_in_urb;
		}
    ...
}

When both substreams are prepared and one is started before the other,
feedback_urb_complete() increments the prepared substream's frame counter
while its driver_*_pos stays at 0.  Starting the second substream does not
call .prepare() again, so tascam_playback_pointer() or
tascam_capture_pointer() reports a hardware pointer ahead of where the
driver reads or writes in runtime->dma_area, causing misaligned audio or
xruns.  Should feedback_urb_complete() also gate each stream's counter and
period updates on snd_pcm_running()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114172806.8871=
0-1-alex@becholey.ch?part=3D3
