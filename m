Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0517F3FBEBC
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 09:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899565; cv=none; b=r/6Zp/w8Pd308Sh7X21IeqCPROi+R+ZtmTUvUVi3IdBjiPgFUKTUIeTOX8VKn2wqktO8vX04VenbINEck3Q7+MmuU8b7ciG1Ck7gxj3P9EH3hEMJNzcl1CQEyqVCIBoWHouMQeXWdEgedGtt1Ho4zVjjkA7hX4PjiKpvb7IwiBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899565; c=relaxed/simple;
	bh=3a1+2nbXhZcTj4NeTgnKV87B2okzAssG60+kH78Twao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vl+KP7opJc9cpLj0bzr6WAT4uojR1DScD3COpjVrTvc6kkCD6eyPUcTsldKGyDmd7gbYMN6oFuwT6EX9XKnFRWm7cDze4eYBq6FwyDhN4O+dt4+z+3k5DLqbRXAu0XP6z4dr2VenTFn2AhdOdXvJ1GISw2oS3uRiRwKmOmpDdiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qg0owHf3; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qg0owHf3"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37e1607f7faso272488a91.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 02:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899563; x=1783504363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8mVJevA43xSAbcO4XqhY7+SohvyRUWiP3RuKf16nZNc=;
        b=qg0owHf3MUSdtGbd/ij8LNpShNt375wMuwK4tvW6JxsKT73IkPryVWOiMzIvJaaNi9
         aRiMP3reyuHWGCI+GBm4xsric1MimiiiQLMXPHdfkNtu7bloeejmYYBBo7wG1xyuMlmb
         kMwOmUMfJ/THgi9rB99u+z49LrVVGoqP9muBQYLGrp4VPklQG/ND9ZCaj2opLyurkpDA
         W8NYHC/xgBbsmTGZBDOeZ1xad+fYdPpnu9mg0jkk3mX2IYN0/I+k3Wj19GBeHvRRELnF
         NfjLEUlFIGf8Gl0M87dJQAJZDH1aFfgowekEFxGLFAGBcQtaSCEEA07y0B+laUcVflsU
         sLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899563; x=1783504363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mVJevA43xSAbcO4XqhY7+SohvyRUWiP3RuKf16nZNc=;
        b=aCesXKtE3LqRtcU9r1QOO8osoRU1sF7WcGO7JJxZzoUddh3G6UFLpMr9tsf2jzUvzb
         4ErnUWd/hZFVkC3VHLGDYWwOQNgtmSi/g3x9Q/f8wX+25ol/2B7E+ov/QYNxgU5lAG8R
         VjZSy1W/KQ7LJ/3c9VM/vs5W7zNjmpv8DRd5z55z0h+ep7vu15VyZRuwykb94tXgn8IK
         3C92vXzH2cDxAlE8SrMi3kI2NS+TDrWreUT7kQpxnT7R9EqSCTWNvtDL4Kj4epR0uCiK
         mQdvAdzMRK15Y/rXXgzTqs7Oar685aiBa+7lVvMteKLpIrwNxM56yeY8aNQXM4kE+SkG
         ED6A==
X-Forwarded-Encrypted: i=1; AHgh+RrjsHWqkkRqud/7JmvWPc6PVx5bhfCrz+MdGVXDqfbDJdNkmPwgWwwaoBB6Mg5wL5XIzIPHJfs8wkGxDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgjDA+rSb4VP/gWfFFBQ8RXkU7/GHOtF2KCWcUPF7MyWtA1XsJ
	/bPWpXuiOrKM+04tXS7h0cwrzEAe2/3ugKEfWfXvg/ubENU+oWq9JqjX
X-Gm-Gg: AfdE7ckEqsVNlys07ha9IWiUmswxJJotq1kB0uDqNmWvZ+8AoehW4BTJ6MD8e/RHXT9
	afMWOkFh3jGEoniiF4pRE+bkbVPdWjdD9S/RPKkRtGKKUP2UlCtBI7z0Cy121G8nW66OhoE1fEo
	N6ILGsJxmHYzIEAqlDl3GKbGTh1fMNgKVRxIuSwUx06PZu+THheonzpaZZeKz8hA6uh18yOP5LM
	lQSI+wcsnWJHZ8g1d7jljeTotzGec7ik9cD8EUZvQ3z4z1XuUZ87qNFK4IlhntRr+t1NaOnHjWx
	HHRiMqtoYEyHzhJZeVkV19nWvWmLE1O9PuqxZWnYEEJLeExi4gX3961LSvFG3+EYb4fjByj8Fvp
	V15XTuOCEq465KWKWotJDN9XP2A10CUzzSO00/Z9lJeIOZnG2eg2hRBCgllRPyp54g7XH89t4k2
	GGf1xF2eGvfwCWBni6fsBSlDKbsbO8L3taB+p2oRUFrWcJC20UMwbznT2ePVn4LhS6gTncxO/nL
	tpunA==
X-Received: by 2002:a17:90a:d647:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-380aa221bf1mr776096a91.23.1782899563156;
        Wed, 01 Jul 2026 02:52:43 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095d6d45asm1596801a91.9.2026.07.01.02.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:52:42 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: =?UTF-8?q?=C5=A0erif=20Rami?= <ramiserifpersia@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usx2y: us144mkii: fix work UAF on disconnect
Date: Wed,  1 Jul 2026 18:52:31 +0900
Message-ID: <20260701095231.1020811-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tascam_disconnect() cancels capture_work and midi_in_work before
usb_kill_anchored_urbs() kills the capture/MIDI-in URBs.  Those URBs
self-resubmit, and their completion handlers reschedule the work.

A URB that completes in the small window between cancel_work_sync() and
usb_kill_anchored_urbs() therefore re-arms the work after its only
cancel.  Nothing cancels it again before snd_card_free() frees the
card-private tascam structure, so the work handler then runs on freed
memory.

Kill the anchored URBs before cancelling the work; once the work is
cancelled no remaining URB can complete to re-arm it.

Fixes: c1bb0c13e430 ("ALSA: usb-audio: us144mkii: Implement audio capture and decoding")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/usb/usx2y/us144mkii.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/usb/usx2y/us144mkii.c b/sound/usb/usx2y/us144mkii.c
index 94553b61013c..58ef23146f20 100644
--- a/sound/usb/usx2y/us144mkii.c
+++ b/sound/usb/usx2y/us144mkii.c
@@ -585,19 +585,24 @@ static void tascam_disconnect(struct usb_interface *intf)
 		return;
 
 	if (intf->cur_altsetting->desc.bInterfaceNumber == 0) {
-		/* Ensure all deferred work is complete before freeing resources */
 		snd_card_disconnect(tascam->card);
-		cancel_work_sync(&tascam->stop_work);
-		cancel_work_sync(&tascam->capture_work);
-		cancel_work_sync(&tascam->midi_in_work);
-		cancel_work_sync(&tascam->midi_out_work);
-		cancel_work_sync(&tascam->stop_pcm_work);
 
+		/*
+		 * Kill the URBs before cancelling the work, so a late URB
+		 * completion cannot re-arm a work that then runs after
+		 * snd_card_free().
+		 */
 		usb_kill_anchored_urbs(&tascam->playback_anchor);
 		usb_kill_anchored_urbs(&tascam->capture_anchor);
 		usb_kill_anchored_urbs(&tascam->feedback_anchor);
 		usb_kill_anchored_urbs(&tascam->midi_in_anchor);
 		usb_kill_anchored_urbs(&tascam->midi_out_anchor);
+
+		cancel_work_sync(&tascam->stop_work);
+		cancel_work_sync(&tascam->capture_work);
+		cancel_work_sync(&tascam->midi_in_work);
+		cancel_work_sync(&tascam->midi_out_work);
+		cancel_work_sync(&tascam->stop_pcm_work);
 		timer_delete_sync(&tascam->error_timer);
 		tascam_free_urbs(tascam);
 		snd_card_free(tascam->card);
-- 
2.43.0

