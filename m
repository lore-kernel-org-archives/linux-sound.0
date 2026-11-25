Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611652;
	b=PmJ7cBcU4lrTfULg7sj6PcsQwK7bOtz3rSjpdqMGhpgXeIuVwHzN8OYB+TCdRsOc6zQp
	 BKmwwtni4CseeWZe4nMZ7UeRcsp1y+ycF20JvTNwQVtRBh1Rnl9SmgXFzPaGewy7dlvyP
	 o9YduEbNukH9KZFmcSSjWJULc69I8auhWJLNggGcqTHfTloJ675YdcIuAkYuHpB68X/0F
	 ak5g+pYGY1JkHIURln+UeNSIIYEv133PGNOsnXnuEjsrZ9HoJKBcGnJGkU4mKTcHES4Qx
	 HDl+eeJ6k5hBCFANsmsivoRJ2EwB1u9ev1Zz1ZjA/2cEQGtFKx6Vx1t0IXN9P+QfC4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611652;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hQkc6Fv4LwL3/O57Ikf99Tl90XLPMXcykhNXEHYf8jU=;
	b=cGCNwH6wLJbDDmc5oXYe1/JIrDbkT/YmLfABLf2yGzX5EVaUcuU2lOUNFjyhba89ueLI
	 VDvsDsk/Wq90xZ8+UtnGPSP9/l1Oy+rTIj7QF0q0CYilGJaDA2WlNGVtWIjhSk0D4HFw+
	 j7UuLQOn/saXbs184ibwHAAa5TEtBB90AIMuALh/Miv+PRg32z1hDrdcbRrmWfxPnTlTj
	 x60uBT2tDdpXGOrL4X7KmrQ9UXxRK7WCbLmPTfSsVbSH90Wn2daVUe/+FIqPQdN50q/7/
	 TNwGybo0eZBjHJRfU/7vkPH/UDVVcyj2RiZlrAaGgQ48f0DQt/GCG872ZxZPeRhIYGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLo7K9XG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63505606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LLo7K9XG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F97D1F000E0;
	Wed, 25 Nov 2026 13:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611651;
	bh=hQkc6Fv4LwL3/O57Ikf99Tl90XLPMXcykhNXEHYf8jU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LLo7K9XGZzzKQQbxerrgvbbIrPZBxzpgeIiE6V9NcUCfKK0NA1R5VZ07tqJ0xskBx
	 v0poyO+Ptvhkvinc+XZQsN3nValrQSxlKzyOiaqSc1Xk/f2uOlxrSykirg0F+7gIqo
	 ZTc3dA+y9lOikzf46whfAvMYi6Ir1gRt5u+Zak6DAA+iRfmRDwqAeY/eCyhYDJo3Iu
	 HfPYIyzjvcB51jqMXHpGxBWK7VOK/GeySbEdjhd9CrLSNIycU9qNRQPJ/J2kROL/GC
	 iIclawrpl+aTT/ML3GJJ7RA05PcytkMEf8YF+47ZE3FXVyybIBG9aBVVVPQhKfQQqn
	 e7qTIuYmz178w==
Message-ID: <sashiko-outbox-233428@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: Re: ALSA: ctxfi: free atimer only after the timer
 IRQ is quiesced
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <48749068.582.1a212c2b537.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <57529fbf.262c8.1a1d4c65987.Coremail.xuhx@hust.edu.cn>
 <87ik20publ.wl-tiwai@suse.de>
 <48749068.582.1a212c2b537.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:00:51 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ALSA: ctxfi: missing Signed-off-by trailer in commit message
- [Medium] ALSA: ctxfi: unlocked free_global() in ct_timer_free() before
  IRQ sync
- [Low] ALSA: ctxfi: missing Fixes trailer in commit message
--

commit 642fa23b6f7a078e46a39ad1f3b28c30762061f3
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: ctxfi: free atimer only after the timer IRQ is quiesced
>
> ct_timer_free() cleared hw->irq_callback, stopped the hardware timer
> and kfree()d the ct_timer while the PCI IRQ handler could still be
> running or start later: a handler that loaded hw->irq_callback
> before the NULL store calls ct_timer_interrupt() with the freed
> atimer, and the single synchronize_irq() in snd_card_disconnect()
> only covers handlers that were running at that instant -- free_irq()
> happens later, in ct_atc_destroy() -> destroy_hw_obj().
>
> synchronize_irq(hw->irq) after clearing the callback and stopping
> the hardware, before the kfree().  The hw->irq =3D=3D -1 initialization
> contract is kept (the sync only runs for an installed IRQ).

[Severity: High]
The commit message is missing a Signed-off-by: trailer, which is required
under Documentation/process/submitting-patches.rst.

[Severity: Low]
Since this fixes the IRQ teardown race present since the native timer
interrupt support was added, should the commit message include:

  Fixes: b7bbf876087e ("ALSA: ctxfi - Use native timer interrupt on emu20k1=
")

> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> index 9d6f5df2bc7ef..e986f56c09fbe 100644
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -417,6 +417,14 @@ void ct_timer_free(struct ct_timer *atimer)
>  	hw->irq_callback =3D NULL;
>  	if (atimer->ops->free_global)
>  		atimer->ops->free_global(atimer);
> +	/* Wait for an in-flight IRQ handler before the timer object goes
> +	 * away.  A handler that already loaded hw->irq_callback can still
> +	 * call ct_timer_interrupt() with the freed atimer, and the single
> +	 * synchronize_irq() in snd_card_disconnect() only covers handlers
> +	 * that were running at that instant -- free_irq() happens later,
> +	 * in ct_atc_destroy() -> destroy_hw_obj(). */
> +	if (hw->irq >=3D 0)
> +		synchronize_irq(hw->irq);
>  	kfree(atimer);
>  }

[Severity: Medium]
Can atimer->ops->free_global(atimer) race with an in-flight
ct_xfitimer_callback() when called unlocked before synchronize_irq()?

When the last substream is freed while ct_xfitimer_callback() is inside
its unlocked ct_xfitimer_check_period() window, ct_xfitimer_stop() ->
ct_xfitimer_update() sees atimer->irq_handling =3D=3D 1, sets
atimer->reprogram =3D 1, and returns without stopping the hardware timer:

CPU0                                    CPU1 (<hardirq>)
                                        ct_timer_interrupt()
                                          ct_xfitimer_callback()
                                            spin_lock(&atimer->lock)
                                            atimer->irq_handling =3D 1
                                            ...
                                            spin_unlock(&atimer->lock)
                                            ct_xfitimer_check_period()
ct_timer_instance_free()
  ct_xfitimer_stop()
    ct_xfitimer_update()
      /* irq_handling =3D=3D 1: defers stop */
      atimer->reprogram =3D 1
ct_timer_free()
  hw->irq_callback =3D NULL
  ct_xfitimer_free_global()
    ct_xfitimer_irq_stop()
      hw->set_timer_irq(hw, 0)
      hw->set_timer_tick(hw, 0)
      atimer->running =3D 0               <-- data race on bitfield word & =
MMIO
                                            spin_lock(&atimer->lock)
                                            ct_xfitimer_reprogram()
                                              ct_xfitimer_irq_stop()
                                            atimer->irq_handling =3D 0
                                            spin_unlock(&atimer->lock)
  synchronize_irq(hw->irq)

In struct ct_timer, irq_handling, reprogram, and running are 1-bit
bitfields sharing the same storage word, and every other caller of
ct_xfitimer_irq_stop() holds atimer->lock:

sound/pci/ctxfi/cttimer.c:struct ct_timer {
    ...
	unsigned int irq_handling:1;	/* in IRQ handling */
	unsigned int reprogram:1;	/* need to reprogram the internval */
	unsigned int running:1;		/* global timer running */
};

Running ct_xfitimer_free_global() without atimer->lock before
synchronize_irq() causes concurrent unsynchronized MMIO writes to the
timer registers and an unlocked read-modify-write on the shared bitfield
word that can clobber atimer->reprogram or atimer->irq_handling in
ct_xfitimer_callback().  Calling synchronize_irq() before
atimer->ops->free_global(atimer), or taking atimer->lock in
ct_xfitimer_free_global(), would avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/48749068.582.1a212c=
2b537.Coremail.xuhx@hust.edu.cn?part=3D1
