Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4549E157
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 13:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996684; cv=none; b=F6y3adwJStg7pzcKPxZBEReMajIZ5c+QEtlL109TnOu5OJlh9vREGZNqrXiUSAGV+xSIiObWolaGxzZ8HHfqTbR/ZHq8uEiWaHZKQvvk6Jrv+7gAeAKYLrOdnxOFOTzGP08boGOmvs0ldgtp8ZN5Ssrq/4zge2CPO2BGFsHt9TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996684; c=relaxed/simple;
	bh=z+KT0opHPPLJV8lq+y8SaNTENcvQ79qUmfubd7VVy1I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m8qRJOXIm3EICWY1rW6AZOY71Dpcame4mQfWcFVzK1Eg1QkZpz+5mQYmuOFTKLheGadGYsTZkCMwScQv7pcDzDepTX9LXYWcCC0swLq7pv3+o8Y1XE05jbQtGYQhSZENQATiD1Xwu8tFMkfIidALWJoNXLI3xP7UkI/zuIuqX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNrWdONH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNrWdONH"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747eb79f6so18657205ad.0
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 06:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996683; x=1790601483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf9WmBVrLvYjugpl1B0vrvXG7saGw5Sc77C5149Rj4M=;
        b=bNrWdONHkoJ5zjneiBqGk32cJQjar8oyJS8sOFudwcFtE8/dAv5TR8vHqmspmIyjXW
         8wCxkWsRxCK2LWTzAWjmQQgJ7GJo6637nfXmpBLqDHL33chqI+L9Eb56IqVkjaFeaxla
         Zi5WTWH90XCagyibchQkIh43v/cUQ8/GrMFRiCe/U4c/3G383feNLw5gv2TeZXKTuOl4
         gMYFtIhT2CHFFNvfJ4Pm9oQEUAxpsbyv2indvs4tim3kUKUakEDVsK6BSu5juuwHLsY1
         xvsWfm2oJqo2TtfeYjMDJRXjyqN2txfdCuto9oClTu5br+I1j3f4vfQCWlrqAH9lqJty
         XJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996683; x=1790601483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf9WmBVrLvYjugpl1B0vrvXG7saGw5Sc77C5149Rj4M=;
        b=Gf6Wx3ZKx6qkdHKeUvi9nmaO378YnSwEzTsCKWjqTMrjn0ZWMgpOEBp8ZC0kTjLbYm
         moy74pyWjTyh7DFV7dCcZLFuGnOIhT678tRPJc0dMRNgexO+ePkDqPniCah56Vm8Y0f4
         G29tzDzjJ+Y+/NDZZHxVfGgVEM4qmUKsoY5NvLF+aE+V4xpmsCSJ1fyL7iJIEeIF9ym8
         fAErBGHE55H2FTODrFyFeyMT7pirK0FlLX2szHIGvtm8ISvZO7WPt8fWSDEnPPZBIXNK
         77fgjJT7gciTvBsUCCKMKjqT6Ac9sNPhby4xCebVUHBublvWU+kUE1P64YCdKppLoZjO
         i+NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzecx5/vemnrO/hvZu0NM/3fiYGIOucLWh7SWaPrFe5XsqCwQgjIh+IFoRT0lwndsg3gHxxCsGJeAMOcw==@vger.kernel.org
X-Gm-Message-State: AFuF++nbVeJo6vHaD4PSR3oZuNAO2vstRARNvi4U+FD1qoRjB/00fGhq
	ot4VjcmsoAgrAPzUInzfQXX497fr3plydmElLniMxUSuacxfEr8OU3MN
X-Gm-Gg: AYBFou0VA/er1z0nugfb/KAF1Ujw3/aORg3+0V53j1zj4KFfW7Jyy+3/F1393QB7zv5
	BEe9UusJFyTM39thoDx3kYzpZ/tBFfPSIHu2/L5GDXXCz4zaMo7e2nl7zNapBt7BiF8pNcPuMe9
	fNfDfuzi3wg4t9zOsiY07uj142y3j/Tir7sXLHTU7PCEJjg3AH7YPgU0fnlJRWii1zSAKL3mS9c
	r5g0cLygbGwmQ2wGWm5oYUOoO+EO6Ml7cD8PoQ06W4L3ymfFM3u8Hf45zcUzvq9HYTQB6Mr7A8I
	JRX4Mg/zOrutdcVop6t5vp+f6NoWCUVwf7u8IfPMxaGrC/jnyMftPL1KUt8m5zHqx+e5+7a9hRQ
	ggLaZbVT0H47ztilFCuufRqajstQdd8TVXLFSHBoKMh+lmiKBl0ZSRO96+y6PkU5RTVeS+rfhVP
	nPFTxv279pqyVkugJpBopLb1s1MZeAc/Xy9+jL8oJ0WMUB54kmp40p4LFmsdwpb0h/IYW3jkBWl
	GeecNtmZ1Ks5HRktta0vRkrnQjV/ttkE8jpySGvVErkXX6V2reMy1gWa4GU5lOFF6JN568agktY
	M5AlIo4VxlNMyUcoVeJHQmsbUkvMYD6k
X-Received: by 2002:a17:902:e946:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2ddc0ffe9a0mr89973305ad.60.1789996682772;
        Mon, 21 Sep 2026 06:18:02 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:ad3f:661a:5996:8705:7fb0:88b3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm20251352eec.14.2026.09.21.06.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:18:02 -0700 (PDT)
From: Krish Gulati <krishgulati7@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	Eric Naim <dnaim@cachyos.org>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Kailang Yang <kailang@realtek.com>,
	=?UTF-8?q?Habil=20Eren=20T=C3=BCrker?= <habilerenturker@hotmail.com>,
	Bob Song <songxiebing@kylinos.cn>,
	erph.briones27@gmail.com,
	Krish Gulati <krishgulati7@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Victus 15-fb2xxx
Date: Mon, 21 Sep 2026 18:47:03 +0530
Message-ID: <20260921131728.8999-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 15-fb2xxx (PCI SSID 103c:8c2f) with the ALC245 codec
does not turn on the mute LED when audio is muted.
Add a quirk entry to enable it.

Reported-by: erph.briones27@gmail.com
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221946
Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..617e2500505b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7603,6 +7603,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8c2f, "HP Victus 15-fb2xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.55.0

