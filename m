Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819952D0C90
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238562; cv=none; b=NZvPBuCbUnx9WYAD0MjIOWHNq6bsrYPVBIAgyodCkGEXODQklxrTTh/EF7+e3iowvl68klCcGrolUGIub53jehiPwCQrtZDT/hloXIeMOzAHOm94inOCryDgkuZF24KCdQDoG4JA4EZU8F4P+Bj7bYTqfG95baWk/TDdd9pzdBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238562; c=relaxed/simple;
	bh=EQu7wBySxG7+/WhUk22wQXBlvljYdtiqGSAUds5+BOw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZXSQG2nswqUoEe28z3LHRula2/bcIonr1/+jiBb2PzKbmLpf+go6Fe6+gzxXaUWITVhXd69Vbf0vLXPsuCgIVK0HIe+ujUh/19Trr7q/9Zv28iDsvlkFsGfrmZxVeZnTjv+bQQ3WWiFVpRJjP1TDwCnixNmCyDKh1BBPobavyrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h6Jo4FTa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S+m8ymD+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=da1cCZ4N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=osNoLcFE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h6Jo4FTa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S+m8ymD+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="da1cCZ4N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="osNoLcFE"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 713531F38C;
	Fri, 11 Jul 2025 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752238558; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmXCYAyFtg1uigJ3uDAA8K2DxJgcAvhj/LLi4GRz7A=;
	b=h6Jo4FTaMuClPwQPcIAn+unEYUVc2Wib6gIgRFhy6YXwEeZsq6HG3pqcl1gWH6pznGsZQd
	3govxCv/x/hsuengupaF5CUspuV6jgpMqUVDY2AVZ9XbesobKNSr7WDV+tbyH2J7Eb3nHs
	9WZczKMgSTIk+6P+9rpQhfb0SVpMxgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752238558;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmXCYAyFtg1uigJ3uDAA8K2DxJgcAvhj/LLi4GRz7A=;
	b=S+m8ymD+3ItcyNz5BHte89mNs3BdUUFdGXLyx5lNB3337OiMJywqjGJpoXQy0qtqzzatRt
	vmjHb3yd1B3uCVCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=da1cCZ4N;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=osNoLcFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752238557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmXCYAyFtg1uigJ3uDAA8K2DxJgcAvhj/LLi4GRz7A=;
	b=da1cCZ4NKWQCCdC63yPYwmCqWCfgJk0UuLOlfq6DHfbZA0Mar/ujUjpf8vzkDuz9xFdolT
	Fz2PRX7kD41uBMHMRk52Gz8OjnlheyInJGHV16LflX3phtmhpnAZe5ane11zEyhEKfu8PF
	/T4kplioTM8e57PMGm7bXc+90KzLkBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752238557;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmXCYAyFtg1uigJ3uDAA8K2DxJgcAvhj/LLi4GRz7A=;
	b=osNoLcFE2BXCj2Hme9aClfol1g8mRIpmtWCDA3L1tuEJg+AdK99RnGeb93TaZgmkm+r+jN
	4D6ppZVfO0zQi9Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CBE0138A5;
	Fri, 11 Jul 2025 12:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OBqnCd0JcWg+NQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Jul 2025 12:55:57 +0000
Date: Fri, 11 Jul 2025 14:55:56 +0200
Message-ID: <87zfdaga3n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,	Richard Fitzgerald
 <rf@opensource.cirrus.com>,	Kailang <kailang@realtek.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	patches@opensource.cirrus.com,
	Baojun Xu <baojun.xu@ti.com>,	bo liu <bo.liu@senarytech.com>
Subject: Re: [PATCH 00/27] ALSA: Reorganize HD-audio driver code
In-Reply-To: <20250709160434.1859-1-tiwai@suse.de>
References: <20250709160434.1859-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 713531F38C
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Wed, 09 Jul 2025 18:04:03 +0200,
Takashi Iwai wrote:
> 
> HD-audio driver is known to be quite messy in both file structures and
> its design, but until now I haven't touched its files paths so much
> because I set a higher priority for the easiness of backport to stable
> kernels.  But, you can't leave garbages forever, it's been already
> high time for a large clean up -- so here it is.
> 
> The basic idea is to move the code from sound/pci/hda/* into different
> subdirectories in sound/hda/ per functionality, as most of the stuff
> are independent from PCI, but rather HD-audio bus specific.
> 
> So, now the all HD-audio driver code are moved under sound/hda:
> 
>   % ls sound/hda 
>   codecs/  common/  controllers/  core/  Kconfig  Makefile
> 
> * The former hda core code is found in sound/hda/core.
> * The former snd-hda-codec code is found in sound/hda/common.
> * The former snd-hda-intel, tegra and acpi are put in
>   sound/hda/controllers.
> * The former patch_* and co are put to sound/hda/codecs.
> * Realtek codec driver is split to several modules as
>   sound/hda/codecs/realtek/alc*.
> * Cirrus codec driver is split to cs420x and cs421x, put under
>   sound/hda/codecs/cirrus together with cs8409.
> * HDMI codec driver is split to several modules under
>   sound/hda/codecs/hdmi
> * Cirrus and TI sub-codecs are put under sound/hda/codecs/side-codecs
> 
> Also, the probe of the HD-audio codec driver is moved into the
> driver's ops instead of the ugly patch_ops embedded in hda_codec
> object. (As of now, hda_codec_driver.ops is a pointer, but it can be
> embedded later, too.)
> 
> This change required some code to be modified without the dynamic
> override of callbacks.
> 
> In future, we may convert the runtime PM handling to use the standard
> pm_ops, too.  This was raised some time ago during the discussion with
> Realtek devs.
> 
> The tree applying those patches is found in topic/hda-reorg branch of
> sound git tree:
>   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=topic/hda-reorg

I merged this change to for-next branch now, destined for 6.17.

It means that there may be some merge conflict in future in linux-next
because of many file renames from sound/pci/hda/* -> sound/hda/*.
So adding Stephen to Cc.  The conflict resolution should be relatively
easy, though.


thanks,

Takashi
