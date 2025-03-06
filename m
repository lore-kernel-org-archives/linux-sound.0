Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3B52040BF
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 10:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257788; cv=none; b=jkAxzQPRbtUmQHVnNg60KzpP96mZbFQ/f6SMMCd4mqjj+9i2J+WcFTP4BVNfSgRa47P8LxHrj9w1H5p52Zf4BkRYyuC20szBxTn7ega2QUPrWHGdvOW3a2L6TL6jLuP9uE5ZBwtg7+9xCSjOKn4TztcfpmisPetM1tP/RWJ7dho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257788; c=relaxed/simple;
	bh=RFO61TssvxVSb9q/CD3BB8hb9rMMHchi+gH8KRFf90g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oqmx2XUGB1Eo6e3ksGHJBQn2UQ2jOp+pb6IbN4wBJn1tZEhXT5koOD0sm6EWaIPnOgkUiE4aW+mCG/EUb2/Xw2zKCQafZAl/XnyHhWXMu+w1c4Gvcagjqf8L+3DhPE9pysKsbkEagkOXMLIGPwZDhpSm/UbrPvwgmP7zIKtWZpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KRt02OUZ; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KRt02OUZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52651O75032364;
	Thu, 6 Mar 2025 04:42:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=+BXtjs9xBDe442bw
	rkVs0zDQ973R+62OUW3hBT7BaGA=; b=KRt02OUZOFTRxvWpQGcsUiZDSBH8g9yN
	90UPO1mbDSxb1/EHD+CtjfyiD47yhCeAdbLhxDHpGAUoCrwWUYr8ojee2ScdQc2v
	0UEN/oH6oZuFsvevN9ueJNjgv1MfJanDpyn8YdC/nQ+QoaT4PpqEAQTZlNVCwREA
	0XpNeoppKoag1lSfLk2weso+2xJPEs+nEqNbAsedMSbWBfYKBvb/2wie2CKvUcHF
	DnlrCKbuwO7xJL2+KeVo1W+p8AmPTcb4VUKbFAqUzoY4eZHspg6wbSzcAn+iqL9p
	cvtOuTA/ONWcJt0Er0saVDA1k8BFmPStEj4v6B46KbeTtvB9f0671Q==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 455fyypjg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 04:42:35 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Mar
 2025 10:42:33 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 10:42:33 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2868A820248;
	Thu,  6 Mar 2025 10:42:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <lars@metafoo.de>, <nuno.sa@analog.com>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: dapm: Fix changes to DECLARE_ADAU17X1_DSP_MUX_CTRL
Date: Thu, 6 Mar 2025 10:42:33 +0000
Message-ID: <20250306104233.1638625-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Y_-wZadCyAnNzjKz-n06a9lDsR8L2SvM
X-Proofpoint-ORIG-GUID: Y_-wZadCyAnNzjKz-n06a9lDsR8L2SvM
X-Authority-Analysis: v=2.4 cv=DaftqutW c=1 sm=1 tr=0 ts=67c97c1b cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=sj1eUrfI9jaht4mzdPEA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe

The changes to DECLARE_ADAU17X1_DSP_MUX_CTRL did avoid the issue with a
compiler not liking all the macro indirection. However it introduced a
new issue with respect to the mux not being declared static:

sound/soc/codecs/adau17x1.c:275:8: sparse: sparse: symbol
'adau17x1_dac_mux' was not declared. Should it be static?
sound/soc/codecs/adau17x1.c:278:8: sparse: sparse: symbol
'adau17x1_capture_mux' was not declared. Should it be static?

Fix this up by going back to the inline declaration of the soc_enum, but
just call SOC_ENUM_EXT directly rather than indirecting through
SOC_DAPM_ENUM_EXT.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503061119.4QGlnOi6-lkp@intel.com/
Fixes: c951b20766f0 ("ASoC: dapm: Use ASoC control macros where possible")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/adau17x1.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/adau17x1.c b/sound/soc/codecs/adau17x1.c
index 2ebb5c90bdd9..0b6b0d2115eb 100644
--- a/sound/soc/codecs/adau17x1.c
+++ b/sound/soc/codecs/adau17x1.c
@@ -254,13 +254,11 @@ static int adau17x1_dsp_mux_enum_get(struct snd_kcontrol *kcontrol,
 }
 
 #define DECLARE_ADAU17X1_DSP_MUX_CTRL(_name, _label, _stream, _text) \
-	const struct soc_enum _name##_enum = \
-			SOC_ENUM_SINGLE(SND_SOC_NOPM, _stream, \
-					ARRAY_SIZE(_text), _text); \
 	const struct snd_kcontrol_new _name = \
-		SOC_DAPM_ENUM_EXT(_label, _name##_enum, \
-				  adau17x1_dsp_mux_enum_get, \
-				  adau17x1_dsp_mux_enum_put)
+		SOC_ENUM_EXT(_label, (const struct soc_enum)\
+			SOC_ENUM_SINGLE(SND_SOC_NOPM, _stream, \
+				ARRAY_SIZE(_text), _text), \
+			adau17x1_dsp_mux_enum_get, adau17x1_dsp_mux_enum_put)
 
 static const char * const adau17x1_dac_mux_text[] = {
 	"DSP",
-- 
2.39.5

