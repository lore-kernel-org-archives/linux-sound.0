Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC732A939
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710251382; cv=none; b=mgDNZyNjvzFnY6nrVJ/nRWln0W59Fr/Tf9PvLkrMSD1CHMLZ0PqJq7Sjp9olFYyIkLi3pjV5EqufK+wZyA/uUe25clc8WlPveJBxEFsx1IaNKGuY7jPo08/h5YNY4IThm0MCX1lqg9XFYfGOwCEBWwr4CigBOH5UAaDPnzQfmqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710251382; c=relaxed/simple;
	bh=3873azHVcES8OOeLL1DayMVxCvB0Jb9qPq+zDppu/iE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NzrPe/dP/pSkb031i/Be8ToX99WTnkLAt6nrDi1kPMTpaAGriPFjDWx2Hv721txfMgpsZjH/8VgNk7fpEQ7wWPmX+/Lg+Hjf/X76+TXewiNg9zlHHVK8z4//yJNfRZn4ecFDTIJ4hyGfDkF5q9D7iLGiDP9y1n8mS1zyC4oXBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I1G637O3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o8uSkeHT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=I1G637O3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o8uSkeHT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I1G637O3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o8uSkeHT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="I1G637O3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o8uSkeHT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9CE9C5D58D;
	Tue, 12 Mar 2024 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710251378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1jwp4EpyvWXPlNSGMWyGq/OvO6e2ikVIunxk1a7AFQ=;
	b=I1G637O3pxjhErPYpYo5wFhSAiCAPNIo8zYVhirS/pHhlmq4AQV/5yphv0AKg5siOBxf+Y
	J6xiNbvvvEFgXtEJdOXMCub4rjMsKpFDMsYqXlmjAjWD4GPCWeHZRf6XSvsGHTsdcHID/P
	GTtFQb/ol5tJfrXviBSxyBlGd9D/26A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710251378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1jwp4EpyvWXPlNSGMWyGq/OvO6e2ikVIunxk1a7AFQ=;
	b=o8uSkeHTWJBpYHwE59bmUqfngywCmA0mD8O+zpZ+IAbVgyK44SHki/BJrT7lut8MpcFFpU
	m/a7E3kqZ913sTBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710251378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1jwp4EpyvWXPlNSGMWyGq/OvO6e2ikVIunxk1a7AFQ=;
	b=I1G637O3pxjhErPYpYo5wFhSAiCAPNIo8zYVhirS/pHhlmq4AQV/5yphv0AKg5siOBxf+Y
	J6xiNbvvvEFgXtEJdOXMCub4rjMsKpFDMsYqXlmjAjWD4GPCWeHZRf6XSvsGHTsdcHID/P
	GTtFQb/ol5tJfrXviBSxyBlGd9D/26A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710251378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C1jwp4EpyvWXPlNSGMWyGq/OvO6e2ikVIunxk1a7AFQ=;
	b=o8uSkeHTWJBpYHwE59bmUqfngywCmA0mD8O+zpZ+IAbVgyK44SHki/BJrT7lut8MpcFFpU
	m/a7E3kqZ913sTBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89B591364F;
	Tue, 12 Mar 2024 13:49:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JQLsIHJd8GXPEwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 12 Mar 2024 13:49:38 +0000
Date: Tue, 12 Mar 2024 14:49:38 +0100
Message-ID: <87sf0v1rwt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Johan Carlsson <johan.carlsson@teenage.engineering>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Stop parsing channels bits when all channels are found.
In-Reply-To: <20240312133420.11289-1-johan.carlsson@teenage.engineering>
References: <20240312133420.11289-1-johan.carlsson@teenage.engineering>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=I1G637O3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=o8uSkeHT
X-Spamd-Result: default: False [-1.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.18)[96.10%];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -1.49
X-Rspamd-Queue-Id: 9CE9C5D58D
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 12 Mar 2024 14:34:20 +0100,
Johan Carlsson wrote:
> 
> If a usb audio device sets more bits than the amount of channels
> it could write outside of the map array.
> 
> Signed-off-by: Johan Carlsson <johan.carlsson@teenage.engineering>

Thanks, applied with Cc-to-stable and Fixes tag.


Takashi
