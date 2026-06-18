Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5894F33DEF9
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 15:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781797501; cv=none; b=DbXacCCqfNnYZEaIQK1WjtirIDKq6Ne9hq/dTgbbFo2Dm9oIpcmFOmCj3iLUss4bHBr6gI/BhF74QI+6cuqHreSSFT6jfbh5YKfdNfGwuAbvJRi6ZKaMjl3bRuEvIyMGWT1fzKbgwBJhppMvseN3D7gc/x4WcESaSsMShhM/tXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781797501; c=relaxed/simple;
	bh=OjEY/3bNIwfWPQ07DfCQPPTBHCaw3Q7Z5zKm3UsVWoo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OjwokUfeeupPUuEp6wwjJYl2meq5O9BmG+mSaamcHXdqnkCX8irBSAgTtZAb4w6Qxd2b7gs7++4RzInjhTooh4SBObC6H3MH+vmSOxM/XPRHgNCvz7dXxg/zasMzNSNtFlwk13Z+yn6gRIjMPPj1wkOjtwT5QwFAiVWgHUkidTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TrcN+dVU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NOGctrol; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TrcN+dVU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NOGctrol; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TrcN+dVU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NOGctrol";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TrcN+dVU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NOGctrol"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 95B2C6D2DE;
	Thu, 18 Jun 2026 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781797498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UoaQKErBBigBky1n2t07CN2fpe+jzbUogIwnBZUYrnE=;
	b=TrcN+dVUCWNpq3Lpk22ta7IBQIhHhZ0FP8Ul8tUL5TQmB375LxRafeCzj+EgoIK6jwugd2
	0GxcZBQ0XaIlzMI4NVapZwjtNj5qpTJDlZ/Vqz6h1/IWsW6TxQVuJJLJLq7R29Qz0Ee0k2
	mi/pYHEV8+7NVXZLiVrhD+TBBr4M6bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781797498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UoaQKErBBigBky1n2t07CN2fpe+jzbUogIwnBZUYrnE=;
	b=NOGctrol03PtJr4ZnfSoOzIOsmokvWfu/PGsuZLFJVZV2oy/vPAhZQVaQGEK6z0HXW/Plj
	jGmdkRfbb+3MJ+BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781797498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UoaQKErBBigBky1n2t07CN2fpe+jzbUogIwnBZUYrnE=;
	b=TrcN+dVUCWNpq3Lpk22ta7IBQIhHhZ0FP8Ul8tUL5TQmB375LxRafeCzj+EgoIK6jwugd2
	0GxcZBQ0XaIlzMI4NVapZwjtNj5qpTJDlZ/Vqz6h1/IWsW6TxQVuJJLJLq7R29Qz0Ee0k2
	mi/pYHEV8+7NVXZLiVrhD+TBBr4M6bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781797498;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UoaQKErBBigBky1n2t07CN2fpe+jzbUogIwnBZUYrnE=;
	b=NOGctrol03PtJr4ZnfSoOzIOsmokvWfu/PGsuZLFJVZV2oy/vPAhZQVaQGEK6z0HXW/Plj
	jGmdkRfbb+3MJ+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63335779A8;
	Thu, 18 Jun 2026 15:44:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2HKTFnoSNGo0aAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 18 Jun 2026 15:44:58 +0000
Date: Thu, 18 Jun 2026 17:44:58 +0200
Message-ID: <87fr2jkg3p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v2] ALSA: usb-audio: Disconnect components on probe errors
In-Reply-To: <20260618122209.3655881-1-zzzccc427@gmail.com>
References: <20260618122209.3655881-1-zzzccc427@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, 18 Jun 2026 14:22:09 +0200,
Cen Zhang wrote:
> 
> MIDI 2.0 input URBs can be submitted before usb_audio_probe() has
> finished building and registering the card.  If a later setup step fails,
> cleanup can reach the card or MIDI 2.0 endpoint free path while those URBs
> are still owned by the USB core.  The normal disconnect path avoids this by
> publishing the disconnected state and killing/draining URBs before endpoint
> storage and coherent transfer buffers are released.
> 
> The buggy scenario involves two paths. Each column shows path order:
> 
> probe error path:                         USB completion path:
> 1. start_input_streams() submits          1. The HCD still owns a
>    input URBs.                               submitted input URB.
> 2. A later setup helper returns           2. input_urb_complete() runs
>    an error.                                 with urb->context in ep.
> 3. Cleanup frees endpoint storage         3. The completion reads ep
>    and URB buffers.                          state and can requeue URBs.
> 
> Factor the component release sequence out of __usb_audio_disconnect() and
> call it when usb_audio_probe() is about to free a card that never claimed
> an interface.  The helper preserves the existing disconnect release order,
> including snd_usb_midi_v2_disconnect_all().
> 
> Also make the MIDI 2.0 endpoint destructor perform the local disconnect,
> kill and drain sequence only when the endpoint has not already been
> disconnected, so the internal MIDI 2.0 create-error cleanup is synchronized
> without repeating the stop sequence after normal disconnect.
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
> v2:
> Factor USB-audio component disconnect into the probe error path and guard
> MIDI 2.0 endpoint kill/drain with ep->disconnected, per maintainer feedback.

Please split this to two patches.  One is a quick fix for
free_midi2_endpoint() based on your original one, and another is
usb_audio_disconnect_components() I suggested -- those are basically
two distinct fixes.  And, the latter one isn't tied with the MIDI2
issue, rather a generic hardening, and I'm going to apply the second
one after 7.2 merge window, while taking the first one for 7.2-rc1.


thanks,

Takashi
