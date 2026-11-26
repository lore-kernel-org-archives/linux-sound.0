Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678740;
	b=L4ktKGHNwNW7HFSYmOBTvt86f6qGOyaaEvXifZv4c78+m39rc6zSHDvDRBuQ7ehdc5QE
	 7SI5PiQKotD5iKp3jQyoybMtosX3qe0w8qmSTbYgGTt6lciJtlJilXgxpie7iQ+F7YQbg
	 vUMz/B68H3B/IOK1415ksVoG32SXTRUOAZWcQSUaftrQj7iBZRCw+Ev+q3ar2liHdCL+H
	 LB9LkqpvjHaQrQROF0gwhGmPZxPUTwW1wv15YUW71c5G6DFaXgBNzmcaJRjQmNyRMySan
	 9EZj/3HdfhCdEuxpu28dfO8G4J0XIpgmpH7tgGIfo0WYSTlsz0bJoy6y67ziExdvOxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678740;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KKg+w2YQTfN/7PhIR7B14YZijOJ+PFlEEawJkNXoJUc=;
	b=TBQzUAOrUsEvfaAf0MiUJYaue20gGoWMSQEZKZCIScumaePFY0T+3DNnTM9VAtJbVCDq
	 YULARQrtE3cLCqrjm8tsPq/00RtdmOBQC2vY1ipSw/JOHZV6LcIEWTHoRyNmQXdi4Ax+B
	 8MfO7e+LH3LfealETJv0l50fF46gknnQjz/veX7QzlAOKia/kyt6G9pB3k+amM/LRW+j5
	 lUSV9GANFuj4kDCInmd/d3YjCY/8vN7b9reHmyKcyJD7X9vAAYR/7mT0wkCzlnsUR4EHh
	 f2HZLJHA4+sYQL2o8sGz1zpDoz3pX6BUevxw5qFqOftLZtDhoddIs6hIlVtVY3d62aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NV3jWw8T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3F606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NV3jWw8T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665BA1F000C0;
	Thu, 26 Nov 2026 07:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678740;
	bh=KKg+w2YQTfN/7PhIR7B14YZijOJ+PFlEEawJkNXoJUc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NV3jWw8TgBlGXdtmQZPD+6egJgosSXWBqB/OuShah9kFsPjkjRw0fEqkDd75bmgqE
	 5Z+Lkqal4hNcoAoLm12UAFnoBAfX1Y5Qwo7yLsqAPxE0tSK+2U/I47nRLkd98qHCCm
	 WcVal70CUMz5lAJ86XF1bQ96IQrVsNVcGvCwxtg/zznoSbn9igcsec7PEuSpTusbiX
	 1S1/f2k8Ntu2mBjnuQ6hNZh+JIKa6WTTTnsuvpNAfMNpeydlTgaMH79I6HgTkmNePa
	 H/YvevseTcboTAdrzZOaKj8hyU9wNig9qxf7tTys2mcbDlXSLFQ32si30tWfzf3hcl
	 qt2+55On11Jnw==
Message-ID: <sashiko-outbox-234965@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: vmaster: Retry follower initialization on failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261126072220.4496-1-sreekuttan2156239@gmail.com>
References: <20261126072220.4496-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:39:00 +0000
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
- [Medium] ALSA: vmaster: uninitialized uval passed in sync_followers()
  on init failure
- [Medium] ALSA: vmaster: race on follower->info.count in
  follower_init() under read lock
- [Low] ALSA: vmaster: missing Fixes trailer in commit message
--

commit 66386ac7ea387abe74516a97a7585d68c50638a0
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: vmaster: Retry follower initialization on failure
>=20
> Reset the follower count when the initial follower update
> fails.
>=20
> This allows follower initialization to be retried on the
> next access.
>=20
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
This is a bug fix for follower initialization failure handling.  Should
the commit message include a Fixes tag, such as:

  Fixes: 3b0a5f22d464 ("[ALSA] Add virtual master control helpers")

or:

  Fixes: 2e2c177ca84a ("ALSA: vmaster: Propagate slave error")

> diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
> index f43144ba27978..d97d7bb33e166 100644
> --- a/sound/core/vmaster.c
> +++ b/sound/core/vmaster.c
> @@ -102,7 +102,14 @@ static int follower_init(struct link_follower *follo=
wer)
>  	follower->info.min_val =3D uinfo->value.integer.min;
>  	follower->info.max_val =3D uinfo->value.integer.max;
> =20
> -	return follower_update(follower);
> +	err =3D follower_update(follower);
> +	if (err < 0) {
> +		/* allow initialization to be retried */
> +		follower->info.count =3D 0;
> +		return err;
> +	}
> +
> +	return 0;
>  }

[Severity: Medium]
Can resetting follower->info.count to 0 here cause sync_followers() to
pass uninitialized or stale uval contents to follower->follower.put()?

master_init() only initializes the first follower in master->followers.
When sync_followers() iterates over a subsequent follower whose
follower_update() fails, follower_get_val() returns an error without
populating uval->value.integer.value[]:

sound/core/vmaster.c:sync_followers() {
	struct snd_ctl_elem_value *uval __free(kfree) =3D
		kmalloc_obj(*uval);
...
	list_for_each_entry(follower, &master->followers, list) {
		master->val =3D old_val;
		uval->id =3D follower->follower.id;
		follower_get_val(follower, uval);
		master->val =3D new_val;
		follower_put_val(follower, uval);
	}

sync_followers() ignores the error from follower_get_val() and calls
follower_put_val(follower, uval).  Because follower->info.count is now 0,
follower_put_val() skips its per-channel attenuation and clamping loop
and passes uval directly to follower->follower.put(), writing unclamped
stale values (from the previous follower) or uninitialized heap memory
(if the first follower has SND_CTL_FOLLOWER_NEED_UPDATE) into the
underlying control.

[Severity: Medium]
Can a concurrent control read or info call observe follower->info.count
as non-zero before follower_update() finishes, bypassing initialization
when follower_update() fails?

snd_ctl_elem_read() and snd_ctl_elem_info() hold only a shared read lock
on card->controls_rwsem when calling master_get(), master_info(), or
follower_get():

CPU0                              CPU1
follower_get_val()
  follower_init()
    follower->info.count =3D
      uinfo->count;
    follower_update()
      kzalloc_obj(*uctl)
                                  master_get()
                                    master_init()
                                      follower_init()
                                        if (follower->info.count)
                                          return 0;
                                      master->info.count =3D 1;  <-- skips =
retry
      follower.get() -> fails
    follower->info.count =3D 0;

If CPU1 enters follower_init() through master_init(), it marks the master
initialized from a follower that failed to initialize; if CPU1 enters
through follower_get_val(), it copies unpopulated follower->vals[] to
userspace.  Setting follower->info.count only after follower_update()
succeeds (passing the count to follower_update() or using a local info
struct) would avoid publishing an incompletely initialized follower.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126072220.4496=
-1-sreekuttan2156239@gmail.com?part=3D1
