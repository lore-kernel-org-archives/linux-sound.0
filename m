Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795256509;
	b=nnnTQolFSxe+Hcfwo9BHgZ4QgGWGgo97ZmFx2VS8UQQZW/W/AbZxb0YP+E5+TKx5W2Kg
	 b/LgmQftm77AWY0SjBAKGmxG953sxF+eNRWiZbPBJqWUx8OKAoPEijqJOjXLzn5E3LiEz
	 TUiM4qxfAzaHK8EU/a7bi8L7ViG+z5zwmLPOTG2zJFAETCsYzzbKxPcUFx0H2BmulNLQ+
	 yCE0egmQRN33ePx/4wmilqujXTAN8RGfWnYR+Y1kfRZ5rS36ToEQNTZ9BWhwGnweZXtvB
	 t4CGnjGJVafALT8NNYXcWoq+fzojoS+LTlMGW6+nHZH4AC8kb5laKpJiW0KEuAEaQUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795256509;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Sq65Tw6WejmBfKmhD2seQtPLwsOc7O6omhT2uSYmLhA=;
	b=5mKSccu9pT2EddJQ8a0fMWH41xHr2JwuLh0kTvBfeYe8HlYpCYtp02o68qE00vOaxo4S
	 uA365g8ALqGZDZr9jXRiObgcJIcvRZhoRoQrsZIn4OHbn8D4G15VqR7c2XThBNtgQJwe+
	 FPPu2vTFIX6wDOVqJ5wtDkW1XEuPDE/8ATUUhkb/4TKiAh4LT2547wTHZ/RsgrVI9paqM
	 naLwjbHNKPDQH2HZei6yRaAxWG6QYV9QRH0PY5i/XkecMi/OHQCVm3m2ZdhQgO8VDiE7d
	 nL/6J8f5ZfEtmjLHQCORSrqsQzaV8qDxLpFJBJIODiWYaRjrRgfQutGm4SKpGjtLETg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqJvbXHk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3C9606A320
	for <linux-sound@vger.kernel.org>; Sat, 21 Nov 2026 10:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqJvbXHk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485061F000C0;
	Sat, 21 Nov 2026 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795256509;
	bh=Sq65Tw6WejmBfKmhD2seQtPLwsOc7O6omhT2uSYmLhA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqJvbXHkUU5vbRJwX1gFAnzd9SyMkR88n5TPiU8wwDOBsAfrELLUiV2egV2gKeDhj
	 df8oKLtZV3+XrtrSawfxgi+HN7Ju0LC3vcan6jri9M9tEcG+W4alZk6ZK6PIfLq16L
	 O7gfRDVu9ZK4qLf9D7Lx1+ER0abGAmahOjKPEgav47hHlbGhfmn1kFcTtCIOHKLdko
	 0AEgSbid2SqgTWBX8Z81jzusSyf6ZYPioykYlYqwxmbtX88HtbZDno1QPyytEhnYQ0
	 GgLjnXs15yHCe3A5Ql+y5AjWzWAGrvh3GuOW89vRfK0lUkfKzQMP1Uosm6WRGTbR2p
	 r57ig8qQ2Jj4g==
Message-ID: <sashiko-outbox-226937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: line6: Kill URBs before releasing the PCM
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261121095643.8196-1-25031212351@stu.xidian.edu.cn>
References: <20261121095643.8196-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 10:21:48 +0000
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
- [High] ALSA: line6: race and stale unlink_urbs in
  line6_kill_audio_urbs()
--

commit c5d2d5929b697407f8e00e71a2f7fa35ef3b8431
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: line6: Kill URBs before releasing the PCM buffer

This commit introduces line6_kill_audio_urbs() and calls it from
line6_buffer_release() instead of line6_wait_clear_audio_urbs() to stop and
wait for active URBs before freeing the PCM stream buffer.

> diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
> index d17baf7761c67..6a8983507a390 100644
> --- a/sound/usb/line6/pcm.c
> +++ b/sound/usb/line6/pcm.c
> @@ -134,6 +134,31 @@ static void line6_wait_clear_audio_urbs(struct snd_l=
ine6_pcm *line6pcm,
>  			"timeout: still %d active urbs..\n", alive);
>  }
> =20
> +/*
> + * Mark all currently active URBs for unlinking and kill them.
> + *
> + * The unlink bit is set under the stream lock, so the completion
> + * callbacks cannot resubmit these URBs any longer; usb_kill_urb() then
> + * waits until each of them is given back and hence the stream buffer is
> + * no longer referenced by the host controller.  This function must be
> + * called from a sleepable context.
> + */
> +static void line6_kill_audio_urbs(struct snd_line6_pcm *line6pcm,
> +				  struct line6_pcm_stream *pcms)
> +{
> +	int i;
> +
> +	scoped_guard(spinlock_irqsave, &pcms->lock) {
> +		for (i =3D 0; i < line6pcm->line6->iso_buffers; i++)
> +			if (test_bit(i, &pcms->active_urbs))
> +				set_bit(i, &pcms->unlink_urbs);
> +	}
> +
> +	for (i =3D 0; i < line6pcm->line6->iso_buffers; i++)
> +		if (test_bit(i, &pcms->active_urbs))
> +			usb_kill_urb(pcms->urbs[i]);
> +}

[Severity: High]
Can line6_kill_audio_urbs() skip usb_kill_urb() while an URB completion
callback is still running, and leave stale bits in pcms->unlink_urbs?

In audio_out_callback() and handle_audio_in(), clear_bit() clears the bit
in active_urbs inside the completion handler before unlink_urbs is tested
and before __usb_hcd_giveback_urb() finishes:

CPU0                              CPU1
line6_buffer_release()
  line6_kill_audio_urbs()
    lock(&pcms->lock)
    set_bit(i, &pcms->unlink_urbs)
    unlock(&pcms->lock)
                                  __usb_hcd_giveback_urb()
                                    audio_out_callback()
                                      lock(&pcms->lock)
                                      clear_bit(i, &pcms->active_urbs)
    if (test_bit(i, &pcms->active_urbs))
      /* false: skips usb_kill_urb() */
  kfree(pstr->buffer)
                                      ...
                                    atomic_dec(&urb->use_count)

Because the second loop checks active_urbs outside pcms->lock, CPU0 sees
active_urbs cleared and returns from line6_kill_audio_urbs() while the
callback and URB giveback are still executing on CPU1.

In addition, line6_stream_stop() runs line6_unlink_audio_urbs() without
holding pcms->lock before line6_buffer_release() is called.  If URB k
completes right after line6_unlink_audio_urbs() tests active_urbs and its
callback resubmits using a lower free index (say URB 0),
line6_unlink_audio_urbs() sets bit k in unlink_urbs on the now-idle URB k.
line6_kill_audio_urbs() only kills URBs that are currently in active_urbs
and never clears pcms->unlink_urbs, so bit k remains set and subsequent
calls to line6_stream_start() see pstr->unlink_urbs !=3D 0 and never submit
URBs again.

Calling usb_kill_urb(pcms->urbs[i]) unconditionally for all iso_buffers and
clearing pcms->unlink_urbs afterward would avoid both issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121095643.8196=
-1-25031212351@stu.xidian.edu.cn?part=3D1
