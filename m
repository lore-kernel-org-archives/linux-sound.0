Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F2F3CF1E5
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 21:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582820; cv=none; b=YmRtoqJ40q1xWg36IhNd+2dkMMbEV8lnWc5rTZTKSPWiSZU5Ws/8PGGXm4dMVzmpJLRH76XgIywgYPi+Xz82OiwhfE1AFlcIZ3SuWs41QOoq6Qqa3jjwJmM7K4y2ex1bRBXGXNrQRTN9Hq6QkMCxe/viVFzscOory0DQyKEKjD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582820; c=relaxed/simple;
	bh=ztKly8O3PZB8aAkpQFUTpMl7aJlRj2pCEVMdyfpePfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IU/HfBRpSW+T8/iZeNh7ZTk1a03XXL4myjJkvoTK1S7pUYjg428moNz1tIramjbHOAiBLfyz2iZPXdqO6DLb6s9FuEohePM/lr/m44IrYG4tj1Z4SRyDZX0b8Wg4ooekobIM3emGN4kJGitWqFnmgzy6mLBERbB5cWHkZ4+dZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7ahVv3n; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7ahVv3n"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-487049569b6so146176f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582817; x=1792187617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ljd0ZUR6ThdiIUyn6+JdIS/RYq8gLbsRca66lkivvkI=;
        b=Y7ahVv3nFrndQ516tSo4TU9bNd8h2g1inEP3if6X1az4N6ovCDObRpgwRjaN+ricJY
         T/vyENGJA3ebCG4w3u09FQPCcy/Zf0Did4bgE+vANNURPrd3flZqyoK73KcMX2YFLRig
         zIK4kpJOurw/ss3FMLGXVKUA395rDQ7rXJeaN3NH3XRhatqYN3pNBKADRiWw1OSK8p03
         moHZPeyjlcuVOGxWgr9bTvnSnhQqBeeNIUBIE2uwW4QjcJLMxO2G65kHrcOn4h8M2rVs
         OYWWc0j9twMRiIItL5X8x7rTC/+BPgTTy5xrIvJYKD4a0jFtRXScD6CM4HjNMDstt+x8
         omog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582817; x=1792187617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ljd0ZUR6ThdiIUyn6+JdIS/RYq8gLbsRca66lkivvkI=;
        b=qf8tr8juqiGzlICgz1tpfRcQ7yAjhTdxmoP9MvlU/lvlV+ZHgKYGTbwwqh2kYbixee
         mkVoC4M5ind8ELqOX8UNdYwCX0EtK33cNTm3lA74Bq5mbYurcgjPfIpv+XxeXCsvs85C
         X3ah5tBTi4KYeROKSNPX+BmXRnyKfXzWj/GGfZGroYGD+bh9lzBSGq7LAoC+5zOaP/Rs
         Qtyp5mVN4wPPi6GJslk8MWa8p/ppgVWOh+g1r5s4Hq12oPbeWXbDwnOiaBKhCpDKtlHv
         84vwKjqtSbVDYwVB9r1e2l2dvxKgct5X0cc/OENHYXZzX9MHMnpJpH2KRwhUlmnzf/+Z
         HG/Q==
X-Gm-Message-State: AFq9FYLTEw2PaAyhspCdieErwjo/SxaAOZiYoJqzP6RiDtfKBwPm4UgM
	1vd/IX1rvUYlvvxTcGXTBRR6iKwmIpJJv5SVFA6CLtLNTaIZpCvHxPWb
X-Gm-Gg: AYBFou0D12CAIpWZltALMs0m56dafabGyOVNDI6TO16RfHcji2DEBGq0OQRaHi461ky
	pOvB+YlwOwQteEwsW/q30/1OYqjKrOisiSKfP9hxhszS2A2UDxqR3uM+ArVSKc1QObR0jNZ12lO
	TbngwJe4kzotXq2ICpLabMy8VkgkbXdGYip05gKM3aRn/erDgTp6BTk9bpYhT8ybVKrBt4+aQmQ
	oACK/gnJFVbRLxkuTbsaW9fXQq6VEnDiK1V3qdXqyGFzolHKmy8s1m4dQY36aWTw8Wb/cY8N2tP
	7pM+suMFoAvuuxPMhZoyG3yG11vWG3UN7xoVFo9V0zK7xeWUaG8GwU8bcarD+1hOHZQzDCxBAA2
	+9ZpSXIA+WoRdzO2GxaMeTSh+t5tU0tUzGcYZ7jWqLT1OKCozTr3cszOzEdlJb3dNUxrkHa3CXN
	Mn5ujn4eRd+2nfXIckBfc7F3hOAJC50c5RDrZ9rWqKqvWvm6PciV9Y22r3vmK3CSHmlVraeXVu0
	9BLD3pOPPmPQpyzK5oBIZM74AQcwfNUOE0C5ZLMs0BrHICxt7aSvw==
X-Received: by 2002:a05:600c:821a:b0:4a1:7ba9:da34 with SMTP id 5b1f17b1804b1-4a18e3ee7afmr60802705e9.0.1791582816772;
        Fri, 09 Oct 2026 14:53:36 -0700 (PDT)
Received: from localhost.localdomain (pd9556620.dip0.t-ipconnect.de. [217.85.102.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm60793895e9.15.2026.10.09.14.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:53:36 -0700 (PDT)
From: D_de_Vliegh <taoyi.sh.cn@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	D_de_Vliegh <taoyi.sh.cn@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Enable native DSD for MOONDROP DAWN PRO2
Date: Fri,  9 Oct 2026 23:53:22 +0200
Message-ID: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MOONDROP DAWN PRO2 (USB ID 35d8:011d) exposes a UAC2 RAW_DATA
playback altsetting, but ALSA reports it as SPECIAL without the
DSD_RAW quirk, preventing native DSD playback.

Add the device to the raw DSD quirk table. With the quirk enabled,
ALSA exposes DSD_U32_BE and MPD 0.24.4 outputs stereo DSD256 through
USB altsetting 4 at 352800 frames/s, instead of converting to PCM.

Tested using snd-usb-audio quirk_flags=35d8:011d:DSD_RAW on
Linux 7.2.6+deb13-amd64 (Debian 13).

Assisted-by: LLM
Signed-off-by: D_de_Vliegh <taoyi.sh.cn@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3afc495..3652765 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2554,6 +2554,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x35d8, 0x011d, /* MOONDROP DAWN PRO2 */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x36f9, 0xc009, /* XIBERIA K03S */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x3c20, 0x3d21, /* AB13X USB Audio */
-- 
2.47.3

