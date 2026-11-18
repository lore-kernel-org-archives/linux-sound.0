Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010758;
	b=DyPicipY9WXskBD3ZXCZYiGKBqNbmVIMNxKpIg/mnGrtf8YoB60qY3kRKbbe0AvfFcz5
	 oGyrYEV3CPMkE2Y+FWuFIcWHNZs7448jP+8qJWc5TcgrUJ37bPYarvLRBHmBfL92/rmja
	 ddh/5Mm/u0Ygn2j9urZTZbR0SLqOoahAUhtfoxZhWBBQdVqLiWhXTYXhULbaIJQcqUG0S
	 mMWv34naO0VUbcfhdchDjvdEx/OQMi8tZ3GJ5FqO/v2exFY4w3aJXFifJoFcvZhdjVUGr
	 HD7aMsinV5iayo9FstSXgJ58BaIfbpLccGeKXQ9KGl4PmmdqisnGqUQ5597GzWLVuxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010758;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wRpbbpePlydfAdMKiQx+NnFzQFD7bLOj6aiASlZ8g0Q=;
	b=ZbquXGSwwQiUqwwLNmS5JmeU4FEm3lc0S/UsMVU2/haCZs0e1a4hV0sLhrOcn6YxePhZ
	 Uy1xMPqs1AQ8sdBzD58+k3JDsiobvxC4Otn2JpWT3TWDUdJ55wAfcGITKao/vBaJeEpg+
	 0P77EWQH24YcjA9PD4qQTR3i+FG4HIw/r8CSSLYUAFXo1/VeyjIh8dm90jwPk9e+92Ran
	 RVwC+tYSAQxbPLYKl+gy6sJwwl2I1kPwrlrrDDLLyX85Z9pahhbvYYWJCbTcm73yuntns
	 I2KgQ0PXZnpyQTPma+MteC/4k0UXezjShCUh6jAAtnZKWnFHBtVifbYKeyktad9Ufgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbTa5tBs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD81C606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PbTa5tBs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3783E1F000C4;
	Wed, 18 Nov 2026 14:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795010758;
	bh=wRpbbpePlydfAdMKiQx+NnFzQFD7bLOj6aiASlZ8g0Q=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=PbTa5tBsaS9ZnxmtH8CBMHx8cyYsBu2YCyQmbPOuZKPDctcZoax188lJyVbHEW/5a
	 +59BvzCUL5JvefJVQJRAUHfMVu68AZuSN2N4QsvJ9vxPI4lbDu0Vi2ZePD2452t2D/
	 2aDKdTq6pm4yt2D5hT6BkuMtpqohEUvzuCoqxQuwV5sf7bvp8XweZOlD+T0B2zP0Oo
	 8NF8P+XjQmJUbG9R1qw5PLVUfUZkWg7gejh0RUmHYrFuC9v2/kQ1xLufnsBpHWktTO
	 I21XXAlPaJptX93Pax8xC2XMRP8J6CP15KgyQSI4OGFmf10qodygHZ90dnOvTDCaHe
	 ODcpzLeP4v+rA==
Message-ID: <sashiko-outbox-221145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ALSA: pcm: Simplify PCM buffer access gate with
 auto-cleanup helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
In-Reply-To: <20261118135558.1928160-1-tiwai@suse.de>
References: <20261118135558.1928160-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:05:57 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] ALSA: pcm: ABBA buffer_mutex deadlock in snd_pcm_action_group()
  [1]
--

commit d0980124f5997cb84d7f6bc11cd87fe287a3f5a9
Author: Takashi Iwai <tiwai@suse.de>

ALSA: pcm: Simplify PCM buffer access gate with auto-cleanup helpers

This commit introduces helper functions and auto-cleanup macros for the
runtime->buffer_accessing gate and replaces open-coded
atomic_inc_unless_negative() and atomic_dec() pairs with them.

> diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
> index 4b134d435c24f..7762c89e0f9ff 100644
> --- a/sound/core/pcm_local.h
> +++ b/sound/core/pcm_local.h
> @@ -86,4 +86,30 @@ static inline void snd_pcm_dma_buffer_sync(struct snd_=
pcm_substream *substream,
>  #define is_oss_stream(substream)	false
>  #endif
> =20
> +/*
> + * helpers for restricting hw_params / hw_refine changes
> + */
> +static inline int snd_pcm_buffer_access_get(struct snd_pcm_runtime *runt=
ime)
> +{
> +	if (!atomic_inc_unless_negative(&runtime->buffer_accessing))
> +		return -EBUSY;
> +	return 0;
> +}

[Severity: High]
This problem wasn't introduced by this patch, but on the paired writer side
[1] can concurrent non-atomic group actions on two substreams in the
same linked group cause an ABBA deadlock on runtime->buffer_mutex, while
leaving runtime->buffer_accessing open on the other linked substreams?

sound/core/pcm_native.c:snd_pcm_action_nonatomic() {
	guard(rwsem_read)(&snd_pcm_link_rwsem);
	res =3D snd_pcm_buffer_access_lock(substream->runtime);
	if (res < 0)
		return res;
	if (snd_pcm_stream_linked(substream))
		res =3D snd_pcm_action_group(ops, substream, state, false);
	...
}

sound/core/pcm_native.c:snd_pcm_action_group() {
	snd_pcm_group_for_each_entry(s, substream) {
		if (s !=3D substream) {
			if (!stream_lock)
				mutex_lock_nested(&s->runtime->buffer_mutex, depth);
	...
}

snd_pcm_action_nonatomic() only takes a read lock on snd_pcm_link_rwsem,
locks the caller's own runtime->buffer_mutex first via
snd_pcm_buffer_access_lock(), and then locks the remaining group members in
snd_pcm_action_group():

CPU0                                   CPU1
----                                   ----
down_read(&snd_pcm_link_rwsem)
                                       down_read(&snd_pcm_link_rwsem)
lock(&A->runtime->buffer_mutex)
                                       lock(&B->runtime->buffer_mutex)
lock(&B->runtime->buffer_mutex)
                                       lock(&A->runtime->buffer_mutex)

 *** DEADLOCK ***

CPU0: snd_pcm_prepare(A) -> snd_pcm_action_nonatomic() -> snd_pcm_action_gr=
oup()
CPU1: snd_pcm_prepare(B) -> snd_pcm_action_nonatomic() -> snd_pcm_action_gr=
oup()

Because both deadlocked tasks hold snd_pcm_link_rwsem for reading, any
later attempt to link, unlink, or close a linked PCM stream across the
system also hangs waiting for the write lock.

In addition, snd_pcm_action_group() only takes s->runtime->buffer_mutex on
the other linked substreams instead of calling
snd_pcm_buffer_access_lock(), leaving s->runtime->buffer_accessing unset on
those substreams during prepare or reset.

[1] https://sashiko.dev/#/bug/linux-a75ec171-40b4-4d70-8ffc-fddd01a5c9ca

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118135558.1928=
160-1-tiwai@suse.de?part=3D1
