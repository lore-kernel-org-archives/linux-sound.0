Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E0D3E9F7D
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778739; cv=none; b=XmQW49W8/ezjdesRLMLxvNffU8AllgXjUWOz+VCX2UdHlQd5texoIMqfrJuk/QTBOLIW5U3WX7/zDTOqna7jYnz3QtIyGr7hcXjACiAAEKrtJQFV96+0HI79oq4gJdI3v9/lHPixyOCuyZHibEJbDUAvULzMndbuzJ0pj2qvjyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778739; c=relaxed/simple;
	bh=2XuY77lDDEyCPeDobRU9CkJDJIftorN+wnK7CDnc6u0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NtTB/tRgmoDRGRQY76c3WlCfldv2YMPmpY3vuOtf6GNRfVx8sc1jH5ZPooKIshahA/z9+D7FoUxGg17YJpdZBd7KQqH9XTIC4VI0qkB+PMcTDL2vzRO689cU1+39xURYwUAoOd7I8FQmdm0mYf3ouQChZWv9GZIy12Fc8SsV7kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=syUWfzkZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2LbT3610; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iO98QlJL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qWCS0gv+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="syUWfzkZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2LbT3610";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iO98QlJL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qWCS0gv+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C2D4E6D13A;
	Thu, 18 Jun 2026 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781778736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSlo5ZWJVT8mCLaeE6aOn8hljJbUewTToW97iQUnid0=;
	b=syUWfzkZ8KfW0GDq3GKDHJZzrvLp9RrJEzQuVBYbcT/dm2aZn31A+mMQegfkwGb2Y7hHAc
	dRrXa/avCtDGS8C0f8z2TlDRpfUtDyE19dHML3uSqRmGk0mGupgv3N0k88quk6vTNK1IqA
	xOSa2+cJlqg02AtG7ntGqLIR1NIMyOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781778736;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSlo5ZWJVT8mCLaeE6aOn8hljJbUewTToW97iQUnid0=;
	b=2LbT3610vd3hfM21TXuT+xTK+1IQzWdzx1YLv3kbpI7iujZlNPZfrm0teADfWr+kr/9T/T
	34WrI+vuPogSMbAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iO98QlJL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qWCS0gv+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781778734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSlo5ZWJVT8mCLaeE6aOn8hljJbUewTToW97iQUnid0=;
	b=iO98QlJLo9FYNDYTdHJORo+eJcI+R71JedB8aagPjHS9hMVpweDGKjXp19wqnEXqKRJhxv
	fwFeKSWn+PdFnsudxBNS3vkCJaCf26mGCKZ/XBWt5B2ajWgnfq9H/RaduatQjksdSwoUDB
	DvLJvWWqFBlF70RdpSNZcqBrrt4hhtc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781778734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JSlo5ZWJVT8mCLaeE6aOn8hljJbUewTToW97iQUnid0=;
	b=qWCS0gv+XQihr1JHGmxUF/8J0c/Agvg9TCjj5vp65ViDSIWQmLN5nB8G5udJI9vrRKrMlI
	41VNpFUnMdelcxCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C3FC779A8;
	Thu, 18 Jun 2026 10:32:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tE4AIS7JM2r4LAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 10:32:14 +0000
Date: Thu, 18 Jun 2026 12:32:14 +0200
Message-ID: <87h5n0nnpt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH] ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints
In-Reply-To: <20260618100227.3289790-1-zzzccc427@gmail.com>
References: <20260618100227.3289790-1-zzzccc427@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C2D4E6D13A
X-Spam-Score: -3.51

On Thu, 18 Jun 2026 12:02:27 +0200,
Cen Zhang wrote:
> 
> MIDI 2.0 input URBs are started during snd_usb_midi_v2_create().
> A later setup failure can still jump to snd_usb_midi_v2_free(), which
> currently frees each endpoint and its coherent URB buffers without first
> stopping the submitted URBs. A completion can then dereference the
> embedded URB context and endpoint state after they have been freed, or
> try to resubmit from the stale endpoint.
> 
> The buggy scenario involves two paths, with each column showing the
> order within that path:
> 
> probe error path:                         USB completion path:
> 1. start_input_streams() submits          1. The HCD still owns a
>    input URBs.                               submitted input URB.
> 2. A later setup helper returns           2. input_urb_complete() runs
>    an error.                                 with urb->context in ep.
> 3. snd_usb_midi_v2_free() frees           3. The completion reads ep
>    endpoint storage and URB buffers.         state and can requeue URBs.
> 
> Make the endpoint destructor follow the same teardown ordering used for
> disconnect: publish ep->disconnected, kill the URBs synchronously, and
> drain the endpoint before freeing URB buffers and endpoint storage.
> 
> Validation reproduced this kernel report:
> BUG: KASAN: slab-use-after-free in input_urb_complete+0x37/0x1b0
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:_raw_spin_unlock_irq+0x2e/0x50
> Read of size 8
> Call trace:
>   dump_stack_lvl+0x77/0xb0
>   print_report+0xce/0x5f0
>   input_urb_complete+0x37/0x1b0 (sound/usb/midi2.c:186)
>   srso_alias_return_thunk+0x5/0xfbef5
>   __virt_addr_valid+0x19f/0x330
>   kasan_report+0xe0/0x110
>   __usb_hcd_giveback_urb+0x112/0x1d0
>   dummy_timer+0xaaa/0x19a0
>   lock_is_held_type+0x9a/0x110
>   __lock_acquire+0x467/0x28b0
>   mark_held_locks+0x40/0x70
>   _raw_spin_unlock_irqrestore+0x44/0x60
>   lockdep_hardirqs_on_prepare+0xbb/0x1a0
>   __hrtimer_run_queues+0x101/0x520
>   hrtimer_run_softirq+0xd0/0x130
>   handle_softirqs+0x15b/0x670
>   __irq_exit_rcu+0xd0/0x170
>   irq_exit_rcu+0xe/0x20
>   sysvec_apic_timer_interrupt+0x6c/0x80
>   asm_sysvec_apic_timer_interrupt+0x1a/0x20
> 
> Fixes: d9c99876868c ("ALSA: usb-audio: Create UMP blocks from USB MIDI GTBs")
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
>  sound/usb/midi2.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
> index 04aeb9052f13..94c1a52853e0 100644
> --- a/sound/usb/midi2.c
> +++ b/sound/usb/midi2.c
> @@ -470,6 +470,9 @@ static int create_midi2_endpoint(struct snd_usb_midi2_interface *umidi,
>  static void free_midi2_endpoint(struct snd_usb_midi2_endpoint *ep)
>  {
>  	list_del(&ep->list);
> +	ep->disconnected = 1;
> +	kill_midi_urbs(ep, false);
> +	drain_urb_queue(ep);
>  	free_midi_urbs(ep);
>  	kfree(ep);
>  }

Thanks for the patch.  This can be good as a quick paper-over, so that
it can be easily backported.  But the proper fix would be rather to
call the core part of __usb_audio_disconnect() at the error path
(something like below -- based on the latest tree).

That said, I can take your patch as a quick fix, but could you correct
the patch for avoiding the doubly disconnection procedure?  The code
should have a check of ep->disconnected, such as:

static void free_midi2_endpoint(struct snd_usb_midi2_endpoint *ep)
{
	list_del(&ep->list);
	if (!ep->disconnected) {
		ep->disconnected = 1;
		kill_midi_urbs(ep, false);
		drain_urb_queue(ep);
	}
 	free_midi_urbs(ep);
 	kfree(ep);
}


Takashi

-- 8< --
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -905,6 +905,41 @@ static int try_to_register_card(struct snd_usb_audio *chip, int ifnum)
 	return 0;
 }
 
+/* disconnect / release various resources assigned to the chip */
+static void usb_audio_disconnect_components(struct snd_usb_audio *chip)
+{
+	struct list_head *p;
+	struct snd_usb_stream *as;
+	struct snd_usb_endpoint *ep;
+	struct usb_mixer_interface *mixer;
+
+	/* release the pcm resources */
+	list_for_each_entry(as, &chip->pcm_list, list)
+		snd_usb_stream_disconnect(as);
+
+	/* release the endpoint resources */
+	list_for_each_entry(ep, &chip->ep_list, list)
+		snd_usb_endpoint_release(ep);
+
+	/* release the midi resources */
+	list_for_each(p, &chip->midi_list)
+		snd_usbmidi_disconnect(p);
+
+	snd_usb_midi_v2_disconnect_all(chip);
+
+	/*
+	 * Nice to check quirk && quirk->shares_media_device and
+	 * then call the snd_media_device_delete(). Don't have
+	 * access to the quirk here. snd_media_device_delete()
+	 * accesses mixer_list
+	 */
+	snd_media_device_delete(chip);
+
+	/* release mixer resources */
+	list_for_each_entry(mixer, &chip->mixer_list, list)
+		snd_usb_mixer_disconnect(mixer);
+}
+
 /*
  * probe the active usb device
  *
@@ -1077,8 +1112,10 @@ static int usb_audio_probe(struct usb_interface *intf,
 		 * decrement before memory is possibly returned.
 		 */
 		atomic_dec(&chip->active);
-		if (!chip->num_interfaces)
+		if (!chip->num_interfaces) {
+			usb_audio_disconnect_components(chip);
 			snd_card_free(chip->card);
+		}
 	}
 	return err;
 }
@@ -1091,48 +1128,19 @@ static bool __usb_audio_disconnect(struct usb_interface *intf,
 				   struct snd_usb_audio *chip,
 				   struct snd_card *card)
 {
-	struct list_head *p;
-
 	guard(mutex)(&register_mutex);
 
 	if (platform_ops && platform_ops->disconnect_cb)
 		platform_ops->disconnect_cb(chip);
 
 	if (atomic_inc_return(&chip->shutdown) == 1) {
-		struct snd_usb_stream *as;
-		struct snd_usb_endpoint *ep;
-		struct usb_mixer_interface *mixer;
-
 		/* wait until all pending tasks done;
 		 * they are protected by snd_usb_lock_shutdown()
 		 */
 		snd_refcount_sync(&chip->usage_count);
 		snd_card_disconnect(card);
-		/* release the pcm resources */
-		list_for_each_entry(as, &chip->pcm_list, list) {
-			snd_usb_stream_disconnect(as);
-		}
-		/* release the endpoint resources */
-		list_for_each_entry(ep, &chip->ep_list, list) {
-			snd_usb_endpoint_release(ep);
-		}
-		/* release the midi resources */
-		list_for_each(p, &chip->midi_list) {
-			snd_usbmidi_disconnect(p);
-		}
-		snd_usb_midi_v2_disconnect_all(chip);
-		/*
-		 * Nice to check quirk && quirk->shares_media_device and
-		 * then call the snd_media_device_delete(). Don't have
-		 * access to the quirk here. snd_media_device_delete()
-		 * accesses mixer_list
-		 */
-		snd_media_device_delete(chip);
 
-		/* release mixer resources */
-		list_for_each_entry(mixer, &chip->mixer_list, list) {
-			snd_usb_mixer_disconnect(mixer);
-		}
+		usb_audio_disconnect_components(chip);
 	}
 
 	if (chip->quirk_flags & QUIRK_FLAG_DISABLE_AUTOSUSPEND)
