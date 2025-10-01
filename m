Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AE2279782
	for <linux-sound@vger.kernel.org>; Wed,  1 Oct 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759309694; cv=none; b=u+/x4dd+QAVixaQS/u3ZS6hOqLlE8Nl9nVnXe9PsNrzv69sNcwDp287MNXsDMspAMISUJ6Osn/9r7J55pbREx+fsaRUZxa/VdErWT0sUzjnuxzwg/IIGVvS8cocRMDMD92dxyaU7Q1VNe+fm5fUGfjmwVoIusvgeyR0mwcS7wj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759309694; c=relaxed/simple;
	bh=cHh/cHIF2ix4T1MbAz3cbtmZwsbFRKUVOa1sotAMdYE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZNq5Q6qV5k8NXv6j1QW+NlZ7b7mai4Tq1Reed48Mw6g2UmanldolXYPK36Qqq4qbRGWquzk30tipxDb/ww1JiSseDmxPOzFsYZ+x2y6ZpeNQPOKFXzjQHs5e4M7y2nLaacszT3F23T14QjbO5SZuW38zPecUz2KfvU7+pX51erU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9otv79I; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9otv79I"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso4317317a12.0
        for <linux-sound@vger.kernel.org>; Wed, 01 Oct 2025 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759309690; x=1759914490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdn/qXRMwLNp6Zd/Eb/BpsxnL14+u3sr4IN56KWCSQc=;
        b=Q9otv79IzcCTZSc1wotjhDEpXDuYJxhhH320YokwjB9XET1iZ5ht1fvCsOoMFvJK3K
         /bMJocRulncmUBN0a1BQsUoVoaDTRU8CyvGujuxvLxfKNdRmDR2vPx6UV0qMCwYEViEe
         czhzyFkWs0Xy1js7fyYSRXhob05ShFvT25SJwPM885/rFUv4oh1TGRO3AcUwC/MZMH/H
         MJILUt72PQcx07jZhvaAeqCN27MVGU7Oo0a1zkCp0QBpKZXlMP0nMFxebDSy7QxaRFsk
         dFBPOuUwkULF1RmNKzMnIsDorbjM7PmaLp6NxE6N0l7ZOqtZeQcefvE5woeE4xvWlmIo
         vmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759309690; x=1759914490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xdn/qXRMwLNp6Zd/Eb/BpsxnL14+u3sr4IN56KWCSQc=;
        b=n/XDhCQ9vzPRgei8h2W+a8loJwzWNbu65UaHKXjfgMNrIPEVG/3xoc2ZUY7hD0DEOR
         n3Xl1MgPGmb2yT1Z4sFN5x9J6rjnI6WlibUfn+zIhBTnqzKQ8YWPQrd76Ex6gc5aqaZj
         Vwr07c9Oc7Y53u/LNbhMjibWwTe4K8v/LEVlJ6xaH2aqwmwApj9EFVg2v/WC6bzgQJOv
         l/k2sulTmX8i3hxmA9c27E/yZpL9NCSkNq1przU7nO1nWd+m6gABKBkC9u2kQ/Dgjcy3
         DPD/5qcoqTwCbzaMvfqxMLTOxJCdrdxYD1y/LlST5uJt9VMwdtzvoOfiqOIDtdZ3PVL/
         0mtQ==
X-Gm-Message-State: AOJu0YxcmLKkTrs5891xCeaeOeqMKjcXvxotJ/RGRCWwKF4gRFzDrAri
	zAp8z+HKFBAOdLEf9mBdqRZQtAt5C8gGxN+mSuul32xWpP7VqjHNl94s
X-Gm-Gg: ASbGncuoSsv+w7DUNvNn1UahC8E2d103KYxx58q50vAgF+qsWhlXWAmhRv2uofwZMzY
	SHah4/t/MzHBBAA/AsqcjcBRVaXPuuFGxgDZ2bPEP2mcMOZqavygcn12T7hefKFxyMVZJiEOBqz
	hNs0SyLwAMSO1dOBhwqGhHz1zpbdVjxwXdSUfTQ7MG3i0IwISMGHXyGgFBQEftR/rRSthMWup/3
	V72TMfJzROj8RJZc8NGSTIDC5Kl3pVyzpmkoRADAPz50HvbWnD51afEI6QYAc9qIZS31OeckohG
	ryPBFdLMBpIQjbqcvNm5dlungZb66OFI+O8EaEc/r2LtsbRUGOgdQQ+rPdITaVKMkRn8m12Iicj
	EbxxfevxaUvozkgWDhsGNZOBakoIGdTQ+7dj2s4zBN+d80kDoGyxOSZZLFX3/EL9bVg2KErwy4A
	==
X-Google-Smtp-Source: AGHT+IHCAXG1BqEfze3gHRwn6lpXtkf7tuj30SDlHiLv3IUP0y93ub/ofCCeyp+nvvaX5lId2eVgIA==
X-Received: by 2002:a17:90b:4f85:b0:336:b60f:3935 with SMTP id 98e67ed59e1d1-339a6f08820mr2965105a91.23.1759309689779;
        Wed, 01 Oct 2025 02:08:09 -0700 (PDT)
Received: from ti-am64x-sdk.. ([157.50.93.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55741e6sm15477230a12.29.2025.10.01.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 02:08:09 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Subject: [PATCH] ALSA: emu10k1: Fix typo in docs
Date: Wed,  1 Oct 2025 14:37:57 +0530
Message-Id: <20251001090757.45991-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

interally => internally

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: No change in functionality intended.
 Documentation/sound/cards/emu-mixer.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/cards/emu-mixer.rst b/Documentation/sound/cards/emu-mixer.rst
index d87a6338d3d8..edcedada4c96 100644
--- a/Documentation/sound/cards/emu-mixer.rst
+++ b/Documentation/sound/cards/emu-mixer.rst
@@ -66,7 +66,7 @@ FX-bus
 
 name='Clock Source',index=0
 ---------------------------
-This control allows switching the word clock between interally generated
+This control allows switching the word clock between internally generated
 44.1 or 48 kHz, or a number of external sources.
 
 Note: the sources for the 1616 CardBus card are unclear. Please report your
-- 
2.34.1

