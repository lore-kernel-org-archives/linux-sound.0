Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0F533ADA0
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838071; cv=none; b=TdJnID2Hv017+x9V7JTUfJ+NBBXJpowUJCOH+J0wl93enbmLgqyA3XTxCV+7/Q1OtuEdMYSkJFpaGuKYEg7VPfC1y7YG9qTc+4F19nBqxo3uY94HRQfNEoCuLgkXU547RYCathyawS2fcN/OCmhDCfJvN9jsSVSREz0ox1L9iEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838071; c=relaxed/simple;
	bh=i9LWKUqEM1+CzlF1U6baaW5dXKoAdwze31t/Gu6q1QM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UERJU64+We3bKE/8IlgrTe2Yh7B16/wBph09BlZ1ERGLNZOzCYkGTwhe9/yIl9AETf6ekYBttRbvo4EaA7aS3jGm8V07yE1VH/evNuG/3/8E9uMjrvC1ISbd2nOkW+Gz7qjZMbx8Z18tCk+ia/233kR726rV5/qsKxRY1km5iC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pvus3pus; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PGnirmFf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pvus3pus; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PGnirmFf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pvus3pus";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PGnirmFf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pvus3pus";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PGnirmFf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BBA005BD44;
	Mon, 19 Jan 2026 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768838063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uq6sJ9xcHBtLVJS7k0ZqUGdjwT4huYOtofrIETXjbNM=;
	b=pvus3pusfxmT12CJGqkzCJP/nuLE9H//YpLguag07NdVvsZSf5c44u5ugFBIrS27CgdC9x
	GDhNOD4vOqtfo+FPh7CKbeFGMhvLkB0MEzukTKlQczWTqGCmfh8lruXQVXs7CB305984Y4
	255hWD+TsPldYJ1HALDASmyvRq0J4zQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768838063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uq6sJ9xcHBtLVJS7k0ZqUGdjwT4huYOtofrIETXjbNM=;
	b=PGnirmFfM8a/lDAOtHdjZoZbJpolCOwcU8VVVCr9hTub0iamex0plCxykgF6c5sAJJcZRA
	uzF0bOEycrzIfqDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768838063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uq6sJ9xcHBtLVJS7k0ZqUGdjwT4huYOtofrIETXjbNM=;
	b=pvus3pusfxmT12CJGqkzCJP/nuLE9H//YpLguag07NdVvsZSf5c44u5ugFBIrS27CgdC9x
	GDhNOD4vOqtfo+FPh7CKbeFGMhvLkB0MEzukTKlQczWTqGCmfh8lruXQVXs7CB305984Y4
	255hWD+TsPldYJ1HALDASmyvRq0J4zQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768838063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uq6sJ9xcHBtLVJS7k0ZqUGdjwT4huYOtofrIETXjbNM=;
	b=PGnirmFfM8a/lDAOtHdjZoZbJpolCOwcU8VVVCr9hTub0iamex0plCxykgF6c5sAJJcZRA
	uzF0bOEycrzIfqDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89F9B3EA63;
	Mon, 19 Jan 2026 15:54:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +bg9IK9TbmksVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Jan 2026 15:54:23 +0000
Date: Mon, 19 Jan 2026 16:54:23 +0100
Message-ID: <87y0lttx74.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Tim Guttzeit <t.guttzeit@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU
In-Reply-To: <20260119151626.35481-1-wse@tuxedocomputers.com>
References: <20260119151626.35481-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,tuxedocomputers.com:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 19 Jan 2026 16:15:55 +0100,
Werner Sembach wrote:
> 
> From: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> 
> Add a PCI quirk to enable microphone detection on the headphone jack of
> TongFang X6AR55xU devices.
> 
> Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Applied now.  Thanks.


Takashi
