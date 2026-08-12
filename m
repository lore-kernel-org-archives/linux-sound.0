Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752C306B08;
	Wed, 12 Aug 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537929; cv=none; b=euaaEcW+H+4jVi8CnUfKGQsGcODD2cirA846b+saPs/BRxbV9fwcvf1SB8gf/1+2r3wuGTplFUto4D7LYumc70L2YThidOmZsId7b2JuYPQRZ2/1ooAUbDImiOEwHkUoFH8AMQNZ/ASz0MFFs27Lgu5b6Ma18cZ61R+Zf0eDgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537929; c=relaxed/simple;
	bh=QBSrCdWiZILL8vCZ0RG5NdehE1oZpz2bytzVEZK9Bgs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r4lxo62zBDFQYR3FzxDi4WldIlm9aOIUtiDvJPoA7v85pJrgydxUIKPEByrvpZEriVxBLmqgFrLswHKwmUtY63n15RzziFZU7XIVjHz8iWQAtaI28Onywyg5YIYjDEhGw1yZvEb4CPDJnybFkCi6bCkUoGJ6a5ccfihl2UPACWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qw59dT1r; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eeQ2t3jQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eQuAoDCK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=u0sWWo2I; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qw59dT1r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eeQ2t3jQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eQuAoDCK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="u0sWWo2I"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 403B6822E6;
	Wed, 12 Aug 2026 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786537921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=flL1t6vP4CWdNzf7sWUSfzf0pZBpgMfihIkPDRiM+sQ=;
	b=qw59dT1rRWoYI5qBwb9d3bkNVOEm3t5h82yt3wHYhI+QTvYf4bQbVwh8oAisovtH5cuKD3
	n0BX9y/kK2lajs2u2DUBO77eyAIUwBJph6srA/WcMV0OCQ1Oau6ublvNein+GJCLL8Vg7M
	NElAzAHUPNAHOXpfqQtH83WVFOXoFT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786537921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=flL1t6vP4CWdNzf7sWUSfzf0pZBpgMfihIkPDRiM+sQ=;
	b=eeQ2t3jQ1TlDWToclfOBgDTdyWsWLCe72vUw+C2EiIVuOX7aDFNKung2Q5WipJXRfrSAMv
	3NF47mr7KS4gGqCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eQuAoDCK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=u0sWWo2I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786537917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=flL1t6vP4CWdNzf7sWUSfzf0pZBpgMfihIkPDRiM+sQ=;
	b=eQuAoDCKrPlzobXSBr1SN6oiDGYM8NES4V9NN32dsx7K9xybwt9Mscl309+5reiX/GRm8q
	AUpfoG9hDkPhq8Aye4jEs4T/cJXSFNzwVVqruCkQe8AOtQ8RmeEur5JgBU6FTw44PWVBPy
	SMKH1b053EL9/xYMyQf/NwmFyXYUIY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786537917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=flL1t6vP4CWdNzf7sWUSfzf0pZBpgMfihIkPDRiM+sQ=;
	b=u0sWWo2Ig0VJJfE8P6scNl+/yvgu0cfERdx4pIPbju2cCCyV6TgzPSh9TT/pwa1vmgCnOJ
	r10fJQvgZbgEcxAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2506B779B2;
	Wed, 12 Aug 2026 12:31:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J+lMCL1nfGqWLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 12:31:57 +0000
Date: Wed, 12 Aug 2026 14:31:56 +0200
Message-ID: <87v79fzfib.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: syzbot <syzbot+10cd2d1efe8eeb604bee@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	syzkaller-bugs@googlegroups.com,
	tiwai@suse.com
Subject: Re: [syzbot] [sound?] BUG: unable to handle kernel paging request in snd_hdac_bus_parse_capabilities
In-Reply-To: <6a7c4ad6.ed659fcc.23056a.0082.GAE@google.com>
References: <6a7a6b80.9c11d2ce.289b96.00f9.GAE@google.com>
	<6a7c4ad6.ed659fcc.23056a.0082.GAE@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 403B6822E6
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,syzkaller.appspot.com:url,appspotmail.com:email];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[10cd2d1efe8eeb604bee];
	DKIM_TRACE(0.00)[suse.de:+];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 12 Aug 2026 12:28:38 +0200,
syzbot wrote:
> 
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    f5bbbfec59b4 Merge tag 'probes-fixes-v7.2-rc7' of git://gi..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=142eb479580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
> dashboard link: https://syzkaller.appspot.com/bug?extid=10cd2d1efe8eeb604bee
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=103a1149580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+10cd2d1efe8eeb604bee@syzkaller.appspotmail.com
> 
> BUG: unable to handle page fault for address: 000000000001c0b4
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0 
> Oops: Oops: 0000 [#1] SMP KASAN NOPTI
> CPU: 1 UID: 0 PID: 1039 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> Workqueue: events azx_probe_work
> RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
> RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
> RIP: 0010:snd_hdac_bus_parse_capabilities+0x42/0x6d0 sound/hda/core/controller.c:412
> Code: 97 f8 48 8d 45 20 48 89 c2 48 89 44 24 10 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 f8 05 00 00 48 8b 45 20 <66> 44 8b 68 14 4c 8b 7c 24 10 48 89 e8 45 0f b7 ed 45 31 f6 48 ba
> RSP: 0018:ffffc90005537ab0 EFLAGS: 00010246
> RAX: 000000000001c0a0 RBX: ffff888027304058 RCX: ffffffff897e8c06
> RDX: 1ffff11004e6080b RSI: ffffffff8972cfca RDI: ffff888027304038
> RBP: ffff888027304038 R08: 0000000000000005 R09: 0000000000000003
> R10: 0000000000000003 R11: 000000000000759b R12: 0000000000000003
> R13: ffff8880294e4f44 R14: ffff888022d6c000 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff8880d5eec000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000001c0b4 CR3: 000000005526e000 CR4: 0000000000352ef0
> Call Trace:
>  <TASK>
>  azx_first_init sound/hda/controllers/intel.c:1936 [inline]
>  azx_probe_continue sound/hda/controllers/intel.c:2365 [inline]
>  azx_probe_work+0x1d8e/0x2640 sound/hda/controllers/intel.c:1737
>  process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
>  process_scheduled_works kernel/workqueue.c:3405 [inline]
>  worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
>  kthread+0x370/0x450 kernel/kthread.c:436
>  ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Modules linked in:
> CR2: 000000000001c0b4
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:readw arch/x86/include/asm/io.h:58 [inline]
> RIP: 0010:snd_hdac_reg_readw include/sound/hdaudio.h:458 [inline]
> RIP: 0010:snd_hdac_bus_parse_capabilities+0x42/0x6d0 sound/hda/core/controller.c:412
> Code: 97 f8 48 8d 45 20 48 89 c2 48 89 44 24 10 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 f8 05 00 00 48 8b 45 20 <66> 44 8b 68 14 4c 8b 7c 24 10 48 89 e8 45 0f b7 ed 45 31 f6 48 ba
> RSP: 0018:ffffc90005537ab0 EFLAGS: 00010246
> RAX: 000000000001c0a0 RBX: ffff888027304058 RCX: ffffffff897e8c06
> RDX: 1ffff11004e6080b RSI: ffffffff8972cfca RDI: ffff888027304038
> RBP: ffff888027304038 R08: 0000000000000005 R09: 0000000000000003
> R10: 0000000000000003 R11: 000000000000759b R12: 0000000000000003
> R13: ffff8880294e4f44 R14: ffff888022d6c000 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff8880d5eec000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000001c0b4 CR3: 000000005526e000 CR4: 0000000000352ef0
> ----------------
> Code disassembly (best guess):
>    0:	97                   	xchg   %eax,%edi
>    1:	f8                   	clc
>    2:	48 8d 45 20          	lea    0x20(%rbp),%rax
>    6:	48 89 c2             	mov    %rax,%rdx
>    9:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
>    e:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
>   15:	fc ff df
>   18:	48 c1 ea 03          	shr    $0x3,%rdx
>   1c:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
>   20:	0f 85 f8 05 00 00    	jne    0x61e
>   26:	48 8b 45 20          	mov    0x20(%rbp),%rax
> * 2a:	66 44 8b 68 14       	mov    0x14(%rax),%r13w <-- trapping instruction
>   2f:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
>   34:	48 89 e8             	mov    %rbp,%rax
>   37:	45 0f b7 ed          	movzwl %r13w,%r13d
>   3b:	45 31 f6             	xor    %r14d,%r14d
>   3e:	48                   	rex.W
>   3f:	ba                   	.byte 0xba

So this crash seems happening because syzkaller tries to bind a random
PCI device that has no enough iomap HD-audio wants to access to.
A simple workaround would be to check the PCI BAR length, so that the
driver won't go out of the mapped range.  (Here the length 0x200 is no
perfect choice but it covers the least range used for most stuff.)


Takashi

--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1899,6 +1899,11 @@ static int azx_first_init(struct azx *chip)
 	unsigned short gcap;
 	unsigned int dma_bits = 64;
 
+	if (pci_resource_len(pci, 0) < 0x200) {
+		dev_err(&pci->dev, "Too small PCI BAR0\n");
+		return -EINVAL;
+	}
+
 #if BITS_PER_LONG != 64
 	/* Fix up base address on ULI M5461 */
 	if (chip->driver_type == AZX_DRIVER_ULI) {
