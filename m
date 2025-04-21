Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D691CDFD4
	for <linux-sound@vger.kernel.org>; Mon, 21 Apr 2025 08:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745225572; cv=none; b=nkEEwt7oSOujphUcOQCUFTtlS2A7e9EXLJKBcf2yuQxLmiBNr/U7ZoCm3Cvw+dVaBV4CH0Ql3HyPIEwxKHKK3aRTkNP3N7wQY2r5+munC6Q8XKTm48XBZ7b4XZ7uhwdYiJNVz99MuU/3PTWEY7JQAZnSmm5kh6PCGEkcFS3T2k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745225572; c=relaxed/simple;
	bh=DIHI0tIPH9BXUto5ZY1D7qq6INW9gd1oLws920quGL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pV4Gluike0Iba3cv3ZMwIGu1Qr2pPw/D9po7onHcS17aBbfumL7LYWR0X5a2VdRyScxxYq7AA+OHBjmsXfzNbIT8gHoZ/0zSNA2YwNfEJb5jpVcSdnam4Tnvce1dl7DWyDqP7trwsZB630j4DGx77wlCtYH7aZT9VK0ILDJqdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hjYXrpIg; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hjYXrpIg"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33e5013aso42084895ad.0
        for <linux-sound@vger.kernel.org>; Mon, 21 Apr 2025 01:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745225569; x=1745830369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sFbc26F8s5iAkGemix678TNWKgIFLRVWnVLyAhNpXlE=;
        b=hjYXrpIg5qs2HGBIHPu+wH7vgsVmJAi+UTdmKQRY+05DZgqs9I4dMoP3n2mRNUn0FK
         aZ84Faenowdor/wbpXgxDp2GqoPJDHDL/2l9tm0RTbhY8M2WE+Dt5/fT9qHqyEP/BCwY
         PE8xHoCPqHO6bNJoFPsC6fqldSQP7GI8SdBZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745225569; x=1745830369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFbc26F8s5iAkGemix678TNWKgIFLRVWnVLyAhNpXlE=;
        b=Uw4l4YDgr58OhJpMTZXn/DO5dnUsY/44lsThq0x7gl+PgqMgqM5G6n9mzgCnnn3LGv
         dtoMDbo42U2gR4z3cO6XUswxqv6MSZqdeZ4WNQNRsEvEJ/GdJQMjed5/P0ia0VgtbYjV
         mlgUg0ov6MkZGXRKj9wAnA17adlJZAyUrDj+NNIRfzdKViglAfddUzl+Dr9LxnhOXt8H
         H1jSQBtd1qITNk8tu8iewp1y3bStd+xv8Y+esrmD+7Sydb0qWXwiBrOwF+1Vs5LgVc9J
         AWI1CyVEVQA/Fg6rjxD4dETiNWWy4VkkYbZOsqhY+vdFtywmn3vAH1k09I15LDZDwGxx
         RNJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt/HFVRwInoxV2lxCJBcNQ9upQm6Ui6/IGkPQZxjqsvJNOAhaBdnydykgUfEdTIxUw3peKcmM2mNktIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVtuT1QxsbvXZNgB1QBz/7JGNYlXuiqUJlw6XtIca61ZWCVy7P
	9eOZWnN+2OAUk7u33+Ig4zWTUbJPd/ZMwo/6XggKBB7Cje/FVWr5Bp7yrADCIFel+1cHXzVtJZo
	=
X-Gm-Gg: ASbGncsTsf/jMmdQDmrQbOsn5uZQiVi74OteW6nkLP73EqtuqY0l5I8Jie+g6brSCR1
	g667BPpftlx/yupNwGeQBloNab/Ocbnnfavd7l0ygdZPzrWqBaD3/9Jo1TcEamfZnOcXWp2gubZ
	Qywc7obkbbzwLu2uQMiKpkbhwvEzfcFTTT8NTtLMu+W9muBhLvptqp2dNiSMF6V5PYqc/V5ldJw
	Gsq/kJhUG7CEPS68HKkIMG+/7jhEcnRHBS51KkJerUpCJB26TX44/x/6AlqbIoA2tybb8OFHLKA
	UlERiu7bACSmeVYrkh2zMOUyl+y3wiYLzwFTBP1sx+PxP+QEiobAW1BAyIyQ1aEzjgEbvQ==
X-Google-Smtp-Source: AGHT+IGy+yWhvnto5NJnKovlWlBqjGSLK0cR8LmnpG6uo68hWK2dR/x5E5cKtj1I7It6Il6i+U9rzQ==
X-Received: by 2002:a17:903:3011:b0:227:e7c7:d451 with SMTP id d9443c01a7336-22c535bfe27mr138367845ad.29.1745225568851;
        Mon, 21 Apr 2025 01:52:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdaca6sm60671705ad.9.2025.04.21.01.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:52:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: pcm: Make snd_pcm_lib_malloc_pages() debug message say "allocate"
Date: Mon, 21 Apr 2025 16:52:42 +0800
Message-ID: <20250421085244.377228-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_pcm_lib_malloc_pages() is commonly used for allocating buffers during
the hw_params callback, whereas preallocating buffers goes through
preallocate_pcm_pages().

Having the same terminology in the failure debug messages in both
misleads developers.

Change the debug message in snd_pcm_lib_malloc_pages() to use the
term "allocate" to match its intended use.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I found this small discrepancy in the ALSA PCM memory management debug
messages that made it a bit confusing for me to trace code.

 sound/core/pcm_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index ea3941f8666b..56725d36825b 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -458,7 +458,7 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 				   substream->stream,
 				   size, dmab) < 0) {
 			kfree(dmab);
-			pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot preallocate for size %zu\n",
+			pr_debug("ALSA pcmC%dD%d%c,%d:%s: cannot allocate for size %zu\n",
 				 substream->pcm->card->number, substream->pcm->device,
 				 substream->stream ? 'c' : 'p', substream->number,
 				 substream->pcm->name, size);
-- 
2.49.0.805.g082f7c87e0-goog

