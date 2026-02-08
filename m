Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C651D7E5C
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 18:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770576872; cv=none; b=cvFvYeRzT69s/7wWYrwhGkMhT7189uNAAItMAQWNr+C5dWDH2sP5sJkLYlJgS0CN8UuIv+Sbg/vCttfY/iRt4daJOB4NGu6414js5CER/40DOWjl6seQx1jkkzcpXoSiUOi+KHzJgmm1oH3q5oiU0FRlZIuPLw2CIn1NoLRNPgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770576872; c=relaxed/simple;
	bh=LXYmBSfO6x+yIZrevFFTHCRtbMkdIUri01dEzgoJq6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M7BQUSQRXTq1S0GeGBm1G+HeQpEMA+fDU/W3An+5o8f8jtQ2uQ3I3FZmAJkg9jC8lMY1HDE11ZudznTIZDxjrKFPItZJ7rNb2DjN4iL+fr64UZcoyAhTd86dBJru9pqb2UTE3tctfX1yo6CLrpBQOQlb4lG25XJvQLwNOxFN+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VM9++Kpb; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VM9++Kpb"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-35519fd4d59so242261a91.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Feb 2026 10:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770576872; x=1771181672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gC8y831kn5k4ckN6j0puA3kqRju65NM/epLUWWwdaU=;
        b=VM9++KpbBzMNjYg2FXvLMMbVtaFERbms9VJgWycxO4J2gqtJ7199gbl3AvQ5aYUImH
         sbanDtLbVgjYI5/CoGUq4CqWRBq9Ve0eUBs46hjahahQrwiGaZZCU/JInPxY5O9+VLtF
         KB3IXHAxDZWzsHIWWci1lCSdqzGKlvTQtvw1MK26xr2LC36Qrg1KubdJx52O3gjvx36E
         OLoVJlqx1wS2e4T5kYzrq+KCuaEIfUVPvKSec64uBToyRG6cINxQIdzvl3iAQsuHJQfD
         X4bCyYYw6dH5HvXFsk8UqTzxiVJ+2M3LIGg+eYwbYBvpRifOpHtzaRQ9OJtzkmaPzxu8
         EiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770576872; x=1771181672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gC8y831kn5k4ckN6j0puA3kqRju65NM/epLUWWwdaU=;
        b=vnbNSVKuPJyY94QGP/gkwSEai2s/VM8fEAA2WLaPifVEiaw5UoKIax9Wd82qwGByz6
         uzMXnTFWJRsN9jeb6JnCjti4ICFNcPu+1n/NaxTPDc1YPyTm8zhndCwtUFMfXnVQUN8/
         JOcJ7yH+l4ARxXaLUsiD238lJt0sRSFaR03cnFnRHXFB3rRGx7wiJZ75pwdjnZcHAD3l
         Cz+a0tZEjbeOkI2LZPIxf0ZCx293UmdCPrRYwWxjCMj3N36OzOVqQ7sRb02WHGCYt8iV
         nubZaajNlV7RbNckOVMLci+d4hXoV5+2t5esNurp4fUwaF2vp5fo+HdFRiPB1TEhkJwp
         08og==
X-Forwarded-Encrypted: i=1; AJvYcCVXPCnEar0ChDZG66ZGsyL1KohX64nqlPgV6bdijh8dvHlahtukmyi/+hE+DJujvAw3GQ0O+k5CzQ5mAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBsn+x08mMu72tnvtqLKQ2irFK1bShP5DTBC043pZy1/1sIEs
	EYsRHK6o7hZX3CnZpr+juEXOwcTICM/w0hixTJwQ2nPyrz0PlsTdJAy8
X-Gm-Gg: AZuq6aIqSIevuBU9c+b9fXTIrh0spZfzO9s7W/decv+TRBdsiOaMkIR+7AnWs/r4CRF
	mW2CONmgD3aued0LL+7+ZFftQRz522QbcJYGJ2J7ud823T9xBYDKmQd4EUt3Qn4LaTbfljo7Q9D
	3g0TuVERBg1Og0h4ldC1YW6u61ExChUjg+au/NwIJPifhnOBfwPPj2mW9Tk2s8bI+rvkRPjcjgy
	DF89pdjhsdVkF1iLVujfPV0zfw/+kVXut+BND4iSDiIEsQZvp5lOD459+RThdqmsvcDMKNrA3xW
	QFW/Dq8AaHSKjeZZX+yYPNg1VevuX0S3854+9Sy/KF948S1OgM/PZlJf7pHpgARWfV+MHMIZ/7d
	bpglcYy21RyXVGb0GYf6uK9ljA9rGr4Y0kWGeVYrLS8E8r6zYtWmSt+bryO4OTb7eN5R6sQ4f6f
	f5io9wTje6RZv/pJxnMaAZPE9ZUtoRgm89sclkkhNIRN2lVbpyCCkcm9TRIGfA6KUNExf1dFkdj
	g==
X-Received: by 2002:a17:90b:3f0f:b0:356:2c88:1e77 with SMTP id 98e67ed59e1d1-3562c88205bmr1862080a91.1.1770576871554;
        Sun, 08 Feb 2026 10:54:31 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:6701:1a40:3367:d89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354c6898e82sm5379828a91.1.2026.02.08.10.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 10:54:31 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Soham Kute <officialsohamkute@gmail.com>,
	syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com
Subject: [PATCH] ALSA: pcm: prevent snd_pcm_action after substream detach
Date: Mon,  9 Feb 2026 00:23:40 +0530
Message-Id: <20260208185340.8379-1-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a slab use-after-free in snd_pcm_post_stop() caused by
snd_pcm_action() being invoked after snd_pcm_detach_substream() has
already freed the PCM runtime.

The previous approach attempted to guard against NULL runtime access in
the post-action callback, which only masked the symptom.  As pointed out
in review, this does not address the underlying lifetime issue.

Fix the root cause by preventing snd_pcm_action() from running once the
substream runtime has been detached, ensuring that no PCM actions are
executed after teardown.

Reported-by: syzbot+16b2b67ae905feb8a289@syzkaller.appspotmail.com

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 sound/core/pcm_native.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 932a9bf98..a29dbbc21 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1391,6 +1391,9 @@ static int snd_pcm_action(const struct action_ops *ops,
 	struct snd_pcm_group *group;
 	int res;
 
+	if (WARN_ON_ONCE(!substream->runtime))
+		return 0;
+	
 	group = snd_pcm_stream_group_ref(substream);
 	if (group)
 		res = snd_pcm_action_group(ops, substream, state, true);
-- 
2.34.1

