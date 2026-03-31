Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31EF282F15;
	Tue, 31 Mar 2026 15:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971328; cv=pass; b=pDMHv/rTl4/rRLsmVfoBSExguFWu4XK5VqZQfkXfQPjj89Ine9t3SXPfkX5D/jlt/4NDOZUxv4jD9TEg+xbV438797lQCCCYPzczCQEIRYnwoP/C+9QWaKMVl7l9HyDaFDx5LJsZCKPw44qP0cOeLnFIlIMZfcCCpj7kQ5lCVEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971328; c=relaxed/simple;
	bh=SiRbiPWfYoyb0jTLmTJ5QkjcEHFy0rmkUwIml/hwNNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W73PtCpkt3+ZjqzK6pPhWKbHCqEPGMIqLXbOKBicZLNHPquurD3PSHH96R9O7kA7qzaFaPCOLqIdLODGZtIU3GhFBwkDunpw0BcebTFRBjI5DtMvTIZXIWWmyRdXu2vygM8KCX8mE3xfV4cwc8ug783r90x2tzXbHvEgueAzrAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net; spf=pass smtp.mailfrom=harin.net; dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b=FLIBlmxF; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=harin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=harin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=harin.net header.i=me@harin.net header.b="FLIBlmxF"
ARC-Seal: i=1; a=rsa-sha256; t=1774971317; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oEr0+M8HarrMKeI0UGX/O8xYdD0AuwYplSFm0+8CB2WGVcPSYxbSjTKKW7wCT2bTZ9N+eue1Ou6mT2NqrfiQRfGORYsQylEKu14GR1uNxjtyXq4++SXKRhgXCmJ24zPoIBs21okSUN6VhhYWIogfzY66mKLySwpW6fLLHb0AULk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774971317; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1JidNBtwAKBiT/v7llcjGcbi5Vo8bK7rbL3FsDQVoxE=; 
	b=LaI1WDqgdhTtrc4yLN3PKc0UmYrcpmqTXSpDJHfuBngoKg5CnfAZBODF2AHf4WsQf5LfpbFGcuans10T2T9LNSf1VJL9X3AHm59D8Y/d24NVpV8piw1wYn5SoxbLsJoXzgVanmnV9ml1DZq3xrgLXd2szHQogZOg4el5SLBu1Qw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=harin.net;
	spf=pass  smtp.mailfrom=me@harin.net;
	dmarc=pass header.from=<me@harin.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774971317;
	s=zmail; d=harin.net; i=me@harin.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1JidNBtwAKBiT/v7llcjGcbi5Vo8bK7rbL3FsDQVoxE=;
	b=FLIBlmxF1e+1TC4z9Kq6SZ7L5iP/dyY3L9qW03hl0CEJPkHsiR32BVldlY4TELuP
	EnmOF8b+Kril8v9Bx9fqTaJOu/A59ZdEJLtB7ibs5oAm8NzkTEPld9D2AGjZpm9bi85
	upXORJ5oJRItU5WagJqYRJfoK9H/cIf68eb/eaUYckWaj6NzJJtdoVeE4ggMzVnMsqE
	fyHzLup+wWmeXqoTIUaQWGeFwoTt5L+Ut3pyoaVZ0cwmuE+dGmBejdQyR3wTgjG1KLK
	LbOlGwbWIAVqWZijS4JZa1T61IK5TMDJ5KC8a2WqitJe4iHb+vxzts539A8TfnnDFkL
	gxrbqxfFVA==
Received: by mx.zohomail.com with SMTPS id 1774971315103279.22817137290644;
	Tue, 31 Mar 2026 08:35:15 -0700 (PDT)
From: Harin Lee <me@harin.net>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Harin Lee <me@harin.net>
Subject: [PATCH 1/3] ALSA: ctxfi: Rename SPDIFI1 to SPDIFI_BAY
Date: Wed,  1 Apr 2026 00:35:05 +0900
Message-ID: <20260331153507.2934795-2-me@harin.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331153507.2934795-1-me@harin.net>
References: <20260331153507.2934795-1-me@harin.net>
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

