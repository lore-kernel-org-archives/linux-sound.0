Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793915605;
	b=jMMEUDFAyE9O06PoSV85mHvsEMBGrDiqj/P7r+SAfY+tDilgTAuqk91sfXDc2sbcDEwc
	 eqw7WKXiz4NnMDsHtRy1QZGtNaX4hPNEC8rt//wO+ZRe9/ulSvYKP0i2jRHdtG9KH4PPu
	 /36UYGJxnCVM2qezQkrIyjKMTu0AAzTyh1DFLC9g6ohyrBbqNv0RYT8SkSVxKIJxAPKVa
	 DHANx+65AoepLmcfzivtxrxuquynScKqGu7phIOpRape0eEm8fcC8YPMHNmt0C3zEhPzD
	 jen1ZwGWgV+8LgoQ/TI73JkNjjP/W/sBcMnGx/uDfV+19OXW8+2L7vYk0cf1ZGS+ucQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
	b=tM6GGj2FUAEdM7SOYasioFBYWoNU6464ueBIRjG9vnePGI5bpIYpantr7MuCE+SohpuJ
	 R2P1TBUFCVTNotkDJDUgxqRrBFHLOvPiFR6fPbHhSryYZgOomh78tnQvzo8B88YjP/z9n
	 lwEYgRF61KCW98YPgdyj1XeVV3Oh0xxEzwpfx+EfbSpVICsEqLKWSPa9k/K4g8I6sfg5x
	 OZo+YRAVHQONxzKVxjBwcFoeo0djnf86Y1aYq6bLeG1CZz38D7XsNaPw2ZHdwuR6LAnw5
	 xWnZiZIdVBJobp+bDRquAAslc4eKZebwqWiiekINzYiwGGTcy+stXp5FgXJ90WjyBdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BvKY6e2X;
	arc=fail smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C0606A33E
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 21:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7C0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BvKY6e2X
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9f6a16afcso5305ad.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 13:53:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793915604; cv=none;
        d=google.com; s=arc-20260327;
        b=hE5hwlpx816Mx7mk1W4/FndY49wpRONuazRlcNhxk8Cv0qFmq52Z1ttyTRxtYgk6ck
         rszGnqGxU2/BE55AO/mX/3QH+/Jta+yARtIdr7I7uw3BP79wA6nO0zpbaBDAHclQjiYG
         5ZKpg0PYcjn96sZQ16Gq8Sln2ud9kXKStDGquYLSTKgIRkqmR9GPw1MQvTjvjgthxcJH
         VuxuDSknRvCI8OTHL457i2tCSZvVyONWGeKxJPvGnnaBObD2xz5haqcMGnqUByqpgv15
         ZsTgt12S9BtUCzX+HqL/OexjeO950K22bXPrgru7fUOJ0Goj+E3HqxYIAtWYCuVm+gvi
         2iig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
        fh=nTqA1HU9SVUO2ySP8mjUFrFqneaEF81MUfzYRXG/IOk=;
        b=QwakSxuE98O4fzAGIxtoARPk8RhqJ0+MYZQtqf1bGRgdCjUmolvjJlCy0IV8depT2o
         +oEOJ/9fXRFqlq9UxR3/NQc/qEWXvDfHL3r2UO4a9FOO2paHkm6oOT4x7fLYCcDlwQkZ
         J/+c2cyEW55YSaBhHggY1VIBYiVtpEYPZD+//VFWLeLaSm9ESjsoENn61s4Rlx9bDdGm
         vL7Sl3Dab5Z681cLrIhIv99+vVjudPxdghejevx14A/dysaDIXG/RUqH3XuXj+zN0/+v
         tzED9Ja97T1YfG7Z4I5oh9Plqwyy5GIOs8H7AbxZYdQmlBM7SnPJVzSPqdLNUBTko0iF
         nkQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793915604; x=1794520404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
        b=BvKY6e2Xp6Ln5F/x7uNfqdzKgtfxq1IkJFx3pmCOe8AAZ8lEZ/Vyof2i0EbXWI2Kev
         o0vJTBuh5IlEZrN+FoMHcWBASIlx70c9/Adv6yKBmkGLu8NvECmBYo5BWv+20zsjaZTP
         BTJWvsdkA+A89jdxh3/XR6JKPs2jlvstBhYvKqkg694XZwu0UlHnD2bZPsyJlMu/FqI2
         5rVfmYKb5EK8qZa8eRjwlef2Q/zF4LV+SdOUFeg/3SfNdSqzrjKqO+STiWOuSDJ+5YbJ
         mpmnN23JttD9xkcrQy5mN+cuuJMA0UZNHbYctSe8k729RY9Dj4GCfWEXEAue11TzHaPK
         /Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915604; x=1794520404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1Goy7xxYTpLl6iI5Cf/SMnYKLYp7F0i7eE5R2yNQC8=;
        b=pSnJYVg4BG3u522f405nKUVaCKHIQaWp5RHhdf3G7YXm59rge3JxbDQ82vmJHMO6gc
         ip/IaAJVNTiBccAiCQygKnKIzADDbSi6IdWJIFrMPwlRdE/TIKLOALaJCX9kSkw1FFon
         tDtcA5B9J2bkdaJ7RqXCMoI7FLkJqLT5/WvoaixQjK5WhNY8Q59FWVn53vSli2lvoqxt
         7XnnGfg8avDrQHEMPk/ikfXE75T6O+tOc9/WXssDtvmWD6WGW8Ff4DNyrhwpizzlAvqz
         ZmFEJ8Ozm711VeTFQ830TO3S2xdTGej7qvCJLt1LVNCiUafnxSZGu1xI4ZeMUW4MuMx8
         ENxA==
X-Forwarded-Encrypted: i=1; AKwUvBwzUoIpAKFW999oEWPi/FHPYuqJ8SpTBFz3gj0p8A25KNuJK1uuG3JDlbdUv/640JRT//Q0DmcmhtEOHw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+noHNlqDg4m80iIU4SxU2JuHa5dr7tNYsdQSD8TqBGcCDw4rKX
	uXmebQ+X19CwPgZqjrky2xyv3Wf739um7PBkPmiOQOnPR8gCwqAYuxLB0N/0F8IJtSuq85vFx8P
	UFNqEP7tQ5XyO1C4dO3h7VoMGQowq+kFuADA2/s6d
X-Gm-Gg: AYBFou0+vC0XIOhIVwGMjyXO612n656xfaRGCTRhyUP5lQlhu5+FAYgGdR1SUrMkykM
	qIlTr12AWRixj1cebGOioNKVODhI5DiynDJM7pA7GmAkYAUPKMJxQpWAamsO3YM9P8A87bhQhNB
	eG+GLSJBHukViccv0I9ReynxXKnuSa8YNLC7N9JZ0IFG7piNd1VSheRA3SWNaGq+Er3QYyLF+PC
	Y83zHtjDRNOn2Odme26SoFUOinIoGHi6nPJRQyqt55XvrQgAFC+AySXruUf/njevgc7/hJ635ri
	Th14GhBgeUknfhGfohvu3vkHrF5v7i1OvPjskrf1wOFp+cXm6Me0oYCuNZ4GfWKl5YDbK/CHsTe
	vFvgqSsgouBlXZPwTwrzzg5iroDszoivYLk85GmYKeyNrSNTpZTt2CQAX9O2soRovnWP7mFuW76
	y8ccsaiK0/gIdMqBAmP0e2Kg==
X-Received: by 2002:a17:903:2984:b0:2ea:1fa0:8068 with SMTP id
 d9443c01a7336-2ed45dc8242mr607525ad.16.1793915603342; Thu, 05 Nov 2026
 13:53:23 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Nov 2026 22:52:46 +0100
X-Gm-Features: AclHuK--g15JMQpiUrOd3ScDdiWIvqDdktQBZHdY7lnmUTwptYJN0x-mP6LviEE
Message-ID: <CAG48ez0CTxGiZ-q73k8bNhoBTW7xZfWwARCKmmM-WKr6GNBbeQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 22/26] ALSA: info: let procfs own the seq_file
 of text entries
To: Christian Brauner <brauner@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, 
	linux-fsdevel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 8:47=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> Declare the show function and let procfs open and free the seq_file.
> ->proc_open() only sets up the private data and preallocates the buffer
> now and ->proc_release() no longer releases the seq_file. Reading an
> entry then no longer holds up its removal when the card goes away.
[...]
> +                       goto error;
> +       }
> +       m->private =3D data;
>         return 0;
>
>   error:
> @@ -387,7 +388,6 @@ static int snd_info_text_entry_release(struct inode *=
inode, struct file *file)
>         if (data->wbuffer && entry->c.text.write)
>                 entry->c.text.write(entry, data->wbuffer);
>
> -       single_release(inode, file);
>         kfree(data->rbuffer);
>         if (data->wbuffer) {
>                 kvfree(data->wbuffer->buffer);
> @@ -401,11 +401,10 @@ static int snd_info_text_entry_release(struct inode=
 *inode, struct file *file)
>
>  static const struct proc_ops snd_info_text_entry_ops =3D
>  {
> +       .proc_show      =3D snd_info_seq_show,
>         .proc_open      =3D snd_info_text_entry_open,
>         .proc_release   =3D snd_info_text_entry_release,
>         .proc_write     =3D snd_info_text_entry_write,
> -       .proc_lseek     =3D seq_lseek,
> -       .proc_read      =3D seq_read,
>  };

Is this safe? Looking at the work.procfs.cleanup tree, the
proc_release handler (snd_info_text_entry_release()) can call
`entry->c.text.write(entry, data->wbuffer)`, and the only kind of
reference dropped by snd_info_text_entry_release() is a module
reference.

I think the entry could concurrently get freed by snd_info_free_entry()?
