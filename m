Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BDC2AD1B
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 17:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703850; cv=none; b=V6jaj1eZAbuPo6irtD/ftTPIjpSeAWOelNdHOC3cEe2sDHCsOHbuD27rZLtWGU2RDzh3wJcOLgt0n/cL+Lelczt7YrzIn0gyKNLrPSZNcFlKwdPPT/Jr7E4RFQR2smy5mCGznt/zvcK9hdOPzP3NbJD4VTbkS+LVY8yP5Vqkcrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703850; c=relaxed/simple;
	bh=3z7e6qj+2edb0Ixj5DdIvKU2zKFi1/9UHGgRDq5FOOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bOytf4lzq3YdBxD4bU1Z3NKKoMxQumkXW3alDygTSz1QidrjmxWqnZIw23p6hLtr8qE0rJlwEXd4OyljMYG2EaqJfet1GV2vLIXRjEhojLaieEHFbND6Oph7s2GftGwdff3v0ErSYmLpx0APlOnM/89HRZubcRjpOTsPYd+2lQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiJrsSnu; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiJrsSnu"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81be5042c51so2755816a34.1
        for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 10:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703848; x=1791308648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U7978I4qYst3zPc9UkdvONYgdnIvc5cuqPbfNVor16Y=;
        b=JiJrsSnuFOcmj1r4DLThv3ptWagau24NbYO3+71WcJSSD8K+mBih1m0qBRPv+oM5Su
         z03g2kNYA5FN52P6LV90ysfSWyUqTSypkAH44e9ZIn9QRezWC85MCW1JmJThvBg3OGKc
         m0kW1nWj99S4pmcqS7ClAbvmph0dHV0mFvmB/qSdepoFJ3aJYSC5fcn+B9otiVoK+mWh
         zuVo1C8zdkJQmNCl9qNuF3xo3Ijm/BXzKKNzsPHhwVXMZ6+42Yq/glwpfHyuzJegzMKh
         C6nq8NuLMP6Ws7R2+cWlM8LWpxhWfi8t7VzveSiz0a0SvZaUMr3A8X99Z7seHuTdPyTl
         88pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703848; x=1791308648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7978I4qYst3zPc9UkdvONYgdnIvc5cuqPbfNVor16Y=;
        b=bTa4UGSTaeSZBI7uiUQIreImUMBi1dXPhSMnf/O2sDlzwY/LFGhgKhdAGfEFPC0CE2
         Vm+9FaJUrDhOxKhj2M1Bwi3KKtNN3OZBOujJBNTnebZc+AWAvNkkMV2RDyxlWZ3veUDq
         nUYbG41oYboAtT7pH916SHz2JRNQ/yPFI1WqGVblN2qxflrJG8Ja5xYuHtgBONFKHQ4i
         RAmk9nvNQULRVOhJXVeJAdcyZ7ppLDopPuYxnqOkExz7DyHwDtOq5UYrbzrmM/iPqzCR
         ZAE8duU+rWyNzIXQU7dF/00BDEqMwW6wP2AUXFerHOkA9UQsyYoNEcLbCSizy3OkF9VZ
         9euA==
X-Gm-Message-State: AFuF++l1j3zwbgM352SRJMkAlsYui+uJgSpPqxFTUXjYFcvEOurymazO
	5n1e42L5eqIFHkvNfrWAZB+OrsrN/JBAgps37n/5GQopfB1gKzJg8dSP80wFuRCv
X-Gm-Gg: AYBFou1BIcN0eN339ERnGfLJ+YQIJabiIpOh49Y4kT5IC+X3PLpO+fUMQuRaVxUCs8K
	Fxw76pR86g/ajsa/rT2CY4sFMdJx7xVOyaBqJ+uYOwZgC8CHqlQHhSezUqteTzxvb/C03wnaH/8
	Lgk31eSHAJCjFCA3YMqimrsM8hTNdw8iK+WXr9R+3KOBTrEWslzYwv7NMadKi9cuuMrhqgUlw2Q
	F50i801p0jesVjbWEoQhQ7kWv6pe7fB0PxEOHBlMSbR3vgwH16vFQaTz5wjQ6kNNwzqmpXMyGhg
	2KT9qfzHRViEWQvhHqDZclYMt1eLpebGvx0sc1TZcU1C31WjA4zFJzfxsQ3+wSLAHdAMKtS+6RI
	CUKmhWXZWpJE7W+C3OFWbHvzG83n14o4Q3WHFhJbxNRHjuCIhUlE+vkJlFYng9Xcqomcvp99vjH
	o1ERk/bVtV1DPqc6DIDmo/a8GB76gqn+z/yFs4nHbvzCNfULE0dy6q9hJId595cgSrtGJVtZxMY
	jj+24JIFHJyhUQZS5u+qy61TCvOAekYk5gIQUXLCVSGDOFLc2zd26vOKDPfcs3ANMDp8l07+JIA
	7/vslpVUwg==
X-Received: by 2002:a05:6808:c1f9:b0:4e8:5dac:e5e with SMTP id 5614622812f47-4f072f7a0a0mr253451b6e.14.1790703847865;
        Tue, 29 Sep 2026 10:44:07 -0700 (PDT)
Received: from omarchy.dcsdk12.org (c-71-237-52-26.hsd1.co.comcast.net. [71.237.52.26])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ebbc7b9453sm5354931b6e.13.2026.09.29.10.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:44:07 -0700 (PDT)
From: Harrison Lucas <tiiowsalt@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Harrison Lucas <tiiowsalt@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute and micmute LEDs on HP ENVY x360 15-ey0xxx
Date: Tue, 29 Sep 2026 11:43:48 -0600
Message-ID: <20260929174348.167537-1-tiiowsalt@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP ENVY x360 2-in-1 Laptop 15-ey0xxx (SSID 103c:8a31, ALC245 with
CS35L41 I2C amps) currently only gets ALC287_FIXUP_CS35L41_I2C_2, so the
mute and micmute LEDs on the keyboard never light up.

On this machine the mute LED is driven by COEF 0x0b bits 2-3 and the
micmute LED by GPIO 0x04 (active low), which is exactly what
ALC245_FIXUP_HP_X360_MUTE_LEDS sets up. Switch the quirk to
ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS, which keeps the CS35L41 setup
and chains to that LED fixup.

Verified by driving the COEF and GPIO values by hand with hda-verb,
following Master Playback Switch and Mic ACP LED Capture Switch.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Harrison Lucas <tiiowsalt@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 67b9f4172..6648dd318 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7703,7 +7703,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a2d, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a2e, "HP Envy 16", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8a31, "HP ENVY x360 2-in-1 Laptop 15-ey0xxx", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop 14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a36, "HP Pavilion Plus 14-eh0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
-- 
2.55.0

