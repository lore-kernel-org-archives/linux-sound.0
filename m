Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525239;
	b=rexwrL/MW3StmK2+BMggyCXUD41oFMkePqUF8iovL8OodfnM8GV3rdnTxeUmCSCYWjsf
	 TVQn8FF9q4Vem0Y2iKqzh613i8Z5SRvi+RuOpF6QEeSV+3YKjKflUQToP2Mx218OkQTbq
	 LlJMo/j3vAskNThXyC9DKGCvF6q3S7E3p2GO+qR9aSP6b+g0poFCmAaQzCbBVMsFhtY/D
	 WlFo9oeBxA9aJw3UkJdLiXX8oQPXVN2uuC+1u+8LpevedwBt6MsuaaKZ+2QDbQNWWz5Zd
	 KxmNqBLC87EOCddAh7DaBX2FaVhRNqsYWl052wWet6BWyGXb5nsxA5sKIuN6cViyL4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525239;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=nkzhIlVWQN04iJowL4EshHbpM0IM+62UlPsuLLuJjUI=;
	b=AqG3hwLORR2qyxbzcl5B8reKItEC/ISst61i2Zml7nCyV9e/+hzNLg7d4VZ5vgCQWyQ6
	 4Q4FYCtLB5UCp0SEskepOrNhG8Fg3CtnsLBQlqjITA1NVQ9IUKziwILh8mwPxxnrWsBvk
	 AUxBdwgCA7MN28VNI59OLq2vqwxcLQlRGZomv5b0ANBJuW7jMKry4zbbLmj1t847K8AMv
	 Okh+zIlFKGxLsXXnzxljjzF1toM1fADP6oN5DaKsNkWjqfb3OVOFRCocs/CjO/7aSw69p
	 77WTbL174ug8fcHKrnnlxhD3ZRc30CtG8805Qpn18zTyt/0Fa4Q/4zE+pFc09OsvXKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c2f3UeyE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=y2ETfHKr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t7vNny9c;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=l0uMeA7c;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4716D606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 13:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4716D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=c2f3UeyE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=y2ETfHKr;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=t7vNny9c;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=l0uMeA7c
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 15C2B1F7BA;
	Tue, 24 Nov 2026 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795525237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzhIlVWQN04iJowL4EshHbpM0IM+62UlPsuLLuJjUI=;
	b=c2f3UeyET5vYmEOrtNVzB6kU/2S462tqG8T7UVb6AaHkI7OUgsSWA73ayiBLCJVzmXdkfx
	YrInxRlI5mEPJyKlCzj3n8LuN1epApA4ezWgg1iN4e4TW/gwsaNe+7HCmuWzQOS4XY4V3Z
	xnP4Heidj60REWZXG43qLXVIRK8SNSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795525237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzhIlVWQN04iJowL4EshHbpM0IM+62UlPsuLLuJjUI=;
	b=y2ETfHKr4C857go9/YhtmvDIgSyZkjY7Uvc3Qwh8nWDLHhSPUmy1TQtez4qe/Yj+zqflY0
	KjjbsICKdP4CARBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=t7vNny9c;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=l0uMeA7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795525236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzhIlVWQN04iJowL4EshHbpM0IM+62UlPsuLLuJjUI=;
	b=t7vNny9caL8eCvySiJFsM6RSr5sZO01N4f4ibZ+Fl/vAkh67bOwMUwSxBjXmWFCRuFoB5G
	regzk4eoMnZB3VGsVxrWxvtojJ7PQ5NHkWheihe75ZuLylIULHKgnRnQyuNJdj1j9A9y83
	7d9SgeaGTklx+Wd+CB4LqueRtzCPwlc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795525236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nkzhIlVWQN04iJowL4EshHbpM0IM+62UlPsuLLuJjUI=;
	b=l0uMeA7cYf9ThjvTB5e5ngLIJDU3wjht2T/Qa+ZfVindlWqzwTA+bpr+T5OAA8gqHSHrK5
	VwidtG3vzG/L3wBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA74C13505;
	Tue, 24 Nov 2026 13:00:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4U6sLnOKBWtIJQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 13:00:35 +0000
Date: Tue, 24 Nov 2026 14:00:31 +0100
Message-ID: <87mrqy9yfk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lord <mlord@pobox.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Cen Zhang <zzzccc427@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <E1C6473D-4008-405F-88B9-A5BE65D3B1C2@pobox.com>
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
	<b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
	<c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
	<87ik1ndgkp.wl-tiwai@suse.de>
	<0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
	<874id7d336.wl-tiwai@suse.de>
	<64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
	<874id6bdsx.wl-tiwai@suse.de>
	<E1C6473D-4008-405F-88B9-A5BE65D3B1C2@pobox.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,pobox.com:email];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,pobox.com:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 15C2B1F7BA

On Tue, 24 Nov 2026 13:56:23 +0100,
Mark Lord wrote:
> 
> You will have to be more specific about exactly what you want.  What commands to run, which files to view/return, etc.  I don't have time to guess. 

I also have no time to guess your system, either.
It's your system, and you're responsible for checking.

As said, the kernel logs are something interesting at first.
Get the kernel logs from both working and non-working cases -- at best
at closer versions.  If you have bisect result and last good and last
bad results, get the dmesg outputs from both, so that we can compare
1:1.


Takashi



> 
> Cheers 
> 
> On November 24, 2026 12:43:10 p.m. UTC, Takashi Iwai <tiwai@suse.de> wrote:
> >On Mon, 23 Nov 2026 18:51:47 +0100,
> >Mark Lord wrote:
> >> 
> >> On 2026-11-23 09:39, Takashi Iwai wrote:
> >> > 
> >> > Are *all* devices including both HD-audio and USB-audio gone in the
> >> > broken state?  You should look deeper and compare in more details
> >> > between working and non-working cases.
> >> 
> >> 
> >> I am using the Kubuntu Desktop, and the Sound Settings in the GUI
> >> show no devices whatsoever when it fails,
> >> and many devices when it works normally.
> >
> >When this happens again, check what fails actually in details.  Were
> >all kernel drivers probed?  You can compare the kernel logs between
> >working and non-working cases.  If they have been probed, have they
> >appeared in the device files?  Were permissions OK?  etc.
> >
> >
> >Takashi
> >
> >> That includes each of these:
> >> 
> >> HDMI/DisplayPort 1 Output (Meteor Lake-P HD Audio Controller
> >> Speaker (Meteor Lake-P HD Audio Controller Speaker + Headphones
> >> Digital Output (S/PDIF)(USB PnP Audio Device Digital Stereo
> >> Headphones Stereo Microphone (Meteor Lake-P HD Audio Controller
> >> Digital Microphone (Meteor Lake-P HD Audio Controller
> >> 
> >> Since none of those appear with the culprit patch in place,
> >> to me this suggest something is locking out the rest of the probing.
> >> 
> >> There's probably a better place to look for more clues,
> >> and I await instructions.
> >> 
> >> Cheers
> >> -- 
> >> Mark Lord
> >> mlord@pobox.com
> >> 
> 
> Mark Lord
> mlord@pobox.com
