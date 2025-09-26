Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CCB2F7471
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758904078; cv=none; b=tLaMI5k9HmnUXCjUmrLbfDDngD9OUIJ+qzFxZa3ZkrAqug/G6vrJC0j5IJghZ973aMidgCYLxPEfCpokTCeThv7JUoQHr//0e13bvNLLRSPt0H4kzunHHOJIof3uXl9KE5xLjhNHkqzdySsAmPR/A2dN6KQCE9ruXeByogOIgGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758904078; c=relaxed/simple;
	bh=ji/pYhlnACaKaOAfYIWNSXFRexU3GRsGkKmsdd6hDxA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BMACcjgkHU6ZZqvxHWDx1q+VsP7ULP1typ7nphKHlmm1gA9iFOi95a4k8aKesfxsDYJyRLBhno71AG2rZPrPwqMt/hTYnpg81W+9jfOyW11nZmjFKXoN6Ovi9foDtuWAaoR5F0wvFbiYMmt0h9AU9FGETn+CTHUO0nmT0yhjaWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mh2Pqbs+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mh2Pqbs+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso2357582b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758904077; x=1759508877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Neebg3bGNAkQ/ROETpufeOc+tWzliPzskjjkM8BaCbQ=;
        b=mh2Pqbs+3W17EqKKopkl/hxLd041ECQ8gQ9dka2es66WtMHrCSE10K0gCCdhIedsxA
         qeh+JEez7J5yY1iRosTktuJuhdk7p79iDdjINwNmrTXErWVcyzCZvg7g0p7OiquvU1O7
         oIZLeFRHJNG9lcW0o+FLRxamcXFX0YmDKA0SHH3tfXDFGy/vrKpeNCtsLdea+D5PgFCq
         IWI1phNXvhELSV8JSwEJm0NiaGSlm/tiYLHoqFmwGV6m2thcnwV3lLp9klLiwqOpvaE6
         LIYHHZyIs6HhX2E1/JXo0+T+9WF2vO267t3nl2Il6pxMylM/4hg+hnPzXuJCrXA/4C1F
         MygQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758904077; x=1759508877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Neebg3bGNAkQ/ROETpufeOc+tWzliPzskjjkM8BaCbQ=;
        b=vAXS33XIPGNNg7PuJgd9NChSHzCubSg0XgtDgCyAyDzW9Q+eb8OtOIaAnvsTYyrekw
         YzuWukwSH0ppt3wTnaYK4mUO8afIqQkrEdHSqXuUNp5Y/5aXSihZ5skLJ2AgJHh1eyAk
         1pE2eLn34txzWJrScuBbmEzM6K9PZ10HMT+LBfqpTgH4lw4L3iMzuchiS0AyT2rTuWSD
         ZteOyw8j9XqChLI4zRhT4niIaVjn1EP4Jd3KKRhBQMHo/vVQX90xbyrwzVnjrCMeXwOI
         XXJIEA/yBryOyOyl54UK017icp4ZVhvVVeg/PpPeznjkjj6pOc+PMgYEaeL/UrS7Ck5c
         qtbQ==
X-Gm-Message-State: AOJu0YzWwcs1m0FtdgGiyLgZccyH+nFjsTFENULgfEGTcb0mkjfDWf3Y
	i6lB+rbChNlhYFZyicHT1+qlL+dJZzFXnZU9cREQ0Jf6qsRcwEmsGi9/
X-Gm-Gg: ASbGncsp5Qhk2fklL+ubLUnYl0R6u9huUlFdEYTo+msI4pms6ZqE3aL9A7aTvsZoEts
	KNv++ZY4000xyaffE7GsmKV8qhRCQOPVCS87x+yKMFWJmNv3R2XlHmIbrM+ZMnGQQCOpohCUwux
	3yfgmNe7pKpEj7+tNqcacS8LGjfpErGnMfLFD92GGN2I/YNAKmdjD4MqoXv6PTeNYFI3U+5dYnO
	V++gHExrDJ3PTlQjtQ7lRJXoSguB/KCrle1PSefO8Tf4cW+DIh1eHNDN7fxH7+ImXjLeTsldqZZ
	qunoSD6s1l/bez/IFSmQU4bD5Dj7917r1uQ+YpvNUtyoUbgZvWA7QcV7oHY6tkaGW0sZXonXOxI
	+PgZv/8bTvztFspBN9FxeSSulv8fokiZO0DOMdPOn0J70Yee2BdX+8Eq5tj9/qqV6zi9b7FRogz
	nuQBM0nolCghlZTazyyu2FPdN8Jga4dzEKUu/4
X-Google-Smtp-Source: AGHT+IEQE5jqGklvdW2MJi+BHY9hlv8FvmTiKo/dGoO+8Vpcz9GROlQK10cosgequifhuEVqUAhh7w==
X-Received: by 2002:a17:903:2352:b0:26c:4085:e3f5 with SMTP id d9443c01a7336-27ed4a56c51mr75752515ad.50.1758904076490;
        Fri, 26 Sep 2025 09:27:56 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ab64c7sm57277395ad.130.2025.09.26.09.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 09:27:55 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] docs: sound: describe 'chan_map' member in snd_dec_opus
Date: Fri, 26 Sep 2025 16:26:58 +0000
Message-Id: <20250926162658.989479-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building kernel docs, the following warning appeared:

  WARNING: ./include/uapi/sound/compress_params.h:364 struct member 'chan_map' not described in 'snd_dec_opus'

The inline struct 'snd_dec_opus_ch_map' inside 'snd_dec_opus' was not properly documented.
This patch documents the 'chan_map' member and its fields (stream_count, coupled_count, channel_map), resolving the warning.

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 include/uapi/sound/compress_params.h | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index faf4fa911f7f..e90e2f40732a 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -336,16 +336,14 @@ struct snd_dec_ape {
  * @mapping_family: Order and meaning of output channels. Only values 0 and 1
  * are expected; values 2..255 are not recommended for playback.
  *
- * Optional channel mapping table. Describes mapping of opus streams to decoded
- * channels.
- * @struct snd_dec_opus_ch_map
- *	@stream_count: Number of streams encoded in each Ogg packet.
- *	@coupled_count: Number of streams whose decoders are used for two
- *		channels.
- *	@channel_map: describes which decoded channel to be used for each one.
- *		See RFC doc for details.
- *		This supports only mapping families 0 and 1, therefore max
- *		number of channels is 8.
+ * @chan_map: Optional channel mapping table. Describes mapping of opus streams
+ *            to decoded channels. Fields:
+ *              - @stream_count: Number of streams encoded in each Ogg packet.
+ *              - @coupled_count: Number of streams whose decoders are used
+ *                                for two channels.
+ *              - @channel_map: Which decoded channel to be used for each one.
+ *                              Supports only mapping families 0 and 1,
+ *                              max number of channels is 8.
  *
  * These options were extracted from RFC7845 Section 5.
  */
-- 
2.34.1

