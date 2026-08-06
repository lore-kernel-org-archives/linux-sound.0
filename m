Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB323B27DA
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001904; cv=none; b=TT6jKwp7NgCXO/NuLamDQcn8Js5VQvgOfgvbfFRL/ECB41oU/D5ROwhhY8KKOEt8R2iMinMPKJ+HbZk5UTauBOVijpIu9LVpbfOckWrPpUC72HJKqsv2/SXPLffa/roc+b1izZ81ianDngITR0FlQsW2z6rgeiAW0TcpXgP3z+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001904; c=relaxed/simple;
	bh=pexHzGmjr9P1Z00chtDt7ITmeSs9FIHOebuEW2eaNYo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TmwFEZW5TBhEdAU5V29YegOxuPENIZdlqQqClkXzvgX440+wKEc0tRooa5Ohn5trilmdpGP/cqc0y2bscKb3y118Fk/bvOPSN7gOYaOUbiP0kp1Yh1nLqA6gke7hyUb/TqhEa22aQ9fvi6mgiqgWRJZSyoZ9YaMv3LeP3ud1MsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xRqRpGH0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3ufc+uJ5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AqYfRNXu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bQ+TG0LX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xRqRpGH0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3ufc+uJ5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AqYfRNXu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bQ+TG0LX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B96B83E05;
	Thu,  6 Aug 2026 07:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786001896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0/LUhYReOWE4HnuFiZqHDLh5zbXoo1NozQ3NZkfEtRE=;
	b=xRqRpGH0kis1Uv4llLEr8DXAfxsvp4ys+SdAURO9RBzTnasem4CVjoXVjFUp4uzqNjgh0o
	K9uoKrY97ag/zgfwXJp6zSggl5iGpe75ajK3bzNx5UyDfhrsVFSsh75A1hUNkF4nvGH110
	ld1VLIdxCGOR9he5HgTkdqqso+7Ms18=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786001896;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0/LUhYReOWE4HnuFiZqHDLh5zbXoo1NozQ3NZkfEtRE=;
	b=3ufc+uJ5vD5HSPv1WCsrSr7biUPt0VIaRvrOxExnwftDVooYc5WzYm744PhpMAd33kkhEu
	ZbRAB7Lkm1Il4hDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786001892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0/LUhYReOWE4HnuFiZqHDLh5zbXoo1NozQ3NZkfEtRE=;
	b=AqYfRNXuZobZBjC4wIE/kSJVdkPQ5jGgThjs1SUO0QMWx+f27qWL/E82n9EdoLyHFx0Nty
	kLJ2qg8nhaGMmhx9tSHyKAN+81dvABSoDTIrZvTi5DfYGI4VyL7TWOF8teyY0RrSqHyHId
	UdFI5z32tC18bW59vFLpla0+6cz+K+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786001892;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0/LUhYReOWE4HnuFiZqHDLh5zbXoo1NozQ3NZkfEtRE=;
	b=bQ+TG0LXtIaW1Tx4CK+t+My3X1LQPXLV9q68Il8/utNpvW5QTllOGDXqSgOf4Mo89H7KPE
	4N2CNcmCMS3ZvGBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96D88779B6;
	Thu,  6 Aug 2026 07:38:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JRChI+Q5dGo0PAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 07:38:12 +0000
Date: Thu, 06 Aug 2026 09:38:12 +0200
Message-ID: <87v79nem1n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 23/31] ASoC: wm2000: Use auto-cleanup for firmware loading
In-Reply-To: <81424cdc-58a7-46b3-9d38-d516ae160070@sirena.org.uk>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-24-tiwai@suse.de>
	<81424cdc-58a7-46b3-9d38-d516ae160070@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 06 Aug 2026 01:16:10 +0200,
Mark Brown wrote:
> 
> On Wed, Aug 05, 2026 at 03:52:24PM +0200, Takashi Iwai wrote:
> > Simplify the code to manage the firmware loading with __free(firmware)
> > auto-cleanup.
> 
> >  	for (i = 0; i < WM2000_NUM_SUPPLIES; i++)
> > @@ -876,6 +875,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
> >  			filename = pdata->download_file;
> >  	}
> >  
> > +	const struct firmware *fw __free(firmware) = NULL;
> >  	ret = request_firmware(&fw, filename, &i2c->dev);
> >  	if (ret != 0) {
> >  		dev_err(&i2c->dev, "Failed to acquire ANC data: %d\n", ret);
> 
> Same goto issue here.

Right, and the workaround is to keep the declaration at the beginning
of the function.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 23/31] ASoC: wm2000: Use auto-cleanup for firmware loading

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/wm2000.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 897b0acac5f3..41c8cfb346c6 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -796,7 +796,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 	struct wm2000_priv *wm2000;
 	struct wm2000_platform_data *pdata;
 	const char *filename;
-	const struct firmware *fw = NULL;
+	const struct firmware *fw __free(firmware) = NULL;
 	int ret, i;
 	unsigned int reg;
 	u16 id;
@@ -814,7 +814,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 		ret = PTR_ERR(wm2000->regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		goto out;
+		return ret;
 	}
 
 	for (i = 0; i < WM2000_NUM_SUPPLIES; i++)
@@ -908,9 +908,6 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 
 err_supplies:
 	regulator_bulk_disable(WM2000_NUM_SUPPLIES, wm2000->supplies);
-
-out:
-	release_firmware(fw);
 	return ret;
 }
 
-- 
2.55.0


