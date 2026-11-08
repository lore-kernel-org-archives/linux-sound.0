Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794155138;
	b=OPmbYYjG0y83bJY32xvRAi44yw+W9eho0gJR6l9ser+dV1tNxR+KlY1ZA1CpfiP6EQgk
	 dH+Z6HCGfLih3PyFRzKdzxIaJYixQMg5/1Mp4ZHHQKkdBQQZDz6CIZd2Tk9IQCjPhwzBD
	 qGBDdX+PzFz4PhP6lXtXIdmSKD/q4jzz4z+xgdP1wNzQb6nE8APdnrtgJ45M1uNvgkjRH
	 9IRhQybdzHRIF3/74yDS9UpzEUPc8Lc8lb0pA2isnlwRGWuPgj9guyKWK0VYoFfa60+Tm
	 W4DtIoKZTknAnV47ddMk40+mJ6P7/DEmijQHhxf6TGSlY7jlP5KttCW0nksoPMc+98w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794155138;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xcXJKFMytXyhxcez+VJgOeP8Xq//O33Ys6BZCkgqrIg=;
	b=uH0B/BrMF1c7vaKFsfT+xaQAUjBINtU6f1k6C0poWlkvCZimO5NSrh5GcEAA2TJi0h1z
	 jOXp9biTyxMKuI0vcQSX3a97QzYolN4/aKGCJG7QHVWRGq5qYDexGQc4Rz6bfzrTEHW2K
	 wC4PbUbiK9x80fweR+kQwt7djcDSsJFRe/kPjZiDBE9PnFkSfbuEVc4UMaLimmRzafZ9y
	 y581IHUTs0XCeNZxaxoz+j1XRJtktJNcTIcN58AVOo8oJOvJ/b4Lvl0E28BwH1CvBo+m0
	 sQXONALKELe7PSyIPgTjdWoVq6l04Po4wu2TJSZcctmAuponHGGkRZktA43vmRUhZCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="CySbd/2P";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0670606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 16:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CySbd/2P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4124D1F0089F;
	Sun,  8 Nov 2026 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794155137;
	bh=xcXJKFMytXyhxcez+VJgOeP8Xq//O33Ys6BZCkgqrIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CySbd/2P4TJH0S7VG88o4LuPxfG9xfHdJcwPwX80Vji6klgVUl1WHJWDf6vox1hBp
	 bK8nLSXRsLfy3vy1Bh8JAUVh75kO3/McJvQ27QDa5D8xQ+q3fuKtVvYu1Axo/3JAUY
	 AqXptvo5agfBHcYvNpFRu+0XxmUqaBgU1s7A3wOvqkGZau2tXVYKQXjoKwvZ9q+8SN
	 G/JxiPzuH++/sFaFtB24q+7L8GQ85XEhhMaulHBHRdDz2d+0N/gVTsQjSw4ahCyizY
	 22BZTanmaK3x4l5w3AmCCvuiI2zNHKSEronoQBTA0l99Uv8VtEav0PfBr7kDxf2VhT
	 1k4j6uZ3OpWzg==
Message-ID: <sashiko-outbox-203877@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ALSA: control: Validate element info in compat ioctl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261108160925.8774-1-sreekuttan2156239@gmail.com>
References: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
 <20261108160925.8774-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 16:25:36 +0000
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
- [Low] ALSA: control: get_ctl_type() duplicates __snd_ctl_elem_info()
--

commit e7c5b72d570147881e5fc3076a50929183e5bf55
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

ALSA: control: Validate element info in compat ioctl

This commit validates control element info in get_ctl_type() for compat
ioctls by rebuilding the element ID, setting the control access flags,
and calling snd_ctl_check_elem_info() when validation is not skipped.

> diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
> index 87f7ad5ab7391..0c1b80c856f26 100644
> --- a/sound/core/control_compat.c
> +++ b/sound/core/control_compat.c
> @@ -169,6 +169,8 @@ static int get_ctl_type(struct snd_card *card, struct=
 snd_ctl_elem_id *id,
>  			int *countp)
>  {
>  	struct snd_kcontrol *kctl;
> +	struct snd_kcontrol_volatile *vd;
> +	unsigned int index_offset;
>  	int err;
> =20
>  	guard(rwsem_read)(&card->controls_rwsem);
> @@ -183,6 +185,17 @@ static int get_ctl_type(struct snd_card *card, struc=
t snd_ctl_elem_id *id,
>  	info->id =3D *id;
>  	err =3D kctl->info(kctl, info);
>  	if (err >=3D 0) {
> +		index_offset =3D snd_ctl_get_ioff(kctl, &info->id);
> +		vd =3D &kctl->vd[index_offset];
> +		snd_ctl_build_ioff(&info->id, kctl, index_offset);
> +		info->access =3D vd->access;
> +
> +		if (!snd_ctl_skip_validation(info)) {
> +			err =3D snd_ctl_check_elem_info(card, info);
> +			if (err < 0)
> +				return err;
> +		}
> +
>  		err =3D info->type;
>  		*countp =3D info->count;
>  	}

[Severity: Low]
Could get_ctl_type() call __snd_ctl_elem_info(card, kctl, info, NULL)
instead of open-coding this sequence?

sound/core/control_compat.c is included directly by sound/core/control.c,
where __snd_ctl_elem_info() already invokes kctl->info(), rebuilds
info->id, sets info->access, and runs snd_ctl_check_elem_info(), just as
snd_ctl_elem_read() and snd_ctl_elem_write() do when passing a NULL
snd_ctl_file pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108160925.8774=
-1-sreekuttan2156239@gmail.com?part=3D1
