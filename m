Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18E19343E
	for <linux-sound@vger.kernel.org>; Wed, 25 Mar 2026 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436674; cv=none; b=DabfXpoOo0/xIbgVceK+41vnzTV4qZcRXQDdaMA8qo1QqhbX4DVfddWf0Tjq07GDQThlzxuop1wYoLJzhpF+W6Q4+sQG+PDV2A+y0GQ4fGPJ36nlqUsInjgOS6FQDWz+ruuOSGb7ykkMTUl/aQ5NaioSYmgIJpXyyAwo8jMr+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436674; c=relaxed/simple;
	bh=9xIV4AfvideFQLI3aFlpuayGnL7Z66PHXBNhWqRU+Bg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P6bErWBVfgM2vkn2J2l9kBkl/l+cTtvSWF16M8IrPmP+ATEO82b9OYynAYerZlQZ5FsVwdN+j8hhNjSjsi5PPwKtsuxy8mNadci26EZxysmQh7VUvLP6fw9eJmuMhNv5h8wGaeOIjPgzVaS7HOMEdwKhMvct/Ya/cwrWTb7Z3aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=KDRFJIRW; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="KDRFJIRW"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62PB489L03245752, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1774436648; bh=meMJbvezNLbWmFBAwJ8lSUZ2rWc92ky0Eovn8r77Szc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=KDRFJIRWOjdaylVJWRhGCFCfcT2L3L1m1P//5EGEn2lRtJjD7DHvGb26laV6JuVS8
	 8DthHnHE0k7BqkQfm4FtuQ6XQ1xboAhfSxSQ5nU0wolmuLTJC7wiIuEvP67O6/K7CV
	 wCfkvXr+SmnMnbITE5PCwXM4ifSd4S1hBrmplwXy5zG1SuDXF93oqHdwUvhDyk/Mb3
	 gFmyWsicaY0kH5P3lmG/l6+UJukr1w7tCO0W2IySboi9jhYUwiEg9kGf6SqlZZNkjW
	 ygFEA8SkNg/x99FfNLPwkKl2hOVXZqrDWTdZA4FsJvZvjhlDQKZQPuh3tO4+3veb7J
	 3dYABzYTViLag==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.26/5.94) with ESMTPS id 62PB489L03245752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Mar 2026 19:04:08 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 19:04:08 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 25 Mar 2026 19:04:08 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 25 Mar 2026 19:04:08 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH v2 2/2] ASoC: SDCA: fix finding wrong entity
Date: Wed, 25 Mar 2026 19:04:06 +0800
Message-ID: <20260325110406.3232420-1-shumingf@realtek.com>
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

Fixes: 48fa77af2f4a ("ASoC: SDCA: Add terminal type into input/output widget name")
Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdca/sdca_functions.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 0b7d97dcb236..fd6a254c9530 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1601,10 +1601,19 @@ static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 static struct sdca_entity *find_sdca_entity_by_label(struct sdca_function_data *function,
 						     const char *entity_label)
 {
+	struct sdca_entity *entity = NULL;
 	int i;
 
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

