Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793107406;
	b=OCC4TopNUG7a3elUZ/R8Hlr1J7T09JjQjrF2LHdyiRrZFvUOAF4LtbcAtV9s4ZULolXz
	 S/gZU1SgV2QuH6UHPDIIhlPxYenQ/7zSKHsg+3F/rHFqPYRQVTFK/Ui511dNdayWo7FQx
	 4zFF0BqQSv4rogP4h0LbcgSZCSt/4qfk5FVbRwlNg/kRuCsT958KIMA8MzEsjzDl6Jdbg
	 q2wlgB5sZt/sMO9qNd/M3hWHCK0cwtSdAMYIqnmxBKvcPFXoU1xmmBuVXQCj9tWYDp5Ik
	 kum9CIBUmYJtHG6Ztfb9qOUW50EM03kTVafQsrwq7LyyHkwfhglmGHERb0JfvlrBPwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107406;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UK0g5ntVgLraW0OSdj4e/Ih4xUxVJgxJZ7Yhpi0jPKU=;
	b=Ar2SVoJsqjoQKdGnY53tEzdUwNZR/se7wfXKcYSnehiMroMZTBEVGgFPbDXAoKpN5cLT
	 e7OLoNBtuDcLD+BnPBiyOmiewKeRbLWwl4GmoVIN5k51kGjJRn0Mkn7IkTU+juYYvgy9Z
	 POCacRkAhq10qiDrOkFzZHzv50wJDd3Dv09CssZmSF8iUEoEcKVeuF03zR6ZguR1jF/oa
	 0huVaaH3A4CB7kjo0vkdt6Dy/+TUP8sdGtNjFDuc6kyXXLpS7KoYKA+ATqsm4AuRGLWjE
	 NbYbcANE+Xk0E2C2YHhX8hcI/xdfBPWbRhrwTZ3U8tlvtCTPdh84Awi1gqSc9gRf6sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keX1MRVU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A269606A31D
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=keX1MRVU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC34E1F01825;
	Tue, 27 Oct 2026 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793107406;
	bh=UK0g5ntVgLraW0OSdj4e/Ih4xUxVJgxJZ7Yhpi0jPKU=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=keX1MRVUAt+fLUkGPOcCBq2uw7NQoN6mtbt3KW68pb8yG/PLeUI1dOnDjOpEGtCV+
	 /MaDo9Nl1qKfqVVKJqKU+k14NayraYXB5NO+VUeHwE3w3FSO/LvWkLci6d7/SKlmpt
	 CgsEsk01xgsVeTS/iPoQMf5rtWkFLNFC3hlKwxWkXout6JZi4KYq8N7ykM3LR1Q2lW
	 DyX5/cz5ZCcNsKT8mbR5sogTHXU8Jg9PpFoOjW1hc0RO5w5S9EEwHSIxl37BLsjMR1
	 fGJMLvRhWxNDOU5ZtFFGVjXtYEQIAEhQF0q2oDfPEtGGnquYXTBamO+JG4wPvhLKAr
	 6KS/PA0zroYkw==
Message-ID: <sashiko-outbox-186617@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: pcm: update state after xrun
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikael Magnusson" <mikachu@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261027131233.17692-1-mikachu@gmail.com>
References: <20261027131233.17692-1-mikachu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 13:23:25 +0000
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
- [Medium] ALSA: pcm: stale trigger_tstamp in snd_pcm_status64() after xrun
--

commit 0ae9f8a317c199a098237f1b0f0b5ebbc84be3f4
Author: Mikael Magnusson <mikachu@gmail.com>

ALSA: pcm: update state after xrun

This commit updates status->state and status->suspended_state in
snd_pcm_status64() after calling snd_pcm_update_hw_ptr(), so userspace
receives the updated state if snd_pcm_update_hw_ptr() triggers an xrun.

> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 35152fae74ca2..62a2bea043e38 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1132,6 +1132,9 @@ int snd_pcm_status64(struct snd_pcm_substream *subs=
tream,
>  	status->trigger_tstamp_nsec =3D runtime->trigger_tstamp.tv_nsec;
>  	if (snd_pcm_running(substream)) {
>  		snd_pcm_update_hw_ptr(substream);
> +		/* update_hw_ptr may have put us in xrun state, update state */
> +		status->state =3D runtime->state;
> +		status->suspended_state =3D runtime->suspended_state;

[Severity: Medium]
Should status->trigger_tstamp_sec and status->trigger_tstamp_nsec also be
updated after snd_pcm_update_hw_ptr()?

In sound/core/pcm_native.c, snd_pcm_status64() copies runtime->trigger_tsta=
mp
into status->trigger_tstamp_sec and status->trigger_tstamp_nsec before call=
ing
snd_pcm_update_hw_ptr(substream):

sound/core/pcm_native.c:snd_pcm_status64()
	status->trigger_tstamp_sec =3D runtime->trigger_tstamp.tv_sec;
	status->trigger_tstamp_nsec =3D runtime->trigger_tstamp.tv_nsec;
	if (snd_pcm_running(substream)) {
		snd_pcm_update_hw_ptr(substream);

When snd_pcm_update_hw_ptr() stops a running stream due to an xrun via
__snd_pcm_xrun() -> snd_pcm_stop() or drain completion via
snd_pcm_drain_done(), snd_pcm_post_stop() updates runtime->trigger_tstamp to
the stop timestamp alongside runtime->state:

sound/core/pcm_native.c:snd_pcm_post_stop()
	if (runtime->state !=3D state) {
		snd_pcm_trigger_tstamp(substream);
		__snd_pcm_set_state(runtime, state);
		snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTOP);
	}

Refreshing only status->state and status->suspended_state leaves
status->trigger_tstamp_sec and status->trigger_tstamp_nsec holding the old
start timestamp while reporting the new stopped or xrun state to userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027131233.1769=
2-1-mikachu@gmail.com?part=3D1
