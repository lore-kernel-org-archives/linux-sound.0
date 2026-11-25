Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615056;
	b=dB+gCtdVj5cluyvRAKJMcpufSpk3lWAZ3hSpBgVQ2ccsREeP5jjhWV28YxT9dP1Uh/J3
	 baA6uRfyX0Z6U4KL8oO3/iqupbOHj99xXVji1TZIDNGVxpE9wsho7/fBArWIHnanU4rBa
	 bgMXVYPjpLP7k0GbcBQ+p9ZuB9oPVaVRXtEUzQ6ZXWjzHfedQwjRUIbuvvbEJV/CYS6hX
	 XurAVmgq9xdjCGqBE+k3PxZU30LgRC2GXQxlPRTpq/5DvGyodFP82Fze4W4ns/ZWzaSMt
	 4w+RHCUTTYLagrdPh+YP0IvnrlvqCPKCD75ZXJbAJ2eFNj2NZ8c8jOIm4IpuvlM5Xkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615056;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=zuzDYFKf9GTIu+Jq28BlG9gDZ12amg0wuYiaR7H6aHw=;
	b=VO4OBH3+icerXf7Vp9UPOEPEFSuK2tUANDtYdiCA08jw8TM/j9+Xv+G5McS8uI1YVDAS
	 fZSArgw52ZF3sPPDrf/w7neqMr66rf2Z7lyB+A/8JjKJycmcXbiv3m6fT+UB1K97rQVqw
	 sPuzsLyZaLA3aq8KN+If7xyQwfjbiL5bOLq+jK/3adTCuucCBRoBlrpNhgkja3fjrb2sS
	 zlMR1KMHs4VMxClafISQLwhL4VcpHjLWv5onBlwTM0QKE4rQHenpG4Fr7njPn2qaTaBkM
	 qe3nYRQoYkyuMixmZig0yJbr+9hWCyST94Da2dTnWBw3sUwG7J/58xUF76nuMBm13gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ap5iIVEd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SurMUcu+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ap5iIVEd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SurMUcu+;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD4606A32A;
	Wed, 25 Nov 2026 13:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFD4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ap5iIVEd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SurMUcu+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ap5iIVEd;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SurMUcu+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23B231F7E1;
	Wed, 25 Nov 2026 13:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795615054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zuzDYFKf9GTIu+Jq28BlG9gDZ12amg0wuYiaR7H6aHw=;
	b=ap5iIVEdiDAMNhzMTQu9HBE2DmnJVIPXMbXn1PAN3RLjMZk9+O2Q7Mc3GG4WRJKZcXzmyN
	aNuweWdIryBfOgZdk0HSOOCzRsYC5QLxUSkf9KsiD8Hxi7GttH/JmN18Rm+Jk9Df7rZteD
	GobK7cZZvKyt5Mbfj8edzRLx2VtDZBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795615054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zuzDYFKf9GTIu+Jq28BlG9gDZ12amg0wuYiaR7H6aHw=;
	b=SurMUcu+ekfKaes9hMRi5JThOesStDzwzqeK8gI63539SAUTWAdn5+wLMhncP1Bz3kjcS8
	i+D1zwBRuJUcwzCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ap5iIVEd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SurMUcu+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795615054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zuzDYFKf9GTIu+Jq28BlG9gDZ12amg0wuYiaR7H6aHw=;
	b=ap5iIVEdiDAMNhzMTQu9HBE2DmnJVIPXMbXn1PAN3RLjMZk9+O2Q7Mc3GG4WRJKZcXzmyN
	aNuweWdIryBfOgZdk0HSOOCzRsYC5QLxUSkf9KsiD8Hxi7GttH/JmN18Rm+Jk9Df7rZteD
	GobK7cZZvKyt5Mbfj8edzRLx2VtDZBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795615054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zuzDYFKf9GTIu+Jq28BlG9gDZ12amg0wuYiaR7H6aHw=;
	b=SurMUcu+ekfKaes9hMRi5JThOesStDzwzqeK8gI63539SAUTWAdn5+wLMhncP1Bz3kjcS8
	i+D1zwBRuJUcwzCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B41AE1339F;
	Wed, 25 Nov 2026 13:57:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0HseJE3pBmstRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:57:33 +0000
Date: Wed, 25 Nov 2026 14:57:33 +0100
Message-ID: <87qzg96mk2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ALSA: pcm: Report writable chmap controls as variable
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-2-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
	<20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-2-1197ac8eacd2@oss.qualcomm.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 23B231F7E1
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,qualcomm.com:email,suse.de:dkim,suse.de:email]
X-Spam-Score: -12.51

On Tue, 24 Nov 2026 11:57:23 +0100,
Abel Vesa wrote:
> 
> The chmap control TLV always describes the maps as
> SNDRV_CTL_TLVT_CHMAP_FIXED, which tells userspace the channel order
> cannot be changed.
> 
> A chmap control that accepts writes exists precisely so userspace can
> reorder the channels. Report such maps as SNDRV_CTL_TLVT_CHMAP_VAR,
> so tools like alsa-lib expose the map as freely swappable.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Acked-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
