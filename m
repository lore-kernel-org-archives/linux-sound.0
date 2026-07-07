Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36CF272E56
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783410375; cv=none; b=i/O18JfoQYnSpPk6HAVNCHv+aFav4DUzb6+Z8JlSORLkpz/LuHyMKmx9ORbWPq1kly4X+PzYC0ChggduBocmGULZAQJ1m5PCM9m2vHCDioySboCLSfIVFctNe1mM3M67/9e0l27i7O5a+/k7I4507iQJvTF0p1tjCjzn8HVVrm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783410375; c=relaxed/simple;
	bh=AoDc0nH5scDoQ6kwVha+UZsPaErfp5vVD/v8fu5aHIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asCOgzfy1ASVnBfAK7WVudZV3OQFrZXcVk8ixBkBfjwSrReB8CUvB8mkeac0v7OlsnVV57kwzoaY6dQSVOoRGv5IkYIUTrftv92NLQ0D/gU9mc3NkfPzOrXhkQ507I75l1sf7ju7eGlQUofyMoS0mWq924E3CXbRAmtynyL7/kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ms0/X9MI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ms0/X9MI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacd69a9c0so33094185ad.1
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410373; x=1784015173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARAZMLdXfhQAbRIzdVGqWFQueaVAHzair8cSoUrSeFI=;
        b=Ms0/X9MIGc4xUqaEEqGiQ8o9EuoIam50JqspsMTtIGeuKazpaS3M+OLHd3nvacCefk
         F2R1MTsrf1Xg123keGIKNwrbMM4PWb6cJspxexPgB7dDFjhZUxtry1Z6jYNyn4GsWkw9
         ozTa/nHQY3vBrSKxWVgjXqHWRigWYW4eSe0MpSYrW8mmUeuSWPrQGT+VGMKU874+yZUA
         Fn7eVWQOiua17tkNFGJYh/eNNZVDJjTfAOXIlYKDXN0Ku6nY6suk8JQYALctZGTqzhoG
         iaAXaLM4nzOXmE9ChC6/P1w5snaM74s/m3ig7lCmoyI3yY8QRtgGRLD/wGr504SZ/zRy
         ibwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410373; x=1784015173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARAZMLdXfhQAbRIzdVGqWFQueaVAHzair8cSoUrSeFI=;
        b=kdfb3xKphm+WxGrN9YMm4xXTlyrNnFgv7h+7azYNDHhH1YSFq/8MvPhlForEqwas+1
         QXvd38MwClXZ1L3OgDLwLwR8MX2VBC5PM6VQKA1BPHn6qelIaEfa4A9aroigMYpk9xLC
         XQ6q5KHAvyfe5BTntO1TVpkak6u3gJgHzoeYH58TuYx1HIb/KrRfWC3of/EtG9gRFBQa
         0wL0D+LBJN539/3GMGIfUUhpplWIl7cdCRvXpHWHpE6LYM98Y89m2YAteBsSN+i+jXWC
         bypjRzmvq9tcUSt1hYYxQXwmGkeXlbSP6oloW6kPJmLy64ZZoM2LGWbCO/3t5uNDbkSP
         cXtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhT6QrnCis9KZoZaE5jBkWwJmDyfUlAx2ehqh9vZ55qAAR+VnZ2jGNj21FMGX6PH9KpisvzulD48Y6Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzegbmNrWJCquu/NMhRqBLebSrioz0k4LXseebbhHiHjxIuSSUf
	LtcwbSxuBQzVkR+nvpmEOw1oSxhjw9I5tovlrMA470I4tfQmIvJ/yCfj
X-Gm-Gg: AfdE7clP9FpdrK8HA7b8GHdg0YpXoDgHOf7hy6hDvvvb3I/Qm2ye97ceW6eumwrI+50
	b+TU1h9j5J93hKaf7/j9zKqtCRszcDW2h+qmFJ5HJ1N3LyTUSTNdXFgweKn0P+UvEY8DUpDaTr6
	caF+MEtGM/In7K+CbXvU+wwIK0/BxvWwcw+RCdmQ1qVI423wCczBigLd2CPHZUnqOzIoGp1G6yq
	HEZbeT9UhCBdw172s4jOogC9CcAHrKxuS1PCL+JplW3bF5xyIiwLRX4AvyR2RYSphWKE2QCw0Tc
	XFyO2ZjWUW0a4nIQqmR1bEDv1ZO1jbVbvq7W3Uy/zU7AD/Px7BHXa2RBE2rQDldXvvRKTk/8AwQ
	QHmkJ18l1/xZXdcergQX8PfUrITJqXjwcU2UzrzqR107INISEaDrTdbFprYuJUIdgtngqGAc83E
	ITgcgI6PyyyZGa+SV8D3XLRwgGileRBRakETqOvRIHzr5Ha1nJWz1EZTRCww==
X-Received: by 2002:a17:903:37c3:b0:2c9:854c:a45c with SMTP id d9443c01a7336-2ccbf04371amr44667075ad.34.1783410373296;
        Tue, 07 Jul 2026 00:46:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1eea1sm7016345ad.46.2026.07.07.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:46:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Kees Cook <kees@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ALSA: core: use ARRAY_SIZE() in snd_minor_info_read()
Date: Tue,  7 Jul 2026 14:45:56 +0700
Message-ID: <20260707074556.569451-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use ARRAY_SIZE(snd_minors) instead of SNDRV_OS_MINORS directly, for
consistency with snd_find_free_minor() and snd_unregister_device() in
the same file. No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/sound.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/sound.c b/sound/core/sound.c
index 3e1969a52b21..17c380d8d8be 100644
--- a/sound/core/sound.c
+++ b/sound/core/sound.c
@@ -358,7 +358,7 @@ static void snd_minor_info_read(struct snd_info_entry *entry, struct snd_info_bu
 	struct snd_minor *mptr;
 
 	guard(mutex)(&sound_mutex);
-	for (minor = 0; minor < SNDRV_OS_MINORS; ++minor) {
+	for (minor = 0; minor < ARRAY_SIZE(snd_minors); ++minor) {
 		mptr = snd_minors[minor];
 		if (!mptr)
 			continue;
-- 
2.43.0

