Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148361;
	b=CyCkCiFWLzvgUCGIy5pmwJ2PD/DQhQh2tkuCvnQalI3OibFbPOpvae3+jJW5OM30wDpC
	 3C+r7NjLvmkRU8IB7P6Tf7xf1i52xbEtvwTvVkZwHuNLWvvnHI+7cRF70RmxFDiOavi6U
	 P3Nar2TVzqcrV00UpvV+Chlf0ZAmB+1Ynl7qk3wJoniVM2pV5tjWBojA6HqXh4vzn5IUf
	 UwjzPK16GDibvgiKfvf+done4bCtC4dSYZjHVMDhVHeqRTgXRUB9mBcgK75gZFHGCn4sb
	 q+39xm3DZtkONpa3iVWA+w2Z1ztCwDg2XDXHgChuVOKvtbaU6XrMWArP7NEtzZ22XYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148361;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oLFLlprcoyh9ZasFAgFJ7Lt1X9B5H76hMWkm0PFdwEU=;
	b=eeVOUU0oL6rVx3yhI5/kJ0nxJrrsiX7TYNtLuszKOD+7JYoD1OwquESLusZ6abSPWhLw
	 BPzaf57FwBuDMU1zGcvMYKQ0c0owQXX/2KS3znH3XLDrQCtUYi7a+KQ3Nt7mkRPrP/3RQ
	 wNC3hcAt3NIYZyY+SPJQ2Eyn3v/PVIs0TzWNNSfAjeyzVBhrGWuFt+h3L6Xh32C7H16Um
	 znyUkETRUaJeLk4z8t86lslfj3cvOHzTMtsSOHJFOPeyTrtm9YbsGCyDPz5lYjXoJ91Jd
	 nmx0LCo4UH6BoOuEOhFvQMKsPVxtKOne/eD3ohTPr6//WJSdjZsDFVwxmx1QnapoPww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="On2Uj5/T";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57C0606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 14:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=On2Uj5/T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3B6D1F0089F;
	Sun,  8 Nov 2026 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794148360;
	bh=oLFLlprcoyh9ZasFAgFJ7Lt1X9B5H76hMWkm0PFdwEU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=On2Uj5/T+XkH6bBq5jPd0SlAjS+fHu+AXFCzfRZL5eFRDK17pw9pv+ra6NgeX7Czp
	 aX2+mnzypHgoP2by3CnoFHMb0Tsc+DvLLUrFuHfnC3+QyR8curEunXCaIED4z6HL9k
	 tc91S1T0yJnHr0rRWWhy8CG++Cdj9YtEreB03+5lBGVJJN+GRXLdG1J+/BshG6Ivt3
	 36iqii36gW/+RoTQ62CQmq9zCi36Gbnfs1y0TR7NIuNZyGOq90BicNjSYgcoJcmlMC
	 ARwWk6pbY9pcnG5G8lyFCH2yj7FAUnLCUnehOrQWLYezui8cXkJGfDZqup7yom24SV
	 MGdI89fRg4hog==
Message-ID: <sashiko-outbox-203810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: control: Validate element info in compat ioctl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
References: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 14:32:39 +0000
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
- [Medium] ALSA: control: uncanonicalized info->id passed to
  snd_ctl_check_elem_info()
- [Low] ALSA: control: get_ctl_type() logs error and returns -EINVAL
  before access check
--

commit 9a7d77a704b4390365c1a1e35e66790644d2b85a
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

ALSA: control: Validate element info in compat ioctl

This commit adds a call to snd_ctl_check_elem_info() in get_ctl_type() to
validate the element type and count returned by a control's info callback
in the compat ioctl path.

> diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
> index 87f7ad5ab7391..cad00d4aa2048 100644
> --- a/sound/core/control_compat.c
> +++ b/sound/core/control_compat.c
> @@ -183,6 +183,10 @@ static int get_ctl_type(struct snd_card *card, struc=
t snd_ctl_elem_id *id,
>  	info->id =3D *id;
>  	err =3D kctl->info(kctl, info);
>  	if (err >=3D 0) {
> +		err =3D snd_ctl_check_elem_info(card, info);
> +		if (err < 0)
> +			return err;
> +
>  		err =3D info->type;
>  		*countp =3D info->count;
>  	}

[Severity: Medium]
Can snd_ctl_check_elem_info() read past the end of info->id.name when
logging an error?

copy_ctl_value_from_user() copies id directly from userspace, and when
id->numid is non-zero, snd_ctl_find_id() resolves the control by numid
without checking id->name.  Unlike __snd_ctl_elem_info(), which rebuilds
info->id from kctl->id via snd_ctl_build_ioff() before validating,
get_ctl_type() passes the raw user-supplied info->id to
snd_ctl_check_elem_info().  If validation fails and the 44-byte
info->id.name buffer is not NUL-terminated, the dev_err() %s format reads
out of bounds into adjacent fields of struct snd_ctl_elem_info.

Rebuilding info->id with snd_ctl_build_ioff() before calling
snd_ctl_check_elem_info() would match the native path.

[Severity: Low]
Does calling snd_ctl_check_elem_info() here cause compat read and write
ioctls on large TLV bytes_ext controls to log a spurious error and return
-EINVAL instead of -EPERM?

Legitimate TLV-only controls such as ASoC bytes_ext controls can have
info->count > 512 and set SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK.  In the native
path, snd_ctl_elem_read() and snd_ctl_elem_write() check vd->access first
and return -EPERM for TLV-only controls, and __snd_ctl_elem_info() skips
snd_ctl_check_elem_info() when snd_ctl_skip_validation() is true.  Because
copy_ctl_value_from_user() calls get_ctl_type() before the read/write
access check and without checking snd_ctl_skip_validation(), a 32-bit
compat ELEM_READ32 or ELEM_WRITE32 on such a control hits dev_err("invalid
count") and fails with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108141219.7655=
-1-sreekuttan2156239@gmail.com?part=3D1
