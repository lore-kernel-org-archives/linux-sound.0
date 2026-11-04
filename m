Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831034;
	b=K0SaAIHuXDe5KrLZiFtcFXlPX7bbCCG98MvjAMzt0tsAi+8qGVNVfNccrlxwkb2QZ2rB
	 NlvHnZgWXP/TPj2hzrnU8+NmX+236/rWoOYOtc93voA2xYnK6EgIi89YlNuCoHcyqiUOn
	 EE0D0a9XIhwK8c8yMN/Jm6OrnxLZbZwB2/TbnWZTbOvfSjNVd7FWWaSmDt9NmtnZKtMOr
	 wwL4isNvayRqwu3/snA2QQxcfuW2W1VLt5+uewfhcJSw50Q/98TbJx5kkl4HbSRktVd3/
	 JEEXHEnek81BFGRJJcF1NGIYteL4MP4XaX0H1oPxFi8Jerm/lyQl4rpJJEOiB7p1o9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KeZ2aB0X0IqNy32Bwapb83gUzvOHb7jOV5nmidAoLRQ=;
	b=YgbEMsFGBMOx3rJu/MyGakWvoFH1FRhPVH6AzdLiALW7pF9vTM7pOFREQHmYOEI5+5E0
	 z/11fgmAWJzwM+8D3SRH8aROnWohckXHZXl/2p67rCvjzrnYv/3pugDE+8BbIk6axK2tW
	 jgg9j5aHDNuV8VmkZ3tUuUrr25IVryytlRwiSiZRMpNv2EBF1nXeXzj97UEgno2QHoqit
	 hGT49G0xevYrrvlbf1AgKwGqEqeXMYC6wlG8hDyX3YzC20kN0e19YnqTNKSkcT1vYnSJu
	 aUsJ7Ls2JUVOThPmfA7qi0IxGaf4y+T3W+S5NVPE2UMbv/NwCeuqwcJ37l2fBEgmxDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=NcEExbnD;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FA606A843
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 22:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E36FA606A843
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=NcEExbnD
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f3c616c84so109982685a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 14:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793831033; x=1794435833; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KeZ2aB0X0IqNy32Bwapb83gUzvOHb7jOV5nmidAoLRQ=;
        b=NcEExbnDLtiALC276t5kcclQzZoOYloVis0hCWAdB5suqT0QkRwNJ+AFK0XB4NzGVk
         MBvKf3YK63ail+629aXUNIvCM1WnXnfCIha+DrPSuNj8k3YzkImzwB+xGI2s2y2HBJ5T
         vvkTuikiQqNxAICkZ4ywv2TcbVVqmFMFp/2B11hfLkRa7xqDvLx4q/6WouEjHlPu8igf
         zrdHc2HpeafPYSIxUQLBS1un6n7qW3BkOqpkKrUbvRAIFCSnaZItXy7Cg5Cn0kHFlgPO
         kv82C6T1O0AQD/2BA2RX99j/GbgpjX9B9AtvNADneDIEvKVhq+f3BAJVyYf4DaCus4Kp
         YwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831033; x=1794435833;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeZ2aB0X0IqNy32Bwapb83gUzvOHb7jOV5nmidAoLRQ=;
        b=Zcr+aPRowXKTFLR1RId+wq62j7qEwkjLGz2ltd6gNCOt/T72LW3NLDeFMp90f9R3bx
         Inbt6Iw0M3fEt0zN6L5ZGAAXqid3t7VCn4H3juM/YBKj7JpcBEBpTAV0qpabXh+l6K3H
         DrfQ02jHf5dhRyKUJQ01y9nx1lj9ZGj4O0yECCi8G14LzMr1Rq6crcvm9bg00Fe/6Ig7
         0CKErrGUGjyRaFvjowyI59g8xJOnZ8lCnaA3ngnixfpCFLhR7GyVfG3p6G0IQHaxIyTq
         glXriukHaaIQU0ArkhRiba9xQWXMYq7Le9JKbaQqN/ICw6fWudWeV84fNiIrfZne7VLW
         jwpQ==
X-Forwarded-Encrypted: i=1; AKwUvByTD39fxBygEV9LeF3sJWqwg+UqaXCU8/+EEkJnUKQdP3K26dzd4Eixk046fpTFsMapu0IwsqJhAmqewQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9pON9GNVVHB8bhrMjAgLxamo4nQfcMKvEKJePabACRiJCg2Wsx
	kN8Jj3uT8CsJTvD6At140ujDjGW5F6oA68qKeXi6lyGK8RPoIOGeezwKPIuZQlaagR0=
X-Gm-Gg: AYBFou1OzhfC79i1LXOVXLYJYTxMjk7Cx5Qnjq5CYv+B6Jhr7Jcv58keRqdA3WRrsE5
	FmnQ/YJqwtCUz0E9SR/0aCWCg/FRoGU6qKuDpd71xuth9M8KixC9xtFsrOazAT3NZaj98SzUJLN
	njKzk0FDg5xgFiyXxk5WMTFhfO74o+UveLV8LGEjJCVtbPnn5JosfoJFY5xPAl6EG35usJKhLbB
	fdCPHyrz92z1nuzmE6SPmJNtknemD4IvALv9Sl6CH6KIfw5fzdLNPpHVW/GXic5Zg/MIpx9sGpy
	mraCex9dRutHhZlrAoZyxxmLHZZr9a1wx1DHWxhcVfqNvMqBXzdkDRKX6Nz7xji7lvEKJ3pu1C1
	xoleRNYrBHOKF5PsEtqPIQ8nBszJvQQTCJ+hNyzlSw3zkZXKh5sUTBkVmqBA56SO44x1IItl96/
	+hqin/KKKKGZc4iTOok9R5qbTnQ6LGQCCn5oIv89jOb+6O0RR6OvYflLGspMSh552NnXL/CwaNE
	4puDo7RKs0U+z+fFJSZjrXYPk5OfC7yTIm9ESObp4aCr/l6UkJViCCAqjsYKF93EogKa+uQIp4B
	aRd+ibPQTtaAAjQ7B12Io3B0yFLQ1QITjwy+5hl0/prxXw==
X-Received: by 2002:a05:620a:608d:b0:93c:7e9c:3bba with SMTP id af79cd13be357-944216bd4bdmr3093198785a.41.1793831032557;
        Wed, 04 Nov 2026 14:23:52 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4691a76sm312610285a.4.2026.11.04.14.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:23:51 -0800 (PST)
Date: Wed, 04 Nov 2026 22:23:51 +0000
Message-ID: <464ef986eab97abf226791c7e19ad111.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>,
 Eric Dumazet <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>,
 Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>,
 Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>,
 Jan Kara <jack@suse.cz>, Jan Kara <jack@suse.com>,
 linux-kernel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-mm@kvack.org,
 Chuck Lever <chuck.lever@oracle.com>, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH RFC 0/7] proc: move procfs to what kernfs does
In-Reply-To: <20261102-defizit-jobaussicht-kurios-7016c6e67442@brauner>
References: <20261102-defizit-jobaussicht-kurios-7016c6e67442@brauner>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hey Christian,

This is a summary of my Claude review of everything.  It didn't find
anything wrong with the conversions in parts 3 to 6, the findings are in
part 1 and on the procfs side.  1-3 are reproduced in a VM, 4-6 are from
reading the code.

1) bugfixes 19/38 ("proc: resume readdir after the last name it
   returned")

proc_readdir_de() now returns 1 instead of 0 when there's nothing left
to emit:

	if (!de) {
		read_unlock(&proc_subdir_lock);
		return 1;
	}

proc_root_readdir() needs that to go on to the pids, but proc_readdir()
and proc_tgid_net_readdir() are also the ->iterate_shared() of every
other directory, and iterate_dir() hands the value to its caller.
getdents doesn't look at it, old_readdir() and the compat one do:

	error = iterate_dir(fd_file(f), &buf.ctx);
	if (buf.result)
		error = buf.result;

	return error;

So at the end of the directory readdir(2) returns 1 without having
written a dirent, and keeps doing that.  This is syscall 89 through
int $0x80 in a loop on x86_64 with IA32_EMULATION, giving up after
100000 calls:

	             base, 18/38         19/38, whole series
	/proc        106 entries, 0      106 entries, 0
	/proc/fs       4 entries, 0        4 entries, 1 from then on
	/proc/net     31 entries, 0       31 entries, 1 from then on
	/proc/sys     10 entries, 0       10 entries, 0

/proc/bus, driver, irq, tty and self/net do the same as /proc/fs.
glibc doesn't use that syscall, but this patch is tagged for stable.

proc_readdir() has to keep returning the 1 for proc_root_readdir(), so
I think proc_dir_operations and proc_net_operations want a wrapper that
turns it into 0.  The comment above proc_readdir_de() that says the VFS
doesn't care about the return value should go as well.

2) cleanup 5/5 ("proc: drop the _buf suffix from the new methods")

4/5 renames the old ->proc_read() so that "A module that sets one of
them doesn't build anymore".  5/5 hands the name to the new method, and
the old and the new prototype only differ in __user:

	ssize_t (*proc_read)(struct file *, char __user *, size_t, loff_t *);
	ssize_t (*proc_read)(struct file *, char *, size_t, loff_t *);

Only sparse sees that.  The compiler does reject an old ->proc_write()
or ->proc_ioctl() (gcc 13, clang 18), but this

	.proc_open	= foo_open,	/* single_open() */
	.proc_read	= seq_read,
	.proc_lseek	= seq_lseek,
	.proc_release	= single_release,

builds without a warning with W=1.  pde_set_flags() only refuses the
release helpers for seq_file entries, which this isn't one of, so it
registers too.  With a module that has exactly that loaded on top of the
series there's no warning, open() works and every read() fails with
-EFAULT.

The tree had 84 of those at your base.  None are left, but whatever is
in flight in other trees, gets backported or lives out of tree ends up
there without anybody noticing.  Either the read method keeps a name of
its own or pde_set_flags() refuses seq_read, and either way this
probably wants an entry in porting.rst.

3) bugfixes 38/38 ("selftests/proc: check that a faulting readlink()
   doesn't hold up removal")

This adds proc-remove-slow-reader to the Makefile and to .gitignore
along with proc-remove-slow-readlink, but proc-remove-slow-reader.c
only shows up in core 08/16.  From here up to core 07/16 make says

	make: *** No rule to make target '[...]/proc-remove-slow-reader'.  Stop.

in tools/testing/selftests/proc, so also with part 1 applied on its
own.  The two lines want to move to core 08/16.

4) core 04/16 ("proc: let procfs own the seq_file of seq_file entries")

pde_seq_start() returns right after it unpinned, pde_seq_next() goes on:

	v = pde->seq_ops->next(m, v, pos);
	if (v == ERR_PTR(-EIO))
		pde_seq_stop_pinned(m, v);
	/* seq_file would blame these seq_operations, blame the entry's */
	if (*pos == old) {
		pr_info_ratelimited("buggy .next function %ps did not update position index\n",
				    pde->seq_ops->next);
		++*pos;
	}
	return v;

core 16/16 documents that next() may return ERR_PTR(-EIO).  A next()
that does and leaves *pos alone is called buggy for it, and
pde->seq_ops is read after the unpin, when the module it points into
can be gone.  Nothing in the tree returns -EIO from next() today.  A
return v after pde_seq_stop_pinned() takes care of both.

5) bugfixes 35/38 ("proc: sysctl: don't hold the tables while readdir
   copies to userspace")

	while (err > 0) {
		if (!d.skip) {
			err = proc_sys_fill_dirent(file, &d);
			if (err)
				break;
	...
	sysctl_dir_done(&d);
	return 0;

sysctl_dir_next() only pins the memory, so the entry can be unregistered
before proc_sys_make_inode() looks at it and returns -ENOENT.  The loop
breaks without moving ctx->pos and returns 0.  If that was the first
entry of the getdents64() call userspace sees the end of the directory
and loses everything behind it.

The old code bailed out the same way, so it's not a regression, but
it's the "terminated early" case you set out to fix and these are the
lines that get rewritten.  Handling -ENOENT like d.skip would carry on
after that name.  -ENOMEM probably wants to be returned instead of
turning into EOF.

6) stable tags, bugfixes 34/38 and 37/38

34/38 has no Fixes: or stable tag and says "No functional changes", but
35/38 is tagged for stable and depends on it.  Without 34/38
proc_sys_make_inode() reads table->mode and calls ->set_ownership()
after it dropped sysctl_lock, and the caller 35/38 adds doesn't keep the
table registered.  35/38 applies cleanly without 34/38, so nothing will
complain if only the tagged one gets picked up.

37/38 has Fixes: 7e0e953bb0cf, which is 4.0.  "the inode holds a
reference to the entry" only covers RCU walk since 47458802f660
("procfs: move dropping pde and pid from ->evict_inode() to
->free_inode()"), which went into 6.8.  Before that the inode drops the
entry in ->evict_inode() without a grace period, and the pin is what
keeps ->data around for a walker that got it from ->get_link().  Which
stable trees have that commit isn't something I checked.

Smaller stuff:

- The cursors in bugfixes 19/38 and 31/38 hang off an open file and
  anybody can have as many as they have fds, so GFP_KERNEL_ACCOUNT.

- copy_to_user_fromio() has no callers left after drivers 22/23.

- fs 07/27 says ntfs_set_label() refused a label that's too long with
  -ENAMETOOLONG or -EFBIG.  It doesn't always, cpu_str.len is a u8 and
  ntfs_nls_to_utf16() is allowed (PATH_MAX - 2) / 2 here, so 300
  characters come out as 44 and pass the check.  That's an old ntfs3
  bug, it's only the sentence in the changelog.

Two more old ones that you might want in part 1, the series doesn't
change either of them:

- allocinfo can deadlock against a module load.
  codetag_alloc_module_section() calls reserve_module_tags() with
  mod_lock held for write, and its three error paths call
  shutdown_mem_profiling(true) -> remove_proc_entry("allocinfo"), which
  waits for the readers.  A reader that's pinned and in
  allocinfo_start() -> codetag_lock_module_list() sits in
  down_read(mod_lock).  There's no copy to userspace involved, so
  moving the copies out doesn't help this one.

- snd_info_text_entry_write() allocates the larger buffer and frees the
  old one without copying what's in it, so a text entry written in
  pieces loses the start once it crosses a page.  It's been like that
  since ffb73b08e794.

For what it's worth the end state checks out.  Every proc_ops
initializer in the tree matches the final struct, the only entries that
still read straight into userspace are kcore, kmsg, kpagecount,
kpageflags, kpagecgroup and profile, all built in and never removed, and
nothing in the tree trips the new checks in pde_set_flags().

This part is me. I have a selftest that my claude wrote to validate #1.
If you want I can send it along, but we should probably have a test for
that.

Thanks,
Josef
