Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5AA38B7D2;
	Wed,  1 Apr 2026 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034155; cv=pass; b=bUU8mz7Z8q5XCv4To7Rw94TmhF1VGbNa5dw08IGWV8P9RZxUMdhAVNe9pQg6Lzckung7LaWsO7Lbj4Chq3p5tD4UF0Ns+RRB56UH5243O8kV84yAfVZyLgurFVtnSs9v3RoaOT47KYZs6XJa89k72ZniTw1T6YheEHCDn9c/YRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034155; c=relaxed/simple;
	bh=SiRbiPWfYoyb0jTLmTJ5QkjcEHFy0rmkUwIml/hwNNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZgyVqOrp8pzNiGYAVrsJsGE9G3ilObf0R8Sf/4Vq+6GqNWzyzz2Rpq/X4eENvgNhLzj1BG5Co4hTcnZQFRMf7XJRwrPg6MYp6xlz6Os6C/zxcadINVZumhfJxDuyM2rtuKa8RmTjwMouTUlHSYnrwrlDVM59u2GZf4Wm9d6XEiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=G4Mod79K; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="G4Mod79K"
ARC-Seal: i=1; a=rsa-sha256; t=1775034143; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fkLoadW4zvL3iGiSHeMx4BA74av8dlBQwL4YzUV7qwp4PVacgVxH0TliYnTa4yf5kL3e4lGU/6qluZLvoyty81e9m4iQjMPVLMM1RMHTzXwQ7e4Y4XMMEKdAAxJJ3+NqxxlUztQshv6QPTgH/nWNJkKQk+6UmWHy9xg4WPRJrgg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775034143; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1JidNBtwAKBiT/v7llcjGcbi5Vo8bK7rbL3FsDQVoxE=; 
	b=HiTZayV5VpAkIAGKj3iAt+a3SLFpOBktlthiXyED1RhQeP8pzxxTpeR/S+OuoGudcnv5//0gvAGVHvbrfyut3d6FTHRcKHsFfEriQipABikHQK4n9B1wdbRflHwTqu1kTOtcIUlTtkEK3qELFF8R9MpRYXuzsAngJkkuXNhX6Lw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775034142;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1JidNBtwAKBiT/v7llcjGcbi5Vo8bK7rbL3FsDQVoxE=;
	b=G4Mod79KIjw82imhxHEHU44/1PfZAiWtx1of5yf/BBkQp81z6uh9u6dhMQgKvQ5r
	P4ReLiEG8e8CYq0UzNB14YfxclfGTJVOwt0zJxWhuXEOCBzPMobWBY4MGVyv18nDiZQ
	WRM/d9tmSfPdzzl8V3plr+sDce65DSSHZAEKx1Qmc6pRR+3dqOnPfzHagPv3rVwrnQX
	83YV7uEXCaYxNP+A56AKfJPwjaM1L5yUc5tE6d3XsWVINnb4WaIIyOCUkE6KT+XDzQG
	6ds9e/cuaaXDls9lG6Adkx8Wj8s/QsPkLpbe7ZWv0vhVChjMul8Jma0wBfJ003JbBet
	ZW30ySFWOA==
Received: by mx.zohomail.com with SMTPS id 1775034140767683.4027965795523;
	Wed, 1 Apr 2026 02:02:20 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH v2 1/3] ALSA: ctxfi: Rename SPDIFI1 to SPDIFI_BAY
Date: Wed,  1 Apr 2026 18:01:57 +0900
Message-ID: <20260401090159.2404387-2-me@harin.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401090159.2404387-1-me@harin.net>
References: <20260401090159.2404387-1-me@harin.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Rename the SPDIFI1 enum value to SPDIFI_BAY to better reflect its
purpose as the S/PDIF input on the internal drive bay, as opposed to
the S/PDIF input via Flexijack or optical (SPDIFIO; not SPDIFI-zero).

Signed-off-by: Harin Lee <me@harin.net>
---
 sound/pci/ctxfi/ctatc.c  | 4 ++--
 sound/pci/ctxfi/ctdaio.c | 6 +++---
 sound/pci/ctxfi/ctdaio.h | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/ctxfi/ctatc.c b/sound/pci/ctxfi/ctatc.c
index da2667cb2489..9e0532fb33ff 100644
--- a/sound/pci/ctxfi/ctatc.c
+++ b/sound/pci/ctxfi/ctatc.c
@@ -1429,10 +1429,10 @@ static int atc_get_resources(struct ct_atc *atc)
 	for (i = 0; i < NUM_DAIOTYP; i++) {
 		if (((i == MIC) && !cap.dedicated_mic) ||
 		    ((i == RCA) && !cap.dedicated_rca) ||
-		    i == SPDIFI1)
+		    i == SPDIFI_BAY)
 			continue;
 		if (atc->model == CTSB073X && i == SPDIFIO)
-			da_desc.type = SPDIFI1;
+			da_desc.type = SPDIFI_BAY;
 		else
 			da_desc.type = i;
 		da_desc.output = (i < LINEIM) || (i == RCA);
diff --git a/sound/pci/ctxfi/ctdaio.c b/sound/pci/ctxfi/ctdaio.c
index 4dbb1dd7af32..128cf2f69ac1 100644
--- a/sound/pci/ctxfi/ctdaio.c
+++ b/sound/pci/ctxfi/ctdaio.c
@@ -35,7 +35,7 @@ static const struct daio_rsc_idx idx_20k1[NUM_DAIOTYP] = {
 	[LINEIM] = {.left = 0x1b5, .right = 0x1bd},
 	[SPDIFOO] = {.left = 0x20, .right = 0x21},
 	[SPDIFIO] = {.left = 0x15, .right = 0x1d},
-	[SPDIFI1] = {.left = 0x95, .right = 0x9d},
+	[SPDIFI_BAY] = {.left = 0x95, .right = 0x9d},
 };
 
 static const struct daio_rsc_idx idx_20k2[NUM_DAIOTYP] = {
@@ -106,7 +106,7 @@ static int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		switch (type) {
 		case SPDIFOO:	return 0;
 		case SPDIFIO:	return 0;
-		case SPDIFI1:	return 1;
+		case SPDIFI_BAY:	return 1;
 		case LINEO1:	return 4;
 		case LINEO2:	return 7;
 		case LINEO3:	return 5;
@@ -120,7 +120,7 @@ static int daio_device_index(enum DAIOTYP type, struct hw *hw)
 		switch (type) {
 		case SPDIFOO:	return 0;
 		case SPDIFIO:	return 0;
-		case SPDIFI1:	return 1;
+		case SPDIFI_BAY:	return 1;
 		case LINEO1:	return 4;
 		case LINEO2:	return 7;
 		case LINEO3:	return 5;
diff --git a/sound/pci/ctxfi/ctdaio.h b/sound/pci/ctxfi/ctdaio.h
index ff77d55539a5..c9f6207fe92f 100644
--- a/sound/pci/ctxfi/ctdaio.h
+++ b/sound/pci/ctxfi/ctdaio.h
@@ -32,7 +32,7 @@ enum DAIOTYP {
 	SPDIFIO,	/* S/PDIF In (Flexijack/Optical) on the card */
 	MIC,		/* Dedicated mic on Titanium HD */
 	RCA,		/* Dedicated RCA on SE-300PCIE */
-	SPDIFI1,	/* S/PDIF In on internal Drive Bay */
+	SPDIFI_BAY,	/* S/PDIF In on internal drive bay */
 	NUM_DAIOTYP
 };
 
-- 
2.53.0

