Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958A355055
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401893; cv=none; b=srdm5J+pvXPi4dYupy8T12PkKcRFYXI0hv4pfpHlVmduKX1Ok+PgeK4fBmBAEDcs2LU1UncupqMt7TydFqXDXdTf1534wJxPPgIZyp88QCyxlFUSYko1ipOEfvSX7fZ7XJ7ccJBAV8vI0blgJ5De5NnB/YFdnGkzn2WNAWvNpCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401893; c=relaxed/simple;
	bh=3THjb6SM408wcl4KAxrJjzYAVbrUp0Z/K36OUuqWEuQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M1Pz95DfkumzZ6xQOh2Vg/ZI9WxYrUX+jLQMj1gLtIj+jtL5OrAkLJGubEHNqpKEoSGVO6L81lpBnFmNLBu9hOqqCkudisePLjGEAx2kA2ZF9//Tlggqvt5CqBwQ+BwEnjxD7LMIkEKUlu6JB07o2Cy5Lgb1acsq6CLe3k+74Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LpyOLLwX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sMIvZbah; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kUw7kzBH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JpWXJ+VG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LpyOLLwX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sMIvZbah";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kUw7kzBH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JpWXJ+VG"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BD6A021B0C;
	Mon, 14 Sep 2026 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZVkz1JaKyKVnSyUj9IEhjeWJUu00Tju4eAs3nw9ybo=;
	b=LpyOLLwXAw8XWCarSKIXs6oA3VDA0GJhPYUzy9moLkzvHyCeCNdmSGisfqJJpnyQ5MVwdv
	kK9gIDfYpsILT/tg9JmdZEhBEYRvyPTKtU6KQu/EExGKCZu4mTvVHzS8O+Vrj3S55CXois
	r7llmU2LDCD5GNYnq7ybx3PWw09GUXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZVkz1JaKyKVnSyUj9IEhjeWJUu00Tju4eAs3nw9ybo=;
	b=sMIvZbahdMnarR8bSw/Oyxt77DtzykxTqIQ7RB2RALSuDSvAt4xZr9fUNTeow5fNx3QA3F
	gITIKGDd9aw3sqAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789401881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZVkz1JaKyKVnSyUj9IEhjeWJUu00Tju4eAs3nw9ybo=;
	b=kUw7kzBHo4qkzVx3+nwATa2gH5fsSmIWNPBvg8w9cnzAFOXhVYI2F0QORuG06kIpxu9AKP
	CsAZ87D2pn5lh2VkvC8Gk9ifiR3K5WGokDgah2atDvuidyIZulcJjA7MbO95pohF3YSSW2
	FwnVtGvg38PsE+i/SfU0uYPe7xfyUjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789401881;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZVkz1JaKyKVnSyUj9IEhjeWJUu00Tju4eAs3nw9ybo=;
	b=JpWXJ+VGGyDRcqL+BKtZSVCP8FuinC/RQxSPJC5GQUbeRDfw0tbj/V1aDOJQrKH8jZZfLR
	3h2q81HDFgQZZ7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71CD213515;
	Mon, 14 Sep 2026 16:04:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MPxpGhkbqGpvEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Sep 2026 16:04:41 +0000
Date: Mon, 14 Sep 2026 18:04:40 +0200
Message-ID: <87a4pjom3r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?wfUgtrA=?= <liudongxjtu@outlook.com>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: ALSA: hda/conexant: Fix silent speaker on Huawei MateBook 14  (SN6140)
In-Reply-To: <ME3PR01MB7504E1F31E26F760F73DF639BDBD2@ME3PR01MB7504.ausprd01.prod.outlook.com>
References: <ME3PR01MB7504E1F31E26F760F73DF639BDBD2@ME3PR01MB7504.ausprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,outlook.com:email]

On Sat, 12 Sep 2026 16:03:55 +0200,
Αυ Ά° wrote:
> 
> 
> Sir/Madam,
> 
> On the Huawei MateBook 14 (PCI SSID 19e5:329e), the SN6140 codec
> silently routes the speaker output through the headphone pin's
> connection select: whatever DAC the headphone pin 0x16 is connected to,
> the speaker pin 0x17 follows. The generic parser attaches the playback
> stream to DAC 0x10 (shared by the headphone path) and mutes that DAC
> when no headphone is plugged, silencing the internal speaker while the
> headphone jack keeps working.
> 
> Add a quirk for this machine that suppresses the auto-mute, binds the
> speaker pin to the shared DAC 0x10, removes the mute switch on that DAC
> so userspace cannot mute it, and re-applies the routing after every
> output update; at init it routes both pins to DAC 0x10, enables the
> speaker EAPD (which the driver otherwise leaves off) and unmutes the
> DAC.
> 
> Note that this is a different problem than the existing Huawei
> Matebook quirk for SSID 19e5:3289 (commit d152afd1cd7a), which fixes a
> missing headphone jack; that machine has working speakers.
> 
> Tested on Ubuntu 26.04 (kernels 7.0.0-30 and 7.0.0-31): the speaker
> plays at boot without any userspace helper, and keeps working across
> suspend/resume.
> 
> Signed-off-by: liudongxjtu <liudongxjtu@outlook.com>

The patch can't be applied because your mailer broke the spaces.

Please try to resubmit with a fixed mailer setup; at best use
git-send-email.

About the patch: please drop the heading "Sir/Madam".  The patch
description will be taken as the commit log as is, so such a greeting
doesn't fit at all.

Also, spelling your name in a bit more Western style (using
capital/lower letters and putting a space between first name and last
name) would be better.


thanks,

Takashi
