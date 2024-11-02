Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC042070
	for <linux-sound@vger.kernel.org>; Sat,  2 Nov 2024 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730535997; cv=none; b=OMameMs4DgpACH+ZeBQWkSCRxLsSKEpT04WSCCoAgX1JjvWV9ExnRD1NetRk0jL8vFrqAcL/ymlzDOCrqj6kDgIF+YRJNU4yMyHO6WoBmeDqEp/WAygt/9wzgbnwVruNi+lsJZFWKOrpuFC/XPee8ZU0zC7cOQ4w1yOVUUhSxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730535997; c=relaxed/simple;
	bh=3kP7YnhxF9UZ8kjDPJxIz2TSuEotO5kqs32Rm15EPAE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sqo0zibf5qr0VrHddCp3yhjLXJuuY7nSrVUXVlp5T3dKjc+axDXNOyBsTIWOOKqNuLFifNyKkMSPCZ3LXjdrEePG6v3TdixhyTlp+mC2YlmOIYbBboNNpLCqN6S2zlKEK8H1M+8EvFya93UyOWbHyWD1BiTy2MIuVKrhfhr2FAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rB+xj6Rt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=faP1nFzV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rB+xj6Rt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=faP1nFzV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rB+xj6Rt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="faP1nFzV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rB+xj6Rt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="faP1nFzV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 602DB21B8A;
	Sat,  2 Nov 2024 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730535986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvhNaGXtPH3/VVpqhPC2vBav0VMIhnBv7Tf2OLyoq5o=;
	b=rB+xj6RtWC0mTszZ18qMREcaxlv6vD/oQOXohFZfxkftLjl1zudQ+PpMeaVjGMrRuZN3Lr
	GD1Re6h/bpVH1yAd4T2P55wNzqJKoCWwp+tQ6Gb2x3ew9h7wAC+L+KWlLAVWn2zhqFIdzV
	KBmHmJ+hx+i9V4cp6Y/OmEapSCpS0r4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730535986;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvhNaGXtPH3/VVpqhPC2vBav0VMIhnBv7Tf2OLyoq5o=;
	b=faP1nFzVkz/jjxMZvgij8AC693DeoytrBlqicI4VwxmyyFCTN1CqChwtO7tOG7eCHDEPJ6
	JoHr5s0YBcUu4bCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rB+xj6Rt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=faP1nFzV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730535986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvhNaGXtPH3/VVpqhPC2vBav0VMIhnBv7Tf2OLyoq5o=;
	b=rB+xj6RtWC0mTszZ18qMREcaxlv6vD/oQOXohFZfxkftLjl1zudQ+PpMeaVjGMrRuZN3Lr
	GD1Re6h/bpVH1yAd4T2P55wNzqJKoCWwp+tQ6Gb2x3ew9h7wAC+L+KWlLAVWn2zhqFIdzV
	KBmHmJ+hx+i9V4cp6Y/OmEapSCpS0r4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730535986;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lvhNaGXtPH3/VVpqhPC2vBav0VMIhnBv7Tf2OLyoq5o=;
	b=faP1nFzVkz/jjxMZvgij8AC693DeoytrBlqicI4VwxmyyFCTN1CqChwtO7tOG7eCHDEPJ6
	JoHr5s0YBcUu4bCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 384C013736;
	Sat,  2 Nov 2024 08:26:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wLU5DDLiJWeqdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 02 Nov 2024 08:26:26 +0000
Date: Sat, 02 Nov 2024 09:27:31 +0100
Message-ID: <871pzuujkc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Jaros=B3aw?= Janik <jaroslaw.janik@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix beep notifications by Thinkpad's ACPI firmware
In-Reply-To: <74e49336-4552-4224-9b14-204d4264d647@gmail.com>
References: <20241030171813.18941-1-jaroslaw.janik@gmail.com>
	<87r07wws4j.wl-tiwai@suse.de>
	<5683a485-5a5e-473c-a82c-d5c8817742bf@gmail.com>
	<87o730uttl.wl-tiwai@suse.de>
	<5a5c8b8f-13da-4024-895b-25a1b9040a5f@gmail.com>
	<87ikt7v028.wl-tiwai@suse.de>
	<74e49336-4552-4224-9b14-204d4264d647@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 602DB21B8A
X-Spam-Score: -2.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, 02 Nov 2024 00:15:24 +0100,
Jaros³aw Janik wrote:
> 
> On 11/1/24 09:18, Takashi Iwai wrote:
> 
> >> Well, to what I recall - my (current) Thinkpad has never beeped on
> >> shutdown, other than that - without your "extra muting" patch - yes -
> >> beeping in every other circumstances works no matter if HDA controller
> >> is in PM suspend or not; this is what I've got used to for many years of
> >> using Thinkpads.
> > 
> > Do you mean about the beep emitted via thinkpad_acpi stuff or the
> > normal beep via terminal etc?  The latter must work even with the
> > patch, but the question is only about the former.  And that's the case
> > for the shutdown beep tone.
> 
> Yes, I meant beeps emitted by ACPI firmware and I'm not confusing them
> with beeps generated by linux console - as you said - the latter work
> fine no matter if your patch is applied or not, the former only work
> fine if that patch is reverted.

OK.

> BTW. The ACPI beeps we are talking about are not emitted by
> thinkapd_acpi module, but by ACPI firmware; you can take a look at how
> thinpad_acpi handles writes to /proc/acpi/ibm/beep - it doesn't make any
> beep itself, it just injects some "fake" ACPI event - and beep is
> generated by laptop's firmware in response to that event (the
> terminology here might not be too good, because my knowledge of ACPI is
> rather modest).
> 
> Anyway - with that being said - when it comes to the lack of beep on
> shutdown on *my* laptop - this must be because of *my* laptop's APCI
> firmware just doesn't  emit beep for this specific event.

Yes, it seems like that. 

> > You can pass snd_hda_intel.beep_mode=0 option to disable HD-audio
> > beep, verify the device being runtime-suspended, and check whether the
> > beep via thinkpad_acpi still works (after reverting).
> 
> Yes, that works.
> I've even had another test - with patch applied I increased power_save
> param in this module to 3 seconds and now:
> - when I unplug AC - there is no beep, because device is PM suspended
> - now I hit Tab in bash on linux console, kernel emits beep and keeps
> device awaken for 3 more seconds - so I quickly unplug AC - there is a
> beep, then wait ~3 seconds and plug it back - no beep now. That shall
> prove that our understanding of what's going on is OK.

For checking the runtime-suspend, at best check the sysfs file entry.
e.g. cat /sys/bus/hdaudio/devices/hdaudioC0D0/power/runtime_status

And, I see that Conexant codec doesn't have the beep generator but
it's only passthrough.  Then beep_mode option doesn't change
anything, but the "Beep" mixer volume/switch may influence on the
behavior; not only the beep volume but also the runtime-suspend
behavior.  You can try adjusting the volume/switch if it influences on
anything.

In anyway, you can try unload pcspkr module as well.  This is the
Linux input device for the beep in your case.  (For Realtek codecs,
there can be additional beep input device driven by HD-audio codec
itself, and that's managed via beep_mode module option).

Without pcspkr, the beep from the terminal shouldn't work -- unless
it's handled by the sound server like pulesaudio.  And, if I
understand correctly from your description, even without pcspkr, the
firmware beep should keep working.

As you see, the simple beeping stuff is really complex due to its
history.  Although it's a legacy feature, a few people still love it,
hence it can't go away soon :)


Takashi
