Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB83318BA8
	for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774101868; cv=none; b=A4DAyadwx66xmu7u/PH0NaoUk25pqkQXjuYUlXJnAD7hFJe10x4o+7kTidgtEqRJEn1QCOzyvTY1MHPM3MNyQ0AJRWZV6PkQYcWVFDQIhp/MDNwIjhqHj9mEDRibh2aDd5hfucrJGR4OW55AnSwBrFd3lN4/BqtQbcw34EehE44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774101868; c=relaxed/simple;
	bh=X2wrRlpybCuUP8E+y1h2rRCIdCvYOdFx9nmrsco4N0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T407z2GOUSlvGprAfTqhkSBomamugOUr8xyaYZtmRmRU7nTWW7UkjKR7DvURaKN08wJhK0sWGw6chLeFdaJwaGoyZFLgzn5gCTBCf9rGH7B6h/AUoByH32FdefcPGsiowParpdlh8J4fPQrFHiD+00BpfS1Wfw+WZHNbCS5xDCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U51rixEI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U51rixEI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso888735a91.1
        for <linux-sound@vger.kernel.org>; Sat, 21 Mar 2026 07:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774101867; x=1774706667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biVFhg7XTNPeyEwAFIBOlzdhtE8Gp6Bm8EvDUDEBSKE=;
        b=U51rixEIM2Qv6LFWkWm2yDKm146UpklRdZ+E0QoZj1KGMWCHgseTvV8H4NOq2mrgIa
         T53H733CBF1ejWSYbtXE820QUoPr61BoPZD6sAaMiroTpY5enWcQD6SURqIMShOoSPOm
         mP0n1RMYNQM5UmqCCTTcl/RJNNAxItq4oG9HiOzsjr/FTMKT5z4WtOeZYIAaAWylEQpr
         3+dRP5kp7n6JCiaM78kJ3b+MkhKXwBwW4xcyRP4taoL5dzAG0Yr+drEKqmYVN9RRNBao
         WR4Gt54iQDqhz7R9GBPq8Z9KUNmmJ76a4AX4bQtb6/0zYjA8S6CEZLwkqwqULc8Nsx25
         ur8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101867; x=1774706667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biVFhg7XTNPeyEwAFIBOlzdhtE8Gp6Bm8EvDUDEBSKE=;
        b=A2xtm7Z8CRyShOOfEqseiubkLEhY5hum92FqaBfQMACd8txdOdA7sX1jXG/uDiz7Uw
         PIzEnMZt39gOCli7rr1VOjtuiwhkjQ6UCkTf8neqw79mpgAGlObY5dv5GCEHYy5qeVUG
         MqbhZpcYRn9r328rb+Dtxp2V5pTLP04WLOWWE+W6HK6fhqGZgYN3c34/TjrQlZaitTH4
         gaRlkLFQckoJRF91jOed1rVYbwifehNQ3JxIHnsNEXVtdYQAv2GkUDqELQ7SpJrtNDj1
         HZh4Q5QEt1EFfsl6S1eGoyN4N8TFmCHMzvhOp/vd0rwqDZ5NOlIe9FRI/vetDI5O5usz
         LaDg==
X-Forwarded-Encrypted: i=1; AJvYcCUEuAjbuPc5rtu9bqMViyKYIG1AFLCm3axYpzwO3Jb0bwqKgrfyvW/NEp73nTHwCv/av+uXrqO6lU4R4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7041v7r5Dkw0fImKjyttXQGbz2v2qGT+zwCcTAfm+obiC1GSC
	j3DvJkZnsxpKdBgO74zYEcuYwJ4uZp8u3FH8eZh+erqKVqnxsVSiF24n
X-Gm-Gg: ATEYQzw+V7Xhow57e6gofJqZtDP+ZrxsAShS/mHzEuW5FVAulMizlkzqOyFsFCeCnAU
	41o85MMXWLLQeARrbcArabc9m1at7J7mNB3ksILIDBnMQgA2tWoCZXVZdZDbodMA+zr0Is+wFxS
	mUU7Vt+m4lM6968DYGrYC1y7lYcaXpaw8gGmT+DWji+8kWt3nw0wj3Px11gPEUt1Whzq5f0ZutW
	ZwfQktVGWLX1OCkUpfIFsDs6+J63awN+jm4FoI8AMvt7l73Ue9prChwLvobj2gYTrjQSE/2hDhz
	v+F/h75hHl0D7mjDSSs9X7AA2lASc3eRTi8wetJfLqnPAAzs2YdBG6gXQIcfYiomYA2sq9EYFvm
	9zoK7CT3Fh6E3ozfDTXs5yrEB5smNJKPfSLiE32MGL2+Q7oO6zaRTZgKn47LKV1Ts9dI1JshqGC
	8FEzHbZ1Z+IKGV3H9HhNQeomjMbCn57Ae5h3eRJNb3/Z4Fq467iermQfDYIPHALJxgPCpDWZuqA
	CvgcjprKbUj929u7D27gw==
X-Received: by 2002:a17:90b:35c3:b0:35b:8d89:719a with SMTP id 98e67ed59e1d1-35bd2bf6ce7mr5293468a91.15.1774101866960;
        Sat, 21 Mar 2026 07:04:26 -0700 (PDT)
Received: from ninad.. ([103.181.54.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd412b73bsm4465403a91.15.2026.03.21.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 07:04:26 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rhys@tumelty.co.uk,
	rdunlap@infradead.org
Cc: Ninad Naik <ninadnaik07@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com
Subject: [PATCH] ALSA: docs: fix dead link to Intel HD-audio spec
Date: Sat, 21 Mar 2026 19:32:11 +0530
Message-Id: <20260321140212.5026-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing link redirects to a generic page. Update the link to the
specification document.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 Documentation/sound/hd-audio/notes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index 6993bfa159b4..c16f83875b80 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -42,7 +42,7 @@ If you are interested in the deep debugging of HD-audio, read the
 HD-audio specification at first.  The specification is found on
 Intel's web page, for example:
 
-* https://www.intel.com/content/www/us/en/standards/high-definition-audio-specification.html
+* https://www.intel.com/content/dam/www/public/us/en/documents/product-specifications/high-definition-audio-specification.pdf
 
 
 HD-Audio Controller
-- 
2.34.1

