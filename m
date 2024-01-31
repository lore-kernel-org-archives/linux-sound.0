Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DF45EE6D
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698173; cv=none; b=XzTxH8utfjrSSIOekWbJ7vhLztUQTvETP8XSaDVfkFvbU3luQGY+99yefYG/VjKIq+utV6wwVjVYeKGtBEfIGELAFXTQr1d+XzQJzJe7f5D2pFqdjwcBywId3Uj1G+7WPfqsAjOuaYwij+r5KY1GctCnV8tBC7j8qnmO8y+SF0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698173; c=relaxed/simple;
	bh=jp6IUAvwIo5VgizE7AmN7HsuGwxReOlAhy4Y9JZjEsw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ctj88oQT/tqxg129aznONCFtBR8ef/c4PrJbBk6A9ARl45oNDDblYveLQYpgfWtjuxfQckX7lFPFMbUc2EaOS1pVXGHKU53StAIEP55TFGqHSWboRDDEet1UFKIgf1qRau5OMcWstIUlWb9adCAu7DFFDRKY1InUMfNXhFXwVh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dfcy7E5Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+vVfPV7v; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Dfcy7E5Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+vVfPV7v; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dfcy7E5Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vVfPV7v";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Dfcy7E5Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+vVfPV7v"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 391941FB78;
	Wed, 31 Jan 2024 10:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706698169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhKtSWt0Wyv4AmxVDBoY3oaPa8/XKmBh9dFFQ85Ne6Y=;
	b=Dfcy7E5Q3GfAF1B9S2emjz8JaibKDEmMEuOswTAJX8Gtsy1c/P/gQ76ZFyll0VUyVqqN7+
	a5+PbqGDDpNI2c63XINHN5Oeq8237BQu+0ymNDvM6XxG8OESvRJu/C0Q4Mf9QOo4TfFaGF
	JCsGEgfydEnDWpbRLebrqzYj86W4jV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706698169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhKtSWt0Wyv4AmxVDBoY3oaPa8/XKmBh9dFFQ85Ne6Y=;
	b=+vVfPV7vkSkPwqHCkH3byBXdVIQQ2tD3dX4jrE8f3W3JZtyY7JpVvzE1uhYMInJ40gmCDh
	0NyHx1QA8AKHjsAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706698169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhKtSWt0Wyv4AmxVDBoY3oaPa8/XKmBh9dFFQ85Ne6Y=;
	b=Dfcy7E5Q3GfAF1B9S2emjz8JaibKDEmMEuOswTAJX8Gtsy1c/P/gQ76ZFyll0VUyVqqN7+
	a5+PbqGDDpNI2c63XINHN5Oeq8237BQu+0ymNDvM6XxG8OESvRJu/C0Q4Mf9QOo4TfFaGF
	JCsGEgfydEnDWpbRLebrqzYj86W4jV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706698169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DhKtSWt0Wyv4AmxVDBoY3oaPa8/XKmBh9dFFQ85Ne6Y=;
	b=+vVfPV7vkSkPwqHCkH3byBXdVIQQ2tD3dX4jrE8f3W3JZtyY7JpVvzE1uhYMInJ40gmCDh
	0NyHx1QA8AKHjsAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2240413A82;
	Wed, 31 Jan 2024 10:49:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DarZB7klumV3YgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jan 2024 10:49:29 +0000
Date: Wed, 31 Jan 2024 11:49:28 +0100
Message-ID: <87eddx3hhj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] Apply headset jack fixup for alc287 thinkpads
In-Reply-To: <Zbogv_GdHlz5dZsQ@aquecedor-3-0>
References: <20240130192536.10298-1-josemonsantorelvas@gmail.com>
	<871q9y2cle.wl-tiwai@suse.de>
	<Zbogv_GdHlz5dZsQ@aquecedor-3-0>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.83 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.73)[93.32%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.83

On Wed, 31 Jan 2024 11:28:15 +0100,
José Relvas wrote:
> 
> Thanks for the reply!
> 
> Sorry about the misformatted patch. I did send in a second one through git-send-email. Is it not correct either? 
> 
> Anyways, the reason I'm editing the existing quirks is mostly because ALC285_FIXUP_THINKPAD_HEADSET_JACK was actually wrong.
> It was actually always linking to the X1 gen 7 quirk, which has some kcontrol changes only meant for a few models with bass speakers.

Yes, and that's the intentional behavior.
There is the match with the pin table, not only the explicit PCI
SSID, and those are with bass speakers.

> It looks like this: 
> 
> /* Quirk for Thinkpad X1 7th and 8th Gen
>  * The following fixed routing needed
>  * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
>  * DAC2 (NID 0x03) -> Bass (NID 0x17) & Headphone (NID 0x21); sharing a DAC
>  * DAC3 (NID 0x06) -> Unused, due to the lack of volume amp
> */
> static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
> 					  const struct hda_fixup *fix, int action)
> {
> 	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */
> 	static const hda_nid_t preferred_pairs[] = {
> 		0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
> 	};
> 	struct alc_spec *spec = codec->spec;
> 
> 	switch (action) {
> 	case HDA_FIXUP_ACT_PRE_PROBE:
> 		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
> 		spec->gen.preferred_dacs = preferred_pairs;
> 		break;
> 	case HDA_FIXUP_ACT_BUILD:
> 		/* The generic parser creates somewhat unintuitive volume ctls
> 		 * with the fixed routing above, and the shared DAC2 may be
> 		 * confusing for PA.
> 		 * Rename those to unique names so that PA doesn't touch them
> 		 * and use only Master volume.
> 		 */
> 		rename_ctl(codec, "Front Playback Volume", "DAC1 Playback Volume");
> 		rename_ctl(codec, "Bass Speaker Playback Volume", "DAC2 Playback Volume");
> 		break;
> 	}
> }
> 
> On second review, this does break some routing with older alc285, as the speaker and headphone NIDs are still 0x02 and 0x03.
> Maybe cloning the x1 gen 7 fixup, but without the renamed ctls, is the more appropriate solution here? Let me know what your thoughts are.

I believe it's safer to make a specific quirk for X7 gen7.
There are too many dependencies on the existing chains.


Takashi
