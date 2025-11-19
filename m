Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458632D5937
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567097; cv=none; b=lb36OZaD282wsfwGWZ6J0B0/X9My5RqvkLvsIgsPrtlHagzqrXHJ2rfl71WQqma4H01nqgGw6R6fPZcwsJ8xtYHbFi74dBLeTItjPip6sndu50LDS/K7s0Twr6jit+h6mIl6VpAYE83O8w19xNZcbWKwlIe4g/Glt/SMb4Cb+xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567097; c=relaxed/simple;
	bh=idOM5o09IEcQa5xSwGMTPhUKFlqN87qVVaMCB4/eH9Y=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPPHrUEn3CGI5z+Ko+Ub38m08zqZzViX/oG28QbirbVwgzxlP2zXg4NYShxEj5faDDQ3grgOYCvDrO/CWe22erIMAHp6CkfWGpgfC/n5z9lJzgvTHQ3WTQ/34U3C01D29DEIoIHdMcQ2hahOt71MT73AeGmBYwcrUIrwfiU9ia8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nokGB0zJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=h2pUmVRe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jYzVZAfG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AVdj2fgd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nokGB0zJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h2pUmVRe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jYzVZAfG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AVdj2fgd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5D7F4219A5;
	Wed, 19 Nov 2025 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763567088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ed39noSF1lB+ngd518KVQG0GTuKFYO5PHWSnYylBd48=;
	b=nokGB0zJKhH6XqG9hCfaeJ14TrcwFRN3TEkZtC21qCJTQs53rESebkTNBF4/yn453+VYJt
	C6f1lW1PRZVsWItEMUlCGvZ9CWjCZ1euKFclgx9jm7uSNiFngEFbB5ay1++uHW083rBf8w
	m0J9DwOYCO6j/B1+0iQ7x4grem2WFro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763567088;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ed39noSF1lB+ngd518KVQG0GTuKFYO5PHWSnYylBd48=;
	b=h2pUmVRedsxywmpTZF7Xug5i2x3+rdwbMYSyyjNxVmoyNmkAPIeJyAJiYVshk9dEo0MeJZ
	aKk3nAMWjrdH4vDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jYzVZAfG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AVdj2fgd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763567083; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ed39noSF1lB+ngd518KVQG0GTuKFYO5PHWSnYylBd48=;
	b=jYzVZAfGt4WkJjBK8K8DMW/kdjacCeF3YPMWgYRTzkT/6RPMmboqmpJezA7y+p4F5GPVlh
	jcXgaICGOR+9t167LbfO/dj1iNh9pctCCnHefrvBdf/m1lKJ8DXlowsc+3UwEs1A6V3QLM
	AjbXyYlFJrP6TQF3QyWoWRA+ZVgYkg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763567083;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ed39noSF1lB+ngd518KVQG0GTuKFYO5PHWSnYylBd48=;
	b=AVdj2fgd53vTzYlO4wKHqxP3bky0S87benM1mWXgzIncg65MU6Q9Myndbvfw6sWsNRMb6+
	NO/nAvLBNsQaiQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 40DE63EA61;
	Wed, 19 Nov 2025 15:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HDikDuvlHWmrPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Nov 2025 15:44:43 +0000
Date: Wed, 19 Nov 2025 16:44:42 +0100
Message-ID: <877bvmc9hx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: linux-sound@vger.kernel.org,
	kailang@realtek.com
Subject: Re: [PATCH] fixup realtek/alc288 headphone for MS Surface 2, 3 and 
In-Reply-To: <87a50icaxv.wl-tiwai@suse.de>
References: <20251116.162633.1272923634893984527.rene@exactco.de>
	<87ikf8fx70.wl-tiwai@suse.de>
	<20251117.210734.507304067570791021.rene@exactco.de>
	<87a50icaxv.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5D7F4219A5
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[2a07:de40:b281:104:10:150:64:97:query timed out,2a07:de40:b281:106:10:150:64:167:query timed out];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-info.sh:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

On Wed, 19 Nov 2025 16:13:32 +0100,
Takashi Iwai wrote:
> 
> On Mon, 17 Nov 2025 21:07:34 +0100,
> René Rebe wrote:
> > 
> > On Mon, 17 Nov 2025 17:20:03 +0100, Takashi Iwai <tiwai@suse.de> wrote:
> > 
> > > On Sun, 16 Nov 2025 16:26:33 +0100,
> > > René Rebe wrote:
> > > > 
> > > > The Surface Pro 2 and 3 have a strage frequency response and miss most
> > > > of the bass. I discovered connecting the HP out to the main DAC fixes
> > > > this.  Maybe the other is mono or whatever strangely mixed signal for
> > > > the built-in speakers?
> > > > 
> > > > I later noticed the Lenovo Ideapad 720S (AMD) exhibited the same
> > > > problem, so this may be a more wide-spread general bug w/ Realtek
> > > > codecs and the hda_auto_parser, ...
> > > 
> > > Usually in a case like this, we provide a fixed wiring by a static DAC
> > > table, or do some other tricks instead of directly writing a verb.
> > > 
> > > Could you give the alsa-info.sh outputs from those?
> > 
> > Sure, here is an slightly older 6.16 kernel I had at hand that did had
> > my fixes applied:
> 
> Thanks.  Could you give the output from the unpatched kernel, too?
> Just to make sure.

... and if the purpose is to just swap DAC assignments between the
headphone and the speaker pins, a patch like below could work better.
(The entry is 


Takashi

-- 8< --
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3418,6 +3418,21 @@ static void alc283_fixup_dell_hp_resume(struct hda_codec *codec,
 		alc_write_coef_idx(codec, 0xd, 0x2800);
 }
 
+/* Swap DAC assignments for HP and speaker */
+static void alc288_fixup_surface_swap_dacs(struct hda_codec *codec,
+					   const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+	static hda_nid_t preferred_pairs[] = {
+		0x21, 0x03, 0x14, 0x02, 0
+	};
+
+	if (action != HDA_FIXUP_ACT_PRE_PROBE)
+		return;
+
+	spec->gen.preferred_dacs = preferred_pairs;
+}
+
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -3737,6 +3752,7 @@ enum {
 	ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC,
 	ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK,
 	ALC256_FIXUP_VAIO_RPL_MIC_NO_PRESENCE,
+	ALC288_FIXUP_SURFACE_SWAP_DACS,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6183,7 +6199,11 @@ static const struct hda_fixup alc269_fixups[] = {
 		},
 		.chained = true,
 		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
-	}
+	},
+	[ALC288_FIXUP_SURFACE_SWAP_DACS] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc288_fixup_surface_swap_dacs,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -6883,6 +6903,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10ec, 0x12cc, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10ec, 0x12f6, "Intel Reference board", ALC295_FIXUP_CHROME_BOOK),
 	SND_PCI_QUIRK(0x10f7, 0x8338, "Panasonic CF-SZ6", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1414, 0x9c20, "Microsoft Surface Pro 2/3", ALC288_FIXUP_SURFACE_SWAP_DACS),
 	SND_PCI_QUIRK(0x144d, 0xc109, "Samsung Ativ book 9 (NP900X3G)", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x144d, 0xc169, "Samsung Notebook 9 Pen (NP930SBE-K01US)", ALC298_FIXUP_SAMSUNG_AMP),
 	SND_PCI_QUIRK(0x144d, 0xc176, "Samsung Notebook 9 Pro (NP930MBE-K04US)", ALC298_FIXUP_SAMSUNG_AMP),
