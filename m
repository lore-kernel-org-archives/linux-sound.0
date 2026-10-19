Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1B14E3769
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413496; cv=none; b=IW13Xx0OkqUX8KniTNVqOr7i2DY1W0QqzEUvwU9PkcjMs8dX7yDAawL+MXQ4z/Wdt905syLnfVHJDHvYsbwpIV07EFJFqsHa8rO9ipzlZtqf4EYjtPNXb2YJdNmxAzkT+pHjOnqLhqErPe4uRl6uxy1OWyg82c9C9HQuoljSN00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413496; c=relaxed/simple;
	bh=a1RIJ/bMmJNxSAKekcWOeb0aocNYtYHTHwsGPOtVJgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T2Wb7mDsDHsjeKV9fJMk2+vRfygu5R7YtpvDcG4WBZz2wNwMGCEDxBDENST5XNDwb+up1//LEYr5SDNU6ZDPuZtE066bSWCoGZob/xJKXn5siNlXvJ9RXZ4e+Henr2zE+wobgRui4S3RUtZUQ8S+OMSHefLMV9tTP7oOOM9JdFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYgeeVNb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYgeeVNb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so491238a91.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413485; x=1793018285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1RIJ/bMmJNxSAKekcWOeb0aocNYtYHTHwsGPOtVJgM=;
        b=aYgeeVNb0jyF0nsnwPwRzpdfZ4zXWVOQRUBCCDWo13ZNVkM0FynTh2gQ59lIUn+8gl
         YehwNlUH+zbBA/FrBP4MIla26b4lzw4Jg8SF+uMPHyPEIiFkG6j78Ru6AKc5w3nt/Ngg
         UAr8CMboyEQcGdE6uE4Q2zsWZQMi+chFlDDJF8qlCtfXBmU4qwkpzZ6bGNwoIUnDetSa
         15V205ZrbN+B0lOUmA5gGNI5Ptpf20XzvBlIAr4t+3EgEjEf8BRfgslkQWnwwtijbvSf
         xSi6NQDV9wG1XfaCkTNVci8xY9XoF637xJo6wj6EX3FoL/n+3fiXb1NoHHSR6NXvLTSK
         VupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413485; x=1793018285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1RIJ/bMmJNxSAKekcWOeb0aocNYtYHTHwsGPOtVJgM=;
        b=PjavKiZ4BPe4m5GgwO8I3qU9XZIQUv2BCAPXoIGgksy9Hq6D2K5CA0pLg4ZvfNYmVJ
         ftkhNcoCp+IJrG6+7hIL8R/VzasYFN49GUV/6gZvlt3/fY6Gkctw228HTS3OiRi/i1nn
         n1gpwOA47BFypEg1PJykjqLcQIlfdpQm3GBvYSHUq545iHRu0sT3TfWKxQ++QhVHTPtu
         7Xw/TBr4QjGOMIbPzsXDluYL2THesZGj4lI5xFl3WnSs1QeGOUMjrzCIVkNKdztZB2Zk
         vr6O0UusDixQJrXPdU6pvf5Xc037HGrsCoHWuNppv4PCRSM4r7R91PK8heFtoWL5WxUl
         UffA==
X-Forwarded-Encrypted: i=1; AKwUvByLSTlbybe6wozs13kBeceEj9jmYxmO6Tm0cr765W9Xeep0LIDv0fCpW4y2xU39ggTz7F3+Dc4zvB6ixw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIHvxxCUGklMPtRCY9qwF0TpG/Ol0bVAr9wSuxXFfJ5SwM5D1I1
	TIM9A7730c2Ljq9UdU5gweC+torxsm7+Jcl6zmyCZ6EiWVoHDi4J4E2d
X-Gm-Gg: AYBFou2r3ehUxGhIciweKzz2b/R6Rl5lZQYqMbLDxOgcTX2YJSAxaNCpSrk/2PTpU3B
	jUrzbQjS7UXWAZBM5MeT7NYf/goZMqUE+k4vH/SXr/ikjHzkWj0RVCM0EPEGdtcFMyVx6d91fJo
	dy1h7IG82AZzm4E2P3g2njbciVpxkjItDlrJLGQTeXuCjkQloHYesyThfYEGq6+K0COsvxWyO3h
	k2dvGaIXFrh5sFeiA+vxr2HwIGALani7+pUujNgt0pWp/KCrLH1hXcQl7vK7s78VbNZP9KW6gQI
	jUVC3IEgfOiGonUrlYN9nD8xRzzCbXHdmcvEMkLwNXhoi92CHs7JoYkpFFboP/Ijs7oPbnIIEZ3
	QVFGmzBnhrv0E2/3C4shSwU0r9vygUbH63qAA82wxathLW/HZ6LXgiyuu9vOrdaDLHE9sqBKepe
	Uo/UIskvABfRBCkodli2c/5xZsyOArNq16Apw/+kVYsgbQhD8awehKGJLiQDO90VBxYPxVNsMdd
	HtB0DwAsEYf3OMwxhZ50gLsYoWeyU0vrWQHFFr9DPdxgFkwKmY6ZMt6ERzH+NE1mKeZvcktnucJ
	tQ==
X-Received: by 2002:a17:90b:4ac6:b0:3ac:9e76:aa97 with SMTP id 98e67ed59e1d1-3acee277119mr6899551a91.6.1792413485432;
        Mon, 19 Oct 2026 05:38:05 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654a15c57sm3902419a12.25.2026.10.19.05.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:38:04 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Warn about controls whose register fields overlap
Date: Mon, 19 Oct 2026 21:38:00 +0900
Message-ID: <20261019123800.3410554-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atXh3Br+fuH83S0q@opensource.cirrus.com>
References: <atXh3Br+fuH83S0q@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Charles,

Thank you for looking at this, and for the explanation. That makes
sense to me. If it is all right with you, I would be glad to send the
patch myself. I will Cc you on it, and I would be grateful for a review
when you have a moment.

Best regards,
HyeongJun
