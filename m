Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872858;
	b=5V/+PqW4K4QEvktk45G0KyBEmuVMlO20AzD7XCh6nq/PbamA2IusmFnWmj8/dZfRNoqZ
	 hqNfnrLnpggZdECOSAsviTrIwO1Vvo73rE2fKX2r2y50aVlS5+U1552mMmA7k2Wu2ahfF
	 CqSyFQWVQ/BXNTDd09eFGf3ZKRSKUJSGdsc+MtgeND/t4lXd+hv5jrkWwmdDTwD9jSMnA
	 uPfaeV7cNFkRwT/lkIolG/Qo0A9boaLad9vxqMCLOIqzD7KB7o7AbCb4W9RBvJSsXmPIp
	 cTyfm1w37n6uY1PgpyY8IpPzYomNd9EXVQPO6HBeyI81uLgYroIoaVomz6Wgj8E3YFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872858;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=I0tWBbeLBcdwQlB92InMGEMfDqllwS4MCKYAR6PurwQ+rssgVlKAEDK0QmC+HYoB6OwY
	 k/gWXQnFwDC1CIR0KZHXl6zuQrjQYa/xw7qKremXTxl3lbHayniLl6V5MI4PtLT/gC/gE
	 xSJrbwSVQ+Kod+ZcTa7J/mIIt942Zro+zJW5R/3R3EweqwpCT7ZP7y1EX2TKQRbDCecsu
	 cknRAJgph8HOZz9afJDx/8vpEvLRsn/ZfSoB390H+h3F/YrATu91GxnXb9TmzqbxpKrdS
	 1M6cyVXpYR+wskIx5MtIxNwX8Ki5uZJl4EZJ/qhQPrCKB1nNDlbSAh97UssBTTqVgXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B921C606A326
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B921C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91c6ce60697so22211126d6.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:00:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872857; x=1794477657;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=R+sEHJrFJXo76ixgcdVxcqnnRrbwC59NQKSRfcxqYv9GUDfEzJOsnbcgA7e4AiAm8A
         XxzkmFo4Bh5kjGVFaeerjU+J5VWNl4L7c7w/3yf2WEf2TjftfouPvGhIBaz/5nhkQxNP
         djeRwEEscPfEAyIKGoD/1CMQ1wca3+++nRrAxuaDw54B0wOMpjhsOjWOPynDqRxQhSvc
         qghGiydjuA4lF56sGnSVWnwCQVyZXr2nG9gLV86bIQ3F6vO6/wmPDv4TkiWHCU9AYVtA
         mXVcliTeDrgOa/MURgQiSqsK3bHq5w0Tf4mVLCTSADe5nvpt7AdN1aF3eqhLHTwoGnmj
         dgAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxpVExnJdYedxo1yqsgnV6ZEcYxfaNIcVYc8U3JH8yga+7qp86v0UJ8Hd4a2tPpFUDexLHlEqCxVAMNxA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8pcu8cpIiLJN1OFXCvydatnemzqT6d+Uw9A42m3fOtU525v04F
	r6BkZXhmSTM7A62heJzXD7BF6OACnH08YkOCuaMQ88GWk9HSfyLgJcVTX/CjrE/e5Ms=
X-Gm-Gg: AYBFou1kpisP2LOpsvpXcD5kOriQfvNghXMUVvpj2QD4PS2rQLSCN1jIBvk6bLLCGJ1
	nKS7cK3EBiMGbUKtq2O86E1y1846lVVsG+5LnxvyfKwLkLyaB3PlNrd8XVpueAxoGSLji4bhMjB
	8ZczszaLrqaiuOGQKFO1sfBG+TJwSRN9rc4KLOAZUB9ZxKwxiTuz9SGk4V8kvDm/BqJ3PjfQgGL
	Tcq0wlKcZ9C4wmeBw7v3d+yN7G79eMLDlk9gvBHTn/0IfOhn2y6LIcuZMhImspS/VINf5o0Cg2w
	tOlTKZKIv+08n0ODBAyr/NkTYGHXwNNY8fOEhocrJPaazxznWYaBr85HPF4agm7ebOTrsj1IAwZ
	hj7VrZtxyhjcp4vlUXL0sOIXtxnqO37JrQaUN0XPxeonGqTrmjI/1DFLjM3C3Canu+RczycOJvL
	ImxEHoswFQ3G7LOQsA5yr78Nu4wVsJHgJf8kEXLxdfQnkuAVFUvLu2r/jJ739fTnRvtBNXmw+cZ
	sWpFHey9/+ajVcz1EE/IqbdcPQNaCVjQ2E+XdiGU75IJRVbjyC4cyANuP0Hyq/tHyiTOs9RNvPA
	QiGmRwj8ee/LaBiUeINy3S7/4S45zq82judPqOQs5SfEV+n7Aq7aZQwnT6yBAJiiUg==
X-Received: by 2002:a05:6214:240a:b0:91c:75f2:90c6 with SMTP id 6a1803df08f44-91ca4a0cfe6mr304830616d6.5.1793872855188;
        Thu, 05 Nov 2026 02:00:55 -0800 (PST)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7e75b24asm43428156d6.39.2026.11.05.02.00.54
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:00:54 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91c1f548f87so26526026d6.2
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:00:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxGHmYE4us+PvjEAl5kz3KVXCP+80hjHeXNFwt7tdUyeZA1nMTNX5DRQWYZKjayqfSCFrqN7QidH50KnA==@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
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
