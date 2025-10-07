Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133A5CA4B
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759858364; cv=none; b=rmgDzgRQrfBzu8AzR796w9IiGpoVrT/OaiHLMNpmQmAo2ERTVgczwy1H+kqt4SLY59addo/wYSXV9XJogSzPfTZIFCfIeXNyOrgz6BZ76ThSJJISMRzCA0GeJz2Ouu5EG48lAF+FgnL5e2ioBXNSEwxBUkQVeOo8dSlmOb7HRAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759858364; c=relaxed/simple;
	bh=E+aX5TOHEp/d3HJVpZn2bgZqwYp9dTDEPZHCmNXbvCw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HZ4V4+wkXq4DfdL5wzOdZxu1qoCqGQQ0ur5h6+U6BXjnuiPcHVS7x9L6JhpDKYo/I/KrVJqHgm29mf/ZEo6bkBpwqQHHj8XJypqwc/7LiGOGsNpT0tlfjUgQEQ4HxEhrNqc30k7uxIHn5SAfrYQcSuc13Dc+GZOFUW3MvtwOj9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvfxaTtv; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvfxaTtv"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f1f29a551so8332862b3a.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 10:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759858362; x=1760463162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8ZpYVM0V4I1RihtN3wza324vQ8Dd1czFpMPPhquAHA=;
        b=DvfxaTtv5unexpVlCHVdzbCGmcG9xoMWHRo1rC8VIsLC/7wyGXhHX0fdiTkEGq2UlR
         SMRHWVOHgeSFQXHDGrrVTA+ybKpkT4sIIssaCjnESDyxcuCmh4kcwVAVB7zpYtc2eloE
         OBv+cvEd2pjeoN0+o53Xx3tSx5eGQUtwXuI/5enGaqZd0PiTXcKtW8s3Jha7dLo/uzu4
         oqEaeMOzuatWyxkW1Jd4r7lHbtNT168rnMCdaUZ8ge1bHyABGjpGSdpvunZyfvAPvS1r
         SqqQYtD2mwsK2RGa/6hy8ci+AZVzcjfmIRVSPwmlqwCOaMFiami6GCBDGajry84AK72R
         Tywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759858362; x=1760463162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X8ZpYVM0V4I1RihtN3wza324vQ8Dd1czFpMPPhquAHA=;
        b=sb4RzjoUsDPUDSY/Yv8ZQ4GKgG7ILMZyGHQbel7KdmudTB+O4pcMj0D4ZnngJ7Z4WL
         4Liva+phe/XHCCfgxmUL3TnQGFk2UKhjwRFdI1L9bSEH3ZTpmhJqv8pzaD+zb2sY1RTP
         GJBl+JdyRSmL1B76cYD/x42HHWma4C3bT7COCJen2RfC6CLTpqoxup31M6dXRUcNlImV
         iFGf946HoUCL/PeMYRAhr/skLMUYLcqWGoD29EEcqG6+v0L00++fCdI5NIi0Gbp+szn3
         mncS/4Pz9ftDIV8HXigunI/scDhenJpvRG6fgPBr2Pl6pEwCtrArQaP7wepxDLLZADMy
         D2zA==
X-Forwarded-Encrypted: i=1; AJvYcCVq8Gk2BSSv3aB2VWIBZ7tS++XB5jPWcPth5sEiotTSBDo6ppDcRIeR/V/Co3Ltbhs7NHkj/l+ziPA56g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZjTp2o3LC32hi/64AsMIzTbIayfb4tbj835NNKZNHVkOyfNiO
	GgEv8tHVbeo7+9pEREgk1qdHMNLhLkSa4FbD3jaTurTtRVU55GYWne7A
X-Gm-Gg: ASbGncv0BnY8F1vVqXheivBbqyQAOMXZz46yTMeGVn6pO3UsnpS6zsrj9RC+GoEzJnl
	XkcnltrmyyVGTsJWFvgG/dzCMXgbjGY/yvkJgCkv5osJ86rEK9wFeRLDwJgSfucS8eCv1g6Kdrg
	JhKjkB3pM6o3yTCzVSeyAHsodncN4AJ7rVlkkCl4xI7Z7/MTQxJ9oMG56GNwo0IocWWiMG0EO4+
	xjmgIgdEoz1M3PZC63dD0fObplznA3uPAq0h9TJE09pq5NHkCQJAaXy5OwvkUhJ2N0XD82a7TXb
	/rzwl3VZFL37k/I7vVMx3z3VhS2WDp6eluvzfbKulukSQLtfzpREnlM17hLn68/xXpqH/JWJc0p
	zw9MVOykkhyPvcLBcMqtQJ02NedKgUkOjwzzEeGCw9qwLAUD1SVqM7PkRG1trqX966GUMuElEbg
	==
X-Google-Smtp-Source: AGHT+IExWMmFTXnDVcbabTZSsSq9hWpU8JqdDhoWXYn31Lw8poGbxgJvYey6hOLOtatkbJuCV9+qNw==
X-Received: by 2002:a05:6a00:23c1:b0:77c:6621:6168 with SMTP id d2e1a72fcca58-79387e05457mr328770b3a.30.1759858362279;
        Tue, 07 Oct 2025 10:32:42 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb288asm16271240b3a.30.2025.10.07.10.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 10:32:42 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 6.6.y 6.1.y 5.15.y 5.10.y 5.4.y] ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
Date: Wed,  8 Oct 2025 02:31:34 +0900
Message-Id: <20251007173134.440372-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeongjun Park <aha310510@gmail.com>

[ Upstream commit 9f2c0ac1423d5f267e7f1d1940780fc764b0fee3 ]

The previous commit 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at
removal") patched a UAF issue caused by the error timer.

However, because the error timer kill added in this patch occurs after the
endpoint delete, a race condition to UAF still occurs, albeit rarely.

Additionally, since kill-cleanup for urb is also missing, freed memory can
be accessed in interrupt context related to urb, which can cause UAF.

Therefore, to prevent this, error timer and urb must be killed before
freeing the heap memory.

Cc: <stable@vger.kernel.org>
Reported-by: syzbot+f02665daa2abeef4a947@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f02665daa2abeef4a947
Fixes: 0718a78f6a9f ("ALSA: usb-audio: Kill timer properly at removal")
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/midi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index c3de2b137435..461e183680da 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -1522,15 +1522,14 @@ static void snd_usbmidi_free(struct snd_usb_midi *umidi)
 {
 	int i;
 
+	if (!umidi->disconnected)
+		snd_usbmidi_disconnect(&umidi->list);
+
 	for (i = 0; i < MIDI_MAX_ENDPOINTS; ++i) {
 		struct snd_usb_midi_endpoint *ep = &umidi->endpoints[i];
-		if (ep->out)
-			snd_usbmidi_out_endpoint_delete(ep->out);
-		if (ep->in)
-			snd_usbmidi_in_endpoint_delete(ep->in);
+		kfree(ep->out);
 	}
 	mutex_destroy(&umidi->mutex);
-	timer_shutdown_sync(&umidi->error_timer);
 	kfree(umidi);
 }
 
--
