Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCA832D0C9
	for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 12:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384310; cv=none; b=kTbAbBter0zS3a3mdh7sjzhRYwTQiv3Fd9U+KFt63R4LQWDchXSQ+GKqk5Mt2avO9LrWuc643MCdREaXyeQ4x6tUHtgnxQ6Mff83dgCXb8VDlPlo5T116IqaLKe1dxZFIb8gtVv55qo40hXCw2DhIW9ya/bYRvMtt/rYSDXzTb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384310; c=relaxed/simple;
	bh=A8LFaJcRw+4cRgoqu5OcKPrSshWxByWSWMuNVQKlBO8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jytsrUXemwY37A6Xjocdap/HhOjHJ3ty9d3Rw+XfwOnP3dVFoUnumn3BhjnHQONVEpIgwBB1EZ2TxMwgU1FI0L2CcMIGKYSmDn2UQpFOtEmDcvXgVJpiF4vh2FAe4Dm2kWJDZsleCT+R0IetDadnygfe/Pj7sjkXXER737ecw9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LaUa2aBK; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LaUa2aBK"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59583505988so4532234e87.1
        for <linux-sound@vger.kernel.org>; Mon, 17 Nov 2025 04:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763384306; x=1763989106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJUY/Nz8znMOzlmN9RG54SpWE9CBSXqNCqHzQUyQ31E=;
        b=LaUa2aBKKmwMZEwpSrwzmv832YnPBuRByrwTtItedonBt6cSz5P4s4fjrSb18ojU5t
         1IeUk+pqjJUab0NDR/gssinZyj27SFUmiCWhSLGNwb2YrXbXuwlM9iSfdv6yB6SMUcLC
         Z6x5CaqYWpKQoxbPaJyK8snJezmKujyxhM9xNBnU7Ros8DC6RJrnW/nFIZNotEh+EOfJ
         bDaZKhqrvE+HwIqUuh6Bti/qvm6PjuXb+YoWQTuJxrBQzDwRWjOyWCwlqNZ8qExFG6m5
         lZVZy8GaRf2LvWDbqHcgkqNsEPPk3GqQJ+xK+wqWELnztG+JLsR11ci8ElVtL8Fm4yh7
         /f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384306; x=1763989106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qJUY/Nz8znMOzlmN9RG54SpWE9CBSXqNCqHzQUyQ31E=;
        b=gVmD7nEC7BgSbZwvu5N6msBbjbRLqVTq5ajHa9CNQ5IUNOSmTskvtccjA/fD0Bnjr/
         y4Tct+T3DwuYpG9nfmBXYEgPBA5S6zn+f9Lspx7mN+bYzleYfvB2gm8J49z6egAiM0Gu
         mQtj+W3yBKjqJoLayrl6Z4FqArJcfW5sTwd7Y8wnJTPQ1gdxNzNvYpCiUrOcMdZ+oNlr
         H1wBUwsEARiGbEbW9JccDXqWkBqWYOLZxlof9jx5TSGM4Nplcl9avBNqppGZ38kCnVaz
         4ihavg1m3ghVVbSzcG34Dp07DfrwtSwM0Pqz9rs8Hzw8PblfXtb5AkGQnFhy0RDXB9et
         aA/w==
X-Gm-Message-State: AOJu0Yxatb/VHcE4o3D9AFz+amX8DZUG7sOqG1u3LAORtQi5YiBNUs5P
	HbHEVIx/GzTjtLgsF4W3ZlvTNN8mwGIqzHkLZvNHwnZ+zlaH6GAn2bf82rUZzxRMzOg=
X-Gm-Gg: ASbGnct4PfJKyUdUrT43z4YBqsupLSFppAn08cIb2NH8DHBonXLZxBbbUUgMw2eOCBs
	JJNnJ7X2WAHslUxU8n6GzlUh+/pCFAaUtDLwbVrB1VwwTq6tQmWNAwgAX2ZahCvLNKfalLHb1rx
	Y4GITQ2wzWA4SvMUgWRgpWVrFx2Z5jWTdlh0sXMFiSCzfbpcI2VndUlth+uvedLgzyjKS3of4YV
	TRlFf11QTfa+ty8qC1d5bVqygB8yWYUkCuN4Rt+Q/G08u4gbIEvnGO/XXTHk6HWiSdrHkLfZeTn
	DAkNjwHH8hKIvlpwkMiaQ1hlBYrQ8UZvra3El4FEl9xItWt1cE5VSJwxEQHdAQWZHaIS0vU3VPD
	+ByiX0sv7AJ7e7InR3Wibg5SIpUq7BEnFfggDvlsdHWAiTHPfkr/b6RMGWGzwuVXtIYd7cMS3Lw
	==
X-Google-Smtp-Source: AGHT+IGFMV6BaehoMvCti4ij2kNF7zs+ICJf7BQm7SZCcLmOw5geFVHsi0qmFXHoC/ShVjv6908YCw==
X-Received: by 2002:a05:6512:39d2:b0:594:35d7:731f with SMTP id 2adb3069b0e04-595840c384dmr4500337e87.7.1763384305463;
        Mon, 17 Nov 2025 04:58:25 -0800 (PST)
Received: from ARCHMINI ([84.39.247.127])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803acab0sm3147257e87.11.2025.11.17.04.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 04:58:25 -0800 (PST)
From: i.v.zhaldak@gmail.com
To: linux-sound@vger.kernel.org
Cc: Ivan Zhaldak <i.v.zhaldak@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Add DSD quirk for LEAK Stereo 230
Date: Mon, 17 Nov 2025 15:58:35 +0300
Message-ID: <20251117125848.30769-1-i.v.zhaldak@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ivan Zhaldak <i.v.zhaldak@gmail.com>

Integrated amplifier LEAK Stereo 230 by IAG Limited has built-in
ESS9038Q2M DAC served by XMOS controller. It supports both DSD Native
and DSD-over-PCM (DoP) operational modes. But it doesn't work properly
by default and tries DSD-to-PCM conversion. USB quirks below allow it
to operate as designed.
 
Add DSD_RAW quirk flag for IAG Limited devices (vendor ID 0x2622)
Add DSD format quirk for LEAK Stereo 230 (USB ID 0x2622:0x0061)

Signed-off-by: Ivan Zhaldak <i.v.zhaldak@gmail.com>
---
 sound/usb/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 5e30bff69f82..61bd61ffb1b2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2030,6 +2030,7 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case USB_ID(0x249c, 0x9326): /* M2Tech Young MkIII */
 	case USB_ID(0x2616, 0x0106): /* PS Audio NuWave DAC */
 	case USB_ID(0x2622, 0x0041): /* Audiolab M-DAC+ */
+	case USB_ID(0x2622, 0x0061): /* LEAK Stereo 230 */
 	case USB_ID(0x278b, 0x5100): /* Rotel RC-1590 */
 	case USB_ID(0x27f7, 0x3002): /* W4S DAC-2v2SE */
 	case USB_ID(0x29a2, 0x0086): /* Mutec MC3+ USB */
@@ -2428,6 +2429,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x25ce, /* Mytek devices */
 		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x2622, /* IAG Limited devices */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x278b, /* Rotel? */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x292b, /* Gustard/Ess based devices */
-- 
2.51.2

