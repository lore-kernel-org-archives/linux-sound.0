Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DD679B91
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710250479; cv=none; b=Vk8MxQQp9Jy7HP9cSaQpMYzG9PC2I/Dnglr4M0qNCFGq2FgxLBL/gpCbRonTbvLK/MgK32lCL0bGtf2Bqqx3B7fiPV5CcuehdIj3b0ot/uhNawVva/Bm2kLQcf5cvtWlf+mhgEibJWwqYTizLIcr9Fbd7beGMn3VSIBmI6RvUT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710250479; c=relaxed/simple;
	bh=RoCKyGoFOXTXBcI66pHFhEIiNwcqkU6ZzabdP+m1KHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TL5uWh2TVwEGuh6IJZmO8CcljUw41kxcGbijkbrRS4D3OmJvwLvpfw01s0KtJvqQRIqoJ1bHQ7m3CSpG6/Vv/MkfHEkvwgmNQ0D8zGjhvEHof4XrrcTSVJtgEtJpm/Ck8lsEPVbG+vP2cMPLEpdE/gKNRda+0KMDYJZNy5FAn6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=teenage.engineering; spf=pass smtp.mailfrom=teenage.engineering; dkim=pass (1024-bit key) header.d=teenage.engineering header.i=@teenage.engineering header.b=dwIO502c; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=teenage.engineering
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=teenage.engineering
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=teenage.engineering header.i=@teenage.engineering header.b="dwIO502c"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-513173e8191so5757622e87.1
        for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teenage.engineering; s=google; t=1710250475; x=1710855275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ydK834n5Y01WNKzZ3f80iHRR/lm34FccFQgm4PjBZd0=;
        b=dwIO502cgnX7hpY1lTe2g69yytKl7DHcxYQ28tVek+78O/MIvvHd4GiRzWRW5vQ3ww
         tbfj2+yA25smAYkuEmbeBU57xTWVjpqPm8T23GALk2txFjckASVs0Kz6t1NG5DAobXNf
         oBpUqeYFRv97dtBAP4WRT+I/mHRaSFZq7ceCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710250475; x=1710855275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ydK834n5Y01WNKzZ3f80iHRR/lm34FccFQgm4PjBZd0=;
        b=g369jy6oLpLfJPL5AezNmciVQRt2ZHw9gVQiSJk0UhP4aIZpIdi7ucGOG3hSyUFhmm
         /o5QHhKJVLbb4RrvswNa/tB4W6q2B3UV268A3h1vDtxjGaT/bZdb28KixBW9Tqwqe4wm
         kCSYTaQjYvwaP3bCUIhQMGFp0LB5LGm2mWwmKWGWL/1eSueFJBiPBDkBPy1qK7N3QWsw
         QocWbTXk1iSaD3UunLD+6qE0O5QkV2SOmMJNR/ZAIb6hem4r9V12JxYywnua/okHqVZ5
         VZ6S0sXzWJjmD4EjcE5xwKq6usra5yhSQ9mipGDGbZVygE0qr6eUUN8YxE5X+/LBLE62
         bs2Q==
X-Gm-Message-State: AOJu0YwDPSLhEjpji8E/NyJVfwUK5M0UKkzZPJMUfqRPhPBsKCygoQLD
	ZRvek1hiowCrtl65jy6RDMwpMrSrFJC7suOG+/7DVX1l4zE7bSEJvKaYiGl05/8=
X-Google-Smtp-Source: AGHT+IE4uj5CrZLeYM5TNm+LonyTH0gKYw8widC+2ebBXmlYOGegPu776ofdhfQXUkEQl8DWhspHeg==
X-Received: by 2002:a05:6512:1251:b0:513:4e8e:43db with SMTP id fb17-20020a056512125100b005134e8e43dbmr148542lfb.65.1710250475453;
        Tue, 12 Mar 2024 06:34:35 -0700 (PDT)
Received: from localhost.localdomain (212-107-146-90.customers.ownit.se. [212.107.146.90])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512358600b0051357109ac6sm1587332lfr.285.2024.03.12.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:34:35 -0700 (PDT)
From: Johan Carlsson <johan.carlsson@teenage.engineering>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Johan Carlsson <johan.carlsson@teenage.engineering>
Subject: [PATCH] ALSA: usb-audio: Stop parsing channels bits when all channels are found.
Date: Tue, 12 Mar 2024 14:34:20 +0100
Message-Id: <20240312133420.11289-1-johan.carlsson@teenage.engineering>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a usb audio device sets more bits than the amount of channels
it could write outside of the map array.

Signed-off-by: Johan Carlsson <johan.carlsson@teenage.engineering>
---
 sound/usb/stream.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 3d4add94e367..d591a526cca1 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -300,9 +300,12 @@ static struct snd_pcm_chmap_elem *convert_chmap(int channels, unsigned int bits,
 	c = 0;
 
 	if (bits) {
-		for (; bits && *maps; maps++, bits >>= 1)
+		for (; bits && *maps; maps++, bits >>= 1) {
 			if (bits & 1)
 				chmap->map[c++] = *maps;
+			if (c == chmaps->channels)
+				break;
+		}
 	} else {
 		/* If we're missing wChannelConfig, then guess something
 		    to make sure the channel map is not skipped entirely */
-- 
2.34.1

