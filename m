Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CFE29DB88
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 21:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647210; cv=none; b=uHzIeZHP3g1zd6GkEW2hVSVc4a7X1gfoNxImVFZDRibgJ1R9F67CNla/1/G/Mk7VHbv9ztUB7Qc1tFLHqOFp0rETR/kOB1YtUNIcVShx06VHD5MHiQVceYJLheW+MoBXGWWogoxEcb9IUelqzv6TjlcG92mOjUM6V2da4ngwpZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647210; c=relaxed/simple;
	bh=+TCZdFdEeBhrCVAcn7+c71ouuPpCjNd+c6Fq0PYQ+fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBagOGKBI5tqHLa2TUzz3NS9N7Fhjtr5do/z5ifqBi6BODZpYds0DW7aUSXUFDMKPN5pH84lKL2lunKj+rQme22XrEY2v7Bg1Bi1OYTi76J9xfGZs0Ey8hf87K5Z39SvQj0UnaAaIObh9tu7SMQ30eziDCbOG6qBVckja9pdTcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esW31VUy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esW31VUy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso2599550f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 14:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774647207; x=1775252007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPuxVYEuWm4N0g4DWuNehikyuO+dJ0JYnrWflFKAMGE=;
        b=esW31VUyc+ZhsTtHcIxJvsryHEbbxsudxmXnfxEz3E3ItnnF6NROXvBqLDmlBbMGpH
         ZI0PuqYuN+6T3di9q1E6bFKdlnrU8DyNgsC2Sv75IE27yeymS5+pgeuKVEE2bF+9SD7Q
         PUAH9HE/9w1OAysPe5ailPTKI5+xqgfheGZ6Ki5vjERZNQCeQNPaVRTL/ODbMJnoZ+A5
         DNRFQC9q4nVSCDp+T4U7f0C+tnPCncTs6tHDjXgxJNZDrjSC6/ZRHHS08J2c4nWOIozJ
         kfLX7FKCsgmUZ9hNKQhPED2Bf/8kr42O5aoz/lyZIS76zvC6231OUgIpCFpAGkHfui4X
         f7vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774647207; x=1775252007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hPuxVYEuWm4N0g4DWuNehikyuO+dJ0JYnrWflFKAMGE=;
        b=s193hSeymJ0NEYagtHuZipE2VWEp9xmOiiHjAJ6COf3UObJla5VE8gb/E10LF8PrXO
         t30tHwIpbb01/ncwzDQp4sMzs0iZ1TfXhpbgmlH+E15JFXi8Buls5AvoQo+WAhuz233Z
         6k+FAetyYNSsau8dnoAjYuBY2vJGZ/xr6eGOEqGnKgEbqr4OZSzwNjm2tQTmjEjVEpI8
         3R0Hma8zAW56I66AJBn4Zb/XGuzjcBbWjkqEEezfKtbPcbbVqCt39JMNDhZ7LvHzPy96
         tAt8Ut/e9urC4RM4FRSkXhT7P+5VBhh188U+Njv+pUONhrVtU7jlIZ5RK7bGs+Puqr0b
         0Jfg==
X-Gm-Message-State: AOJu0YxTkcPhQA8/lPNab7VVSn6SSclqi/zf3Cguuvkp808/KazfWGNW
	9KMul8iNOTnj8zVLF9fOJHhvFQFJbLBYs9p9mLW7bBHiyORwfbrb2O1SkOsI+zpg8Wc=
X-Gm-Gg: ATEYQzw4tkBd6aMMve/4+2yURR06zq3DxQXSNjUAJv/uIOWxJWGALHv0MYVqjT0dH+m
	OdLh0tfvr742pAAxCeQcKQScelDHCV2uMO079zKolqRPlUaFeXnRWzzURg+LsQYJgJAOBbXVPl4
	OHHizgESPzCWa4NVhFwX4roM4077EUZ2yeoeRwHviUXIZqw36bPj6+2WkOkG543KIpoGhDp2YcT
	drtmLXrcqlGNhhh5rQtSZpzifrBOsp5FO6TX7lllZn0aW/OPOjirvjAs9jfO4X/G7/PlnAgvNRf
	8Rpfu4wWwnJ/8Y4by1Dhpx0/zOmr0j6Bb6ujtnbM+CeGzA5tuHoE3pkGlU9K7JfdndUOkreakNm
	jtCiAHNGXfzZXdiQXwexUu5y8Nbwz4mGnMkxqnC3cuDmMbFNmMS9QD1WjM1wpikHYrcA2Jln7aN
	PgTXRzrNu+mIUp/CoV6mHniqUqneL1MQ==
X-Received: by 2002:a05:6000:430e:b0:43b:42e2:f4fc with SMTP id ffacd0b85a97d-43b9ea4a677mr6531395f8f.26.1774647207442;
        Fri, 27 Mar 2026 14:33:27 -0700 (PDT)
Received: from linux-workstation.lan ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257b72dsm815579f8f.34.2026.03.27.14.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:33:27 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Phil Willoughby <willerz@gmail.com>,
	Yue Wang <yuleopen@gmail.com>
Subject: [PATCH 1/1] NeuralDSP Quad Cortex isn't a DSD Device
Date: Fri, 27 Mar 2026 21:21:01 +0000
Message-ID: <20260327213318.5338-2-willerz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327213318.5338-1-willerz@gmail.com>
References: <20260327213318.5338-1-willerz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Phil Willoughby <willerz@gmail.com>
Cc: Yue Wang <yuleopen@gmail.com>
---
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

