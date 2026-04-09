Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B0D306486
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719473; cv=none; b=rFKFhHz23bwU50H7Gj4P1U6laaB5cxhq3WpyBtss0xChzqoUMuwYW839yc25rkhKfmMjkylFU16VPUHqzMnyjRUvG0X1napGx420D8HZMe6SxHmKkbg8omiNXvYLSNrhv8LQHz7BvaOz0yFSZzFfuyEwIzjdT56dTLPJSLIMyc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719473; c=relaxed/simple;
	bh=sA4Aby4/BAOaXHSh2T9q4Cid1sMwPgmXpQsl6gaXEMc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sXxHBnKiZK7ej2Wn0WTbmj4CLK8Q6uWnrVg4QaaWKAPMdblZWT89FFwoZiEuUoEc/zVal6sIjlGgt6PyY49YcIJyk4+KUKG6irObox0X1cCPyqRtDbe190KbpkLD+BOPem7gUccnuvYmHJJNtwIVBXohtypJpEkMqFJvav8keQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NhdYCv8w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6GSPD3RX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NhdYCv8w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6GSPD3RX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NhdYCv8w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6GSPD3RX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NhdYCv8w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6GSPD3RX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 13C2F4EDF7;
	Thu,  9 Apr 2026 07:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775719470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsndEAYx6KxVTpDFgZBtRrmAEtTskSAbqFU+23+XoRA=;
	b=NhdYCv8wKivimWbnXQyrJj7iTTZ/9nxwxmNsl1lEZ+XF8S4ojk2qsOBM4GLiZYRy9EZN6J
	YiIlUB7kLgRaAJhCxCwkCkdQsE3Hpo2xTtRHRU9ZUL8T/1WRbAaoeWShkffmPB7Lfmq24I
	Cud+sbbXyoPxRTn6wcsLknE+ByLap7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775719470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsndEAYx6KxVTpDFgZBtRrmAEtTskSAbqFU+23+XoRA=;
	b=6GSPD3RX27w3IyDihX3O358N5hyNeX9G0YeVO0dgWrNR1p0rtXpWdNOfQx5VlcSxtTTBoG
	SZz1WADKFJ9AgtBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NhdYCv8w;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6GSPD3RX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775719470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsndEAYx6KxVTpDFgZBtRrmAEtTskSAbqFU+23+XoRA=;
	b=NhdYCv8wKivimWbnXQyrJj7iTTZ/9nxwxmNsl1lEZ+XF8S4ojk2qsOBM4GLiZYRy9EZN6J
	YiIlUB7kLgRaAJhCxCwkCkdQsE3Hpo2xTtRHRU9ZUL8T/1WRbAaoeWShkffmPB7Lfmq24I
	Cud+sbbXyoPxRTn6wcsLknE+ByLap7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775719470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsndEAYx6KxVTpDFgZBtRrmAEtTskSAbqFU+23+XoRA=;
	b=6GSPD3RX27w3IyDihX3O358N5hyNeX9G0YeVO0dgWrNR1p0rtXpWdNOfQx5VlcSxtTTBoG
	SZz1WADKFJ9AgtBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3D774A0B3;
	Thu,  9 Apr 2026 07:24:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bHx3MS1U12nXTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 07:24:29 +0000
Date: Thu, 09 Apr 2026 09:24:29 +0200
Message-ID: <87mrzck34i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
In-Reply-To: <f72b3ebd-a7f3-4a1a-a48e-bbbbb67b18de@kylinos.cn>
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
	<873414lnyf.wl-tiwai@suse.de>
	<f72b3ebd-a7f3-4a1a-a48e-bbbbb67b18de@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 13C2F4EDF7
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 09 Apr 2026 09:00:59 +0200,
Zhang Heng wrote:
> 
> 
> >> +		alc_update_gpio_data(codec, 0x03, true);
> >> +		msleep(100);
> >> +		alc_update_gpio_data(codec, 0x03, false);
> 
> Is it possible to make these lines into another auxiliary function? I think so.

I had something like below in mind.  This can be applied to clean up
many existing code.

With that change, the fixup becomes

	snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x03, 0);
	msleep(100);
	snd_hda_codec_set_gpio(codec, 0x03, 0x03, 0x00, 0);

without setting spec->gpio_* fields.


Takashi

-- 8< --
diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 5d9f0ef228af..cb1755d535f9 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -470,6 +470,10 @@ void snd_hda_unlock_devices(struct hda_bus *bus);
 void snd_hda_bus_reset(struct hda_bus *bus);
 void snd_hda_bus_reset_codecs(struct hda_bus *bus);
 
+void snd_hda_codec_set_gpio(struct hda_codec *codec, unsigned int mask,
+			    unsigned int dir, unsigned int data,
+			    unsigned int delay);
+
 int snd_hda_codec_set_name(struct hda_codec *codec, const char *name);
 
 /*
diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 5123df32ad89..6eb11e933606 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -4053,6 +4053,29 @@ void snd_hda_bus_reset_codecs(struct hda_bus *bus)
 	}
 }
 
+/**
+ * snd_hda_codec_set_gpio - Set up GPIO bits for AFG
+ * @codec: the HDA codec
+ * @mask: GPIO bitmask
+ * @dir: GPIO direction bits
+ * @data: GPIO data bits
+ * @delay: the delay in msec before writing GPIO data bits
+ */
+void snd_hda_codec_set_gpio(struct hda_codec *codec, unsigned int mask,
+			    unsigned int dir, unsigned int data,
+			    unsigned int delay)
+{
+	snd_hda_codec_write(codec, codec->core.afg, 0,
+			    AC_VERB_SET_GPIO_MASK, mask);
+	snd_hda_codec_write(codec, codec->core.afg, 0,
+			    AC_VERB_SET_GPIO_DIRECTION, dir);
+	if (delay)
+		msleep(delay);
+	snd_hda_codec_write(codec, codec->core.afg, 0,
+			    AC_VERB_SET_GPIO_DATA, data);
+}
+EXPORT_SYMBOL_GPL(snd_hda_codec_set_gpio);
+
 /**
  * snd_print_pcm_bits - Print the supported PCM fmt bits to the string buffer
  * @pcm: PCM caps bits
