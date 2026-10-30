Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336223;
	b=AX3OnOq2IuxvSxGU7w6GQCeep2s5SwFC9kuF48lAXSbRSpG+OLdyCyDGw66QOsVRAWJt
	 QhVQhbDpQOW8I8Xb3XU5qq+PwJGe4ajF9O6ipB00Hdoc1EpZ+2wx2X7yFPkKz0fk3UyaE
	 1HQKSIL+R5FAtV5v9UO+wHrsRsUpuw3INBgrlnYvwfs9DJ2hH8iG88Hpw1bPWJK89Q6fY
	 16uzeJKS3VqtOtHvgFlX8YwMCaB7fNoly+9NY6JFnXim1Zn+zqfHLHggytKbxskcGrR8w
	 721xJ8QRi1PWxr6g/6SYneccwK4gw6vPbjG3HU1lwI/6xKfUevwhPJGUEo8aAB/ZO5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WauGYljzgKnkDbfgsq+TqBtz3mTXIMflL8/jV2GYK38=;
	b=KBOQRtiOv9qUh27+Lqx/GuuKa3D+8I5k+BOHFskW6HFDTD/broRk9uD49apz04ZiulLB
	 UpXMyu4KvN0nwI0w87XxVYiqdTdOvPaM7Gj0KQuBJpeRfc/zRAFZdKATwl/kSm0RwNdnp
	 1ZtoGuiweoRCf517sfYxxzkmnfvcG2fjLiG1yUX16dVWMHWFYe+sVGpY3xujrsYRB3x0W
	 YPMEPOnvBTgbiTlAfs6IMHj1hEWqZQx1ihgqBJRIW+ZfzfZe5e8sSK3O3TADweIqKAm/k
	 WzYchwOn4Z5FAqbD4tkWcOOWJQl6P0rC2H2fgoyJcvZb/KHUXcGNndK1j9ZnsmbEKyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rtnK0eLq;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FFA606A31A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 04:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FFA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rtnK0eLq
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so7664635e9.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 21:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793336221; x=1793941021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WauGYljzgKnkDbfgsq+TqBtz3mTXIMflL8/jV2GYK38=;
        b=rtnK0eLqQBZ6iE5ubPlRK7qFsX0fEdPLRNcKXT6yCKGRIaRqsFIYF+UA4UutebBA8A
         0pC6JpW275fFdM/XVFN6yK6K+Y8jYCHmtKRk5vnS1vd/uKD/ip+FXcj7ndGUvZaJs3CI
         agY3Xja6Hd3vz6a+DY3hu9+F9pggrsMhS/wJnQWfRhh5PhJeOdqg/+ne2lQtNSql7Vvf
         brMUEZy2h2gn1oti6kOYSzWcuWQiwZUuvbQshK7xrWTu1y7E4Clrf3zv7oJib0q8h+aM
         5JdRHVeJ+ALrw/sxZJgFwA8+uIWDra/B3JZ0qyuBGOfE8x1K3CsuMk01Sqva7RQIFvOp
         9ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793336221; x=1793941021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WauGYljzgKnkDbfgsq+TqBtz3mTXIMflL8/jV2GYK38=;
        b=Q65llQXKfgRGv+vK8Wjo4HPVTt5nos7YA3X2x4bXN5rYGlKK98fI8rKD1Ur2hc+zDW
         qVWR6WgQzl6LL1MswOvgY4G8jjDp62DYEQ3GQKsAS3z79L1oKsfgOminNFN2rxWkB7zn
         9xoc0u64FTDd/HlhxxyLh5Cb+oMraSYtOMf+hMsMgNKaIjgAND/LFOroa7645Vr/FOzi
         Ra+CUB5ACRoJFtebCA4ScrhEVfW5Y4xUIYhL8HXcfq9qiZOSZQIktceVZkSGK2UnLMBd
         djKvc76E2mvW/URIEgtrhwHpbin1DEg8vNyvKD0U05fxXOIIln4LOmnTgAM75PC4d2bW
         +joQ==
X-Gm-Message-State: AFq9FYIJiwwe/4OCuuPQu8mqZu+wJKfk61gCDKBZqnBtvZVoykBtE5kG
	F8h0zU7icGR2wCif8ADJejblEJcVw9s2W7YxQo8rSBuJ4g+DEjrQJ1Yd
X-Gm-Gg: AYBFou3TLtQysw9l0g2TU7FyIEaNjkp10vTrGRoUOXSSH1uTE/eSdHU7PxPpJ2jf24s
	NxbgRfVrxr35QDpYzKqfOlXYakfvita0g/BiZ+VD/aH4hC4DLofRc5BAw+T9z7iHSLqXny/iEFt
	w7Arud2I09KtCVaomwbGzSjG4TZaLYlsnlEqpEZUhOZwgE1or9WctmxqTleNwHRLvXcVcYY+o8W
	6f+/gpPGH5viOOT8/68grDghjPyfhkCNdbzniFpbxgugUmF0Yzwccjo+if1dXA7Ms8sXdGTyWrZ
	NE6xHULqFnro9M/gj7+Z94Mt3tHH6L87ckR+/sHMoj2ZLAy9z09PXJQ3NIuNHE2d8uCGbtEgOKd
	Q/XYAqu+zLJ/Jd913OiGCMJAeuNsZI+x3NBUtxHxQy0yUq8qYN+cFBdxjeRpMwBQvgLaf70t8ku
	aDP/FA+SSYjTnVsYSoX4C/Y7TsVErxRhch8ZeOCp/zHPNElcvKBx0KIJ3vmS/dYSKrtmhZmz8T9
	1o14G/+WWEtvZBQx5cjuuKpgjVATTsj/UOq7HXEn1PbpQUYzC9mPN/IdUDOG/DtuNtFL2ZfYvlb
	BMa4Z8M2JEniRqtwh0VrrvY4bsc/n4F4k2zSCbaBDT2l4Snc9q8IOeD6cUipZdBAoZswfe9g
X-Received: by 2002:a05:600c:19d3:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ac1209eafcmr22580955e9.0.1793336221237;
        Thu, 29 Oct 2026 21:57:01 -0700 (PDT)
Received: from ahmad-HP-ZBook-17-G3 ([5.212.7.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abea72254csm19118045e9.1.2026.10.29.21.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:57:00 -0700 (PDT)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ahmad baghereslami <ahmad.b1995@gmail.com>
Subject: [PATCH v2] ALSA: hda/conexant: Add mute LED quirk for HP ZBook 17 G3
Date: Fri, 30 Oct 2026 08:26:26 +0330
Message-ID: <20261030045626.1608040-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029174446.1412118-1-ahmad.b1995@gmail.com>
References: <20261029174446.1412118-1-ahmad.b1995@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ZBook 17 G3 (PCI SSID 103c:80d6, codec CX20724 with SSID
103c:80f8) has its speaker-mute LED on codec GPIO0 and its mic-mute LED
on GPIO1, both active high, like the HP ZBook 15u G3 that already uses
CXT_FIXUP_MUTE_LED_GPIO. HP's Windows driver agrees: chdrt.inf sets
EnableGPIO0MuteSignal for this model, and MicTray's MasterMute section
for SUBSYS_103C80D6/103C80F8 sets PlaybackGPIO = 0 and CaptureGPIO = 1.

Use CXT_FIXUP_MUTE_LED_GPIO for it.

Tested on an HP ZBook 17 G3 with Ubuntu's 7.0.0 kernel: with each GPIO
held high and low, GPIO0 switches only the speaker-mute LED and GPIO1
only the mic-mute LED; GPIO2-6 switch neither. With this quirk applied,
hda::mute and hda::micmute follow the speaker and mic mute, and sound
and the microphone keep working.

Finding the LEDs (the GPIO tests and reading HP's driver) and writing
this patch were done with the help of an AI coding assistant (Claude);
I checked the LEDs on the machine.

Signed-off-by: ahmad baghereslami <ahmad.b1995@gmail.com>
---

Notes:
    v2: v1 said the mic-mute LED is not on the codec and added a mute-only
    fixup. That was wrong: my v1 test blinked each GPIO too fast to see.
    Holding each GPIO high and low shows GPIO1 is the mic-mute LED, as HP's
    MicTray configuration for this model says, so v2 just uses the existing
    CXT_FIXUP_MUTE_LED_GPIO. v1:
    https://lore.kernel.org/all/20261029174446.1412118-1-ahmad.b1995@gmail.com/

 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index a141c94ee..88651a36d 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1193,6 +1193,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x1025, 0x1937, "Acer Aspire Go 16", CXT_FIXUP_ACER_ASPIRE_GO_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8079, "HP EliteBook 840 G3", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x807C, "HP EliteBook 820 G3", CXT_FIXUP_HP_DOCK),
+	SND_PCI_QUIRK(0x103c, 0x80d6, "HP ZBook 17 G3", CXT_FIXUP_MUTE_LED_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x80FD, "HP ProBook 640 G2", CXT_FIXUP_HP_DOCK),
 	SND_PCI_QUIRK(0x103c, 0x8115, "HP Z1 Gen3", CXT_FIXUP_HP_GATE_MIC),
 	SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
-- 
2.53.0

