Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A847E76C
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 16:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115373; cv=none; b=l4p1fBL00KOyFIbKwcbSkY0KEBsY9UjOlz1W0tdaN/kYr004jkS7yOkkiWAGQI/rz3O7+jq+ylVO0I9h0mkAcRaq/vytR0pD6V1ixVqBOksqHlfaYmk1hZLbQGvCN8qHgb24YeVb8/HDpifF43w/WRknmtNNGDCiwRKBPv1p+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115373; c=relaxed/simple;
	bh=5KNYbqRyLWNS+MwizZFGzQ2Dhc3qcL3+uy+mbhyjmQQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HeqoYjObvkToIkk85FG+HMPROnGkvmw83QNoR/ILC8uL2Wzm64gUAM9SEmd0CiA0wdUM7AHoVn9O8NXam4xWK7Snekjux3/fwsKZG+W2C/PsR2Bqaxtkl91TIPxRaXaXGvOW+jjSGcPYXKkVYtN520B3DhrVb7VXhP0ahJtqqPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C2DZNL38; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C2DZNL38"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O7L4ku000450;
	Wed, 24 Jan 2024 10:56:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=uf+mIUoUA58TF7kJUpUzS/CCL6qpa30sbJehHm5UEGY=; b=
	C2DZNL3869BynGzES4XMwIeZV5DIX8kT1T+sdkn3e7f7lz7y+pgxcLFw1G5GASUJ
	u3KTZuEHN1QscfQ+Vwe4Gcw8+TdEPIH24GrwcH0Ae5cctk67PwZ+NTh2VHdZeor0
	jxofYfiLv3JRvBWqx5PVlP0es3GP0ET4jvP7bm4Z95SY4jC7Ea5fQR3/bmDHLdbb
	kgn2Fh7dQKytLWsLCUrGcUico+3pVl2+QWwkkVvbZnBpVmgSBojigox89hvdXvFg
	xWZZuNKc/MFtN0bCwG1D16gIWCm8ZdfZgPvU3i9OfGR3AlziaDpo7se4MJ1E6rms
	kkzRfQw01r1obI59rPFcPA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:02 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:59 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id F0E99820249;
	Wed, 24 Jan 2024 16:55:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 4/7] ASoC: cs42l43: Add pm_ptr around the power ops
Date: Wed, 24 Jan 2024 16:55:55 +0000
Message-ID: <20240124165558.1876407-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: PIQDtVSCP88wy5j6gbUIAiHCFud6VbJN
X-Proofpoint-GUID: PIQDtVSCP88wy5j6gbUIAiHCFud6VbJN
X-Proofpoint-Spam-Reason: safe

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d418c0b0ce9aa..1852cb072bd0e 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2349,7 +2349,7 @@ MODULE_DEVICE_TABLE(platform, cs42l43_codec_id_table);
 static struct platform_driver cs42l43_codec_driver = {
 	.driver = {
 		.name	= "cs42l43-codec",
-		.pm	= &cs42l43_codec_pm_ops,
+		.pm	= pm_ptr(&cs42l43_codec_pm_ops),
 	},
 
 	.probe		= cs42l43_codec_probe,
-- 
2.30.2

