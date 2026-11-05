Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873322;
	b=5IxDPwRVnuJqaRX9Yl+u21fLg8DVBD83/HBCQzXstdGeS/ZtRosRhlCV4KQnRAp3L3tm
	 ZYBa1ybAIkr7vdxzPZPvVpypPmucFK+DtjKKDUKKSu04ehI2GZq5xmdM0r1h3/DXb/IcB
	 Rk62IvJhoZO+tlc3gZV6rGDOcMDwdj97Yz+zvrMhoeZvN0a/X0YO6TVYsS/ff/FAyua/S
	 ZLzJwR6+cjE+QNDPui9/skvZuSCw7TnPxhAW0fpwLMSC6aZrz/xmIGgH4n+J1Wbw4EA7x
	 Z2IAsrLqyT9hr7cOWEXRGfSYKbkp3CfAxJ8RMc77Vb6axVhwpnLwxYrarGJYPwXZUOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873322;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Z2qCIfu1coqF5CKQo/xHkFXbKW7Y+rLlNCa31RZmxiE=;
	b=b3MKPZJBbIF0aagvJLvpsuK04fp+7O4ybLWc1hmVLdilXsQSvirSLQ9IHc/qaVKQ1qvs
	 HXE2Nr1nlR72HkLWkaeOG3c9hYmPI5apilmt8D4mluc7mBIrKjb8jhDGFbKe2ckHeSkdz
	 FMNM33uMwI5T+K+Jmer8W4xd5Rb8uxwcun559PUZ70zx+pMMTLZpljLYfMrCqNYyACzWg
	 xChPQZ/wJa/qP4BhwuJMMwQ6jKc/mpRkiV0UI98Vvt6MmNkArIPQE76cfCuux3MjFp89s
	 Ib/sJNt/ITut8limeWK220tRZkILCUM9fbY4HUo5qR50mh7ye4psEvrfHIXTHGdE+Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D9F60A263A
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D9F60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-998569550adso1053996241.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873321; x=1794478121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z2qCIfu1coqF5CKQo/xHkFXbKW7Y+rLlNCa31RZmxiE=;
        b=nl8vb/FgyzOBUi7MsBHLAqQaMEHHivsx52AckU/PV0psntTs2Q0swrLgZq+ljI19Nr
         MX3M2Qrg+gqNHvZZN6tT7qqxBfW8w0aWRmqSW0BnoH2Coz9xubGDElBlwXUK0008WSG2
         mHPl03uRRsta3PFdXSpr70dmCATAORvFf0N+NGvVtw1SdB9riY4OIPfoEn0ya8q9EXVb
         sE2Cg5eqsJKvSuadVuhfcG1zTZHI9vETHwxkq7sVESJ/FsbL6AaUD/2Juyn9gb8J/HFP
         +iukDLfI9jXxgE5V3rdEGRKWMeJGAUFmUSHLbW00KxrU58ZdD4ZszywEDrdmzWDzoHxi
         aY3g==
X-Forwarded-Encrypted: i=1; AKwUvBxO0mv77ajs1ZgbuuDDGjkcyhasP1YiXDiZOSIQq17V2m+ot+2nIgeuqxFGrqhlCw8TflUytfZWUcOfiw==@vger.kernel.org
X-Gm-Message-State: APuU4Z91yfpN7PQKJ66xb1y3H3B0yc701dettw6XfUg5nBkbXG1NAF66
	COfRyVLeliFMceS5JdHogJuTclV8SK03wr7d7o29jHHBz1TaHbkROQrVIeF0sBQ8xxQ=
X-Gm-Gg: AYBFou1W9isKDDX+hVg+var+11lDlcHWD2anKZiOkPoTcGiY8PINxuj2QMRMVl9Cxo+
	b54O6D6NfgxAV66kRf3ryiN8Q7efjFLmLXG/Jqx0RzYabEgRvQO4Hx0zEp19vV5UTT5e1aaisHy
	CrIqtjm4jiYjE9iWWS4gHwFgH1K9/YVE2H5lmQZof8Jf87mSnLz4UR8kgkVQJLinRVLz1OKPPah
	MpaEnVNI5y56Ih0h81z/zrOV/2WhOL8kEVApQA+5evN+O+sdBnjhcv5Z1I2y+hSjL6blAp5c+mQ
	uhZs4AIaeVSQ5gdVW2txcWruh6RMzWJQR6ARs3cMJLKLBMtwm+8QGg/4M9be2xK8UIPjnMSezex
	c93Y29c36gA+FWKyQU07bSmsl14qYh2O/dlrlVANw+GF/ibwQQREyCM2pUUwsr+f6gcgV0mkCKe
	4pfvHR4wT3qAck+0W2tFGLisn/kzLiWGoP3lWTeNMhowBSEid0FFuJCcjy3bjQ+dT436vPxJ9pF
	6EKlQg7o8mzXvQo1grIVUUKCbel1O7REZpB1X3/unsXgxa4y/4CjnpMl/mdmmFGL8JIuiLM3PIP
	KnP0XNjHTjBIzEa4eUosUuarwQ6T4MxDv7xoyXp2AvWjluJSVhqBtAL7ZmoNA8Y0Aw==
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr9197517137.1.1793873320681;
        Thu, 05 Nov 2026 02:08:40 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm3745965137.3.2026.11.05.02.08.36
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:08:38 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-990835cec4bso949845241.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:08:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxr30ZVgeDN37JKjUAE6lRK94qKmhOkP1/U3nMggqBwpw7Q6stDgdwsSSagLV6PfxrkgqLFih+xj6vUmA==@vger.kernel.org
X-Received: by 2002:a05:6102:5494:b0:7cb:bc5e:7d9f with SMTP id
 ada2fe7eead31-7d072bb3829mr8787869137.11.1793873316184; Thu, 05 Nov 2026
 02:08:36 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org> <20261104-work-procfs-core-v2-16-76ace653a773@kernel.org>
In-Reply-To: <20261104-work-procfs-core-v2-16-76ace653a773@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 11:08:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAk9CwoXpak8+EQjdvJ2Ab9fo1bvj_D5GqBzXB7urEUQ@mail.gmail.com>
X-Gm-Features: AclHuK_D2R6ZzQFy7DOLUQHC3VotRoglnOuhbtIFU-Oniz4UMRG_6kQUnblEqeo
Message-ID: <CAMuHMdXAk9CwoXpak8+EQjdvJ2Ab9fo1bvj_D5GqBzXB7urEUQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 16/23] proc: let procfs copy out reads that
 don't go through seq_file
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

On Wed, 4 Nov 2026 at 20:33, Christian Brauner <brauner@kernel.org> wrote:
> proc_reg_read() and proc_reg_read_iter() pin the entry and call
> ->proc_read() or ->proc_read_iter() which copy to userspace
> themselves. Like for seq_file reads and for writes, a reader can make
> a page fault in that copy take as long as it wants and
> remove_proc_entry() waits for it.
>
> So do what kernfs does for these reads as well. An entry that implements
> ->proc_read_buf() fills a kernel buffer of at most ->proc_read_size
> bytes, a page if the entry doesn't care, and procfs copies it to
> userspace after unpinning the entry. The entry moves the position like
> it did for ->proc_read() but that only sticks if the copy to userspace
> worked, like in kernfs_file_read_iter(). If the copy fails halfway the
> read fails with -EFAULT and the position stays, where
> simple_read_from_buffer() returned what it had copied until then.
> procfs remembers ->proc_read_size in the entry like ->proc_write_size.
>
> Larger reads come up short, like with kernfs. An entry whose readers
> want all of a large file in one read asks for PROC_ENTRY_FULL_READS and
> procfs fills the read in pieces of ->proc_read_size, unpinning the entry
> in between. A piece whose copy fails ends the read with what the pieces
> before it returned. kexec-tools treats any short read of /proc/vmcore
> as fatal for example (cf. [1]).
>
> These entries are read through ->read_iter() so readv(), splice(), aio,
> the RWF flags, kernel_read() and io_uring work for them like for the
> ->proc_read_iter() ones. io_uring's nonblocking attempt gets -EAGAIN
> though, like loop_rw_iter() gave it for ->proc_read() entries. Neither
> the allocation nor the entry can honor IOCB_NOWAIT, and io_uring would
> take a short read of a record file for an unfinished one and glue the
> next record to it. So it retries from a worker like before.
>
> An entry that implements ->proc_read_buf() and also declares a seq_file
> or one of the other read methods fails to register.
>
> No users yet.
>
> [1]: https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/tree/util_lib/elf_info.c
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for your patch!

> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h

> @@ -84,6 +91,15 @@ struct proc_ops {
>          */
>         ssize_t (*proc_write_buf)(struct file *, char *, size_t, loff_t *);
>         unsigned int proc_write_size;
> +       /*
> +        * procfs calls ->proc_read_buf() to fill a kernel buffer of at most
> +        * ->proc_read_size bytes, PAGE_SIZE if that's 0, and copies it to
> +        * userspace afterwards. Larger reads come up short unless the entry
> +        * asks for PROC_ENTRY_FULL_READS. The position the entry moves to only
> +        * sticks if the copy works.
> +        */
> +       ssize_t (*proc_read_buf)(struct file *, char *, size_t, loff_t *);

As for proc_write_buf, I think it would be good to use this conversion
as an opportunity to replace "char *" by "void *", which will probably
let you drop several casts from users.

> +       unsigned int proc_read_size;
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
