Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4897934CFD3
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781257645; cv=none; b=QSpaq+B2QuWUXXfG17JccOvnxeopzLuDWsXgfA4PfVu5vfS8iSG63ULY9pqP6qX7G0v6KanOozBS2GlxV9sMU25M8KBRNHi+1ENyQU4dMET4/zOjiTjCFVeLwphCqlX5FtLB1+/2pbAGB9/hcxxAJEMnKvrgLA+ePru+EgshufI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781257645; c=relaxed/simple;
	bh=omi2K5b8wrhSEk0FWYFzFrNv1ukBkz3xsk9030Xr+BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obA1vgftTuFK4JRXJuDZClB/4UP1X992U51cgNCsd959yuUy4YQoL9nu1d7PhuC+tA/JCo4u0dUlmmpaVCU1h4ISqlFUsDQxZKDf6PS5g7GoHARYeBY5TGcKp/00srb4UAy4pmY4hNLKZaubDpwrtInk/U4dvpCm08CYLyYw7nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBdn1nUB; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBdn1nUB"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36bdb11bf8bso518266a91.0
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 02:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781257643; x=1781862443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RaamyYXhYvbnH0xRAlAQx8yXSGZge6m5VM/sZ7sdOJI=;
        b=GBdn1nUBUufrLKq2TS88if2tWqp/MOtWO1N0lqPRRF80qrzguCpn9U/Y+nNnUu+Ihj
         NeO/tunaR+Q6DRGVyCYpgepHaHNjCvQIsbTCHntyLp82ZeociqDTv5SibV2EPdb9GXqW
         cpX6w4ZEA3RTvENIEC7ZZ0hY0Z7Ly0U1F8pqKJyXP267x/IjIdJ6f9hZKAErI3SKoHAY
         gPs7no6cb7A6MpXmvqHjFdPpQYkcGl9ZP0euj9eVru8BLRQjBWxHFSHdYUoDKwiJVpvk
         ECMkVszMXBuhUOHPggR8I+GrK08qtgEsMY+I+FEQFMAgqcevz9zbRQnnEDEBr4xepzxw
         RxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781257643; x=1781862443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RaamyYXhYvbnH0xRAlAQx8yXSGZge6m5VM/sZ7sdOJI=;
        b=sN8UEh9+CL6JhRpGwnRdv9BrYOWXPo19V2KqEkQ3Ds2HhVLjpSBYpjoB5Azthi03xJ
         lz2E5PgGHUgeWuSg3+nNcREHaS5Kp0o6q9sxEnewvKB8yayU3+rtnF/FupEQ92/3gXyR
         UYe/c5aqdluec8Vx8tvS2tZZ5zHYjmCfedj5/TFjN9Dgkv5wZoHsA1pHnhWV1Da0N+CK
         Zmuc3xBx03BTc7ARMbCc80lhO911gOvS0nQT33rIF7SvfZV9AYdzsvq46/j/7caBODNW
         eVmb4bc9OoZXg6iK504hcvHG5BZe9FODoRGAOLoASRVYTO8zv9LLVQU2eNFrYMHHGpgA
         oQPQ==
X-Gm-Message-State: AOJu0YxEgJXteOuOMU7tA5EYEpcOOAlbfeuklSsfBJgb/nlu96b49hnu
	MOgFoGj1cokU4ZITzYHxgntEX09KtlVOwzdphjV2KTU8UVrTdmJ1d8lkZiRb8QwY
X-Gm-Gg: Acq92OHvJaT7xUtcCylEyrbObnY2inZsXzkCcSSKd80VK/XHTxjAOFyPWSY7QN9AbOF
	j77BWv3fGFR9G1UhEUJkAZGc4/ozjVkhR+PJ1f1dcWTnbA2BfQDRXoVJGnWfBBWmKnQXjxOiIw8
	UBFqbtSeBYNLzIr39oufyGeOHYtJ8BjXy1WwfB2+Jbg7j3x2qBeqF5lZ3YqCVfhyYe5WBhCk06S
	ZeR1lS3tv+97AdB4LlTTISErpyfMPUfoiCyOlRXLHM1TiAgIYnehXrHyBXN5XyDQXUo4SKQz4Ga
	sxr0rw9sVF36HCfRZD2ZO9k2A5uUBeGDNsCGKZtiwrJLyegEKTBcFWSY5UWtTYGLTJJf8Oj8tHN
	H89qNdvZ6KtGtqhmQW69eLwI1YhhiZLVndjpHp0ZXPg4umrcw2lCJUruW9V8T10Le4gmND8n3m7
	oW44vvOeV15eIYHdMg6wuZyeRiHYB3xA7EUCUtwwrCIACdM/qDXE3SojKemQUBBxXlhntftRQbS
	kzftaNwQmP0B/icGrmwe3/pXKXCq4tlTXjUYzYJgVaJOVRsqiuPAU4t3z7fhnpg1wT7CowyorQS
	/qQXmKXEwdryfWHWroGHFM0Xf7YMDUGVPfEotBK5ls3AKEY=
X-Received: by 2002:a17:90b:5106:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-37a01845ed2mr2408108a91.3.1781257643444;
        Fri, 12 Jun 2026 02:47:23 -0700 (PDT)
Received: from rivendell.fritz.box (122-57-27-130-adsl.sparkbb.co.nz. [122.57.27.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a233f451bsm1564224a91.1.2026.06.12.02.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:47:22 -0700 (PDT)
From: Cameron Graham <cam.graham@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	Cameron Graham <cam.graham@gmail.com>
Subject: [PATCH] ALSA: hda/hdmi: Add force-connect quirk for HP EliteDesk 800 G5 Mini
Date: Fri, 12 Jun 2026 21:46:01 +1200
Message-ID: <20260612094601.1209845-1-cam.graham@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteDesk 800 G5 Mini (PCI subsystem 103c:8595) uses
Cannon Lake PCH cAVS HDA with DisplayPort audio pins 0x05 and
0x06 set to AC_JACK_PORT_NONE (N/A) in BIOS defaults, causing
hdmi_add_pin() to skip them and the DP audio device to not
appear in ALSA.

Add the board to the existing force_connect_list alongside the
similar HP EliteDesk 800 G4 entries.

Signed-off-by: Cameron Graham <cam.graham@gmail.com>
---
 sound/hda/codecs/hdmi/hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/hdmi/hdmi.c b/sound/hda/codecs/hdmi/hdmi.c
index f20d1715d..31c9544c7 100644
--- a/sound/hda/codecs/hdmi/hdmi.c
+++ b/sound/hda/codecs/hdmi/hdmi.c
@@ -1549,6 +1549,7 @@ static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x83e2, "HP EliteDesk 800 G4", 1),
 	SND_PCI_QUIRK(0x103c, 0x83ef, "HP MP9 G4 Retail System AMS", 1),
 	SND_PCI_QUIRK(0x103c, 0x845a, "HP EliteDesk 800 G4 DM 65W", 1),
+	SND_PCI_QUIRK(0x103c, 0x8595, "HP EliteDesk 800 G5 Mini", 1),
 	SND_PCI_QUIRK(0x103c, 0x83f3, "HP ProDesk 400", 1),
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
-- 
2.54.0

