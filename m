Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872339;
	b=v0kLmh/1Vvs4k636UYxEpXDqXuRqS3Zl6GpYcPA6LgMZ0R9/yQfD1/t38m4xbZWxPBFs
	 ETIa29aeG3WfbX4cfm3zedwZtDst5aeSoKkGGUZHaBoLXacDI/YtcdGlwPKclFpAUs5GF
	 6HSrJzhBPfId/Tc1T9P79mhWGDiQ2HWKRiySKgN8k9mSZ2Gy4mYrak07y24axZh0BEWtU
	 ghHTKQ0m46aAvTLZP1U9ZIC+tgzSFApDXlEhfbof86rvqcBRnSsbqfkUWy4a/hxQr1OjG
	 +g1HBOpYj+ltK05Ld81JXfVimYiPeNTv5NnfQMpqVh/wqS6cDli1/aEAv46vHUHNAig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872339;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=dufRJxvwYUMVMi7z2aG2uurKKasXxtIaZJVFz3Ss2Ktq1pMnBCY8tfLCVqQxtMrWCR3o
	 Wl2uxQQX0OKqKcfvRcbdk9regZYHcq6K1yNzkdtCq9wGltWxaHbYChticpsQrywQEfuXU
	 EYuzcBNpDFy1+030sAb4ctssK1abv6tkgjHi22Zt5H5SQJvUS11GYCHAlmOHK0fBaev7X
	 c9W98Ebhh2c4KyUVc60PwjBS67WWhJiIGlFQbWkdG8UJGrIfMlLWDeQWuvxmHXF/TfzFj
	 s2PHyYl3DpNmwjbRq7eCUUnAM7ySCqAm5Qf4Zn75yBCImZwxhh+6vY0sF3xc3dbrkZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC9606A31B
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 09:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45BC9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c6ce60697so22121006d6.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 01:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872338; x=1794477138;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=ldigV/+FAud99/d7nnz1hJzUzmAfzeINUMp+LPC5qhYrAgJ40k4EGbxKoOQ1IDnInE
         FdG3LrlBaWwm4rKMnkttOG+3kTCxY86R6bC+AOrzncEZwHFCd2sOhwl9JR1EJpeyXK2d
         HKq6YvsaIQoBMTAX5GS2XAFCXpkmq0lm9mdGfrPq3ABYKRj3zqO9tSYQSRkjG1W05bmL
         w0oX22H9QvXdWw47uoVD5ZNyVY4pqBFkqtiEYGV9Y+2dawhXSeA241osb4KI/akxgG3c
         wkg2i8p16UjOOofPZESTse50Y1HrCSmmbYZzIpPWnVl1gie2qMV1kyu6/TKlHdi0fdfk
         eyhQ==
X-Forwarded-Encrypted: i=1; AKwUvByF1ltgJIp2DhlojrhLkB7i3zNmtwKmaOJI3xu+LQRC/tb4IOjO9uLlKaw8K3YCYOTrlXafvZkc6MPUjg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MizooZ04RfO3PXuBZo7MwugOc3f83l2Up0ffCepRz9wovgJos
	4WhT7wFWafV24HheSHBqk8X9HJI6D9Cxx/icYyA4aLk2ewDzOo0SJ4KqdWyvpaCfvxE=
X-Gm-Gg: AYBFou2iyGZopQ2LmS96ZZGsIndml2dFv0ey7/w+u2keHVpxxDs3S7sEh0aseQhvh2o
	cUfD4PA4jYi+Pqyxhibret+llfnGOdN8mJfBxDTEkSH+Enq139Cqd9QuL2HCbqaXdO2N68ASZAm
	AH9/UB2BItHh5KDt6hcHZUQwF26pfydNqTnVGEyGW11ttChihEMIQ9FauBWU9vVMc1R7VjGyAl4
	YnX4aC9WV7h2QJ8F2Rv0TdskIbM62hLJ0sa8hZKqrHJZesyl3bj62f7OWVgq1obNU538ljwgdkv
	SbEel3pOVUh4MCh6GCyUrdvPeh9E3CRYaXSj5MuDPbF/hzFk6xHJLKcZUa4TIVxOHWyebb/q5z9
	O7zZIf4HAofcTZfRK7exYFUs1GlxrylIIM3qGJR+G7pvWj01mlcIap9yvpX5yLpGbavxq1Rnf7H
	hzuKrE5drEoyTIIbN2VpqTJl4laBM/IR5VBa1bolrNV2j/fxULZsCAkQBGvzxp2gcZldBWeoNyE
	NtX5DuZmwGV6XO7xghor+++i/qre9mZfMgAY6dbrDHgL8pJbyA6mm6z7IEWWmP3sCEizSf8dZDq
	YIuK4Jv4K7l0lC2LMRuhudytWnraFzLi9juIk+lPub9KggHrOZMeQbM9vdj5O/IgccyUuw==
X-Received: by 2002:a05:6214:19e3:b0:912:517b:40f4 with SMTP id 6a1803df08f44-91ca4b4c811mr321479036d6.38.1793872338137;
        Thu, 05 Nov 2026 01:52:18 -0800 (PST)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9a0f5a9csm10497926d6.6.2026.11.05.01.52.17
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:52:17 -0800 (PST)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365f9a04c5so23468221cf.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 01:52:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxnbbjVePY0qfYZaSXo6R/2Ckztsj1j25gITbAHoDhPHfZoURMOTTUn3igTR7FMLsMGBNZiQUY+rW6akA==@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
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

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
