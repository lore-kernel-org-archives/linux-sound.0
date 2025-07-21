Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB33D517
	for <linux-sound@vger.kernel.org>; Mon, 21 Jul 2025 11:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097054; cv=none; b=QdKR6On3PHRpF4JjLysBBGvIp/0UBsEX/EBz5B+UDxzenLsp5i2TfKF0XIzys3qox5XoG911KVtZW/3qFjDjyri85BAp2fEuqovjYRs9l6dDciGxaoARz5cRZelDMi3sAWr+OS8OV/87AUOyrvM6TDqZ8wMxDUfs2pmPVHe9Hi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097054; c=relaxed/simple;
	bh=aZ2AoYJBwENYzmLcBTl3bzBo3KQftOdepJnfzvuYRFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NmZQbrkddwsWnu/ipItenliNgDe+nYh8cggaSozP6HeK1ZvAUXZpwzfRwG76oo+ywGavwjAFP0mMcAxpqK26iSbhk9rX9fyalViWYv+S0waNFrAK2G8A6Fbv3T2+fKXU9bgfoKNJq7zN6g3Syn0bGxwHxPTdyMLIp9GgM1/g29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=vM90hzF8; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="vM90hzF8"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 56LBNf3dA2663508, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1753097021; bh=Ov+aFNrZsYgY0fvj0gG0THKpyXBTY+/qZZqUe7hbxvs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=vM90hzF88hemFEskn84IQ2/l5Mz9GR9fYLMbB9KSfrCpV8BewJcgFE5G7hrWyDbhd
	 Q9Qe8/YgqQF24imdKXxAv9sIPyDCD3PCnz9C0UTJj7XJm5o2sKiBI7RDl5wXEUw/jO
	 wilPnWa3fz6y8A3uQj6VdgsxXT2nIbg51h0uuncvzrd2it/751juOdmmHFTtjQjpg2
	 0NZWzrTdPGlI9rWewbc/vZ0aZUHBNWwBfaj8TErRoCFf1kSqzDtSXydBZhx9B6Dkyb
	 BElrFHvNe8GLvkdcxsbF7YfbrGQOZRTIFfsLw5xKBWdvDY17HhvKIqsM+WwZkLDc2W
	 D/nL5gYNTCH/g==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 56LBNf3dA2663508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 19:23:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 21 Jul 2025 19:23:41 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 21 Jul 2025 19:23:40 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <ckeepax@opensource.cirrus.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/2] ASoC: SDCA: correct the calculation of the maximum init table size
Date: Mon, 21 Jul 2025 19:23:34 +0800
Message-ID: <20250721112334.388506-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

One initial setting is 5 bytes, so num_init_writes should divide by 5.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/sdca/sdca_functions.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 4b6da587c4ac..93767e73bc5f 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -212,7 +212,7 @@ static int find_sdca_init_table(struct device *dev,
 	} else if (num_init_writes % sizeof(*raw) != 0) {
 		dev_err(dev, "%pfwP: init table size invalid\n", function_node);
 		return -EINVAL;
-	} else if (num_init_writes > SDCA_MAX_INIT_COUNT) {
+	} else if ((num_init_writes / sizeof(*raw)) > SDCA_MAX_INIT_COUNT) {
 		dev_err(dev, "%pfwP: maximum init table size exceeded\n", function_node);
 		return -EINVAL;
 	}
-- 
2.34.1

