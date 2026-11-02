Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642671;
	b=ScrcxA6IUTWi6VFAHjEXfeDst546KJSEtGCaA9Hk4NOECceIOkD8dFbw8VTiVGnimcyr
	 366AvMHcaVPC6Kot5dCrhwW3K1wXZGZlXQSalbMPORLj8ZPvG7iSPTkNknXukPvEMESnD
	 R8NjNA3Iit4TmUBbkB935trdGFrXoDoVfZY8UTtKHLdQQBJPNN2WucXPVSDSLxq1RXTMP
	 uJiyWUSP/LvMHj6+E/qZhMGL7MoLFT3Vbb78d9Q00C3WGmpku3p4zCMJeyM7TwRNNaFp2
	 Od14IyEW5CjCNCjEBX70VJWqaOtnwvs4PIZfKQ4E77ejHlwxxmK5YMExJkjZ8yfI/2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=RQGCnrvjb5xCZZ8c403rsTM6ViJbH5r+NCV1c/6+ym/p2JGbXY0nAPGjWFoFgWOFcCmf
	 2lHGBnGPRIWk/bBbLoVuqcusYeLSEzn9gOSXphXVqpMFUDoMeCuM1IH25YZ9PZ8JMf8hQ
	 Rpgur81ICMwX0sp3OAEIQ4rKwpoPzCeZt8eI8rYC7kl+7tPo/i38Wnuj298oC2p//1m+D
	 ByNJFvi4HCxw7UQvKds6Ay6JJL6p7li3RbL+aCyMs9ISD4+TVuB1SWbVnjO0/u219v3fo
	 ljnh83S4H8FnpNb9AveCH4pDPhKj7bgpPjKfOK0IgoVcimWX2MsGkg+so0DVpr7A2Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fuR79jCo;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FC606A333
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 696FC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fuR79jCo
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso2154620e87.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 10:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642668; x=1794247468; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=fuR79jCoMVC3Euxr6m6upqwVjszP9rpkLpZinu1MaqHvkWNsE9g7h4qv2Vg2x6mYge
         oyL+MCDAnvl6OHW3volwpjH/XzVZz/DxompuK3qa+rFBDb+MelvKio5UcJWFE+2rkKh1
         AFSZVlwgk/A8o85y1nzG769a9gbY/TEeEPnQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642668; x=1794247468;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=OhSC2pVnKxD7AGLUYtqk3HudTC2BHiz878kz/ChTpSyhtJu3QZX+oRdqpMxo8kh1Y6
         ofM2vCrJTtAFe3cvOFnL3HSplwKJp7o9urMGs0c9qg6p3gXdvJ55MgyZYSsbLGfZX8CA
         AO82NzSkgUFQckjP7ejTGEo6x4/HO4DO/MvtDBrXcboWwwu80OdAwk005j6+yWLKENU3
         9tMqrG97iNQjdX1Poyho+aV1Uii4iMmXUnLosxvDmjUkTaPWNnj4ffsq3VPxeYHka5mu
         kHLvzZW12rtSvhqLtAqYSvEsD8jrbgWv1TMyzDxF17HvKyZpR5zi30IUvBfF5DyCNaKN
         ZnDA==
X-Forwarded-Encrypted: i=1; AKwUvBwGA7qY15VTC8xuAg0izaYzN9Hvr6vy/ZrANgORMit37foSC1d4JYhP0SQNlOVaS50C7o86uu1nwX3eRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9VhCG1tJUmM3zebmRRTkgoXiPzKE1MHYJl0UJszVXxDc8QDpNX
	uDivTTIJ5fhO4HGhjWxiF2rCtAOPmyzAkhZZA3SvqUuuGwtKYlO4NM6Nyz2zS+0DTo0cmr9D5Bh
	IyaMxSyqU2w==
X-Gm-Gg: AYBFou3MiTPqbyxFharpjR8MovBH1IDmILlxS86jry05MtmJNHghDB/ySbyqkaquKNl
	SlcFL9KSAGnX7jKs2m4eTnelXw/yZ+FXWjTxavmbVTbulw/CG2jSpxfpviPKPxIsoX2HCuworDN
	ERQt5WHOwd6s1gqHdHi843t8BPrXGB7SSs46LUR+gAdakcU0NXItNRdZZZvYId7o2OM3LMyCD1j
	p3vId/ruKKLXMmOgrDd94gZ/CMrM2bUA8vxkpd76RkSlEHlX+mNQKVKB6o2tzf4fLbpBkwduFNC
	8H5wSsc2igAq+27UeXLoP8OqyWjjlm7J81L5nc4nus0q8yvGDwgGaU25DsJrWN80w3noXGUBeYP
	lfj8PwSqpO4AB2hF92pAjr+xEJwFkJ3c9UuCAI9hpvh10z5RhuT32q+HzdEINfgwhS7Kgt7buL8
	ZKvag2YaniCnJTH2bJoX/aWA/lOp5dqLdadJpuRTGHx4TuRvtBQBTTKl6TxBbOcUPChKGJmkaav
	0sWYUflLHAGavIIROVrOvCqUYRS6POYRBIXRxnJuR4GSXTHIpyGaJmfCU64jmPQ+yA7p36b+98R
	9d17BzUuKuhgPfVXWFwLAekdCfCM+uLtATJ013LErRcLc/ZoybFS9OiL14QHpbN73fQz/8d9+js
	3ViH1yw==
X-Received: by 2002:a05:6512:2250:b0:5ba:35ee:bd96 with SMTP id 2adb3069b0e04-5bfd12307a6mr4127678e87.41.1793642668268;
        Mon, 02 Nov 2026 10:04:28 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edff5sm1759844e87.4.2026.11.02.10.04.28
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:04:28 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ac65e845a8so38009641fa.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 10:04:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBybItN+GwFBJsABMeNEORbPf7lMIfiPyhJyCgyMrSjs02+Op2xtxRI89huDp0xHkKtbJYDfocjcsPq5Gw==@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
