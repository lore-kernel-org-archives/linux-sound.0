Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E853F484D
	for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439169; cv=none; b=HkW8+8jpQ4byBjkAdHPs0/YIAzTLpuum86qT3xpL0VcoJEU+mlHCEFlnqrhfVrXD+scNjj01vxpTtOvQHhwI2sT/7N0anolqMSxDL/+bt3RBH9L6F26wt+2rh3VrOKDDaXSdR+8et8cW3gYVThbPnsS1pml1cqBqwzAEpRESllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439169; c=relaxed/simple;
	bh=ZN3HoUUo91X1r7IQOe0tJ397OZvh253k+M2y5ZAJHJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9KQcfG5ClJ7VP0q5FyBdud+LacFr6l5Mw3+drcmQsSzrBY10XRF59gle+AX5CsKInUJXLFlB7Gc/IrW5vi7ELAxMISCo0LRWqk1Wdy+WoB5auJtwT4GJDFefFrS6UEN08dsJJtQ3gAD8RguPqdMt1hYlK3YeEiJziam8MRvCXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT2IDOGX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT2IDOGX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce7d2adef4so37422295ad.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Aug 2026 02:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786439167; x=1787043967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBIqpuD2f6nt8iWrnun4ZU4p+707HwZBgtsH0jJ9OzM=;
        b=TT2IDOGXqwZcSTFy0zWWcZ/EnL5ssVPDhHv1yFRTgqwNeaMRAEHFF4raWRJTGD1USP
         0J9D/agOm1VyUEqnYmdpjvxCAFBVKZyLt8+7Y4P+Lb4ItuKY+cWBbeTdgzucSuTD/hxs
         vcSeY97FqkebPUSiLANkGnlwR3snAAtPr1pXgyk3+FqDvVikGC1tYQrIln78RE71M0eD
         dJfgFxzW9wdaypcBFpgT1VSmYEoReVrzaGu1cAEWgMyC7QB7i9S3+FA66+DFTJxX6j6F
         pEpo7rAWlbasU9rqnUBxtQPH3MLzh7K61WyflUATwth6JfgcteaqLOJFpk5iVrupmdZ2
         izwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439167; x=1787043967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBIqpuD2f6nt8iWrnun4ZU4p+707HwZBgtsH0jJ9OzM=;
        b=X49DrBt6WjHUUlHRkR81tU4sR3F+x6vVvM1YCGSniISM16UgZvXyzzfbDokSAmx52I
         VPwy73zcGbYinOZfDOmSSPsQY0QiNeKMiiOrYsoozBTqbYpv+oLn3L8b7rk/tdRtgz8X
         Z26vU2H6/lyEWcisMnz8lmXkXMnGgqoZItGYD3WbLvUewfVlzSyPoPmCz0MohkH2+C3Y
         XffhJoRdftU8MopluZyZbYtmowrhqhN5GhGYVaCsZDAyITnSSRcUnQR/pXcy/ZQkvuZ9
         U9bNTNcolYCt5+c2seey4/nk/j43errz7EsAKO3uSRdQEPPj9kXJc64rglJ2AkpF+PBy
         LBxw==
X-Gm-Message-State: AOJu0YzAKlnJmuaQ1UMEpjj8i0Jo9QKr8zM+WunSpssagCxH99Djon8E
	gOw0oCfsSg7iU/w1v9ekSaODIe5V3elB2k9dVWKGVBqCL3YwLB7VN51V
X-Gm-Gg: AR+sD12YdD7mmjdamlHsH4pmSGjz1uleIqDCvJdNnOOv3+ze6a3TxGFIuGr69Hn318S
	0rJtL254ZSkFg9i3zuPvqT0x73yusfqOaMp9RX5IuHC2fBQ043H15IQGqPFWibTkkNUPmhwB7Jc
	fyzwp1cybOYoqtqWnuhm0bRrr82taMCoc0u/aqoB5PXrbhbTxUtlcv/QZYkN2bBrV6HwrDotLuZ
	Fe2TaXOJ+MoeBiWhL8vf8fRw2uylLSrIVp2UnfFPTrqgtQOyDBvWE0ccSh9M7xgSDLnukd2EdFC
	EjDJbVTOnz7hFb7uJ6KBrq9ZilSWouuyLoJwC4D0s26pGhlkzdxy/ip8grKjDZwaOvJgLSwFTC+
	5lrhGBCsT66qhr2laR0iEM50OoRC7GWKumjQEGXwEwB5tyZt2uvkiOMsHsE48ZS8TGg3/4u2bCc
	pfJfxTgGOZiULDOTJNPtA+aGA1/jisnAgub1j/JOAbmsi1jvdsnzz/dW2uSGYbmD2Bv0t0hboOB
	d3kw/kgq4xCPi8TD8I2wUGTx/F00zw7lVnDpoQ+k29h4/LYcIit+eJjEjSnF6rK5yj1CEFw7AjK
	gXXv
X-Received: by 2002:a17:90a:fc48:b0:38e:655c:6516 with SMTP id 98e67ed59e1d1-392ec10c000mr1905907a91.0.1786439167153;
        Tue, 11 Aug 2026 02:06:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392ee41936asm1128999a91.14.2026.08.11.02.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:06:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/6] ASoC: samsung: Improve probe error handling
Date: Tue, 11 Aug 2026 16:05:44 +0700
Message-ID: <20260811090550.38930-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling in several Samsung ASoC
drivers.

Preserve the original error code from gpiod_to_irq() and use
dev_err_probe() where appropriate. Also remove redundant probe error
messages where the called functions already report the error.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (6):
  ASoC: samsung: aries_wm8994: Preserve gpiod_to_irq() error codes
  ASoC: samsung: aries_wm8994: Drop redundant probe error messages
  ASoC: samsung: pcm: Use dev_err_probe() for error handling
  ASoC: samsung: pcm: Drop redundant probe error messages
  ASoC: samsung: spdif: Drop redundant probe error messages
  ASoC: samsung: tm2_wm5110: Drop redundant probe error messages

 sound/soc/samsung/aries_wm8994.c | 14 ++++----------
 sound/soc/samsung/pcm.c          | 19 +++++++------------
 sound/soc/samsung/spdif.c        |  8 ++------
 sound/soc/samsung/tm2_wm5110.c   | 12 +++---------
 4 files changed, 16 insertions(+), 37 deletions(-)

-- 
2.43.0

