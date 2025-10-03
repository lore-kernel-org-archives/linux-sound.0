Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDE1547C9
	for <linux-sound@vger.kernel.org>; Fri,  3 Oct 2025 04:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759467593; cv=none; b=HPDsthTCupuP1bHjv9nJyg4ud77VyBR1fUymgpK8dL9AJ8uwjZ4hzpB0nwGeIAe2j6zjnPajoAVF/nJjlc0HqPDDUPKz8wQOnWYfuYbBVvivY2fb1wIFUfOBO8zQsa3poHIr8VYsEDlo9JmcgRNGnPxfT5lhqTQnVCTA7xDdMvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759467593; c=relaxed/simple;
	bh=SDibelJ8WaN+m2Nw635MwP9cYpqavCFzJAbryqPuKC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oz6BAbIOlbi8yGoOo0QUeTkxJ/XrXLYARBIsxDArs7EX+wqqht3sieqv+DO9vn3vUCSFnGoiOEKo0ZsZ1zscCSjNGWHcLshhRXvH1/DaSKWw7uMlRhaiVu9FKwYAfur53nd+zN8fjwTPCMngqs/H9BzSlxueocG696f68IJEPBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHc4/yTZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHc4/yTZ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ee15505cdeso1414096f8f.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Oct 2025 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759467590; x=1760072390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezb2+W7XUTivwDtpbnZX14PeKRgmQOtAgQZxnhbhRD8=;
        b=AHc4/yTZFClkV/wAU7t4GhiH35jOI+Jwty3SVl/Nb+saNFTIptmUf1sSzaMDxWWQvs
         S40/p+29XiYMhZtUa3EFR8srATAUnMwyWJAiGg8WU6s5xMTNVxPj2/YeNHmIHqicFA7E
         VaK5Q0Z1xR71GVqx/3eonYILGhl3mttTsFaoNyn7JfwHO4r2orOjznl/1sL0JXCuWimY
         1C3553m1EnOMCBJ6adcWi/wkaHiMTIgrDSi13RiAfxKMUO/e4NvPd97+2P9gC+KY2XuW
         r7Jx0lp/EUHyPSc/v5OcDJQR4i3ATlSAtnKDiTtJ7cZrLlLBbDueo573hqhqn5k2imaG
         s63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759467590; x=1760072390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ezb2+W7XUTivwDtpbnZX14PeKRgmQOtAgQZxnhbhRD8=;
        b=kuxQndXOOisbLfDGPRfuOaI8cCqbH5ZYVcmGoJSN6D/P7chmMo+jvhfk8Tv1YrsWuy
         10Y2LP++7JS6l6uru8xJ5+DK1QEiEtpWzpUgohtDx9tX+S5FsRR92VTnyAxnModH8olP
         DikS5FtoJoNFjdU7/uV5JwHAZnC5KZVDsP+zfqk88T0l82/0U5IjXGCCmZOUx7dHmZjs
         OpOSvlWnPxZRP4Y3OS3/MNEFtcSe8lhZDZJMMsZB9Sfl1Lisew/3xeh8H17CeZU5IYjY
         QFT5K6gl+9ZTtxFQUYV0IQCcELBssY4YMjovP9AkjrtO+Fo+B5l6E7qqK2XYouN3cz0p
         sI+w==
X-Forwarded-Encrypted: i=1; AJvYcCX40fOitgSZhMwknbf6P/UbouDeJlWd0/ZH0aZbw8l2i831bTtBWobwbXmWhmxiW/7W41K1ZpvtwA+X9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCeo9I8h/LVa7vEac8tAw4DyzqCfhcCoLfkyTqFWtXVXkxL/IK
	uzc0PtyY/IBjBlCodh/IAKWhEOregbqpPNoGMlYh0BwcSC+ek2UlWMd9
X-Gm-Gg: ASbGncsErLx5rVX7mzJyLwtLCd/QXGoupQPGaxeDrJIIJ1qSuMQWhvP/hlUJLUBb1Q0
	qst2HDnXLaVpF79GR5KOmjqVRi73btC08sVABo/e2FCcb9hs64kEK7vu0J0ES2TBBh+Toh/twZ3
	0edW2CqXRxSBiIAbgLfjjjBVmWWb7LzfDidNl/LAkajk9CectT43f3Uf4SASjfOFsNPDNSpjRs0
	5ZxQzVWIjcRqQgFetM9KqT/KNGPWGJ1H1CzhM9sTkIRzPTazsvpqw6zttziLUCcxQSk8req/qBf
	CQYfQh1T08r9ypnUyt1UNN5YjtpbMEEr9OayRUeOv1L9TWyq6rPDewUZBmJ/5z+bZSB4jxSkgOA
	8HPI3gHk+AfXg+sNprisT4xhYwB4uWi8qBD6Thd6Xbc9FEcjM8LajvMZYMwtv
X-Google-Smtp-Source: AGHT+IF9fKIKwqtZdSmzz23uYKOPh0PHkyguSU5Svn97r7CPyqV0UeMbltYUSMgZAhnK1oo3NKfhbQ==
X-Received: by 2002:a5d:584a:0:b0:425:58d0:483a with SMTP id ffacd0b85a97d-4255d294cb7mr4009234f8f.3.1759467590083;
        Thu, 02 Oct 2025 21:59:50 -0700 (PDT)
Received: from gmail.com ([136.226.167.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a8542sm6242734f8f.9.2025.10.02.21.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:59:49 -0700 (PDT)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	daniel.baluta@nxp.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: shuah@kernel.org,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH RESEND] sound/soc/sof:Use kmalloc_array instead of kmalloc
Date: Fri,  3 Oct 2025 10:28:50 +0530
Message-ID: <20251003045849.1172-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Documentation/process/deprecated.rst recommends to avoid the use of
kmalloc with dynamic size calculations due to the risk of them
overflowing. This could lead to values wrapping around and a
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array()

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---

Resending the patch

 sound/soc/sof/ipc3-dtrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index e5c8fec173c4..6ec391fd39a9 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -126,7 +126,7 @@ static int trace_filter_parse(struct snd_sof_dev *sdev, char *string,
 		capacity += TRACE_FILTER_ELEMENTS_PER_ENTRY;
 		entry = strchr(entry + 1, entry_delimiter[0]);
 	}
-	*out = kmalloc(capacity * sizeof(**out), GFP_KERNEL);
+	*out = kmalloc_array(capacity, sizeof(**out), GFP_KERNEL);
 	if (!*out)
 		return -ENOMEM;
 
-- 
2.43.0

