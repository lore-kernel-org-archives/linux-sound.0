Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697564;
	b=PQQ2G85H1c5vXGA67a0FsaQPmU4jzgJqglrdN4wRNaZ39gFfS2U+B9E4bQ7wHb9c/nnh
	 xFeY1cLnheBP9d9AoH2yhfL6qeyFflpuYO63pkTpB6h1+1tQEPY3l16ZVuSfNnWzs5dR/
	 5GN5YZoS7b1qqznOhaKrzsSCg3e9qt7OTy+oX8vZ3XlOex9yAkpYAzgH6xu5jg/hCereA
	 wROO9b+xZKZDfS03wR9axQSCDLvv9jFLwGqKxRhRhSpLm4dzxXC/4JkxEL8xj7TIyecIg
	 ciSNa7reteKZhpl5YRs3hq2JPmVxSlmHoH6s55PVkcMG13c/JQWwEyZXLckjMjEOM+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697564;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oClsXw0m8uQnuAWZuPZeEgqd0mt+HnGGFPP0+oIKVtE=;
	b=PFq5YYlhG5RT+yNd1eOFl4c1jB8tpCVrFdASI3O6w7Wl96vNvBDS52e1dcjlM3YmFDUv
	 QnkuUZ3goyUq0gkBM8D6MaujjKqfP2NyQrlCgASlGY5k0RlZRejCDVZN7XGEhrBhj+kgB
	 t4GjlYir8QE5jJFWOMNfQZOHcZwBkmyOePOBvdz/70Dov3cG1W1R+Eo5ce9B++yF24ZSf
	 KICckpEVlfCxW986r3sxY5kzeaLVT4zegHUJ2Xr6yp0jQ2BKAUTlInEn7VhEWQOSI8UZv
	 69YybmmO/ChY2kTgpuPt+Swb0nSNz5pqr5pDsZMgegjaNQL7nzevbJxMu64TVDuU9gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUHfXVSv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7786606A329
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUHfXVSv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5D61F000CA;
	Thu, 26 Nov 2026 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795697564;
	bh=oClsXw0m8uQnuAWZuPZeEgqd0mt+HnGGFPP0+oIKVtE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oUHfXVSvSS/AT++qdokh/kb04slvbV4qhrGzjnD9+liWQZRHk22QwTZ9n6Af8uvz2
	 nfVIU5teOe8/U7KoHgnUMLDDbM02iKI+TJlApYow2ein86diaVtDivOxM7jxLGtcnE
	 HxvYvxT3ckdeQs3pkjTkJgGzwQVI2BUXZMrGCHpiICroQq1CpaeNPctXmcdtoDCwRM
	 KR9vknA8VwahMYELK9jByNyYPDpaTMVcnS1w/qx6zgZ50KlhIRv/n9+oocEggM7Yon
	 pSeYAr5AwPyDR96g1XIJYx4otOvy2IDCyfz2A9tHuB/ii7IcQLokHP193K0AD2qCih
	 3NAIxu0dT5avQ==
Message-ID: <sashiko-outbox-235540@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: ctxfi: wait for a running system-timer
 callback in the free path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hanxiang Xu" <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261126202600.1-1-xuhx@hust.edu.cn>
References: <20261126202600.1-1-xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 12:52:44 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ALSA: ctxfi: unsynchronized timer delete in
  ct_systimer_prepare()
- [Low] ALSA: ctxfi: missing Fixes trailer for commit b7bbf876087e
--

commit d8e4d0ccf57d0eb54d646c6a22bbb6c5047bc713
Author: Hanxiang Xu <xuhx@hust.edu.cn>

> ALSA: ctxfi: wait for a running system-timer callback in the free path
>
> Currently, ct_systimer_free is aliased to ct_systimer_prepare, which
> calls timer_delete_sync_try(). While ct_systimer_prepare() must remain
> non-sleeping because it can run under the PCM stream lock, using
> timer_delete_sync_try() in the free path is unsafe: if the timer
> callback is concurrently running on another CPU, timer_delete_sync_try()
> returns -1 without waiting for completion. The caller then proceeds to
> free the ct_timer_instance object, resulting in a use-after-free in the
> still-running timer callback.
>
> Replace the ct_systimer_free macro with a dedicated function that calls
> timer_shutdown_sync(), which waits for any running callback to finish
> and prevents the timer from being rearmed before the instance is freed.
>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Hanxiang Xu <xuhx@hust.edu.cn>

[Severity: Low]
Should this include a Fixes tag for the commit that introduced the
ct_systimer_free alias:

  Fixes: b7bbf876087e ("ALSA: ctxfi - Use native timer interrupt on emu20k1=
")

> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> index 9d6f5df2bc7ef..fea9d61aa4569 100644
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -111,11 +111,17 @@ static void ct_systimer_stop(struct ct_timer_instan=
ce *ti)
> =20
>  static void ct_systimer_prepare(struct ct_timer_instance *ti)
>  {
> +	/* non-sleeping: also runs under the PCM stream lock */
>  	ct_systimer_stop(ti);
>  	timer_delete_sync_try(&ti->timer);
>  }

[Severity: Medium]
Does ct_systimer_prepare() actually run under the PCM stream lock, and can
keeping timer_delete_sync_try() here leave ct_systimer_callback() running
concurrently with ct_timer_prepare()?

Now that ct_systimer_free() is separate, ct_systimer_prepare() is only
called from ct_timer_prepare() via atc_pcm_playback_prepare(),
atc_pcm_capture_prepare() and spdif_passthru_playback_prepare().
snd_pcm_prepare() drops pcm_stream_lock_irq before invoking the .prepare
callback via snd_pcm_action_nonatomic(), and those prepare functions
already allocate with GFP_KERNEL and lock atc->atc_mutex before calling
ct_timer_prepare().

Because timer_delete_sync_try() returns -1 without waiting when the
callback is in flight, an active callback can race with prepare and
subsequent start:

CPU0                              CPU1
ct_timer_prepare()                ct_systimer_callback()
  ct_systimer_prepare()             position =3D ...->pointer(...)
    ct_systimer_stop()
    timer_delete_sync_try() -> -1
  ti->position =3D 0
                                    ti->position =3D position
                                      <-- overwrites zeroed position
ct_timer_start()
  ct_systimer_start()
    ti->running =3D 1
    mod_timer(&ti->timer, ...)
                                    lock(&ti->lock)
                                    if (ti->running)
                                      mod_timer(&ti->timer, ...)
                                        <-- rearms with stale interval

Using timer_delete_sync(&ti->timer) in ct_systimer_prepare() and dropping
the comment would avoid this race.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126202600.1-1-=
xuhx@hust.edu.cn?part=3D1
