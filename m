Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D724594A
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774685368; cv=none; b=b+i9Bs6WWE6bAMHKmtqNIPTikiIJxeaZ3z+eQCq3OCSQ2OpUwH76S7D+HbHA2hFUz5tBPZ6tNtjbh9g+WanItBzHLH5qCV7TSnABgGcGZhAlkB3BOxBTDKG3lP1azu7WuaaE/caaXvEoSTZlFMh7FW9Bg9isDxbUFJFoXh7VbtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774685368; c=relaxed/simple;
	bh=y+YCQB0L1jPrPlgBzSvLNtBXpEAmHS5TlCW5qlri3O8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Whl2OeUH21JOwWHpX1o7qp5vyjN/FUupt5lU+tBl9jI5zCQvzT7h7l9XANvqN1wSy3ernc3N1I6D/M5ypoXcrDaSo1H/zf75HPCFRxy7gKLJn5KYs+llYrocXfvGF3qMTIyeoNGochrIWamCZl5Cc/7aNysKgStpGYfH2Gs8dTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAy0dOuT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAy0dOuT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so24934025e9.0
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 01:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774685365; x=1775290165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nOPejNHKamRliSg1Z5Xyypecx+2uoZsODIwpK6/BGdM=;
        b=gAy0dOuT7a/D0cR48CkPZ/aFkMmPZAxGsn7tEt8pE6SX2jtmgQ3Sji+cvCYZy+r1Lf
         oWj53aPE18ab6yYpvz9yCc67aW09i5G6wGoiBtihNxCP27/kjxLgi7GDXprKVonybCYI
         1VZH7fHy/OyhWXyHCaKS685UDn9Qwn+5jcZgF2c3JBDMGvG8U5yFU/d/swPuqMF6xHFF
         t+9gE8DfjjZOlJY70n32EuAy16n3NgpXMYeqdwMsAQKSRg8pRQFQiNeXePeLcVOiPoEk
         /rljDJX5SRpvaXBpRarvSXHYBygKaZrh6jKCcoh2E3bFJ6HdtErbn3S9hcA7OEhW2O0A
         iJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774685365; x=1775290165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOPejNHKamRliSg1Z5Xyypecx+2uoZsODIwpK6/BGdM=;
        b=GiVQMZCtTLLEc9440lQb63KY/Z1nPpL1TMWMdES1f6HFYya8mrhicMprEQivMnFtwv
         jBxNoA6ikca14dcYzVVFpE7BuuY9uAKwnI+0wgutLk0oCq9uifpXlT7mXWo51IbS12Kl
         Qam7eaRtWKksEKyuTqF3uykmm1gAT2umVZwlpKnTWMunElADmC4Nr3O0zpwqTsrpZBsX
         mW//41SfAFQHwNTELeWGGemNfGLm/sjD+7krgy57OjV0UKiNqmm7kJL7AwiQtjw/jxGg
         S9btjX9NVeS1A/K4gl7Z3Zjh5vqVlWNnoth8dynUBYt5gRr4GTp8wXg5UNsWc7KaX7FJ
         5SfQ==
X-Gm-Message-State: AOJu0YzosXtG7hBi9cSYV0otGSXoxPElJqfROTr+5iDVtDj9nR7S9uVq
	qmlWUqPITX53MszP9LJKixjWxIeXQ8x3OPF3R58UKL84PnBzlvtfkBd2XcG6QKKgnKk=
X-Gm-Gg: ATEYQzxArtjbzjR+RdJ4CHh16gPBAWL163wkU2QbIf/bZ1BNjaZOtGNc6ugLVJ6SDNA
	RNuovqGO/i+Lk0nPQ9yO1kP79MFu0wC6tHW72sb13k8CO6OIQojgMzTB/a6vqG4+GgLTOORYnBv
	oWfclxEDHy7h4W/Jem25lGSfP1gEG+v3v8xZsV+S9IP0IpjRgSiPx6xbvnJGeOlsCJSihjOxO6W
	IpF/dzimguhh3kAiaU3YGCHczPoTRaRZXmUXpO6hPqK7oWG9VZuUveKv09HLLgbfu774fltSnYi
	xlKnFRpEr5MrYSzdfb3qwvhiIcU7gMBDcYMd/ckiJIml2Pz9Vq7GgdQCrpfTQemgfn6iroijEMp
	x3iBTohybzIWE7cdTB+eMP6xEvHnGnfiPxiAY8Whi6U2fp7gjyQfSFPTznPWTg4nF+h4U1B3ypx
	EsZxZNpMwbdIfHrnHNFjcz9kGN5yp0Tw==
X-Received: by 2002:a05:600c:4f53:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-48727ee988cmr83730085e9.3.1774685364612;
        Sat, 28 Mar 2026 01:09:24 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48730688694sm29187165e9.11.2026.03.28.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 01:09:24 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Yue Wang <yuleopen@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ALSA: usb-audio: Fix quirk flags for NeuralDSP Quad Cortex
Date: Sat, 28 Mar 2026 08:07:34 +0000
Message-ID: <20260328080921.3310-1-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NeuralDSP Quad Cortex does not support DSD playback. We need
this product-specific entry with zero quirks because otherwise it
falls through to the vendor-specific entry which marks it as
supporting DSD playback.

Cc: Yue Wang <yuleopen@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Signed-off-by: Phil Willoughby <willerz@gmail.com>
---
Improve commit message.

 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 4955cbe3b60a..67e812bd9113 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2361,6 +2361,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
 		   QUIRK_FLAG_IGNORE_CTL_ERROR),
+	DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
+		   0), /* Doesn't have the vendor quirk which would otherwise apply */
 	DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
 		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
 	DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
-- 
2.53.0

