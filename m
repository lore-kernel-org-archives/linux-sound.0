Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36487866F
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706702936; cv=none; b=rZmlUy43JjyZOOkIzypsNvwxmfEiXexPsfDeUkGDXXpDHRisnO9hNfXYRDk/+LsUIiPw4llA0DetYDzQVUF5Uhiu7K21abeKC2O/0/0jCYtHnoiu7QNkXUZ4ehcBQm1ckijqPOZusYrZA6mkGJHToOZfOp1t2Qt4OXFz0CmQECQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706702936; c=relaxed/simple;
	bh=XesLuysNerAa/u+j3ceFWtSsg5mHQ5CcNpoVTUA5/Vc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJoBm9wc8iNXe2qG2SS/46/3ZPO2CK9Kz7aJvlGO0ZMIA3Xp+HhsPtlMxToTkcih9Pqy0vx+Fx+GAGrABK6dJUQwVB1DxU2HIM3L5UIT/4/s3ahrIjrIuERG6Xp59BxP9eidZfyqacaHPGAmE6Xiu2PCEerbNBiVvhWGO7zusDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pgzR6jvn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TxGNtfgz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pgzR6jvn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TxGNtfgz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pgzR6jvn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TxGNtfgz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pgzR6jvn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TxGNtfgz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B8FF021E55;
	Wed, 31 Jan 2024 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706702932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YLIPMSolFtkpCt0VC+hZiBAFUYEbQZVHrmXzhyZL+A=;
	b=pgzR6jvnoo8aKhKtHtQtnTKRVzpnoUEFBJw+l2Pzsa4VM6iLHRI2+tbwjfiFa0sO/wbIWS
	rswwvBCYgWvviPW1BdpfKCOmv/7Sp8oZqdNql+u5kjUCySdV5tO6E2aWyuqAw3NXFXiUio
	RpQMr1O+PMFNwJE3PAsr/Dox6i1XnLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706702932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YLIPMSolFtkpCt0VC+hZiBAFUYEbQZVHrmXzhyZL+A=;
	b=TxGNtfgzAFWrBIdkiU6NaNFriMTx+5XETeUJSoFEVZgHKV9RACex+eDLVZof6j90rkc5V/
	44XKdxRK8QzAzdDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706702932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YLIPMSolFtkpCt0VC+hZiBAFUYEbQZVHrmXzhyZL+A=;
	b=pgzR6jvnoo8aKhKtHtQtnTKRVzpnoUEFBJw+l2Pzsa4VM6iLHRI2+tbwjfiFa0sO/wbIWS
	rswwvBCYgWvviPW1BdpfKCOmv/7Sp8oZqdNql+u5kjUCySdV5tO6E2aWyuqAw3NXFXiUio
	RpQMr1O+PMFNwJE3PAsr/Dox6i1XnLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706702932;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YLIPMSolFtkpCt0VC+hZiBAFUYEbQZVHrmXzhyZL+A=;
	b=TxGNtfgzAFWrBIdkiU6NaNFriMTx+5XETeUJSoFEVZgHKV9RACex+eDLVZof6j90rkc5V/
	44XKdxRK8QzAzdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A22E7139B1;
	Wed, 31 Jan 2024 12:08:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 20cNJ1Q4umX6cgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jan 2024 12:08:52 +0000
Date: Wed, 31 Jan 2024 13:08:52 +0100
Message-ID: <877cjp3dt7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] Apply headset jack fixup for alc287 thinkpads
In-Reply-To: <Zboy63KkNfAJB3kf@aquecedor-3-0>
References: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
	<871q9y2cle.wl-tiwai@suse.de>
	<Zbogv_GdHlz5dZsQ@aquecedor-3-0>
	<87eddx3hhj.wl-tiwai@suse.de>
	<Zboqfadxk-4OcEg9@aquecedor-3-0>
	<87a5ol3f6z.wl-tiwai@suse.de>
	<Zboy63KkNfAJB3kf@aquecedor-3-0>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pgzR6jvn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TxGNtfgz
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.51 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Score: -5.51
X-Rspamd-Queue-Id: B8FF021E55
X-Spam-Flag: NO

On Wed, 31 Jan 2024 12:45:47 +0100,
José Relvas wrote:
> 
> Oops, turns out there's a non-bass variant of this quirk: ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK
> I've made a V2 of this patch using it - it's much less invasive.

Yeah, I saw it, and it looks better.


thanks,

Takashi

> I'm in agreement. If the quirk's name says it targets bass systems, then that'd imply a non-bass version is available, which should prevent future confusion.
> 
> On Wed, Jan 31, 2024 at 12:39:00PM +0100, Takashi Iwai wrote:
> > On Wed, 31 Jan 2024 12:09:49 +0100,
> > José Relvas wrote:
> > > 
> > > Thanks for the feedback! So if my understanding is correct, the headset jack quirk is currently *only* applied to models with bass speakers?
> > 
> > AFAIK, it looks yes; at least the majority of machines are actually
> > with bass speakers.
> > 
> > > bass thinkpad -> headset thinkpad quirk -> bass thinkpad quirk (both quirks applied)
> > > normal thinkpad -X> headset thinkpad quirk -X> bass thinkpad quirk (neither quirks applied) 
> > >
> > > I'll go back to the drawing board, just making sure I'm not missing anything.
> > 
> > Maybe it'd be helpful to rename the current one to be more explicit
> > with bass speakers at first :)
> > 
> > 
> > Takashi
> > 
> > > José Relvas
> > > 
> > > On Wed, Jan 31, 2024 at 11:49:28AM +0100, Takashi Iwai wrote:
> > > > On Wed, 31 Jan 2024 11:28:15 +0100,
> > > > José Relvas wrote:
> > > > > 
> > > > > Thanks for the reply!
> > > > > 
> > > > > Sorry about the misformatted patch. I did send in a second one through git-send-email. Is it not correct either? 
> > > > > 
> > > > > Anyways, the reason I'm editing the existing quirks is mostly because ALC285_FIXUP_THINKPAD_HEADSET_JACK was actually wrong.
> > > > > It was actually always linking to the X1 gen 7 quirk, which has some kcontrol changes only meant for a few models with bass speakers.
> > > > 
> > > > Yes, and that's the intentional behavior.
> > > > There is the match with the pin table, not only the explicit PCI
> > > > SSID, and those are with bass speakers.
> > > > 
> > > > > It looks like this: 
> > > > > 
> > > > > /* Quirk for Thinkpad X1 7th and 8th Gen
> > > > >  * The following fixed routing needed
> > > > >  * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
> > > > >  * DAC2 (NID 0x03) -> Bass (NID 0x17) & Headphone (NID 0x21); sharing a DAC
> > > > >  * DAC3 (NID 0x06) -> Unused, due to the lack of volume amp
> > > > > */
> > > > > static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
> > > > > 					  const struct hda_fixup *fix, int action)
> > > > > {
> > > > > 	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */
> > > > > 	static const hda_nid_t preferred_pairs[] = {
> > > > > 		0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
> > > > > 	};
> > > > > 	struct alc_spec *spec = codec->spec;
> > > > > 
> > > > > 	switch (action) {
> > > > > 	case HDA_FIXUP_ACT_PRE_PROBE:
> > > > > 		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
> > > > > 		spec->gen.preferred_dacs = preferred_pairs;
> > > > > 		break;
> > > > > 	case HDA_FIXUP_ACT_BUILD:
> > > > > 		/* The generic parser creates somewhat unintuitive volume ctls
> > > > > 		 * with the fixed routing above, and the shared DAC2 may be
> > > > > 		 * confusing for PA.
> > > > > 		 * Rename those to unique names so that PA doesn't touch them
> > > > > 		 * and use only Master volume.
> > > > > 		 */
> > > > > 		rename_ctl(codec, "Front Playback Volume", "DAC1 Playback Volume");
> > > > > 		rename_ctl(codec, "Bass Speaker Playback Volume", "DAC2 Playback Volume");
> > > > > 		break;
> > > > > 	}
> > > > > }
> > > > > 
> > > > > On second review, this does break some routing with older alc285, as the speaker and headphone NIDs are still 0x02 and 0x03.
> > > > > Maybe cloning the x1 gen 7 fixup, but without the renamed ctls, is the more appropriate solution here? Let me know what your thoughts are.
> > > > 
> > > > I believe it's safer to make a specific quirk for X7 gen7.
> > > > There are too many dependencies on the existing chains.
> > > > 
> > > > 
> > > > Takashi
