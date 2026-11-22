Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335850;
	b=Db2cyQmFvs07THj0/ZshAUUqN43DlNMZ1GoFs9miFK0p2aGLfc1C7L7WDc5grvL9voAP
	 5BQpzFSHTerXnrn7XL+C4j24NViu1hJYeZ6Bd8cQrnJhL9ptbHVrCBM+wX2SImkvexCnY
	 626Ymnd97M65EhjOnvV1msNoSoGkvhbo4HGDClM5H+iUURbB6WWpIdeGBriRioHEUphVM
	 nzEICJszJNFpINWoLr1nmcxsmk3fhDIueGTrRzCXQX8F1NgkqsqJ2QcOJok1vEHz1VqR8
	 K9zrRR+VkxjDB36c2UZIQkJTozCVWearbOGAhE6xv8UCT0oa/IJNtYzN/on39f4DnCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335850;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=B+vX4TM0jgSW9RcvX+lpb8mL2xXFoJqShhAK1AJC2Lc=;
	b=SYDFqEL5Ew4bt8N2KK+gKO494YpT5IX0gvGL11k3jYoBwOzlJgoqMw6viY3rP5q6F7wO
	 UgkW/5GRYg49kyJ8am6uNzwIK5ktjDUs0KLuKiTprdYVsQeuE25hVrhI4ou/15DlNQK6C
	 mal1c8+4tWxBnOJWBe0cnAjMSHPHj/nE2f0lZNLb1az8XIKs87rzvUhf6DUtMYIIqIjrP
	 lHsMbirAwkVXhbqgjiHYDk2B/WYz0F1OoDn+EtqPqKbHSkz7YwKuLNizo3FLogClgjImN
	 14+7KALykE+l2oe/xXG4iJmMTskc5c6QkJbjEsNC6I89i9upno+8Zjf4sT+/vwMj2hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AfgUR4tg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zc2abgGb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AfgUR4tg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zc2abgGb;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE233606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:24:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE233606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AfgUR4tg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zc2abgGb;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AfgUR4tg;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zc2abgGb
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 872601FAC1;
	Sun, 22 Nov 2026 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vX4TM0jgSW9RcvX+lpb8mL2xXFoJqShhAK1AJC2Lc=;
	b=AfgUR4tg4yNCqy/77tVy5qEOklmV47RjyHWewlqu21oo70jn7NK7oFEjMQQkQ5GesG6+83
	f7p4W+9L0Z8HJRxnZOP5G9ucxfyVCzgTTiHlHq4z4GX9eDxHpsYrYHtd3jy7B1JogwAZ5+
	MCQyYz1zaXxNqDyrj+UTL4XRQ/AfgSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vX4TM0jgSW9RcvX+lpb8mL2xXFoJqShhAK1AJC2Lc=;
	b=Zc2abgGbrt4K7RMg+9UO20HV17XDDFfa/24VD44cXAKc0oNqLw9yv8rigTFx/ms7HJg53M
	W8cviA4YeDA7BUDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AfgUR4tg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Zc2abgGb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795335847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vX4TM0jgSW9RcvX+lpb8mL2xXFoJqShhAK1AJC2Lc=;
	b=AfgUR4tg4yNCqy/77tVy5qEOklmV47RjyHWewlqu21oo70jn7NK7oFEjMQQkQ5GesG6+83
	f7p4W+9L0Z8HJRxnZOP5G9ucxfyVCzgTTiHlHq4z4GX9eDxHpsYrYHtd3jy7B1JogwAZ5+
	MCQyYz1zaXxNqDyrj+UTL4XRQ/AfgSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795335847;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B+vX4TM0jgSW9RcvX+lpb8mL2xXFoJqShhAK1AJC2Lc=;
	b=Zc2abgGbrt4K7RMg+9UO20HV17XDDFfa/24VD44cXAKc0oNqLw9yv8rigTFx/ms7HJg53M
	W8cviA4YeDA7BUDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 350981342D;
	Sun, 22 Nov 2026 08:24:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xWDgA6emAmtDbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Nov 2026 08:24:07 +0000
Date: Sun, 22 Nov 2026 09:24:06 +0100
Message-ID: <874id96zq1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	intel-gfx@lists.freedesktop.org,
	Michal Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH v2 1/2] ALSA: hda: intel: Release i915 power also when delayed probe fails
In-Reply-To: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
References: <20261120150937.2187228-1-kai.vehmanen@linux.intel.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 872601FAC1
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
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Fri, 20 Nov 2026 16:09:36 +0100,
Kai Vehmanen wrote:
> 
> Commit fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe
> work") stopped freeing the card from azx_probe_work() when the delayed
> probe fails, and only disconnects it, leaving the free to azx_remove().
> This avoids the double free, but the resources that were released by
> the card free via azx_free() are now kept until the PCI device is
> unbound. In particular the display power reference stay held, blocking
> runtime suspend for i915/xe.
> 
> Release the display power in the azx_probe_continue() work in all cases.
> This power reference is only taken for the purpose of the display codec
> probe. If the display codec probe was successful, it will have taken its
> own reference. In case of systems with the HDA controller on GPU side
> (hda->need_i915_power), functionality is same as before - we have to
> keep power.
> 
> Fixes: fbaccb1b19c7 ("ALSA: hda: intel: Don't free card in the probe work")
> Reported-by: Michal Grzelak <michal.grzelak@intel.com>
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17751
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Applied now.  Thanks.


Takashi
