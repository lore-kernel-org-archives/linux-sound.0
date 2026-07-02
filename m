Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAD9233943
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 05:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782968582; cv=none; b=agZ/zVJdX/Nd3FY+aM4fk3QU20dg7B25dlL83nRbvw5ptniOITpqheFIGkRgyvaNGmtgdEv7LdG+VFjrjgoqsRpaWmiRFOrzQRFJUaugtp3XrYPmEvdb9Xj/zXI4PJvwmm79ccbxUDVR9uZDifMfiMsyNUXl44r0roy2l0DU+Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782968582; c=relaxed/simple;
	bh=3cZMBba94i/5R8hH7vn8i3PpOCKE7KD/nEun2UIZCnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LB1p14bvsaNnecxtBvC61xC+byFqpemxY1sd9EF98uhqaKcSK11VrYSgq6kPFfzmYfr7YAUdTC58+EW4GLAiSQicpuJKl9abu0TTRahyuLQRK701QhGJ61NMr65pXgnq193for3lNFFY20W1CkrfXXbLCG7xRseeAR9BC8F5TZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUaIVuFj; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUaIVuFj"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8479f1a86ecso910736b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 22:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782968580; x=1783573380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVnJLydBr6ds5nqVLQWS01bEPiCKOptWg9PYdANnJMA=;
        b=NUaIVuFjOTT31RK9WslAtEojqfLV96C9z4eiMEFwuOir+K/5k6wYEJGkncoDwBYg7c
         IaPfU+25hi4UbBDV57w3RM3715ZVRfznJXPf083JXHnFCs6pZmZ+Ec/gT8kkGJy4w5hb
         Jr3dJvEnzj0kZDnCg8BaPDK/qVYuPU79+6j8qwOGX6UZzQ6tTOEbEvtmAf+VAARVTZgv
         A+jWiuShiIXMOTa+2HCo6gwPiCxFh/tMJqsSwiSeg/NfFFJTGU9SXi+/xkIoSGmPyS1O
         RC9/QN4MIgGtFA+pccAcmgbYK1xYoDJcGROm7GKx5woiHuXdO4nedNfoIpbZ1r4TkCHp
         dm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782968580; x=1783573380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVnJLydBr6ds5nqVLQWS01bEPiCKOptWg9PYdANnJMA=;
        b=G+xFe0yTysfNHNsGqKD6oEzMmg6O4CD2Xq8zIwPm1OSNvj96gIffw5lqG7hewljjgy
         1VvK+uvb3NJOftyFHSFG/kfPg7oSAh/8xi7D8RTTTWkc5YYTeWK42bTqfYI5Mnl+WVmC
         nq7xwnPUwjr69AoR0bNeldfGvGzoNBeUnHfUbkgroAMdt040/eZ9MlPPJ+pF7o16OU08
         fDj0DVsnZDPNt1xFUweqrK2/w5yHBnZXK3DlQdPnkZ+/ii35AtL3LcIUXcBxZQmvW3Uj
         ibMh1zhSBk1UAqMmc2MS/DwAt4neYkziM1ToE94fjH9lT23oc7PJBNHniaoWe3l2KVeN
         bSHA==
X-Forwarded-Encrypted: i=1; AHgh+Rp20rp9SXNwzouhuwENY6+r551gC9arnh3qU3on+Dqf8SjCOkRTGIO7xE/wjfO/bdOD2wHovMBQVFGvnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvZoiFFxXBsYHrn+SqVc2/WkJlgWsslf8t6jAekhffLaSgIUa0
	F8FsXizAr/ZqNvnG3cIltBnpkgVBi265dJfZJIiRKLEq7ua9l0oZg65J
X-Gm-Gg: AfdE7cl7GbY00HNiGUhfhlbF9l7MWO6Z1/GU7DvT+2zie6B4QU2jGmph35Bjcg/wCYI
	L1Yyh2ShAOL7nyrUl6rIWqOMN1T0ZkgjjYnruDEKkGYpIHCuabAMTyo6Dcgs5XFAeuixnPCr403
	nkreXpIdHvG8P8y0H5/JsbzfNmCrMmVLDw51fFyk5i6aDwVqKE25B/YnEvCXoPCVUVVRgfParDS
	tkpvd8cYNSKU4IqnCbl92uAz3duA1t/wUD8IOzIU6dpfyH9NYm5Y2RDNIuK8Y05zWfr6/rH2Yr6
	np9QQP+gwR2BHJIbawjjhZJiB3xyqs5ntznzBblssQAanrZPypaJ2UhrWh4HMUxO8jFF0Ec28e5
	UHYYq5z2OfI1ruWEk8FaBaYuIorgFmRMhj+rJR/bGhITcjLIkeRGJAu3ndKnID4eRSmeloEprWd
	2wrfPGoane37xd8aIU7Ia8niCDl8meAl33J7MIZ2SxT+zWQUk=
X-Received: by 2002:a05:6a00:8008:b0:847:968d:b0ff with SMTP id d2e1a72fcca58-847c51ea69fmr4408906b3a.55.1782968579876;
        Wed, 01 Jul 2026 22:02:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb98806esm734869b3a.44.2026.07.01.22.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 22:02:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: oss: Drop redundant nonseekable_open() return check
Date: Thu,  2 Jul 2026 12:02:36 +0700
Message-ID: <20260702050236.30751-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

nonseekable_open() always returns 0, so the error check is unnecessary.
Remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/oss/mixer_oss.c | 2 --
 sound/core/oss/pcm_oss.c   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 591cff800329..6161740f67fa 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -31,8 +31,6 @@ static int snd_mixer_oss_open(struct inode *inode, struct file *file)
 	int err;
 
 	err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
 
 	card = snd_lookup_oss_minor_data(iminor(inode),
 					 SNDRV_OSS_DEVICE_TYPE_MIXER);
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 9826d9a0be6d..a0bbfa0a7ec8 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2496,8 +2496,6 @@ static int snd_pcm_oss_open(struct inode *inode, struct file *file)
 	wait_queue_entry_t wait;
 
 	err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
 
 	pcm = snd_lookup_oss_minor_data(iminor(inode),
 					SNDRV_OSS_DEVICE_TYPE_PCM);
-- 
2.43.0

