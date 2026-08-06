Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C4430568D
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 13:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022328; cv=none; b=ha19Xj/nMiBBqepA277ql+1GBqh8DfXALmEFlCLh29i5IV7v+R4YvJdUgVskZo82cT0EVI8Gt5GX4Dn24JA2qJIYS8ll9g5TzPtRJLvICwls148D/CLEQiOYH8AjUJgjDfAXIngA6TAxYULdVzwGN1efHpK7ZFjJZy+neZYFIS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022328; c=relaxed/simple;
	bh=/QW7gA0Kjfu4beTTRgEpHxt4hHSoQKUdHuaZrbNBp+4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVGeI5Y9K+CA+Gu4+PLYYUTFQ03+GjFcLQ049kpJUpuVGSO3CenfxhR4n+0HqS5uhOur3PsmbUy6CAbXcdqunz6JX7J9caSOkpxDB9ImAZ9fyS5bPzMJIRTu/UhHPu9nLdoABRbi89Fb9fLmXl5QVxgQxL5mJS6Lkn1d+WywS5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PXT4nQNy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yndxVbqk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=M/6nNdph; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3E8tn0sV; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PXT4nQNy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yndxVbqk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M/6nNdph";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3E8tn0sV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B84DA3E04;
	Thu,  6 Aug 2026 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786022310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/67Z4NiBH93rLEDlLGIUkLqX2a//2vJ0OqJHaD4iFjg=;
	b=PXT4nQNyGoHxFQIkDM6RR3ksIx8QLTX6y5+1Q+jGuQacB7FGNab4OqmmcnNVpJEUqieRlX
	lP7esxehTRI2XjV+sN+5c8x3vVchESOf1cz0wvUqPzBSsh7q+0ZSdv4+OwkfOR4e+VdoOD
	9PDspdKExXvL9ztvAopsEtniExOREEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786022310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/67Z4NiBH93rLEDlLGIUkLqX2a//2vJ0OqJHaD4iFjg=;
	b=yndxVbqkxPMXeYQVdAWI5dKMEv+Yba+RbwGXSdTdPmQErkuSQQE4GMR/+sVx7NZRCnIOP6
	kTkSWmHF9Fiw4zDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="M/6nNdph";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3E8tn0sV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786022306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/67Z4NiBH93rLEDlLGIUkLqX2a//2vJ0OqJHaD4iFjg=;
	b=M/6nNdphWusXCcqjv0t0I2tCd+gqB5TyYTkcpJtCW48U+/doZ8pS1+j8HET4eowAaLMIpf
	/EqWXG5bxcDVbpdjnn29I21P5Y1Mus2LUI6beY4p9bYZP9R44n5q5ZHjUrEnbMko377+d2
	vLiOSre34LmD4/9GrAE2msEy1XEFhIY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786022306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/67Z4NiBH93rLEDlLGIUkLqX2a//2vJ0OqJHaD4iFjg=;
	b=3E8tn0sVJpOWlqk4CkIdcNdYruVgWR7BI8KvhYZDjVQIhZ4Fq2ITpKrrDqLHrYFiEueGdi
	vvp/CzFuV+5DjhBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6EA3A779B6;
	Thu,  6 Aug 2026 13:18:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MQxaGaKJdGoWEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 13:18:26 +0000
Date: Thu, 06 Aug 2026 15:18:26 +0200
Message-ID: <871pcbe6al.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 31/31] ASoC: SOF: Use auto-cleanup for firmware loading
In-Reply-To: <c603df64-4f9b-4759-bc6b-ce4fbca4b499@linux.intel.com>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-32-tiwai@suse.de>
	<a06c0cde-e321-4fa6-9743-23bf9826edf6@linux.intel.com>
	<874ih7e9mb.wl-tiwai@suse.de>
	<c603df64-4f9b-4759-bc6b-ce4fbca4b499@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B84DA3E04
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,vger.kernel.org,gmail.com,linux.intel.com,nxp.com,linux.dev,amd.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 06 Aug 2026 15:04:33 +0200,
Péter Ujfalusi wrote:
> 
> 
> 
> On 06/08/2026 15:06, Takashi Iwai wrote:
> >>> -	fw_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
> >>> -				profile->fw_name);
> >>> +	const char *fw_filename __free(kfree) =
> >>> +		kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
> >>> +			  profile->fw_name);
> >>>  	if (!fw_filename)
> >>>  		return -ENOMEM;
> >>>  
> >>> +	const struct firmware *fw __free(firmware) = NULL;
> >>
> >> can we keep this at the head of the function?
> > 
> > We can, but for the auto-cleaned stuff, it's rather recommended to put
> > the declaration at the position that actually starts using it.  Then
> > you can avoid the unnecessary handling of the auto-cleanup.
> 
> The only mention I have seen is the header and it does say that one
> should avoid having the declaration and allocation split _if_ the
> pointer is not initialzied, or do it in one line.
> 
> Where it will get a bit blurry is when you have
> {
> const struct firmware *fw __free(firmware) = NULL;
> 
> ...
> ret = something_which_might_fail();
> if (ret)
> 	goto out;
> 
> ret = request_firmware();
> }
> 
> out:
> ...

Yes, and we hits this in a couple patches in this series, and the
workaround is to declare at the beginning.
(One can say that moving the declaration *is* helpful to catch such a
corner case :)

> > (I don't find whether it's mentioned, though; the documentation about
> > the auto-cleanup isn't well organized yet, unfortunately...)
> 
> OK, let's leave it as it is, my ack and tested tag still stands ;)

Thanks!


Takashi
