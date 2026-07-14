Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440AA33D6CA
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008216; cv=none; b=aipW2K4C5IiEEQI3c8nnejnPdwS4Cqu0PH36MeDWo0+O4zSidvqYaqVpz38BgsW1D5o70ewCRyvpgi6nI0GYBDzeGOreCHWnBMEGCULVLqm9Zs55vy7NYFVCK97qi04mahYGPMW4zqb6Byy6L20cZJckOZqEe7w0qbQbNsEUQ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008216; c=relaxed/simple;
	bh=5L6pfLidxdpn5i6L+Kkmyx/ww9NwjxDZEVvzN8lI3FI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N308Dhe2nOKF7bE08IK88zXsIrst0OHTYXliNcFIrm7GsZLFMU/q8b8Oq3rNsXXPnisH6xJSmDoaYU/StPvqf+5Pax3jnYSVIAvqDPaSv3doTQen3syJOP647qBHiBO3ykMN927ckNQF7BN7r3yF9aw883GpAN8YV+F9b4e3TVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wno+5P3Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uoVnsZUX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dths9evf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ThSW5uw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wno+5P3Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uoVnsZUX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dths9evf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ThSW5uw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E9F43E26;
	Tue, 14 Jul 2026 05:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784008213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KVwM9XZT4BVVsCO+D4Q+5i1PFrnEsV4ghtIB6QM3tAM=;
	b=wno+5P3Q9JCJmWCMaJKbsmuVJW6svqI90uLGJFKcLX0JcHW3Pm/9j9W6VjTczbr6d1N/YK
	Ld07o3hCfC0L3thutY/HKTDkH4vHaYFeALM4VZLadH5RT3sFG2b5fNFvFT3yjX92IAZEP+
	sc4HDWRccMtMxLtPYZflzK8OmrN+5e8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784008213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KVwM9XZT4BVVsCO+D4Q+5i1PFrnEsV4ghtIB6QM3tAM=;
	b=uoVnsZUXFhcJx9eZ4Vik6pcd86eJSOgA1mtx16557eZNmtBIHV6n0jouO8hSmeZM6MKM9u
	5UfXHwkh5Tliz/AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dths9evf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5ThSW5uw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784008212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KVwM9XZT4BVVsCO+D4Q+5i1PFrnEsV4ghtIB6QM3tAM=;
	b=dths9evf2h5q+89WbTt4/GZyuHdhsYS7zT/FrwO55qqGqEI7pxYBm9aGPkcnSYXzhfERNp
	cM6vD0Oz/yz3iQoMKt62HFzA8wa27jQxYgP9WbMKn78CWi51sbM9/bhZFSCboo2Kr+cPRE
	N01r04ACAr5EZ7NryAQ336/d50R2cFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784008212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KVwM9XZT4BVVsCO+D4Q+5i1PFrnEsV4ghtIB6QM3tAM=;
	b=5ThSW5uwIgvcBxcejOb6nXXbN6TZg+gH5nSmchEb8QlzIshQBnWsj4fVoGn2Y2D2a9J0ox
	uy6bApKzbJKbepAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 15785779AE;
	Tue, 14 Jul 2026 05:50:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mRAaBBTOVWqDEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 05:50:12 +0000
Date: Tue, 14 Jul 2026 07:50:11 +0200
Message-ID: <87qzl6jf1o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven 'Steve' Kendall <skend@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
In-Reply-To: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
References: <20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3E9F43E26
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,chromium.org:email,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 13 Jul 2026 23:21:41 +0200,
Steven 'Steve' Kendall wrote:
> 
> On some models like the Dell Inspiron 15 3520, jack
> detection does not work. This patch switches to polling
> and more regularly queries the lower values rather
> than cached values for the headphone and mic jacks.
> It also includes some logic to prevent the polling
> while headphones are already plugged so no
> audible "tick" can be heard.
> 
> ---

This makes the remaining text not taken by git-am.
And, I guess the text above should have been combined with the below?

> This patch switches to a polling method for a
> specific Dell machine (Inspiron 15 3520). This fixes
> jack detection for this model. It's possible the gate
> on manufacturer and model are unnecessary and this problem
> is common to a wider set of machines, but I've only tested
> on one machine thus far. I left the other logic ungated
> as it seemed likely the cache was not providing up-to-date
> information broadly. But I'm open to gating more or less
> of the content or changing the approach entirely.

The jack polling is really the last resort, and I'd like to know why
the normal jack detection doesn't work at first.  Is it the missing
unsol event?  Or the jack detection itself doesn't work?
If it's a missing unsol event, this drop happens always?  Or on
certain runtime PM state?


thanks,

Takashi

> 
> Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
> ---
>  sound/hda/codecs/cirrus/cs8409.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
> index c43ff3ef75b6e..733234844e7df 100644
> --- a/sound/hda/codecs/cirrus/cs8409.c
> +++ b/sound/hda/codecs/cirrus/cs8409.c
> @@ -766,6 +766,9 @@ static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_
>  	/* TIP_SENSE INSERT/REMOVE */
>  	switch (reg_ts_status) {
>  	case CS42L42_TS_PLUG:
> +		// if jack is already plugged, ignore plug event
> +		if (cs42l42->hp_jack_in)
> +			break;
>  		if (cs42l42->no_type_dect) {
>  			status_changed = 1;
>  			cs42l42->hp_jack_in = 1;
> @@ -776,6 +779,9 @@ static int cs42l42_handle_tip_sense(struct sub_codec *cs42l42, unsigned int reg_
>  		break;
>  
>  	case CS42L42_TS_UNPLUG:
> +		// if jack is already unplugged, ignore unplug event
> +		if (!cs42l42->hp_jack_in && !cs42l42->mic_jack_in)
> +			break;
>  		status_changed = 1;
>  		cs42l42->hp_jack_in = 0;
>  		cs42l42->mic_jack_in = 0;
> @@ -1092,12 +1098,14 @@ static int cs8409_cs42l42_exec_verb(struct hdac_device *dev, unsigned int cmd, u
>  	switch (nid) {
>  	case CS8409_CS42L42_HP_PIN_NID:
>  		if (verb == AC_VERB_GET_PIN_SENSE) {
> +			cs42l42_jack_unsol_event(cs42l42);
>  			*res = (cs42l42->hp_jack_in) ? AC_PINSENSE_PRESENCE : 0;
>  			return 0;
>  		}
>  		break;
>  	case CS8409_CS42L42_AMIC_PIN_NID:
>  		if (verb == AC_VERB_GET_PIN_SENSE) {
> +			cs42l42_jack_unsol_event(cs42l42);
>  			*res = (cs42l42->mic_jack_in) ? AC_PINSENSE_PRESENCE : 0;
>  			return 0;
>  		}
> @@ -1157,6 +1165,11 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
>  		case CS8409_WARLOCK_MLK_DUAL_MIC:
>  			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
>  			spec->speaker_pdn_gpio = CS8409_WARLOCK_SPEAKER_PDN;
> +			// if Dell Inspiron 15 3520, poll jack at 250ms
> +			if (codec->bus->pci->subsystem_vendor == 0x1028 &&
> +			    codec->bus->pci->subsystem_device == 0x0bb2) {
> +				codec->jackpoll_interval = msecs_to_jiffies(250);
> +			}
>  			break;
>  		default:
>  			spec->scodecs[CS8409_CODEC0]->full_scale_vol =
> @@ -1208,8 +1221,10 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
>  		 * Run immediately after init.
>  		 */
>  		if (spec->init_done && spec->build_ctrl_done
> -			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
> +			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in) {
>  			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +			cs42l42_enable_jack_detect(spec->scodecs[CS8409_CODEC0]);
> +		}
>  		break;
>  	default:
>  		break;
> 
> ---
> base-commit: d96fcfe1b7f94ac742984ae7986b94a116abff1b
> change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
> 
> Best regards,
> -- 
> Steven 'Steve' Kendall <skend@chromium.org>
> 
