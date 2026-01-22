Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7985743900C
	for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 12:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083620; cv=none; b=NL17r+z4bbOQnYjSO+ftDzYoO25tF+wLQtZES6PayI0K4r6X5QT1F8ufecATT/UTUdBfiAfV0XfB5/9JRXKlf2OdtvW762aujSqp3+bro3ZXodBT3P1B1expdf8ZidNNatXdnfA0ydjSIRLklpkTjOqNoenKa23t/CCwajiUHIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083620; c=relaxed/simple;
	bh=K9eQeiQeWdXtA3+TEcWAdi4IZHkbF71qtiWAr31BK6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J90wwN7FrPBuHSWKgcsqt1MP50tF299BJia5avGpr5VgfRgId+ryo+NZC7fB10AuGO6yMHWQT8idbtsJ7SmSvvmyr9HGk1LAzSfxLaLQLDSZtxzqsOueOz41LgwqPPToN9CsOQzBTgLT8oOWYam0XLMYBJEx8RnDwgm88hR7jeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNhkPxc8; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNhkPxc8"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-121a0bcd364so1473879c88.0
        for <linux-sound@vger.kernel.org>; Thu, 22 Jan 2026 04:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769083618; x=1769688418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EO2jHFxAeHpOuzjmzBcIgwmCRgFgxZDZ1CJgKdMiywA=;
        b=JNhkPxc8Pp+dC5lvQEHcNULIVckmFIKz6k+If1fGsUZHwWWEPZ+w30ZKyDWUEKqZg5
         csn4ZozJcWepCFD8g+aRIzovIk+07t58aq1uODmJaP+IfllJZRZIqqfY1aGK4IGZJHj1
         xIbYpnNz6eL314Yb0sD8pHytbUa5OGwkU4THXudKq1mMDFBpOQLQGJ2mwdLu5zAeQ+QE
         gQ9MfwZWgzfzuvyAqqE46VOApbj6rIVGt+JQHRxPtRQHImlOTiUcZ3ZhhT7yPd4FYPzW
         jmvXCnPULX+Ddf1GSKD3BXYTMCS5rTAZ9NQoWb7kirwlPffI8WVqpSOF60CdB4OHnz1J
         Tzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083618; x=1769688418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EO2jHFxAeHpOuzjmzBcIgwmCRgFgxZDZ1CJgKdMiywA=;
        b=ctjk0t/N9kD1lPg6wsLcJV7qq5OpC6IQKIOwFUfFuhTTskDND8RL9ZUg14Lpy6XliH
         jx+IiwWXEARw6zluJTKQ+hOyJHBrw+8wWV9MDESjWEy/jx60YmCR+dB2d4YSvWJrmAAO
         LkfoD0qp0HtxbKvKJ2WJFqFCcSh5gL7oWvbPfotUvC10wg/Q4qEyUki+p8+zK6EnTNwL
         ZXuieXWbVUYpUbpTnfpdiSMUs6bG1WUldiDp0lRkEdLwPhQV9F96noNtC+CXlL/ckgUM
         IXND0bReOJXsxGNExLg/J+qWtPoqGE/jAy02UwKZ53COEGa0zoGP7ogzElhg1d7cuPn+
         CQBA==
X-Gm-Message-State: AOJu0YwLrIcJzu4KGAVOx0STvFN8HGK6PF74zboCpoi1LZ+AHWqq/XR3
	f3mEggxck2ONiwwHUzAr4IwqNmRVZPEMrTgcX2zBnpQCzia/26FF5Y/0
X-Gm-Gg: AZuq6aL3swhiZeDpVsg+rRgDD3VrDgh2DrMdPtXsQ2GDt+2aFLyFAe0OWHfOQ03Nz//
	tBPOkOf6FmgAFlXaqn7YMcTm6D2Pgzj+5BmGgVhI4DsYQtP17FtRxu97jiLJh1Wyv8K+KIVHNrV
	rS677CZKH+FGkorrLyX2qItb1Lyti3Yy3cRbeXTw+6vHtpIKDXveKIxS+nqd11jVlqYpDOwxJgR
	k86VsezXUapgL7rVssNxpZPgJwiaCa02zy2XSQjpZHkz/wdlMjxC96IQNX0YlUqMe5kF92OxYn3
	/5YpshEnhQtKyZ08hbbXXIj8hPEUeLvtgP6D2s1nEqJxWUOKMdqO14wqxb1sGHmTjsTQ5Lkzpe/
	IvRMk7jRDztMndatiyd5tPIbtdbDyYHxJW7R+YGKTTh0Vi93a6o/+/pJkj22pG6rpcaC75FTU9c
	bQ0+w3MyPZllHrqTQpVh7zc8kqkXJ3PpNMAyvFY//4fcsGfeGIf/eMuw==
X-Received: by 2002:a05:7022:4585:b0:11a:6424:f40f with SMTP id a92af1059eb24-1244a7771c2mr15836313c88.36.1769083617916;
        Thu, 22 Jan 2026 04:06:57 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.213.30.129])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac6c2besm32090119c88.5.2026.01.22.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:06:57 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gongqi <550230171@qq.com>
Subject: [PATCH 4/4] ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 20:06:52 +0800
Message-ID: <20260122120652.3471910-1-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: gongqi <550230171@qq.com>

The headset microphone on the MECHREVO Wujie 15X Pro requires the CXT_FIXUP_HEADSET_MIC quirk to function properly. Add the PCI SSID (0x1d05:0x3012) to the quirk table.
---
 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c697..2384e64eada36 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1123,6 +1123,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
+	SND_PCI_QUIRK(0x1d05, 0x3012, "MECHREVO Wujie 15X Pro", CXT_FIXUP_HEADSET_MIC),
 	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
 	HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
 	{}
-- 
2.43.0

