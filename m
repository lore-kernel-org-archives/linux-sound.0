Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DE1391;
	Sat, 29 Nov 2025 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764403611; cv=none; b=GDWLs/avp4ScyvX32+CsWhEkGEh8Zq+jNlw01jpdrqDCybFVhF27iFWPg/Iux42a1wPMxbPBQbrnlaVfvv7zPuu6JxG2YiN1fbyFnNJNKxkGCZ68BCbxy8XGBQHq5zhTiFINJg6pGzYBSDQaqpmx833q9fx70+9sxj4/Y9ehPaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764403611; c=relaxed/simple;
	bh=KWBA1cb9o5E6rKKQ3Dx0GTc9O2hCdvPCa9zcMTqOt1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6o9CxeFOADJcuIkiQivigWWupAVvzsEv37DT4WmpazpXtba3xEtR6IkntXEh0nlams9CFJycNk/Q5G7oZAJQM3SZj73FV6pDepBTMyiqPYHQ8TZKdW2UTk4bpdgm8R3k18+8cYHUhcHnvBHKfKRUjhxrARwl4gdhizJBBq/fWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=S973Snb9; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="S973Snb9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IOeJui+ymVXqkcGKIIAFN2mrSnlfT0vWwPe0qomkOik=; b=S973Snb9TidWNeobC4C7assEox
	364aZWnPFvNR5jbIpWuF31i9sg0mWJ6PckI/6OkJDlQlvTPV1m62EiZqGyMesZlLOaYwn0tvKkTHe
	tuPasYqxRwdKwazdXErlLQgKxx6fsf7qN8aj1vln5W/MKkXR6eXvDJ9NWX8/1e74jP35mX3R0zH/J
	ZAnSb6RvirYhFs24OPFSyoNhbV9AAvtnyQ9+HoSmdZT1A+n0DGyV7KPv8NNkdX9zry7FObyrylBkx
	3mcL/3beEix73ASSFt8fvtaMuUMNrPZgqLzAClvQXcI0DGv1nzw0IqEuxh3zn1WVh0EL/Y/Uhi7kF
	CNVgQXbQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1vPFyT-006W3F-S5; Sat, 29 Nov 2025 08:06:34 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id CAE1CBE2EE7; Sat, 29 Nov 2025 09:06:32 +0100 (CET)
Date: Sat, 29 Nov 2025 09:06:32 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: waxhead <waxhead@dirtcellar.net>, 1121535@bugs.debian.org
Cc: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: Bug#1121535: UBSAN: array-index-out-of-bounds in
 [...]sound/pci/ctxfi/ctamixer.c:347:48
Message-ID: <aSqpiDfrvIyUt813@eldamar.lan>
References: <176428476762.2962.8176922083972711750.reportbug@main.localdomain>
 <aSk8KJI35H7gFru6@eldamar.lan>
 <87a50683z8.wl-tiwai@suse.de>
 <176428476762.2962.8176922083972711750.reportbug@main.localdomain>
 <aSn4xQPVFYAfdgqu@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSn4xQPVFYAfdgqu@eldamar.lan>
X-Debian-User: carnil

Hi,

On Fri, Nov 28, 2025 at 08:32:21PM +0100, Salvatore Bonaccorso wrote:
> Hi Takeshi,
> 
> On Fri, Nov 28, 2025 at 06:24:43PM +0100, Takashi Iwai wrote:
> > On Fri, 28 Nov 2025 07:07:36 +0100,
> > Salvatore Bonaccorso wrote:
> > > 
> > > Hi Jaroslav, hi Takashi
> > > 
> > > A user in Debian reported (in https://bugs.debian.org/1121535) an
> > > array-index-out-of-bounds affecting ctxfi/ctamixer.c:
> > > 
> > > On Fri, Nov 28, 2025 at 12:06:07AM +0100, waxhead wrote:
> > > >  ------------[ cut here ]------------
> > > > Nov 27 23:46:53 main kernel: UBSAN: array-index-out-of-bounds in /build/reproducible-path/linux-6.17.8/sound/pci/ctxfi/ctamixer.c:347:48
> > > > Nov 27 23:46:53 main kernel: index 8 is out of range for type 'unsigned char [8]'
> > > > Nov 27 23:46:53 main kernel: CPU: 4 UID: 0 PID: 468 Comm: (udev-worker) Not tainted 6.17.8+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.8-1 
> > > > Nov 27 23:46:53 main kernel: Hardware name: FUJITSU /D3446-S2, BIOS V5.0.0.12 R1.26.0 for D3446-S2x                    02/11/2020
> > > > Nov 27 23:46:53 main kernel: Call Trace:
> > > > Nov 27 23:46:53 main kernel:  <TASK>
> > > > Nov 27 23:46:53 main kernel:  dump_stack_lvl+0x5d/0x80
> > > > Nov 27 23:46:53 main kernel:  ? __pfx_amixer_set_x+0x10/0x10 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  ubsan_epilogue+0x5/0x2b
> > > > Nov 27 23:46:53 main kernel:  __ubsan_handle_out_of_bounds.cold+0x54/0x59
> > > > Nov 27 23:46:53 main kernel:  sum_output_slot+0x44/0x70 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  amixer_set_input+0x4b/0x80 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  amixer_setup+0x1b/0x50 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  ct_mixer_create+0x193/0x570 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  ct_atc_create+0x3cb/0x530 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  ct_card_probe+0x104/0x2c0 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  local_pci_probe+0x3f/0x90
> > > > Nov 27 23:46:53 main kernel:  pci_device_probe+0xda/0x2b0
> > > > Nov 27 23:46:53 main kernel:  ? sysfs_do_create_link_sd+0x6d/0xd0
> > > > Nov 27 23:46:53 main kernel:  really_probe+0xdb/0x340
> > > > Nov 27 23:46:53 main kernel:  ? pm_runtime_barrier+0x55/0x90
> > > > Nov 27 23:46:53 main kernel:  __driver_probe_device+0x78/0x140
> > > > Nov 27 23:46:53 main kernel:  driver_probe_device+0x1f/0xa0
> > > > Nov 27 23:46:53 main kernel:  ? __pfx___driver_attach+0x10/0x10
> > > > Nov 27 23:46:53 main kernel:  __driver_attach+0xcb/0x1e0
> > > > Nov 27 23:46:53 main kernel:  bus_for_each_dev+0x82/0xd0
> > > > Nov 27 23:46:53 main kernel:  bus_add_driver+0x10b/0x1f0
> > > > Nov 27 23:46:53 main kernel:  ? __pfx_ct_driver_init+0x10/0x10 [snd_ctxfi]
> > > > Nov 27 23:46:53 main kernel:  driver_register+0x75/0xe0
> > > > Nov 27 23:46:53 main kernel:  do_one_initcall+0x58/0x300
> > > > Nov 27 23:46:53 main kernel:  do_init_module+0x62/0x250
> > > > Nov 27 23:46:53 main kernel:  ? init_module_from_file+0x8a/0xe0
> > > > Nov 27 23:46:53 main kernel:  init_module_from_file+0x8a/0xe0
> > > > Nov 27 23:46:53 main kernel:  idempotent_init_module+0x114/0x310
> > > > Nov 27 23:46:53 main kernel:  __x64_sys_finit_module+0x6d/0xd0
> > > > Nov 27 23:46:53 main kernel:  ? syscall_trace_enter+0x8d/0x1d0
> > > > Nov 27 23:46:53 main kernel:  do_syscall_64+0x82/0x320
> > > > Nov 27 23:46:53 main kernel:  ? restore_fpregs_from_fpstate+0x46/0xa0
> > > > Nov 27 23:46:53 main kernel:  ? switch_fpu_return+0x5b/0xe0
> > > > Nov 27 23:46:53 main kernel:  ? do_syscall_64+0x200/0x320
> > > > Nov 27 23:46:53 main kernel:  ? exc_page_fault+0x74/0x180
> > > > Nov 27 23:46:53 main kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > > Nov 27 23:46:53 main kernel: RIP: 0033:0x7f77238f3779
> > > > Nov 27 23:46:53 main kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 86 0d 00 f7 d8 64 89 01 48
> > > > Nov 27 23:46:53 main kernel: RSP: 002b:00007ffc398103f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> > > > Nov 27 23:46:53 main kernel: RAX: ffffffffffffffda RBX: 000055e0eb622480 RCX: 00007f77238f3779
> > > > Nov 27 23:46:53 main kernel: RDX: 0000000000000004 RSI: 00007f77239f744d RDI: 000000000000001b
> > > > Nov 27 23:46:53 main kernel: RBP: 0000000000000004 R08: 0000000000000000 R09: 00007f7723ef6280
> > > > Nov 27 23:46:53 main kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 00007f77239f744d
> > > > Nov 27 23:46:53 main kernel: R13: 0000000000020000 R14: 000055e0eb61e630 R15: 0000000000000000
> > > > Nov 27 23:46:53 main kernel:  </TASK>
> > > > Nov 27 23:46:53 main kernel: ---[ end trace ]---
> > > 
> > > This was specifically with 6.17.8 but up to the current stable 6.17.9
> > > there should be no related changes afaics.
> > 
> > Thanks for the report.  As a wild guess, a simple fix like below
> > should suffice for this case?
> > 
> > 
> > Takashi
> > 
> > -- 8< --
> > --- a/sound/pci/ctxfi/ctamixer.h
> > +++ b/sound/pci/ctxfi/ctamixer.h
> > @@ -22,7 +22,7 @@
> >  /* Define the descriptor of a summation node resource */
> >  struct sum {
> >  	struct rsc rsc;		/* Basic resource info */
> > -	unsigned char idx[8];
> > +	unsigned char idx[8 + 1]; /* msr + master */
> >  };
> >  
> >  /* Define sum resource request description info */
> 
> FWIW, I cannot test this myself.  "waxhead", can you please test the
> proposed patch and report back if it fixes the issue for you?

In case you need some support on how to actually do that, we have the
"simple patching and building" instruction here:
https://kernel-team.pages.debian.net/kernel-handbook/ch-common-tasks.html#id-1.6.6.4

Proceed as follow, create the patch file as posted by Takashi, save it
as e.g. ubsan-fix.patch

Fetch the linux source

apt-get source linux
cd linux-*

Make sure the required dependencies are installed see the above
preparation step in 4.5.1, that is 

apt-get install build-essential
apt-get build-dep linux
apt-get install devscripts

then within the unpacked linux source run the test-patches script
using the proposed patch:

debian/bin/test-patches ../ubsan-fix.patch

Let me know if you can proceed with that.

Regards,
Salvatore
