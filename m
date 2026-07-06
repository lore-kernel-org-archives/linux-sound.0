Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5CB32AABD
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783326196; cv=none; b=Y9/z/zL837fqRfhRyQ6zmYDi6e0MtHxWDkSxZtoWU8XwnNfksjiqXGx9657zY3z4Pv5khNpoOkuO5mITXTwKgJ/cC4YhdcRV6lvehPmhQrzYD96XIxXionThCRkCDMTC6fi/Xgv351u3ZuLaUy3Fk56nO4lkoLkYPUV0qvOD8kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783326196; c=relaxed/simple;
	bh=ggWSg495QARFWXuJ07ATu3irqhA87hmDNgfXDAukCE8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OEJAcKoYNpalwiv7Zcak9sjzpAH5plrozf3qSqifH6ym/vnf5xvDDcFlf57cVsf0ydi0ZlYnAzFwBV//RpaqgBmSGG49Qu4AmdQOAbJBlQV63ZEdsm4U+f4cGvoUqlZahfq+aEOyQGNAtu9KtCQeTWoYgf/TouDp9DKJpwJQWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TEihPZrG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sOfdPnMI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TEihPZrG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sOfdPnMI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TEihPZrG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sOfdPnMI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TEihPZrG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sOfdPnMI"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 35FED75BBD;
	Mon,  6 Jul 2026 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783326183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzOR54iDpnjL5GUmK+hE4K4G+hVp5dEW750nsrSzzmo=;
	b=TEihPZrGX0bv7zW/vF5stLT6bTQUk8z01xZj9BL1FaCTXKLRA+gcEsbZ50TGsGJtzW5NNc
	0XBVMMyDzVcsHIdUkUZTEXp2/oCEL/Q7dvrft6cBpCN8of5xL3kunAkL+l4eJp7rtSUX2I
	BPyUrD+89HCWYA7GLqvebseVP32L5/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783326183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzOR54iDpnjL5GUmK+hE4K4G+hVp5dEW750nsrSzzmo=;
	b=sOfdPnMIaTP/wEFl//Ea1riBO+TyWeobf7Qyf0g8327K97wqRQlLDRZUlQItycWSqYaO3N
	px1S0Q6irpG7aIDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783326183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzOR54iDpnjL5GUmK+hE4K4G+hVp5dEW750nsrSzzmo=;
	b=TEihPZrGX0bv7zW/vF5stLT6bTQUk8z01xZj9BL1FaCTXKLRA+gcEsbZ50TGsGJtzW5NNc
	0XBVMMyDzVcsHIdUkUZTEXp2/oCEL/Q7dvrft6cBpCN8of5xL3kunAkL+l4eJp7rtSUX2I
	BPyUrD+89HCWYA7GLqvebseVP32L5/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783326183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MzOR54iDpnjL5GUmK+hE4K4G+hVp5dEW750nsrSzzmo=;
	b=sOfdPnMIaTP/wEFl//Ea1riBO+TyWeobf7Qyf0g8327K97wqRQlLDRZUlQItycWSqYaO3N
	px1S0Q6irpG7aIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05668779AA;
	Mon,  6 Jul 2026 08:23:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id J9vHOOZlS2oRKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 06 Jul 2026 08:23:02 +0000
Date: Mon, 06 Jul 2026 10:23:02 +0200
Message-ID: <875x2s5xy1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix imbalance per-channel volume of sticky mixers
In-Reply-To: <20260706-uac-sticky-channels-fix-v1-1-92741c538283@rong.moe>
References: <20260706-uac-sticky-channels-fix-v1-1-92741c538283@rong.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.959];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Sun, 05 Jul 2026 20:19:31 +0200,
Rong Zhang wrote:
> 
> I accidentally made an off-by-a-line mistake when mimicking other code
> paths that set all channels. The mistake breaks sticky mixers with
> multiple channels.
> 
> I didn't realize this mistake at that time, as my device's mixer is
> single-channel.
> 
> Fix it, so that per-channel volume of sticky mixers is balanced.
> 
> Fixes: aa2f4addab44 ("ALSA: usb-audio: Set the value of potential sticky mixers to maximum")
> Signed-off-by: Rong Zhang <i@rong.moe>

Applied now.  Thanks.


Takashi
