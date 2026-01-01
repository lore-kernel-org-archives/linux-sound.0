Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C951EDA2C
	for <linux-sound@vger.kernel.org>; Thu,  1 Jan 2026 10:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767261941; cv=none; b=hPowfdDHoIQgNdwP3W7cR2VR5F69T5F13mbTAG6vTHoRJwFx+xWLnT/sIKH11ERUgAOlTnM9AZ3VMybi8BE1NaSIFhfwMIohqwFmmiCAobmNqrbnu5FGaOQTdacbPH8RwrWuDgidmRiXA1H31KeUNR+ZuaErDSyd+Udyv4cdCkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767261941; c=relaxed/simple;
	bh=LK5vavosDmxOp2yAUHy3TdCXklRHWn8OWf4J5nr5qHc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uJFDLoMrH0xYaSMRZgtF+pOzN9dGRfxS6M6NXQkFh+bGeVin7gysECnkT1ed2j6AAYnXd0H/S8CLW7/5K8Ak/Nva8KwIPLjzb9rubuuS3vxmY6hss8N5M6LFARHzyJqXwayeGSO+Tgqy5QVO2DCdnA4mpyX88l+hBK4JbJ8IvRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xM8H5wCO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hjJ+96oj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xM8H5wCO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hjJ+96oj; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xM8H5wCO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hjJ+96oj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xM8H5wCO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hjJ+96oj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3EF5F33682;
	Thu,  1 Jan 2026 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767261937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2wL38ULj1v7ZBVK63mQi4hjkbTlxTSFnmoxdJKRTZc=;
	b=xM8H5wCOfvR7JKcd808OPOlq/ph9d9Jo2iy4LZ5VrWHhLUoXykoMEsSJzDR62h/z/HrWQJ
	K5VldOGH9TMQD1hjlSRoXpxNEuDxtpIPhbr/+S4/8sBxCAMpJwI2+6Lq9M0n8sP5kEcGL5
	BXkjSdvFG/QlR4dhzohZESOJb72I+R4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767261937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2wL38ULj1v7ZBVK63mQi4hjkbTlxTSFnmoxdJKRTZc=;
	b=hjJ+96ojUgS9MHDsHdPphAYB9n6NHUTeodYMkUH256Fa/e2vfXSMyYPdxGfIvcMdifz6Lm
	M2bsXIWzWoVWt2Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xM8H5wCO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hjJ+96oj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767261937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2wL38ULj1v7ZBVK63mQi4hjkbTlxTSFnmoxdJKRTZc=;
	b=xM8H5wCOfvR7JKcd808OPOlq/ph9d9Jo2iy4LZ5VrWHhLUoXykoMEsSJzDR62h/z/HrWQJ
	K5VldOGH9TMQD1hjlSRoXpxNEuDxtpIPhbr/+S4/8sBxCAMpJwI2+6Lq9M0n8sP5kEcGL5
	BXkjSdvFG/QlR4dhzohZESOJb72I+R4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767261937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y2wL38ULj1v7ZBVK63mQi4hjkbTlxTSFnmoxdJKRTZc=;
	b=hjJ+96ojUgS9MHDsHdPphAYB9n6NHUTeodYMkUH256Fa/e2vfXSMyYPdxGfIvcMdifz6Lm
	M2bsXIWzWoVWt2Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0ED271376C;
	Thu,  1 Jan 2026 10:05:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MfEdAvFGVmmQAgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Jan 2026 10:05:37 +0000
Date: Thu, 01 Jan 2026 11:05:36 +0100
Message-ID: <871pk9y7f3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Matou=B9_?= =?ISO-8859-1?Q?L=E1nsk=FD?=
 <matouslansky@post.cz>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add quirk for Acer Nitro AN517-55
In-Reply-To: <20251231171207.76943-1-matouslansky@post.cz>
References: <87h5t6y85o.wl-tiwai@suse.de>
	<20251231171207.76943-1-matouslansky@post.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.94
X-Rspamd-Queue-Id: 3EF5F33682
X-Spamd-Result: default: False [-2.94 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.57)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[post.cz];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[post.cz];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[post.cz:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Wed, 31 Dec 2025 18:12:07 +0100,
Matou¹ Lánský wrote:
> 
> Add headset mic quirk for Acer Nitro AN517-55. This laptop uses
> the same audio configuration as the AN515-58 model.
> 
> Signed-off-by: Matou¹ Lánský <matouslansky@post.cz>
> ---
> v2:
>  - Resend using git-send-email to fix whitespace/tab corruption.

Thanks, applied now.


Takashi
