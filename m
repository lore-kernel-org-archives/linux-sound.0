Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273280;
	b=1EpUAv1u2OEEKttx3l2bvP1iUa/ikjT6tvqlykm72HKMBoCMay0jFTZRYh08mN8favZt
	 prF+QBK5a9n8rKemPuqoseIKwpx9nN2xq4alFH1epvlU7EtsKbzTpdpHn11pPYlBvGr7w
	 FVPJIpL5AX/nFokqiZo9J2iIaXINPuWBWkMO26+u+bO1fQMBofA3fj7gestl+bIbEw92u
	 ohU5a/FIxGDXVyyhzhuMgeItt1xzg65Xfoq9wirpxf/FEDkKUlhFQciV+rOEl7RGLOImw
	 rL75YhhtT9XFnhO9ZMB5eyjrzm7mUIC3C3HoXeY+1wKxl561AKOs6eTR8CNPVZlU1RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=f9VGxTr2h4UHcj9yYubY2ZfoY3uWI8HwjMJXlvphC/R9H2AqnCWNAtCgj1M0gi1wjtee
	 iJpBnl4DNiEvDgdgf6YmENQZs9z0jS5fTYPeyRkRFqxy/go2UT0NZXR+mM+n0/BWQEgZv
	 YVDONysCdOIkZ+Gga6o3k2fDehOhtjxvnteyYLK3etVzElorKdc5rQ/IW5p9XQK3JL+oR
	 toQKL0EB1yWj6bL8BF688VjfwXa+x9gr8SPqEsCsRXMzvyYV4evQBRNsPYA/ZSPanhUlb
	 ENwBAp25D3ngEZpltcIoD44f2AtM/C2Rt2A1GD00Ektxv/VnD6i9El7MnlIFA/HrkYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=c3HPZ9w3;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B156606A32A
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B156606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=c3HPZ9w3
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so940327f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 17:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273278; x=1794878078; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=c3HPZ9w3X3vdF/+J+vaP+PQYAUd2+9JOKWwj6JMce2A8a3XTTDedjlXPO55cC45zjl
         2hZf2gArAaC7b2VANcAz9siQ8hXOL0yOpee0+28IQ4U11h71kiwdUMjW00TOftz1OChD
         IA4Fb2sqqSoZR8rQ6NvDOj7SKOizFmF/BfqF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273278; x=1794878078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=UalAmDC6SvZhW68hJ7nkIDB63BkfIEdYrkof6TCZPPvIvlM8lr5aODeSRaF/vtlTAH
         maF8fh60+hRXw/hwDFaz0xrICLILBITfWYXfgrQyIJEhVZpMmdIF/65P67Jn27j1bnem
         W1P+aFL8U8IHhCKu2FNJSZSqLTDZStEmG+75X9aw5JSS1Jn8sIhsg8qyqd2hhysRXZth
         m0siAm768oMBq15tU3XhmbybzWpO6QhGrOUW/lz4q3OM/h+LHjHzmFUZjEQ1a7c68jXi
         3Rjmvoe55xcrRoVbtptWNOufRAVQXicJCsJ0WYDlfS1i2cuIhV/tWYoIjbPKaXsCwC5C
         L6bw==
X-Forwarded-Encrypted: i=1; AL+hErFCXDBQ6oLwfFxrXVcvPbQAChzO2l//8wUcroOltI26LjoJ4IsenLW+l2cmLnEppQBIgW+xNCQ5IYpoSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/fVaZoMamRhhcV0VuhbK57tZbyWUv3eQ4cOcsHGIKbNfzM0Cok
	rsQcRaY4wow7xrIfuDog7rxrd4fRffMp06EWaGoOAdU8AusZ0opfhTnC+zEucWP+yWMlAAkwnZz
	8pNSQ4T3XeA==
X-Gm-Gg: AYBFou1LZAGkoWG+M2uMsIT4CTaXINjXCjVbn8S+0RA1wxii1FzJZdgAKDhVBn7sOVy
	CNjuVRor/whwFLKSdnrXbZ1J5MJF8h2x/eY0/HVlU4ymIK+KDoLxTjzqob9cdpGIUyN1bLnWLEe
	KhiLIZckFhp/bbG4iD9DpB+iE9p39VOlsKKV13pTVsb7RqOa3zA4a53A8TSEXkgYa/+TaisJxRb
	BxbpeXTIE0V8+uLiEgx4WxDeHdb1CtrcS/zqXKLnK5613yIW0dZDINwXG4UZMik32z4FVchMiLQ
	GmgwXF9zHMjpDIh1GvzfdHqPk8Ui6Gd8Rj1i0hgWROxf4lT4oq93CQf/AUIV5Bre2NnjsFcChy2
	vSjwI/prtGBNx23326OSuPl3gEFp3eTExLHUul8FxxZ2SwD4DCgsjmqNvuxojjYHPCmZAGGoyFx
	PQ1WjAeB32twHgqd9hHguCLep+VRMWjWrOda9GxZ2wHEBDpvj4ALYtoTqwaCUMSlMr6XHXLT5oJ
	dyIP5Vm2hXG4GV5hBNhPH3EN71Ywa0g9Uk3hI+JOn63IavBQ2nZp8xwJuVt2kCSHjWOaiCh7Guk
	cxA8Enw8sFzmxIFNv0Y1EbgzzqrIfvxYCbn5g1Tgo7XQcyfRBHgxFqOz4mv909ZlgHEPP2t9hCF
	oWw==
X-Received: by 2002:a05:6000:27c1:b0:48d:fd4b:cdd6 with SMTP id ffacd0b85a97d-4982f874225mr1029093f8f.25.1794273277792;
        Mon, 09 Nov 2026 17:14:37 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5b9sm1980351f8f.9.2026.11.09.17.14.36
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:14:37 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c450ab1483cso245236566b.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 17:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5JDEw+zdo8z0eHjH2dn3LhEfixhAln3NA3kGqvQ7DFnvQE4F4ylmOLlFZ96ZeddQ6PqVO3bSwwlSrHw==@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
