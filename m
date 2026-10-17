Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B081925BC
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 05:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792213617; cv=none; b=kaywtFF65+8d1iQT1fI82kwOFYGYdtw9PMKv0IFAs9pR8GHMicVLYsRNZlhjvnBxMWQsbHjwxLiU4bhvZDBi0EFcmq9koEBNfjXM1AQPtS/VpJlLwgaKciGogahBjAd5tLEYCdvSCzCGcFQYJv/qSAdB8lRhpKEICUiyDbVCv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792213617; c=relaxed/simple;
	bh=UxEGsDp+X8XVGsojDB6p8Pq7U4zHWN6nO0KwXXBjwTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LM0LY3FokVmavUnw1bJWpEcUT+/MUUI99GoJE2H6SX4PnkGSQH3hW9DmtP/6TNUrRieZpgxAGX2DofFVPGx1jCqA/Ye0bat+4/thpg4CP5tHvkdmBgWAxbyaCUnDx7wsrkq4WLatg94AUSg/9kPneieKUgymTjRseVBiyO2eEIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rG7bTMiV; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rG7bTMiV"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-825487fb37bso316059a34.3
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 22:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792213614; x=1792818414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2QPqiCPtv6mBsOEA+xwRq+Gvryl1g6t6b+sIBHTwo/w=;
        b=rG7bTMiV27I2A4OpBqK+mMADpNRgZ2ml1KduiGZcmIBFOTVPuazF39SXvRcF/x6Ps5
         hlDyUYtC2fAPNuE4rC8ZAFpAqzqj6dZ8C/2e6uFAeMGATLxumEmOJjQ9iuc53pJ93k7K
         Jt1mUXYOO8g7uPi05mVdU0gfl0xBZUAHMgFW/lvnLLTEXaKRFlI1TEzpw0pV3fnsU0mG
         OQICOph2JBVGJRyxCfB7bXq1CA8tnd9H1doaZmMgCHQPnAKNAihfsNvIl1VIyKxoUg1A
         eHwemBZzRLVPKCFW/lStKADIdYiBNUrFWnplKWBfWSu0f3sR97pUUhk4DnO8aTr9UGhI
         baPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792213614; x=1792818414;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2QPqiCPtv6mBsOEA+xwRq+Gvryl1g6t6b+sIBHTwo/w=;
        b=jVXKJumhE5bEe/NKNkHKHhPseVGwop/zgmOBLtqCbcWHK6tjXVIov+q9L6A/SSCS52
         xuQ1+ULjGKdDXEIW3ujAcpkO/iDCo1it9N8wuWjrUW2StOC2mNJTWwHlkN0iMesG2swQ
         pMNiFnjkkIMy4+bFSW2G+ZtTzDsqYtor8516pfWgaDNXFy9HsmExIaLm/+nhFic6R205
         Hi39owSkCosXRdQwJdlI0uvhgKQeR2tqP92EH2quPtl1GCp4TSk0hy6V0SFbL12XQnQV
         2Rys7SSKTceLPQmu2h9WxnTSA27cqnS49gSri0/93R1sC7j33TF13snYtlNv0uuecmRA
         /wFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA12UjIb0XIdkvCoh3f+C3EcrToV4lTHlJuu7P+OfFG/1lEyF3pksv+6UDP9/Eqbtaa9yU8QcyJSUgfQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJdyfv3iWCPonhRhl0myRQdVOBMU4+Vws3b4TRpclAgG9uPkluO
	D0Yl1La8cv4XDvokF2Uwyq65dXnCwfmqE9dscs2xkBt4kHj7q4Gim/FdzGntlQ==
X-Gm-Gg: AYBFou2XhQTWiP639CMRMv1g8ZJF75lksQuSxwiq6otKgLQHlm0GhyFn9aOyeuaq9J+
	W+gQf3bEDYlH4TkyHFVYKJdNS6Hb6ti3M/BmvRbxMRZwY75ck+4rO125gYrsYhsRANJEDTvr8Tb
	tLt355+I8Y78QUqBBp74eF0AgCo2YBSpkHzBJ8a44sC2ZpP1Ji1kpzfEm0RaDQaP7tkJsVrkQ5G
	vNC0EbK7aE8JOk6zwP5/VWq0r0Rd/ZzNHgCSGm6qeJnO0N+H8iUrxlrZ/G7TxgxwZPVwBOsP2YY
	SPk8m75T+Dp5wTy4plQA6bOI1pPqxT/W3ih0V4GkSxZohcPqVd2YLzk7bKQ243CWRZt6LnTQytK
	0cmKK28TWpECFSbpTT46JvVGGRoLpP6f7djokCJwHwMdSwrYOFi6j6pjLaKJ7S2kA2/P7EHnTMo
	v8MfmtP3znHNIHr/5i5ZkEZdwoqBPsR0xZ38eKKZPqWzgAL9GQo9I0dyTv24J7lB4NIwwc+cdtH
	u0smcZ1A3yRcBGkBk6wqpmbkgs8WA==
X-Received: by 2002:a05:6830:2e05:b0:80c:d34f:5f65 with SMTP id 46e09a7af769-84501a1395fmr1739782a34.30.1792213614098;
        Fri, 16 Oct 2026 22:06:54 -0700 (PDT)
Received: from fedora (fixed-189-203-106-166.totalplay.net. [189.203.106.166])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a0f31614sm3504872a34.3.2026.10.16.22.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:06:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Miguel=20Castellanos=20Valladolid?= <josstamy@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Miguel=20Castellanos=20Valladolid?= <josstamy@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Enable mute LEDs on HP OmniBook X Flip 14-fm0xxx
Date: Fri, 16 Oct 2026 23:06:15 -0600
Message-ID: <20261017050615.14481-1-josstamy@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The HP OmniBook X Flip Laptop 14-fm0xxx (subsystem ID 0x103c8d9f, ALC245
with two CS35L41 amplifiers over I2C) is currently handled by
ALC287_FIXUP_CS35L41_I2C_2. That binds the amplifiers but does not set up
the mute LEDs, so neither the speaker mute key LED nor the microphone mute
key LED lights up under Linux. With that fixup the codec GPIOs stay
disabled (IO[0..2] enable=0).

Switch the entry to ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS, which chains
cs35l41_fixup_i2c_two with ALC245_FIXUP_HP_X360_MUTE_LEDS. This keeps the
amplifier setup and adds the speaker mute LED through the ALC245 COEF
register and the mic mute LED through codec GPIO2. It is the same fixup
already used for the 17 Turbine OmniBook 7 DIS (0x103c8d9c).

Tested on the affected laptop with v7.2.11 using the equivalent
ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX fixup, which has the identical
cs35l41_fixup_i2c_two + ALC245_FIXUP_HP_X360_MUTE_LEDS chain: hda::mute
and hda::micmute LED class devices appear and both key LEDs light up
when muting.

Cc: stable@vger.kernel.org
Signed-off-by: José Miguel Castellanos Valladolid <josstamy@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 36d3bc23a..c33a38598 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7957,7 +7957,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8d9c, "HP 17 Turbine OmniBook 7 DIS", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8d9d, "HP 17 Turbine OmniBook X UMA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8d9e, "HP 17 Turbine OmniBook X DIS", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8d9f, "HP 14 Cadet (x360)", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8d9f, "HP 14 Cadet (x360)", ALC287_FIXUP_CS35L41_I2C_2_HP_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8da0, "HP 16 Clipper OmniBook 7(X360)", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da1, "HP 16 Clipper OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8da7, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.56.0

