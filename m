Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891813DCDA5
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604627; cv=none; b=bAaFs2iBskMpPccugoT7XqmlMIfQSIpOhI8z2YLz2JULvDmMTvDRSZWkrgLcydEPGB6KJsiu4jWvQpzW1ZALM6egn8u+lclpp+bk9N78rJHRDlQAOlVdiJ/ExhaBZypNLP5vdP+e+StlIoQh35yqDx0QKKBEVTRkqzB4Jyhs1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604627; c=relaxed/simple;
	bh=Qs5Ui6Bfo7DzUPwHq6F4wRDktqHS9boV6Jy3aiscKaM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VNhc8ct1hiefFdBAmpo5qdCdeKeAVuhdke1Xxur2CoiSlzzw73RGNrpdvPKh2yV6HUyxpHcdQnEgaG6nb5kJvGgS2r2fvA6TqVbYXqm2H5hB/jHrIAOGFzhTlfQzrPnu3WfxqYPjJsY114iRMIzP326NhYlJEDTGK6Le8Ng0CWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MNcbfUI9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QH70X99H; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MNcbfUI9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QH70X99H; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MNcbfUI9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QH70X99H";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MNcbfUI9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QH70X99H"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 34EAB5BCF9;
	Fri, 27 Mar 2026 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIb2mVkbm1udX8HH3VqtuZDi+OO3V+BfH1oM3pKmTIE=;
	b=MNcbfUI968XjuEz3wzAPSLbfip8Ek4HFt3t89luokiDAULksYiWeENqejH+6yDP7cUzntz
	FmsucMjN/m4f3lcIPN34KCOGQWNnQFfMLQT4EWowRySXi3DMPQOBIuuI87ONHPA4g45FHe
	RvxMiVReeAeuamAc4rir3ZNM2vzisXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIb2mVkbm1udX8HH3VqtuZDi+OO3V+BfH1oM3pKmTIE=;
	b=QH70X99HPji7CEYmtlR9BV8P+pmXi7FUaeNLOpy2EPUD1Lo0vKmReGrcEkAg8siviVd/Gx
	XVgyCxxhC59JsWCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604622; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIb2mVkbm1udX8HH3VqtuZDi+OO3V+BfH1oM3pKmTIE=;
	b=MNcbfUI968XjuEz3wzAPSLbfip8Ek4HFt3t89luokiDAULksYiWeENqejH+6yDP7cUzntz
	FmsucMjN/m4f3lcIPN34KCOGQWNnQFfMLQT4EWowRySXi3DMPQOBIuuI87ONHPA4g45FHe
	RvxMiVReeAeuamAc4rir3ZNM2vzisXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604622;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GIb2mVkbm1udX8HH3VqtuZDi+OO3V+BfH1oM3pKmTIE=;
	b=QH70X99HPji7CEYmtlR9BV8P+pmXi7FUaeNLOpy2EPUD1Lo0vKmReGrcEkAg8siviVd/Gx
	XVgyCxxhC59JsWCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1486B4A0A2;
	Fri, 27 Mar 2026 09:43:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o/2wA05RxmnKLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:43:42 +0000
Date: Fri, 27 Mar 2026 10:43:41 +0100
Message-ID: <87fr5lsj3m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Exclude Scarlett 2i4 1st Gen from SKIP_IFACE_SETUP
In-Reply-To: <acEkEbftzyNe8W7C@m.b4.vu>
References: <acEkEbftzyNe8W7C@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,b4.vu:email]
X-Spam-Flag: NO

On Mon, 23 Mar 2026 12:29:21 +0100,
Geoffrey D. Bennett wrote:
> 
> Same issue that the Scarlett 2i2 1st Gen had:
> QUIRK_FLAG_SKIP_IFACE_SETUP causes distorted/flanging audio on the
> Scarlett 2i4 1st Gen (1235:800a).
> 
> Fixes: 38c322068a26 ("ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP")
> Reported-by: dcferreira [https://github.com/geoffreybennett/linux-fcp/issues/54]
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Thanks, applied now.


Takashi
