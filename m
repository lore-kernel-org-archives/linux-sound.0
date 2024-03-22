Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99EE7E6
	for <linux-sound@vger.kernel.org>; Fri, 22 Mar 2024 11:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711107781; cv=none; b=NtmYycVX7CA9T9RaNNTAmitpzyrLUAqc4AWdurwMFCzlyaCMRUdWnLPx5PTyDdGuWLrgk1bpPmjP9vDrbYQk4C2Dmusk6TfV6e+S01ZsG2xMuNRu038Dmi9C7Obg3XWozh4xae8W5cZSkmWCp6e5BFiUK1drWMnX8HANq5Lf3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711107781; c=relaxed/simple;
	bh=KEf7AJgP49CriNF33PDaKitjypsXg5PyRJJ7ZNypu2U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XV43T4Aa9fCCowkmOGUz52FM8nV4m9WOuuU8iBpU5050M6+SnEHgsenOKvfFJsMOY0vr+SGnMAjBBFktcmzlRygGXa/od7WTSIlc5xEBzBAL5uGhjyYU9+9RyH9x9Zsm1KGxo9yE82Zq9eTP3EOvkiN22AhMfq5zJ3DLuLRUUiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pymcvaSo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xXFwnkof; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pymcvaSo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xXFwnkof; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pymcvaSo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xXFwnkof";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pymcvaSo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xXFwnkof"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9EC67384CD;
	Fri, 22 Mar 2024 11:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711107771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=pymcvaSosW92Fh5ANvXJSFBH8LHsPp6a32ov7lMzYK5cWmGHP+CNt21c/5go/1Z7JwY8f4
	TO86HHT3t1eQtTnKMGqwmb4kTV8NqOBW9AL/rPpCCZq5/xsaLnzohhDh/DVuMo+k0bRc3s
	Ke9zWDJgRzCZW51gAJErKnuEKrzZteo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711107771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=xXFwnkofBxqVyEt6jrKMiKBVmTSt00Dyf74QSM5Qv4RYdK4LMxE6ltDkfGtGd7BqMxz7n2
	SkE6PvDT8wf+lxCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1711107771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=pymcvaSosW92Fh5ANvXJSFBH8LHsPp6a32ov7lMzYK5cWmGHP+CNt21c/5go/1Z7JwY8f4
	TO86HHT3t1eQtTnKMGqwmb4kTV8NqOBW9AL/rPpCCZq5/xsaLnzohhDh/DVuMo+k0bRc3s
	Ke9zWDJgRzCZW51gAJErKnuEKrzZteo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711107771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/aYg0nfebMPFIQ4yCUCEPWZ7B66JawcBH7tjyHLwxYQ=;
	b=xXFwnkofBxqVyEt6jrKMiKBVmTSt00Dyf74QSM5Qv4RYdK4LMxE6ltDkfGtGd7BqMxz7n2
	SkE6PvDT8wf+lxCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 488D2136AD;
	Fri, 22 Mar 2024 11:42:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 65DKDrtu/WXscAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 22 Mar 2024 11:42:51 +0000
Date: Fri, 22 Mar 2024 12:42:51 +0100
Message-ID: <87plvmwkzo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	brent.lu@intel.com
Subject: Re: [PATCH 0/2] ALSA/ASoC/SOF: SSP dev_type support
In-Reply-To: <ca5cddbe-3ebb-4808-8fdc-767369cb1328@linux.intel.com>
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
	<ca5cddbe-3ebb-4808-8fdc-767369cb1328@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.89
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.89 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-1.38)[90.73%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com,intel.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pymcvaSo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xXFwnkof
X-Rspamd-Queue-Id: 9EC67384CD

On Fri, 22 Mar 2024 12:30:44 +0100,
Péter Ujfalusi wrote:
> 
> Hi Takashi,
> 
> On 27/11/2023 14:06, Peter Ujfalusi wrote:
> > Hi,
> > 
> > SOF always passed 0 as dev_type to intel_nhlt_get_endpoint_blob() when looking
> > up the blob from the NHLT table. This causes issues since alsa-utils commit
> > 3a47ef2487ed ("topology: nhlt: intel: support more device types and directions")
> > 
> > The dev_type is no longer always 0 in the topology embedded NHLT table resulting
> > lookup failures for analog codecs since they will have dev_type=4.
> > 
> > With SOF the dev_type is not used, we always use the SSP port index for looking
> > up the configuration blob.
> > 
> > The solution for the issue is to fetch the dev_type for the SSP port and feed it
> > back to the intel_nhlt_get_endpoint_blob() to be able to find the configuration
> > regardless of the assigned dev_type.
> 
> Can you take these patches via the ALSA tree, I have hoped that it would
> land in 6.9.

It seems like to be overlooked.  I applied those now to for-linus
branch.  But it missed the PR to 6.9-rc1, so at earliest for 6.9-rc2.


thanks,

Takashi
