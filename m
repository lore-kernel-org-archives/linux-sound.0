Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C373C2AE68
	for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745333515; cv=none; b=uo2Q3uWERLmY3NfsRDw5CvmzCXVtHIfYfzfJ5SbAam//VSzlRokJiARK4zNHIQRN2ddB5FUsttRnCBngeu2bd+rJYFrke7uzGOBmA6w1Dyk9zHTOqYuKTjhYziTiSRftz2LB3dujV+pCqkprJ6UKIeF+NxNbSAQl/RHgTPOVibo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745333515; c=relaxed/simple;
	bh=tV8eXtalUPjtZKSY2n1esmgmYuzs56+BQQg8wBi9YHI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u7OK6oR9KHCxoW/oWUqcUAiE7skVPMuJdXadYJDObI8UxV4so8Ahn/0vnnAVAfhU89Unm8bWX5VTaIFEmT+lwccbocAeplCXdbi4bubUoDIzg0WsR+7PE5+j2mflN0dkAz2T4Lh08l0mbFSp3XMfer2DMxlq5NnC8H41uMm6OXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HNhN6kic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RA61FU2W; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HNhN6kic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RA61FU2W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HNhN6kic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RA61FU2W";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HNhN6kic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RA61FU2W"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 90D852117F;
	Tue, 22 Apr 2025 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745333192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3PMU4AqXuCQw0vFhQxb3WisKYXRQ8kFfOTa9vyjHGY=;
	b=HNhN6kic7QhQg7YQt84x6sLx0PZvhdJFfBi08tdmhuIdYsW7XET5Dh5/3vUF9wsrK5B7Ko
	psc8pCy+KCTWW01Migj9cvcQ2wYAqApRV7zhGZJzH9V9fybcv+j+JQaEuRvsA0bAdkzxWM
	CDRsLt1i2E3gtI5ME0tfIK9LrJ89d3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745333192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3PMU4AqXuCQw0vFhQxb3WisKYXRQ8kFfOTa9vyjHGY=;
	b=RA61FU2WtFG5LolQxgEIJ/+FRidzVhO7qm++YYI8I0jMwXDONbvE8z4HtjMFkikGVzRuC6
	Ziz1KHPlc4pmzVCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745333192; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3PMU4AqXuCQw0vFhQxb3WisKYXRQ8kFfOTa9vyjHGY=;
	b=HNhN6kic7QhQg7YQt84x6sLx0PZvhdJFfBi08tdmhuIdYsW7XET5Dh5/3vUF9wsrK5B7Ko
	psc8pCy+KCTWW01Migj9cvcQ2wYAqApRV7zhGZJzH9V9fybcv+j+JQaEuRvsA0bAdkzxWM
	CDRsLt1i2E3gtI5ME0tfIK9LrJ89d3o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745333192;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3PMU4AqXuCQw0vFhQxb3WisKYXRQ8kFfOTa9vyjHGY=;
	b=RA61FU2WtFG5LolQxgEIJ/+FRidzVhO7qm++YYI8I0jMwXDONbvE8z4HtjMFkikGVzRuC6
	Ziz1KHPlc4pmzVCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72126137CF;
	Tue, 22 Apr 2025 14:46:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qahUGsirB2jdUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 22 Apr 2025 14:46:32 +0000
Date: Tue, 22 Apr 2025 16:46:32 +0200
Message-ID: <878qnss187.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Davis <paul@linuxaudiosystems.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: ALSA USB MIDI port names are poorly constructed and truncate iJACK names
In-Reply-To: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
References: <CAFa_cKmEDQWcJatbYWi6A58Zg4Ma9_6Nr3k5LhqwyxC-P_kXtw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Tue, 22 Apr 2025 16:31:50 +0200,
Paul Davis wrote:
> 
> ALSA's USB MIDI support appears to construct MIDI port names by
> concatenating the iProduct name and the iJACK name. The problem with
> this is that there is a fixed length to the port name in ALSA, and for
> an increasing number of devices, this behavior truncates critical
> information from the end of the iJACK name.
> 
> For example, culled from lsusb output:
> 
> Bus 005 Device 098: ID 1235:0145 Focusrite-Novation Launchkey MK4 49
>   iProduct                2 Launchkey MK4 49
>     iConfiguration          4 Launchkey MK4 49
>       iInterface              5 Launchkey MK4 49 MIDI
>       iInterface              6 Launchkey MK4 49 MIDI Int
>         iJack                   7 Launchkey MK4 49 MIDI In
>         iJack                   8 Launchkey MK4 49 MIDI Out
>         iJack                   9 Launchkey MK4 49 DAW In
> 
> gives these port names:
> 
> 44:0    Launchkey MK4 49                 Launchkey MK4 49 Launchkey MK4
>  44:1    Launchkey MK4 49                 Launchkey MK4 49 Launchkey MK4
> 
> which is useless since it fails to include the "DAW" and "MIDI Out"
> parts of the iJACK names.
> 
> The correct fix, I think is to only prepend the iProduct name if that
> name is not present at the start of the iJACK name. This will cover
> devices where the manufacturer does *not* include the device name in
> the iJACK name, but will fix this situation for devices where they do
> (Novation and Arturia and many others do this).
> 
> If agreed, I can construct a patch for this.

So you're suggesting to remove the substring matched with iProduct at
copying from iJack name?  That'll make sense and go ahead.


thanks,

Takashi
