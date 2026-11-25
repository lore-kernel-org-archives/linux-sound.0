Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616321;
	b=3Dtsj/f9lLIeE0WtTUv9xK5Mt+F/J2qrtk7BaD+ILcWcn+FlFmf1FEXmBWMak2pK9bMs
	 tgtsAnmkJ5/MJK9Qnj+hD6uqVcxNo4bzovZE+tfNNtZ31wbbV4x4h54+JJDx6d1BEIOAP
	 DAOttKl+S3YvRp/0y54l6biEi/El2BTLtJPLZdgfMADVlam9emrmoZqcOebzssccPAUly
	 kXaefiVo3n7HrHNVECP9GddKTdWgqvA2vkenmYMwCujZqRTD0W8vb8Uosl+JrODJVUyeM
	 F+TNA37cPjRyKSlH4hnKbyIo687Z3LZWbyxgcmKB0iRc0ZqLp6ChdXMKWgQTXwQ1IaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616321;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=DYO+fA5xfPqP/OxcFmJEOG4Fhmg6oUdefsiOp9dJ9N8=;
	b=vdDJ4om7eJ0R7xq3rJ2oXiAhvNsmic9LzDsptEH2ouGDLexN8ZMKUa4WZaA/1oyPIsuz
	 g0B+UCi6c5vwDev1s4faoOENnDmL1jrxT0FZQDLc9RwJEhA7LdpYVqv9JLlkiaPN7WvJl
	 udCUQ3m6ILgL8E3HNdL/E9vRpb4WGDqogdVQHQWCfPL5Yx6nyE/mSAMbWc/w7mQb2gcZh
	 yawpXKlkj+Bmhf+3e6+bJS+0NhWvubhuNLeVJ3vO08sv2FiTH3rcdPcQxd58XjSPdXF/d
	 ORU59MIKQPYyoyXJr+u4dRTDWpwraTyUUVRyjT5VlCV0SQTya+e8SRe+uh8mKreBXTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QlaTsO+c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OeTxL6yO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QlaTsO+c;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OeTxL6yO;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8095606A329;
	Wed, 25 Nov 2026 14:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8095606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QlaTsO+c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OeTxL6yO;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QlaTsO+c;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=OeTxL6yO
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A660E2220C;
	Wed, 25 Nov 2026 14:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYO+fA5xfPqP/OxcFmJEOG4Fhmg6oUdefsiOp9dJ9N8=;
	b=QlaTsO+cOoLlfz5nhzsMF2Hib6Z2XXX/Y4BzQEsn5G6v97MU0rOLvj6Qr/LfpuqUB9asds
	wxGGrDqRq+qm3MoKQQbNf8/XgJlW+pj3HaOmXHz3QqV9BTwUMmC0MoIG1W8zS6qPoA2nPl
	ATGZYo6+0gzmIpdCwiR2IltQrdwwki0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYO+fA5xfPqP/OxcFmJEOG4Fhmg6oUdefsiOp9dJ9N8=;
	b=OeTxL6yONMvEYCK2N77IXuPTiliawq5G886XOQzHDVfNwvxZZ8OUaYMEzGj10Tr7r3ozBW
	0c7RLdVX+2AxEEAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QlaTsO+c;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OeTxL6yO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795616318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYO+fA5xfPqP/OxcFmJEOG4Fhmg6oUdefsiOp9dJ9N8=;
	b=QlaTsO+cOoLlfz5nhzsMF2Hib6Z2XXX/Y4BzQEsn5G6v97MU0rOLvj6Qr/LfpuqUB9asds
	wxGGrDqRq+qm3MoKQQbNf8/XgJlW+pj3HaOmXHz3QqV9BTwUMmC0MoIG1W8zS6qPoA2nPl
	ATGZYo6+0gzmIpdCwiR2IltQrdwwki0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795616318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DYO+fA5xfPqP/OxcFmJEOG4Fhmg6oUdefsiOp9dJ9N8=;
	b=OeTxL6yONMvEYCK2N77IXuPTiliawq5G886XOQzHDVfNwvxZZ8OUaYMEzGj10Tr7r3ozBW
	0c7RLdVX+2AxEEAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 59E81134CA;
	Wed, 25 Nov 2026 14:18:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MDH7DD7uBmuIWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 14:18:38 +0000
Date: Wed, 25 Nov 2026 15:18:37 +0100
Message-ID: <87jym16lky.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Re: sound: core: get_available_index() calls snd_ctl_find_id()  without controls_rwsem (UAF risk)
In-Reply-To: <35a9af21.56c.1a212be1cb2.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<34dd9f9d.2ad23.1a2024081bb.Coremail.xuhx@hust.edu.cn>
	<35a9af21.56c.1a212be1cb2.Coremail.xuhx@hust.edu.cn>
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
X-Rspamd-Queue-Id: A660E2220C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
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
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[perex.cz:email,suse.de:dkim,hust.edu.cn:email,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,sid.name:url,perex.cz:email,suse.de:dkim,hust.edu.cn:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Wed, 25 Nov 2026 13:46:18 +0100,
徐晗翔 wrote:
> 
> get_available_index() walked the control id space via
> snd_ctl_find_id() without holding card->controls_rwsem; the
> CONFIG_SND_CTL_FAST_LOOKUP fast path does xa_load() and
> elem_id_matches() without any lock, so a concurrent
> snd_ctl_remove() (rwsem write, remove_hash_entries, list_del,
> kfree) could free the kcontrol between the xa_load() and the id
> read -- a use-after-free.
> 
> Restore the upstream guard: hold controls_rwsem for reading across
> the index loop in snd_kctl_jack_new(); the read side is released
> before the caller's snd_ctl_add(), which takes the write side.

Already fixed by the upstream commit ba8c3d5fc27a.


thanks,

Takashi



> ---
>  sound/core/ctljack.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/ctljack.c b/sound/core/ctljack.c
> --- a/sound/core/ctljack.c
> +++ b/sound/core/ctljack.c
> @@ -73,7 +73,15 @@
>  		return NULL;
>  
>  	jack_kctl_name_gen(kctl->id.name, name, sizeof(kctl->id.name));
> -	kctl->id.index = get_available_index(card, kctl->id.name);
> +	/* get_available_index() walks the control id space through
> +	 * snd_ctl_find_id(), whose CONFIG_SND_CTL_FAST_LOOKUP fast path
> +	 * reads the candidate kcontrol's id without any lock of its own.
> +	 * Hold controls_rwsem for reading across the loop so a concurrent
> +	 * snd_ctl_remove() cannot remove and kfree() the kcontrol between
> +	 * the xa_load() and the id read.  The read side is released before
> +	 * the caller's snd_ctl_add(), which takes the write side. */
> +	scoped_guard(rwsem_read, &card->controls_rwsem)
> +		kctl->id.index = get_available_index(card, kctl->id.name);
>  	kctl->private_value = 0;
>  	return kctl;
>  }
> 
> 
> > -----原始邮件-----
> > 发件人: 徐晗翔 <xuhx@hust.edu.cn>
> > 发送时间:2026-11-22 15:55:11 (星期日)
> > 收件人: perex@perex.cz, tiwai@suse.com
> > 抄送: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
> > 主题: sound: core: get_available_index() calls snd_ctl_find_id()  without controls_rwsem (UAF risk)
> > 
> > get_available_index() in sound/core/ctljack.c walks the control id space
> > by calling snd_ctl_find_id() in a loop, but it does not hold
> > card->controls_rwsem.  snd_ctl_find_id()'s fast path is itself lockless:
> > it does xa_load(&card->ctl_hash, ...) and elem_id_matches() reads the
> > candidate kcontrol's id.  A concurrent snd_ctl_remove() holds the write
> > side of controls_rwsem, removes the hash entries, list_del()s the node
> > and kfree()s the kcontrol.  get_available_index() can therefore load a
> > kcontrol that is being freed and read its id after the free -- a
> > use-after-free read.  Upstream puts guard(rwsem_read)(&card->controls_rwsem)
> > around the loop in snd_kctl_jack_new(); this tree has no lock there.
> > 
> > This is a static report: I have a complete code path and an upstream
> > diff, but I did not build a dynamic reproducer for this particular
> > window.  I am reporting it because the missing lock is unambiguous and
> > the required concurrent operations are reachable from userspace.
> > 
> > The detailed description:
> > 
> > * Test environment / affected version
> > 
> >   Source analysis against mainline 7.3; no dynamic reproducer was run
> >   for this case.  The related sound/core report was produced on a 7.3
> >   KASAN kernel, but that run does not cover MR-05.
> > 
> > * Root cause
> > 
> >   sound/core/ctljack.c:31-46 (get_available_index):
> > 
> >     static int get_available_index(struct snd_card *card, const char *name)
> >     {
> >         struct snd_ctl_elem_id sid;
> >         memset(&sid, 0, sizeof(sid));
> >         sid.index = 0;
> >         sid.iface = SNDRV_CTL_ELEM_IFACE_CARD;
> >         strscpy(sid.name, name, sizeof(sid.name));
> > 
> >         while (snd_ctl_find_id(card, &sid)) {   /* no controls_rwsem */
> >             sid.index++;
> >             sid.numid = 0;
> >         }
> >         return sid.index;
> >     }
> > 
> >   sound/core/control.c:843-868 (snd_ctl_find_id) documents that it
> >   takes card->controls_rwlock internally, but the
> >   CONFIG_SND_CTL_FAST_LOOKUP fast path does xa_load() and
> >   elem_id_matches() without taking it; only the fallback list walk takes
> >   read_lock_irqsave().  __snd_ctl_remove() (control.c:581-601) runs
> >   under controls_rwsem write, calls remove_hash_entries(card, kcontrol),
> >   then snd_ctl_free_one(kcontrol) -> kfree().  Thus a lockless
> >   xa_load() can observe a kcontrol that is about to be freed, and
> >   elem_id_matches() can read it afterwards.
> > 
> >   Upstream snd_kctl_jack_new() has:
> > 
> >     guard(rwsem_read)(&card->controls_rwsem);
> > 
> >   before calling get_available_index(); the current tree removed it.
> > 
> > * Reachability
> > 
> >   - get_available_index() is called from snd_kctl_jack_new()
> >     (ctljack.c:62-77), which is called by snd_jack_kctl_new()
> >     (jack.c:426-456) and snd_jack_add_new_kctl() (jack.c:468-478).
> >   - Runtime caller: sound/soc/ti/ams-delta.c:361 calls
> >     snd_soc_jack_add_pins() from the tty line discipline receive path;
> >     snd_soc_jack_add_pins() (sound/soc/soc-jack.c:155) calls
> >     snd_jack_add_new_kctl() after the card is registered.
> >   - A user with write access to /dev/snd/controlC* can add and remove
> >     SNDRV_CTL_ELEM_ACCESS_USER controls with iface
> >     SNDRV_CTL_ELEM_IFACE_CARD and an arbitrary name
> >     (snd_ctl_elem_add()/snd_ctl_remove_user_ctl(), control.c:662-678).
> >     A control with the same name as the jack kcontrol is the concurrent
> >     object.
> > 
> >   Conditions: CONFIG_SND_CTL_FAST_LOOKUP=y (otherwise the fallback walk
> >   holds the read lock and the UAF does not apply); a runtime jack-pin
> >   addition path; a concurrent control add/remove with a colliding name.
> >   The race window is small, but the missing lock makes it a kernel bug
> >   regardless of reproducibility.
> > 
> > * Impact
> > 
> >   elem_id_matches() reads kcontrol->id.name/iface/index from freed
> >   memory: KASAN use-after-free read, potential crash or limited
> >   information exposure.  A second, non-memory-safety symptom is two
> >   jack kcontrols choosing the same index; the later snd_ctl_add()
> >   returns -EBUSY, so jack creation fails.
> > 
> > * Suggested direction
> > 
> >   Hold controls_rwsem for reading across the get_available_index() loop,
> >   e.g. restore the upstream guard in snd_kctl_jack_new() (the lock must
> >   be released before snd_ctl_add(), which takes the write side).
> > 
> > 
> >   Please keep me in Cc; I am not subscribed to the lists.
> > 
> > Regards,
> > Hanxiang Xu
> > xuhx@hust.edu.cn
