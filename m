Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5153537E5
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 14:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236321; cv=none; b=RXCOMneSvWF/ZQ6Qns/SiulcpcFRmDL+bESAEKBtmL1ToCDF77u1JyJ9qgb73oJazBZi4c27fayw/AG+7MlYgoWUrOeppAKO9Ues/+jvoQG2iQto43O6a0ZpHtjssdsXBfCThYxNKXLsi5h/sYCtD88N5amFWfqAHTl2beBW20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236321; c=relaxed/simple;
	bh=hbZ8x6/INTVPIXQ7g/QPDnHAAiJpq+jgb50RyucpZ5w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K/wxOA0WO2uKmHanymuLCAj8vHWaGUNjb11UXrM+C/M3nbqqSY7FSmLPtYbednqI6gw8JT/Cjf40360jB9cgQBierPvcVKi3HV+kvN34xiAxHZofNagfGb2rd9qYbWylVnRgazaZE40fDwjDiMZq+iWFXTb/xigeE69s2GUXERs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0i5jU/lE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=te68kvwx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Kvyr80aH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dcqx7VDP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0i5jU/lE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="te68kvwx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Kvyr80aH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dcqx7VDP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B6043EB1;
	Thu, 20 Aug 2026 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787236313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9F80ksxXnN6sgW2JrE0j94FBuzDVxgnuENFaSqhfUEY=;
	b=0i5jU/lEVS5TeJovCVzA6iDKuO8iQjA8KpFVbNHJd59A/Z7mQtpKJnin674eytgs4WBazG
	fmBHfs7zqQ0/yA/liNAzapv7Hgh1h6peOfsNmnFqgc0OPRCo0A543sCkWqjEpuoNN7P7Z/
	4g5ozOS+EgD/3OtAAMPTp1Qy1/O2qBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787236313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9F80ksxXnN6sgW2JrE0j94FBuzDVxgnuENFaSqhfUEY=;
	b=te68kvwxLqnMuq/RzLus11BNWN0uWhMwvxZX+af95Ezk2qoqp6WmQ5N45ocQXdPerxSvl/
	N4lH5Elv3XhtKwBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787236309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9F80ksxXnN6sgW2JrE0j94FBuzDVxgnuENFaSqhfUEY=;
	b=Kvyr80aHFXY9OCDfyyGsipPjfnMiJS8lYUItq2RcX+3HtflQKVEMikVDmuVLHAP4VPCxEE
	cgM/05isCSsDJMgfcekz8Q1QLtbo2VhYP3ITn6Cg/hTGjPiAfe2ctZVb2kZ0mqwN1D/uHl
	YXCTsuo+z7o0QnZTfYpOORV0TUODBjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787236309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9F80ksxXnN6sgW2JrE0j94FBuzDVxgnuENFaSqhfUEY=;
	b=dcqx7VDPa0Ds5eCJbS/VXjjuwN7vBuLtMxoyFFR5J6v5eou9HktQ9McYLAm+gLtGK5GqXJ
	CpaTw/8qP9SB/WDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E20727A8;
	Thu, 20 Aug 2026 14:31:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MLs/FNUPh2obcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Aug 2026 14:31:49 +0000
Date: Thu, 20 Aug 2026 16:31:48 +0200
Message-ID: <87se48lv6z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: Linux-audio BoF at Linux Plumbers Conference?
In-Reply-To: <5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
References: <871pbsnce8.wl-tiwai@suse.de>
	<5f459099-4364-46f9-a3b4-1c629aa91209@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.987];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Thu, 20 Aug 2026 16:02:45 +0200,
Jaroslav Kysela wrote:
> 
> On 8/20/26 15:34, Takashi Iwai wrote:
> > Hi,
> > 
> > a few people including Mark and me have talked about holding a small
> > meeting for the Linux audio stuff (finally again!) during the next
> > Linux Plumbers Conference (on Oct 5-7 at Prague).
> > 
> > Has anyone already planned to attend there and is interested to join?
> > If we have enough people, we can try an official BoF session.
> > Otherwise, we can just have an unofficial session at lunch time or
> > such, too.  Just let us know.
> 
> Hi,
> 
> I will be attending Linux Plumbers and would be pleased to participate in
> a BoF session or another type of meeting.

Awesome, looking forward to seeing you again!


Takashi
