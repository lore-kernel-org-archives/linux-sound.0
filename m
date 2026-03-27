Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460F13DB628
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603726; cv=none; b=ige2sBYMVElaBM4x8qt0SPma4QX6k2y011OyXoutpddbH9O88EiwajktwrJmR+93GQ9vjeacN8r57ElDfZy+f+DhD/tEpT593ELiKspbR3YPODg2KQjU2RwbhPIqt/BOf+wCVnw3oNYS1fWrrl9mu6Fhl3bHtP+1yX1r/e4zivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603726; c=relaxed/simple;
	bh=Wup23EqsqUBGmlN+xSz7ZP/a9Ms0BHhSgmE73x33frA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQ/Xn+i3HND1tiirMo24akAk8ussvdbt1IgM8p88ENBAVaPtWbyELut+5Ajr2fQ9t5ZUXIokDJhIJuxBCL5XZygh/7vz+VDPfw4B/VqWzpeGqhn0aglLRnszlBc1QBFiYSLIEtVyJlF77qgVv6JFYC50d3zvUXIQvgIpgFyTL6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SZ06wvgP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vErqzCcl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SZ06wvgP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vErqzCcl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SZ06wvgP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vErqzCcl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SZ06wvgP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vErqzCcl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 69BF24D1C7;
	Fri, 27 Mar 2026 09:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcrewH5z9FS8+ekAChBZDLUhC+O5ZiSO50Cq00VK5p4=;
	b=SZ06wvgPb3aivvpJHn7rYlxdffxJiMwrzXFR+ZtDHeQBi/rnkPbx5iwNiK5azpbqZOTS2+
	G5zECv189a/hpCwrjRLg/E2t/RiGoB/TH0MNr/g5o10NNzWEgSHa6MG6JSLDdawrP3HwPk
	Ima0Glq+/YihVqxWlQMEramUfx2q2ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcrewH5z9FS8+ekAChBZDLUhC+O5ZiSO50Cq00VK5p4=;
	b=vErqzCclk5iQcDjRCE3FjJdEOwgpUFA/DFT/vYDR3VIfpqvs/SNds181WZfEKEmalfdKNu
	msujaRaWUhkfYaCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=SZ06wvgP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vErqzCcl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcrewH5z9FS8+ekAChBZDLUhC+O5ZiSO50Cq00VK5p4=;
	b=SZ06wvgPb3aivvpJHn7rYlxdffxJiMwrzXFR+ZtDHeQBi/rnkPbx5iwNiK5azpbqZOTS2+
	G5zECv189a/hpCwrjRLg/E2t/RiGoB/TH0MNr/g5o10NNzWEgSHa6MG6JSLDdawrP3HwPk
	Ima0Glq+/YihVqxWlQMEramUfx2q2ac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcrewH5z9FS8+ekAChBZDLUhC+O5ZiSO50Cq00VK5p4=;
	b=vErqzCclk5iQcDjRCE3FjJdEOwgpUFA/DFT/vYDR3VIfpqvs/SNds181WZfEKEmalfdKNu
	msujaRaWUhkfYaCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 430BE4A0A2;
	Fri, 27 Mar 2026 09:28:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KB0fD8tNxmkyHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:28:43 +0000
Date: Fri, 27 Mar 2026 10:28:42 +0100
Message-ID: <87pl4psjsl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	Chris Chiu
	<chris.chiu@canonical.com>
Subject: Re: Fix speaker mute LED for HP EliteBoard G1a
In-Reply-To: <279e929e884849df84687dbd67f20037@realtek.com>
References: <279e929e884849df84687dbd67f20037@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 69BF24D1C7

On Thu, 19 Mar 2026 09:19:49 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> HP EliteBoard G1a platform, the speaker mute LED failed to function.
> Attach patch will fix it.

Applied now.  Thanks.


Takashi
