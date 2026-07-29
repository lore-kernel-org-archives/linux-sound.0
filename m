Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30035C180
	for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306770; cv=none; b=ase+KRW/1Icjre7WtLHccSYceE+VadokCq85gh2nqSZLiWpu9VV/LekR95fWfFkVNgkjAVw1GyX6JUj5mlKThMgyoUUykIWkd80QgGri2yQ8BV/tChF6+WrE+JXqdo+VErpICoHHfwNAueRoItzi3fgK48FOoWD20IDV+snrwUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306770; c=relaxed/simple;
	bh=V8I5Hw6cyqX+hAj/a2n5rB1kHSkM7YoxjWdxKxxOVeU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P+9bsImopa/+nIAMNnkJHY3IvThaRYH8hrX6N5aEk4tYTOHek08n7ksI3yBspNKnZfTgloLAYnDpYS30H3QJfWe8b8eFFiqQwyKzJoeKh56F9IRlVfWFNj4d9FQzezFgXZ6bByIA3Nf0eKcdCl4bP+HaJul3yln+6oTc2V6SxbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RKquqlv4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Siebpzlh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uIIPM9Uy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oJuG9u5j; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RKquqlv4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Siebpzlh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uIIPM9Uy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oJuG9u5j"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF5723E23;
	Wed, 29 Jul 2026 06:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785306763; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8eE/jXjkxerPQinDcWUVztpMiST6rkmpUGVPS1OXNI=;
	b=RKquqlv4DzIPFvMqwxQxw0qbX1+JbNKkKUmc3C9yQt7GxGI6QXZwX6CH9lbXcfb6aW+gAB
	yxDW6KPKt0WeC6UQca78Mtr7hR4jiD9CQGFoFcinDVz4uQmniG5brqQYfhNO2PCXQJsWI9
	IplYtgVHqulacymu9PfCrAohWQVAR+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785306763;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8eE/jXjkxerPQinDcWUVztpMiST6rkmpUGVPS1OXNI=;
	b=Siebpzlh0cmoFlhIDGJ2uaOHU3LKr7OsvRW927uO7QIr84r0Tu6+JJl5XUHEBHQzUJirc9
	AB5hH7Lh2a0jU8Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uIIPM9Uy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oJuG9u5j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785306758; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8eE/jXjkxerPQinDcWUVztpMiST6rkmpUGVPS1OXNI=;
	b=uIIPM9UyPAWRdSuiOUdvluJOPmzESR+r5ePj5pzU7CY9C/l7x0q2Mv2T+nugZE/Fj7TIJM
	+OVKUMn+yzphBdqm9C9JQTS9lCN4DA2Z+7HC1EHwPwBh8UC+qVi3hlQZ71IqOLTQ9Xx/R7
	tgKAfnHdm6fQWdqzrmhKWEk5iqAsJeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785306758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8eE/jXjkxerPQinDcWUVztpMiST6rkmpUGVPS1OXNI=;
	b=oJuG9u5jWg2demHqw0d/CrQkxUgW3IZlt7PO2l6OLt5D6JANZYQdriUWEDAjM9z3f+tpHA
	9BRz5neyup0SaVCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72A94779A1;
	Wed, 29 Jul 2026 06:32:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Mku9GoaeaWoQXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Jul 2026 06:32:38 +0000
Date: Wed, 29 Jul 2026 08:32:38 +0200
Message-ID: <87o6fq5mrd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Andr=E9?= Pragosa <pragosa512@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Kailang Yang <kailang@realtek.com>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Sean Rhodes <sean@starlabs.systems>,
	Chris Chiu <chris.chiu@canonical.com>,
	Lei Huang <huanglei@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Victus 16-e0xxx (MB 88ED)
In-Reply-To: <20260728221129.14680-2-pragosa512@gmail.com>
References: <20260728221129.14680-2-pragosa512@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BF5723E23
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kylinos.cn,realtek.com,gmail.com,starlabs.systems,canonical.com,cachyos.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Wed, 29 Jul 2026 00:11:25 +0200,
André Pragosa wrote:
> 
> Add subsystem ID 103c:88ed to the existing HP Victus 16-e0xxx
> mute LED quirk list.
> 
> The HP Victus 16-e0xxx with subsystem ID 103c:88ed uses the same
> mute LED coefficient configuration as the already supported
> 103c:88eb variant.
> 
> The mute LED was verified by manually toggling coefficient index
> 0x0b (bit 3) using hda-verb. After adding the quirk, the LED is
> registered as hda::mute and follows the audio mute state.
> 
> Signed-off-by: André Pragosa <pragosa512@gmail.com>

Applied now.  Thanks.


Takashi
