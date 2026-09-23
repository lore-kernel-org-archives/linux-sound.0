Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E343304BDF
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 11:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161329; cv=none; b=usVS+0tsGDv19JLioAb6lpH42usq2pZTuBolqiuveRqme8hbC9XWaib1io7oiQucN8aqXzgYKa0qUriG0MBsLdFGXtCWVWZsbbbmmN2kqCJ8anbiywc2/wcqF+ubuJI1FoYDuekDwpQK4qRmz4jRTe0UI0oEv9q6VW0P9lavWmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161329; c=relaxed/simple;
	bh=YjKhBDcMVFNqf8WPlAUrU2Xb09LuwQJM6G80Ilz2t+4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tk1KJOYTYfSURJZOjOM6Hzt5pBbX8ToJeZOkf2VpZ0oTPj7/F5KOZSPS1LuJcf21FlY3y1DDqPNmi1hA4UON/LdLW8NRbSfoaustZXNrV9DJapjqAhCxVPYeZapeC2OzD+qtDGDgCsOVl6XPUH1GQ4hCZ3my4dVgFsYf3SpgdSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=v4b0QqzV; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="v4b0QqzV"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68NB1X8k8236047, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1790161293; bh=PPpMtjsWTNrN36KobG5emIaIN4sDO2khljp34XOF5gY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=v4b0QqzV60pNzQlS1zrL/8Br+d0nDx7Dh8JGJyZytHQi4Eo1dyPaboUBJUMe6WiQo
	 CSMHoKbjTpqsUQiQL9ADYzzuM1TixFqzFk0SWutrUfZ7cHek1HLGAW0296Nh6lXqJO
	 wHbNMuX1Z8sJs3Zp9hUHtmWVx3As4c4vvmTufLbZT7VbZPBjbANnPieTAofV2Fv81U
	 AWaxX2WXGu1s1210GMNiDzCs16iaKyJ7RYVjKGZglgaUU3Lni53c/3GQp7QG9ty6wP
	 XgIizUgPlrGKAYQ9MjuIQpVuIx/dbENFYf52v8WjwZAusybi3N94pk0t+thDySSSJd
	 gBC04pYXirBdA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68NB1X8k8236047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Sep 2026 19:01:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 23 Sep 2026 19:01:33 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Wed, 23 Sep 2026 19:01:33 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/3] soundwire: intel_auxdevice: add rt766/rt767 codec to wake_capable_list
Date: Wed, 23 Sep 2026 19:01:27 +0800
Message-ID: <20260923110127.3419683-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

rt766/rt767 have wake capability. Add it to the wake_capable_list.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 drivers/soundwire/intel_auxdevice.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index a8407560bf4f..bcf94ea38cab 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -73,6 +73,8 @@ static struct wake_capable_part wake_capable_list[] = {
 	{0x025d, 0x717},
 	{0x025d, 0x721},
 	{0x025d, 0x722},
+	{0x025d, 0x766},
+	{0x025d, 0x767},
 	{0x04b3, 0x9356},
 };
 
-- 
2.54.0

