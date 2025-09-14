Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68D1E515
	for <linux-sound@vger.kernel.org>; Sun, 14 Sep 2025 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757883630; cv=none; b=FkQXW4FV9lielQRXiy3Z8dDHFL1jD/P61f+8f+gvsLFXg5RQyHscG/gg60dE85aKcELbXcrYjxfGERavvMSU81V9xONFLuwz+tcd3mBNwOSs7uAnXOw9tn0qCyeXHl6Rc7jDsrOUK4r6ftesm+Q585LN6jZbaEw6l7rpkTIdjL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757883630; c=relaxed/simple;
	bh=uEiYwiQoAW8hMQLGLN7/ysrpPGt17wGdOfYRNEL7B5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dj4tnrfk0O3FhdoJVj6SFrsxUQW67a+pbZ7DX4G/33cq4J3wrAgkz8F//dBysQbmArZ2ZxM/mTlogz+OA5m4a/f0J4Al4yeykFHlI2YyrE6KfNNaJHcxmdZmydQVhfKxvmmkjEt7Rc2dLoQxggzxPNf3/1dwB9duvBEdZo9I65Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cf5G4Ppe; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cf5G4Ppe"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62f0bf564e4so1692354a12.3
        for <linux-sound@vger.kernel.org>; Sun, 14 Sep 2025 14:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757883627; x=1758488427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6o99YyuBnjUFUiAgMBZrvlSAftiV3PzBtzxmR7sfJvE=;
        b=Cf5G4Ppehg36u9sWecyzYGd676S7LosMo9Iwq2P8HPoRrPv7x6lbac3W88L6igWYbG
         9VW+/JATc6ZnZIJR4TB7TWhDBbOMx44kFI2d2kAUG5aQlXQtuNmAGrd8UABriOuyapxu
         8qTqG6y172X7x6Vk2E+Y6MW6byGQkZGaa0Ik1/bOf3BTmFlLVXd3vSbAw6jzlYccamEI
         8saS3cjd+Xh4RmTqS1aow4yVlM8bMif5i1f3fqFXwBwkoSUVKxrys5joeO7pGwaqvf1W
         NAaTXo8zvEpyT/111ihUuIho3RAKAGcDdiK6HbN5Xiiuv5zPFR3GoB25ABAj1zcmmkjz
         +gBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757883627; x=1758488427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6o99YyuBnjUFUiAgMBZrvlSAftiV3PzBtzxmR7sfJvE=;
        b=b9cAMRTS8d8XRwIhXpFbaIDh+yo3iKcXyXW/FUyyecq/NY0Hk78qXS2UFcIGAG9GxR
         j3y1BwLgZ0HrnypxNHM0BaL2YiubdzHhF1uLRmw19YjWbe9ZGLJCJRv1BQgeTR4JW033
         rgkP0t46hsBcULhyXkwMSJT9dVnjzHyvnCa87OahUv6zTa4CMUwW2gUpEn8f53Y6BC7s
         FGaj8nP+SQVl1OddGSSq0bDytUj3l0/wzIrAdwBsplI1KnU7nWLpai64IxEKIuXyndZg
         RjxX0+lgK7XM0EhmAyxUz2uY/LfetG/iCNrwbi88jFMGt8aeWBGFWC42i5I+PJUaJ3SP
         HqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+manugHk6gNlRR76d9I098/YkywoMkrg1hUkeTVB9O0lBwxufldfcwn0GiCPJOldLD19D0hllHwbS1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QKuCumL01632VlR/qvPX/jzRjCYOtYgy3B3HOz5+ZgX5Eeoh
	S8Wg2pYl0lBVoOu/POsffAkE4cfgFfTmY6cA8R5j84ijOCuzIInFfhw=
X-Gm-Gg: ASbGncsiSuTcUpK6RxzXjo8S2QIZhIpKNU/VGDo1rCtwZKBThN731O/oo+wgmAoSpfc
	SkdtrJCf4lL5zS021CYFpxVQIgq02W01KaWcrY7yqygAOtMumrU42QWHWhwD6TdcAVGEpCereeu
	blT2wAApEH3lTYJhWKVyuOjY1bJ7h0MzDJNtI/aazkANYDip0A6IFYGHSJGUAoBSc6mUS9xsR6j
	EEjhum+Ubm4yCmwNvB1xf3EfWxungzvKAWiG+cWX1XW4bJcqK1gXfHN0m5F3iFV1EGyjxPeQnPT
	HGBuHDQqZovpKhG3CWp0uqcs12d3lxMIhmNTnskvkEEqBm9Z3fzqblP/FyJK/vmX9XINOu18Z6N
	zxQoaXmyEhNIVsEkh2mkstUbhK0A2NBemvPCagFPH8rF4RC0=
X-Google-Smtp-Source: AGHT+IEJTfAOE4SXVvnMZJXfSiCXUP+glB0hAyajLfStm/gZeUg5YzgdetRjeZvlFu0Ssqcih7xpBw==
X-Received: by 2002:a17:907:2d26:b0:b11:3cd3:a46f with SMTP id a640c23a62f3a-b113cd3a774mr65570166b.53.1757883627260;
        Sun, 14 Sep 2025 14:00:27 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:226e:7d72:f695:46fd:3aef:7487])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd6f3sm798516066b.67.2025.09.14.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 14:00:26 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: tiwai@suse.com
Cc: kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ALSA: asihpi: Simplify error handling in PCM substream setup
Date: Sun, 14 Sep 2025 22:59:45 +0200
Message-Id: <20250914205945.214179-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor error handling in the PCM substream setup to combine redundant
checks and improve code readability. Free the dpcm structure and return
appropriate error codes (-EBUSY for HPI_ERROR_OBJ_ALREADY_OPEN, -EIO
for other errors) in a single block.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/pci/asihpi/asihpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 8419f2b6e58..fd0a67b772d 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -982,12 +982,12 @@ static int snd_card_asihpi_playback_open(struct snd_pcm_substream *substream)
 	err = hpi_outstream_open(card->hpi->adapter->index,
 			      substream->number, &dpcm->h_stream);
 	hpi_handle_error(err);
-	if (err)
+	if (err) {
 		kfree(dpcm);
-	if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
-		return -EBUSY;
-	if (err)
+		if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
+			return -EBUSY;
 		return -EIO;
+	}
 
 	/*? also check ASI5000 samplerate source
 	    If external, only support external rate.
@@ -1156,12 +1156,12 @@ static int snd_card_asihpi_capture_open(struct snd_pcm_substream *substream)
 	err = hpi_handle_error(
 	    hpi_instream_open(card->hpi->adapter->index,
 			     substream->number, &dpcm->h_stream));
-	if (err)
+	if (err) {
 		kfree(dpcm);
-	if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
-		return -EBUSY;
-	if (err)
+		if (err == HPI_ERROR_OBJ_ALREADY_OPEN)
+			return -EBUSY;
 		return -EIO;
+	}
 
 	timer_setup(&dpcm->timer, snd_card_asihpi_timer_function, 0);
 	dpcm->substream = substream;
-- 
2.39.5

