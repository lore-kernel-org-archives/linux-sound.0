Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2767F2DC76D;
	Thu, 29 Jan 2026 07:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670012; cv=none; b=VNKb5NDKlQN1Pr6PL9uPigsi7mIc7S104uA7cAK5WfeEWFqDRslezN9AIUxC7BAVkh7V7PJ4YnG7W+O7Af3r0Ely0Iy3aFlP/F/rCzY8rL4Xus/3gzI9yhiDNZ9L6fIWIlGvpuongQK3lCcncYeusQP6u3zUEVpRbsPIpPqf1WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670012; c=relaxed/simple;
	bh=yUm8xZvA0jpZrCPecgKzsSCfAD9l1c5xEzvB42REidc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UU/8DqSjP+rFc4qKr0Q7JhIJnEFFEFxf1CyeZJmUqQ98IvyuHrypw2gzGXobwgrTALl6/VCc9BFMvxqLTxwz/kepeXLjvgLqHOBmRov+Xxv/4pqCxBuyPzrA/JMDDF5B+p4b/en7u8Aj7QPgvHKbkrBGK1ry/FtedmVCZ9IkrSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=PxZz3Fbm; arc=none smtp.client-ip=185.125.188.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="PxZz3Fbm"
Received: from localhost.localdomain (unknown [10.101.197.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 2AFE1403CF;
	Thu, 29 Jan 2026 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1769669460;
	bh=kNJWa8jibnlGuC55BVDUmLc6qqXl6b2hJDE/WNv5ZHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=PxZz3FbmjTqwHmp1MoJReh63D7qoe3R3ZPFiHGQm2unvHNgJgiO0FRN3dxfRFwt/4
	 xxFQjEs8FiNU7FLEeeTl0R9GZUUQDFbajSAgbDLLU7H/Ua/JT72TMGfN5BYbY6qC7E
	 bOQhcvJLTQGF4M4YKz9LU7dd/B0ADP4uB2flNnWt9Y7x5MeCmOCD0InGk7z2bTWA3g
	 xsVxA7D/6O9+BdxZLfZPute6OVat5mH8Vggu5oT0yy1dLP4t9jbkPldiqHY9/wJ2JB
	 uHoxNqdibWiUdkRvgfaUgN0UlGt9dkqEci7YSuvn6ob+gE2MGgbJDo0Tp+iWZ303Ig
	 G5UW4q2QTcaNeamrgr+mVNanaqrz/mHRUL2dJ3n0aTshMNEja7zzwcmWnlgjqBrWEK
	 a3hPchpiIac58FVh5VCDrCpN2HPM4BnbgJEoou6aOztXSA9raUUr3SWI1CSqhmombB
	 ipPMYrt2BxE1JbLyKWNhGJQntMs+B23Ud8tpj/0thSXaIYjasI5TGLKbJIizivISSi
	 sg9uvmcN0B+MS+n96WGyxWrLrCvnvE5pWrdH/3UF2YKjgygC8t9KMzx1CO0dofw3UU
	 wIXvmRb7YhpjzeoQH59QH/VtzQha1TxxI2uWAQ9eYP1omA/3pxBRKe3kO3rbMshilA
	 TzAIrCskWS2gJJK5yI74GvEA=
From: Dirk Su <dirk.su@canonical.com>
To: 
Cc: dirk.su@canonical.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lane Odenbach <laodenbach@gmail.com>,
	Oliver Schramm <oliver.schramm97@gmail.com>,
	Adam Queler <queler@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Gabriel Santese <santesegabriel@gmail.com>,
	Raven Black <ravenblack@gmail.com>,
	Radhi Bajahaw <bajahawradhi@gmail.com>,
	Alexandru Andries <alex.andries.aa@gmail.com>,
	Talhah Peerbhai <talhah.peerbhai@gmail.com>,
	meowmeowbeanz <meowmeowbeanz@gmx.com>,
	Yuzuru10 <yuzuru_10@proton.me>,
	keenplify <keenplify@gmail.com>,
	Syed Saba kareem <syed.sabakareem@amd.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add quirk for HP 200 G2a 16
Date: Thu, 29 Jan 2026 14:50:19 +0800
Message-ID: <20260129065038.39349-1-dirk.su@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the missing mic on HP 200 G2a 16 by adding quirk with the
board ID 8EE4

Signed-off-by: Dirk Su <dirk.su@canonical.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 0294177acc663..500b4fda0581f 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -633,6 +633,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8BD6"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8EE4"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.43.0

