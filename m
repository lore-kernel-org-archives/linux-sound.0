Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=Re7ckemBoYBe6Q3fzNUzseU9k9XQCRt5qRCPCvhdcyYZbDzxqibKTyZXFR6hooMo5YQx
	 OnykkfS5TgPTJc0rIZ2SpRzbCCYWxS17enP7wj5AnQVLGfVRnMwATVeMa3kRK1un+oHnH
	 f0w8kRtPWaPHwaIZVOqyZOMVDx9iD6vwUOV4sXJrvfD0GfgPw3xSp6VcQmRS7pPV5TMsm
	 2dKZASjA2HqukSd99xJerrRFynlukXHcRbg7vNZzdGMT1q9aKhw9btK3NPQByDm2yy3NS
	 Dg22Bn+iBdoz0T6yYOIEv2orJpTkNfowrv308DJgUzkHGI8T7t7vEhxvEtHf9l3J+GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=eZ5mdbQaArALlYgveVs/f9qNIM/+rJkHUmIYHjX6Cj5jY2QZzbwhM/2MWGWRVRtMni2J
	 Cacd/UdYk1gGIlEhhoh/p3nG7j67i1UH8SXKu3ms3OEUjejWnUpRsDk/Ky7keW693Bqei
	 gUt2J41ibxovpFqaZzoo+HGZH054sOb2yOXUBzYc6vEB1S3fwm1KvsI1L5XATpKGDXYv+
	 J8ty4lHvoZ3TICb5rR1UE31Yqry7X9OQKOrtnO64EdTK7p75CgxSWGGSPK6zrx/ebVG8/
	 JkbP1nX30SepLH5fCbPLs8VHo7eoWeaEFgxXgVmgJ+NiHueO9cu2TL2wBx142K6xySg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A56606D803
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A56606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so1416385e9.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=nbedxu4Pdjc+k6/Snv7//HmxWq4GsOOQWlcjcLi3QIUvo+HwwzhuYXkO0YlioKaxGb
         Jw79FrnutSyHfdB/KPQuquKoaiqlnemNbK4Q8zyeKqmBILizcg762dpT0o+MeHO8Mkyj
         DUsIw9tUcS1LThLX4KwP/zTlS6BQD8Xp3kK4M3HA4keWSKdFOj2C+m2EJdtPBpNtbkp0
         9xInS0Z1fLP1c5Q7B29OfL/M3oZpPcuwKczZXty6lpuBNhGlBVwi0ww+ZVbuNc+1fnMK
         V9tsmC3dpbbHmFXWa/yLVxCNC9E3XhVIDQhLCEW2zSjg+feC0HZ8nfvGiLk9qFVXemnK
         /CWA==
X-Forwarded-Encrypted: i=1; AL+hErEWc46sR8j2Ozv6XNl2Q4BJHe5loRDVMigSdM3p9J2CE5+Rp+B+auVb1DTgmIkMSIwR1v1nnfpkxx1DSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BKm2HEEnEsPZhKrHX3ZsXlaXkMe6eGO3O8cd2f+ROMozBlyM3
	DWgXIkScmB/mbm5CvyB2IYtroF4tY3YZ83PxHJ0n2bgkpGewxnxeX+XB
X-Gm-Gg: AYBFou3kI1NT18q1m5zg+m9EhoN/RVMntl/qBJiHz62OGRmJZDvXnmjd/uWjAbbpqDU
	+0vu0k6svHQUJ13BwIrxUaKJeOGt/tgsGuMa9G0ScqpW+LSQR1axJj/FAhRZI9fyQXF7SyOxodF
	/0P7H+g6qyw+Wqiksve3n1f9DDV8BMcPKWMJOKObzzYy3671DbzdjvmFTXHZNgXbTfMDI1EDb6g
	SqGqkDmIclhFLZ8YaokkhaMLx1BrsNwmZlwRsmrvqO9KZ8QsQkWMWfWOjAehG8W47ig251/Tziq
	PG7W6qadbhvOTnsebxVJF1qtB310ZTE3lcZfnc4dwdgwoFJ46eJoV2pCoY+FhJdeXlwudEz2rIQ
	isgLr1TvmCHGPbT+ZjTvzGQinT/8FDgRSpfWbAqOB4XEojRSVIV27QWo9A9RXmxZ7N96Wsg7zhE
	9F9W8hfda07/eFVwm1tpQXNr/0Xg6Lh0UJuRTa/fQI0kp9VIAqid/3gKjFmodCWpd71O9Uk1AWa
	i5zu719GpRU8q9uKPfYFC6+U0ZmwEhGZhmOFH/Y6s7axqqndS6wn/D7lmjAMd0vF6hu1E51tNOp
	lI9WCAIqOzYRsf1MxY4OI5JIpVxj+B8SB2bYbdV+OybfRAph85cKRr7n+VBUtdQI
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
