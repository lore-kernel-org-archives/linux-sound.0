Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EC42C11DE
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 16:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779208233; cv=none; b=lA/MFFqCieQjU+ijveJMMctDNuG8nlQgycGPYpskKHHdrqhU5BwfqBOCO5Or55FqjV0+az7XBwfQ5xskAEFnhnfgJW+8/IW/NMre8T0VYcyW9y4Ib8OAYsrmQSv4Ob2I/yZX69fP/CnAg29Xb+ynrnSQTljQXln5B+tVC+Yjf84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779208233; c=relaxed/simple;
	bh=5E/TdpnrUE0Byi518xyBR52W7k/pbWyhSirykvfOL7I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AmotQItEyLDMPxqCatgsaW6IrlE2MWiF0hd6a4aWMhDyco0XOsMlEAvdpb4WrSdmLCd7DSh6myHgamDT0fzgY3bcwnVNt4+5SCrd45CXOvSPNwfmH+qDUoZq4i6eRhrTdirlvysg8k7hsiQEhObrFS7CVbDYwQ1vtAuZDNrnwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FL12N/Nm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PhKvvaZ3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CNirJ0jh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JXdKDm2e; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FL12N/Nm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PhKvvaZ3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CNirJ0jh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JXdKDm2e"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 05D3C682DE;
	Tue, 19 May 2026 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779208230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Dg19OKPhl3qRoAAIvZLAQuJMzHpGtI4y+0rCMdtcAk=;
	b=FL12N/NmW3x0Qt+uUxpqsikNxwfIi5tLZIq9OazWBCSPNfkY25m90o3XPJkwtvSM3bXoM9
	8PkkhmKqX1dmB7b2W3qQLhUnOF3wrH6x2PY19cvFEtryDkya6Z4s95APzWJWkkkOkasKDZ
	D/upRUw6H7m05C68/b48uF5hSHY/ny0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779208230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Dg19OKPhl3qRoAAIvZLAQuJMzHpGtI4y+0rCMdtcAk=;
	b=PhKvvaZ3nv6WiTm94029nbV5r4t7Kda/fYlQ/rlmAdSfKX7Y+AbyIvSK2ruDdAHmbDyw6F
	lFRgR6rQSG5lstDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CNirJ0jh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JXdKDm2e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779208229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Dg19OKPhl3qRoAAIvZLAQuJMzHpGtI4y+0rCMdtcAk=;
	b=CNirJ0jhQJYe9JyZaBFwIht6SNunWsvFX8oheul/0A3BifQaWgxqApQc9SiW1rxahg8/R7
	609QveWJpD1it4BpXLe1OFpLtPh9vetnvEq/RBWriOCbKBx+rk8fxg5ZXL0na6xj2t8AJb
	S+1T60HhNP7xuLsHBBX5tyrTr9qO89s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779208229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Dg19OKPhl3qRoAAIvZLAQuJMzHpGtI4y+0rCMdtcAk=;
	b=JXdKDm2eEfAcEkMuuikvGlewBrLKo/IYlzCZN2IDuINuFXrv48yP4SEWWOpN6ixmRpkJnE
	W13mydwWhDAyrVAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEA46593A8;
	Tue, 19 May 2026 16:30:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jxCrNSSQDGonaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 16:30:28 +0000
Date: Tue, 19 May 2026 18:30:28 +0200
Message-ID: <87qzn7l5uj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Cen <rollkingzzc@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com
Subject: Re: [PATCH] ALSA: seq: Serialize UMP output teardown with event_input
In-Reply-To: <20260519150528.4193481-1-rollkingzzc@gmail.com>
References: <20260519150528.4193481-1-rollkingzzc@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 05D3C682DE
X-Spam-Level: 

On Tue, 19 May 2026 17:05:28 +0200,
Zhang Cen wrote:
> 
> seq_ump_process_event() borrows client->out_rfile.output without
> synchronizing with the first-open / last-close transition in
> seq_ump_client_open() and seq_ump_client_close().
> 
> The last output unuse can therefore drop opened[STR_OUT] to zero and
> release client->out_rfile while an in-flight event_input callback is
> still inside snd_rawmidi_kernel_write(). That leaves the rawmidi
> substream runtime exposed to teardown before the write path has taken
> its own buffer reference.
> 
> Add a small per-client output gate. event_input now claims the current
> output stream and counts in-flight writers before using it, while the
> last close clears the ready bit, waits for those writers to drain, and
> only then calls snd_rawmidi_kernel_release().
> 
> The buggy scenario involves two paths, with each column showing the
> order within that path:
> 
> path A label: event_input path         path B label: last unuse path
> 1. seq_ump_process_event() claims      1. seq_ump_client_close()
>    client->out_rfile.output and           drops opened[STR_OUT] to zero.
>    starts snd_rawmidi_kernel_write().  2. The close side withdraws the
> 2. The write still depends on the         output from new writers.
>    borrowed substream runtime.         3. It waits for the in-flight
> 3. The write drops its output claim       event_input writer to finish.
>    after the rawmidi write completes.  4. It releases client->out_rfile.
> 
> This keeps the output substream and runtime pinned for the whole
> event_input write.
> 
> KASAN report as below:
> KASAN slab-use-after-free in snd_rawmidi_kernel_write1()
> RIP: 0033:0x7f5528af837f
> Read of size 8
> Call trace:
>   dump_stack_lvl() (?:?)
>   print_report() (?:?)
>   srso_alias_return_thunk() (arch/x86/include/asm/nospec-branch.h:373)
>   __virt_addr_valid() (?:?)
>   kasan_complete_mode_report_info() (?:?)
>   kasan_report() (?:?)
>   snd_rawmidi_kernel_write1() (sound/core/rawmidi.c:1518)
>   __asan_load8() (?:?)
>   update_stack_state() (arch/x86/kernel/unwind_frame.c:196)
>   snd_rawmidi_kernel_write() (?:?)
>   seq_ump_process_event() (sound/core/seq/seq_ump_client.c:82)
>   __snd_seq_deliver_single_event() (?:?)
>   snd_seq_deliver_from_ump() (?:?)
>   lock_acquire() (?:?)
>   find_held_lock() (kernel/locking/lockdep.c:5340)
>   snd_seq_port_use_ptr() (sound/core/seq/seq_ports.c:44)
>   __kasan_check_write() (?:?)
>   do_raw_read_unlock() (kernel/locking/spinlock_debug.c:178)
>   _raw_read_unlock() (kernel/locking/spinlock.c:258)
>   snd_seq_deliver_single_event() (sound/core/seq/seq_clientmgr.c:71)
>   snd_seq_deliver_event() (sound/core/seq/seq_clientmgr.c:829)
>   snd_seq_client_enqueue_event() (sound/core/seq/seq_clientmgr.c:938)
>   snd_seq_write() (sound/core/seq/seq_clientmgr.c:1026)
>   apparmor_file_permission() (security/apparmor/lsm.c:546)
>   security_file_permission() (?:?)
>   vfs_write() (fs/read_write.c:666)
>   __fget_files() (fs/file.c:1065)
>   lock_release() (kernel/locking/lockdep.c:5875)
>   __rcu_read_unlock() (?:?)
>   ksys_write() (fs/read_write.c:727)
>   rcu_is_watching() (?:?)
>   __x64_sys_write() (?:?)
>   x64_sys_call() (arch/x86/entry/syscall_64.c:35)
>   do_syscall_64() (arch/x86/entry/syscall_64.c:87)
>   entry_SYSCALL_64_after_hwframe() (?:?)
> 
> Fixes: 81fd444aa371 ("ALSA: seq: Bind UMP device")
> Signed-off-by: Zhang Cen <rollkingzzc@gmail.com>

Thanks for the report and the patch.

Through a quick glance, I guess your analysis is right, but I also
wonder whether it could be simpler just wrap the whole
seq_ump_process_event() with lock.  (It could be spinlock, but rwlock
might be safer in this case as it might be called recursively.)
Then seq_ump_client_close() takes the (write) lock and reset
client->out_rfile.output to NULL, followed by the call of
snd_rawmidi_kernel_close() outside the lock.


Takashi


> ---
>  sound/core/seq/seq_ump_client.c | 69 ++++++++++++++++++++++++++++++---
>  1 file changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
> index 9079ccfdc8666..0f221beddb8da 100644
> --- a/sound/core/seq/seq_ump_client.c
> +++ b/sound/core/seq/seq_ump_client.c
> @@ -6,6 +6,7 @@
>  #include <linux/errno.h>
>  #include <linux/mutex.h>
>  #include <linux/string.h>
> +#include <linux/wait.h>
>  #include <linux/module.h>
>  #include <asm/byteorder.h>
>  #include <sound/core.h>
> @@ -38,6 +39,10 @@ struct seq_ump_client {
>  	int seq_client;			/* sequencer client id */
>  	int opened[2];			/* current opens for each direction */
>  	struct snd_rawmidi_file out_rfile; /* rawmidi for output */
> +	spinlock_t output_lock;		/* protects output lifetime state */
> +	wait_queue_head_t output_sleep; /* waits for in-flight writers */
> +	unsigned int output_pending;	/* active event_input writers */
> +	bool output_ready;		/* rawmidi output is available */
>  	struct seq_ump_input_buffer input; /* input parser context */
>  	void *ump_info[SNDRV_UMP_MAX_BLOCKS + 1]; /* shadow of seq client ump_info */
>  	struct work_struct group_notify_work; /* FB change notification */
> @@ -56,6 +61,50 @@ static unsigned char ump_group_to_seq_port(unsigned char group)
>  	return group + 1;
>  }
>  
> +static struct snd_rawmidi_substream *
> +seq_ump_claim_output(struct seq_ump_client *client)
> +{
> +	struct snd_rawmidi_substream *substream = NULL;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&client->output_lock, flags);
> +	if (client->output_ready) {
> +		substream = client->out_rfile.output;
> +		if (substream)
> +			client->output_pending++;
> +	}
> +	spin_unlock_irqrestore(&client->output_lock, flags);
> +	return substream;
> +}
> +
> +static void seq_ump_release_output(struct seq_ump_client *client)
> +{
> +	unsigned long flags;
> +	bool wake = false;
> +
> +	spin_lock_irqsave(&client->output_lock, flags);
> +	if (WARN_ON(!client->output_pending)) {
> +		spin_unlock_irqrestore(&client->output_lock, flags);
> +		return;
> +	}
> +	if (!--client->output_pending && !client->output_ready)
> +		wake = true;
> +	spin_unlock_irqrestore(&client->output_lock, flags);
> +	if (wake)
> +		wake_up(&client->output_sleep);
> +}
> +
> +static bool seq_ump_output_idle(struct seq_ump_client *client)
> +{
> +	unsigned long flags;
> +	bool idle;
> +
> +	spin_lock_irqsave(&client->output_lock, flags);
> +	idle = !client->output_pending;
> +	spin_unlock_irqrestore(&client->output_lock, flags);
> +	return idle;
> +}
> +
>  /* process the incoming rawmidi stream */
>  static void seq_ump_input_receive(struct snd_ump_endpoint *ump,
>  				  const u32 *val, int words)
> @@ -88,9 +137,6 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
>  	unsigned char type;
>  	int len;
>  
> -	substream = client->out_rfile.output;
> -	if (!substream)
> -		return -ENODEV;
>  	if (!snd_seq_ev_is_ump(ev))
>  		return 0; /* invalid event, skip */
>  	ump_ev = (struct snd_seq_ump_event *)ev;
> @@ -98,7 +144,11 @@ static int seq_ump_process_event(struct snd_seq_event *ev, int direct,
>  	len = ump_packet_words[type];
>  	if (len > 4)
>  		return 0; // invalid - skip
> +	substream = seq_ump_claim_output(client);
> +	if (!substream)
> +		return -ENODEV;
>  	snd_rawmidi_kernel_write(substream, ev->data.raw8.d, len << 2);
> +	seq_ump_release_output(client);
>  	return 0;
>  }
>  
> @@ -116,6 +166,8 @@ static int seq_ump_client_open(struct seq_ump_client *client, int dir)
>  					      &client->out_rfile);
>  		if (err < 0)
>  			return err;
> +		guard(spinlock_irq)(&client->output_lock);
> +		client->output_ready = true;
>  	}
>  	client->opened[dir]++;
>  	return 0;
> @@ -127,9 +179,12 @@ static int seq_ump_client_close(struct seq_ump_client *client, int dir)
>  	struct snd_ump_endpoint *ump = client->ump;
>  
>  	guard(mutex)(&ump->open_mutex);
> -	if (!--client->opened[dir])
> -		if (dir == STR_OUT)
> -			snd_rawmidi_kernel_release(&client->out_rfile);
> +	if (!--client->opened[dir] && dir == STR_OUT) {
> +		scoped_guard(spinlock_irq, &client->output_lock)
> +			client->output_ready = false;
> +		wait_event(client->output_sleep, seq_ump_output_idle(client));
> +		snd_rawmidi_kernel_release(&client->out_rfile);
> +	}
>  	return 0;
>  }
>  
> @@ -466,6 +521,8 @@ static int snd_seq_ump_probe(struct snd_seq_device *dev)
>  		return -ENOMEM;
>  
>  	INIT_WORK(&client->group_notify_work, handle_group_notify);
> +	spin_lock_init(&client->output_lock);
> +	init_waitqueue_head(&client->output_sleep);
>  	client->ump = ump;
>  
>  	client->seq_client =
> -- 
> 2.43.0
