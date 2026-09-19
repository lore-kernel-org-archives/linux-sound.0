Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755C547CC6C
	for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789816277; cv=pass; b=fBKfHL0uzGjwL1Zn1NBzThBu9DV/peYAlIdMeERKO7v6bEQvu73iXd3BrwuHhLu8FCD39GD5jmCxnyOtitbvkZx7uX7pSQHuy9UAODqK4MqCH0rDSEE51h8Xao6ebFWjWNeQTGS3ss/Rb6PV8IuFcwf0++hp3x1oTEOIAYZf0W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789816277; c=relaxed/simple;
	bh=eK1TfUmvxlVXqkLqvxCUeZVLq/JKLq1Wq/MKsns2ly4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=H3SpA9SWXb1N5Rvt6Hw5m53qtMEVN3ppinTHei5uQiAmNUtDkHtcxrIJg9pGV3XbBacfCx7QJVMZGQx5Npd2vC6XK3F5jqMC1jb+kDXXnkFyyg95hfw41lizrngEERxfWJCWGNLf3ncL6cf0VYFzC2t8MRnP1uM0JRGrxDpeeDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWVoFUwe; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWVoFUwe"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-804ef461aedso893625a34.0
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 04:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789816275; cv=none;
        d=google.com; s=arc-20260327;
        b=C1ceK1+6YGofOCY+gxwB5fBdpGB2G2bapneKkiulkQwjyU5J3cJrJutmzAG0L+QW80
         REMaU2CN0kiYjUZLcTXpNyqPuQJ7ezr9/B4Z6jfscx3wyyfO0AZGsgmzm1RTr+TAf3zq
         sZTfoW2iYfF9HAPJidrQyo9OC1NmiJkhLFDFJkSIr3jCINU4/BxG5U/XXmQ3cFDrkB81
         levhP5RIzZB9YEZrWVddNVPuNV/6pyEjxa5bBWX4/wJLFC+vfZXNUaTRmHsF175pXQ/x
         CUDe1q+QIWJqfHTe07KN407ceg4U7kHKMcuKeFrXCt5m3b3sukjFlUlRsO6wSy6PLYtZ
         sJSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/0a254eNYRlmjPRwXPfx4Tm78tMv6Zy/pvdda9eS/78=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=GFmr8NOscKOPZJMAcqn5GVVxYntUABSBfzeSsOCtHFfMttOlKlcYduBvtwrr6uDsfq
         AivabUCJciMlDgYHyQu5J2PvgN2M4OV5hVzV5O78tFqbg5Moy/mULySHDCbLSQ7lxE+F
         eWeLCQKGbqFgyX3Ta9M/gzV0XnOgGdXWR4y39C9FW8JFs//qDdmmlqXjUk4ZfGWwIZel
         AiBw1uGoDJ5bW3/ikk7AlRaIyiXBizbL8pAAYJmdH97prtSaJJCAc22ynYtG9eMCV/Gf
         iRA9pMcE3GdpUO8t88nj+gkTnUF4ATAHpnxe5d2IR093oG8RV+bHadq9Eb+s89vjSwdD
         TBHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789816275; x=1790421075; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/0a254eNYRlmjPRwXPfx4Tm78tMv6Zy/pvdda9eS/78=;
        b=iWVoFUweJxZ85DBTWoTDuBbIUNIwWMsnp5RJCS2czNkN5p4MQ0Nz1FufO1xWCIrCDy
         fTG+pJkPf874CRtqPQvGSLtc7kquhI1pRVQDkbrLimI2X7OUL+Wky6HEH69O7dXnUOvM
         Iqw185SO66g2YaWczCAQScEU+57Dbn66+O0QeV5nVBr8rmfKJj6v9u413TQv1jIoRiAP
         74+cOCQSRJ5mz318y6UllAOPi4+k+oo6WPv1GPOzNvnGxnQO4Xz0b01z+7thDF6gpuhb
         iNO4sEZtqfL04mR61wdsC9P4Kfg2Cw37TjgxmuhqBI1gE0WWK95Kz69NcrK0H3pAMWUS
         qIRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789816275; x=1790421075;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/0a254eNYRlmjPRwXPfx4Tm78tMv6Zy/pvdda9eS/78=;
        b=HZ1fuCwcPYx32QP+s3loYRaTp+H16Ggsqi4MQw1iRbaT0+47gowHone3P1zTOQZl3f
         lTZ/El4CBE4OYwMRrf8HzOq5DAmQ8E6B9Tyy4xihqfveYPL1v097h7rrC6UZPPAD/nV3
         /1AVq/EIPeHckMyZmChVsjvh8FHw+R/zjQ+WQ9xoEGLchzU4c30JY3jSnpGlog2wJxvZ
         ZH7D1pRF5azm6UhymYMcilHft4kXh76JLt5I6EQ3me2Xfhue894SMKcDpjJriTwUum/G
         +Cn3P2LS4JgLybu62cG4lJMMnmKA53HRYFCU0NLY1V10pOyy4vcokrq5gtTRojmi7Cgp
         G71A==
X-Gm-Message-State: AFuF++nWpJmYHg6B/HvYEHLvzcD0mhZVLn9VxSVTcsUe+KNJYlpix+0H
	PUsZd+4dhQEDT7jhtP8HabL6XeEXIyY5A+uaZNFMWyr5OgQfVAZdqlXwwbz/gRZvMPuV+SfkSbx
	5OQoE+WfwNXcZVvw+RHGD1N3CM4qWp19473f1Bg8=
X-Gm-Gg: AYBFou146Y6u+JuVeW57dJZtzoBErw2ku2M+3xOrJ9/hIIC5/rzTsnLbyzR/T9bD5QQ
	vQ1TS9gFPKkEvB8iKQsE8QGntslcRoHPZa0QSLme7lNQsoq3srYBZrk568Onhoe6L+qTw7zFoJ7
	3fpQsaTzqQt5NfPj+nG9wI1hyWUacfwjs0cU1f6sfeU3qTms8BoA2M8G8Ri2FNbhC8+Ob4s00rT
	vxg6pZGxyNWZKVPvslT1BPjNgoyoilensWWG+Y4OEBzyIFBaxCbRCknSigQ+n5+cBs2Z+wHttQO
	iFS88LSxDV/RFi4WTK9AlFLos9q2b33UxM/FP+Z+bNOMGz3sTKaMFI4/kGL47hxGBSOAqNc0alm
	X4RTEBGv0dEp9Iq6Jv4P+vLoKzttmRjFwrGuaf9xmtizjoBk3tcjHsiDaAhqiOYn+s41QKSbgOg
	DCY+t9qqmFdSNcmo2nfm2YPn+0Coljn4w=
X-Received: by 2002:a05:6830:2992:b0:806:1e7:4167 with SMTP id
 46e09a7af769-80de095b2d6mr5837651a34.13.1789816275089; Sat, 19 Sep 2026
 04:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Brom <bartosz.brom06@gmail.com>
Date: Sat, 19 Sep 2026 13:10:36 +0200
X-Gm-Features: AcwNN1UCl2tTV-iTXL5tMkeS7Tw2hGaDX8MmDhRNkRt-NW49DHKzlmlneR2Re9o
Message-ID: <CAN3WbsSDHesSjQgtq=k9a0OXNMQjKw9EnWE32Zi8+vU9sdtCDA@mail.gmail.com>
Subject: [PATCH] hda/realtek: Add mute LED quirk for HP Pavilion 15-eh3174nw
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Bartosz Brom <bartosz.brom06@gmail.com>
---
diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index 5127a111c..2956e666e 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7581,6 +7581,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
        SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN",
ALC287_FIXUP_CS35L41_I2C_2),
        SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt",
ALC236_FIXUP_HP_15_FD0XXX),
        SND_PCI_QUIRK(0x103c, 0x8bbe, "HP Victus 16-r0xxx (MB 8BBE)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+       SND_PCI_QUIRK(0x103c, 0x8bc7, "HP Pavilion 15-eh3174nw",
ALC287_FIXUP_HP_GPIO_LED),
        SND_PCI_QUIRK(0x103c, 0x8bc8, "HP Victus 15-fa1xxx",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
        SND_PCI_QUIRK(0x103c, 0x8bcd, "HP Omen 16-xd0xxx",
ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
        SND_PCI_QUIRK(0x103c, 0x8bd4, "HP Victus 16-s0xxx (MB 8BD4)",
ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
