Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156DF55C1A3
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960041; cv=none; b=ApZmsB1swBY7iSsn6S13whB8lq2gXW6YOcqtTKALwPimaAOf2i769K54mUiujq/iaeY2YYkLzBBEjatl+RXsIIY9MSotY1CMMau2+lOBcJi4nAi+7JBVPEVS+jjM102SxAZ9JPHxrNHDyJzwL50d4e77EN6qkyxncfjQHW2RRzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960041; c=relaxed/simple;
	bh=32cuHm7fqKVjYu0WXu2amRA/5l2JTOsyv2Pu9VoluHo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y5TKP/8C6gU/NexLNCaZIkrVWAidCkRRobUhmukrlFpI3/Bj8yIO488/4QfJLi5eB/2ptdjcwCBbhmyNZBOhH+M8Y1aHDwLVl9S+PGvVa2C+QQR6GFNZAAJvHd2xtDkorkj6csngkFIZ7fdkACBj5FuYeclyLWK4/LKMWOtlkqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sGW0tkOb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cS0YXNEP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G0zRU+X8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ddhiUNqV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sGW0tkOb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cS0YXNEP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G0zRU+X8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ddhiUNqV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCC2D1FB27;
	Wed,  9 Sep 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788960034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8v1hbg+oYTlhSFd7uWMJne8mlXM3pxzuKsCj69+NPMI=;
	b=sGW0tkObOZkCnHQgKaDJfT0pVrcR/SXsRl6L4esOXSDM+BxqNC6nw9f2TAJRzUlQB+UdCK
	RL4S7LgZsTXaPuooE1DOjmF4RlwimwqYe0k1w5iFO6lyQYNptHJaOICfwhpqQcTMqp6Mvv
	5e8Xh4Wv+2fhzR2l53ExJMMDRR6PrHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788960034;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8v1hbg+oYTlhSFd7uWMJne8mlXM3pxzuKsCj69+NPMI=;
	b=cS0YXNEPa0UtXSSbeWDAwLbMIk9SX5ntqvwnObAEP/hDEq1mi/eKmHi0Imu5ga15TZKz9F
	/pU1APfGAEa+gZBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=G0zRU+X8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ddhiUNqV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788960029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8v1hbg+oYTlhSFd7uWMJne8mlXM3pxzuKsCj69+NPMI=;
	b=G0zRU+X8FOQxPtwxAI9OJC0SitEhGtbkq63fSG0kixdZfx2olkhvn/PwVRUqAnCesOxHTp
	cdZAhyt6UuxUjTOGnR5MeXGQjuKBjppDiMUsncngtvx1KjjjfsYXyTIceIvOjO42hqlM1s
	L29dlIjSwddhcTHZrcU7bbnNg3b/OjU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788960029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8v1hbg+oYTlhSFd7uWMJne8mlXM3pxzuKsCj69+NPMI=;
	b=ddhiUNqVyfBat3ROKP0Y3IKcGlUh2Ww76FVREihIt8y5IBU4fpeOO7IzYcmJ/BekGOSM1V
	sMHoZP/1uDuz7HAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C44013185;
	Wed,  9 Sep 2026 13:20:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8OHfJB1doWrMbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Sep 2026 13:20:29 +0000
Date: Wed, 09 Sep 2026 15:20:29 +0200
Message-ID: <871pb2o92a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.3-rc2
In-Reply-To: <ef950e391b7a5d9d8054cc53d4f88da1@kernel.org>
References: <ef950e391b7a5d9d8054cc53d4f88da1@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: DCC2D1FB27
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Wed, 09 Sep 2026 14:24:52 +0200,
Mark Brown wrote:
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.3-rc2
> 
> for you to fetch changes up to 7e125889f1705fc6326679a3db3b4159f7a8c87e:
> 
>   ASoC: amd: acp-da7219-max98357a: don't bind on Raven/Picasso boards (2026-09-08 15:59:06 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.3
> 
> An unusually large batch of fixes here, partly due to me not sending a
> pull request last week and partly due to Linus' fixes for the Ericsson
> systems.  I'm fairly sure he's the only user there so it seemed low risk
> to handle as fixes.  We also have a batch of error handling fixes from
> Cezary and issues with uninitialised stream_config->type from Shuming
> both of which had user error reports attached.  Otherwise everything is
> a fairly normal combination of quirks and device specific fixes.

Pulled now.  Thanks.


Takashi
