Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B023ACF0C
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772819254; cv=none; b=kJT8PsqDzBnrcY48PLbRGAJKVMCBUtoGq/6IkmjAPdSDw65ZtJ2AvGafSxKO5HeTDRnAl6YBwuBABYrC5sDqTfoqUEVUQ1DicOQFT9ZbCjyCqao5fAjVcMR4VgDWiBXCbMIXy4eTdaduiZRVFcw99RaLL2aTyQjvgCzflrzF7xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772819254; c=relaxed/simple;
	bh=ZcB5/f0n4kKcagmGLyPbNc4jMo5CRTtZDy8I/8tDHDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RucOXJitlToQOdScaLbaH903TxFfjSdscSlwc1kjCXPnLxb8Ah5pVnb/301kQ5H8wijPD3tI/fDTYjjv3lCYVZEwS29uM6Pf/phUAZ4WB1kjzp0b73deM5aCd3L42ff5ziOP6nezQ7dz2DVMlj20p9ydWsdKtLVCDgYzheBcxrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mz84Nk+4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mz84Nk+4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48371119eacso113003365e9.2
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 09:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772819251; x=1773424051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHkka1w7OV7hW9Oh3hoQM8Di/4bfbgpdkpmcV8tEmtE=;
        b=Mz84Nk+4E7yIopsQTwfGitb4t0JAvQIow8IWzAjA8/d23AAoSn5HGxJNyZWuvDMae2
         YA7OT+/nTgsqMNNJzcK+9PJAdlqsuW4Wuhe45wef5l2mbAefKOmB6LeDsltKRnraXg0u
         GZPjzplCaWIomp9TzupAxVmbGmwl91s1C9wdABkkL2SUWGO20FU1jLkz6aAHaRu/kj/K
         eHEz/DybkkkFpFpHhfWdZG/Dg/r8oo7UbSdBRHbZsz+qTvVkWBkcAx4sDhk0jeH/+axn
         ydWWQBXoFsWBOM5Y5KKqKRZpiRVDsPE2/NXYzSGCWUXsiEK2FW1Fe0VBigT89TGp5WwP
         DnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772819251; x=1773424051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHkka1w7OV7hW9Oh3hoQM8Di/4bfbgpdkpmcV8tEmtE=;
        b=atJ4slEcRVcBxRbYYRqsN/aBsb1MAIftCGvNWCWtRsxiQNR3OXjJq2skV3Gob1Rn7m
         8MfXcUFLalJGk7P7n90826H6GhAg4L8xNttxxsSyfxnsaEvpA+cCl//2RG22hZyKmveO
         B4yhlIVeh89hcuoGt2A6nlARl/fx2Mhgx9VGNAvBUUn8b5zdBXhgGGPXxejd6RW4y8eu
         6YrHgVPkAIsKbaoLG3QixwxjG/Nwf7APnzso7sqVI7PwfJLLNJucRP1C3AVyz51CEstn
         Xamdn+0cLyZL3KJrePSvpj74hzJGpMtWtTDeBMLu6vth5wRRCPiHSQRz7tOBnOOr14WW
         uCMw==
X-Forwarded-Encrypted: i=1; AJvYcCXjH2xZf4KHSU+acajIHCJqM5uj/CLQRg0gv9SAjIKF34ye7wdxMyXImE85GeYjymB65nstud3sFdanZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbQKm/1E02b7DB6hTxLq2my2WOauW+UFlwmJew5F3ow1IVhOa7
	8pSWGccSkWAEKbLzHcCP3PwK+qVxfrHQQHkxybF2XfcwwZBQxQkujBOSZYfk24T36ZCdL5TLDEo
	HQtit
X-Gm-Gg: ATEYQzypp8Dequ2vTyw0EGGeWbtm5RT3M86HPgj+Nj2aONfA/6NHQrvKfWLpi8MKl6M
	dcfmfnlf3JTpI2eY4kNrVQV1e2JDyIhf4Mljw7okYn9O444ys7YBUBqt+O8cEz8H8bmZxWVTmNT
	Gfp2/He32pIBeJNEvF5pIOfbZPu11vI8M7q0mfDmKJmH1gEba7fUxiMQESRm0/ORz9ArGC0NwSb
	nV97Ld084fN+vc83zhI66BsdHahAX2hykEFsXFRaPxSLngGadSJhX/HQ0gHKdiQ18SswhIYet+k
	Bimd+nzkIN/1/C0+7weCT+KR4rEME0dptAvho8qDWzV9N1PDatH6OR6+wNkK2CyqpU8Vf+fHnPV
	SL9TJlvb2YQ6JYfKoy8gFrJaZaT2OipB0nWV2jRInTSdlOGUjp4KH7rLOULdYiWaxjJ3m+vwrSc
	Wj0MRzPt19KxfNaax/wzB4kaf8lib4KK7VKDC5sRAI1AOjwlzi+7+LKzBeyBix3hPe+n0=
X-Received: by 2002:a05:600c:4f49:b0:483:b01c:9508 with SMTP id 5b1f17b1804b1-48526917205mr55754725e9.2.1772819251493;
        Fri, 06 Mar 2026 09:47:31 -0800 (PST)
Received: from toyger.fritz.box (p509936c9.dip0.t-ipconnect.de. [80.153.54.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e2bsm52758485e9.5.2026.03.06.09.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:47:30 -0800 (PST)
From: Casey Connolly <casey.connolly@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
Cc: Casey Connolly <casey.connolly@linaro.org>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: detect empty DMI strings
Date: Fri,  6 Mar 2026 18:47:07 +0100
Message-ID: <20260306174707.283071-2-casey.connolly@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some bootloaders like recent versions of U-Boot may install some DMI
properties with empty values rather than not populate them. This manages
to make its way through the validator and cleanup resulting in a rogue
hyphen being appended to the card longname.

Fixes: 4e01e5dbba96 ("ASoC: improve the DMI long card code in asoc-core")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 sound/soc/soc-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9dd84d73046b..ba5c60f64208 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1860,14 +1860,17 @@ static void cleanup_dmi_name(char *name)
 }
 
 /*
  * Check if a DMI field is valid, i.e. not containing any string
- * in the black list.
+ * in the black list and not the empty string.
  */
 static int is_dmi_valid(const char *field)
 {
 	int i = 0;
 
+	if (!field[0])
+		return 0;
+
 	while (dmi_blacklist[i]) {
 		if (strstr(field, dmi_blacklist[i]))
 			return 0;
 		i++;
-- 
2.53.0

