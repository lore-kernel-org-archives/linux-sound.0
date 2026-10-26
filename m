Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022621;
	b=cmGxy/BOQLgkzmziF20SLcMXPZEezRYim8E1f0wrCeh+b4SjBqb9kdSMZnQE1kn2SjwB
	 U107ul0v6xWRT56lyQDoPwggITxSIc0Bzaa9YtZKILKjp0tgVDXwc9/o5rYK7vYsuwl6E
	 /vPETn+HiBCzNEdpv1H/4eGTKwLale+gsKtX1brxBHS5iTc8L+epH4YQuZbr7INKAer0m
	 cNGFRqUsIHAlDOyXgnIAfrVpMNC2yyqCKi7T4NJhKr5AMXxtWLt4qCzfFqnE4WEuO2f88
	 LtjbxblnDGS2a4PBq+g0F19Bshp8NO7BITM8PH42XubxT0hTRIWeo8QhsLdjABaIGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=g1ntINgkK0BZaoUb1eM+xlMxiJUur65wLDmZRRQ1xjA=;
	b=Kakp7ks8FwlhJ28QrJ17FhyUhy42uJCXUm8VMeDins+q7f7/Lw9V6k9P6dWaweUDVKIm
	 Tl9Hj+B5B0voIiVhKKE419QWQj79RNUmEfJVFN3x+w5sXjVI0REja2sX6JSlUxGTi0kfZ
	 yXcT+ni7cnCOL25ZCVSd0eMx6lNzXo2kpqu6qilcji1I+9BgwcrF99Mf8p2D1298EbHug
	 uPEtHyxIJ9s1VUQIWFU8JEOVLZlPnhKYU9XK/XDC75g1DQpPCsF7mJAtoSPktLaUIPOlD
	 k7C9JDsoHfkPcDdzlwg+wqlBHmrhgSWqDC6LgyWxqpFgTEUOeS8UFEAZZeA0O8g3+wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyFPWlXq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331C1606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PyFPWlXq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E546D1F01829;
	Mon, 26 Oct 2026 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793022621;
	bh=g1ntINgkK0BZaoUb1eM+xlMxiJUur65wLDmZRRQ1xjA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PyFPWlXqGjSRirFfXoXt3UJmG5TGN5n8ke9MWgCZM/cPototbtPfhvSSsZdFMlUtP
	 bqPEkRq2POnOHelEFOaiDhyp981lrOSZfoC25TN5pR1J82EtWQSYxVrWPGtP33S5Gy
	 I7Sb14XUgdsJE4pYpyxAEn2xhbfm6IGi3MrhGjGj8WG8FABNO27TI2kEjFWHYsUDqI
	 XvnjfFaOUMUnqfFyZKe4KdRTQvi4LyPAcfXpzR42e0VO7hibvuv1kG+yV85ZDQars5
	 twLGzELnheFrygINGHO8OH62W7mogZyubRoIrQDwpsbr2+atYs7N1ebJzoNol621Vd
	 q4uFDmrGw+pRQ==
Message-ID: <sashiko-outbox-185346@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: Add driver for SGI RAD1 audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imre Kaloz" <kaloz@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261026132305.16375-1-kaloz@kernel.org>
References: <20261026132305.16375-1-kaloz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 13:50:20 +0000
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
- [High] ALSA: rad1: missing buffer and period constraints in snd_rad1_pcm_=
open()
- [Medium] ALSA: rad1: stale audio left in DMA ring by snd_rad1_pcm_resync()
--

commit eacc721af59b303627daf14970de1c98326696c7
Author: Imre Kaloz <kaloz@kernel.org>

ALSA: Add driver for SGI RAD1 audio

This commit adds an ALSA PCI driver for the SGI RAD1 audio controller found=
 in
SGI Octane workstations, supporting analog and AES3 audio I/O.

> diff --git a/sound/pci/rad1.c b/sound/pci/rad1.c
> new file mode 100644
> index 0000000000000..0419b95cd03f1
> --- /dev/null
> +++ b/sound/pci/rad1.c

[ ... ]

> +/* The running count is the negated number of bytes left in the ring. */
> +static unsigned int snd_rad1_hw_pos(struct snd_rad1_pipe *pipe)
> +{
> +	u32 count =3D snd_rad1_read(pipe->chip, RAD1_RUN_CTL(pipe->desc->dma));
> +
> +	return (pipe->buffer_bytes + (count & ~(RAD1_DMA_ALIGN - 1))) %
> +	       pipe->buffer_bytes;
> +}
> +
> +/*
> + * A DMA that has not moved by a poll, the first one half a period after
> + * the start, is enabled again, up to RAD1_DMA_START_TRIES times.
> + */
> +static void snd_rad1_check_start(struct snd_rad1_pipe *pipe, unsigned in=
t pos)
> +{
> +	struct snd_rad1 *chip =3D pipe->chip;
> +
> +	if (pos || pipe->start_tries =3D=3D RAD1_DMA_START_TRIES) {
> +		pipe->starting =3D false;
> +		if (!pos)
> +			dev_warn(pipe->substream->pcm->card->dev,
> +				 "%s: DMA did not start\n", pipe->desc->name);
> +		return;
> +	}
> +
> +	pipe->start_tries++;
> +	guard(spinlock_irqsave)(&chip->lock);
> +	if (pipe->running) {
> +		snd_rad1_write(chip, pipe->desc->ctl_reg, pipe->ctl);
> +		snd_rad1_write_ctl(chip, pipe);
> +	}
> +}
> +
> +/* The RAD1 raises no interrupt for DMA progress; poll the position. */
> +static enum hrtimer_restart snd_rad1_poll(struct hrtimer *timer)
> +{
> +	struct snd_rad1_pipe *pipe =3D container_of(timer, struct snd_rad1_pipe,
> +						  timer);
> +	unsigned int pos, period;
> +
> +	if (!READ_ONCE(pipe->running))
> +		return HRTIMER_NORESTART;
> +
> +	pos =3D snd_rad1_hw_pos(pipe);
> +	if (pipe->starting)
> +		snd_rad1_check_start(pipe, pos);
> +
> +	period =3D pos / pipe->period_bytes;
> +	if (period !=3D pipe->period) {
> +		pipe->period =3D period;
> +		snd_pcm_period_elapsed(pipe->substream);
> +	}
> +
> +	hrtimer_forward_now(timer, pipe->poll_time);
> +	return HRTIMER_RESTART;
> +}

[ ... ]

> +static int snd_rad1_pcm_open(struct snd_pcm_substream *substream)
> +{

[ ... ]

> +	/* samples reach the DMA ring only through snd_rad1_pcm_ack() */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +		runtime->hw.info |=3D SNDRV_PCM_INFO_SYNC_APPLPTR;
> +
> +	pipe->substream =3D substream;
> +
> +	return snd_pcm_hw_constraint_step(runtime, 0,
> +					  SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
> +					  RAD1_DMA_ALIGN);
> +}

[ ... ]

> +static int snd_rad1_pcm_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct snd_rad1_pipe *pipe =3D snd_pcm_substream_chip(substream);
> +	struct snd_rad1 *chip =3D pipe->chip;
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	const struct snd_rad1_pcm_desc *desc =3D pipe->desc;
> +	dma_addr_t addr =3D runtime->dma_addr;
> +	u32 ctl;
> +
> +	pipe->buffer_bytes =3D snd_pcm_lib_buffer_bytes(substream);
> +	pipe->period_bytes =3D snd_pcm_lib_period_bytes(substream);
> +	pipe->period =3D 0;
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
> +		addr =3D pipe->ring.addr;
> +		memset(pipe->ring.area, 0, pipe->buffer_bytes);
> +		memset(&pipe->rec, 0, sizeof(pipe->rec));
> +		pipe->rec.hw_buffer_size =3D pipe->buffer_bytes;
> +		pipe->rec.sw_buffer_size =3D pipe->buffer_bytes;
> +	}
> +	/* poll twice per period */
> +	pipe->poll_time =3D ns_to_ktime(div_u64((u64)runtime->period_size *
> +					      NSEC_PER_SEC, runtime->rate * 2));
> +	ctl =3D (-pipe->buffer_bytes & ~(RAD1_DMA_ALIGN - 1)) | desc->dma << 3;

[Severity: High]
In sound/pci/rad1.c, snd_rad1_pcm_open() constrains
SNDRV_PCM_HW_PARAM_PERIOD_BYTES to a multiple of RAD1_DMA_ALIGN (128), but =
does
not constrain SNDRV_PCM_HW_PARAM_BUFFER_BYTES to RAD1_DMA_ALIGN or constrain
SNDRV_PCM_HW_PARAM_PERIODS to an integer.

Because the ALSA PCM core allows non-integer period counts by default,
userspace can configure SNDRV_PCM_IOCTL_HW_PARAMS with a period_bytes multi=
ple
of 128 and a buffer_bytes that is only a multiple of the 8-byte stereo S24
frame size (for example, period_bytes =3D 1024 and buffer_bytes =3D 2056).

When pipe->buffer_bytes is not a multiple of 128, masking the two's-complem=
ent
negation in snd_rad1_pcm_prepare():

	ctl =3D (-pipe->buffer_bytes & ~(RAD1_DMA_ALIGN - 1)) | desc->dma << 3;

rounds the negated byte count down to the next 128-byte boundary (e.g., -20=
56 &
~127 becomes -2176). Does this program the DMA engine to transfer up to 120
bytes past pipe->buffer_bytes in runtime->dma_area on capture or past the
cleared region of pipe->ring.area on playback?

In addition, when -(count & ~(RAD1_DMA_ALIGN - 1)) starts at 2176 while
pipe->buffer_bytes is 2056, the unsigned addition in snd_rad1_hw_pos():

	return (pipe->buffer_bytes + (count & ~(RAD1_DMA_ALIGN - 1))) %
	       pipe->buffer_bytes;

underflows 32-bit arithmetic (2056 + (-2176) =3D 0xffffff88U) and returns a
non-zero offset before DMA has moved, and then jumps backwards once the fir=
st
128-byte block finishes, causing snd_rad1_pcm_pointer() to take the pos < s=
tart
wrap branch and zero out unplayed samples in pipe->ring.area.

Furthermore, in snd_rad1_poll():

	period =3D pos / pipe->period_bytes;

doesn't this period boundary check require buffer_bytes to be an integer
multiple of period_bytes so that wrap-around does not happen mid-period? Sh=
ould
snd_rad1_pcm_open() also apply snd_pcm_hw_constraint_integer(runtime,
SNDRV_PCM_HW_PARAM_PERIODS) (or constrain SNDRV_PCM_HW_PARAM_BUFFER_BYTES to
RAD1_DMA_ALIGN)?

[ ... ]

> +/* Copy again from the DMA position, which hw_ptr is at. */
> +static void snd_rad1_pcm_resync(struct snd_rad1_pipe *pipe,
> +				snd_pcm_uframes_t hw_ptr)
> +{
> +	pipe->rec.appl_ptr =3D hw_ptr;
> +	pipe->rec.hw_data =3D pipe->rec.hw_io;
> +	pipe->rec.sw_data =3D pipe->rec.sw_io;
> +	pipe->rec.hw_ready =3D 0;
> +}
> +
> +static int snd_rad1_pcm_ack(struct snd_pcm_substream *substream)
> +{
> +	struct snd_rad1_pipe *pipe =3D snd_pcm_substream_chip(substream);
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct snd_pcm_indirect *rec =3D &pipe->rec;
> +	snd_pcm_uframes_t appl_ptr =3D runtime->control->appl_ptr;
> +	snd_pcm_uframes_t frames;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +		return 0;
> +
> +	/* a rewind moves appl_ptr back over samples already in the ring */
> +	frames =3D appl_ptr - rec->appl_ptr;
> +	if (appl_ptr < rec->appl_ptr)
> +		frames +=3D runtime->boundary;
> +	if (frames > runtime->buffer_size)
> +		snd_rad1_pcm_resync(pipe, runtime->status->hw_ptr);
> +
> +	return snd_pcm_indirect_playback_transfer(substream, rec,
> +						  snd_rad1_pcm_copy);
> +}
> +
> +/* A reset moves appl_ptr to hw_ptr without calling .ack. */
> +static int snd_rad1_pcm_ioctl(struct snd_pcm_substream *substream,
> +			      unsigned int cmd, void *arg)
> +{
> +	struct snd_rad1_pipe *pipe =3D snd_pcm_substream_chip(substream);
> +	int err =3D snd_pcm_lib_ioctl(substream, cmd, arg);
> +
> +	if (err || cmd !=3D SNDRV_PCM_IOCTL1_RESET ||
> +	    substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +		return err;
> +
> +	guard(pcm_stream_lock_irqsave)(substream);
> +	snd_rad1_pcm_resync(pipe, substream->runtime->status->hw_ptr);
> +
> +	return 0;
> +}

[Severity: Medium]
When a playback substream is reset via SNDRV_PCM_IOCTL1_RESET in
snd_rad1_pcm_ioctl() or rewound via snd_rad1_pcm_ack(), snd_rad1_pcm_resync=
()
resets pipe->rec.hw_data to pipe->rec.hw_io and sets pipe->rec.hw_ready =3D=
 0.

However, the samples that were previously copied into pipe->ring.area ahead=
 of
hw_io are left in the DMA ring buffer, and pipe->rec.sw_ready is not cleare=
d. On
a rewind, snd_pcm_indirect_playback_transfer() only overwrites pipe->ring.a=
rea
up to the new rewound appl_ptr, leaving the rewound tail in pipe->ring.area=
; on
a reset, none of the unplayed region in pipe->ring.area is cleared.

Since snd_rad1_pcm_pointer() only zeroes regions of pipe->ring.area after t=
he
hardware DMA pointer advances past them, could the DMA engine play those st=
ale,
discarded samples from pipe->ring.area instead of silence if the stream
underruns, drains, or continues running after a reset or rewind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026132305.1637=
5-1-kaloz@kernel.org?part=3D1
