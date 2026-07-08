Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D23F6606;
	Wed,  8 Jul 2026 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783506907; cv=fail; b=q3DojmOfNVQPxrqy+KWQ0iiY1rk+WqJbfdpMbkCogDwUFgHf+CirNCSwqk3Ff2QY9UNxhMipbzcDNQ9WvjtiTniBn5uby40/7mjOmcRVFatcqcghWDLybIxmJ0uSRCJlAoHA4+I+Jj7VpKCy2rs2EAk5SIAfW3eEHL4qpErOMG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783506907; c=relaxed/simple;
	bh=DVPMXmc87AROX9d3iCSqHeAmQ7t5SXSR/r2/yJEeRD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q6vRBwzYnBdYQwIywNvybM1n84w8UPbkcX/Hq1CPYVP/DsByhXN7KWm1sc4PKFcGZwimkgQyRP0T4Ea4sxPQO7i6b5dtvAuM85ee6Xg488+QATuIGPeK5i4qce/ncBihXXhY2kOmNRe4Wd9Z2utV2QSrOG6A3Qi3Is3Yu8XVPsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=J4sRK8NF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cZjKM/ZB; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="J4sRK8NF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cZjKM/ZB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668934DJ3306096;
	Wed, 8 Jul 2026 05:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=VmY8ALUP4q6ETNS0
	hQ7fFl2WueWuKK55J1Mu8O6l+gk=; b=J4sRK8NFhkL6ZlVFE/L9TCTJJ0d/91cR
	rYxo1ncp2tQRgef/xGxfFlpVaUcYZmjs0GVyiBOx5MLyXhW8m/bKnOM7s0kX945k
	T1ocf8kwCSNjvIfD/r9vWgboNuUgW5bef6MgRpKHZQYzmhdXH6HJHyePfqamBqH5
	Rd4WhPpVysT5UUOpZbuTA+1arXwQYIF9LAG9DvM+q7Idx9MQeAqMRnnDEyH7x7A8
	w0usthZFtjteKQrQDJwXhXtOGQzvg0SuvGdNABvQho45uRBljVKYzo50m9zi5jee
	8R9tNMAwqvUbPWykkJQeB77XIdRh5OanoXCx0xDY4exw7qhZY5QiPw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023126.outbound.protection.outlook.com [40.107.201.126])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxnyu0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 05:34:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wj9QJ0Sp8OgIt1dmgWFp9nvA9Nn0TQnK40WtMNvwgNfimvclgNi2jxjhqPsQob6gxcQRwr1xxEVNMR0I16YJY411wwQNQzTP/e9X99NZyyQ5afha1aWSRFxYvmNkE7WITU66DsVZcIb18iQqNAL2+d/N4CFKFoa6vtkDxYrZmbKF4+gEJWt8DFE+TY2M5XlXCL1IhRCOZmGLJUZsTguanedFtyN/Nk+ZsFUulqqiWUaDhWe6VCtJqiFo9H3CsfJ6tGqU4sxastWgJQDSJMfXugCSPodBvIb+bPARC8zA9kIVy2A/rCw8HMAo2wwGbiTgRISybz95W0CvFuRi4briLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmY8ALUP4q6ETNS0hQ7fFl2WueWuKK55J1Mu8O6l+gk=;
 b=Vt280bMQ3XlaqUJ+GqKs8jePaU4pRUYwS4lhjQqtoGNg1/jKdXw3NGo5hMHTkj5coP9DSu7tNgM82fFocI5/jIrXVOIvtKBbPUI3543A4EFTZuCpkoPFFTEGOhIOqRWpujhHs7lae7Qw3IU0gnd1rIsS2Tlp3WrvmvHgnVkt7K9fR7FSH12DCLECCmhXW6a2B4+Exu8yyT8jNisS5YdrIFhEmWUqfRZTyw9ukw5rO2MfjIBB5uAMRvcyxqKxl7J5ZvFfUO/VZwoXi1sx1B0IGChxmAxwJa5a/8SfnQriLVEguhdq+8ezaLLv0yFJV6SZxgb3AGHBkeDlpbKrmW7u5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmY8ALUP4q6ETNS0hQ7fFl2WueWuKK55J1Mu8O6l+gk=;
 b=cZjKM/ZB8xaBS3K6kFpj+44flOUww+pSs31JqzG8RpcG0SWI6ngievfzR4+RO7uoBPIiv9FxgWSqM0aVBt4dS2TeXbHTDc8n0HHjAvBoMJiyQvgTDH5uGkOHluMe4B2kukALcKsxwjt44YOiu8N/F2PbqUJWvKt95CUNoeFelFo=
Received: from BN9PR03CA0419.namprd03.prod.outlook.com (2603:10b6:408:111::34)
 by CH2PR19MB3749.namprd19.prod.outlook.com (2603:10b6:610:a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 8 Jul
 2026 10:34:35 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:111:cafe::36) by BN9PR03CA0419.outlook.office365.com
 (2603:10b6:408:111::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 10:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.0
 via Frontend Transport; Wed, 8 Jul 2026 10:34:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E01D7406541;
	Wed,  8 Jul 2026 10:34:33 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D447282025A;
	Wed,  8 Jul 2026 10:34:33 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs42l43: Correct report for forced microphone jack
Date: Wed,  8 Jul 2026 11:34:30 +0100
Message-ID: <20260708103430.1395207-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|CH2PR19MB3749:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c22a4511-55e4-466c-bb82-08dedcdc8168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|61400799027|376014|82310400026|36860700016|3023799007|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	//AsFZb0bvBrP7zONWvzt/2EI72bIleLRKuRzOAsHvImCrvIKlREDxjiXsoHB8RXm4isTFFLsMxBzaXHF13LTDTyEAtMZFnHG0uSJVVPLBKu0+u8XCObdzJX3X62GYOV/PWonFfgMmWqQn5McTf+BfecAh1eStZWFdfFvIP5awrF8GVIlij/rzFRKrhhSCS4v/Klnr5enqV3v15+l107JbaLUQs1Idn4x1seINhdf6c19BZ7YokJSXufCsijA07MhMcodD+PTIpxWryUXUD4NFZDp/SciYVfPTobCFFX5qDPBjnjoDmvR7Et1g5HBZ9ZUrPshzkvLjAlXV9wqkygfgfNyXOhtFXzg9wRUz4fwqwUUus+GpMergdsEG/C++GinCiBTkzuZxSjJx6lqdJTInRYlx89nys87sTmVNpWtwqRE5v77LOyXBqHY7Xgh7ko6ivCDpaGeRtv4KwpzFHKz9T5SjxEQTvKqnU5Mw+eh831bP0+I+NsGng0XMarZwmBpB0u4bdS+fIHNKRsMLii83clYbD7qvnoPErmHKoCWnjKGO57JX7Veq8A0SyMRat6zmYroNiLm3SgMyT3nzIFdow3NEilwpeagEmNH8RZDLf5PAUfOXRccVoK4rH5Lxt42UvhVCKbAmDFUSpohnP3yjWPev1hfYcOlKuLGYwFZfcTygAa9BUT39TDA+9c/6FrHauPAmDuwgaD472dPCv0Zw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(61400799027)(376014)(82310400026)(36860700016)(3023799007)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PLKGAOk65SOJwFbqCh7vGjbgFR8Ly0UpOzq8CWxj45Hl1Mv+RLQc9nAonitdf4FIYWKm9kpGFNF4qfJvrOhfrRWZTYgGeH7+WpEI0HXiICLO4lfOkDD38r2pUB9axUzg6r+d/ghfv8CgNN1aMBkfnbWYN5jIuXoN8xQ/8qoGQL+fIYswEzkHG1UsOHxPSHTSglqezwpORbi12AEiK1NdrPiF7e1t1ft0s+Iuf0CTBwLqxrYcGJBzjAL/bIN9jnFojnpsdr79IKiPJUjma/2i/sOOB2oF6b4QPBBZNZ67DLvxs8EfIxWwVrqbBADhh//JBSgz9dH/b5BdDvHvGTs7Ws5dB2/cTsZY8EWxrDvyQ3xFz+j7liTwWuOLb4Ccnm3UkSKW/93ugY7D+ogKIlzyKwT0UXpinXG3F99/Vd6nH4yn8ueXFshaLO6zcSdyxwx0
X-Exchange-RoutingPolicyChecked:
	Vq/RCSGi6jrgi2pqGf4h75pgwx0gSYBv8Hr1YbE0cL/9UkSR9HUEoF4zXYbNo2ZpDW80vBD9smX1m2w4+Gc79BWjb2lMnIEVSO0DjFKK8Wjux5+/bfBOEsoDCHRwJV5ygS3LTJlvyyoiDlH4rdeUOyg4YPpnEuWjjIOQJXHYihRRieO4QN1jObQ2XMWOPta0xQOyGmLsewi5DgKC+Y/TEaSeTuYo1fhzwIBssZJd+w11fwNoVGMnQzb9SKVV6ORlJWDHyj3nOSFbA7NsHpRIU4V1DphuDRNbMEScofWAdbkJPnvOcoIuuE1eP+c8kYXWEiPOsfO62lg340C80Fd+Rg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 10:34:35.3106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22a4511-55e4-466c-bb82-08dedcdc8168
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB3749
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4e27c1 cx=c_pps
 a=F+uFsNuNoBNH7XrxSTh6Og==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Ne8NHYTdeInNicyJEDwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEwMiBTYWx0ZWRfX2pg/JzGnOkpi
 Wt1QQffwtBG27k9cyv1wcAW6X0cDRtYbj6zZ06CfMFwTqshnFhBMZxYUAYospYcU0YWG4XF0+yR
 sm4bONpzjygqGmsnyefT2syfc0auoqw=
X-Proofpoint-GUID: 7fFW24tPGrbNoUyudUNzSt0z5fv36OSt
X-Proofpoint-ORIG-GUID: 7fFW24tPGrbNoUyudUNzSt0z5fv36OSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEwMiBTYWx0ZWRfX7T17TVfvknUA
 LRgiNuwPrvtvDYDWy2h7BVyfFKaZHm0mSwqKF69EPcgBnYbTJuUSSp42B+AaYimQ7dQjRrMZ+xv
 Odip/fq9j3TurlZxI9IkTclykA9rdUYrH4wCdXSGzPbhzdThZ78STMfZOZJT+RWEeWjDSwG/dqR
 0ZyomzVm6ml3FHyt+70ukNpq2VdqKfp1x0uhg0H82R9BVMaz99iDMnuUf9m12wMk5GAFmuuAX98
 eRjCXh0kBLgj2uBeokbBz52fkvbA7il9uXAUc8E2LdCtALRiBZVPilXd41eICxpTzKFK6c4gUWt
 pi3z8YLj7IGEq8B9S6eshR/8fCHV0iqsW0E3FTrXBvbCOVpGM9NnFuI2pt9ajEz7QOVj4kkAIYr
 keO4+z3nxaTFCgyBZ9s0bhjqhYGNqQb3xUss9kBJMVDNes0GOWbXOFgop+Pn4Grh2NuZpgFUWAS
 6vnpnUMCF/hEpHN16aQ==
X-Proofpoint-Spam-Reason: safe

Currently if the jack is forced to the microphone mode, it will report
as line in. Correct the report to microphone.

Fixes: fc918cbe874e ("ASoC: cs42l43: Add support for the cs42l43")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee30..dbf45cabfffe3 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -310,6 +310,7 @@ irqreturn_t cs42l43_bias_detect_clamp(int irq, void *data)
 #define CS42L43_JACK_ABSENT 0x0
 
 #define CS42L43_JACK_OPTICAL (SND_JACK_MECHANICAL | SND_JACK_AVOUT)
+#define CS42L43_JACK_MICROPHONE (SND_JACK_MECHANICAL | SND_JACK_MICROPHONE)
 #define CS42L43_JACK_HEADPHONE (SND_JACK_MECHANICAL | SND_JACK_HEADPHONE)
 #define CS42L43_JACK_HEADSET (SND_JACK_MECHANICAL | SND_JACK_HEADSET)
 #define CS42L43_JACK_LINEOUT (SND_JACK_MECHANICAL | SND_JACK_LINEOUT)
@@ -871,7 +872,7 @@ static const struct cs42l43_jack_override_mode {
 		.hsdet_mode = CS42L43_JACK_3_POLE_SWITCHES,
 		.mic_ctrl = (0x3 << CS42L43_JACK_STEREO_CONFIG_SHIFT) |
 			    CS42L43_HS1_BIAS_EN_MASK | CS42L43_HS2_BIAS_EN_MASK,
-		.report = CS42L43_JACK_LINEIN,
+		.report = CS42L43_JACK_MICROPHONE,
 	},
 	[CS42L43_JACK_RAW_OPTICAL] = {
 		.hsdet_mode = CS42L43_JACK_3_POLE_SWITCHES,
-- 
2.47.3

