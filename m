Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C795238C19
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 18:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760640264; cv=none; b=CKycBl60vigJkaC+nJpnddihCWmDNU9OvLGrYW7DSTQWTdEP4HKlVUPZ6aMbpDdCn6oWBdk3dp+7/e8sriQXIGwHesNij5Yvk8QqDg2dvvK5izL3VV0obxWGi5h4kFPoxjylO5yc5VEaK/MPyitUIgf0+7+GxIIGDUkc76Fz55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760640264; c=relaxed/simple;
	bh=5fnAIS+mDObetzcVt6F6UmWnOreqYso1cDICdcXUb7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rIUmYcEuXs7XlUcmD7eZnxhqXSRvvmhTqUHowp4vYZeJRZ3zLRz+d4KckEjPW1/Dzfl3rp3NPCzdWkoVofUBD37aLOP28iDNoowrGX90xZnUd7BtNqfd8o00dNAr5/Jz2CV5/42TpWaxEKgvBq5k9wSNSE4GbjqvqXr6VMnV6zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ciQ9M7ST; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ciQ9M7ST"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-87c217f4aaaso3338276d6.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760640262; x=1761245062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ALOU5npXoRj79VyCnAvRnuffj/3q5aKZ7j8QUuSL/ZY=;
        b=ciQ9M7ST0sXIz6wwR+OLAShKEOUeDXene4WuGeIfEQOczGir4YJOL0EZOcckxdPgTs
         XW/SPdgC9pkZlCP8ni2R9m0xJ9wjvY3hSsfcIPJA9gZKF5w5zLRcWWeyIY7dxoXv1Bj/
         eFn+vznrM+X2h9Voq/RrCH8kybbS0rcU5ujF/gBLRPt5PSOz6nFlGZ/hHPCE/D/5vGhe
         U9eshOtJj9rFmjnfTmBtqO0eqdEnHdJK9+PNfaC1ip8keHbZiVnaUAe7hSd5OzhZviUa
         9FJm4SyMiS/vppgqjS3u8acErAx4JFsW2gn2xZP9TuZ0GF5/x5UqZgAzPr49v4fF73Oe
         mJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760640262; x=1761245062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALOU5npXoRj79VyCnAvRnuffj/3q5aKZ7j8QUuSL/ZY=;
        b=eBTTe4uAmMb0HiKpkuHK4pmbxqsLZBpp4Q5Ll8VGgQ9tfaApIRVkpU880Tp+6dBcfG
         tPJmzbUfij6J/UWhub5eUwH7IU3Q78vGAhqO/gwiYgwiup+rOeoOrI4mHqP2mTrBkeVu
         vOjLEBQfqdR0wUUffwnRSwDdjuov7T+HZa7lM/mPgmdgdI5te7mARTevsPuPSRj1Ytum
         05X2xexu+KzuzqUXqdtSW05rr9gqVDPZujnV6oLSjiOZbhYjKrCMHytGRxY9lgNoPIGL
         8UnN9c6uXTgX8oL1+AdmQhT72QmL7XgjrSuBw0mfkQHhxk4rvieaWV9EoEnSvwf0fCiw
         Heig==
X-Gm-Message-State: AOJu0YyQpIYzYvQCK+2FGwx7Xd4y1/3LvMyN9VKUCIZyTPO7AevPCcW2
	uEsPtxnf26LT/wj+vPdGtnMtKks6OsXEbfZ9U7cuPbzC2dYZTOZiZmNcWwZVmoOS
X-Gm-Gg: ASbGncuk9G98RDQFtKqIoXiQU2G7uxvMc2cHJF/Gz8+Vb9IvsrS8JHND6PVwHEEQex5
	4MssVwzk+P6Z/qNBNwISAVfaMar4ORUKEoBYDV7XdnERGoPxT5mYP5NIXsojeKVdnR0jv1j79Ei
	8gGwU6Hd2bKUO6p08gpPPj9OTtkRutXeZsGtZ0DjQjabmLt57Db7AJa5DRMKBv8siwMZiPbGQXR
	aUaY33tOqCmojQ0XVqNJRvggUTsbfQpJxnaY0ZqBfVap3W0b6ZyFLBlB4siJle7bqeSA/i4WFhN
	MldpQSAVt5JFfo9z4xW/dWqwFhE1u9JQqO+a7a4CuViNUVCIxcMtGlutiyKUfJhwNqn7CxLdaoJ
	mrckVynKLT3oO2hFQiEvf68Ky+7yD/SLYK7jWhUzsxB/joo5UOH2oCiNo+CXDJucKef6PsjPj02
	P/aK7S8IZ+RnTqHjl8qV/B/jwoMF9oIHjnNORzT5rR6ngd7ax9tEDsNOB8Rwvuj/B9LACWHJq4I
	X+tT6wviwHvUb2XbnKZKWhEdzOuDR4=
X-Google-Smtp-Source: AGHT+IFIutVOWWN1b37YzLuMegHaOXBCwKaKa9BIXNKoaj49FVrgXQeHC1WEagJGvpVl8fvLsTdEzQ==
X-Received: by 2002:a05:6214:4e83:b0:87c:2213:ee81 with SMTP id 6a1803df08f44-87c2213f473mr6880566d6.33.1760640261866;
        Thu, 16 Oct 2025 11:44:21 -0700 (PDT)
Received: from pancake.home (sydnns0127w-142-134-197-223.pppoe-dynamic.high-speed.ns.bellaliant.net. [142.134.197.223])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b1667sm45249026d6.60.2025.10.16.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 11:44:21 -0700 (PDT)
From: Dawn Gardner <dawn.auroali@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Dawn Gardner <dawn.auroali@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute led for HP Omen 17-cb0xxx
Date: Thu, 16 Oct 2025 15:42:06 -0300
Message-ID: <20251016184218.31508-3-dawn.auroali@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This laptop uses the ALC285 codec, fixed by enabling
the ALC285_FIXUP_HP_MUTE_LED quirk

Signed-off-by: Dawn Gardner <dawn.auroali@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 6b9e5c091..8ad5febd8 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6397,6 +6397,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
+	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x861f, "HP Elite Dragonfly G1", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.51.0

