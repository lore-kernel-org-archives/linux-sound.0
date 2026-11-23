Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426779;
	b=cImY0GVy/gBUbU94IN1snh981bkB1S0ivReYWiD51cmkogZBdOS2dv7mjna7gLVwwAIh
	 AOirdaaAvwsCtpA3hvTyLDTVNPInwmMMKpaReFFegRhS3gwqQ5DZMsGfX4qF70beXcjBW
	 eL+UyzW+RzpMsQd5PJH0Y2fbiU5uL0n8HtiHH82mOWMG1Qt5gIgWpErcmVGhM04/SLLzd
	 QbrF8AK5Hh3CoX0Klzh9nkDOiE5/whwOTnRWDY1R/kknaGIMijrSr3oQ57G/qivDTJCOv
	 MR0voqAU2Fvs+1XLjbUw+PQvTnUqolEbns05nUI7jcUn/UQaRhlMKNaLjs1sLzCQlnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426779;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=iSRINwxrhfauzic1WTm+CJJOkHB44ffIUlgyBaYGwAc=;
	b=GL72hMiblBPgKrmFQkoWAgYBPUSACakgJdS75JaLF7yUGIWZ6qsn2x7Gb5M1rjO3cK2W
	 yNnNddRcPhJg8Iivz+rDxBSITznj3Bi/hu8HJo3wABABLUOfSJ3RrYnHGlykjLjCzWy+f
	 6vz1N/D3zy/r8QZU9Q44bZNSzSgVFS7DgTxBsHorV22x8BBTlYN9rCh6Q0Rm3u9Ido5GH
	 K78m9NcnSh5HqOHNXtYzCTNlj+WGbeeGNB1LWh0CBD/f9TDQ8KLLGYUfPED2Ru5kVrCAt
	 aVajePwSjiPgrqwqObeOI8hfenuDkTHy7O9lTS42vVWkwlwZEtWuhBYaV0tb6SJV6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GRTzFWS+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="bqlRw/sX";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GRTzFWS+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="bqlRw/sX";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AB606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A2AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GRTzFWS+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bqlRw/sX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GRTzFWS+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bqlRw/sX
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C2F5F1F7E5;
	Mon, 23 Nov 2026 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795426776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSRINwxrhfauzic1WTm+CJJOkHB44ffIUlgyBaYGwAc=;
	b=GRTzFWS+Apv6IQCSbAY0qt50g7N5ZswdcuxDWaAeZPRfu8g3unsvQH/MIF6ujfgOyO4Ilw
	GgHBxHRSjMgeQ69dLhClb0cptaA2ENGfZI6VpXWz8/C35F3aZNciF/UzcAku/g/gNBeOMB
	+Dvcc4mgn0oZhF5vNhaWo2W3Vloc6Uo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795426776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSRINwxrhfauzic1WTm+CJJOkHB44ffIUlgyBaYGwAc=;
	b=bqlRw/sXsG1sPfiU36AVvjsM4hvYmXdEM/xdCQC6qBwjoLfg/QpWlj1dpc5Nvb4EBlLnH7
	TkhOGwF55d7SG5BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795426776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSRINwxrhfauzic1WTm+CJJOkHB44ffIUlgyBaYGwAc=;
	b=GRTzFWS+Apv6IQCSbAY0qt50g7N5ZswdcuxDWaAeZPRfu8g3unsvQH/MIF6ujfgOyO4Ilw
	GgHBxHRSjMgeQ69dLhClb0cptaA2ENGfZI6VpXWz8/C35F3aZNciF/UzcAku/g/gNBeOMB
	+Dvcc4mgn0oZhF5vNhaWo2W3Vloc6Uo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795426776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iSRINwxrhfauzic1WTm+CJJOkHB44ffIUlgyBaYGwAc=;
	b=bqlRw/sXsG1sPfiU36AVvjsM4hvYmXdEM/xdCQC6qBwjoLfg/QpWlj1dpc5Nvb4EBlLnH7
	TkhOGwF55d7SG5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8530F1352B;
	Mon, 23 Nov 2026 09:39:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +E4YF9gJBGsSLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:39:36 +0000
Date: Mon, 23 Nov 2026 10:39:36 +0100
Message-ID: <87jym3dgyv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Bentall <bentallea@gmail.com>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] Lenovo Legion Pro 7 16IRX9H: codec SSID 17aa:38cb also affected by speaker regression
In-Reply-To: <CACw1+JLf_0i+GvJ4POkFUrPo_AWNHp9X2aCxyQVFRcdrKbKVxQ@mail.gmail.com>
References: <CACw1+JLf_0i+GvJ4POkFUrPo_AWNHp9X2aCxyQVFRcdrKbKVxQ@mail.gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 22 Nov 2026 16:17:48 +0100,
Edward Bentall wrote:
> 
> 
> Hi Takashi,
> 
> I'm reporting another codec subsystem ID affected by the speaker
> regression discussed here:
> 
> https://lore.kernel.org/CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com
> 
> My laptop is a Lenovo Legion Pro 7 16IRX9H, product 83DE.
> 
> Hardware:
> - Codec: Realtek ALC287
> - Codec subsystem ID: 0x17aa38cb
> - PCI subsystem ID shown in the kernel fixup log: 17aa:3842
> 
> Kernels:
> - Works: 6.18.60-3-cachyos-lts
> - Internal speakers silent: 7.3.5-2-cachyos
> 
> On the affected kernel, the log showed:
> ALC287: picked fixup for PCI SSID 17aa:3842
> 
> Setting the following module option appears to restore the speakers:
> options snd_hda_intel model=17aa:38cb
> 
> The patch shown in the existing thread covers codec SSID 17aa:38cd.
> Could you check whether codec SSID 17aa:38cb also needs to be covered?
> 
> I have tested the model option workaround, not the proposed kernel
> patch itself.
> 
> Thanks!
> 
> --
> ~Edward Bentall

Thanks for the report.  Below is a quick fix patch.
Could you check it?


Takashi

-- 8< --
Subject: [PATCH] ALSA: hda/realtek: Fix regression on another Lenovo Legion
 16IRX9H model

There is yet another Lenovo Legion 16IRX9H model with the codec SSID
17aa:38cb that suffers from the same regression as stated in the
commit 0b4d69e8d2b5 ("ALSA: hda/realtek: Fix regression on Lenovo
Legion 16IRX9H").

Cover this device in the same way, too.

Fixes: f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on Lenovo ThinkBook X G2 IAH")
Cc: <stable@vger.kernel.org>
Reported-by: Edward Bentall <bentallea@gmail.com>
Closes: https://lore.kernel.org/CACw1+JLf_0i+GvJ4POkFUrPo_AWNHp9X2aCxyQVFRcdrKbKVxQ@mail.gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index dfdcf8b98c9e..f8bcdba23a07 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8592,6 +8592,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	/* Legion 16IRX9H shares PCI SSID 17aa:3842 with Thinkpad X G2 below */
+	HDA_CODEC_QUIRK(0x17aa, 0x38cb, "Lenovo Legion 16IRX9H", ALC287_FIXUP_TAS2781_I2C),
 	HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Lenovo Legion 16IRX9H", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3842, "ThinkBook X G2 IAH", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_4_THINKPAD),
 	/* IdeaPad Pro 5 14IAH10 shares PCI SSID 17aa:3843 with Yoga Book 9i;
-- 
2.53.0

