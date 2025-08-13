Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABD628935D
	for <linux-sound@vger.kernel.org>; Wed, 13 Aug 2025 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755118924; cv=none; b=DBEOY671Mb+2+e/G/sGOC2GG3062qsJ1GdxFEDIQyMqjE+hY/LxKIrDhbDvnzRBjaqc6kzW6TKB/5yPXEAXo+zATPJmydByYcuf8lhpo8qmzBpQ5+1sdwvnr7Gz6vMZYDvTcDWT7dcrmRxmK15LspiYTF+c5kFRF5z+Vl76e11U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755118924; c=relaxed/simple;
	bh=C3HN1Ea4nnEdIb3fh2ybGv6FUdgVJNgO0WjlTtVz4aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSCPUYh/jZIr20X863cfp9AA5WwCRqTAG9tUo5CFYZuejUmrjP645B18Sjz0eW155gd6OkcnoO3WgcpgoJT0XxHqdASIqM6O13v+0PzETKoSVpStxmYeRKE6IcQgclcl6bfzODA1AlzDScbGi4gTFR2JDgxUMbAwYHOC36uTTxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ckiXIFIX; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ckiXIFIX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755118920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mAbIbKv6pVkOqZtuLJFoDEJv2wcIYOo0f5iBAHLrLrc=;
	b=ckiXIFIXn+Zf4aSh0TWi289qPUbovTcslegfNYoae6e2PDij4HB9NeZati9zs3oNvcUgAS
	4ZRPYkcWo61/smIRTsudGh4jS2JHZXzdTnYVvUklRfVfRNjec42yDIXodjHx7PY0ezsRFE
	wOdOHy1wPgazVDQtOl643AFfdWM/Dak=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda: Improve local variable data type in print_device_list()
Date: Wed, 13 Aug 2025 23:00:57 +0200
Message-ID: <20250813210059.215912-2-thorsten.blum@linux.dev>
In-Reply-To: <20250813205507.215658-2-thorsten.blum@linux.dev>
References: <20250813205507.215658-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use 'unsigned int' instead of 'int' for the local variable 'devlist_len'
because snd_hda_get_devices() returns an 'unsigned int' and the length
cannot be negative. Update the print format specifier and the if
condition accordingly.

Reformat calling snd_hda_codec_read() to fit in a single line while
we're at it.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/hda/common/proc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/hda/common/proc.c b/sound/hda/common/proc.c
index 00c2eeb2c472..d36195f73d45 100644
--- a/sound/hda/common/proc.c
+++ b/sound/hda/common/proc.c
@@ -716,16 +716,15 @@ static void print_device_list(struct snd_info_buffer *buffer,
 {
 	int i, curr = -1;
 	u8 dev_list[AC_MAX_DEV_LIST_LEN];
-	int devlist_len;
+	unsigned int devlist_len;
 
 	devlist_len = snd_hda_get_devices(codec, nid, dev_list,
 					AC_MAX_DEV_LIST_LEN);
-	snd_iprintf(buffer, "  Devices: %d\n", devlist_len);
-	if (devlist_len <= 0)
+	snd_iprintf(buffer, "  Devices: %u\n", devlist_len);
+	if (devlist_len == 0)
 		return;
 
-	curr = snd_hda_codec_read(codec, nid, 0,
-				AC_VERB_GET_DEVICE_SEL, 0);
+	curr = snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_DEVICE_SEL, 0);
 
 	for (i = 0; i < devlist_len; i++) {
 		if (i == curr)
-- 
2.50.1

