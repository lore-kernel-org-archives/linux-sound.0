Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F528CF5D
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144393; cv=none; b=KhKZHHSINlbPq0wr+8S1y025bgqrEHPs7cZhAK+SdYQz+nX1N0S3vQZFloemntt+mlbfdmIunTHtnJylYXfu/p0YPUrqBhBSV+H1/ppYEMG8wRIlHvPBMeM5RXUC901TTt2ShemHBGJe8VFDcHSBVr+VPuDkVHep8HZgUo/m+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144393; c=relaxed/simple;
	bh=PO6laIiJkFnOfAynZpz+ut6HW+JfA5VCBxCqckCvCJo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mSHNSBjTwLk39OA9SicosprrtwTujNiTLyajZg3nvzRH6Wu88QL3UmeQkj/ZQpykU+KI+c5G8Sg5bbKygX+apBYiOtKyqTs/2vsKcms+Epv4sgha3f1Ku2dOgxZRlnrz9CfiHv51h+dmeuaEHz89f29bCiqnYNwtrbNAOOzXbNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z5UZVdXw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TFx2jcXc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qQhmTms+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yPp4kdxJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z5UZVdXw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFx2jcXc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qQhmTms+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yPp4kdxJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6DD4F3E6F;
	Wed, 19 Aug 2026 12:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787144368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AYHiLf0qYBxWtm89KGNpU13uUratwQsUXsJMvLKpjg=;
	b=z5UZVdXwcKMpsfDTqYGajTSbpZ1WkQfFvflyR2aJqAzsvtfkzb/E76aSdQm36Vy0jL4q/2
	OcQOlWqczYwETQjUEdp0bnHPkTNC4y6zySolPzxzTNcVOGLWAVRliNFfXIsX61zXqm7Ac4
	hMUZ0xHR36HITJGov4MxoIEw9B38rYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787144368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AYHiLf0qYBxWtm89KGNpU13uUratwQsUXsJMvLKpjg=;
	b=TFx2jcXcz8xxYjQ3myZKchvwm63hhaManyKvSP04p0zrv8okJC99iREuy9rNqJaau1E/Tr
	s9tSuNPAnxcxuSCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787144364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AYHiLf0qYBxWtm89KGNpU13uUratwQsUXsJMvLKpjg=;
	b=qQhmTms+65iGnm/pvJ7s0yrGyF81G6hRRr8Nc3zkMXAoA0ICoOE/s1bjbKJDs2xdetEhZX
	AL1tnmPPu1bQYF7pOfYPwXjsxB2z+TJTufSJZxhhJCTFR7HqlxyMKpMYSGg8X50tGDtlCf
	zvXYuj8FhM0fyJAzf2zd6aMCUm0ayeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787144364;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AYHiLf0qYBxWtm89KGNpU13uUratwQsUXsJMvLKpjg=;
	b=yPp4kdxJR6HJB6OvfE3ftyQ/c7mvMZYrO8Gcgs+uBtOUJ8p4EV0barX7856D1w4OZmhFoD
	FY3e2HV2p1Sdy0Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 065402F81;
	Wed, 19 Aug 2026 12:59:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0rYLOKuohWp7LQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Aug 2026 12:59:23 +0000
Date: Wed, 19 Aug 2026 14:59:23 +0200
Message-ID: <87fr0anu50.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Habil_Eren_T=FCrker=22?= <habilerenturker@gmail.com>
Cc: perex@perex.cz,	tiwai@suse.com,	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,	Habil Eren =?ISO-8859-1?Q?T=FCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt
In-Reply-To: <20260818133303.5102-1-habilerenturker@hotmail.com>
References: <20260818133303.5102-1-habilerenturker@hotmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,alsa-project.org,vger.kernel.org,hotmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 18 Aug 2026 15:32:43 +0200,
Habil Eren Türker wrote:
> 
> This patch adds a quirk for the HP Laptop 15-fd0039nt (SSID 103c:8bb6)
> to fix the micmute LED functionality.
> 
> The micmute LED is controlled via GPIO 0 with active-low polarity.
> 
> Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
> Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>
> ---
>  sound/pci/hda/patch_realtek.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index b0ee9b58e..1045bb3dc 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c

The file path indicates that you've created against a very old kernel.
Please provide a patch to the latest kernel (and check whether the
patch is still needed and it works as expected).


thanks,

Takashi
