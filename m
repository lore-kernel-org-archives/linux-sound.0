Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CA3C7685
	for <linux-sound@vger.kernel.org>; Fri,  3 Jul 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783075141; cv=none; b=jWNQvQDSzFNzb1NjF6H11m9Zp2QN/7p+jvXy5QIm40+ZOV/cyIyI0OrKbhTP1OCz33M9Xhc2GqODOwCd+ESzTBjTr5d2PIZCKglyAkbekf5JwtQCbk2hKupi3s6AWGY3NOkugAqO5H+0084BuhMu4vsE2mFgDJIzSt+nLQLKGko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783075141; c=relaxed/simple;
	bh=hHprdpG/uKKFmQbTadPUD64ZVlpwLHJlCWL3kWNDcvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hv31C1YxFckE1VesZ/iHVo0PyfRZaj8Zy+y1GoEkfas5yygzx85mgjVJEJMslUTkSIw3g/3szjtgRHXmb35iwXSUo4dj+MKKEXVNuZn9hc5u5waDUDztCTkIRKJKTKgkSqzmxKI5Nsvf59Fv54qALo0npwH9VXVQEHbGsKmgcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbQ2eO21; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbQ2eO21"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c88973b6965so1213257a12.1
        for <linux-sound@vger.kernel.org>; Fri, 03 Jul 2026 03:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783075140; x=1783679940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpVaUtcniJstsh8OFBCYgk7p2djQ5b3s9ea0tBWj/1Q=;
        b=ZbQ2eO21c+NWS65HK1EHCV2uHFS4m+zOc8vdISCDFQhiO2gW2AIfZKpy/Kbb/ME/QN
         WJqzruzCn8jZdswlN0kwWPNbR3pOjumsaXlj0L3XKqKoUDrp2e/i3Ld1bL5hzJE5SF00
         pEMNJxPdENtMD/tM8Zn7NsJPPqXo/r+eAGFA9t+IiYt/LEtuLnhrIplffrdoBkAjX+Jk
         miHUf73sqksnKQtF+jmm/e3oxP5Sf7j+eT8i/AgLVVUpXYfcNUxJCxpz/MoXSXwzX0t/
         gipjvWBpMj9zE9koEIc4pOdHEbZ/3RcXXG+IOyE/zTFBd3+d6gfOs4KcRnr2eidS+Qpi
         wgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783075140; x=1783679940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpVaUtcniJstsh8OFBCYgk7p2djQ5b3s9ea0tBWj/1Q=;
        b=L54Wo83JM7hsaxgmiFQHBnWnMwBvbu6oqt6n5bJTnwiP64+aPegQvIvzKLjcriIrPe
         KwDX0iU/mhas0HMeJ25IEmGbXn5lg6SzBdsC5hMPH7+IU+Sqx2+He6AASr02Tl9VhAKk
         IqL4WYHOsCbwl9ja1+/X9fcZHr1Sd/mLx69X68Qd/RAqxhKgdle1ptwY9UrZ3ucBnvXD
         2Dj0FYn7hogEugSgFALFMjZXqqi3Q+ezB80NaTW6aRBwW4D7iyznVOu2s7RKN69SIRhd
         +qNec71KRzq+ugbSTfp9bwjxgLV4Rvai9MZCqjak69f1ICSwv6HF5JP8OLO6KxF6Grqj
         TwPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B7UYWtvyjo8b8EtgRnUFn+P2Fh5PqpePSkUT3h2OTkVxdcazSDHvRtT++VFdQ+I3/0kfxsUsH7Mg17w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYe/YNTsRMJJ/83K6VNfHhdgCcUPYMS4e/52DrosY0vO2CafRK
	c8p300uNaXyMj7r8azpiznrFYVcER9CwQ+fD5czYtdsllkEI/AWHytdr
X-Gm-Gg: AfdE7cm77/ndXS+Hg2oym7V8nfU8DcCTmIFvCrHN9cRA+THSwkPfiDW2AKrI/QQgEEs
	TZjX65g8rQK61ei84KXrcnXwok5a2gXwwqoSRIcXySyosj7OD8t1Di1bMTrVM7jBfC2r9DvE3kj
	dLUOCF6rMaeuDMULSlOqy3bNJIyfq1P0dH0l3YDw2g+yjzJDVq2PpZLI/70Cg9+AtPiid/JL4E2
	p2WjwDj4ngYyPAjb8iM11b1R7NvkPNGKg5aa4rQcuZFW8wDU8ftmjILY3Adbxaag2RHQcjObXvF
	3yXt2faQqI3IqXbXK3VGdJLaYherSA98eVvJw60M2yu5Jikj7xMNcDqyUfNZ3zRAMAmFWDQ4W9V
	vnhoW2Es2Y33dQYIH4MhSZXPoRZxCapfELIv2dSuYcUjr0Yh6pYpnfcQL6OCNf0oKSpUu89U5+l
	+dnBud3sjdyJYuJz5eyNLRprY/Zv587XiQ1MbesOe7BRd8tvc=
X-Received: by 2002:a05:6a21:62c7:b0:38e:92f6:9ab1 with SMTP id adf61e73a8af0-3c01c9faabfmr3706142637.22.1783075139579;
        Fri, 03 Jul 2026 03:38:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e91b0785csm2435743a12.18.2026.07.03.03.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:38:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: core: propagate actual error code from register_chrdev
Date: Fri,  3 Jul 2026 17:38:40 +0700
Message-ID: <20260703103840.253527-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The alsa_sound_init() function currently returns a hardcoded -EIO
if register_chrdev() fails, masking specific error codes from
__register_chrdev() such as -EINVAL, -ENOMEM, or -EBUSY.

Masking these failures under a generic -EIO makes system-level
diagnostics unnecessarily difficult. Propagating explicit error codes
from register_chrdev() is also an established convention widely
practiced across other subsystems.

Fix this by capturing and propagating the dynamic error code from
register_chrdev(). While at it, also assign the return value of
snd_info_init() to the 'err' variable instead of hardcoding -ENOMEM
to ensure consistency and future-proofing.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/sound.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 8d05fe0d263b..3e1969a52b21 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -395,15 +395,21 @@ int __init snd_minor_info_init(void)
 
 static int __init alsa_sound_init(void)
 {
+	int err;
+
 	snd_major = major;
 	snd_ecards_limit = cards_limit;
-	if (register_chrdev(major, "alsa", &snd_fops)) {
+
+	err = register_chrdev(major, "alsa", &snd_fops);
+	if (err < 0) {
 		pr_err("ALSA core: unable to register native major device number %d\n", major);
-		return -EIO;
+		return err;
 	}
-	if (snd_info_init() < 0) {
+
+	err = snd_info_init();
+	if (err < 0) {
 		unregister_chrdev(major, "alsa");
-		return -ENOMEM;
+		return err;
 	}
 
 #ifdef CONFIG_SND_DEBUG
-- 
2.43.0

