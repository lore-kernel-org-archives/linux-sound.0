Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578DF3DDDA1
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929660; cv=none; b=fHqlI4p8QjvKY4pC5Nzetz+x3e8Ga2F4/Xxg/Bc4JdtDiYxSQskoHymZNk6oXHPNNDNI+geAPM4e1ROdZCo5c1f8oHrvB2Kst/VEJL9LGzZbT+pK3aRC9nhzxr8/FtqGM5CmIi9e3R+WRLun0M9pT+q7HhxFg1+tOa2l7bG8JE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929660; c=relaxed/simple;
	bh=D/7YfnWkZJQW6vEVrBlbPt1gnxrO8SggjrdzuvxAgWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AT7yq3EhpNBJ4keuc3VaypTVnDQV+Tzv9mM6EegBWDUAlngdJNMAojBy0fEMGVGwLabQm2a5QjtBe/biW7+hvhq97XJ+oeyijHjRK039BGWVdFWWRurzNAnBJL/ZzVZLZOXC/+OlW5LGa/N9CLWuO5BP1V7JjzyH8uh4po940l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V3ZIASED; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V3ZIASED"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777929656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZNVB3y1YzDeLuk26Af5O5+gv9q1WzhT3dyS65JzLOJo=;
	b=V3ZIASEDR0epAAhDIZ+mV7pIIIXC+wQRWdNj1rVkIIZyCWHdQRgFole4dmvpw/ZNlMEOxq
	3wO+LZKlB1PO57F3DILbglMxB5YLRiYHI3pI5PlnOPDlms9QZQCAWxUm2l6WivKo57sEfm
	A9JVGM95uCNYg1t+L9F7i4h1kZxlVj8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rong Zhang <i@rong.moe>,
	Cryolitia PukNgae <cryolitia.pukngae@linux.dev>,
	Arun Raghavan <arunr@valvesoftware.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: simplify mixer control name handling
Date: Mon,  4 May 2026 23:20:10 +0200
Message-ID: <20260504212008.147373-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3317; i=thorsten.blum@linux.dev; h=from:subject; bh=D/7YfnWkZJQW6vEVrBlbPt1gnxrO8SggjrdzuvxAgWw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk/eTuSd+RcXDT1+UZBUZ2Cg09TXm/f/N/3RMqs3f9q4 w79LFmi0lHKwiDGxSArpsjyYNaPGb6lNZWbTCJ2wsxhZQIZwsDFKQATWfeGkeEWv/+Xr+/0//O0 83lM1HT3EBe5yH9c5qjmxIzXH9S8F01h+B97TuGU5OGlNz4G6H4tfX1A5CJr/ZnXb1b1sH9JVAr lLGUEAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

In get_term_name(), remove hard-coded return values and a strlen() call,
and return the number of bytes copied by strscpy() directly.

Since get_term_name() may now return -E2BIG on string truncation, check
name_len < 0 and return early from get_connector_control_name() if
needed. Also replace strlcat() with strscpy().

Other get_term_name() callers only check the return value for non-zero
and are not affected by this change.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/usb/mixer.c | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 5fba456eb4a9..a782718bfb7f 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -665,17 +665,13 @@ static int get_term_name(struct snd_usb_audio *chip, struct usb_audio_term *iter
 			return 0;
 		switch (iterm->type >> 16) {
 		case UAC3_SELECTOR_UNIT:
-			strscpy(name, "Selector", maxlen);
-			return 8;
+			return strscpy(name, "Selector", maxlen);
 		case UAC3_PROCESSING_UNIT:
-			strscpy(name, "Process Unit", maxlen);
-			return 12;
+			return strscpy(name, "Process Unit", maxlen);
 		case UAC3_EXTENSION_UNIT:
-			strscpy(name, "Ext Unit", maxlen);
-			return 8;
+			return strscpy(name, "Ext Unit", maxlen);
 		case UAC3_MIXER_UNIT:
-			strscpy(name, "Mixer", maxlen);
-			return 5;
+			return strscpy(name, "Mixer", maxlen);
 		default:
 			return scnprintf(name, maxlen, "Unit %d", iterm->id);
 		}
@@ -683,25 +679,18 @@ static int get_term_name(struct snd_usb_audio *chip, struct usb_audio_term *iter
 
 	switch (iterm->type & 0xff00) {
 	case 0x0100:
-		strscpy(name, "PCM", maxlen);
-		return 3;
+		return strscpy(name, "PCM", maxlen);
 	case 0x0200:
-		strscpy(name, "Mic", maxlen);
-		return 3;
+		return strscpy(name, "Mic", maxlen);
 	case 0x0400:
-		strscpy(name, "Headset", maxlen);
-		return 7;
+		return strscpy(name, "Headset", maxlen);
 	case 0x0500:
-		strscpy(name, "Phone", maxlen);
-		return 5;
+		return strscpy(name, "Phone", maxlen);
 	}
 
-	for (names = iterm_names; names->type; names++) {
-		if (names->type == iterm->type) {
-			strscpy(name, names->name, maxlen);
-			return strlen(names->name);
-		}
-	}
+	for (names = iterm_names; names->type; names++)
+		if (names->type == iterm->type)
+			return strscpy(name, names->name, maxlen);
 
 	return 0;
 }
@@ -1988,7 +1977,9 @@ static void get_connector_control_name(struct usb_mixer_interface *mixer,
 	int name_len = get_term_name(mixer->chip, term, name, name_size, 0);
 
 	if (name_len == 0)
-		strscpy(name, "Unknown", name_size);
+		name_len = strscpy(name, "Unknown", name_size);
+	if (name_len < 0)
+		return;
 
 	/*
 	 *  sound/core/ctljack.c has a convention of naming jack controls
@@ -1996,9 +1987,9 @@ static void get_connector_control_name(struct usb_mixer_interface *mixer,
 	 * indicating Input or Output after the terminal name.
 	 */
 	if (is_input)
-		strlcat(name, " - Input Jack", name_size);
+		strscpy(name + name_len, " - Input Jack", name_size - name_len);
 	else
-		strlcat(name, " - Output Jack", name_size);
+		strscpy(name + name_len, " - Output Jack", name_size - name_len);
 }
 
 /* get connector value to "wake up" the USB audio */
