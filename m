Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94EE54BD8
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 07:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685633; cv=none; b=joUDTt1uRYVXTA75dhYN0ZodiKXy/nsBcUMojw8WdU9nwczkx/GtpnWRWSoHQXxkSrjl6MER8eNhL+4WDwqyXuLsH/3ZzWGKyegELNfp5MAeqGNhqMy/I2xmixaF103UawZUS+Y0idiH1mBILWeyI3D4WUW97ZxYmCUGwjqmGhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685633; c=relaxed/simple;
	bh=yzLTiFtUgj0Qwa1q/04uK3A2dmLqf/L5kF7VFxpAMFQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZX+WgLhDjRfmUF3ilxnYmgMRvHH6rSU6BNf+Nwq4z8c+d3MmpYGgSJvsi6y1r0x0mvvAi63ouhYRHlULUkkTMrA9uzjNAzrRIjQl7YHuwsxtqI7ZnfGjYoMqP7yfVQ3b6MM83J7Wm8ckgbN/uBg2Gkns4yoRqUQNbySioODbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YMLXNmaX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D+tMe5r7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YMLXNmaX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=D+tMe5r7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YMLXNmaX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D+tMe5r7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YMLXNmaX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D+tMe5r7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2E81F1FB64;
	Wed, 31 Jan 2024 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706685630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPYoIGRrmG466krZcper7OhmAVGFAeZLiQ4s8WimoT8=;
	b=YMLXNmaXS4Ok8pTy6v5fj8n53VfYhOiO3RORVLFPnb/cI3KPyKEEsZhvZZxzD4f3dsCFHB
	387TWBO4aBcTzGmW/y/GJogJ5qpAo4XjZ/WTdScdKnqz5hUjV551nwBlAYXy7IN+5NHCGL
	stVMs+aDt7neuKUtTzuU7n0RWuoxfoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706685630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPYoIGRrmG466krZcper7OhmAVGFAeZLiQ4s8WimoT8=;
	b=D+tMe5r7tXvV+VNuiQ/PF5VBkJmO2yoalLmJiWnckUfIB6WPzHIGoTw+KCoooLUZTKdL+w
	UyzBA6eVTDe1FCCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706685630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPYoIGRrmG466krZcper7OhmAVGFAeZLiQ4s8WimoT8=;
	b=YMLXNmaXS4Ok8pTy6v5fj8n53VfYhOiO3RORVLFPnb/cI3KPyKEEsZhvZZxzD4f3dsCFHB
	387TWBO4aBcTzGmW/y/GJogJ5qpAo4XjZ/WTdScdKnqz5hUjV551nwBlAYXy7IN+5NHCGL
	stVMs+aDt7neuKUtTzuU7n0RWuoxfoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706685630;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPYoIGRrmG466krZcper7OhmAVGFAeZLiQ4s8WimoT8=;
	b=D+tMe5r7tXvV+VNuiQ/PF5VBkJmO2yoalLmJiWnckUfIB6WPzHIGoTw+KCoooLUZTKdL+w
	UyzBA6eVTDe1FCCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 032461347F;
	Wed, 31 Jan 2024 07:20:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oxXaOr30uWVkNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jan 2024 07:20:29 +0000
Date: Wed, 31 Jan 2024 08:20:29 +0100
Message-ID: <871q9y2cle.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] Apply headset jack fixup for alc287 thinkpads
In-Reply-To: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
References: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.84
X-Spamd-Result: default: False [-0.84 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.54)[80.67%]
X-Spam-Flag: NO

On Tue, 30 Jan 2024 20:25:36 +0100,
José Relvas wrote:
> 
> Thinkpads have a fixup for alc285 which enables headset media buttons, but not for alc287.
> This patch removes the chain to the X1 gen 7 fixup in the alc285 headset fixup, making it applicable for models without bass speakers.
> It then chains said headset fixup with every alc287 thinkpad fixup, making headset media buttons work for these laptops.
> 
> Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>

Thanks for the patch.  But the changes look too intrusive.  We don't
want to change the behavior of the existing quirk entries
unnecessarily.  Your change will break if anyone explicitly uses a
specific model option, for example.
So, please rather create a new entry for handling the headset jack and
use it (maybe better with some comments).

Also the patch isn't cleanly applicable.  Your MUA broke tabs and
spaces.  Please fix the setup, or use git-send-email.


thanks,

Takashi
