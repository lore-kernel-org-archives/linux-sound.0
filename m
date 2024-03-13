Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E620DF4
	for <linux-sound@vger.kernel.org>; Wed, 13 Mar 2024 08:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710317720; cv=none; b=EZJcJQbsNyheAD9FhGCZL5YlK1QmrIq2HlInWPi81bWTbrnWUf/hnsZie1AfwvHkL0YVkNpGkhshStwOb5GvooQl5LsscmO4YF4l+xa8d80daBTHn3ixfayIAGZdHn7Iyw7w9OKMHAWRk09MUO++e8Ou9sdp5E3oYBXSwdyLMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710317720; c=relaxed/simple;
	bh=h/MXWXp+5T4OLqk46Oo+aG62YS68LikNztRly1tLnlU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jR0hnkZDkFo5Oi9QnkffolX21p5FzIKqDLmP6extPR04yGZpL9bE28O58zvtSDPnl1S4Zzbm7EuYVC3uBv6FlEVgbLj1IWqZCxPrqsZArNBExpLWnZaKS/u1XdYuebByUkpEjC4VuBwzcY6nViNoSg4RZQeHC2xitnw6XD2d+HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=teenage.engineering; spf=pass smtp.mailfrom=teenage.engineering; dkim=pass (1024-bit key) header.d=teenage.engineering header.i=@teenage.engineering header.b=I5jxbVYr; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=teenage.engineering
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=teenage.engineering
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=teenage.engineering header.i=@teenage.engineering header.b="I5jxbVYr"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-513c53ed3d8so811673e87.3
        for <linux-sound@vger.kernel.org>; Wed, 13 Mar 2024 01:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teenage.engineering; s=google; t=1710317717; x=1710922517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qmozHBUZheLp78P11XSScWHwwKieGZ5T3nJBgYjdcW0=;
        b=I5jxbVYrSyS8Te34i+F6uIJPmwu3XXmUWr39uulyzN1eH96rPZ7Z/RvfQm/7U0C7b5
         ZaA16tNBTEVMOoT9KvPIcKcyAM1Sa2sfWCN/y78VQigRlCI1BAFToGj4J+gMSDWDZZVV
         oICIfuCLRGDViSR4IwMxOML1WwEL7bvovWhGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710317717; x=1710922517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmozHBUZheLp78P11XSScWHwwKieGZ5T3nJBgYjdcW0=;
        b=pXugSx4EGtVPrRQtW7mH/6+8EP+SV/CJRQLxNZ9jNlvHM8oQb/AuMf2Iq+HkuwZ6wc
         OBvOGwtjT7Hetjhjrut/gbZiQZRC3OIptt6/DP990+fBw4WiCZYC+zphiCcUx0AB7OFi
         cZl4q4peRuk+hvzjapew9fFIskU91JDv7ZjqumKLU61Z78Djaf1pWTM+TdV6CAG/nQGO
         cXz/znbhU3GBWulBtnTL3LV4UvhNg2s7j0ZeHcIh1hRm/rUDXt1NdJE7yLnvjbqE46wk
         FFCU/04YXDPj6b0k6ed/HXOJG50F07JgejPH2uowEedzdhccISW+JkMaV83Df2Z/Ipbw
         cCpQ==
X-Gm-Message-State: AOJu0YwsmkgrsHhiVvx/jLMGIgCizgIS6OohNQRPxg8sA4bIOQeiVHYA
	xf/q56JSJ0T+m7QgHwgBa59RWMM6yI/GrWC5M6r6+oShXDDtSYWlW8Y+GXLHEIQ=
X-Google-Smtp-Source: AGHT+IFgmFeUFKduS1LLceFgm2mn/x7XTScG0H2L6fgwPyVlM+9yabihGv/zZjC175HXQElBF1wCGg==
X-Received: by 2002:a05:6512:3246:b0:513:aef9:a7d8 with SMTP id c6-20020a056512324600b00513aef9a7d8mr1456974lfr.47.1710317716697;
        Wed, 13 Mar 2024 01:15:16 -0700 (PDT)
Received: from localhost.localdomain (212-107-146-90.customers.ownit.se. [212.107.146.90])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00512f6cc7fc1sm1979596lfg.55.2024.03.13.01.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:15:16 -0700 (PDT)
From: Johan Carlsson <johan.carlsson@teenage.engineering>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	Johan Carlsson <johan.carlsson@teenage.engineering>
Subject: [PATCH v2] ALSA: usb-audio: Stop parsing channels bits when all channels are found.
Date: Wed, 13 Mar 2024 09:15:09 +0100
Message-Id: <20240313081509.9801-1-johan.carlsson@teenage.engineering>
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
index 3d4add94e367..d5409f387945 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -300,9 +300,12 @@ static struct snd_pcm_chmap_elem *convert_chmap(int channels, unsigned int bits,
 	c = 0;
 
 	if (bits) {
-		for (; bits && *maps; maps++, bits >>= 1)
+		for (; bits && *maps; maps++, bits >>= 1) {
 			if (bits & 1)
 				chmap->map[c++] = *maps;
+			if (c == chmap->channels)
+				break;
+		}
 	} else {
 		/* If we're missing wChannelConfig, then guess something
 		    to make sure the channel map is not skipped entirely */
-- 
2.34.1

