Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3511865C
	for <linux-sound@vger.kernel.org>; Sun, 12 May 2024 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715507006; cv=none; b=V/QRo29N6ooxjGKS3xIXuXrPY6LX+1P5Cfw9ANJg8wQytlo2gmYwJNrNbmomgyPsS/jQC4r1cpRpZOXMU9JoqOgldJNbhqqJB4AJOzhV6vjydDk5nJG9IOtH46fWhMhZyYh7XiRo8ypEtQP+sFScP7MOTFIsd6b3KUgU9bwTApE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715507006; c=relaxed/simple;
	bh=zOu22TmL9YpfFpMlZUG5Fg2OiLYN58aGEbiJ9ft8SkQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fAlIBzeidkM3JJedEKjBCzkjGJHbSHIDgmqg9yMYRhzFDJZak9Z6EfxFkZHohYKEPu1a8BwbjCzaURLPo2dOWE2TQqd7gF6ycG1wv7h+vD7hieZUTu6HJmKi08KTuzX9UsqXeX0WLbx8lX9NFP0hMUu42VB6gec13mtbSIIg5is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i4SaIsXO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OX15F7lH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wIlh5Dxi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vnlNg8bH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i4SaIsXO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OX15F7lH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wIlh5Dxi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vnlNg8bH"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E49DD5D4B4;
	Sun, 12 May 2024 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715507002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cuG6z9FZCH5B8LkIh2oRLMNaSYhSqoVoihh/1thPFss=;
	b=i4SaIsXOGMom6xAAufoz4kOa1PHRMF/Ybep3XE44nfcKDKPlakJTAI60o05ZLV6BbiryrK
	xvBVJ6xUENm7Q0GpKm+njk3VDLYcyd51MrsFfTMrcvBFupqI36Xchidp+nc/FFUK4GFKnQ
	poAZNkiuJlqXWCt4h80LFDOwuyVBvjI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715507002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cuG6z9FZCH5B8LkIh2oRLMNaSYhSqoVoihh/1thPFss=;
	b=OX15F7lHC50tw1seTqrV1AQH5UMcsJivlDVnLsfp+p0QtCJ+TbhSLe6pBAuiNivJ3p8STz
	VXnQ1EBj9dhLYxAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wIlh5Dxi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vnlNg8bH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715507001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cuG6z9FZCH5B8LkIh2oRLMNaSYhSqoVoihh/1thPFss=;
	b=wIlh5DxiubRNCacDIQV+pnnP5+vOQg3beP6zjioqNhKIfUtLEPh9oqztnJMDsS8v4Clawz
	eaXSWPW+iiqkZSXRM5MO1hLDXyuOYGnp0PkMt+7nxze+ME/0gC1lovGnfGBlwDo70Iw6Oh
	aXyJ3blz6hhd0cl6I10fuBeptjurhWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715507001;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cuG6z9FZCH5B8LkIh2oRLMNaSYhSqoVoihh/1thPFss=;
	b=vnlNg8bH+0ER8kHRPtuT1Cn7QQEYkTPefvNcP/T2TEF/5GGtCgl7PVAbBYT8ymEpDMfJQY
	JFWWjBS+EqoGCUCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD74B13A3A;
	Sun, 12 May 2024 09:43:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NRm+LDmPQGYaLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 12 May 2024 09:43:21 +0000
Date: Sun, 12 May 2024 11:43:37 +0200
Message-ID: <87seyngyba.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: scarlett2: Add S/PDIF source selection controls
In-Reply-To: <Zj8zCTjzPsTDENN+@m.b4.vu>
References: <Zj8zCTjzPsTDENN+@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.23 / 50.00];
	BAYES_HAM(-2.72)[98.77%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: E49DD5D4B4
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.23

On Sat, 11 May 2024 10:57:45 +0200,
Geoffrey D. Bennett wrote:
> 
> Add S/PDIF Source/Digital I/O Mode selection controls for the Scarlett
> 3rd Gen 18i8/18i20 and Clarett 4Pre/8Pre interfaces. These models have
> both coax S/PDIF and optical inputs, and the optical inputs are
> switchable between being used as S/PDIF and ADAT inputs. The Scarlett
> 3rd Gen 18i20 also has a "Dual ADAT" mode for 8-channel audio at
> 88.2/96kHz.
> 
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Applied now.  Thanks.


Takashi
