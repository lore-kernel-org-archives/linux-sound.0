Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2073E38F251
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415415; cv=none; b=aDADj1o1C/UrNvMIvlYcDvxWmWe84z4dcEM1UXc7uG/WCSdINn952PT9SnVzRKACuibK2PGlrUZSMDB6vjnJY90JtRBbfRV+oZa/IfPESNmvk34iPW8r1y7xWyqg43fmZpOW72JeGrSesGayKhe8rug0VCD2VqUzXPsQbztpRpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415415; c=relaxed/simple;
	bh=uueHHMutRJ6frFPDQMckdPuq5yMr+h+AuD4pIXQWprI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AfbQcB+v4cOnfFD8ZuCz20rFsH0iZQqXBxeQ3/XTzleF6xNP8+Ficko+KSTNqkpZJj0e0+/4qtoatG3mkOIbwBIUemblc56CuuQOdbPnKu/o5Sjob/fiYO26qEkKRLU1+fX1bBCIQvO/IrgDlnq+t5RfM6NdVTd6O7A4WdRpASo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3yUBolp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3yUBolp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caf4496889so2860255ad.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 02:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783415412; x=1784020212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gQVakd1rt8cl0DjUwQZJFDqrSCfo7IDM+mNhgQzAAV0=;
        b=E3yUBolpCw0vO40JHuglgxjDeucaEYi0gl/2LrbVZtVayZyuGvl0H0Xg/QYO86pdDs
         LZ5nppcyOxzdVV6nLyghXKoa2TjGEKBOsD+/9haDHSNtzOkIL7vy33reDPP6JdeRVnDE
         PGiHGv+YWouOPGZhPJin/JipGddvAr95Egxhwc8WDefEQQ/Sz/dN9mKdaXu5pTm9fwXp
         vRVPLHxraNpIZhPtUKAVdMM6wwLajiLAvDFNTFzTEg7S4wnqMosRcrrS6rVWL0JTM9jm
         GlXf1/zlwb7z8CqFhxKkzC2jf9JJsQFMPep4HMdtr6SvCICRXyEMzhRAQ02RjTwsJnMo
         oHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415412; x=1784020212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQVakd1rt8cl0DjUwQZJFDqrSCfo7IDM+mNhgQzAAV0=;
        b=ks1bIy68AgWDLHggcRU0TuPs5ECheNhpLIEJspRdSF9AR8xuRNwNXualFF3lO4l2fR
         0zOAmVr+n6GnbctdTPjoQwOoC1I754b7VcJTVs9GY47ly0cOtzd8qO6DylXi5TkTB9Ew
         eUr1uMrPYzvTIec9lcmp+QCcxlCdnrN+YzsjCO4Tec3YK51BkCb4kaWj/BbRsVAhhqfR
         quPo2Hlrm53CUUbFIKc700GTuspwXubhwj6Gqffx+PBnZkSWyiSWAotAgkkw+213ucfO
         Saxiq5GjV27K+C1kmgoieFT+eeJhH6nIN+qkbXg3UPTnLbVh2in8hpV4teFvTC/OLmud
         ecig==
X-Forwarded-Encrypted: i=1; AHgh+RrrEsUp91Z4f/5DEXOKzx8aN4bZInsS5HateJoCHkQ9xv57u+A10u2f9IInfge3E5oDNLSBzvNgwnb9vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRLQOgzI5PfZmKYKPXEJVznsAWs8pKRfCbtiO/zwzuR8iHKota
	Gry04LGkGJ9MaHhd1+83k6BvXIeX3KL+aAKqowJ/UHv7Zta0ortPukU65WD9HA==
X-Gm-Gg: AfdE7clWM/PRjWUAuNZCKEphqWnKVeDHsV1EPcCkYKvANsYjpkT8YvSFh5/Xp1twTk+
	SpfcsHTO5gMiNGyS7rp7Vmr2ZtoxVI9vJLKFaERIKr3HNcKeDaIRyS6mzOeb8i+9AC95Gc8oDUn
	N+EUm29LQ3eD5F3lUNf4M20jSsznQbkzi3T0sfPV9Ln8GMAW8f86l/9y/g3veCG/Z2/491U2dgS
	CHOfHwzRzDTkGYJdeoReM6RORQcoeTghD2ty5jIsLonSrXXD3bQq5aF5aJbBH8oA3zKhXHwslTj
	xiDfeT2CV8kTm0WbJlIV/TcUmgaNUtypVnfdFYFKUBW9Jg9E6TxGMGPcl2AeK6jICnHMoDjT+fJ
	DvRjIgJkx6H3LXrzmHb458L0yCX68DRgwCp8mTs+KCwhba3BEFib2oJgUtd3nHYbyxBcjVWRsAB
	dGEJBE520CQ1/I9aAM5AMlfHfpCsmyEdP8EgQZUYKVzZ4yobg=
X-Received: by 2002:a17:902:cecf:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2cccae1c506mr19718435ad.26.1783415412489;
        Tue, 07 Jul 2026 02:10:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb775sm8139695ad.2.2026.07.07.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:10:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: control: preserve snd_card_file_add() error code in snd_ctl_open()
Date: Tue,  7 Jul 2026 16:09:58 +0700
Message-ID: <20260707090958.794852-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_ctl_open() unconditionally overwrites the return value of
snd_card_file_add() with -ENODEV on failure, discarding the actual
error code.
This also preserves the original error code returned by
snd_card_file_add() (e.g. -ENOMEM or -ENODEV), instead of
unconditionally overwriting it with -ENODEV.
No functional change other than the returned error code in this
failure path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/control.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 0ca9fff56e51..f64b2dec746a 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -64,7 +64,6 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 	}
 	err = snd_card_file_add(card, file);
 	if (err < 0) {
-		err = -ENODEV;
 		goto __error1;
 	}
 	if (!try_module_get(card->module)) {
-- 
2.43.0

