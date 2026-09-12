Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1338AC8C
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196795; cv=none; b=Fuc2Wf6FcYfA23bSZptbc9q7Jt0OmJNJXQ/1mvWs0MZkRzhhCanpIZWlJkgBA2CC03WZCGrCFDKrbtbaOnC6CWNcHxAwHNt1lSCBOPBId0RQccRvDiTdxfWYK+zkUh0Dn1n5YhFHaliToRkykrJt0imiuhDQPwEGCIh9wPiD+nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196795; c=relaxed/simple;
	bh=U8JrI7RP1dXP7kc+B490B10XD+OGKPNOJ3lbTY+Usu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TybrsPlBcPgZc/XfEadxgW+VweXcst1rBqu89jVEqomU2l6c6Qw/W+9s4n0AOY22zUCXVMZG4tlWc13QyMjQauyINPIxefXtH9GUDYXlUjmXusUt3Wn4CLRaF+QrEoqBa3WLsmSGtp5dMzVE0LCmKT0zrhXDVP7Xs8q80P5cO3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFi+a6dF; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFi+a6dF"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso561695a91.3
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 00:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196791; x=1789801591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFD7e3/Ygy1RhBnoMlc3o820j50hxkBbgirpClRtSIY=;
        b=qFi+a6dFkigU5iXGK3HmRXz3lxVJ0bnG6qPZZOoNu4d0lgC9CqhMVcWLT9AVGi3jZX
         bji/yqOBYNqh+fNsHb9ruc/ZykZ6xAyfckIq1ZAwyBnBGJO3sdOjPMtkohjrBOrvaWNd
         O3+I9h8BvMXPQN6IWyDTyB3JtKULGOD3RuiNjUOSlp6d/V5phEe3iJIAo/E6F7aluGnw
         IJPDy5p72HmQ/SDAIGdoLeigqk4yw0y2X6gcx/8A8Xkfy8z0tlLQqV1u8MozEFEfPP43
         kqvvD35w7RU3lwYhjaf60ssY7pxzNjR8acJbXRZ5AA7/GmBpW1zPPqsXXpoKPCSFp64U
         8KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196791; x=1789801591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFD7e3/Ygy1RhBnoMlc3o820j50hxkBbgirpClRtSIY=;
        b=pUOxKEllcIV54VB1ojsxKDdp6OppKc41iqcWn58wJIaMcbwX3Ax9YjVvysdpM7Nrcc
         PfBaqV3X2ED54fwkekUaYS6FYwaxzO102asOyDuRpmFm2IlaIWdpwS5cNx07ojzI3yrg
         4rMX1zydRMKl3m6/H1bvlZHAMwYC+Z9ARVjE4ESOqF+ydznwKCdit2G45pNtUEmYSjEW
         L9LWob1+D0YykIKTw8p8e1HQdko/g8BhRGFR38cSQDRg7fYWjJO76BEUhA/gIqOWwrvG
         9LFgoloAlw2tXIOa+5hRHGpncoQSZeAsXTB/1cD1cNVrJIrZR+ZzRTJWq/y4NkfzC4wj
         BiYQ==
X-Forwarded-Encrypted: i=1; AKwUvByuThVD5kFKTvVjvD1KEifBEom2IfAq97aRMzdQZwmF16hAmJzKyfUGA/o2zmRzcIy0nqbejJFAQs9rgw==@vger.kernel.org
X-Gm-Message-State: AFuF++kE2yt0/dWVp1KyUCtKpMw8RBvXpi6VuPnKp0LYUepTyuyNSF3h
	FSnPeX8WLUMTiUZYXa39AQWGF38+cjg4rQ5Fa6a0N/JBvx56bHMdUn8W
X-Gm-Gg: AYBFou1xOEpIOvlFVgFjV0ElLdg6fQSRA4FYf1MYZm6r9NwdbIDxKKPBwwDX6uRQ6bD
	wwcWuwwviIDLSuwF29xK4KT9WG037uuhCEZfplfcI6f7gTv0IjRStzBQAlGuw73So+8sCfZRmcx
	N4MskBzq9dXzuTIpdBGzh2XcWUs7zGSPNCyy4jYunmqJ74CuK6DVg7pBnjhZed+jOEw9ZLtXqdU
	tpNhLKqTDo08+dkrFTcHlo0l1X19Qzt1svVZ9qspOTriWgK601oiT4PKx8+j0MmkoqzYJ1J4+gZ
	MFjNYoGC0/viEV9I6+xeBXrKs4N1F+ZKpAR+sBCPcnRxCXbsMMzKrl+SCCE1FwssgakeCxSUJQD
	55bZcp3z6GsPx7yQterEYiSF+UqWkpR9Z9aY/IVZVWhyFzrXSgRYWZdYOBDYBAAoLBh+OIoW2QN
	PsHq4OQVoULUglOnRjtjFT/GJs48RCB5yHkvWUcy3jC4QbCqJkumBywB0X6GDhxOrw8ZZsJtjXM
	4c5g8yoOV7PvUunAtD/jJnOKOX7zZ2cmhOl5w6VVd+XoX8bHYEla3BPZT8NqsLAFRq3ulvnE/d+
	TIhvdZt5FsY8SV1BsogIEqNjsmznSZr5
X-Received: by 2002:a17:90a:ec8c:b0:395:4290:46e0 with SMTP id 98e67ed59e1d1-39d9bbe4910mr14949404a91.5.1789196791252;
        Sat, 12 Sep 2026 00:06:31 -0700 (PDT)
Received: from arch.taild3b82f.ts.net ([2401:4900:c0be:f9c:5201:1178:2a59:a316])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm9250140a91.1.2026.09.12.00.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:06:30 -0700 (PDT)
From: Krish Gulati <krishgulati7@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mazen001.ahmed001@gmail.com,
	Krish Gulati <krishgulati7@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Victus 15-fa1xxx (MB 8BB1) mute LED
Date: Sat, 12 Sep 2026 12:36:13 +0530
Message-ID: <20260912070618.21272-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mute LED on this board does not respond to mute state changes
because no fixup is matched for SSID 103c:8bb1. The reporter
verified the LED can be toggled manually via COEF index 0x0B.

Reported-by: Mazen Ahmed <mazen001.ahmed001@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221982
Tested-by: Mazen Ahmed <mazen001.ahmed001@gmail.com>
Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index f7786e1b0878..d49a7d59407b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7567,6 +7567,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8b96, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8b97, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8ba9, "HP Omen 16-wd0xxx", ALC245_FIXUP_HP_MUTE_LED_V1_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8bb1, "HP Victus 15-fa1xxx (MB 8BB1)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8bb3, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb4, "HP Slim OMEN", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8bb6, "HP Laptop 15-fd0039nt", ALC236_FIXUP_HP_15_FD0XXX),
-- 
2.55.0

