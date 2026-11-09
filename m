Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794212208;
	b=4ibg5WMAA/oEZmp3fPWcN1Nl+DRRnOkcp541993aj4grWvA2FTh5S4p5wO1u+xQ4AVkG
	 2NbOuSM5YK5OApFViUkHfVbG4is/HoY7YY4yVhyGLP6Fy6Rc8Y6uJcn8imDoMMVBGSoNJ
	 ItcwwtE5nMxIKVFzVhQxThjGS6nuQFHXAogCpy7lLadIPvb9OQHw9nXCFEMjA7s8KACV4
	 2pFZ5PYVRSK0j3xEJj2ABFxpZWaGouT66B97S/Tb75yuKl7XzEjYMIoKgi+eEzQQxnZsN
	 2L86l1IGDMq17uwNsFfanrRbKa068m8fb247BOeMImnf28jYsTySqT4BzMXlQZtTHOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794212208;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FpfVzFvhlbAAYqdETHbZRGr7Ddey/iyxMI//oLEu0Zo=;
	b=bhutyHjVdfIHAGwORsXG3PDPU7k0ze9X11gIult4aH5OfY6pvEg+97UbxPDN2Gur708t
	 tR+zqeVX6ALilBvg24y8dHSkl2+Se76DpJInCYbIQXyo0Zvza4PeM97eR+/fVHNnnwnks
	 bBud5TSel0/pdD/JdnloB8EJULgeFbvfCdYC/HZ4KHI5Sk31ai7GSbNiif8nph4Y4j0U5
	 5humDffKJWdsZqc4N3mRssZ//MKb9fA7oaazHie2ZmlyQV4/BbIQxVec5WBojdu9IFlsA
	 6s4ymNxAWbqG63qCmaptfPrdQ1TveawiDLhrrnt4GblNM2qKNFEBnasK/a9KKt6zT9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyA5rtam;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F91B606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 08:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gyA5rtam
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14F31F0089F;
	Mon,  9 Nov 2026 08:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794212208;
	bh=FpfVzFvhlbAAYqdETHbZRGr7Ddey/iyxMI//oLEu0Zo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gyA5rtamElEXRdXT4pCIaI3PyYLv1F8fKrrOecYwLK2IMBCKS8kvfc8cGxd/gKr+B
	 thDLF9s5+VBnK/qsJOnq5U55cDLvxVG0NjKARiMlKBnVlyKLB9t3GD5nPEYsuij1AV
	 syzljmMbnGcjMG5z5E1FxUDxhdqFLr6lK4pk/Pq+OrAgHxuLoqcMzIC/is5Ra8CRxG
	 dj7FYFJDoQzTg8lNvqrJEFXJuC72yshzC7+R2STYjmQMq1YW7xg8oUrp97/oi7yTy2
	 AeaoGdlfN4jpqz14JdBza5p3xZGS6WSJEKdm5SthkVNWOXLoqXf6o/VOwuAXxZW29B
	 DYNezlEqBtjyQ==
Message-ID: <sashiko-outbox-204578@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: core: Fix signedness issue in info read callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
References: <20261109080850.2726-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:16:47 +0000
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
- [Low] ALSA: core: commit message falsely claims runtime bug in
  snd_info_entry_read()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] ALSA: info: unguarded zero-length read in
  snd_info_entry_read() [1]
--

commit b4351fe9c4662bfa6e141f7e6b6bfcf0446f56c1
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: core: Fix signedness issue in info read callback
>
> The read callback returns ssize_t, which allows it to return
> either the number of bytes read or a negative error code.
>
> However, snd_info_entry_read() stores the callback result in a
> size_t variable. This converts negative error codes into large
> unsigned values.
>
> Use a separate ssize_t variable to store the callback result.
> This preserves negative error codes and ensures that the file
> position is updated only when the callback returns a positive
> number of bytes.
>
> This prevents callback errors from being incorrectly reported
> as successful reads.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Is the commit message accurate about the runtime effect of the previous
code?

Before this patch, snd_info_entry_read() checked if ((ssize_t)size > 0)
before advancing *offset, and its ssize_t return type converted size back
to a negative value on return.  Storing the return value in ret is a clean
refactoring that drops the cast, rather than a fix for misreported errors
or bogus offset updates.

> diff --git a/sound/core/info.c b/sound/core/info.c
> index 2c2a80a7d0d2b..c16643c17ca18 100644
> --- a/sound/core/info.c
> +++ b/sound/core/info.c
> @@ -144,6 +144,7 @@ static ssize_t snd_info_entry_read(struct file *file,=
 char __user *buffer,
>  	struct snd_info_private_data *data =3D file->private_data;
>  	struct snd_info_entry *entry =3D data->entry;
>  	size_t size;
> +	ssize_t ret;
>  	loff_t pos;
> =20
>  	pos =3D *offset;
> @@ -153,11 +154,11 @@ static ssize_t snd_info_entry_read(struct file *fil=
e, char __user *buffer,
>  		return 0;
>  	size =3D entry->size - pos;
>  	size =3D min(count, size);
> -	size =3D entry->c.ops->read(entry, data->file_private_data,
> +	ret =3D entry->c.ops->read(entry, data->file_private_data,
>  				  file, buffer, size, pos);

[Severity: Medium]
This problem wasn't introduced by this patch, but can snd_info_entry_read()
invoke entry->c.ops->read() with size =3D=3D 0 [1]?

Commit d97e1b78239c ("ALSA: info - Check file position validity in common
layer") removed the size > 0 checks from driver proc callbacks, but only
guarded the callback with count > 0 in snd_info_entry_write().  When a
caller issues a zero-length read at pos < entry->size, size is clamped to 0
and passed to entry->c.ops->read().

In callbacks such as snd_opl4_mem_proc_read(), passing count =3D=3D 0 to
vmalloc() triggers WARN_ON_ONCE(!size) in __vmalloc_node_range_noprof() and
fails the read with -ENOMEM instead of returning 0:

sound/drivers/opl4/opl4_proc.c:snd_opl4_mem_proc_read() {
	...
	buf =3D vmalloc(count);
	if (!buf)
		return -ENOMEM;
	...
}

[1] https://sashiko.dev/#/bug/linux-23f2fe78-69db-4727-af8a-a7d3df991e93

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109080850.2726=
-1-sreekuttan2156239@gmail.com?part=3D1
