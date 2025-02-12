Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FD22040A4
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 07:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345271; cv=none; b=F0QovkR8e7OiGpG6vT05ukMR9FWdh/KSRLhdP5cyPUKm+Cb/ePzvAd8p/8LcdDfQe8+G34EJu9ETmO6+dZSfF2W1d4jyzHV43HQ1RN5iPFsI4rfUZu2M7F1UwPCbpbfxtCZvlq+nYJu+ubQV3vwZdPoQ1NdhndfZ5b2a165Wa1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345271; c=relaxed/simple;
	bh=Iph/hlnOouwb8lFk08QEfpJMJKP+e/wvR7Qi5Lk6xd4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7YLQ1/EGt+S+HRVfXK+kC2d5juur/k6xTCBFwUb2xWNjqrt5ptMiayJ3S5hk20XJaHoHr92JUq8E9SNrqSBQLjO4OjH2F9QiRQSFHdK8uPXP3TZkzzhA+BW2UEti+1t3iJnjBZdN5M9xb5xG/4Szg7gaQ5+9PzoR2J/sv5Oh2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v7bWenjp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kFZJufXc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v7bWenjp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kFZJufXc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v7bWenjp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kFZJufXc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v7bWenjp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kFZJufXc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B971D1FF19;
	Wed, 12 Feb 2025 07:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739345267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=v7bWenjpHAnNm5+qY873PuQjwJn2EGyqwbuIm6Km8FI5aOZtojWrB7cm8WJV+V/ylrC+ww
	hAiaSCW+/v6O8WTFOcs5xEYIJXu/bt5R5ypiF7IbTDlpaxFYL94RJYrKTSMwN3UASTyBM6
	pDJigtDsNKRW/FutR7BmfkKvZDlIBPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739345267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=kFZJufXchEry4sCr18asfm99g7JKFS6Vhe3oTiCn/MWuroz3+RU4j1UdhHj761KZO+5Efo
	ffylJM5via5VV0DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739345267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=v7bWenjpHAnNm5+qY873PuQjwJn2EGyqwbuIm6Km8FI5aOZtojWrB7cm8WJV+V/ylrC+ww
	hAiaSCW+/v6O8WTFOcs5xEYIJXu/bt5R5ypiF7IbTDlpaxFYL94RJYrKTSMwN3UASTyBM6
	pDJigtDsNKRW/FutR7BmfkKvZDlIBPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739345267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImmAqJDtxtPT/B4My6qRZkO4rZFgf9SVoU27wxXTllQ=;
	b=kFZJufXchEry4sCr18asfm99g7JKFS6Vhe3oTiCn/MWuroz3+RU4j1UdhHj761KZO+5Efo
	ffylJM5via5VV0DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93BB013AEF;
	Wed, 12 Feb 2025 07:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A7kyInNNrGczGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Feb 2025 07:27:47 +0000
Date: Wed, 12 Feb 2025 08:27:47 +0100
Message-ID: <87frkjmxl8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: "bugzilla-daemon@kernel.org" <bugzilla-daemon@kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	" (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Re: [Bug 219743] [REGRESSION, BISECTED] ASUS GA402XY Headset mic stopped working after 6.12.2
In-Reply-To: <0474a095ab0044d0939ec4bf4362423d@realtek.com>
References: <bug-219743-196757@https.bugzilla.kernel.org/>
	<bug-219743-196757-RLkOfxHF9E@https.bugzilla.kernel.org/>
	<0474a095ab0044d0939ec4bf4362423d@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Wed, 12 Feb 2025 07:55:20 +0100,
Kailang wrote:
> 
> Fixup headset MIC no function.

Applied now.  Thanks.


Takashi
