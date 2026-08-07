Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4382F1FDF
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 15:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786115250; cv=none; b=LJbffWm0bSwi2vld25W+wBTOYdX/2sAwdea9taGr5Lt7UbQUX8Ioy4qPDahNAc45Ap/tMQzsq/PLgzHGh/bmYBH5/cYz9XgXp+/XoRAG6JqIcX82QJIDulVNdN8v4kgGyCRED6+QMz37oj1haCSWtur6EaFzCcm2D78CSD+y5c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786115250; c=relaxed/simple;
	bh=phvZqL0wsncyf/QmVzcKsgYtQPKuILS3IooycrEXr9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jvjIp0AjEDGPgicPcU5WUIeXosIv9xULYitEPORCKuWR0EyJW8BenXw700h4vP+C2SovsL//Xzsjrq9mkW7Y92eeEVi24nJ3r+nDHufz7e0rLREP3poT1mc2ATWS/6b22FdWOPmVxTpVgQyv7TMYb+PojbVrdUOoc63DUKI57wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackmon.dev; spf=pass smtp.mailfrom=blackmon.dev; dkim=pass (2048-bit key) header.d=blackmon-dev.20251104.gappssmtp.com header.i=@blackmon-dev.20251104.gappssmtp.com header.b=xmPE24e3; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackmon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blackmon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackmon-dev.20251104.gappssmtp.com header.i=@blackmon-dev.20251104.gappssmtp.com header.b="xmPE24e3"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6682259cb3dso4097440d50.1
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackmon-dev.20251104.gappssmtp.com; s=20251104; t=1786115247; x=1786720047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/u4AYAa0acGwTcrF1Ap+xHGcaNPjJMpNAZ7RrYgIP8=;
        b=xmPE24e3Mve4OU1vrHGon2Hnt+MJyWNG7U7mDMZXeVjnNgGYynviObsFyETOE1wjKo
         agMEmCaYwiYyM7Yxf+7x6VJf6QLJpZkD4vYdAy8sFMabWKGwkuD9QeVlFvEB+0As+f9z
         f26L9JswHpu9BOUkvo9Vf1/6PTCUcVAq+ybvw81sYnC+h4l3+wt2mavvqLZZrWXV4YUW
         6FZEbNG/EVDfXcQYyxtNvNjHliLBgCSTGrLA383R8xCJNaEggWOSHU14DxZIKR0JTjwM
         cVpzY/zdgsKIXUtlwdUBcOV6myv7tpfn9G+WGNeeft8Ci5vOA1R0iO8zV0yZ2+YaWZUE
         rnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786115247; x=1786720047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/u4AYAa0acGwTcrF1Ap+xHGcaNPjJMpNAZ7RrYgIP8=;
        b=SxI3MGwKgznWMJBr4rzZb5dB28IM3e6ycNrnOyTdv8O4RGRTbzFjdZjglAHmK/l222
         I3Yq+Sn/3r7u7u2DHyvdiqMb+NgOSD6HArQ4s5ur8NLJ73XqL/A/PGbeWZuOxrr6SRqg
         wX1WKdo+GVosa7t/uhz1+AHUQa1sPQq9ZJ0fB8DlvheYCxox9oOqIkKQU4pxJ+Ul7pe3
         GfFhnzvYhGjDVkv4Y6C+R8PfU94Q+QNvOH4dC2Wqwv4xzIEqjsTPa5JoOI4wrQ40ALIL
         XxPqSeTW3+aVdTCQ4rLCh9jMQ6dydMYOrX5bfMVS6JlchQ7PQHHe3LDRqBCQ2FvQAxuD
         NXuA==
X-Gm-Message-State: AOJu0Yw19wxHYuotIfbBNDR33YTJ4x2micwMUT29W0oiCS3FgMVNuqvi
	Q0zK3Mp19P7LMLt691FcS9q4/JS111lKg29VHbcfyWKrd04kJbeYYYmbIhPaVfXPcYRTOIJ5NrV
	1ASaQd+07rA==
X-Gm-Gg: AR+sD133CZJiJFNzGfOqcOTmobjK3UQWsPo9gBchabV+6BLTXiiTkIsC79Vok7Xpwum
	NUSfltr2SN8iiYKvUaUINeNg9OjtJVpejd9s063IDJkNjkhJhHbcOKHyndGhHN9oG4zsJ2g5PmH
	YOZk9mGSdvMeP63SZgC6buRmif0IhzxugcOcDkoQLpvsVILmV1FvO3yAfxNmEni7qqNohGDpMjI
	UQ5Q4QyKODlyELsC/R49U+o9pTm/WVoM4UWE23BFJ42e/72g+PKirjdjxJ2a4ntJ+2cPbJA8Fxg
	AcUGc7SOWsDVWMzVfrnOvr0NwU15JkO3KSM7L1lXiwuV2p8YLodkjFsgfEJx9L0ARI0HQv5CwjX
	d2WeVVI2SFKfMbR2ItkblYT2Gdd8M7K3Wigkgl3LZ/alm590IBwougctspaSTPccVytAa+b1rGo
	KNZxPknV64WesJNVJCqqq3FOwlHpt6tCpVE5AqwFNlWHripAzanB7YnXqM/3U8nc+4ZWiah70w1
	ngGC8NJZkIPtBEErxMxiq5emke/4mZnSYSNHQzu
X-Received: by 2002:a53:b6ca:0:b0:667:82d6:eb47 with SMTP id 956f58d0204a3-66ab293aec7mr6384479d50.17.1786115247114;
        Fri, 07 Aug 2026 08:07:27 -0700 (PDT)
Received: from Wheatly (108-250-131-168.lightspeed.irvnca.sbcglobal.net. [108.250.131.168])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66acae63149sm1363465d50.11.2026.08.07.08.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 08:07:26 -0700 (PDT)
From: Garrett Blackmon <garrett@blackmon.dev>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	Garrett Blackmon <garrett@blackmon.dev>
Subject: [PATCH] ALSA: hda/realtek: Fix speakers on ASUS ROG Zephyrus G14 GA403UM
Date: Fri,  7 Aug 2026 10:07:08 -0500
Message-ID: <20260807150708.33785-1-garrett@blackmon.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GA403UM (SSID 1043:1044) uses the same ALC285 codec + dual CS35L56
I2C amplifier topology as the GA403U and GA403W variants, which already
have quirk entries (1043:1b13, 1043:1024). Without the quirk, the
woofers sit on a separate DAC from the tweeters, so the hardware volume
control only scales part of the speaker system and the headset
microphone pins are not configured.

Apply the existing ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC fixup to the
GA403UM as well.

Signed-off-by: Garrett Blackmon <garrett@blackmon.dev>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ae5722955..6ae5c8c1f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7611,6 +7611,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
+	SND_PCI_QUIRK(0x1043, 0x1044, "ASUS GA403UM", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1054, "ASUS G614FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x106f, "ASUS VivoBook X515UA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
-- 
2.55.0

