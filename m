Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2964A127E18
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 08:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265226; cv=none; b=ZHw5RpDCC/knd7dFqIy3PiyCGM8YwX/2BnHyfHoav812N8CBhnH/rgYNHW6ODn6ZSrWI3u5UvUeHuqacTc318a9WeJfGaFQklO+rXWrEoYmPrc4/I38Ro/xSHvWOVc2bMhUX2T4ddGyc/iTIY2MH/b314zAFs647OLOhznyUCaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265226; c=relaxed/simple;
	bh=BFoQ1C9tJzHZjlB+05ONZXtvt6bqSOWP0/4aiVeFM6Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZAQtFAHfiQEaEOmZtdB9eRNiQ5C+xOEM1csjy2wCE7AjHlsQ9nOXwhwFG7PiBX4MikaMpLnQnDm9ZS0Vojqr9wgrVam222YHv9umtPWWj8SkY8BTNtW5IQDgciv3/kG+8bk8axD/XPMAFyAswmZFcTIoWxnupgA/01hiZCl/DqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B3RS++6T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ihnr5XOY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B3RS++6T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ihnr5XOY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B3RS++6T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ihnr5XOY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B3RS++6T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ihnr5XOY"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 649301FB9D;
	Mon,  2 Sep 2024 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725265222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1QNhMKDUK8yBNSYiHFOBzyoQXsr/TSM6sL+8rB/Zp8M=;
	b=B3RS++6TSeg7tgsRtQX1ZWGNSVn47WKjKhOImhFGLhNrpLJoiK9n/6506RjlYsyAaTy82C
	2NrU3XuMH8SJ9R86DNUdiFtI3j7xbUeuDT+8Alh5ys2Ol0SQpyaL2Y38JN1wBBiQYI1CUB
	6FANwXCWDGOTU1rX/fUshLXBR+MTz0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725265222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1QNhMKDUK8yBNSYiHFOBzyoQXsr/TSM6sL+8rB/Zp8M=;
	b=ihnr5XOYZALE6z953NVC86m1ARRvSpceJBfln9U9m2eBa3L/4Mam6oO3mzn7F4kmZUIFMg
	5egHqGHxwxQ1z+Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=B3RS++6T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ihnr5XOY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725265222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1QNhMKDUK8yBNSYiHFOBzyoQXsr/TSM6sL+8rB/Zp8M=;
	b=B3RS++6TSeg7tgsRtQX1ZWGNSVn47WKjKhOImhFGLhNrpLJoiK9n/6506RjlYsyAaTy82C
	2NrU3XuMH8SJ9R86DNUdiFtI3j7xbUeuDT+8Alh5ys2Ol0SQpyaL2Y38JN1wBBiQYI1CUB
	6FANwXCWDGOTU1rX/fUshLXBR+MTz0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725265222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1QNhMKDUK8yBNSYiHFOBzyoQXsr/TSM6sL+8rB/Zp8M=;
	b=ihnr5XOYZALE6z953NVC86m1ARRvSpceJBfln9U9m2eBa3L/4Mam6oO3mzn7F4kmZUIFMg
	5egHqGHxwxQ1z+Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2D0E613AE5;
	Mon,  2 Sep 2024 08:20:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VYS1CUZ11WbsPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Sep 2024 08:20:22 +0000
Date: Mon, 02 Sep 2024 10:21:08 +0200
Message-ID: <87o756ihzf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 0/4] ALSA/ASoC/hda: intel-sdw-acpi: add support for sdw-manager-list property read
In-Reply-To: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
References: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 649301FB9D
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Fri, 30 Aug 2024 10:41:01 +0200,
Bard Liao wrote:
> 
> The DisCo for SoundWire 2.0 spec adds support for a new sdw-manager-list
> property.  Add it in backwards-compatible mode with 'sdw-master-count'
> 
> The change is in ALSA tree, but SDW_INTEL_MAX_LINKS was introduced by
> commit b27404b2bbf9 ("ALSA/ASoC/SoundWire: Intel: use single definition
> for SDW_INTEL_MAX_LINKS") which was applied to the ASoC tree.
> Therefore, this patchset can only go via the ASoC tree.

Mark, feel free to take my ack for the series:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> 
> Add "ASoC" tag in the title to make sure the patchset will not be filtered
> out by ASoC.
> 
> Pierre-Louis Bossart (4):
>   ALSA/hda: intel-sdw-acpi: cleanup sdw_intel_scan_controller
>   ALSA/hda: intel-sdw-acpi: fetch fwnode once in
>     sdw_intel_scan_controller()
>   ALSA/hda: intel-sdw-acpi: simplify sdw-master-count property read
>   ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property
>     read
> 
>  include/linux/soundwire/sdw_intel.h |  2 +-
>  sound/hda/intel-sdw-acpi.c          | 33 +++++++++++++++++++----------
>  2 files changed, 23 insertions(+), 12 deletions(-)
> 
> -- 
> 2.43.0
> 
