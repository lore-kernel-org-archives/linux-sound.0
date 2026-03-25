Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1442FFFBE
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 09:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774430453; cv=none; b=rg9NCrPlhSrvKK9MKc9uRxkQ8Z3g9t+w5wUPvsHUmIMTGh0BKfUNJo3bQViBGjNhdmjB8agP7z7Q6UiGk/z+bEcbmu1iAFK10SlGEHLosw2fLAXvoEFfbGN8xr/GVTgRGYEawvXUvAYDHNfobEh0EJujvHRplT+/laARGaBJJww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774430453; c=relaxed/simple;
	bh=CV1de0vYaDR0aFIZM6nfabN3QwBuSTC3uoNYmxT7hQI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZCltrgYTLJAOM+sng2OC54dDmytAZHsLA1KT2xevatrrzRZEaT31NuanQGI0cZGSzu1PPUBVHrC+mTpRgw3i7BoYxbOVnWst43gsYQjNwnfD9eYni6n1RmxI0KId1B7bxamys82nMMXxpM8weIf+YUVjs87z1zabWFsUrMFZwHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=FW3MWLHB; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="FW3MWLHB"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62P9KT8303100028, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774430429; bh=mWmHz+XuA5nqpvPsf97jj1hJSznXkyE47aAYfOKTldw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=FW3MWLHBx9JjdQ+49GY/SBziB5szY77awdZhJ+2er5FliYM0aTyZVe7ExI+Cuq4GK
	 QQdjy2Rx+6NKdG1wTId/+4LzegRous/POGdrqQ9j9HoMcEYVFcsKcuJl0qYedaVkes
	 jtYswC3/yGvv5Gv14M1ZrtEZ7kvtKfR4HrYWQF4qtGLRF4zcvjTgSFRvVvyi+UCg8P
	 5Rno4I3GjBNDWh/PLb329VwH4Mzc2PM5Lh0Y/uks2QHoWVOoB6AVJAPqdS2qj9SrAL
	 d0r6y9kSXybuJHSDOcmRArOkdcqGY4pUjsXT2zdKZ2ngtEXLrfXqUnXTa6Xn5ELPjr
	 Cyz5xJUl/SYgQ==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62P9KT8303100028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2026 17:20:29 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 17:20:30 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 25 Mar 2026 17:20:29 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/2] ASoC: SDCA: fix finding wrong entity
Date: Wed, 25 Mar 2026 17:20:28 +0800
Message-ID: <20260325092028.3221671-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

This patch fixes an issue like:
where searching for the entity 'FU 11' could incorrectly match 'FU 113' first.
The driver should first perform an exact match on the full string name.
If no exact match is found, it can then fall back to a partial match.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdca/sdca_functions.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 0b7d97dcb236..0787bf024d21 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1602,9 +1602,18 @@ static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *
 						     const char *entity_label)
 {
 	int i;
+	struct sdca_entity *entity = NULL;
 
 	for (i = 0; i < function->num_entities; i++) {
-		struct sdca_entity *entity = &function->entities[i];
+		entity = &function->entities[i];
+
+		/* check whole string first*/
+		if (!strcmp(entity->label, entity_label))
+			return entity;
+	}
+
+	for (i = 0; i < function->num_entities; i++) {
+		entity = &function->entities[i];
 
 		if (!strncmp(entity->label, entity_label, strlen(entity_label)))
 			return entity;
-- 
2.53.0

