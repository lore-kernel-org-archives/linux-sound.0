Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF9F390616
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 02:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783478163; cv=none; b=eakN6+d2yHf7UIHxLzMpNCncurNVznhTvQUay51XJ2OOiQ7ZGCF8MhripSS/gOcxnj9SA4fGYmd3zXh9r8ZoUnDW4kb50Sq9+hTwSKE4nMbFxSCnaO5FWaPIT7vK0fKt4kFVIwgYTL61t9zqfEp8vXvAU1xDgzgoq9Bk9jpDNI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783478163; c=relaxed/simple;
	bh=k0iQXe5Nlznvpmato8IU8TD8acUT32CJKb65izj72Kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7JZg4MRUZv/6/ECeDe9jnDr8gy2kZRlvGsFLG8ocbMQr52ZQwjr9pAeHOKJwWvOSWZRARupWSXGFvK/tZ3J6d/diwiGKsSghcqgO+dn73I9BqqxHGEwIAhHde4cHF5oaM/dO9zNVY7ziL+hFW/YmxC7XHe4dosBhVdpTD38gnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLD/s9h4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLD/s9h4"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-388b404ea89so227638a91.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 19:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783478161; x=1784082961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=14IJ2NlTZHfI9VtzjcJi8uZjx5YEaM2VnTsN5hsg1O8=;
        b=JLD/s9h4m64gubYZxJUc2fnYa/dxw/bujmqCHGHFeeS45+J7JvmIIvmrsbbpstRXdA
         Qf0fFjR2zWkj/RacQWK/csNInUDL6CGkwBcl7dLIW96pf2r3tHs2LX3VCIyfMTiVRXbJ
         SZ9ntPPjeAOR7nDlIBYu5BJi82JOJY+AfJTlBz7w4l0YJ6jg9B8sDmMhdHGcPIF55cSV
         IzjzyzevqTlfDk6J749u0B6IqRaBdWP2F3YbHx154MgTrzi/z0Eju4m6Uf7W3K/scGn0
         MKbuuSQRvM/+0Xl2+w1RrElOLNx3LFRuKxrzBbZihpwDzi4U1fGKFDO6Ak/x4Qa/rDqI
         yADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783478161; x=1784082961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14IJ2NlTZHfI9VtzjcJi8uZjx5YEaM2VnTsN5hsg1O8=;
        b=bL9dJMC1I4EC9GcHdbXTGGX+APdGTJnDAP1ViRjAnoqiw9SO1/l1rAb/XVBE60d4Bg
         TE/MvB1XWcBqDbsleoR7JpmgTelxwJmGywWAh02Y3GcOVrjYIDYNF5bi0vED7/2A3Qty
         tnxIp/MP/xQMVhcLtGk5j68x2veKIArm0O4z3DbvKy8npfpg4zbDnUUjxLzPnjp5/QaY
         2QlSVSBwKxD1WXNLrAhSosNTrxxh9uILIPFGlNZdBLzW3Nk2sZ6azZrTBtOAdN1RkZxu
         QrZd3P5EcPsqoPYrTcnM9ajp2Sv0DxhDY1nRoPix//Fim1ELUYS1OPMc9tgvPS4PfWrh
         Iwow==
X-Forwarded-Encrypted: i=1; AHgh+RqIslkbgh7krbB54b2V1u9ANJOHMpI9xYhb/MXCGKB8EkVpmKNBJnliV4kbCI1PMvKRbhuwLHRsAkFEUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWVgfcthYXFj1TCZCPujA64usvSVEXnluWcM0/eORSpvy1qFj
	UwYwgKQC2jyod05q3XN+9/BMgko1jVHnoRnSv6FRK6f28176EefRID2yiVD1aw==
X-Gm-Gg: AfdE7ckdkZSGgydMf38rVYwnQ2R5EvpOFFli2LpSVShEWyuni76USWgbC8/yPlAkWdz
	KgqP5AXaSsrUeOy7AfUTcGjXnHHAvsJwfQDKjVsiuZw9ZdGFP/3MSvNm+SJOEm2NyHjGedoeROK
	BTFjxHsi8nZUy4cfTceAfRKDQ/nYsb8tOXxtsf2Urs5U0+7EGnkGfyb1tEbZAgRs1t1mvaXV8pW
	/WL8FtPDr8iYVkPx6vJJV2GvPRp3wleELiuH+9HUo97refQiom4TF9gBAQ1rsNa6OWv6WRBEf4n
	NPXEXFgMrU0AWMFMawnmTVBTz9QRK2MfOCVkyoxUIAdy0ydPQYx0eq2mFmuX2UEG/XtLXPll5Zn
	h4pDTx6naKmG8vhATWK8+5jmKcdO+jYf//XMQXw5xVDrt9JmP85H46Ha/okub/Avohknho1UE2N
	O0DIzFcspWxgvN4jtAV1M/nOSeWVskS4h8b17itZpQr0Nl29TpvKrd9iD6VQ==
X-Received: by 2002:a17:90b:180e:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-3892d378da7mr673169a91.1.1783478161481;
        Tue, 07 Jul 2026 19:36:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-388fdaa2c73sm331073a91.1.2026.07.07.19.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:36:01 -0700 (PDT)
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
Subject: [PATCH v2] ALSA: control: preserve snd_card_file_add() error code in snd_ctl_open()
Date: Wed,  8 Jul 2026 09:35:40 +0700
Message-ID: <20260708023540.6962-1-phucduc.bui@gmail.com>
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

Fix this by directly returning the original error code returned by
snd_card_file_add() (e.g. -ENOMEM or -ENODEV). This behavior is
consistent with the error handling used in other functions such as
snd_mixer_oss_open(), snd_hwdep_open(), snd_pcm_oss_open(), and others.

There is no functional change other than the returned error code in this
failure path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Update commit messages.
 - Drop superfluous braces.

 sound/core/control.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 0ca9fff56e51..73d7ba0f509f 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -63,10 +63,8 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 		goto __error1;
 	}
 	err = snd_card_file_add(card, file);
-	if (err < 0) {
-		err = -ENODEV;
+	if (err < 0)
 		goto __error1;
-	}
 	if (!try_module_get(card->module)) {
 		err = -ENODEV;
 		goto __error2;
-- 
2.43.0

