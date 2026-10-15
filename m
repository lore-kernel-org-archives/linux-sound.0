Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F6C3F410D
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106584; cv=none; b=H+sDj8cV2kv1sN5evm7t4ebU4Z1XDK5KnrnnyBQRJFZIN/DltOjAIxgBzk7OxJJTEPS3d70vEvuNFUS0Wil9xv971gZsWhnOZkeraYM+MtIK5NVjSIHX5+4D2fZV6LaXENYqxXZ0hFCsKcV2Px8sHHQtPRo2wakPnX8KXNmUjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106584; c=relaxed/simple;
	bh=NIVzQ+RJCCvoNJTkWGq+tQGBzXKOSJUfZgl5oF2rlZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6WFTetghF/LEDrz9PhqLleqyfrl6p8yY097KHgcyrKCXE5hqdf+1S0+rgha1bupdH7uLIsX2X64AAFdSlMGtjzH/DGw2BW3deCatXoU2u5FhTIyRT+KBNlQ9Z8ImH9KU08jnYEapwGUSVb43TNDuS1vD15ea6/G61zoNyUrBBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mF1m7ZBR; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mF1m7ZBR"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53582498790so24519031cf.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792106581; x=1792711381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03oMX6BgLkysOvRrvfzzjSMNwOnFtfGZ6sCBy/TZ3gc=;
        b=mF1m7ZBRox2MnjjljYs2DutrrSuifZUKHXoPKse9jsGLSVLyODBdFiIAHJTY7nR9Yh
         0Ad348k8kD/aQ///RNS9q2p4SfbdvM1SiTtjkNztB+PHSBwnZ+2mxvsoub/REETj9uIV
         2saJc4PFWqSSCyYlfsds2JDonAI603nOrtGEXxsn5H0Jyug8ISRui78M1GUDOLwunHsH
         2QMXiXnvS1CJNUntOsMWjteZ0p7RntkVhFWTdxbvaH+Fvju3R7wNoc8aS35VPOWZRxM0
         xGEVDNL8K1JeeoK57VH/wf2AwgfW/O4Dbs+MisSiszbZrPIDR4MmJCHMbQheSBEJpbCf
         o05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792106581; x=1792711381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03oMX6BgLkysOvRrvfzzjSMNwOnFtfGZ6sCBy/TZ3gc=;
        b=IVknsGh5N1K9w5SauGz2cAzjeJ7UMCjXVf0BLaxpSdKgJcoHh0L0YMqRo7u4tXqb6P
         EX4W3UcUz8twJzplVjHCje4C9mJZQ734EFyLBVGMThWpfxI3VMucmjQaBvNBbmU3NeXT
         nRYr0bevk9XnNNfG2ty5rOiofXXA4LBmYa/gK2D/hzl+sDNysoVgyRd4Md0IZpr3fTmh
         oyy5xy/qujykMvenZuegBE7+ZDbcAM+ERuYMhEXCMDcLwbKBtyNRFPcS/r66AyA1l8yB
         7K0qc7TKWoDy+5jyvWdyqIWV8PeOkuD0aB3zI/fZ7v6YmMSbXR8JLY1Q66hSvS6vt5Dj
         2+QA==
X-Forwarded-Encrypted: i=1; AKwUvBy2poEEQrfollbiP+1HRTpgDCxrnAvlrSri4V0LVF/PCf6QIuRxKJHTnqm/AzA8zERwPwvQkVyddkLJXQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKc5lVDqrIhfwa1RqHPuz5yHOenQhj1OxK4/MfNljdhQOMwsqO9
	5gUNFGHpiQyMBjjoYgm1aJmgDmGWBEAFiKzUIZEieL417a4BKCrAboJg
X-Gm-Gg: AYBFou3UZRwFQ8lL+/JbTZmmt2JAuJfN606eomKblVya0NDPrUC9Z1vVDZlwwPFe7Aa
	/AH1WlZvXO0S64C2XOZDIfVNz+BvfWXxd8y8vNL3hPWF0bNYQh/HVKFKSsCfaGJScc6DlkdUdS6
	vSURD0sKOBr6xztprPGXMAqrGviF4JtkwDAy7VFvFkUwJ/HtM17/izLCCpgBpXdKKF3OsJbO5he
	uZ2KJ+UgOMHRGBw89ikeFqK4sQhDCtSTDNT9JsyKATrucKmlT8oSYJGS8hRBmAsXLP4B0BDYSXl
	DUybdwRwESVeq0do4haIOVBWPrtsbYB/t+gC5xcb9H+QZYCKfPC4d7DafzoJcvlVUwvOlxMrUdm
	k2Vxq6HMedtg4bSOVe9/0dY54NeS4vlggEw/dAGE4FxLBM1LcYKIvHxnpHEEnLK3Frmx3nZveQG
	r50PCYOkIM79fxfArFFHFph2WCUiC41LQb+HiVgACxfbt2r04l4vAPVL5cZQ8a5PvoJ8rQ7qTYm
	WFfVJBoopDmlQzc
X-Received: by 2002:a05:622a:130d:b0:530:b2e4:4e30 with SMTP id d75a77b69052e-5359fde2799mr324546181cf.61.1792106580684;
        Thu, 15 Oct 2026 16:23:00 -0700 (PDT)
Received: from chowdhury.taild927b5.ts.net ([2607:fb91:5000:22c8::3f3b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9bbad2sm6453911cf.18.2026.10.15.16.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:23:00 -0700 (PDT)
From: Imtiaz Chowdhury <imtiazc56@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Imtiaz Chowdhury <imtiazc56@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add HP ENVY Laptop 13-ba1xxx quirk
Date: Thu, 15 Oct 2026 19:22:10 -0400
Message-ID: <20261015232210.35946-1-imtiazc56@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the HP ENVY Laptop 13-ba1xxx, the F5 and F8 key's LED were not
working at all.

Add a quirk for subsystem ID 0x8820 so it uses the existing
ALC245_FIXUP_HP_X360_MUTE_LEDS fixup, as done for the 13-ba0xxx.

Tested on HP ENVY Laptop 13-ba1063cl: F5 and F8 LED lights work as
intended. Checked the audio systems both with headphones and no
headphones, and there were no issues.

Signed-off-by: Imtiaz Chowdhury <imtiazc56@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 76a7ed218..799a5a7a8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7696,6 +7696,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x881e, "HP Laptop 15s-du3xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
+	SND_PCI_QUIRK(0x103c, 0x8820, "HP ENVY Laptop 13-ba1xxx", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x884b, "HP EliteBook 840 Aero G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
-- 
2.56.0

