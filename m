Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676578;
	b=rZDglCaUMpSW0jek/9JZ3Ftq26Kpf3MJoOxHRwX7Qt7iycv30ehvFBP8lzEsypUVkQ1W
	 SnOKUaQRn0HcFf/xl6dXdnUC8XeLGlwtUsvd0YoCPb3vs29PH/Ikv+1fl10DBm7U6czKz
	 OJasUYVzfWusyFHMS7Uthc1revBsaxhfQZqeOYkuljO2UEeI79bHw25E5Ibvs6H9ay8Vl
	 obqrv1kgzEPcyEi/JBho/mURoVicCfsq1jUXShF32N3vVj2LWapNKDxK6h99ti1ML5kyg
	 m0ww5ENU90NCYgnojrOwNCNSwo/7ovQ2AIuoH9OiyY+8kuebUjXjYTK8vxUmaW7gyJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676578;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=43+J5GMVxKGHDmT8ulmjUhfbQ/FBG96v85hMGR0xRUE=;
	b=aE5yphktjlF6fHPUr8dVsbBHIcBDBqnZqNVeEk1wkRE5XI47u2f/frS5aAKCNcmz0gDD
	 59mJEQMnO/E2EMyQIP/EiRVCmJSHtcyI7d2hVNh3HcrdHbLxqLfYcIEGoHBLWD8j68OoB
	 7T1kAPnqKJAbO44nHwu8YP2cWCKirlAnATye+EEzlkigxpl69SdZCavycJ8rDzZLkYFKL
	 kubSNiPfHlfA8vrugIpDLzKTClV8J9xZhXsTOGKfUM142M+tAq/OMhwTf2n2dmkPfV8aS
	 GC2so+/uvLAxbK1CobfBlFRL7pLcI0IikK9EWxx7FxN2/Vv6UwefUo3i7EGh4owMeXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckdWCyHg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17313606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 07:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckdWCyHg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548AD1F000C6;
	Thu, 26 Nov 2026 07:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795676577;
	bh=43+J5GMVxKGHDmT8ulmjUhfbQ/FBG96v85hMGR0xRUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ckdWCyHg0tByMCXSpf4vIMMT1o82Q9zgpBrxZmlobUNqqGaFa7PcKtGj04JuEJQso
	 lyIREkBjojGtqML8W/LrHqfY2tTjyicIFvcWog7Bb/rmW5KDnIAnqPdc9cZaKlgkhb
	 +ma4qVWeZXlfUBkQZ74zoPYG4JNKzoc6B/7ISbSsFOhqmwUjKCkqQF2dGD57IVrMXm
	 sawcU76KU/3eReGVslqV1Cla8eRwa5J/flOQx/4bFKL4nb2/E2TkytyULUeRxHc0Um
	 LnvgMw7IE/tbBx21gI/JjxwWxKMwB9LvaURSBzU/HJpRm6g34sG3CokjL9xRDjceEB
	 Sf7h+LS9wC35Q==
Message-ID: <sashiko-outbox-234925@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: vmaster: Check follower callback errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261126065310.3451-1-sreekuttan2156239@gmail.com>
References: <20261126065310.3451-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:02:56 +0000
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
- [Critical] ALSA: vmaster: use-after-free in sync_followers() [1]
--

commit e1ba86351d2c61db18d124cbf361fe1a670040d9
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

ALSA: vmaster: Check follower callback errors

This commit checks the return values of follower_get_val() and
follower_put_val() in sync_followers() and aborts synchronization on error.

> diff --git a/sound/core/vmaster.c b/sound/core/vmaster.c
> index f43144ba27978..88b38ee5ba5f6 100644
> --- a/sound/core/vmaster.c
> +++ b/sound/core/vmaster.c
> @@ -345,17 +345,27 @@ static int sync_followers(struct link_master *maste=
r, int old_val, int new_val)
>  	struct link_follower *follower;
>  	struct snd_ctl_elem_value *uval __free(kfree) =3D
>  		kmalloc_obj(*uval);
> +	int err;
> =20
>  	if (!uval)
>  		return -ENOMEM;
>  	list_for_each_entry(follower, &master->followers, list) {
>  		master->val =3D old_val;
>  		uval->id =3D follower->follower.id;
> -		follower_get_val(follower, uval);
> +		err =3D follower_get_val(follower, uval);

[Severity: Critical]
This problem wasn't introduced by this patch, but can traversing
master->followers here cause a use-after-free on follower [1]?

When an unsolicited hotplug jack event calls snd_ctl_sync_vmaster(), it
invokes sync_followers() without holding card->controls_rwsem.  A
concurrent snd_ctl_remove() can unlink and free a follower via
follower_free() while the list is being walked:

CPU0                                CPU1
snd_ctl_sync_vmaster()
  sync_followers()
    list_for_each_entry(follower, &master->followers, list)
                                    snd_ctl_remove()
                                      follower_free()
                                        list_del(&follower->list)
                                        kfree(follower)
      uval->id =3D follower->follower.id;  <-- use-after-free

[1] https://sashiko.dev/#/bug/linux-922db78b-8e7d-4396-bf14-07bd594a9a8a

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126065310.3451=
-1-sreekuttan2156239@gmail.com?part=3D1
