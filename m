Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21343A812
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277168; cv=none; b=hvmiGpR0THXJkAAWoDpgKkjDHRAxieizgFa8KBGDfcSpM+xHJjOh4HhDykE3o9Zaem/yi8LNCz2dptdCNGZ9sCGdCn4FqXwU4oLYP6tfavX+um2YKWmVLgepFsdSLJhxuG28ygyME841rmUt6XR7EMS5FqSiq5G09623MRGBM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277168; c=relaxed/simple;
	bh=qkr4q5KdgXJEfFYuUUIrj4vkmS93yxMLGX/Z6JiOeSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUOi2PPax7XwyOkjkiignFKTuY4kcgDwrBtK/gSvE7JE/F1vJoxjcsq+qBvv/Nkn4ss3tE45fibJwJQeWrzoBOoUA8VmIF0NUb8KQbUkDCDpB7qLbFEXGGk00YKxRVolCuF+TZF/OmXy4spIRLex2OV5XETqusct6SXocnEPw9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5o8fpxM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5o8fpxM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d032846c95so56425775ad.1
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 08:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277167; x=1788881967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhXsLrMw6uGJqdKD+EVf9KpbhezP2a9NqvtLPXOgVgY=;
        b=k5o8fpxMX6hspHCekG5S4121CWmOkAIBb/OxdlwyRbGbTQMtcbKmQR4aZab9rDDZ6z
         nCF/qv+rgMCpCScPwkmKopoqoeNJMBHp//SZ5ojL6I7xqFuJ7f6WZzrWBBUh/ZUuwDB6
         VmrK6ybKwz9JLNiU3WfugjJDBx1L6l2bheAGl9451gDnXdFfU7+P94wYgwdic4w0QzKi
         lcX/FpzbP0PuJiyCwy6zqLJ0V2uXOZCn2AxP3xnmfgnRksz80Ro5An2cFzCyAWY9SjkP
         H6Y92+wpywVpPJ26rbBdm0m5RSpsIAYW9y8UXpxVO5Iy17STmPluliz0lVJV004Ja4X0
         WC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277167; x=1788881967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhXsLrMw6uGJqdKD+EVf9KpbhezP2a9NqvtLPXOgVgY=;
        b=d3LW86Rgg/OJK8JK4Ztaj36vBGJ7S00y8tTFKMt3Wpw5Z9gKL4KFJpIXb9r1A3F/OG
         8kSvCMHWAWIGfUn8ID/78HL3VjaqKdS9FtMN+sCH3WLOOL7cp1njNef1zAoIwSvnZeD2
         4PWER/YbIdN4NxcVHjitIJTo+fuSSlII6hjMEkn6gGp4akEkJkn9ysHa3gN9DpZtqi/I
         LFPOrzS8cYN7wPzJPvWfU5HJuR0jOBNStk64HKkVDzgh6z25xZGZZba/t0JgJItTY3ay
         MBXRMw6Hf7JUS7t0VXjIS/y+EE9ttdp1a4ABPhWyxzPIMWgpHjZonrE/0ux1gOEXyVMx
         6ovQ==
X-Gm-Message-State: AFuF++moHlORxtNHK6nV27ubIFNia9LkmLDwsdIs9bvBebpbgCGrF3L4
	pybqzjJZd0JvreyoSVwCDqo45xwr6cp1FVMn4x3wHySKn4yBgcx3QmVhM8gQRrl/
X-Gm-Gg: AYBFou2k28Ph1LUS3HgA1uhBupREkm9vC/G3pqAWgXKSJUz5x4AAupBlunjqpilcKwE
	GqKoBhDZSQxNRj84bkDwmRu60GuXlXXoDowfLtk0sPnUc7XgTMdRMOTjEbq3VNQz9I7iDgemj30
	6E2nJjjosBD4SFdkLihWORDpQHyDc2uo8FDrb9y2ljGj5H70RtCjRrI64Ta8t8kj6/FAE+UFCpr
	PtUoeoPVV0MTjxvBvahRdfjoMOhg8k8zrM4PJDt4QicUClNodRD8oYbWh0XWiV45h1k3cjs38Hx
	Qugo8lD9K1qcNHC8YYfK4xD91X7xJN0QNWA/H1adI4Y9BMkxzzCEnUmAvDJK/XJkb/fZfs8ZxNy
	CqKFoIisdz36QKls+Sa3jvwNEehYEoav6gx+rDZuIIAY29rY4B8lHe/JIPkcsSaVoK1SDoljBFw
	8l6dFLgIbs2pAxONdY/yFdK5jsasYMCPwYzVVLSqxYJl94Zt8HxwrPhLdV6HRZV/uAvqAxFg8pH
	WMzAQzGraktkFFAB2oLTIS9iWjm6FQLZgIZx2sFzbWmSCh08oWQOMrbknJffbbj
X-Received: by 2002:a17:903:40c6:b0:2d8:d4d1:3139 with SMTP id d9443c01a7336-2d94a935f0amr125871055ad.16.1788277166534;
        Tue, 01 Sep 2026 08:39:26 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd488640sm906095ad.53.2026.09.01.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:39:25 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: dummy: Report a change when one capture switch channel moves
Date: Wed,  2 Sep 2026 00:39:21 +0900
Message-ID: <20260901153921.3971-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The snd_dummy_capsrc_put() builds its change flag with &&, so it reports
a change only when both channels move at once.  Writing a single channel
stores the new value and returns 0, the control core then sends no
SNDRV_CTL_EVENT_MASK_VALUE, and a second reader keeps showing the old
setting until it polls again.

The volume put a few lines above compares the same pair of channels with
||.

The mixer selftest already reports this.  With snd-dummy loaded it fails
event_missing on all five capture switches:

  # CD Capture Switch.1 orig 0 read 1, is_volatile 0
  not ok 13 event_missing.Dummy.9

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Verified side by side on 6.17.0-35-generic.  The v6.17 dummy.c with only
this change built as a second module registers as Dummy_1 alongside the
stock Dummy, and mixer-test then reports:

  ok     6 event_missing.Dummy_1.10   ... all 11 pass
  not ok 90 event_missing.Dummy.9
  not ok 104 event_missing.Dummy.7
  not ok 118 event_missing.Dummy.5
  not ok 132 event_missing.Dummy.3
  not ok 146 event_missing.Dummy.1

The five that fail are the capture switches.  The volume controls in
between already use ||.

 sound/drivers/dummy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index b908d2564aee..3f6bfee29986 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -808,7 +808,7 @@ static int snd_dummy_capsrc_put(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	left = ucontrol->value.integer.value[0] & 1;
 	right = ucontrol->value.integer.value[1] & 1;
 	guard(spinlock_irq)(&dummy->mixer_lock);
-	change = dummy->capture_source[addr][0] != left &&
+	change = dummy->capture_source[addr][0] != left ||
 	         dummy->capture_source[addr][1] != right;
 	dummy->capture_source[addr][0] = left;
 	dummy->capture_source[addr][1] = right;
-- 
2.43.0

