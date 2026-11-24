Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513779;
	b=1S8RI2FqLYibqzS0Z/nydnvKGUHPYfkcviNVLTwWHG8oVaAiqqt2bslI7sCNSrSuqfak
	 USC54u8chVj88oRp0PyeIa1+HZ/wUDVOhthukrClkyn4eQddl1iJGs3Wq3VijRG+4wHZn
	 gMR1CKcrJaMMo3qR95cLPq3+tTRMFMa++blh+ipf2dEPF7Xt49e9npSOX35ocPHlUJ04v
	 ihm4zwzFfTcF+jJLHm3W4zXVPgVNJV7mjQrzZOK4tCZ08i/qJcGc6F6BM1n7tz1egfYV1
	 sIxxY4E6XqtvpL3WKmPhMf2x/P18uuytXoJgxtUpfUcEFwn1Ipmz6lRKRb6wojB9TtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TT8H5ryOvUhdFypeiNuPqXgDcd96Y6reYbFnQpA78k0=;
	b=BtGjW8T4X6FzJNk5KbYi/JlZIm6t3910PeEoiF/4lxbkWSW+mUXN6yFqRD6WTWmMA5aV
	 NKoodQY9U9zupz18OMnUiEw1o7dZAwtcfJSDKjFwJ4OGeQjkiJceP9OXCJbcvWP1+Z6+t
	 EWnw10xJjsLBUpy4W7wL60+3UakWGQCd7zM6cxnmEUOb9Q19tPHSNGJO+IRErpfC6+dTo
	 V06OSYSj+HJTBo9mg3X1SD3i92e0hE32uU64sQeEP+MsyqHGKPo/OdWPVniOKRiZxrm9Y
	 RVkmhdBZw0iiC4bAM/WWjfvqXK4CviJ9WnlmKRtyZX0ENbtKdccRTZxUuyC0xuc6sag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRLlZDgs;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3338D606DAA3
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 09:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3338D606DAA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRLlZDgs
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9ae391a05so28632575ad.1
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 01:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513776; x=1796118576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TT8H5ryOvUhdFypeiNuPqXgDcd96Y6reYbFnQpA78k0=;
        b=ZRLlZDgs07tsNvmDdgLu3XImEb5OuVwegka5KC1Oulrmi/78MOFhvQztSustFmZUG3
         24KKW7aEP9ZSsC/QdHnAK/BStZ1hrOvEHX+XEMPWM5DLQ+pTrxItBNqc4wtZwrQ1JlOA
         nVZMMxmlmINbk5eAU/tveOn+wB6f/VENMhWGOrB5kjc+AP165AIPUjAxcOnLQtyCeTNW
         CYejcJJIR3bb1Ev3/ABbNAMVmbhcsvHMSS0qb+zFYnapoKN5bDTU+PfJkYtIl1uSh6lO
         aMpbKSWxb/ngYXY4dpEzXPFlzg4koqjuIuvX5NfTeV4A5DuNnFIjs4ta3VyMuP5MYlSN
         u/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513776; x=1796118576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TT8H5ryOvUhdFypeiNuPqXgDcd96Y6reYbFnQpA78k0=;
        b=eWfd0gLl5uh4saMDX1hWQfpovts9D3lYOzqCcOXcl7Hi9j5yJvX0Leg3B/mFoO4ZlW
         6wvJEpu20ic4/DbahlYUivFtAFpw1uV6FyBbywz4iLTfo6rHksZq1/Br/8DrtiOMSG5v
         xrvJOdVEjFQ8JegZ3l/IWLcIXd464g1J6UeI+Wz7galzCrkZSAvlbgtBGBG1no31bSxH
         wDJDAd0Euu/gyWjd4RRoPanwUV+Osb7eZGdJarHMfCtFYLDO8vEb4Po35jbf+ZFU13/F
         sJH1GGlvn9K+lTWq08sGJfyPxtjh+cSmbGN1Wo7awF8TdopeSNqpZTH8hVffX835bKDC
         sPjw==
X-Gm-Message-State: APuU4Z+JM3rUi2qTyK3Tr3l2ZnwpGw4wRXunV70iwxdT1NyNVpGGpP3X
	ZPRsE8rFedV/+/2Hw0n4erWXC/zQmUSHhM0KZm4/kFOLV0NbTveW/oCzbXuUHg==
X-Gm-Gg: AZFdTZfbFFhPhkDddpefkiJoseLD+PQ05MAXpeqcZvFuJOX27K/ZNBmJQ6jPPnizIGi
	4NmPRT1fMt/vsoHbeCZvqcsvrNfU1B+s8emsNoUr+AbChQadyPPRZHzUDiJFfZ2APeV5FCAjy4E
	XbdM3V9bw0vJ53dkVsOVikEokiZG+F5in9Rc45/zOKZvZXOadsNZ78N9IvykNR8VHtPVn9dLDXj
	M2LTBzDOir1XXYjAsd1/NMCXsEMhLeaDhK4+fWvW2QrgMNb7pVe50OeInbG0R5dbaQ5nxkTCS10
	xggnHmQoW3chz+jipZvrSNg38eiqQB2Yrc7uVpsg1L65aNu1EHxEh6nt4jbUxLH/sk4YQON54pj
	+i5+GV1emLLtjE1C8dkAdkKFWjZvzv7/BSSHVInWEpd+9aI+f+tz+doIBiQZDtcEGbjFFTrrX4b
	mRXFc4fxSKRxavS7TUpRDz/SNjbN7ze4PDak4Gujthy9CGFrHO311mi63zPumOTxczTXJ/CCvdv
	VfGQMzW2gWVSszBQb+0zoDGzNwuREROJ/3qLcSNVkCgadVdHFxMG32snkJGdxQ5L8AgBuM/CqhB
	hviZuvtWugVZgZcAUXlV8301D231xuee2jM=
X-Received: by 2002:a17:903:3d05:b0:2ee:81:1714 with SMTP id d9443c01a7336-2f032008b18mr104839195ad.32.1795513776471;
        Tue, 24 Nov 2026 01:49:36 -0800 (PST)
Received: from neo16.Davolink ([2406:5900:7035:910e:b075:7756:fdfb:facc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee85466sm65292465ad.4.2026.11.24.01.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:36 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Fix mic mute LED on Acer Predator PHN16-71
Date: Tue, 24 Nov 2026 18:49:23 +0900
Message-ID: <20261124094923.36856-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The mic mute LED on the Acer Predator PHN16-71 does not work and
remains off regardless of the microphone mute state.

Switch the existing quirk to ALC245_FIXUP_ACER_MICMUTE_LED, which
includes the existing headset mic fixup and also fixes the mic mute
LED.

Fixes: d54c3cc224da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN16-71")
Signed-off-by: SungHwan Jung <onenowy@gmail.com>
---

Changes in v2:
- Add the missing Fixes tag.

 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d38be4d50..0c2442d98 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7576,7 +7576,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x166c, "Acer Predator PH16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.56.1

