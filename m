Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A5A199B8
	for <linux-sound@vger.kernel.org>; Sat, 15 Jun 2024 07:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718437402; cv=none; b=DyaGipDSLCmI++rZoSwgyM6pkAo+HVVwxj1nSSirFpeqbifEyJj0H/u96zQ6q9xxckDgWutCbpOClrxQUGNlEW/xrxgzpGWMIuWB5uj7Xqfs9ySxeksuAf4Nfg6ydVa7nGlu1Y21vKlnf457wKrLnqvSyW/4L/QeZ5PTC+cM7X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718437402; c=relaxed/simple;
	bh=2nC/vkOx5AwY/zV0ayqRmN9AczbUJdv38Og2NmSfbr0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BgDTjxpAJ4nzrUTFdqNoDViX3lbPl5LRPueotOvdBs4Xzt1G8L5rQpG9xOSspPsT30d7uVo/Z6HlrlGGXiSgtKw5bmA6LT1jN68Siw67ojPt5A/BbBBzFcgsaJeTR5oA2RkDt6efqY2A0gazaiifUq+nt5VwIb4zihHrhZ43r+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NvrFEAUF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SA6fGxWs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NvrFEAUF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SA6fGxWs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NvrFEAUF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SA6fGxWs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NvrFEAUF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SA6fGxWs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B4707340F3;
	Sat, 15 Jun 2024 07:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718437391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZosYvTQa9hWYIf677DJrslLo5GG+xrYM6BYtGilAqc=;
	b=NvrFEAUFSDW23i1xIktmHkMUurur3tVs6Vfy+5eqvRDVLTFd6908uxrP5gXQKkvcmEhsNi
	AacxFLSvw6lZmKqgdIcOYAOUGEy0Qf5Dcsq7WrztUaYrWDX10b4JsCQXn5VFGpkIIqVlNg
	+fGKg+fy6QH6ij3LbsgKyX2QDF8h6t8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718437391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZosYvTQa9hWYIf677DJrslLo5GG+xrYM6BYtGilAqc=;
	b=SA6fGxWssfKEx1saFNymsHQuxS5dhgrsQqkNUKgtXlqRsh+ASDEkstsdXv9TR/XwL/5qfB
	2Of14jYATkbNPGAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718437391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZosYvTQa9hWYIf677DJrslLo5GG+xrYM6BYtGilAqc=;
	b=NvrFEAUFSDW23i1xIktmHkMUurur3tVs6Vfy+5eqvRDVLTFd6908uxrP5gXQKkvcmEhsNi
	AacxFLSvw6lZmKqgdIcOYAOUGEy0Qf5Dcsq7WrztUaYrWDX10b4JsCQXn5VFGpkIIqVlNg
	+fGKg+fy6QH6ij3LbsgKyX2QDF8h6t8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718437391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZosYvTQa9hWYIf677DJrslLo5GG+xrYM6BYtGilAqc=;
	b=SA6fGxWssfKEx1saFNymsHQuxS5dhgrsQqkNUKgtXlqRsh+ASDEkstsdXv9TR/XwL/5qfB
	2Of14jYATkbNPGAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 90CF713AAF;
	Sat, 15 Jun 2024 07:43:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jZ6VIQ9GbWYtUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 15 Jun 2024 07:43:11 +0000
Date: Sat, 15 Jun 2024 09:43:35 +0200
Message-ID: <87y176647s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: benjamin maddocks <bm16ton@gmail.com>
Cc: linux-sound@vger.kernel.org,
	oder_chiou@realtek.com
Subject: Re: Sound issue on 6.10-rc3 snd_hda_intel snd_hda_codec_realtek
In-Reply-To: <CAMzLsRSVz2s1YXL54XXihohYEqknG6EeAPTGzXbU2R3-G7MkpQ@mail.gmail.com>
References: <CAMzLsRSVz2s1YXL54XXihohYEqknG6EeAPTGzXbU2R3-G7MkpQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 14 Jun 2024 22:50:17 +0200,
benjamin maddocks wrote:
> 
> Hello kind sirs,
>      I truly apologize if this is not the correct way to relay the
> following the information, please forgive me if so, trying to be
> helpful, not a problem.
> I have a gpd win 4 with a ALC245;
> Vendor ID:     0x10ec0245
> Subsystem ID:     0x1fdb0004
> Revision ID:     0x00100001
> 
> It works perfect on 6.9.4, but on 6.10.0-rc3 it loads with all the
> same info in logs as 6.9.x but now sound. The only way to get sound to
> work is to enter then leave suspend. Its enough to use pm_test with
> platform setting to get it working. Simply putting the device into/out
> of suspend is not enough. Things I have tried
> In case of order of operations issue I did the following silly things.
> Compiled kernel with acpi/power stuff builtin sound stuff as modules.
> The opposite with sound builtin, acpi/power as modules.
> Also tried blacklisting the sound drivers until fully loaded.
> None of these worked. So I copied the entire sound stack from 6.9 to
> 6.10 and the issue stayed the same. This is where Im confused who to
> contact because it seems a non sound issue in the sense of code but a
> sound issue in the sense of how it manifests. As I stated earlier the
> logs are all the same between working and not working except
> /var/lib/alsa/asound.state is missing the control.# sections.
> 
> And Ill end this with saying open source programmers are my hero's,
> and seldom hear from anyone about the work unless something goes
> wrong. So id just like to say thank you for contributions and hope
> many more will say the same.

Could you try to get alsa-info.sh output for both 6.9.x and 6.10-rc
kernels for comparison?  Run the script with --no-upload option and
attach the outputs.


thanks,

Takashi
