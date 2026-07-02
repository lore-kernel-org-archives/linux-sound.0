Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ABA3644DE
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782967616; cv=none; b=HlM7dGlCyr+qlziRh75d6wKp/z6k+WS5FDMxWI73ZMzlqXDOLui0agDP4IZSHS/Ijgpa4Pldrmqt2zTH/Re7dmr8UF8HYveXFvGMOjNcp/io4NfzJ094ZrT3frtG3Q+692ehPACDhtehfTRsvbyXeKMRyzuvEMJDI10kL6ArMew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782967616; c=relaxed/simple;
	bh=DfoqOKc6brQee+dfTGbSIbVBX+aeuySwgKyIwMjSIDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ozhCubokW6aXABKafcuJp9hZ0AOjdE4WzMD8yvyax0nFfnYXi3W7etsoL6237KjwFK0crTB4F9SDTvnm2vBTtCNKOnIg+lQRhLM0z9agUDPdIjFeYQ+RnenfZL92/aHHiOwuTKO3Fwx/s220CCuNZJhLqHf+WK+AlAb3eAw3kgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZUfb1Nu; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZUfb1Nu"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so15302065ad.1
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 21:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782967614; x=1783572414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvmydbA8YxxFRA9br5WWyx3tYjrIZqG40j7+Af9qqdo=;
        b=hZUfb1NuP/wN2TU7/bf2eb+rSRkEQ4SF/tti54G4XPvkKA69SOjIg1CX3dNKohlYIx
         N8rgDycOFgzBU7IcZ6YjSt2S3jz6rKMtevJQKBatd9CWOlcP1tpANy+JiCold7Mo6TXH
         6ekdFp2UYBtu7O5Kzibcf7QJdtH5P8mHrUyCMMA2DdohYwqPUIzaV5Ui/aPCWxvf2avZ
         P8C2NgcmZWllY9OCD+ELDkwgw49wXdodKQgLnpvrVg6wmPiabhqRyqQzhSVspYYEEdRQ
         C1HSw52yFKA/2vPgUwde5XbyNR1OeZlvwT9XQtu/IlNPHoYGRyEYqcIxwFwUe2Iu0E/b
         1AEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782967614; x=1783572414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvmydbA8YxxFRA9br5WWyx3tYjrIZqG40j7+Af9qqdo=;
        b=sJ8pl33sEXYPMavy+1ldlE9yGlWY2R0a9geIxmAYcg4PRopoRiVfb5Ai34SsY9Tezc
         4Uyabpe1MebQWXtnnYdsiS0vugOeuXKXisoRAuyMjiNLDSuvLXkk+191fhaZQTHMzWYW
         4dVHs7AemLpLuSVWGtFYzK63K/63gIDlnbLOh9VLaPNyrCVueTo87C2GmKDFVBoyGUaH
         RC7B/Nh3xme9jCNo5jox8nSsI5QOX1SCYXkGDjPVYrf0aizsgRqs4znohS48J2PAQD1h
         AFA9H66buPU4tAy+4dBZBnLNLGUyikdg92sAc3xrg0BbZZ6OhNeVj0IKsxVuzW0vl5AL
         D29w==
X-Forwarded-Encrypted: i=1; AHgh+RoxXLoHOnRJxWoY4/k8U5c0ii4EKAOaygzmzJIiGVzKy9x2ailrXs9iNG19xM+kb/jQtQ4bw+2KORlNog==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpTt9WiyWP+O014HEdAAxA3YJIoYlkVqgt92EjyY2Au9R0zQG
	weYnZrScmREvAhJobzlDq/SNym354t7pfWRBJlZcVjrTseT9In9So2PD
X-Gm-Gg: AfdE7cmARpsGx3X15wX3UQZvHIVwu5Yf+4NraieSQ4CFvmElcfLy9zv1kZTyZ2SD+nE
	Y+QtFwtzycqWgnY0DQSEH17BToVElxapN5wsbN7tkp9kjAC1r5bGcNHxazkevJNadN3So32lOte
	NdsyZng4PvjaSnVxXYrYg5aJgnOKuM+RsH3rJSAkdJ4TDTfxhk8GLsWh0hoY7O1Bt72pmRvoyiI
	snt9wcOSYejW4UJ569tmb1V340Z7IUMirGkNyEn3JSKcOv/W1MVvPXt0u6qgWB60Jw3SeE1c65Z
	xMkOuzwVMfoaJz3adDyWYe5a2CB6w2j87Io2KXgYAt3L1UtU7+oaa7s2CP6h8QafcnboxGG48bP
	KRNnhyHS83q2T6h9jFg0VQhn1lKRIiIJaHtQIccIKof+A6tKOC0mMNXMDghN9mOo70tfWXC/NrJ
	8fkuizJgqnr8CzWuCACracPGVcgaY19Pgnib2XFYKqCEexXfg=
X-Received: by 2002:a17:902:e811:b0:2c9:bd20:866f with SMTP id d9443c01a7336-2ca7e8b26f2mr48041005ad.45.1782967613680;
        Wed, 01 Jul 2026 21:46:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a9f6abesm7260755ad.65.2026.07.01.21.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 21:46:53 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: control: Drop redundant stream_open() return check
Date: Thu,  2 Jul 2026 11:46:35 +0700
Message-ID: <20260702044635.29808-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The previous conversion from nonseekable_open() to stream_open() retained
the existing error check.
Since stream_open() always returns 0, remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/control.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 7a8dc506221e..4cfb0be14c92 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -56,8 +56,6 @@ static int snd_ctl_open(struct inode *inode, struct file *file)
 	int i, err;
 
 	err = stream_open(inode, file);
-	if (err < 0)
-		return err;
 
 	card = snd_lookup_minor_data(iminor(inode), SNDRV_DEVICE_TYPE_CONTROL);
 	if (!card) {
-- 
2.43.0

