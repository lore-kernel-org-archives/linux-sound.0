Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2902EC083
	for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817589; cv=pass; b=GCAvW8cm5xiL/6Kf25b7zCVEA7VI0/c8Q1pblHDr4QrBwyAwmbZi59omf//1AieV7kgk5qDYy1p+xEdc7SrOR6HQSKKxBDwcQKWxny55zO1RVqAnL4g0JmNB1uJhtBApPKU9BBsheQOJdhPNQTvQ71DQpxEZIZ04DGiHTMCHhVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817589; c=relaxed/simple;
	bh=sMYd/G2O5aFpZUUz2+9x2/OBCEzxbrVIwrVFRQ47Afg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bos4Dsi88zkt7O1X//HFX5C1qCHbddDSawdSCR9KYi8BDqYZrvGHkrKd/qcrK1Ixm2FMnWqZwFT4jtnPg3gBYsMlkLH86B7gHd7P8RVHWQONFxA1HnQ7YZ+vzHuajEMZi1inB+WsMYUGAkfUL21XsOwlrBhwEBeAkxS9vbujpRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o+5NcF1K; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o+5NcF1K"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c54eed93e4so713633b6e.3
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 04:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789817587; cv=none;
        d=google.com; s=arc-20260327;
        b=T/zRh4uOEB1hnV3EhuZaJ2T7C4pN31ZatzfM1qJTkeLkuWK/bVsyqym0r+l0yFwLxJ
         USGvLnW/L9MrkJfjNH/w0vROapOBSO6lF0VOEo1Lnkm2HDQa8QPjdJDtuYcu7kd8Eqlm
         MUuD/EAtiTx+pZB1ovbzBp/ZcXtsPDobGOVDu29q1huZ/rb7jfLsQzqyHU26Vtawo2ub
         KgTn0QgzgiPr+KRi7ZaHNQvk1EY8qEtInGjtLlFfb637vwg/ECt4V13HOCtKVxOvPyrM
         xNkZWZhcwxZ/vDVYYUGmHG32D4nr3QQ7xKwMJQJhWwfV31FHZsnn2Z7eCopxzJPvSuWS
         whmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=1mG7+xpTedkRnlzabW6qdM2HSsjBGr1uP0pHk0XFWBA=;
        fh=ZfVdhQVAmTp6zTWI61f5Lukfnsy3yWen0ZQYibXbpY4=;
        b=BUFdPt5UhpzqS+4LcXbVXwShg5WpSSFzjmb3+C1RR4EyxvNLxyFitCnr0q8eyF7gs9
         BJYpoggkceUAlb0h5vaKNy3zyvlxxrQXmtWDqDrxY74w82bV5nUMzedT2qytnR47OYKX
         5oWJlrEqKO5Su0gBH27vMQagpNuNlXSCNwm+AWyPNprqEfCm97QDZsLWBANmJIkoVx3C
         UXnRtHxKvAtivgPby+2C2GeSyb1YGl9vm7zDDoPwCbsXQLojGEinWUTA3/q7Rsh3FIli
         9VC9UXcf8qpGfTlch6HE5twEAKXifqPOev9Ii5ps7BXMPQI9KTjfHJ8IS1JleJJVs60s
         5HLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817587; x=1790422387; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1mG7+xpTedkRnlzabW6qdM2HSsjBGr1uP0pHk0XFWBA=;
        b=o+5NcF1KDgcbL8mjOtY8tlnJLK8PthDVVwqDdxqUhrztNvowpyZu6RhW41puhx92N3
         osIQzoUUWpSJE4RCCfSwmiCMwYxneaF0D7HKn5cymTFp1LXZg1dJrybi7mdxDbQgEl2C
         QT0N7mpQb8ag4PG80ET0u7ID3RhNEuMAYDrubz76BSy5AGisCQ0+pu+dQndd+ntla3xm
         Gwh9HN6zUF73E1jctKH19JVMpBlLpgQX0c7uVGvusTe067wjc6KLK276VBiLn8n46m3/
         Ga8pIxHX/f2KC/3rtw8JjRxu9GM+bgLIHDmWZfCBa/6Tk/Aw4ihKn024DhcTikp6a9R/
         t80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817587; x=1790422387;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1mG7+xpTedkRnlzabW6qdM2HSsjBGr1uP0pHk0XFWBA=;
        b=YA1HmhIUK7MgdEFW2yuLurmxied77ZsaQSDdBD2vNAJow+BMsFB7I2pb5vxrY+lkK7
         h7hlOCkh6DWj+LQ3zws0XjgA9+pQpOj8KdTOjRxZH9PoQ4cWZSTAUEykxq+gQyqVfBvQ
         likfqJ6jeTUoZuYbfToR8jEe3QE2rSF5WYyZintLNWQvoiCOktRDyqi7cnRRjksKis4M
         4cMmEei+AgmUFXyI/2E/aIre2hZ+yv3vULDY2YnWG07HcPfUtb9Vvq0Inbtk1Ok+yETh
         6+ZCXnjeZ2HCATXPeBNvj7hd2KE0JswiBB7DAyWEqvAbiD6PYM67y+ks1v33Vea3Yze5
         8qhg==
X-Gm-Message-State: AFuF++mzfBfCKh5j2tCLI5hxudUSAejtGkCQJKyXrx1H4Xb4QjXuJl6D
	DMwPBJxxJV7oNXSQ1BdmAtK6YNzvTiT1aTqkrHtkjh1McEldb+g/UpKRd4h6DxSblPqv0GR37wA
	PHjpmTlGselfG8SFBdCuApLYT4KFEqgc=
X-Gm-Gg: AYBFou2gDArufcDJ9lz0zzKyUrLJQsS+r3yMTcShnEcjnJuEyIYmPZHM3P0SQ8GmwsF
	eEx5HD5xFfgrMNLfjxMYunA8ADhrMVCdXNqJMpBXkSoGUtuLBXqinl9+5eUT27xv2cVBUe+TdNr
	KJZrM52VjaY3v7SOnqJx0Bgqapie/o4F6vxqaMoEGyfzB+JB8OVuL/fFn9V50ELaCw48exu9/HU
	CUVYa4oKiV6M70losf6LMMcjHPtJARvuU5vQKNNn75VAfGCqj/DwCptwR1fwEBcTaYEhSpO2iD9
	kAAWg+9Wy5jmADy75KnJwC47i77NRr/bDk/UkPZqo59o+fbydvWe5y675YWKSMHWlsp5tqdGDWx
	NWDGqLTrh4ELUuGalyskIBU8q+3GYBPo+DSHLiS9GoY3MSVWJtvFW+BCF8KvPKP2CydIXvfGi1Z
	v7ZTiS3Yfg+UIGXm+gdkyvQwT/jBWkJ/4=
X-Received: by 2002:a05:6808:1393:b0:48f:c907:7a40 with SMTP id
 5614622812f47-4ccf5df1125mr5367481b6e.11.1789817586988; Sat, 19 Sep 2026
 04:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Brom <bartosz.brom06@gmail.com>
Date: Sat, 19 Sep 2026 13:32:28 +0200
X-Gm-Features: AcwNN1VPYDXQ81j4BgL6OwAYPwWgg07mS2mzO8MDKUrktd2IJuXmg2lF-0OXIP0
Message-ID: <CAN3WbsTf=MYcGC7mCYtAvtgcwXpUQDSG6VRpmVZ-s-erCaP19A@mail.gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 15-eh3174nw
To: tiwai@suse.de, perex@perex.cz
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The HP Pavilion 15-eh3174nw with an ALC287 codec requires the
ALC287_FIXUP_HP_GPIO_LED fixup for its mute LED to work correctly.

Add subsystem ID 0x103c:0x8bc7 to the quirk table to apply the
existing fixup.

Tested on an HP Pavilion 15-eh3174nw; the mute LED now follows the
speaker mute state.

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
