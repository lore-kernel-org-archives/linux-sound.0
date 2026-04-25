Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B15A1427A
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 01:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777080641; cv=none; b=NeO2WuE5p2mmosZ6aT6EgI0WwU2r5byzKga0iBjploDWr6ZcHEVNtNd7NEA9DKOthuLGQjbv1vPI7XaCVTfjWlrp1nmHAzyvvXegiT5cvTS2CAtrT9gvPsMOn+dLEWVxIkywODuesI+qrtGWZJKQPOKanrWvh+pPZchBuvyJPtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777080641; c=relaxed/simple;
	bh=1Li1v/z4AI1HDPIQlMFbgqUBJzJ0+NGYWz+n+mOwMjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNNFT4CMDROCXu+n0t1KmBJcM/RlDifwpAGfs3pfX8M+bC5nnUqlgjwtcoNougMuMrGjdFdds8o7NWb2gKqqgWEOpBH9HeG2Ghw2ZnDJ7ywp1+ZtHIHW+DomPU4i7CrFs9rVy22/k+94VL0Nre8+x0pwsDetKYbxKzbI5za4H+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pYwAQ8SO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYwAQ8SO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f943870baso3446821b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 18:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777080638; x=1777685438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+G3DrkqN/4PurMQeEE3NidJZYF70aW0MCaMm3xLhHk=;
        b=pYwAQ8SOcM2boppmDB8N14cQSuP97pA2r2dZCR2OWPQ5Nux3F70Wm1B9InY7ubBld5
         avh1Vv+BZksIz6CK/mu9pV0IeNkoLSl69kqdr/u+hbOKYBjF+5m5Q9wcmGdXwMnH9/YJ
         Wk7O1Os2e33DSCPxkVv/ARr7br1JEC/JUNsdx0r0B8FlyW9TkGyMQoruqtElWKz5EYKK
         ixLcfVAnXpUQKmUhk5hu/iE5gamQTi9YvwGJYcGQqKvO4TG8BKYmKQySYbaNJYwD382/
         SsKueFgd6QcGgga0/qQ3aPnbKuvvfrE19dF2iIrLVMz6tZ7EvlAztJmoRuurAxT7LbUv
         R9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777080638; x=1777685438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+G3DrkqN/4PurMQeEE3NidJZYF70aW0MCaMm3xLhHk=;
        b=QOnBDWFKIe9Ut/2XSUb/9sZwpQPdqGKtohnnpil/D+Ne4IH9svcvnXHbgQlQsAmI3R
         9dZd2XAMiwoPNVEOMK6uwsH4PGFrNRLajevX0S9vSfUaJUYrP6pi5dwJxyoAwZ8HcoF2
         Oout/YpjtFa/qNDJXR4AdlTAgSV6qeY4Qa1LQAeE3vtXyOsqRldHk9jAKPwjuxMJd/Rj
         ysmrb83sZNa+/W+hYk3FxeGmDMSmT8bG1/umj3zobX3vr/772xqcula3hWDZIQV+mEnN
         u/pvNnsLbQU4Dn8/J7kq+Z9fUlGyQWnGqiYkxr+4vQwuiF2KxVWOOyKgCRX78G1ZMZJV
         XWXw==
X-Gm-Message-State: AOJu0YwJryue3y4bRTjWzEZ4tNierU2AiI1QuaD7rMe9WM/AE82BfGIa
	gioveG1/3/eixx8tufI5lRraa9i6aBFdwDURkKFwNxGCiCrrsT6DzZmTSxQo0A==
X-Gm-Gg: AeBDiettHEFMGBcN+tJSSOfVnPLMykraD/4GzWuTfjw8zVMXkaw9K334ha63glPwl5/
	LQjbf/r5QDztR/viWne6kkqP94NHKLLG3rEnAdE1fBzyPBQ9KuwAjOGqOQF0hV3HXjxJI/+PNEe
	bV0lD6CMZJHCOb4y5BGRlfNW18vePIKobY6HixIozm89Qreb/VnZ3lNXk7DkXIMEKbrD8TujAo2
	hM+QRySAI+rZQ5dJgQyeHNjmd7VFTaCoVQ6Q1UoxDa+7JM4Uoqewdz5usZyQCnC2ntOog+3I7YY
	9q/MfplulTNIYDDLvGXgJsGQU8h8z69G5FpZxVkoSythcutAppuEH/I/a2/CtASN9LsqZUP2j0a
	H87NANApL8zGvZVphrOUWclca7hpAzaBlFmSLqDTdijJW0IRmx4OP2SjQllrxHXNGEdtlpP0OnD
	4mEdrMJZ7zs5hz4X9sTaQeiBiPPubQakHSPRYyolhz7ASR2jGO7LlTesipLRRJrVmpmCBtni+54
	LnomM368b5YupG9z8hCTO6Zag==
X-Received: by 2002:a05:6a00:a90:b0:827:433c:ba7e with SMTP id d2e1a72fcca58-82f8c970703mr35175890b3a.41.1777080638313;
        Fri, 24 Apr 2026 18:30:38 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981d00sm24353027b3a.5.2026.04.24.18.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 18:30:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ALSA: ctxfi: simplify mixer allocation
Date: Fri, 24 Apr 2026 18:30:20 -0700
Message-ID: <20260425013020.430496-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine 3 allocations into one to simplify memory management.

No need for 3 separate frees now.

Replace void pointers with proper types. No need for void here.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/pci/ctxfi/ctmixer.c | 27 +++++----------------------
 sound/pci/ctxfi/ctmixer.h |  4 ++--
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/sound/pci/ctxfi/ctmixer.c b/sound/pci/ctxfi/ctmixer.c
index e3ee76bd8482..50ab69aca2fa 100644
--- a/sound/pci/ctxfi/ctmixer.c
+++ b/sound/pci/ctxfi/ctmixer.c
@@ -965,35 +965,20 @@ static int ct_mixer_get_resources(struct ct_mixer *mixer)
 static int ct_mixer_get_mem(struct ct_mixer **rmixer)
 {
 	struct ct_mixer *mixer;
-	int err;
+	size_t alloc_size;
 
 	*rmixer = NULL;
 	/* Allocate mem for mixer obj */
-	mixer = kzalloc_obj(*mixer);
+	alloc_size = struct_size(mixer, amixers, NUM_CT_AMIXERS * CHN_NUM);
+	alloc_size += sizeof(*mixer->sums) * NUM_CT_SUMS * CHN_NUM;
+	mixer = kzalloc(alloc_size, GFP_KERNEL);
 	if (!mixer)
 		return -ENOMEM;
 
-	mixer->amixers = kcalloc(NUM_CT_AMIXERS * CHN_NUM, sizeof(void *),
-				 GFP_KERNEL);
-	if (!mixer->amixers) {
-		err = -ENOMEM;
-		goto error1;
-	}
-	mixer->sums = kcalloc(NUM_CT_SUMS * CHN_NUM, sizeof(void *),
-			      GFP_KERNEL);
-	if (!mixer->sums) {
-		err = -ENOMEM;
-		goto error2;
-	}
+	mixer->sums = (struct sum **)(mixer->amixers + (NUM_CT_AMIXERS * CHN_NUM));
 
 	*rmixer = mixer;
 	return 0;
-
-error2:
-	kfree(mixer->amixers);
-error1:
-	kfree(mixer);
-	return err;
 }
 
 static int ct_mixer_topology_build(struct ct_mixer *mixer)
@@ -1228,8 +1213,6 @@ int ct_mixer_destroy(struct ct_mixer *mixer)
 	}
 
 	/* Release mem assigned to mixer object */
-	kfree(mixer->sums);
-	kfree(mixer->amixers);
 	kfree(mixer);
 
 	return 0;
diff --git a/sound/pci/ctxfi/ctmixer.h b/sound/pci/ctxfi/ctmixer.h
index e812f6c93b41..dd23d227aeb5 100644
--- a/sound/pci/ctxfi/ctmixer.h
+++ b/sound/pci/ctxfi/ctmixer.h
@@ -41,8 +41,7 @@ enum MIXER_PORT_T {
 struct ct_mixer {
 	struct ct_atc *atc;
 
-	void **amixers;		/* amixer resources for volume control */
-	void **sums;		/* sum resources for signal collection */
+	struct sum **sums;		/* sum resources for signal collection */
 	unsigned int switch_state; /* A bit-map to indicate state of switches */
 
 	int (*get_output_ports)(struct ct_mixer *mixer, enum MIXER_PORT_T type,
@@ -55,6 +54,7 @@ struct ct_mixer {
 #ifdef CONFIG_PM_SLEEP
 	int (*resume)(struct ct_mixer *mixer);
 #endif
+	struct amixer *amixers[];		/* amixer resources for volume control */
 };
 
 int ct_alsa_mix_create(struct ct_atc *atc,
-- 
2.54.0

