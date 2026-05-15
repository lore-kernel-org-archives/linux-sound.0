Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBB23630A0
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778826811; cv=none; b=mhQgKr+0F7rapts5XdExTNZXEYcKMNomNv+VP40XV0aTMryisx6e8ddXZyOkKll8r6fFKc03v4dXeDSfrnvPBqaTgB6lUQU5ImNZhUHSMaxohrpN3ugFbX+K8fZUpPykvmuRsujYshTZiq/Oed1DKOOJpLG7AoQa7HKytS85yjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778826811; c=relaxed/simple;
	bh=JOM4t1LJFrduQ1d+oo8VMt5nVxgzSutVaS0l6t/XJpc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ce/Y5rl7sY2rttnV020U/Cv+qcUw8hbQmtrS7hxir8Q7pBplWeUzagzMTZhEFgj57Nc/r/FzzMqCajndyQafW77RWjtG7pWRLt075hbgO5D44JNgmvEenkB3sctg3SznGrDvWv4D/JeaH7u35N0w4s2hDSvjl7ULTGeWV5qvUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VQDgu64w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7iAc1iR7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VQDgu64w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7iAc1iR7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VQDgu64w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7iAc1iR7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VQDgu64w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7iAc1iR7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 960216A962;
	Fri, 15 May 2026 06:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778826808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=VQDgu64w8pCEjsaVL2cV3hzc9VTF8SweTwHDt6UK+Z8BQM1E57X+ikgQTDh+MbAbnwmgKi
	kIh9RqV2iIXzMyBk9hU/3ph5E0jpGBG4hf6jng71IeDgjc6O1GGZ+cYUIbvuxGZOevSfz2
	SCm0FBQcaQjZQgbLC/L1sarF2ng+JzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778826808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=7iAc1iR7NRAMvhKf4canaecm+YbTIXcSbZTIobmTSxuWsgwoxzTXO87+o2O2erzoo87U43
	49gF1rX3ZC8KitBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778826808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=VQDgu64w8pCEjsaVL2cV3hzc9VTF8SweTwHDt6UK+Z8BQM1E57X+ikgQTDh+MbAbnwmgKi
	kIh9RqV2iIXzMyBk9hU/3ph5E0jpGBG4hf6jng71IeDgjc6O1GGZ+cYUIbvuxGZOevSfz2
	SCm0FBQcaQjZQgbLC/L1sarF2ng+JzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778826808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC0Nqt7WqrDmBPZHV+7Mj9oTmyh+0G0FPDTNIyfRktY=;
	b=7iAc1iR7NRAMvhKf4canaecm+YbTIXcSbZTIobmTSxuWsgwoxzTXO87+o2O2erzoo87U43
	49gF1rX3ZC8KitBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 513E9593A9;
	Fri, 15 May 2026 06:33:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6NgVEji+BmqIPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:33:28 +0000
Date: Fri, 15 May 2026 08:33:27 +0200
Message-ID: <87o6ihuqq0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: Re: [PATCH RFT] ALSA: scarlett2: Add missing error check when initialise Autogain Status
In-Reply-To: <20260508033914.111596-1-robertusdchris@gmail.com>
References: <20260508033914.111596-1-robertusdchris@gmail.com>
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
	BAYES_HAM(-3.00)[99.98%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Fri, 08 May 2026 05:39:14 +0200,
Robertus Diawan Chris wrote:
> 
> When initialise new control with scarlett2_add_new_ctl() function for
> Autogain Status, scarlett2_add_new_ctl() might throw an error. So, add
> error check after initialise new control for Autogain Status.
> 
> This is reported by Coverity Scan with CID 1598781 as UNUSED_VALUE.
> 
> Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>

Applied now.  Thanks.


Takashi
