Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E0523E33D
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001852; cv=none; b=KwqFSryLf+sPVlN5cabpSKgI5mmBn56vGHlOHxLTO4uciXMiBoSwD1K6JbVDfV4hCN6Qm1sZnnzBnr+elm6EXWdChZ22fooUwh/F+ljNFhOVUZ3hhzhfIDOuFrt2iEBPubm9LS4jjaXxmlAA1/BYd/It7iLYr3babrnFPXWUfF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001852; c=relaxed/simple;
	bh=gpj4cuOC6tw70YyavU7rzy+pICpZkSaHbKh7tHEyDyc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ay5DG3lFd+zdWFMzWs51TsSV4P2gxOXO71n+Y5pH57+1JEljYoecIpUSwSXeqxdkuRfbZgzVofQprtVFG4bzIdcLUbYko26Gnrn3fLhXbpLLHo7ZkUpedbwmHllntnm5qJU4a0gOQyFHmjjjevnfF0lKGuhI25jfs5Pl5tCojIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1N+8mAaY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cCJHrV8S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kIsIgoiu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mHtJWzN0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1N+8mAaY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cCJHrV8S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kIsIgoiu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mHtJWzN0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B03E93DF6;
	Thu,  6 Aug 2026 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786001838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VedTbqq/4Ox4h7vG/j5S4pJJoqKliMJsVfLYJZ3CgdM=;
	b=1N+8mAaYAWGD4NLFH162VR5YlmMBIHCYJUagjMANFrpyVm1H2G6XeYtEZU5HGUJzpfiXY1
	aDXA1TuUt4EKzN6q6Inzd3QkWGPptuFOvqPIuNB34xihCE1BZ7osC67ubHqdyyPp52zcak
	fFoyRU4QQenGn9uPjTjzd4U+9hdd8uA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786001838;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VedTbqq/4Ox4h7vG/j5S4pJJoqKliMJsVfLYJZ3CgdM=;
	b=cCJHrV8SpDJOsezWT92c+XuUK9/FIB8ezBdsGQ2S3bKvs0JBJzH+cfkcv5nGHYmrERrNJd
	nwXhQWNyPpTT4zBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786001834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VedTbqq/4Ox4h7vG/j5S4pJJoqKliMJsVfLYJZ3CgdM=;
	b=kIsIgoiup1rvTjwuYeVgMkD1S2UmFirFXN9Pe2g/h5qxn7nYsJQqTRKafrFVBVmoyhORdy
	vq0ZKHSNi9Yrx65SqUq5YEn3U7dijd6mglLAvXbmHE1t/QtT0gYpNHZFwaXD7AndEOp2Lv
	tJgegFYkxMvOLBYDwzZGSllRyrl6+fY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786001834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VedTbqq/4Ox4h7vG/j5S4pJJoqKliMJsVfLYJZ3CgdM=;
	b=mHtJWzN0vo4ak7teLxvUl+yMNw++ZjpA0/18+6NZNKp9NqStXkHWsH3jmMSnWenSV8Rsje
	sKhW+zYaLboT8JCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 826A4779B6;
	Thu,  6 Aug 2026 07:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XDAIHqo5dGpjOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 07:37:14 +0000
Date: Thu, 06 Aug 2026 09:37:14 +0200
Message-ID: <87wlu3em39.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH 13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware loading
In-Reply-To: <bed1131f-59a4-4da7-994a-d1d5a6728603@sirena.org.uk>
References: <20260805135247.670693-1-tiwai@suse.de>
	<20260805135247.670693-14-tiwai@suse.de>
	<bed1131f-59a4-4da7-994a-d1d5a6728603@sirena.org.uk>
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,realtek.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 06 Aug 2026 00:56:23 +0200,
Mark Brown wrote:
> 
> On Wed, Aug 05, 2026 at 03:52:14PM +0200, Takashi Iwai wrote:
> > Simplify the code to manage the firmware loading with __free(firmware)
> > auto-cleanup.
> > 
> > Only the code refactoring, no functional changes.
> 
> > @@ -2170,6 +2164,7 @@ struct rt1320_dspfwheader {
> >  		goto _exit_;
> >  	}
> >  
> > +	const struct firmware *fw __free(firmware) = NULL;
> >  	request_firmware(&fw, filename, dev);
> >  	if (fw) {
> >  		fwheader = (struct rt1320_dspfwheader *)fw->data;
> 
> There's a goto further up that jumps over this which clang warns about,
> this will break the build.  Landmines like that are why cleanup.h warns
> about mixing it with goto.

That's an issue because I moved the declaration of the variable fw;
if it's left at the beginning of the function as it was, it should
work fine, like the patch below.  The same applied to the error for
wm2000.

If this is OK, I'll submit v2 series with the fixes for rt1320-sdw and
wm2000.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 13/31] ASoC: rt1320-sdw: Use auto-cleanup for firmware
 loading

Simplify the code to manage the firmware loading with __free(firmware)
auto-cleanup.

Only the code refactoring, no functional changes.

Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: keep the firmware declaration at the beginning of the function
  to co-live with gotos

 sound/soc/codecs/rt1320-sdw.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 3a5eebcfefdd..8d2d6697a502 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1786,7 +1786,7 @@ static int rt1320_r0_cali_put(struct snd_kcontrol *kcontrol,
 static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 {
 	struct sdw_slave *slave = rt1320->sdw_slave;
-	const struct firmware *patch;
+	const struct firmware *patch __free(firmware) = NULL;
 	const char *filename;
 	unsigned int addr, val, min_addr, max_addr;
 	const unsigned char *ptr;
@@ -1840,17 +1840,15 @@ static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
 
 				if (addr > max_addr || addr < min_addr) {
 					dev_err(&slave->dev, "%s: the address 0x%x is wrong", __func__, addr);
-					goto _exit_;
+					return;
 				}
 				if (val > 0xff) {
 					dev_err(&slave->dev, "%s: the value 0x%x is wrong", __func__, val);
-					goto _exit_;
+					return;
 				}
 				regmap_write(rt1320->regmap, addr, val);
 			}
 		}
-_exit_:
-		release_firmware(patch);
 	}
 }
 
@@ -1924,7 +1922,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 	struct device *dev = &rt1320->sdw_slave->dev;
 	static const char func_tag[] = "FUNC";
 	static const char xu_tag[] = "XU";
-	const struct firmware *rae_fw = NULL;
+	const struct firmware *rae_fw __free(firmware) = NULL;
 	unsigned int fw_offset;
 	unsigned char *fw_data;
 	unsigned char *param_data;
@@ -1977,7 +1975,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 			}
 			if (!retry && !(value & 0x40)) {
 				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
-				release_firmware(rae_fw);
 				return -ETIMEDOUT;
 			}
 			break;
@@ -1998,7 +1995,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 			}
 			if (!retry && !(value & 0x40)) {
 				dev_err(dev, "%s: RAE is not ready to load\n", __func__);
-				release_firmware(rae_fw);
 				return -ETIMEDOUT;
 			}
 			break;
@@ -2057,7 +2053,6 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 		}
 
 		regcache_cache_bypass(rt1320->regmap, false);
-		release_firmware(rae_fw);
 
 	} else {
 		dev_err(dev, "%s: Failed to load %s firmware\n", __func__, rae_filename);
@@ -2124,7 +2119,7 @@ struct rt1320_dspfwheader {
 	struct rt1320_dspfwheader *fwheader;
 	struct rt1320_imageinfo *ptr_img;
 	struct sdw_bpt_section sec[10];
-	const struct firmware *fw = NULL;
+	const struct firmware *fw __free(firmware) = NULL;
 	unsigned char *fw_data;
 	bool dev_fw_match = false;
 	static const char hdr_sig[] = "AFX";
@@ -2178,7 +2173,6 @@ struct rt1320_dspfwheader {
 
 		if (fwheader->sync != 0x0a1c5679) {
 			dev_err(dev, "%s: FW sync error\n", __func__);
-			release_firmware(fw);
 			goto _exit_;
 		}
 
@@ -2256,7 +2250,6 @@ struct rt1320_dspfwheader {
 		}
 
 		regcache_cache_bypass(rt1320->regmap, false);
-		release_firmware(fw);
 
 		if (!dev_fw_match) {
 			dev_err(dev, "%s: FW file doesn't match to device\n", __func__);
-- 
2.55.0

