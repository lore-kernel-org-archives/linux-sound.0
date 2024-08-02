Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B90E1DE86C
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596284; cv=none; b=gfZXTyKoT3igKazip8Q5SisBOk0vmItq9HnjsYx35jqwVxCgjrrkQYXoSQwd75J9byWrQt8FqzZ1zkRb55yqxyJSSVsFTRtXE3IT4mBywjxnqkmExqz5ZxECJEGWNgpWcNw9IuCiN/VyIOzksGlbvFbNGDXEFgeYWHr9EyKF3jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596284; c=relaxed/simple;
	bh=HNK/af5u+052KyFVukXSkzJlGvtT8ZTYebjauoldjnQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EiefA9V8cjD8BlVJM7bLT7x8Ok9BXj2UcsMFWLgqCEzQEtDuDXqgGH/eDruAVvrOLo3NYDon3N9gnBZBjRKqG0DJ1vFne6c3G69Bl8IwquWfZXxcgvfwHw2+c68/mlRU+B+eDKIbafDB2yEB+nN2p5Mnkc1Q6Amdvq3z7tXZztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=p9hF4xE6; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p9hF4xE6"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4726rDKd011765;
	Fri, 2 Aug 2024 05:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=BqVY5bQ1W9hycUVUoSbzW3HfntfItjqa6UpEd3G+PCo=; b=
	p9hF4xE6B0JTC9MBPkTbggyqjfJpkDjo+FU4KjjYDbwDNWBoPhgZO+uKC/XJ1wYp
	+FVF6TyzIXdLEdXdImFIFi5gLX+3bjn+7hmt5zK++qB8ysvlIvgXmrz2e1ZUN0+k
	bET6MpyUnyNmYawFzOlLlnIqDC99gLgrItqgu0FhGI5f6uYg41d1TO9R4+x3w76T
	Gf439482TCSC4Uj3HXfiCAEuqVg4/KLSltPDXRKkFtU8GP+XI63koaYJaLgWyhcf
	I49+g8F1ZzUDDjc53sqQmEaBFzdyYGVpbeUSMN5QF7scZat/MHPrKxjW/ZSTj3Ou
	89cbE19/Og5DSSGeZE+Ltg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40rjdxrj20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Aug 2024 05:57:36 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 2 Aug 2024
 11:57:34 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 2 Aug 2024 11:57:34 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 459ED820247;
	Fri,  2 Aug 2024 10:57:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v4 1/4] ASoC: cs42l43: Remove redundant semi-colon at end of function
Date: Fri, 2 Aug 2024 11:57:31 +0100
Message-ID: <20240802105734.2309788-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802105734.2309788-1-ckeepax@opensource.cirrus.com>
References: <20240802105734.2309788-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zlO-lW7Sd_MYFld5gc-Jm0Qa43kJX5N7
X-Proofpoint-ORIG-GUID: zlO-lW7Sd_MYFld5gc-Jm0Qa43kJX5N7
X-Proofpoint-Spam-Reason: safe

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v4.

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 92674314227c4..80825777048a6 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -608,7 +608,7 @@ static int cs42l43_sdw_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	return cs42l43_set_sample_rate(substream, params, dai);
-};
+}
 
 static const struct snd_soc_dai_ops cs42l43_sdw_ops = {
 	.startup	= cs42l43_startup,
-- 
2.39.2

