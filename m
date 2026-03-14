Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1293D994
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773494967; cv=none; b=tATedzeoH37QpZeHKlbywAEFigkuJ2UR/tHNf4izHr/6OjJ+BkuPjVFTAvcktCA8Un/A7smUIrRPZnIOuICY8hZVEOGyDsATygUarrA+88nNhoKS9/PfovbjWMipB09OltfWxVlA63akJSZksoqReWW4D/1WedmV/L9glv79X8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773494967; c=relaxed/simple;
	bh=0DU8kTjhB81iG2tyS6fxbIhQZQgrccEU1DwsIqxUFjI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rYOeQn1haxbjz8yXudN5OH9HquQtdyugvsDemo1LxfPlmeZdEd+9iyewhtHDuA2yISFkYZkoy4gt8/pAJUOsc0hRA86ww/5xOHw0iPJhxTJpk0Nman/YQeUNXwoblAW7L0FugEv2IJWVbAQJ+3jF+W21G4siFrI0NGvnyoTt1eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DsExCYe/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r/gAWwz5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DsExCYe/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r/gAWwz5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DsExCYe/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r/gAWwz5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DsExCYe/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r/gAWwz5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6F2A34D31C;
	Sat, 14 Mar 2026 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773494964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIhHWuWqp1+3FbvAdEtZKMjMgJrFRMEv3NzdijKh75A=;
	b=DsExCYe/noaa40p3d0SY8qQPiKaEJpRz9CaD+thSDcQbrdC3rE1GcgCvBo+d5/cm+Cgo3S
	POJCjhbokn14N+N77wICHmp0lBsBanT5PAbIsewinLgvTQ4W7EGtnzo6HvgH/7xl7xdktn
	0NHtIJrMivGNZdkTcyVo0dMa/48gN1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773494964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIhHWuWqp1+3FbvAdEtZKMjMgJrFRMEv3NzdijKh75A=;
	b=r/gAWwz5Zs/VgI5+0Y8dy2SddEjzrqYtS/xssr7kVSTJueom693MgtAh/mTF2OKtVHRcXl
	HJ/n0u1mq2ihMdCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773494964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIhHWuWqp1+3FbvAdEtZKMjMgJrFRMEv3NzdijKh75A=;
	b=DsExCYe/noaa40p3d0SY8qQPiKaEJpRz9CaD+thSDcQbrdC3rE1GcgCvBo+d5/cm+Cgo3S
	POJCjhbokn14N+N77wICHmp0lBsBanT5PAbIsewinLgvTQ4W7EGtnzo6HvgH/7xl7xdktn
	0NHtIJrMivGNZdkTcyVo0dMa/48gN1A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773494964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIhHWuWqp1+3FbvAdEtZKMjMgJrFRMEv3NzdijKh75A=;
	b=r/gAWwz5Zs/VgI5+0Y8dy2SddEjzrqYtS/xssr7kVSTJueom693MgtAh/mTF2OKtVHRcXl
	HJ/n0u1mq2ihMdCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4102942724;
	Sat, 14 Mar 2026 13:29:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O9KkDrRitWndCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Mar 2026 13:29:24 +0000
Date: Sat, 14 Mar 2026 14:29:23 +0100
Message-ID: <87zf4aa6a4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: use kzalloc_flex
In-Reply-To: <CAKxU2N_YN+0k+EjLFvm+vHEwduGB2jn0A+t-4C-GH_MXmWHcKQ@mail.gmail.com>
References: <20260311232748.18697-1-rosenp@gmail.com>
	<87tsuld095.wl-tiwai@suse.de>
	<CAKxU2N8m1-4cP9J1A2Vmz+ZaZ7NGhcjEDm4YYjjzkmPAmGbUwg@mail.gmail.com>
	<CAKxU2N_YN+0k+EjLFvm+vHEwduGB2jn0A+t-4C-GH_MXmWHcKQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 13 Mar 2026 23:02:08 +0100,
Rosen Penev wrote:
> 
> On Wed, Mar 11, 2026 at 11:45 PM Rosen Penev <rosenp@gmail.com> wrote:
> >
> > On Wed, Mar 11, 2026 at 11:34 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Thu, 12 Mar 2026 00:27:48 +0100,
> > > Rosen Penev wrote:
> > > >
> > > > Saves one allocation by using a flexible array member.
> > >
> > > As it's a fixed size array, it doesn't have to be a flex array at all,
> > > so it can be even simpler.
> > That's true. The comment even admits as such. Wonder why it was ever a
> > pointer allocated with calloc...
> Oh no I see the issue:
> 
> sound/usb/mixer.c:#define MAX_ID_ELEMS  256
> 
> I don't think this is supposed to be in the header.

Why?


Takashi
