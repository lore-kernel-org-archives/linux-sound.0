Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461D9173357
	for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 05:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728971641; cv=none; b=Jiq0Zmabz6StMaVQb5UcnGWww3LHUtHTosmGqNeeuUEn/cp5sIDh6mr8KNUFzHVTcZUcKOM11T6tdvChnK7UKDEL8zp6NJjdue9S9fKyQNd3qakYkeGe6aR5B4IIg50V4geQe8Gnh4M8QMt25eRxc+HX8UXU2TBoiv1CdHke+sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728971641; c=relaxed/simple;
	bh=WlYwPz7MSs+ePIVcNMtm97GmxDe5ARpPUMI1kJcJVLk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rq2rO0/9nNOPK6FjD41oBe/3bVbmoiOB/9QZQ4f2/0GCrTOHpGMuy3gQyJj5cMp35tMPrDmJk+TKsrnQdIocZ1UHmnkKyz7wlL4RLu6qEGLY1ZYehv3SGVjA68JnG1fN1/Zu7CcquBUxCpJuprs2OvPIRDW+AA3MFtDD2y3OwiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iCKs3PD4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AqkEq6pW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=iCKs3PD4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AqkEq6pW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iCKs3PD4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AqkEq6pW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="iCKs3PD4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AqkEq6pW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 167E51FB5C;
	Tue, 15 Oct 2024 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728971637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVila3wJee4DpLQbrWKLPku/A/F2jjyF9VPaUOFbJAc=;
	b=iCKs3PD4ICz8hHV400G6QCR07bULrfGjm3hX+Mm24BQc6AdPMdL3nWmgCZNes0XSyfSqHw
	RJLraA8753XbICNdGgvw7dLuLvhP5BuUm6tbfIn/Tdd7cp4wqMLHq52QzMLD/vrzHoCLea
	bML4kkN41E8qTkv2kYuDm7vjFpuj7cM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728971637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVila3wJee4DpLQbrWKLPku/A/F2jjyF9VPaUOFbJAc=;
	b=AqkEq6pWTl4J+OMB+pLbZ79Ccr1/hTyXUl+QKkG9LXnaD6voCB7wzjvF/mVpehSi+hRuTc
	44x7VC7oBnBFnqBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iCKs3PD4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AqkEq6pW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728971637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVila3wJee4DpLQbrWKLPku/A/F2jjyF9VPaUOFbJAc=;
	b=iCKs3PD4ICz8hHV400G6QCR07bULrfGjm3hX+Mm24BQc6AdPMdL3nWmgCZNes0XSyfSqHw
	RJLraA8753XbICNdGgvw7dLuLvhP5BuUm6tbfIn/Tdd7cp4wqMLHq52QzMLD/vrzHoCLea
	bML4kkN41E8qTkv2kYuDm7vjFpuj7cM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728971637;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WVila3wJee4DpLQbrWKLPku/A/F2jjyF9VPaUOFbJAc=;
	b=AqkEq6pWTl4J+OMB+pLbZ79Ccr1/hTyXUl+QKkG9LXnaD6voCB7wzjvF/mVpehSi+hRuTc
	44x7VC7oBnBFnqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5104136C7;
	Tue, 15 Oct 2024 05:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rKF5MnQDDmd4YQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Oct 2024 05:53:56 +0000
Date: Tue, 15 Oct 2024 07:54:54 +0200
Message-ID: <878qupx64x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH RESEND 0/4] ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property read
In-Reply-To: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
References: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 167E51FB5C
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 01 Oct 2024 09:06:07 +0200,
Bard Liao wrote:
> 
> The DisCo for SoundWire 2.0 spec adds support for a new sdw-manager-list
> property.  Add it in backwards-compatible mode with 'sdw-master-count'
> 
> Takashi, this series can go via ALSA tree now.
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> Pierre-Louis Bossart (4):
>   ALSA/hda: intel-sdw-acpi: cleanup sdw_intel_scan_controller
>   ALSA/hda: intel-sdw-acpi: fetch fwnode once in
>     sdw_intel_scan_controller()
>   ALSA/hda: intel-sdw-acpi: simplify sdw-master-count property read
>   ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property
>     read

Applied now to for-linus branch.  Thanks!


Takashi
