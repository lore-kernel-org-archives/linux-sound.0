Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C101E8320
	for <linux-sound@vger.kernel.org>; Thu, 19 Feb 2026 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771495696; cv=none; b=bkUykn/pYV8izcQyql0MUTLZ5FsyiYzAvl7mti0kgJ4yojhO+zFVczcbNs5OHQebwYRUz9SC1u3JS7f9LZmdsrrHoIQB/2tQMi/2yJRNm83re47acfhBqABw/kmEyFMyKJt7QG/TAX1czXONynfqOf3VtCaiw4k414pboTKT2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771495696; c=relaxed/simple;
	bh=FrPpQ36l2OOwI/OSag8GElBWQmrh4tbtaDjbMoJLV94=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWLADM6EWnPEF+KW2yjuWrR264gusxgMHB8HS/BxZP1AS4+jZBGYAwwZ6UPymh7ayfR8F5PZftVfGheIXaLtNmtoD51C//Voc91Vx/Do9HMqL16cKA2+xOos8x8vf4D50tveNbuOdIcCYYwk2s+RDl9/Xh4h8/sNM+WKV+Q3xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fcVgySlg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9QoqZkl5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fcVgySlg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9QoqZkl5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fcVgySlg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9QoqZkl5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fcVgySlg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9QoqZkl5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8019D5BCC1;
	Thu, 19 Feb 2026 10:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771495693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrPpQ36l2OOwI/OSag8GElBWQmrh4tbtaDjbMoJLV94=;
	b=fcVgySlgfuDrFaZ2c0ibPeQvMCHX9dkVUtVsQeDtfAipcoLXmeJnZtzlNBkhqND/Sm3W0W
	oiaM99zUg0oUWujyBSzIievyKnEuc/YqsklqOUR7uWelMxu5yeajTMYCTcbICk98uixOnF
	wiWh9JgII0QZ9WpmZDa/xZPJP+6Gzr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771495693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrPpQ36l2OOwI/OSag8GElBWQmrh4tbtaDjbMoJLV94=;
	b=9QoqZkl5Qjke793/O5l0E7BcWdw7fHKOywcjVmE4tdTKHqTNxbInzTBkUsk92ZcotnEoxh
	dXdKlqZt6ZDyAbDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fcVgySlg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9QoqZkl5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771495693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrPpQ36l2OOwI/OSag8GElBWQmrh4tbtaDjbMoJLV94=;
	b=fcVgySlgfuDrFaZ2c0ibPeQvMCHX9dkVUtVsQeDtfAipcoLXmeJnZtzlNBkhqND/Sm3W0W
	oiaM99zUg0oUWujyBSzIievyKnEuc/YqsklqOUR7uWelMxu5yeajTMYCTcbICk98uixOnF
	wiWh9JgII0QZ9WpmZDa/xZPJP+6Gzr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771495693;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrPpQ36l2OOwI/OSag8GElBWQmrh4tbtaDjbMoJLV94=;
	b=9QoqZkl5Qjke793/O5l0E7BcWdw7fHKOywcjVmE4tdTKHqTNxbInzTBkUsk92ZcotnEoxh
	dXdKlqZt6ZDyAbDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 333BC3EA65;
	Thu, 19 Feb 2026 10:08:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o+IxCw3hlmnWVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 19 Feb 2026 10:08:13 +0000
Date: Thu, 19 Feb 2026 11:08:12 +0100
Message-ID: <87y0kpqc4z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v5] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <20260219094614.504459-1-cezary.rojewski@intel.com>
References: <20260219094614.504459-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 8019D5BCC1
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 19 Feb 2026 10:46:14 +0100,
Cezary Rojewski wrote:
> --- /dev/null
> +++ b/sound/core/control_trace.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM snd_pcm

It doesn't look like a right place?


thanks,

Takashi
