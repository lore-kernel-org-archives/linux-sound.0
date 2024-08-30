Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC0F157E62
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 07:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004519; cv=none; b=qoj6eKWBDJ1HQ7zF4qJtqwagIHvZMY638ZMzm4GiPQ5biAwGRElyl/mj3hl2bvzahxmwv674wDuRolYvfNMyjgaojj9sdmx6KpahD2mtuKkWAWw4gcZzt8XtO8csGDpFZ5i2PkWY0Bojje+EfyhGaVjHcvRiYCttv28TsXKlsxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004519; c=relaxed/simple;
	bh=dmdEXFy7q3ExCkGAoxoYxDBXZcIX/bKI+lABUVDiEFA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNgJd93X0G+AlW8juBn0ikKG6TcfMDJdBZHtUPghQ3qO7JO6EC/bBFxMYhWeWWu0t4YgIPTpFMrlicKu964MtUZN9K2MJ8S1UR/aoVnodIRH20QItYsstCohpsKXJsbQ/kldPQv56t7dxpcxArwyzRvD5md49rCFwfAchXAbMBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kcYrQ1Ww; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AlviRpP9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B92cQDk0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vtxOAwc6; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kcYrQ1Ww";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AlviRpP9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B92cQDk0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vtxOAwc6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 34CE81F7B0;
	Fri, 30 Aug 2024 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725004510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78Vwvtvqqkv2DK3G+7ECeIBISW3EktWFYGki5lCnfAw=;
	b=kcYrQ1Ww9ibgI+YULwz91ZCCUYBB5yzstqX7RmbpcUvsHylPnWSzdHwunGUJYPugMAWg2A
	YUXwMqknWueMLzQqrx/xjRp9sxke3zsvZykj1nhBFla+QBFDCWymk1ImIX/Kn8R6/o73Ix
	jpalmofTInlt4J2s3OZ9L8WRGQhv7ow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725004510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78Vwvtvqqkv2DK3G+7ECeIBISW3EktWFYGki5lCnfAw=;
	b=AlviRpP9JAqOcj9JbR1KM1ZB9P7iTyM/OITcLMGQUhuLzXQpTscAGXNoVE3CgkU26CPdNB
	GOHocxIFi/PfVaAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725004509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78Vwvtvqqkv2DK3G+7ECeIBISW3EktWFYGki5lCnfAw=;
	b=B92cQDk0VrVNpvYTU188+4Up9O6DOWhaS9PKhDUUKGcZPDT3p7wvG1CdAL42HwkZi0y/qK
	pN24w0E+S7Qlfy3b2plbJx33dDzHfU0Qlu9JPZ0cMczJye+KwbgyXDs9ou6DjFDuwi2OkQ
	v+YXIMitkqKtO0RRAY+WZvn/lrYPHYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725004509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78Vwvtvqqkv2DK3G+7ECeIBISW3EktWFYGki5lCnfAw=;
	b=vtxOAwc6VLdSRkvKZ600jdDlzeY/QzzYh8myUtBvfe7UlYykrDLV9toxsLFSOGWytNhnZx
	sTIOtMAE7mRqBDDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECDBC13A3D;
	Fri, 30 Aug 2024 07:55:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QdZaONx60WatagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 30 Aug 2024 07:55:08 +0000
Date: Fri, 30 Aug 2024 09:55:53 +0200
Message-ID: <87jzfyla0m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH] ALSA: hda: add HDMI codec ID for Intel PTL
In-Reply-To: <20240830072458.110831-1-yung-chuan.liao@linux.intel.com>
References: <20240830072458.110831-1-yung-chuan.liao@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 30 Aug 2024 09:24:58 +0200,
Bard Liao wrote:
> 
> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> Add HDMI codec ID for Intel Panther Lake platform.
> 
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Applied now.  Thanks.


Takashi
