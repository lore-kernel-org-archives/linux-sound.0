Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8D71A5BA4
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 06:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660245; cv=none; b=fXuZAYVVyfRvnKbvU+y1EFnLu9tRM/Ewtsk9ibB7Cqru5kUrm91uJPuFpfssKB9qWTXoqDxoUFzBRI/xpZPOHY8tKY5zwJT54+RKMguAZ44v0GEskIewlrephBpG/WH1o4U/xwqPps7qLaMRKSkUlMBYMyj21IrPhu7lantinvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660245; c=relaxed/simple;
	bh=wL9QlNfmqKvYdKXFuwTltASqCbw0DTBRa21yy/QzTW0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WQ6+cciXT74ZGH9NePlrrVStWWrlVbegSW7TQPP4Dfe/agEFpSr2x5joIzHYhsft7VegtpG7cTLTiEZy5q532SjmphcoO6OClYbQsupcLb2V5DE+Gs2ikE77mDh3OqQSCOT3LJz9dP8n7MNe7/bcHHka1Ms3dO1ADo84s7CAXUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=oQYvFbDb; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="oQYvFbDb"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F28E13F529
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 06:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1750660231;
	bh=vl643mA4T4uS099zf+eRPYilXKKuq+VZWfu4y9zT6vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=oQYvFbDbN11VYBuysMUAtJSFP/IXeZ4pSgbOi8te+1k8gtNr5ncQFke7kzuduRJ4F
	 YDu2PS0//N6184wLF97bzpJVafX/4DDu8VxWLxF9DoL86P1QUwoLl6Hj2BZrYtvYwY
	 f/rvg0vMHlvJZMJ17pmQ55JewGFHlnONBNaiZhW0rDhNssKlTnRNbqmvPhtON3Hq9c
	 gub1HbR2mNkN0ybhLETkyRCVpEyznrQXz9aSJwsczhkrALaMofipJfywNzB7gkfb9S
	 DeoOPZDeY4XZbETYtSZMVaN9uLroa8bhQ8MQuwtjr2aPi07bZXaadcS3WvJ6ctJI3I
	 Gtd0QKe6jMeiA==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so5584074a91.2
        for <linux-sound@vger.kernel.org>; Sun, 22 Jun 2025 23:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750660230; x=1751265030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl643mA4T4uS099zf+eRPYilXKKuq+VZWfu4y9zT6vs=;
        b=fzlj8yoijD+nkMX7M/++/UmY40XcJwkrWIUzvZnQCY983c6tshC8fU+g7C4OEb8pu8
         uU8MPeHxSzBxKysSMAbXOE9dx1+iahqWO9/ieafc4qwDO9bKXdmflzzC9RVspNetUAN0
         o4wEzm6nZE9XOieOD8ABBL7r+qgS1P2gXCqAOp4Lml3noyqLu7xDaLLHKI9Nxp5fXtCH
         Fb1zVWQt//YWMXsyer1q1+oxOh2kARqTKpm1vfPcCeECCKj9gsBFoi/YE1hSnkRqRTLN
         AkDrwtd/4+8C3FobUlH0zohgOM8gNyL4BIxtjeoO7OvGnGa+MilKLlUupD90SyASQ8Yo
         dR+A==
X-Gm-Message-State: AOJu0YzsM8UYKjYlcBJzUSc0EfqP2zjcXC6pyefzEydD/3xIdF+fv3hH
	D9MiVCCIYFkj0rbX4K1VJMDbmHkrLcYqZXBJl4+dmPkflhmUu1n3oV0Jn3qu49ww/4yX1TI30JD
	1pmqdidqYxR+HwIesg5LrgIW88PyfNi/mb62kuJS4TOH8i9xePyDvLRc5IDjAVBUlpY3xta4+H1
	8syqVG
X-Gm-Gg: ASbGncvZQLZJpkwU69A/ScJRiw9T5+r/vgjhbFsxdNny3PBwDAx6aHmOAqHvy875Zev
	0IuSNBXn7h47GNKxgxiZq52nU7Z2lP6/MSNy35zyVfYmzmv/x1qqeFFkMxWxV1BnIeeXgqwr2Mm
	8GNotUk6WyOL1WvduRmr2QXIQrQVOLlCOvSUOr2rFRLLPa8/ApGURFTTHsgoRiFDPrWCmvidDKl
	lVG1a0QtsfFPTf+GkO/zc5Wz7QyzzX5XWgi9klkcE1EUONX4NrTvO9717AJbIeuNYUWlSYwRc83
	38KG+zRCdWz72bbW8z+HHWQvxDUqqmHeVFqVEOKh7X3Zhr0RpbjBFO706w==
X-Received: by 2002:a17:90b:3f8c:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-3159d8df995mr15047855a91.30.1750660230554;
        Sun, 22 Jun 2025 23:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6WRmD3qhtaax+BPxwX+0NgQR8RYphmZjK/RnLysnchWXhF8kKwE8e2woEaFPwjDMBGMXOHg==
X-Received: by 2002:a17:90b:3f8c:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-3159d8df995mr15047828a91.30.1750660230166;
        Sun, 22 Jun 2025 23:30:30 -0700 (PDT)
Received: from u-XPS-9320.. (61-216-9-67.hinet-ip.hinet.net. [61.216.9.67])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e048346sm7907600a91.26.2025.06.22.23.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:30:29 -0700 (PDT)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	kailang@realtek.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] ALSA: hda/realtek: fix mute/micmute LEDs for HP EliteBook 6 G1a
Date: Mon, 23 Jun 2025 14:30:23 +0800
Message-Id: <20250623063023.374920-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP EliteBook 6 G1a laptops use ALC236 codec and need the fixup
ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF to make the mic/micmute LEDs
work.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7aa2c461709e..d62bac7d10c7 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10923,7 +10923,9 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8def, "HP EliteBook 660 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df0, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8df1, "HP EliteBook 630 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfb, "HP EliteBook 6 G1a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfc, "HP EliteBook 645 G12", ALC236_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x8dfd, "HP EliteBook 6 G1a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8dfe, "HP EliteBook 665 G12", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e11, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e12, "HP Trekker", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

