Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gEetVJqy"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D17AB
	for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 02:42:12 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC7hp9P027901;
	Tue, 12 Dec 2023 04:41:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=S
	jSfjnzX2kgKs2OORwGVP88+lFNDDFtHEENCImnrvG8=; b=gEetVJqyAbWbrTgxx
	3BjLyFH4NEuFPE2KygocmlHLsU5aOAdVsBmmoCCd34XYP7MwnLYCqkwJEwN53ljA
	aTRhMhhmT45ABazn4s3KNjIq555lUjdQgl5RKdb+paXv9dJCToYgOcd9npdK9F7x
	0uhyhQN0e1JxCyJR1L6mzlnToP+f/ZBe6Rf1JhXCZiT7pll0Kv0DcAMjSZpoxRsj
	WoDCkFDKorRdhs+ySGGJL5P62S5b+ZMb6EFZW8xq9rDoPXDSqPzTIDPr8xjxLzko
	tWBdP0qXdd/xDKClErsg7y8i+sAJ3sDyIDdmnhuoiOJusjWx9S8pYNKEU23LgWPB
	pSlFA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3uwawka8vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 04:41:52 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 10:41:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Tue, 12 Dec 2023 10:41:50 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DBBDA468;
	Tue, 12 Dec 2023 10:41:49 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <sfr@canb.auug.org.au>,
        <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Add missing statics for hp_ilimit functions
Date: Tue, 12 Dec 2023 10:41:49 +0000
Message-ID: <20231212104149.2388753-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: jqSYpUkfmg95LRwyJseQ-gSJ3IzKVT5_
X-Proofpoint-GUID: jqSYpUkfmg95LRwyJseQ-gSJ3IzKVT5_
X-Proofpoint-Spam-Reason: safe

Fixes: bbbc18d8c27c ("ASoC: cs42l43: Allow HP amp to cool off after current limit")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d2412dab35996..6a64681767de8 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -139,7 +139,7 @@ CS42L43_IRQ_ERROR(spkl_therm_warm)
 CS42L43_IRQ_ERROR(spkr_sc_detect)
 CS42L43_IRQ_ERROR(spkl_sc_detect)
 
-void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
+static void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
 {
 	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
 						  hp_ilimit_clear_work.work);
@@ -156,7 +156,7 @@ void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
 	snd_soc_dapm_mutex_unlock(dapm);
 }
 
-void cs42l43_hp_ilimit_work(struct work_struct *work)
+static void cs42l43_hp_ilimit_work(struct work_struct *work)
 {
 	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
 						  hp_ilimit_work);
-- 
2.39.2

