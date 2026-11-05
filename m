Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793915804;
	b=kIjGfvEbGNCYSI/9KeBUHAUT6MNxjIDyo62YjlXENVOHwubPwp2n1UJ5GNTkVQIkeaDo
	 4Jb6i1zhofGqs4XuCKSwT9L0nYPv7UEiACEk0dvHx18+/pII1TrmSg2IQTvcmIifSWKIC
	 QnSW7bMfWi/Of9CFX2eU0xMK9wJd5N+b59oeIRJQ+1Wzr+EKQCVG1CjhJOQ6AfVGrtRvz
	 alFGTeuZmS6ggzP5YxAt2boRZvtRhj6hHSo2jnbIaIQnMu2HBRmsbiX7r2cM1gqxme3zw
	 tS52MW/KedWUXQG8Lh5y/wqCEakowVuctzNJ0SBjLgsnA0iBNhLVdoywsJNynBNtxLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
	b=HPhTyKn4UFLCxEs960ebiLLTrtk+pWKBy4r4SmdD12MS69dotO6lFxiutaS+pThnYY3F
	 IGopDH4E9Pz+pS6sR6XL37BgO2r/tSv02ZBYUZrVsUrmyEQ8l9YMAhb+P3jsHJ6ehpQbs
	 MAUVCRia/YN9tQKv6k2idQMBAvsgMv6+zgeMQpwnosHREz8U51oCDXxLeVqiZ4+NqZ+iY
	 Fg75Zr+3C0b3PhgtxBQtuZa+Z50NKuiLq7lH8sm1+ffDuONOuXcl7DMjus4gcziXWlwYz
	 kPrQy+ZwpTqVQGCG01T+VUWCMdBSCM3P6K4LDwPyWkA9cpdk0Io9Ra+N8VzyV6KGAww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LTjaWOCa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE38606A328
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 21:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE38606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LTjaWOCa
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so6635ad.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 13:56:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793915803; cv=none;
        d=google.com; s=arc-20260327;
        b=PhCwDB9aL6CU3tpQH3jJJw3FZc6vdMEQr2XRXitXMmeeLTtd3TQnhdg+YOWxlXRNRW
         gelcvLd0xOwG+xd2zkpPwksQt1lfImwKKLAufOOtXd3ynhhqRNIkcE7SU8EbPHjS2yrF
         kylb+SZTRYxcerir4FSxKirJsxo+FNjXAJL8yHlm8eHbDaLg9BCoqxAGhLu0YyaCxZvO
         j0zhFHkvhxZsUMzNWRZejN6xI7in4o26MUvfKhtVfmNhkUB49FhfDu88ZM2AZ3qX0qD6
         P2TsP+szxs0+7dS5LFgv4NussIgiCWeSZ/8NbBiobveZOaWyTNUgWgCAY4SNHj2iFRCM
         n1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
        fh=W3llEFh8UVvaLHtlCJFDyE/LWqLlVI/lpz1V8FVI2VA=;
        b=N9rJc34hX98/8s39+jrZPJMSLrFYFUNLfRYA1DKr89Etig9N2tlfK9nBwBKmz3rheZ
         Rsn/TaV6Di7XKmJgwJgLicJOn/AzMdYqvzizX1Lf4rikkY1HyFv3x9g79kKpvsxpny2B
         J7YX5bEvx/ODQ3P9Z5zJQvFjbEQh32CJINNWRoz8eia672ZR5h9tRrSzEiBRIhnEjrIj
         Rq13p7T/bu8c68wOVCGcdGVIeRysZjCHvF4ZiYgQubar1lBPj9Rp5vvx8OOBJsc4b0Jn
         KoC6bfvgaEsz9nxjSg/5FcU1WSQnNp03hgFnN1VYBcmGB2WoFziXOKtuSdxxVM15Fqlj
         HlYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793915803; x=1794520603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
        b=LTjaWOCad7naX2ksiiBJ/btHekFdZApACmal8hPWqhq5JTA4qdSbJMprCg6ugYPYNA
         J8eA6cx2/mRXlQh0tYfVH5FsHYog9yckNpHPxTA2W7usUF+DXqORKmPcOdBxQaPH04Ec
         JAabj/UWXm1wD6MTl+JJ6as8ddea4sbRPDknOX4MZZuRL3csCqDo6XE836dLM7/uvi8X
         n40i3QvH39VcVbV4DVpZUFrePomkRSepPLYWKpVN/vK7BWV3AlvcKBM77Paw6kuPi27P
         EASG6fnTNNRSs4tGiRCGwV56F221RPTj6p5drVd0yETUkdA5mhmbgKtrTQEPYEgmu6QJ
         sIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915803; x=1794520603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INhnVhFd4nT7/Uj5uaF+eYQnNc4krDM7hutL2LALWFE=;
        b=uuImOpx55pvBvz2dEXUL1r5AQByAWnbsn/MsRNuhHMO6B/Lde/Hu/py32zillMG+vy
         DCP+yZc3nvXKPB2wO27xBMF3XNGTr0hGWUd26vKu80E6j6CVkQRTqLn/DDi/WcKyTvIx
         PQJ+nDZlAxn4647yMvZnbC/yXXSBbBo+L14eK6oOG1soaYXgfS35El23FCzqEnUfwbuG
         bgOp476GjW8KeVAhoWMm3blPIGJVLWyXR4IcRkPBU/u9ukeBMVZ6D5g178aOOfNYiTxl
         hFBWRGcBfpdOar/guuz0R1Rj5iePc7POXN7T8ZhGsXqZfYe51yNi513JcaaGKJtCT/c8
         fvMw==
X-Forwarded-Encrypted: i=1; AKwUvBwrR3viuMwKCV/AzuDfMZtAMLPc9rz3hB8Y9Q4THCak0Zk7aUNd/GbBBeol0HWGUWN/gjOGxATA6x+2iw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/sjucYnlhekWqlpHPe4eFRD22eDXP3hywU3QzYG233v6kwE0Pm
	Ql3VJBNSMkkYF5BRI9DaoJsIc7gopSIYs/t0KrvzRVQs29fiiUgtbTzPcgG6u//aI7M9tToLCVB
	KT/mhavGSDc89iX0fB1XCWc1d1i+y7LztwYOIhT4B
X-Gm-Gg: AYBFou2tycvw0YfGoiCNC69aAA/di+wDVV0VZXcxOXlbXYNIkjstnHdb1SJ5LFyWEJ3
	fydluDA4N9AAPaxyeJtn0VKdE1j4tkgigfoS3pYF4e+W+H+Bud8Y07Qd8CLkZV1h+jqthMkeBAH
	bSAvFcAGb0/G6voryUY7CEJ8TEAKtmoKsD185JfUoIzzdhL9qEp6VggG8CiLvYxi4wNVTUU+XQX
	HNN9Hed/2u3VZd4on7817j1eEfMLtA4gyY7+t7EcBg22PeUFNCFVHgQDn4kTtAwA1TW+1EoXHrc
	TECvmi6e86ZnWawvw6U6+XsMvBPvdv2G8XDEQritwQwDLT+o5n3a9giO7Zl2oLT2xr5Ib4vu8wC
	pbmyn6m0GvZmOhX9cFV3OLjyWjoIyEgQnPfK0lcdmYZdlR0UgGH1zhW1hARfyvv4jALHYk1WUsh
	YCzpvxBcUVGBUewou08SV7kA==
X-Received: by 2002:a17:902:e5cb:b0:2e9:73e0:2a6e with SMTP id
 d9443c01a7336-2ed45ce19f5mr502865ad.17.1793915802597; Thu, 05 Nov 2026
 13:56:42 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org>
 <20261104-work-procfs-drivers-v2-22-245e54e87116@kernel.org> <CAG48ez0CTxGiZ-q73k8bNhoBTW7xZfWwARCKmmM-WKr6GNBbeQ@mail.gmail.com>
In-Reply-To: <CAG48ez0CTxGiZ-q73k8bNhoBTW7xZfWwARCKmmM-WKr6GNBbeQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Nov 2026 22:56:06 +0100
X-Gm-Features: AclHuK_DIYejrtAv-AIBmnyCAT6PTxuyVU_wOrebkVDOMckVu9fXadnWy_N5Wcc
Message-ID: <CAG48ez0QVQ32Fi_Hsu5ZAWCdWEXvZFB7hNOswT5Qf_Af7YzxSA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 22/26] ALSA: info: let procfs own the seq_file
 of text entries
To: Christian Brauner <brauner@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, 
	linux-fsdevel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 10:52=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Wed, Nov 4, 2026 at 8:47=E2=80=AFPM Christian Brauner <brauner@kernel.=
org> wrote:
> > Declare the show function and let procfs open and free the seq_file.
> > ->proc_open() only sets up the private data and preallocates the buffer
> > now and ->proc_release() no longer releases the seq_file. Reading an
> > entry then no longer holds up its removal when the card goes away.
> [...]
> > +                       goto error;
> > +       }
> > +       m->private =3D data;
> >         return 0;
> >
> >   error:
> > @@ -387,7 +388,6 @@ static int snd_info_text_entry_release(struct inode=
 *inode, struct file *file)
> >         if (data->wbuffer && entry->c.text.write)
> >                 entry->c.text.write(entry, data->wbuffer);
> >
> > -       single_release(inode, file);
> >         kfree(data->rbuffer);
> >         if (data->wbuffer) {
> >                 kvfree(data->wbuffer->buffer);
> > @@ -401,11 +401,10 @@ static int snd_info_text_entry_release(struct ino=
de *inode, struct file *file)
> >
> >  static const struct proc_ops snd_info_text_entry_ops =3D
> >  {
> > +       .proc_show      =3D snd_info_seq_show,
> >         .proc_open      =3D snd_info_text_entry_open,
> >         .proc_release   =3D snd_info_text_entry_release,
> >         .proc_write     =3D snd_info_text_entry_write,
> > -       .proc_lseek     =3D seq_lseek,
> > -       .proc_read      =3D seq_read,
> >  };
>
> Is this safe? Looking at the work.procfs.cleanup tree, the
> proc_release handler (snd_info_text_entry_release()) can call
> `entry->c.text.write(entry, data->wbuffer)`, and the only kind of
> reference dropped by snd_info_text_entry_release() is a module
> reference.
>
> I think the entry could concurrently get freed by snd_info_free_entry()?

Ah, no, this is fine because ->proc_release still happens at the same
time as before.

Sorry for the noise, should've thought a minute more.
