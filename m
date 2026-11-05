Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873582;
	b=kXz6baTFnuedwRhYfn0lZzd/tWHkKplwG5FJJ25QetZnk2yTViX41APyyCZByafh0IYl
	 KWSu3BOMPpWXAO3UEPGTy7K/tMxLoQllhv+9S/NSU0nFMxJfmVrsK1AWFpXk9fUE5F9KK
	 i6bxgoAc7la5VxPEg4qu3aswYk3E49AFTRa2t16aeagwqm2fD//elGY9gSlogk8Oqeuv0
	 DFuTmI5UiByLcbA9H2Q2syNTNcMbg/6jbzHRB+lVn/ftSxvDpWkLeN8LQuWjvox5gQYxF
	 Z8WUqrSDDy3HmtQzuItAmrZaxEk3gEOjQ5l+I/vyxyD/2ZvuA4AyfCTAxQc8rK9YjCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873582;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
	b=rflIYXcI0cS30Fs9C/fTzJ7XwhD1bmzchr2gJi0Ff4i1RcLRxQdzD0gLdsSqCOLD4RWO
	 YNRcH1Ua3OM5f1vRsvCK2qeiIeYdHtsMHe6+1cvTAFnU+6GDAn+zwKPbDTngK+lLOK1+u
	 dfPotsXEZ97ip+o2lB/DqwuGYsocGo5HwKQPA3B5kxmlsW2/XnDY50Xu1mN6oz8/IcxSj
	 eS7D14JQIqgfzy5tQ0hJU1MKWcaPEZqUPmOj4GzlxeJ/G+KGNMJS1OuWOzBtKT5e5Fmzj
	 egEdtk79J2KydbQcE10zIdVUajX4YK3rQPSipkz7YFOVRitsPUquenrLjhQWcsPJ7dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFAC606EE9F
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFAC606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f1cf92c9eso162067085a.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:13:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873581; x=1794478381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
        b=asH2AFnnlO1aKkt70eWX6YKAKMGEotHFIINGUzF4rEb+Qaup7C1eWTR15FLD03ANDu
         Oevgt6kr3AJWMazobokir/A1ZbZf4hZ99AvGTWKoZouGBSQtYoRW4KeaUVwpeHdTSMLQ
         T0JVSnGvsu4oaWqNFGocEUrQMP31oc7UbLvEdyfkDfiSOyD2cQ/imWSvt9zxKIP8XnsZ
         CMjz/1ZuYqXY10kT1RL2IQKlK9WhU1LP6LYwO0Gi/X2hzz7qtGIkgPHCQl5B6ikgi5Tu
         qcZDjZPYQWWMFc+le5mY/yei3k1ztvjRV0Y+TYCBcKQPO7YP14kGf7vt33G3DXO0DHMy
         L34Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbTNuup2evMPWAONI9WI/9ITY64YF0aKUxqaTyKppNSJjWAgJx3ipDiQjuE5nnQ46WGyLczNspVSSfJw==@vger.kernel.org
X-Gm-Message-State: APuU4Z88k1W4LVP3vYbnqOKjQ9LsToCNMSldOJh6Vswm0C2zPmxEHa87
	7JWVStZ/ak3ai0fbfdVeDUOwTMwti7gm3DWGXGQ0qBUvGWKjul4pBjjQHGO6Pj6AGHM=
X-Gm-Gg: AYBFou3HPX9DDTd5dK1zR76SFO1LTsO2cy2F1ZvpjiIN5ptGGIzDfmhiJjBOo/1qODA
	XHMkDygquKRjZplr+h0VFOlyLxthgnxHbuVcjY5txgVrpwYKq40UTfuF13Y6pnB4cmZFMuMYl8C
	sikpQgdHBa1T5Zg7Z6qBO3l0Sf9TO8NsuH54l+4bH4EgRZhEZzIWpzJyOc9ETMCxO0oFM4sCtmi
	iAsU7QDOGGFpbnb7EM5OlXUbKIv4gXTPSgjYwLYOQea/4xsjbtvlunOZasJGhCev+sK7sWzhCiN
	FbtKC39udJniKSngImuyrv0xYFexGgqza7E+7GpW9FsfDMVeDhMpJats5cqRRBPbV5pujz+b1qx
	hNLuh0jbCjTwNeZVuSzb3qp4pw62+XrN1T3JHEmeexsWWGTIuAVMTpAO5XA3MbBHqsTe/CVOHCc
	BzIFhpi9z+XtK3a+83oaQICCT54GnMcKsAr4ldhpEJrqKYCuBjzuQZ7nmgN7w8GgeJOlydTsMew
	NYTUNCcg9RIgLP5/Ovnfg+3pTZIPXmdS2z8NOmna2IllveeelVj3I/B5dPjWDo1Pt7stQDZsW7w
	o/SDRM9lDc15rW75lrbLfrb6weaYnAnlomkP2n0Vm/v/M5CwADBD5IAjy0OiaUvGktKYDg==
X-Received: by 2002:a05:620a:2849:b0:93e:95ce:53c7 with SMTP id af79cd13be357-9442156aaa8mr3152070685a.4.1793873581131;
        Thu, 05 Nov 2026 02:13:01 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4813a6fsm429017585a.21.2026.11.05.02.13.00
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:13:00 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e63ee7b4cso177763885a.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:13:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxSinZL8qLlSVFYpyZvSAewCpAUwyz+LkQAcFeDG5ZtwtotpJVZJ9WpeitbxKLsINjOJttzD1m3/2CS0g==@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:7cc:1a41:20e8 with SMTP id
 ada2fe7eead31-7d07227a940mr8060714137.5.1793873263361; Thu, 05 Nov 2026
 02:07:43 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org> <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
In-Reply-To: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 11:07:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
X-Gm-Features: AclHuK9naqg5CZQ7lhJVrMhg9TNH44f-SpA5WbUGCGBsAlcoOw2midTd7doJSmk
Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Wed, 4 Nov 2026 at 20:32, Christian Brauner <brauner@kernel.org> wrote:
> proc_reg_write() pins the entry and calls ->proc_write() which copies
> from userspace itself. A page fault in that copy can take as long as
> the writer wants, just like the copy to userspace of a read, and
> remove_proc_entry() waits for it.
>
> So do what kernfs does for writes as well. An entry that implements
> ->proc_write_buf() gets a NUL-terminated kernel copy of what was
> written. procfs makes that copy before it pins the entry. The copy is
> capped at ->proc_write_size bytes, or at PAGE_SIZE - 1 like
> proc_simple_write() if the entry doesn't care. Larger writes fail with
> -EINVAL. The proc_ops go away with the entry, so procfs remembers the
> limit in the entry when it is registered, like the size of the seq_file
> state, instead of pinning the entry just to look up a number.
>
> Entries that take binary data in pieces, like the PCI config space,
> ALSA's data entries or a firmware image, can ask for
> PROC_ENTRY_SHORT_WRITES instead. procfs then copies in the first
> ->proc_write_size bytes and the write comes up short.
>
> ->proc_write_buf() gets the position like ->proc_write() so entries
> that write at an offset keep working.
>
> Note that procfs copies in the whole write before the entry looks at any
> of it. So a write that is too large or whose buffer can't be read fails
> before the entry's own checks run, permission checks included, even
> where the entry only ever looked at the first few bytes.
>
> An entry that implements ->proc_write_buf() and still has a
> ->proc_write() fails to register.
>
> No users yet.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for your patch!

> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h
> @@ -67,6 +74,16 @@ struct proc_ops {
>         const struct seq_operations *proc_seq_ops;
>         int     (*proc_show)(struct seq_file *, void *);
>         unsigned int proc_state_size;
> +       /*
> +        * procfs copies what is written into a kernel buffer and calls
> +        * ->proc_write_buf() with it. The buffer is NUL-terminated and holds
> +        * at most ->proc_write_size bytes, PAGE_SIZE - 1 if that's 0. Larger
> +        * writes fail with -EINVAL unless the entry asks for
> +        * PROC_ENTRY_SHORT_WRITES. The position is NULL for a stream, like
> +        * for ->write().
> +        */
> +       ssize_t (*proc_write_buf)(struct file *, char *, size_t, loff_t *);

"const char *"?

Seems like you have to drop several const attributes during the
conversion from "const char __user *buf" to "char *buf".

While at it, I think it would be good to use this conversion as an
opportunity to replace "char *" by "void *", which will probably let
you drop several casts from users.

> +       unsigned int proc_write_size;
>  } __randomize_layout;
>
>  /* definitions for hide_pid field */
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
