Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB4211A08
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524791; cv=none; b=YSpHhNE/avZRn2tc3U5mrpWlOq7url7JfdhG+gnnWkWE2CQaijbTkxTuveVeFriWyw8Wa+2aMQVMREjb2pyzAEQN3kzsGbLH4ul5AMT09lxCIs4FYTa+WGCAlfv26ZXfrkEQ/TlcaO7oULajZJn/1V+0J2tTmECqNFZDF9G1mZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524791; c=relaxed/simple;
	bh=Eu6i2+X6gWRUleLN1H4Yu50EfOF19DZ3otGskmM0g44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B95fmRNgwC47K9gZUk2ud7NXFLE4UESN1o+SmKqVqaGXUyWpx0nIsHtGISHCePU+u8++E9nA2X0K3Yu0KCwQ8i0hL4BExpvHX+Fmg0o0TcYeRgnZAYNq9t4yfiWXBG06nyBEJoICoqJnc+kXzl+ZNYiyPDnEIiKlFxO4JCuop7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CpGzh2h3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uw4mWnq1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CpGzh2h3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uw4mWnq1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CpGzh2h3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uw4mWnq1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CpGzh2h3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uw4mWnq1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BAD1921188;
	Fri, 10 Jan 2025 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXXcNre5CzhMcUgtx+yxzasDSZT0wZjybWH9YRLs7aE=;
	b=CpGzh2h3P2PJpbvwZGtabcBIhEHKCbNowYPPaJ5jpYho8lDHyU/hmsS5ZTjl/2U6qKcJ+w
	Cc8kBjhIpsZG5xPwpgQFR09ZX3c7PSbuVzg0h7ZkaKEMhL7TT+56Q+6fWhHXu1ezXttp1P
	NZ553VwI4HDW0ozWNIpXUoflkoTRBBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXXcNre5CzhMcUgtx+yxzasDSZT0wZjybWH9YRLs7aE=;
	b=Uw4mWnq1NGAN1Lal4xQT3mb04LPvvaevf32NCFWDDXmW9RVfPJPVHN8kFw/aoJXJ7BBecA
	7vkVdbt4p0nZ4dDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736524787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXXcNre5CzhMcUgtx+yxzasDSZT0wZjybWH9YRLs7aE=;
	b=CpGzh2h3P2PJpbvwZGtabcBIhEHKCbNowYPPaJ5jpYho8lDHyU/hmsS5ZTjl/2U6qKcJ+w
	Cc8kBjhIpsZG5xPwpgQFR09ZX3c7PSbuVzg0h7ZkaKEMhL7TT+56Q+6fWhHXu1ezXttp1P
	NZ553VwI4HDW0ozWNIpXUoflkoTRBBs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736524787;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXXcNre5CzhMcUgtx+yxzasDSZT0wZjybWH9YRLs7aE=;
	b=Uw4mWnq1NGAN1Lal4xQT3mb04LPvvaevf32NCFWDDXmW9RVfPJPVHN8kFw/aoJXJ7BBecA
	7vkVdbt4p0nZ4dDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9828513A96;
	Fri, 10 Jan 2025 15:59:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SPfiI/NDgWefEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 15:59:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/8] ALSA: rawmidi: Expose the tied device number in info ioctl
Date: Fri, 10 Jan 2025 16:59:34 +0100
Message-ID: <20250110155943.31578-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250110155943.31578-1-tiwai@suse.de>
References: <20250110155943.31578-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.80
X-Spam-Flag: NO

The UMP legacy rawmidi is derived from the UMP rawmidi, but currently
there is no way to know which device is involved in other side.

This patch extends the rawmidi info ioctl to show the tied device
number.  As default it stores -1, indicating that no tied device.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/designs/midi-2.0.rst | 5 +++++
 include/sound/rawmidi.h                  | 1 +
 include/uapi/sound/asound.h              | 5 ++++-
 sound/core/rawmidi.c                     | 2 ++
 sound/core/ump.c                         | 3 +++
 5 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/midi-2.0.rst b/Documentation/sound/designs/midi-2.0.rst
index 086487ca7ab1..d525bc2805f7 100644
--- a/Documentation/sound/designs/midi-2.0.rst
+++ b/Documentation/sound/designs/midi-2.0.rst
@@ -293,6 +293,11 @@ Rawmidi API Extensions
   status 0x05).  When UMP core receives such a message, it updates the
   UMP EP info and the corresponding sequencer clients as well.
 
+* The legacy rawmidi device number is found in the new `tied_device`
+  field of the rawmidi info.
+  On the other hand, the UMP rawmidi device number is found in
+  `tied_device` field of the legacy rawmidi info, too.
+
 
 Control API Extensions
 ======================
diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
index f31cabf0158c..7f1fec786b72 100644
--- a/include/sound/rawmidi.h
+++ b/include/sound/rawmidi.h
@@ -118,6 +118,7 @@ struct snd_rawmidi {
 	struct list_head list;
 	unsigned int device;		/* device number */
 	unsigned int info_flags;	/* SNDRV_RAWMIDI_INFO_XXXX */
+	unsigned int tied_device;
 	char id[64];
 	char name[80];
 
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index 4cd513215bcd..1fcff031b5e3 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -729,6 +729,8 @@ enum {
 #define SNDRV_RAWMIDI_INFO_DUPLEX		0x00000004
 #define SNDRV_RAWMIDI_INFO_UMP			0x00000008
 
+#define SNDRV_RAWMIDI_DEVICE_UNKNOWN		-1
+
 struct snd_rawmidi_info {
 	unsigned int device;		/* RO/WR (control): device number */
 	unsigned int subdevice;		/* RO/WR (control): subdevice number */
@@ -740,7 +742,8 @@ struct snd_rawmidi_info {
 	unsigned char subname[32];	/* name of active or selected subdevice */
 	unsigned int subdevices_count;
 	unsigned int subdevices_avail;
-	unsigned char reserved[64];	/* reserved for future use */
+	int tied_device;		/* R: tied rawmidi device (UMP/legacy) */
+	unsigned char reserved[60];	/* reserved for future use */
 };
 
 #define SNDRV_RAWMIDI_MODE_FRAMING_MASK		(7<<0)
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 348ce1b7725e..858878fe487a 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -635,6 +635,7 @@ static int snd_rawmidi_info(struct snd_rawmidi_substream *substream,
 	info->subdevices_count = substream->pstr->substream_count;
 	info->subdevices_avail = (substream->pstr->substream_count -
 				  substream->pstr->substream_opened);
+	info->tied_device = rmidi->tied_device;
 	return 0;
 }
 
@@ -1834,6 +1835,7 @@ int snd_rawmidi_init(struct snd_rawmidi *rmidi,
 	INIT_LIST_HEAD(&rmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT].substreams);
 	INIT_LIST_HEAD(&rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT].substreams);
 	rmidi->info_flags = info_flags;
+	rmidi->tied_device = SNDRV_RAWMIDI_DEVICE_UNKNOWN;
 
 	if (id != NULL)
 		strscpy(rmidi->id, id, sizeof(rmidi->id));
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 9198bff4768c..0bfab84eaafb 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1314,6 +1314,9 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 	ump->legacy_rmidi = rmidi;
 	update_legacy_names(ump);
 
+	rmidi->tied_device = ump->core.device;
+	ump->core.tied_device = rmidi->device;
+
 	ump_dbg(ump, "Created a legacy rawmidi #%d (%s)\n", device, id);
 	return 0;
 }
-- 
2.43.0

