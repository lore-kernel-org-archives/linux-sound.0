Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4B2135AD
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 18:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752603626; cv=none; b=tY6DspXBdBbbfCDMQIv7oXxe7lOA1SZAqxabejbQyVDRCoi9Vr37gt58MxCbJFCxr7Sz6wA8NYLoDxaTB8ebyEbjt88CtV9ZpGP6NVK7YCI7HfoGdPAE/Ttltm4GmirYwXPn6/meHJSKX7SaO/TP/IjLMQD12H7ARUC33m8vmKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752603626; c=relaxed/simple;
	bh=c/5chS5/s+E1II3XFX1htxCdDWHnjfjr4PPEND3dJ68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oL2NaKu2KTlftQqSwWXO+rcQE6mkgabWmsZIYETj/y+8jqnFj0+XxM/0we5mM1LyPHNEY15sfS7lmZ8aCwMFCO0P/NNzE+MgWsDiBcofrpEaLMB5Hm4pKEj1h1RAPIsQCicdGpa4KVIcp9ufFyKuuKpvZ//41YCjQrzyIWycxN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/aE/MwL; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/aE/MwL"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8760d31bd35so217718039f.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 11:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752603624; x=1753208424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFKherER5NT7t9zZuOER0zi8SdIEOFMj86HJ5lEg4wU=;
        b=k/aE/MwLGwNYltRSx3J5j+UwL+5oYpFaaG+64fMFlfJfekODzv8b8e62Bty7uyJbqp
         iVrOML84Gz+rrKbg3HTqRdRCR3qPwRVmGgl2HA0Xy1eSNZaExq86DDGbLzw6uzfkVzL9
         g2gThbTZK8OYE5LM8SecXckDPoQ1OywNcrfDNf+rWnwRsBNiYMeLyBBzxjhMaSAibabI
         EUn+qGKjimeus8n8h5/W7sScRktmJtsD/Vd6jYeVUVyfjuApK4ScOx3C1z1z0/cKa2jk
         OletUv04iWmAzbgZ9k8VAXctDnprRap4Dht19dsj8piGWF8QgjpEZr24YrNOfL0w/K03
         9hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752603624; x=1753208424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFKherER5NT7t9zZuOER0zi8SdIEOFMj86HJ5lEg4wU=;
        b=XJKhuirf3Nh2uKF8o9TVEmjUGBo6Dr7EQrvqhEBYjYq3nkEaRvoNhgr6xld/uESl7S
         CjLdeD6ePCbHggIj8t5rpMD6ZzcjzuDr7XWyCpQb0yEkIf6hjvcGYp3QPNaPfD3NwdH7
         owItjXnAbLLNBM6ngK1AqCtfIL2dcQkVMfZlR5nN/y6/6YmO0L8b3xaOSAbVerSQW5sW
         /AKsqY9EIyOgPcQCzPRpsOvLf4xYQOIDs0eetVS2aHDiKVn6HUTCN7TdH0P46WqwQJ7h
         CIBLv7NJIEKu0IZAwJm7Tl5mhRwfGXKeG9hwPTwdn960Gihon3Hnz57rhDEeu/oJit41
         tnhg==
X-Gm-Message-State: AOJu0YwAUbLsq/3idujsd7TzvXX33Ig8QbEt7MsymDzWskEVSUCwNsEG
	qthe+YFFinOojWDS/0cmVfK/kmbzsjjmo1YgZxK+OKoroCTbP7AxKJig
X-Gm-Gg: ASbGncslDkFgdeqJIRCFHP1y8K0hajG4VytnVLCUcJawdBxrg4lrjho7tef0FUMFkSg
	1w2bseU5SttnsC/lqmzDjgYE/2x/GkMbZEf0odTus27dFtWFa+K3h3BFYSF2Ohh6ELznpz1N7C1
	w4XSzux3+R7k0fUXRkQK8h4gwuaAgCWawdqkLvAbNegMgGa1g1It9nzSJwmVhDxn9ddBw9J0CNM
	xoj5KMDnGBR0L2lqP7lepHV7JZFKFwILdmMZIkQN68aFvnetGzlddGX6kGS75NORj6avfIFm0i3
	OLODmHfCJ2Fg7EHYIRGJ7v/d+hXgU5vSbCDcgsEmo+9SpHMUrCHiaoDopREhZ5Qgb/HAvEQuJDZ
	Pgyf7cLBjsvqE3pF6GUAYI2CRdn1zv1o9fT1HGDoPakg+ep3AHVfaRvcfdDvlkDfFyRLJ3roCtw
	==
X-Google-Smtp-Source: AGHT+IF8axMYld7qGlE4+pS3pEiljNH5/UAkHx+f+eVQUbgXVA+ocWLP+JGXYay/OvlA75sgBDSZHg==
X-Received: by 2002:a05:6602:1547:b0:876:19b9:1aaa with SMTP id ca18e2360f4ac-879c0927bd0mr54229739f.9.1752603623901;
        Tue, 15 Jul 2025 11:20:23 -0700 (PDT)
Received: from archportable.midcoip.net (24-230-34-162-dynamic.midco.net. [24.230.34.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8796b8fef1dsm323228639f.14.2025.07.15.11.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:20:23 -0700 (PDT)
From: Lane Odenbach <laodenbach@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com
Cc: linux-sound@vger.kernel.org,
	laodenbach@gmail.com
Subject: [PATCH] Signed-off-by: Lane Odenbach <laodenbach@gmail.com>
Date: Tue, 15 Jul 2025 13:20:38 -0500
Message-ID: <20250715182038.10048-1-laodenbach@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx

This fixes the internal microphone in the stated device
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 97e340140d0c..a50af0f8d36f 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -584,6 +584,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A7F"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A81"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.50.1
Signed-off-by: Lane Odenbach <laodenbach@gmail.com>
