Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C73002C8;
	Fri, 14 Aug 2026 05:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786687068; cv=none; b=llzr/1GpHNqR6g5F0cjKo1FDOF8bbj4mBtq/pqIoCcZdOT5rr7uckIuySS6OCExE5krUEBUVSEM41FTy2uxyf6LVXpyO9pjett8DI6BNTtIXfwCHYZCw8Py3rw4OdWmW2Nc7oQodqe4wxHd9m8OXWkwGLH7G2wYjxel8Af1On5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786687068; c=relaxed/simple;
	bh=p/xOdl5H4deEivprV1zCFCr+oS5AWIrpUw+wcqTkbQw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hK1vgO37g62ycu1k4sL/40nSls/wVITWAIT/Y/fgluhp4VVEhvtA5lqFPhmRb6FQNSd/OojSm3Ieo6R50u9BqZPVZYyzSjn+iRPJv76gh0z4h84Bd/vQItI74FIwN8WU2/Y0FUDs7Sxz1CrdlT3LpoMn/HtDQkM3RKFPOu0gmdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZpdaPWTc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OH4dDRBs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GYgBT+Bf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B3RLbbQI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZpdaPWTc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OH4dDRBs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GYgBT+Bf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B3RLbbQI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C8503E9E;
	Fri, 14 Aug 2026 05:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786687060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2zMNO6xlShUrWz0VbLUVsQ5u7pwsoIn63ZBdL9YvI8=;
	b=ZpdaPWTc2ogJkM5NusiwWgdySHqkYP2Jjqtfww41yzSmqX5wWEUJF5NICDCYVqMgguDrFt
	3QmL/VNaMhOuWPQ7vBb1eMIiAkLsDcKAIdlfM9U+x5rkOU5t56iaBs0SY9nJ+eiPAA/Lje
	8vgQeIU4BfA9ic2RfW2RHYSS5Ed4PYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786687060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2zMNO6xlShUrWz0VbLUVsQ5u7pwsoIn63ZBdL9YvI8=;
	b=OH4dDRBspbWgYxTCW7miPEqRFtbJCDbsKQ342JCQODmJ0NoOpIzopgIzT6bgwfGRqZW6CN
	VJ1VtcZJfU8R03Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786687056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2zMNO6xlShUrWz0VbLUVsQ5u7pwsoIn63ZBdL9YvI8=;
	b=GYgBT+Bf3zFLTUPCV/X1aIwKx16Bkfhc3pMHP4zD9bo44A9591kvPhG88k0Tb27jKpI/JY
	8hN1tiVuWHomvUPoeyL6ajAh94kEmamqAb0FPwlGomHH5UxZFTd/PPfVll0Jsz50D2Il9U
	YLPcKacmtT3JF3UGsklvElhSgxhsWQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786687056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C2zMNO6xlShUrWz0VbLUVsQ5u7pwsoIn63ZBdL9YvI8=;
	b=B3RLbbQIC9jXJowQvWo/1N/UXXjBVIFfs4nGm9MgPqQjNVGiWl+dpokK6XAitSxSITbMvo
	Ft686r1V38oBCbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D2E1278211;
	Fri, 14 Aug 2026 05:57:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YoyoMU+ufmrxIgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Aug 2026 05:57:35 +0000
Date: Fri, 14 Aug 2026 07:57:35 +0200
Message-ID: <871pc1fdm8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Neil Andrews <neil@androos.io>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Rename the Audient iD14 monitor mix volume control
In-Reply-To: <0102019ffcdbb1e6-9b59d3cc-ef05-4df1-8f9f-fb2f425bcda2-000000@eu-west-1.amazonses.com>
References: <0102019ffcdbb1e6-9b59d3cc-ef05-4df1-8f9f-fb2f425bcda2-000000@eu-west-1.amazonses.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 13 Aug 2026 22:41:24 +0200,
Neil Andrews wrote:
> 
> On the Audient iD14 (2708:0008), feature unit 12 is traced through to
> the Speaker output terminal and is therefore exported as "Speaker
> Playback Volume".  The name fits it badly.  It advertises Volume on
> only four of its six logical channels, which the driver records as
> cmask=0xf, channels=4 on a 6-channel playback stream, and it sits on
> the monitor mixer branch rather than in the direct playback path:
> 
>   INPUT_TERMINAL 2 (USB streaming, 6ch) -> EXTENSION_UNIT 51 ->
>     FEATURE_UNIT 10 (no controls) -> OUTPUT_TERMINAL 20 (Speaker)
> 
> while FU 12 hangs off MIXER_UNIT 60 and feeds back into
> EXTENSION_UNIT 51.
> 
> Userspace adopts the control as the stream's hardware playback volume,
> so any setting below 0 dB attenuates part of the stream and not the
> rest.  Measured over the device's own digital loopback, with one
> -12 dBFS tone per channel played straight to hw:, PCM channel 0 is
> unaffected while channel 1 tracks the control: at 107/127 (-20 dB) the
> two read -15.89 and -35.89 dBFS, a 20.00 dB imbalance, and at 127/127
> both read -15.89 dBFS.
> 
> Give the unit a non-standard name so that it is no longer taken for
> the stream's master volume.  Dropping the control instead also fixes
> the imbalance, but FU 12 keeps its value across a module reload, so
> dropping it strands a device that is already attenuated with nothing
> able to reset it.  Renaming leaves the monitor gain reachable and that
> recovery path intact.
> 
> The mapped name ends in "Playback" because a name from the map
> suppresses the automatic " Playback" but still gets " Volume"
> appended; the control comes out as "Monitor Mix Playback Volume".
> 
> Tested on the ACP path with PipeWire, which is where the problem
> reproduces: the control now stays at 127 at every volume setting and
> the imbalance is 0.00 dB, and setting it by hand to 107 and back to
> 127 gives 20.00 dB and 0.00 dB as before.
> 
> Link: https://lore.kernel.org/linux-sound/0102019fed22f9d3-fa294ec5-02f1-4fd3-b3fa-76efc14331cc-000000@eu-west-1.amazonses.com/T/#u
> Signed-off-by: Neil Andrews <neil@androos.io>

Applied to for-next branch.  Thanks.


Takashi
