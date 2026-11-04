Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823076;
	b=ZnnkDBC0hX8UqgCLRTf117c9uVCtwpaupWKXcBSpDaKDTqynZhz7uzL0ISYuFdQ6jhUN
	 vhqRAf0tV3Me4zz8gfZtf6iMG3PzmftlCNAiHbN7ASYTnFBTpIOT8tu9a+vLh3vV8hu85
	 AMK2tPv7B5k2BqmkD+cm94h2wOZuLJ1ckWQLvqcvJJpVIiW0Mp5Zy2VD3jMtGHNVffj8M
	 M/wAWkk23iClKerLSZxuGDwB/gpK8KYz1kLL7RlpWXOy8UbC8EWF9lQRcDU889BCsjoH3
	 cRSCP8QPXVh/c4CN4mM5H7vK1KbMY0+zkZS6Yz0iCydQ872rwEXrYeT2vXgm0tWD45g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=LOrkhqYM4sxLavdShji2oZEQiBAUHi4hihOpbFzR9wJ3p2WUMjw5x0DEr8+3Vd31bxE1
	 vJ/Vy5gxhYTThAmoea629IrIWnHDF6fkTAujSZPiN0tLyrMOiRwvr7zCEHR+Jw/Qh7gh+
	 2x1U/GHXphXbs1m+8J8R+5la7IrV3CuSjUr3rddU6af0zEBHQaINAK3hQ/EqS4mFkMybi
	 +9BQ6mQv97FY5//m7JoJMbBrWI8NAy6LDO+a0JBv91uQ+pzs1ZMSFw6yP6Yh6ABM/TOyw
	 iE1hYVWtgoeT5UAxffvuKPp4tuz18Xuw8zMinIvdi+XIWm/MUCUTaNj/nRFlUEK+/ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=D+WoaIlg;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A294607F287
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 20:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A294607F287
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=D+WoaIlg
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c423b145922so162982666b.3
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 12:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793823074; x=1794427874; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=D+WoaIlgn7GR90Re66DaZJXg6cruikrrY05vWAWYWwuZx/NKzqWZImQ6Y/YjqfT0uR
         WviNDVZ/f094GtgrW3FlJmiFD/oYgeWy1WZ1obUP76B83AdPZYBNx+nVIouM+3b27YvD
         zP6ROa+6IScSM3DYxgSm0JYVypsHiHr1wXg4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823074; x=1794427874;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=ih3BaSTFXzRTIlkcjAeuT5v/Bd1by9F6Z6Sm5KSnIo9OPdNxEUUG5x9KeFxlprLsyf
         59MJF8xbZa3eO75mPrFZP6X0pUwzGDSu6j2Mu86C1vxNm2v3ZEmBniPGGJPYngvGqW7R
         bbYLzNFdr2hVYYPMnoTpqyhy10LNm8/OoXsFoqpR5IP41zl8+Jfl0U5zjty2o9nnWEAT
         8o846Cf2nR0uwzEFoYk8iBWRjaFqterweTnElRybyM10gEsS1xa0jdwHOPaanzZOYgRI
         TAERnzRPFEtEDD0+BY+v30xb3NKZys5jVj/FXBFoMxqz+s4vXM/d2it+lokPI7KX993O
         mHCg==
X-Forwarded-Encrypted: i=1; AKwUvBzLZYK/txbQmTL0QMuHBwEQIQF3iDGHMzZWwBT+R/xL58fJ8dq55DJTw5ywHKFDsvtQFsYmmX9p60I0Uw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fQGTO0R7lRdh7oe0jhKnB/YVBMc6mgKygfFZfh/IuZADy6nu2
	s/0eaiVh12MqCx1ZJcTMhPpDZOngD6nZb+cgxM8LBqjvACb1cKRvwzxRElNNffhJg9YQDz7xots
	HhXfl/S00rg==
X-Gm-Gg: AYBFou0eMlSyJ2uBWryOKfPk1Bt98Xz3/5KODP/NC7DSMa6VQSRvS5D4cZyfErm8lK3
	K2ix5IaNXX/6lwslC02IKZAJPiMZZ7OH9ad/yfWuN3s11e5bwoLo3m0qEZ8cV+hkrRyv+UfzdIb
	YcTLh9eUpM+aWLefAfYQr39pPnOOMX2pXvFC+Rde9wBgWYdWf6PCgR7ek6H38b1/eUM/FroV8vd
	PF0yNk5wPwdTUjYObpTrl5XgJ4VRewBKTXa/XxD5webEjnLOUyQwN2uAAFtzYQ3VTMUkoRV1g5a
	hq+Ovdp8J4uJuzSq1ahI38qWA9U6CkKs83B5TxjQxzbKjh872wB04+H7fPtcI0aYdIHetExeoxC
	ytVcm5ETEjDY6vVeWfTURXSHT0cLuZMyEnylV/vL432pU4fNXpzOEFMOmqv7j/2vI9zDHix2D2I
	LoeG/7T2IPGX524jV/nVsTT5+8g0a0xqSHy8QnN4yeintTykDFT3pYrL6g7uaOhEGlO0e0a/1sT
	cRl2bKoYl07k7oBLoZ6+KSXmUNO9KRiR+CXpzn9mmFOldnGWtnj0+cQ9L3oV+jdGtz3spVXoxrJ
	Zn2CsCelz07dvZUw3YrdpTCrMN+IkPOb7qFeSQgoTrdaq0lczH18QlvhEcvbGYUUEkVzjP/voh8
	4hQ==
X-Received: by 2002:a17:907:9410:b0:c34:1ed:54d9 with SMTP id a640c23a62f3a-c4ca795ef4amr1614194466b.4.1793823074574;
        Wed, 04 Nov 2026 12:11:14 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e46a71fsm104590566b.61.2026.11.04.12.11.14
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:11:14 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c418e215671so167554266b.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 12:11:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwKfSf35Pzf2US24SNJ4TwsIsGMVn49T2rzCDc+XXUqH1gIi2EqyWXyzFMfp27Bj5CaOUuAEN7SHA+RBg==@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
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

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
