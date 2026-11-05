Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872533;
	b=14JGkGb8oJxy827WF2Wcx7x80BAQiCI9zcmvp0QCbPo0chB/8IA+QfjgXAVIXNZL15tf
	 C3d5NmRV2KFo4l66pkRr/0+HlgpCKwHll+EQd0PSz5NsB48YJBM2Y1vQ5d+2mLGyxJ829
	 fu05ZvEQ6wbaBMLGFcgjOqu4YeYOnvCV9QTA9rwtq+hdpmID6u5ShRF4x3OPmsuTUaQq1
	 9Ce7IzDZrbZvweaU74bZNWGAuIICZGTJMbySZ/vVyBFt21jwd/1b53HLzI218zYNpiVPm
	 nznP1qdSKc77uzHlf4PY5nCkv/PvB99dJXFjD9rQn+g7UwRZfdcUglRflDnSOVqa7wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872533;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=DEBVdWcMk2JcJ/R0L6jRkPeD/uwu9PVnuMx8ZgAVVrDnotoHhqOBpBQIuNC/a6kFHMrQ
	 kMboDC2pCaMa0w6qF8T1uyctVok4VeTi0wzDR+rUwdCRRT+5gNfy8HlzSMC943XsS+qL4
	 iitiHK2Zymhrla0O8dl8xdIT/TOo+lhgs70COqOVil9Eb9uDHeYKbHPXzy0P0PtpUCOzk
	 86A9zz2KHl1ltUV4KZXCMp8VhkvYVOSVgyByStSP+8KC6Bh6c+NhHZL8/kms09RHayHQk
	 dXqaJ3mACmO5XKLpciLgVFn9EVSOwEXrzQnMvVftxTJnNm6zLbgCQuqXczXbphtwAKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9EC606A332
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 09:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9EC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ead32bc7d8so1216290e0c.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 01:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872532; x=1794477332;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=BVhtOzpIScMKV6V/mXapfqqTGVnuJMM17be4+RY96UeEMFzuAZcPQaCSVmEAVHUNu4
         x79iSQTnAY2JFT9nWf+AXNZZlhQmYZZBa//G4nU1VynDvg6I6Ae+fSOEYcAUYOaBQmWi
         wK86OkzYKH1Awmk91BnwzDQaa/NmYDaM8ll45FhE1mtLqkMJ67DFHnVzuzA0LrZ/v//M
         YNR0eyBwJykVfX8Bb2OfiY9duuR9OMPfaUaRPGybJW0Me0vxT1rfyqX/XCn9XL2653UR
         SsylGOZvDejyxMS60HIocG4wEgTnDwIUq1I6KNauPi5lNdYnKNfJHtXgO3Im3Tdqk9ok
         gZ3g==
X-Forwarded-Encrypted: i=1; AKwUvBxx4Op7rD8as32sXTybu1eBTD6NgpWC84jowuWuk6gZ2NGBqobP2yTmtLE6tr9p6d0uDEKfQXG0/gU3Fw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q7OTD0W/GMXFE3WNgMT+r/Sza5Y3fc3ED8hnGCCaW3PxDO+/c
	gNkybahc0NZvKLA79PH2J+FICBJW8NpyYOSHwag7afk69A3p0w2eVdnjiiFMMstlASo=
X-Gm-Gg: AYBFou220LOEw781vkGOx/gMHXq7tNCUhiteiLijHp/RlWRdJc8fNRFnOafCxvLmops
	vX7z643cQYPY+mdqY0mCM4FdPVdV0GhR7c1Aky8ATMQi7yerKrIu6KmIN8Tus1KT3ANBLB1EQCv
	XkLqiEsJpfa/HgTs/aNEtdbLZ0fbTB658S7K9EXSdArcyRbG+vFgDObJFOihuejKKiuK+i/3wb4
	1P3nh3xbnU3LB1mkqkIR0IcBQlTdWVI/81z0dSKODp5HG1prCjKxpGPIhwKaC46/qn43T8HMLhI
	AVWh+O+VWd/40UHTp+kEJv7fZ/2VMGiqNwl/vrEZ0KscxsmpuWdWjGEMVFOnjIKejbdRTIZ5Kkt
	R75CgiR1FW59cqbHuo+2bu5eFJRIeDxOnJ8MQ48Dx/swU1OL5Q3RBJKiOvW155lNaAF3pElhM6p
	UyspITyKc05rd0A58gCwPOqGT3KtjiMCT+VtplsRBvbmBDT9ZuXnnNY/+hck6oILFxLAUIhqq/o
	EfGGCZHxBxDbMhgSyBeFe0DX22aBgjwwMIRFTFL0+g5lK2hBYoYZVtNwWT80sQeoW6dXTaKhrwK
	sGiV27D+it9vpFgvCvSasr/lqjiYfhbVPQ6Yf3evO/oTLEy4Q2FHfLYjTwGP3Usmiw==
X-Received: by 2002:a05:6122:2909:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ec68a0f389mr8666148e0c.22.1793872532236;
        Thu, 05 Nov 2026 01:55:32 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm3779831e0c.2.2026.11.05.01.55.26
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:55:29 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99911ead46dso758152241.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 01:55:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzZLvpsAGU8rAdRiR+XrSh3WeNpx5eGcuMgDeRxdm+UyD9eYAzMgUtKm3iUH6FP9495t7EfpA32wwK77g==@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
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

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
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
