Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6831DEFF5
	for <linux-sound@vger.kernel.org>; Thu, 26 Feb 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772108233; cv=none; b=ZKt5UrLGnJNVBSqg3cohpSXnQMN9nNH6xfbJPlnP2PwVjSJTpShuIT9awfojUIYqCFwrSL8pTXjcjYxRanP5RVu73oMAAzA6DuJTMwjSaSIpGuAUo3lqq814MIUz4ph0TW35dhTX9v2GWhk2Jtq9/jcV5a3y4400SZ2p4we3glQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772108233; c=relaxed/simple;
	bh=gKtrKyOrHffm3fb4wAQVD+dtgkUOwgwgaELxdmICQRw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cRT0vOWrMLLw2VwulXRIkkwJWxVxS4+vJQXsotf2TB+eYIsCjf6OycQvma0ei4DklbUINvT8Px435FCFqrJtjjrc0ZayGQ1da4luSSMC4nufMxKcsop5papcCpLRoElR+IEq9UCHh6MY1+q76NzK3Y/dho56vP6aX4YA8hyHG6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ysy9E+he; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rDS25m4A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ysy9E+he; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rDS25m4A; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ysy9E+he";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rDS25m4A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ysy9E+he";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rDS25m4A"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 61F501FA8A;
	Thu, 26 Feb 2026 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772108230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXEp+ICxIjLW6ehtNME+lEUKJqFRv9WsxeFEKutgxBE=;
	b=ysy9E+hevUVcsxH/BALmx2T6Z2SyXZCbpuOioKd+oRITpj159OdpWoJjzjn/YVa2NjnCTW
	6GkIsKvd4VyRwa3m/anLolU0+FjD9tldZObd35txh4FX5jEdV8KvaSPiLBrXTqwaClGBx6
	AMsHm0k3hVG7MKOkwQgA8xpnmN30StI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772108230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXEp+ICxIjLW6ehtNME+lEUKJqFRv9WsxeFEKutgxBE=;
	b=rDS25m4Atqacx5Z72Cp50rBOLThMzlI8gfNd1x7DKBPMMuW/JiPipybuCUjvKa8A+4fCyp
	XsRCoKB5F0TfPzBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ysy9E+he;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rDS25m4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772108230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXEp+ICxIjLW6ehtNME+lEUKJqFRv9WsxeFEKutgxBE=;
	b=ysy9E+hevUVcsxH/BALmx2T6Z2SyXZCbpuOioKd+oRITpj159OdpWoJjzjn/YVa2NjnCTW
	6GkIsKvd4VyRwa3m/anLolU0+FjD9tldZObd35txh4FX5jEdV8KvaSPiLBrXTqwaClGBx6
	AMsHm0k3hVG7MKOkwQgA8xpnmN30StI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772108230;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SXEp+ICxIjLW6ehtNME+lEUKJqFRv9WsxeFEKutgxBE=;
	b=rDS25m4Atqacx5Z72Cp50rBOLThMzlI8gfNd1x7DKBPMMuW/JiPipybuCUjvKa8A+4fCyp
	XsRCoKB5F0TfPzBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 471AC3EA62;
	Thu, 26 Feb 2026 12:17:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 83onEMY5oGmPDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Feb 2026 12:17:10 +0000
Date: Thu, 26 Feb 2026 13:17:09 +0100
Message-ID: <87v7fjbsxm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: "linux-sound@vger.kernel.org"
 <linux-sound@vger.kernel.org>
Subject: Re: USB device with more than 32 channels
In-Reply-To: <F1B104A5-CD6A-4A26-AB46-14BF233C0579@getmailspring.com>
References: <F1B104A5-CD6A-4A26-AB46-14BF233C0579@getmailspring.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: multipart/mixed;
 boundary="Multipart_Thu_Feb_26_13:17:09_2026-1"
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:~];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 61F501FA8A
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

--Multipart_Thu_Feb_26_13:17:09_2026-1
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Feb 2026 12:02:10 +0100,
Phil Willoughby wrote:
> 
> There's a check at sound/usb/mixer.c:2024 introduced by patch
> 2f38cf730caedaeacdefb7ff35b0a3c1168117f9 which filters out any device
> with more than 32 channels.
> 
> My audio interface has 34 channels in and 34 channels out, which
> therefore takes this branch, and means that this interface doesn't work
> on Linux. As I have nothing plugged in to channels 33 and 34 I am
> locally experimenting with changing the body of this check like:
> 
> -		return -EINVAL;
> +		channels = 32;
> 
> Which is obviously not a change I want to suggest for general
> consumption. I would like to fix it properly.
> 
> Judging by the commit message for
> 2f38cf730caedaeacdefb7ff35b0a3c1168117f9 the only reason for more than
> 32 channels existing that seems to have been considered at the time was
> a malformed USB descriptor. Is that something that actually exists in
> the wild or was this scenario purely theoretical?

The number 32 there is just because of bit operations.  Some checks
are done with 32bit int.

> In either case I think the core of the correct fix is going to be to
> make the 32-bit variable we're shifting a 64-bit variable and change the
> hard check to > 64. If there are real concerns with malformed
> descriptors we can either add an allow-list or reject-list based on vid/pid.
> 
> Should I expect any ABI problems here? Are we exposing a 32-bit channel
> bitfield outside of kernel-space anywhere?
> 
> Some background:
> 
> The interface I have is an Arturia Audiofuse 16Rig. Yes it really has
> that many channels.
> 
> There are a few threads on sites like
> https://linuxmusicians.com/viewtopic.php?t=28759 where others have
> encountered this problem so it's not just me.
> 
> You will find some threads which say it worked at some point in time but
> then stopped working - this very roughly tracks with the timing of the
> 2f38cf730caedaeacdefb7ff35b0a3c1168117f9 commit getting merged into
> mainstream distros.
> 
> I think I'm the first person to try tweaking this piece of code. I'm
> still building my patched kernel as I type this so I can't yet say
> whether it works.

The current code has even a lower MAX_CHANNELS (= 16), and I guess
more than 16 channels don't work perfectly for now.  The 32 limitation
above was merely for fixing UBSAN warning.

Below are ad hoc fixes.  let me know if this works.


thanks,

Takashi


--Multipart_Thu_Feb_26_13:17:09_2026-1
Content-Type: application/octet-stream; type=patch; name="0001-ALSA-usb-audio-Replace-hard-coded-number-with-MAX_CH.patch"
Content-Disposition: attachment; filename="0001-ALSA-usb-audio-Replace-hard-coded-number-with-MAX_CH.patch"
Content-Transfer-Encoding: 7bit

From aa293c3772adf874242962a8dd50d5c011184dd3 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 26 Feb 2026 13:01:42 +0100
Subject: [PATCH 1/2] ALSA: usb-audio: Replace hard-coded number with
 MAX_CHANNELS

One place in mixer.c still used a hard-coded number 16 instead of
MAX_CHANNELS.  Replace with it, so that we can extend the max number
of channels gracefully.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index ac8c71ba9483..09c42300fb48 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1707,7 +1707,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 		cval->master_readonly = readonly_mask;
 	} else {
 		int i, c = 0;
-		for (i = 0; i < 16; i++)
+		for (i = 0; i < MAX_CHANNELS; i++)
 			if (ctl_mask & BIT(i))
 				c++;
 		cval->channels = c;
-- 
2.53.0


--Multipart_Thu_Feb_26_13:17:09_2026-1
Content-Type: application/octet-stream; type=patch; name="0002-ALSA-usb-audio-Extend-max-number-of-channels-to-64.patch"
Content-Disposition: attachment; filename="0002-ALSA-usb-audio-Extend-max-number-of-channels-to-64.patch"
Content-Transfer-Encoding: 7bit

From c5b4df77405111c2883fe9164ce1a696ddb9189b Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 26 Feb 2026 13:11:56 +0100
Subject: [PATCH 2/2] ALSA: usb-audio: Extend max number of channels to 64

The current limitation of 16 as MAX_CHANNELS is rather historical at
the time of UAC1 definition.  As there seem already devices with a
higher number of mixer channels, we should extend it too.  As an ad
hoc update, let's raise it to 64 so that it can still fit in a single
long-long integer.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer.c | 14 +++++++-------
 sound/usb/mixer.h |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 09c42300fb48..2490f0c4ddbd 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1662,7 +1662,7 @@ static const struct usb_feature_control_info *get_feature_control_info(int contr
 
 static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 				const struct usbmix_name_map *imap,
-				unsigned int ctl_mask, int control,
+				u64 ctl_mask, int control,
 				struct usb_audio_term *iterm,
 				struct usb_audio_term *oterm,
 				int unitid, int nameid, int readonly_mask)
@@ -1833,7 +1833,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 }
 
 static void build_feature_ctl(struct mixer_build *state, void *raw_desc,
-			      unsigned int ctl_mask, int control,
+			      u64 ctl_mask, int control,
 			      struct usb_audio_term *iterm, int unitid,
 			      int readonly_mask)
 {
@@ -1845,7 +1845,7 @@ static void build_feature_ctl(struct mixer_build *state, void *raw_desc,
 }
 
 static void build_feature_ctl_badd(struct usb_mixer_interface *mixer,
-			      unsigned int ctl_mask, int control, int unitid,
+			      u64 ctl_mask, int control, int unitid,
 			      const struct usbmix_name_map *badd_map)
 {
 	__build_feature_ctl(mixer, badd_map, ctl_mask, control,
@@ -2021,7 +2021,7 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 		bmaControls = ftr->bmaControls;
 	}
 
-	if (channels > 32) {
+	if (channels > MAX_CHANNELS) {
 		usb_audio_info(state->chip,
 			       "usbmixer: too many channels (%d) in unit %d\n",
 			       channels, unitid);
@@ -2059,7 +2059,7 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 	if (state->mixer->protocol == UAC_VERSION_1) {
 		/* check all control types */
 		for (i = 0; i < 10; i++) {
-			unsigned int ch_bits = 0;
+			u64 ch_bits = 0;
 			int control = audio_feature_info[i].control;
 
 			for (j = 0; j < channels; j++) {
@@ -2085,7 +2085,7 @@ static int parse_audio_feature_unit(struct mixer_build *state, int unitid,
 		}
 	} else { /* UAC_VERSION_2/3 */
 		for (i = 0; i < ARRAY_SIZE(audio_feature_info); i++) {
-			unsigned int ch_bits = 0;
+			u64 ch_bits = 0;
 			unsigned int ch_read_only = 0;
 			int control = audio_feature_info[i].control;
 
@@ -3398,7 +3398,7 @@ static void snd_usb_mixer_dump_cval(struct snd_info_buffer *buffer,
 		[USB_MIXER_U32] = "U32",
 		[USB_MIXER_BESPOKEN] = "BESPOKEN",
 	};
-	snd_iprintf(buffer, "    Info: id=%i, control=%i, cmask=0x%x, "
+	snd_iprintf(buffer, "    Info: id=%i, control=%i, cmask=0x%llx, "
 			    "channels=%i, type=\"%s\"\n", cval->head.id,
 			    cval->control, cval->cmask, cval->channels,
 			    val_types[cval->val_type]);
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 167fbfcf01ac..afbb3dd9f177 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -44,7 +44,7 @@ struct usb_mixer_interface {
 	void (*private_suspend)(struct usb_mixer_interface *mixer);
 };
 
-#define MAX_CHANNELS	16	/* max logical channels */
+#define MAX_CHANNELS	64	/* max logical channels */
 
 enum {
 	USB_MIXER_BOOLEAN,
@@ -81,7 +81,7 @@ struct usb_mixer_elem_list {
 struct usb_mixer_elem_info {
 	struct usb_mixer_elem_list head;
 	unsigned int control;	/* CS or ICN (high byte) */
-	unsigned int cmask; /* channel mask bitmap: 0 = master */
+	u64 cmask; /* channel mask bitmap: 0 = master */
 	unsigned int idx_off; /* Control index offset */
 	unsigned int ch_readonly;
 	unsigned int master_readonly;
-- 
2.53.0


--Multipart_Thu_Feb_26_13:17:09_2026-1--
