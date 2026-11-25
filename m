Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613273;
	b=HouZmuISQ2Z7anTpoPEAXDkSjFpJfB4jah99gJSVZzd29VwwayOfQeH9vE3IMdqUbC46
	 QA57xLcdw1/iqK1jOKYRElMgjTWY5a7z3vjQShUu/EGCyNas7m2uYogHnvM7GFVsaJXd7
	 x9c0GvS4gqMoc75Ue8z52PNJO9r6bUdsW0wRKgHNL7t4l20JqurhYsK4e66coRZb50UkF
	 tK4rqm76uwo3WlWDvilRE6VZYd2394nNhMPGjQaqcMpNY40fimBQcW2iyVBz12fMP6kez
	 Fn3PGPexOnZ6+eIQFo8Q0DF/Bc4umTRLFTG7lOS1RONDzJr78LFWrAqCbMD9ljgbfJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613273;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=M/OgP0GRLzZw0qFPrbR0pcGkj4nQgsglbswkaxD0k+Q=;
	b=HFmWDxuGb7y0AlSBFcFalrIm/ihzwbms1HUpvkfUXiZJHRR4KRwmGkt0i1TNizOdBbbK
	 ZyZ4n0wBqrL5CHDLuxNJMBaH/MD1kQ7NjD1NZB/YZba14bmwcYd/8e9WyzZFkn+10z0td
	 nI/FQrYa45bxiHGY0AnVF/8L11zJCle9O+7s9DG/9otBDZyFmNn4bHNMtYSbnb7Nj2Vhv
	 6W1NLq4ekL+UQvjK70In2IvGLih9EqIOQ1srVacdRygxRcYUQA0iLZrrmXXIx0r8wy94t
	 a1eS++HS7dHLi8VKn5F96/nINaLBsYTnVqnSpdvoYzznAYbmkrU6eFF66P/iaHhbKeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="kM5iJ/lF";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b5u9Esyr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="PyD2/VWO";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eAydGE0b;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901E9606A330;
	Wed, 25 Nov 2026 13:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 901E9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kM5iJ/lF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=b5u9Esyr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PyD2/VWO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eAydGE0b
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5358A1F82F;
	Wed, 25 Nov 2026 13:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795613270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/OgP0GRLzZw0qFPrbR0pcGkj4nQgsglbswkaxD0k+Q=;
	b=kM5iJ/lF2vxHexZACN1Xq0MrF5OmFvlKV488eQQo4Ypp0VjOL0HCFN2VnVVqrWAOn4vIQ9
	xiZvdPBe3A1cBCelhRpaasYnD9Nv1h45myT6BLL9i2w0f8TL+2Hf4ASsGMwXGujjOZ3oZv
	vHXtmTy+kkrCsE53dPwilTLKMXJUHPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795613270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/OgP0GRLzZw0qFPrbR0pcGkj4nQgsglbswkaxD0k+Q=;
	b=b5u9EsyrUKMabZRLScXT3N74RJFb9mcqkgw1UCpoKIy6jdc1X0nK3+8EELvpNP7YjwtV/o
	NXYCgPtuvXCTjUAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="PyD2/VWO";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eAydGE0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795613269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/OgP0GRLzZw0qFPrbR0pcGkj4nQgsglbswkaxD0k+Q=;
	b=PyD2/VWOh86ABAyM96fKdL08ZGVWQz/a2yi/qqZ25wuJirlNkRBt10o4XfVRbD3PUr8ksS
	yAkR1hCVYFaV/AZQLfSLYL38EmQLDKRzkWJXEG0hj4vg0WHgy1fXMUEyczs/Bk0QB4Ie9Y
	qAu7YKgaL8Hty5Htc1hL3F39aUG/xz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795613269;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/OgP0GRLzZw0qFPrbR0pcGkj4nQgsglbswkaxD0k+Q=;
	b=eAydGE0bjTgWvA9NMFR7sxGrPqAHEkomGTKoONeJH/gYNE24HgW+ZM1rmZa6MPMs0dVAQN
	09ICPRVjRmOTsjAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 030D51339F;
	Wed, 25 Nov 2026 13:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H8Y7MlTiBmvgJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:27:48 +0000
Date: Wed, 25 Nov 2026 14:27:48 +0100
Message-ID: <8733sp82i3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: ALSA: pcm: link-group walk in timer callback can use a closed substream's freed runtime (UAF)
In-Reply-To: <49f1dede.596.1a212c69040.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<7117f13e.2631e.1a1d4d54236.Coremail.xuhx@hust.edu.cn>
	<49f1dede.596.1a212c69040.Coremail.xuhx@hust.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 5358A1F82F

On Wed, 25 Nov 2026 13:55:32 +0100,
徐晗翔 wrote:
> 
> snd_pcm_group_for_each_entry() is a plain list_for_each_entry() over
> substream->group->substreams.  A driver timer callback (asihpi's
> snd_card_asihpi_timer_function()) walked that list from softirq with
> no group reference and no link rwsem, while the close of another
> linked substream could unlink the members, reassign the survivors
> and kfree() the group object -- the callback kept dereferencing a
> stale s/runtime pointer and freed group memory (KASAN UAF).
> 
> Core: free the group object only after an RCU grace period (new
> rcu_head in struct snd_pcm_group, kfree_rcu() at both free sites),
> so a group pointer read without the link rwsem stays memory-safe
> while a concurrent unlink tears the group down.
> 
> Driver: walk the group one member at a time under the group lock
> with rcu_read_lock() held -- the lock makes membership (and each
> member's runtime) stable while the member is processed, and RCU
> keeps the group object alive.  snd_pcm_stop_xrun()/
> snd_pcm_period_elapsed() are deferred out of the locked section:
> they enter snd_pcm_action(), which re-takes the group lock.  A
> substream object outlives its fd's close and both helpers recheck
> substream->runtime under the stream lock, so the deferred calls are
> safe against a concurrent close of the member.

I don't think we want to add a RCU there.  It can open a can of worms.

IMO, an easier and safer fix would be to keep the ASIHPI's timer
callback alive only during the PCM stream running, i.e. assure to kill
the timer callback at PCM stop and sync_stop.  During the PCM running
state, PCM links can't be changed, hence the list is safe to traverse.


thanks,

Takashi

> ---
>  sound/core/pcm_native.c   | 12 ++++++++++--
>  include/sound/pcm.h       |  6 ++++++
>  sound/pci/asihpi/asihpi.c | 144 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------
>  3 files changed, 145 insertions(+), 17 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -1368,7 +1368,11 @@
>  	do_free = refcount_dec_and_test(&group->refs);
>  	snd_pcm_group_unlock(group, substream->pcm->nonatomic);
>  	if (do_free)
> -		kfree(group);
> +		/* free only after an RCU grace period: a driver timer
> +		 * callback (softirq context) may hold group->lock under
> +		 * rcu_read_lock() without the link rwsem and must not
> +		 * touch freed group memory */
> +		kfree_rcu(group, rcu_head);
>  }
>  
>  /*
> @@ -2401,7 +2405,11 @@
>  
>  	snd_pcm_group_unlock_irq(group, nonatomic);
>  	if (do_free)
> -		kfree(group);
> +		/* free only after an RCU grace period: a driver timer
> +		 * callback (softirq context) may hold group->lock under
> +		 * rcu_read_lock() without the link rwsem and must not
> +		 * touch freed group memory */
> +		kfree_rcu(group, rcu_head);
>  	return 0;
>  }
>  
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -16,6 +16,7 @@
>  #include <linux/bitops.h>
>  #include <linux/pm_qos.h>
>  #include <linux/refcount.h>
> +#include <linux/rcupdate.h>
>  #include <linux/uio.h>
>  
>  #define snd_pcm_substream_chip(substream) ((substream)->private_data)
> @@ -455,6 +456,11 @@
>  	struct mutex mutex;
>  	struct list_head substreams;
>  	refcount_t refs;
> +	/* a group object is freed only after an RCU grace period, so a
> +	 * lockless/atomic group walker (e.g. a driver timer callback that
> +	 * takes group->lock under rcu_read_lock()) cannot touch freed
> +	 * group memory while a concurrent unlink tears the group down */
> +	struct rcu_head rcu_head;
>  };
>  
>  struct pid;
> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -136,6 +136,8 @@
>  	unsigned int pcm_buf_dma_ofs;	/* DMA R/W offset in buffer */
>  	unsigned int pcm_buf_elapsed_dma_ofs;	/* DMA R/W offset in buffer */
>  	unsigned int drained_count;
> +	bool timer_walked;		/* one-shot mark for the timer
> +					 * callback's group walk */
>  	struct snd_pcm_substream *substream;
>  	u32 h_stream;
>  	struct hpi_format format;
> @@ -705,6 +707,31 @@
>  	return result;
>  }
>  
> +/* Pick the next group member this timer callback has not processed yet.
> + * Must be called with the group lock held and under rcu_read_lock(): the
> + * group list cannot change under us, so every member's runtime is still
> + * alive. */
> +static struct snd_pcm_substream *
> +asihpi_timer_next_member(struct snd_pcm_substream *substream,
> +			 struct snd_card_asihpi *card)
> +{
> +	struct snd_pcm_substream *s;
> +
> +	snd_pcm_group_for_each_entry(s, substream) {
> +		struct snd_card_asihpi_pcm *ds = s->runtime->private_data;
> +
> +		if (snd_pcm_substream_chip(s) != card)
> +			continue;
> +		/* don't link Cap and Play */
> +		if (substream->stream != s->stream)
> +			continue;
> +		if (ds->timer_walked)
> +			continue;
> +		return s;
> +	}
> +	return NULL;
> +}
> +
>  /** Timer function, equivalent to interrupt service routine for cards
>  */
>  static void snd_card_asihpi_timer_function(struct timer_list *t)
> @@ -713,10 +740,12 @@
>  	struct snd_pcm_substream *substream = dpcm->substream;
>  	struct snd_card_asihpi *card = snd_pcm_substream_chip(substream);
>  	struct snd_pcm_runtime *runtime;
> +	struct snd_pcm_group *group;
>  	struct snd_pcm_substream *s;
>  	unsigned int newdata = 0;
>  	unsigned int pcm_buf_dma_ofs, min_buf_pos = 0;
>  	unsigned int remdata, xfercount, next_jiffies;
> +	unsigned long flags;
>  	int first = 1;
>  	u16 state;
>  	u32 buffer_size, bytes_avail, samples_played, on_card_bytes;
> @@ -725,17 +754,58 @@
>  
>  	snd_pcm_debug_name(substream, name, sizeof(name));
>  
> -	/* find minimum newdata and buffer pos in group */
> +	/*
> +	 * Walk the PCM link group one member at a time, under the group
> +	 * lock and an RCU read lock.  This callback runs from a timer
> +	 * (softirq) with no group reference and no link rwsem, so a close
> +	 * of another linked substream could previously unlink the members,
> +	 * free the group object and free that member's runtime while this
> +	 * walk was holding a stale s/runtime pointer.
> +	 *
> +	 * The group lock keeps the membership (and each member's runtime)
> +	 * stable while the member is processed; the RCU read lock keeps
> +	 * the group object itself alive (snd_pcm_unlink() frees it only
> +	 * after a grace period).  snd_pcm_stop_xrun() and
> +	 * snd_pcm_period_elapsed() must run WITHOUT the group lock -- they
> +	 * enter snd_pcm_action(), which re-takes the group lock -- so they
> +	 * are deferred to after the unlocked section.  A substream object
> +	 * outlives the close of its fd, and both helpers recheck
> +	 * substream->runtime under the stream lock.
> +	 */
> +
> +	/* clear the one-shot walk marks of the previous invocation */
> +	rcu_read_lock();
> +	group = READ_ONCE(substream->group);	/* kept alive by RCU */
> +	spin_lock_irqsave(&group->lock, flags);
>  	snd_pcm_group_for_each_entry(s, substream) {
> -		struct snd_card_asihpi_pcm *ds = s->runtime->private_data;
> -		runtime = s->runtime;
> +		if (snd_pcm_substream_chip(s) == card) {
> +			struct snd_card_asihpi_pcm *ds =
> +				s->runtime->private_data;
>  
> -		if (snd_pcm_substream_chip(s) != card)
> -			continue;
> +			ds->timer_walked = false;
> +		}
> +	}
> +	spin_unlock_irqrestore(&group->lock, flags);
> +	rcu_read_unlock();
>  
> -		/* don't link Cap and Play */
> -		if (substream->stream != s->stream)
> -			continue;
> +	/* find minimum newdata and buffer pos in group */
> +	for (;;) {
> +		struct snd_card_asihpi_pcm *ds;
> +		struct snd_pcm_substream *xrun = NULL;
> +
> +		rcu_read_lock();
> +		group = READ_ONCE(substream->group);	/* kept alive by RCU */
> +		spin_lock_irqsave(&group->lock, flags);
> +
> +		s = asihpi_timer_next_member(substream, card);
> +		if (!s) {
> +			spin_unlock_irqrestore(&group->lock, flags);
> +			rcu_read_unlock();
> +			break;
> +		}
> +		ds = s->runtime->private_data;
> +		runtime = s->runtime;
> +		ds->timer_walked = true;
>  
>  		hpi_handle_error(hpi_stream_get_info_ex(
>  					ds->h_stream, &state,
> @@ -762,8 +832,9 @@
>  					"P%d drained\n", s->number);
>  				ds->drained_count++;
>  				if (ds->drained_count > 20) {
> -					snd_pcm_stop_xrun(s);
> -					continue;
> +					/* defer to after the unlock */
> +					xrun = s;
> +					goto member_done;
>  				}
>  			} else {
>  				ds->drained_count = 0;
> @@ -799,6 +870,13 @@
>  			(unsigned long)frames_to_bytes(runtime,
>  						runtime->control->appl_ptr)
>  		);
> +
> +member_done:
> +		spin_unlock_irqrestore(&group->lock, flags);
> +		rcu_read_unlock();
> +
> +		if (xrun)
> +			snd_pcm_stop_xrun(xrun);
>  	}
>  	pcm_buf_dma_ofs = min_buf_pos;
>  
> @@ -818,12 +896,41 @@
>  	asihpi_dbg("timer2, jif=%d, buf_pos=%d, newdata=%d, xfer=%d\n",
>  			next_jiffies, pcm_buf_dma_ofs, newdata, xfercount);
>  
> +	/* clear the one-shot walk marks again for the second pass */
> +	rcu_read_lock();
> +	group = READ_ONCE(substream->group);	/* kept alive by RCU */
> +	spin_lock_irqsave(&group->lock, flags);
>  	snd_pcm_group_for_each_entry(s, substream) {
> -		struct snd_card_asihpi_pcm *ds = s->runtime->private_data;
> +		if (snd_pcm_substream_chip(s) == card) {
> +			struct snd_card_asihpi_pcm *ds =
> +				s->runtime->private_data;
>  
> -		/* don't link Cap and Play */
> -		if (substream->stream != s->stream)
> -			continue;
> +			ds->timer_walked = false;
> +		}
> +	}
> +	spin_unlock_irqrestore(&group->lock, flags);
> +	rcu_read_unlock();
> +
> +	/* second pass, again one member at a time under the group lock
> +	 * (see above); snd_pcm_period_elapsed() is deferred to after the
> +	 * unlock for the same reason as snd_pcm_stop_xrun() */
> +	for (;;) {
> +		struct snd_card_asihpi_pcm *ds;
> +		struct snd_pcm_substream *elapsed = NULL;
> +
> +		rcu_read_lock();
> +		group = READ_ONCE(substream->group);	/* kept alive by RCU */
> +		spin_lock_irqsave(&group->lock, flags);
> +
> +		s = asihpi_timer_next_member(substream, card);
> +		if (!s) {
> +			spin_unlock_irqrestore(&group->lock, flags);
> +			rcu_read_unlock();
> +			break;
> +		}
> +		ds = s->runtime->private_data;
> +		runtime = s->runtime;
> +		ds->timer_walked = true;
>  
>  		/* Store dma offset for use by pointer callback */
>  		ds->pcm_buf_dma_ofs = pcm_buf_dma_ofs;
> @@ -887,8 +994,15 @@
>  			/* ? host_rw_ofs always ahead of elapsed_dma_ofs by preload size? */
>  			ds->pcm_buf_host_rw_ofs += xfercount;
>  			ds->pcm_buf_elapsed_dma_ofs += xfercount;
> -			snd_pcm_period_elapsed(s);
> +			/* defer to after the unlock */
> +			elapsed = s;
>  		}
> +
> +		spin_unlock_irqrestore(&group->lock, flags);
> +		rcu_read_unlock();
> +
> +		if (elapsed)
> +			snd_pcm_period_elapsed(elapsed);
>  	}
>  
>  	if (!card->hpi->interrupt_mode && dpcm->respawn_timer)
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-13 20:15:08 (星期五)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: ALSA: pcm: link-group walk in timer callback can use a closed substream's freed runtime (UAF)
> > 
> > `snd_card_asihpi_timer_function()` walks the PCM link group with
> > `snd_pcm_group_for_each_entry()` and dereferences each member's
> > `s->runtime->private_data`.  That macro is a plain `list_for_each_entry()`;
> > the callback holds no group reference and no group lock.  Close of another
> > linked substream can unlink/free the group and detach/free that substream's
> > runtime and `dpcm`, leaving the timer callback with a stale `s`/runtime
> > pointer.  This is reachable from user space through
> > `SNDRV_PCM_IOCTL_LINK` plus close, on hardware whose driver supports PCM
> > linking (asihpi does).
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Linux 7.3.0 source plus a QEMU/KASAN fake-PCM harness.  No ASI6205 hardware
> >   was available; the harness reproduces the core group traversal and close
> >   ordering, with the asihpi callback's exact
> >   `snd_pcm_group_for_each_entry()` pattern.
> > 
> > * Mechanism
> > 
> >   The group loops are at `sound/pci/asihpi/asihpi.c:729-735` and `821-827`.
> >   They read `s->runtime->private_data` (and in one path `dma_area`) and call
> >   `snd_pcm_period_elapsed(s)`.  The macro is
> >   `include/sound/pcm.h:694`:
> > 
> >     #define snd_pcm_group_for_each_entry(s, substream) \
> >         list_for_each_entry(s, &substream->group->substreams, link_list)
> > 
> >   `snd_pcm_stream_lock_irq()` (`sound/core/pcm_native.c:140-144`) locks
> >   `substream->self_group`, not the group that the timer callback walks.
> >   `snd_pcm_unlink()` (`pcm_native.c:2370-2402`) takes
> >   `snd_pcm_link_rwsem` and the group lock, removes the closing substream,
> >   relinks the remaining streams, and may `kfree(group)`.
> >   `snd_pcm_release_substream()` (`pcm_native.c:2785-2805`) calls
> >   `pcm_release_private()` -> `snd_pcm_unlink()` at 2779-2783 before
> >   `snd_pcm_detach_substream()` frees the runtime and `dpcm`.
> > 
> >   A timer callback that already loaded member `s` or `s->runtime` can run
> >   after B's unlink/detach.  It may then read freed `runtime`, freed
> >   `private_data`, or a freed group list node; `snd_pcm_period_elapsed(s)`
> >   additionally takes the stale substream.
> > 
> > * Why existing synchronization does not close the window
> > 
> >   `snd_pcm_stop()` does transiently take a group reference through
> >   `snd_pcm_action()` -> `snd_pcm_stream_group_ref()` (`pcm_native.c:1378-1427`)
> >   and group lock, but it drops the reference after the STOP action.  The
> >   asihpi timer callback is not part of that action and holds no group
> >   reference.  Taking `snd_pcm_stream_lock_irq(A)` in the callback would only
> >   lock A's `self_group`; it would not pin B or the group.  The group can be
> >   freed while the callback holds a raw member pointer.
> > 
> > * Trigger model
> > 
> >   Two capture substreams A and B, same PCM and runtime state; user does
> >   `SNDRV_PCM_IOCTL_LINK` then starts A.  While A's timer callback is walking
> >   the group, user closes B.  `SNDRV_PCM_IOCTL_LINK` is available to a local
> >   user with the PCM device open; no special privilege is needed beyond access
> >   to the PCM.  Consequence: UAF in timer context, crash or memory corruption.
> > 
> > 
> > * How to run the PoC
> > 
> >   The harness is self-contained and does not need ASI6205 hardware: it creates
> >   a fake ALSA card with two capture substreams.  The tested configuration was
> >   7.3.0 with KASAN and 4 vCPU; a uniprocessor run may not overlap.
> > 
> >   Build against the target kernel build tree:
> > 
> >     printf 'obj-m := sndpci_race.o\n' > Kbuild
> >     make -C <kernel-build-dir> M=$PWD modules
> >     gcc -static -O2 -I<kernel-source>/include/uapi -o pcmtest pcmtest.c
> > 
> >   Put `sndpci_race.ko` and `pcmtest` into the guest initramfs/rootfs, boot the
> >   target kernel (QEMU/KVM recommended), then run as root:
> > 
> >     insmod sndpci_race.ko mode=pcm
> >     ./pcmtest link 200
> >     dmesg | grep -E 'BUG: KASAN|race_pcm_timer|victim use'
> > 
> >   In the minimal guest the fake card enumerates as card 0 and `pcmtest` opens
> >   `/dev/snd/pcmC0D0c`.  If the test machine already has another sound card,
> >   adjust `DEV` in `pcmtest.c` or use the QEMU initramfs.  Expected result:
> >   32 KASAN reports with `slab-use-after-free in race_pcm_timer` and about 114
> >   `victim use` lines.  
> > 
> > 
> > * Suggested direction 
> > 
> >   This needs a core/lifetime fix, not just an asihpi timer fix.  Possible
> >   directions: make group traversal safe against concurrent unlink (group
> >   reference or RCU-protected/atomic-safe iterator that pins each member's
> >   runtime), or provide a driver API that snapshots/refcounts members before
> >   the callback walks them.  On the asihpi side, quiesce the timer/IRQ before
> >   allowing the linked substream to detach.  Adding only
> >   `snd_pcm_stream_lock_irq(A)` is not sufficient because it locks A's
> >   `self_group`, not the group being walked.
> > 
> > 
> > 
> > Please keep me in Cc; I am not subscribed to the lists.
> > 
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
