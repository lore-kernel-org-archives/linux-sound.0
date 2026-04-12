Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4A299959
	for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776015942; cv=none; b=XEsaA3UdUtrJdYn+41EFiG3jqBbvRML8lLhX2RyJaiZoA/3RMLk19Pw1HEYMMbuVS/MRwSdDFbEbZx3YDTHA/ksuEmu4SmlRdz4dfMTZ25tN7NLiEPtB9+jBz9ZRc0Z7goTjTPjpdculCxo891KH8ZNXZPT7aAw6kbEseDcAfck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776015942; c=relaxed/simple;
	bh=MvFqTtD18D5DAv92JGkSRWZaXoO1lYwBKr6BusmvkEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tw8/bu7xLI6O/FuSMhejleed1i6PrrFeKUQK+Clts49ouLaZnG9t+eIEPTb+CQyMrvqU5R60yJ9VS0C0HPoW3f+oWoQJ6MLWkh6H2n+nOc5VrEku8drOGFVgHSO4K4SrU27lW4tqzts1dGhaLefKZaMOqgKxWXmVDDEXKfMFMQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9/xkXd1; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9/xkXd1"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f1dcd5886so901313b3a.2
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776015940; x=1776620740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/OoU5jmpe1DqxkQY//ANPB23eMZd7k19jDj8fX9LlbM=;
        b=m9/xkXd1+VePVXd/wRrhpvwXmPE104FdETsUUVnDZfunl6jKJcgN51Hlw03J/WKWfs
         y68H0G8yiHjqUwkhbjpa/ZsNcp6NbFIdskZM9bhF7EY5pdzdpns2KYFMgrwNROuV+Cyi
         IscnSBfR2dRcctyrWX4CHALqRMrMEQAmXrbheytT0Zaso22bPPae4TM0YRRcU2o467Rm
         TFNQfXrfJ+Fhtjyk5JXYalukcJ+ElOeDrYe9L4Su01ijiJF+6a6nrhLGM9DWynCGp+rx
         zbz7peRrwoqUEOFMzyooImNMGy4Aqy/4HJLEE563ixx8OF6B+8MnpyYzQO+tV1lRzh5d
         sy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776015940; x=1776620740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OoU5jmpe1DqxkQY//ANPB23eMZd7k19jDj8fX9LlbM=;
        b=dbEgQsDzgqteQq/pRckQV/nVD+Tm8x3Kl9NAnstT0FjjMYP8fKJEMPkmxdqOd+lpuQ
         l4MEAgYI2Oe0U5gvxvurt94ZTyDRJLn4SVQ1NOFQ53tr2yTKKxPz5oFwl2BddxqdWo5B
         zwEqrQnSGC5hqS7DLhGnKawl2Wy2fcxKXZaPnxkFvRz6AQq2PJ+j9z9JyCr9qJ81oMKD
         thkKAuw24j+GFxzXO7/LH7f7jjKCKOb2aqya5uDR9JVR8/8f10lxc2c+muFUH7gYMszC
         kacXD4NvrTujVd+gK8bM8fSmfrq/H+fb68LPl555fO46He+kbMNEqZKpJ86u6wDfdeRz
         5AsA==
X-Forwarded-Encrypted: i=1; AJvYcCUxzxCkLFtgfF8y8Q9pbQpEXKu9GfEqBg4IKwCuNCXsGLAbwGi9Pm/B8CJxvgb1A9QVBbpn/Wx3DlOpcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVJIOdoSPi0kwqaBzAa6mo8VjVqfMxCabudY4vUej/iUMXwU8a
	ime+u+yydTy8rlh20CJghdoMklZKM+oovX4Nb32adQOlj96eaXVg4Fie
X-Gm-Gg: AeBDiesuLZL0SN6uHdGjzxuqtVTfgvzOXG3WtDtAIcUBR2OSO5SgtgZioVertwswVPT
	Lp/HxsVWpDeXbcUwkuhWU/Vz5WJuQmpcjEs1giEGk4Lob7GRrQy9HO4GJoL1y1HKL5Q0szklqB1
	9JNLN0haexpOwyQWVrMmTw1xK4xhSZ2p8MdrZan++otTevVLtrFNSCHkqp3IpvE4LUZ0baMBg9Y
	sM9x1eVp/g4MfYMvd+OAVMX0YjiT5/DOteIV+mNkEUiYRtdI3FjyqqTI03gYPiVnszyXp/F54tJ
	ejqy98ahpbItdAt8YRK2CSESepWr7AJYdiHvh5re2j9HJ/WbYc+4dx+iog9Dr6hqV6r8shG6aOg
	UW6cW2e4MribQYr7aPM5VonQoHUrB6lHa2auYtMY2CL8iYM5KOx20CyMiKIoDBYgE3X05OX39bJ
	HATGqeow96x6CHEQvtknZUrHHxdw==
X-Received: by 2002:a05:6a00:a245:b0:82c:6d88:2a8e with SMTP id d2e1a72fcca58-82f0c28903fmr11551470b3a.20.1776015940377;
        Sun, 12 Apr 2026 10:45:40 -0700 (PDT)
Received: from lgs.. ([2409:893d:1188:142d:6dbb:2e05:75d3:967e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c4e182csm8999464b3a.45.2026.04.12.10.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:45:39 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Curtis Malainey <cujomalainey@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ALSA: hwdep: fix NULL dereference on error path
Date: Mon, 13 Apr 2026 01:45:29 +0800
Message-ID: <20260412174529.2597250-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_hwdep_new() allocates a hwdep instance first and then allocates
hwdep->dev via snd_device_alloc().

When snd_device_alloc() fails, hwdep->dev remains NULL, because
snd_device_alloc() clears *dev_p before attempting to allocate the
device object. The error path then calls snd_hwdep_free(), which
unconditionally invokes put_device(hwdep->dev).

This may lead to a NULL pointer dereference in put_device().

Fixes: 897c8882df58 ("ALSA: hwdep: Don't embed device")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/core/hwdep.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 09200df2932c..aa35bee8da6b 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -343,7 +343,8 @@ static void snd_hwdep_free(struct snd_hwdep *hwdep)
 		return;
 	if (hwdep->private_free)
 		hwdep->private_free(hwdep);
-	put_device(hwdep->dev);
+	if (hwdep->dev)
+		put_device(hwdep->dev);
 	kfree(hwdep);
 }
 
-- 
2.43.0

