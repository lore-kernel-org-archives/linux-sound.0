Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499400;
	b=Wcy9se2RRMkT2YP4oO2WYrRb+DSLfpTJ9WnQdPY4M6VFDzg8NoviwC5PeU6kowHzCcwj
	 6RztB1UNzK9Kq62lA0wWOz01BQxDPa+soLMEAUY612eEp0btSbQmkS2Yy/WPsTToLhQu4
	 6+waWZzyogWZTvrUrrYHBr8D5dmloQl1JJxTuDZnPV1U5KQzIv+rFUsx0kq4W5Ed2yrRC
	 inSDcR83FmGbyIrAnnwv3Oz9FEn/+qykG3vYhgHYeU5lyWCqihZ67eROkjpMYUYHo+cbi
	 kn5YKRcpaAj+eUo4Dfkw1xWudde+qheet46Pq9U6tHW1ASICCEcvlMHXnVkr7+r2KZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499400;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 User-Agent:MIME-Version:Content-Type:X-Spam-Flag:X-Spam-Score:
	 X-Spam-Level:X-Spamd-Result;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=HHd6OcKo8+RKBK8jng0YHkJHFLCmzGw/IrjTGinJqKYjfR6iCQC0+yNwvzRlQ/3Gn+3H
	 lZrrlHrOcx0wRbMsNmdCHGx4uuS1dmlhpv4UZRl63eRAZy7gnxvg8BzT6SY66VilMGID5
	 it4G5mzmNGPWC3YaFLGGBZrunCq16NG60k3l5OPmXBYYe87XNva/KcI2hrOIawedWx61G
	 IyqsSb9rJY9VdGHr1PF3E7pQBsfgN+1YD8T+TlElIJZg2GQ31VVyrcF2g3W3UbIGhsQp6
	 UC6b3lSBKb0nmX/u9cmTM7cRPFuNlfAijtgobEbAaruSbSuWM/s4ViQsgj1YaCzxxMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9117606A31A
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 12:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9117606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=voTGvjRH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WBxh1J1U
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 25F4D21D9D;
	Tue, 20 Oct 2026 12:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792499393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=voTGvjRHpZL2o9qLY0AooD8DL9KbRF5bdbQBzTasi49qyImqrN+Tvgt1+k7L1xsJiP3iFm
	K2qFZc+s7jkIuq9D25iotVKbliT2jlAJL4mnuvxe1w6U5SneVchOITaj+z6NjYX53ABFBi
	jYp2NAVku/HRy/SN/gdR27EQSE8CO9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792499393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=WBxh1J1U+42mxawXt3zJQWIZYYe9ELLnqjnzj/cHgxxlaoSJJIIHKDo3m58z4KtPTS1Ndd
	DDWhdNx+Shvu35Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792499393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=voTGvjRHpZL2o9qLY0AooD8DL9KbRF5bdbQBzTasi49qyImqrN+Tvgt1+k7L1xsJiP3iFm
	K2qFZc+s7jkIuq9D25iotVKbliT2jlAJL4mnuvxe1w6U5SneVchOITaj+z6NjYX53ABFBi
	jYp2NAVku/HRy/SN/gdR27EQSE8CO9U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792499393;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=k6QoccHr1ileDqkYuy26FQAqHmbiQ5NJoqeTY5As/X8=;
	b=WBxh1J1U+42mxawXt3zJQWIZYYe9ELLnqjnzj/cHgxxlaoSJJIIHKDo3m58z4KtPTS1Ndd
	DDWhdNx+Shvu35Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BE8C7136CC;
	Tue, 20 Oct 2026 12:29:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PRXJI8Be12rPQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 12:29:52 +0000
Date: Tue, 20 Oct 2026 14:29:52 +0200
Message-ID: <87bj8oh7wf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: sashiko@lists.linux.dev
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
    linux-sound@vger.kernel.org
Subject: Enabling Sashiko for linux-sound ML
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

Hi Roman,

could you enable Sashiko reviews for linux-sound@vger.kernel.org?

In the audio BOF at the previous LPC, it was discussed, and people
agreed with the enablement of Sashiko.

The preferred configuration is author+list.


thanks,

Takashi
