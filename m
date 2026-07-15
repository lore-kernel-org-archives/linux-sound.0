Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8D3AE6E6;
	Wed, 15 Jul 2026 16:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784132977; cv=fail; b=FR/M/Izgcn3e5nwlAHJYCt61T/00bfmsIN1FNOVW3dvmAya4/1zzGHyDZLc5sTaT4V57VJIiBGlVSgxbo31CMCyTd47NrlRi4zqDUMP2T1mWDFas7PDrpaAiUN/kvIPPml2WGsqEHciH7z/pvCI93MekGZa3gOhPji4roWp4cik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784132977; c=relaxed/simple;
	bh=rI+vIToMWyeTuUJ4umWX7L5WxdyMiIhmJhjw1ky1Ea8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YcdgleAqKsS+/eaz8g+7nKIa/vNlkovFS7P6pPiwjT//9b2rY25lh814mi71sSYy3rGT7yLr39Spe28YMzTMmZok5l61UEAC97LTir6xkTXdc7RBLsGNKkpyvU8LfVkBUG47SWL4HrllVPgbJUOFM0feggYIcPzAHtRZGTil88U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=oj8fC88f; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mVVyCgIp; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="oj8fC88f";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mVVyCgIp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F1tMlO031725;
	Wed, 15 Jul 2026 11:29:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=mnGrQUUNMtlcicMX9z5Qw3xa8xyrnmfX+bo9QaFHYV0=; b=
	oj8fC88fIFER/SjEOLtIt+GL12CIU00Mr/Mb4vwcKPKtgCjTKmLSDlBId3SWaU4f
	EW5YpAMBJZH6/0aQfSFxQMtlCtfvzhj5Ho0PZaBcB2QLzH7hB/OeqJEBmunJySWC
	zW1ycZ7EpoBRVGKm3CMebLqjvAteVCJPdEjAjiWi3wiTAM7e2+2yKUdwaBnM1gdb
	gbmXNAvzNjEmdv2XSdet6FgObd5eb7VFWDKPpNqbPztxnwbkBz0F+n1xl7TAKA9P
	jRewyhjGRXwJvoxmplmKtsh8EYuCv3GaoTxl9/2Ve4V7SU6kztoJlK11y3pf6aM6
	6bnwav3SR2NGkazD1jWyuA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021092.outbound.protection.outlook.com [40.93.194.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fbk7vwu1t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Jul 2026 11:29:30 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c26ASlTOf3SxHX3czzYnRT8g9mOCiURvehJztXnarfK3QZ8drcpaWYEplZeTCBYK0lgTemTVeRr9vXLHyI0b7C3aftWUXMWoNz4LfHZO8P1VefLW3L84oWC/DjTF8dqaA2xcsikkLgOPIspzWMzMDWhwETveTdqwvMMBEUszZJcwstOZMRGw+B2dOzwfm28LIHKYY+ksQC7txAFl0p3+X5JNX5Gy8pwCI0/l/Oei4bPjBVLYRASmjfF0EyGXCmMWTtwTXD22iotjKWi5BBnzdqKBp5PX4XXGiQ0fiFszqNhTjOqysxtnGpK0TEzKk62nAWR39ItFrw41hMT6xDAo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnGrQUUNMtlcicMX9z5Qw3xa8xyrnmfX+bo9QaFHYV0=;
 b=iglGS1705KG+sgkrxIoYphAH8kkwATaXjf2c4gbZzU9g4uuXs476tVJxPt43qr20HyAm7oSFmS6DgjJHENdC/FV21WciOehUbxQcAkrv4DsBJO2zNccSFnuaGiq2TG25JcjhYiD1aw2ALBK6CSs0kbOQnWa5sN64DCuW9Zp8y638G+CfQujEsg99FWP0xLBZEDYDcLR/OyS6CJPkEPACewDmRXOTBM0wcChhEZqqBC3bM6GLfiy6ZRCOjfUmGOrHfKqD+FyJfwKK1LYqAILjX1u/xfSe03f3bCTZgiwyjXMpfrndCLKz4KbhTVDkAsLdKa+8mf4JJ0AW7x3FtUUy6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnGrQUUNMtlcicMX9z5Qw3xa8xyrnmfX+bo9QaFHYV0=;
 b=mVVyCgIpE0sJYPeX+jdBEM9JPgoJCtMfOn2/0PDVolTXCex/PYc/j9AgKqXVwfJGXssyI+6CG99uI6r1lts6OspEZgsjZn7ISFrHSO3d/ZBEyouRFNaCG1IGcxVD1jlIGS7qYAKccNORxuKhR5F51gAmIxYdFlWtgycqbZK7WAA=
Received: from BN9PR03CA0790.namprd03.prod.outlook.com (2603:10b6:408:13f::15)
 by SA6PR19MB8632.namprd19.prod.outlook.com (2603:10b6:806:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 16:29:23 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::9e) by BN9PR03CA0790.outlook.office365.com
 (2603:10b6:408:13f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Wed,
 15 Jul 2026 16:29:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 16:29:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 27756406545;
	Wed, 15 Jul 2026 16:29:22 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 027D0822544;
	Wed, 15 Jul 2026 16:29:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH v2 3/3] ASoC: SDCA: Switch to fixup_controls callback for IRQ registration
Date: Wed, 15 Jul 2026 17:29:18 +0100
Message-ID: <20260715162918.1898396-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
References: <20260715162918.1898396-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|SA6PR19MB8632:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f0d2374-d1d7-4cf0-a66a-08dee28e3abe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|23010399003|376014|3023799007|10067099003|16102099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ShNU7vRa6gSAx+O0+80vUFYvodnCIevyoDj29Jwhyu3pkVGTUM/EWFuIYsPcVk8zSwynrCcuhFO9dGnwKcrUsFdgE6yjr/kq1w5Cl7XIOKRrrIb9ZsTIHQH1+JkTGqzPr76Rd/nPviRhn72tSeUsyNAU7M6JfhML8opObED1wOuiLHgCfqoZRWvc5WmLcTnEJjW1W6i0N36/X/g49ZSE4xhArXvCdsd3LDceynca1hvaiOWoksOIjrlQgbx20Wxauz72Hq5E7c26OFeMmUlb4DUOJUHARpMxKxbpB3RklE+l6opGQE4scWtXgy+E/WMNXKNDFWPLIve/tzGxGgsLPzHPcjgfwN+VHDgTiGn6vB4ssVBVHBXUzE7WnNmDNkKeGpRpQUmuZh/uucXPx9GBJKtP5GwVqLufRFtAq1bXmWdSVpucnBW3aroCEMKksR7zZ0saSVTgaEe/eEbELtE8UR4SupggzCpu+pvO/u+hoPL6WmZ8Tn/fA1HVVjrQES6Cjc3PesRRNUuNH4yhNaXN48yx37Pxjg7ITt2pDW46wCN+gb56jLWtp3CaV1djw+FG4XJHHHM1T3GdFWMDoO/1NjOIdC2kQyScAz4s0L0B7JqHKSpKUa7KlY468UvC02R4gDrvygjplqherVVHW2Y4jVvAuXcJuiYJ6TfmtfxxTFtfOIccrcYj4uDMPwxshr05XTXDLf1d9/cQDaj8O2YRDg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(23010399003)(376014)(3023799007)(10067099003)(16102099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qp4bpShy4+KlDVu+XVlUxlqtvPbOLCSG/U7ADy5d0/VBNKnfP4FwuTO6klNgUjLPDoLlPIZ+jthzWY5AwpThUXoiwUPPx9I7GMEpP9mP/JgcNw6rlJ86Y197NtrpPtCecS5NQZO3lmoQJ5PTeZNa1S/IiCIjuiX83CbGvVpplgzRP7Et9uFYwwMYdNIlwobH4pfh44YHlqyrN3buiGllLwzQdfYRO4Au7Pwf4daPsu4z87EctctJFWaoYb93aSD5259+xog0P9GgVBQ5Vi7836f+huqMJ3m07SyyiVjcWTIcUCL6Y0PpQEBhrMaMT6ZmMQ4DlJCnPK8+PQN3P1OdffrEyyEjNXAwISHC7oQdKpcIxRH5ZynF6zfb7XP+Jc6KG45Ea0w/MQbTj1ZXQyvHBSViYAevM58ttZFi6L4GxyM78LGiIj1S2vZ6yAwF1mbW
X-Exchange-RoutingPolicyChecked:
	oLgbXH+wq3NQ68GiSXvvJDdOg6E8I63fYsU3hz33QBeSJAfXKbxLNkU9CUjlNu1zWuT2L70uQ4jB+Rx85U+VMr0MfTKHdaJV/JHmbY0hJ1nsvUIuIOTbEAlWoJtIma5IHSAGhBYZ7DKtWxbivT1LeUGusC74Ym41g+n3HALy5t0cOPKvj5s2S6GYNB4O+/4OhDZOPEQYdFjcsPnuE/MzzwORdil8VdjkqZ1g3ocnfmnFKm7bPc7Qc5JLNAEUcEn3RMgYaMwM/DyNJeyLLVzS2gvfM0CFgE6xjMvIR8XqAYV+wgVJFPAyIbvVxxblCGQCRYLMbKutnF2ARlK7Ag8WLA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:29:22.9871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0d2374-d1d7-4cf0-a66a-08dee28e3abe
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8632
X-Authority-Analysis: v=2.4 cv=V71NF+ni c=1 sm=1 tr=0 ts=6a57b56a cx=c_pps
 a=FqDfg28UJuADJc1XZx4kXg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=ROXgqlMaiY5G2CdaEtEA:9
X-Proofpoint-ORIG-GUID: MGO1xyiJ4bHEfPkovZURNFJr19i83hC8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfXwXZOXrpAIHmk
 uTVO7K0h8aAnogFxiH1p2Egm5PQB2RBbBX2MpqU0vyn39mL5o/ZML7jHXCXOtM1d6eDVaOXU4X6
 11I1dxRpfISE9s+sWmPaYbmTwjK6SVU=
X-Proofpoint-GUID: MGO1xyiJ4bHEfPkovZURNFJr19i83hC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE2NCBTYWx0ZWRfX04D2ZVr1IVS0
 JBhE2g2XjzS5R3984vd1zr1w1zsZ77wMWshVFRASEdHnJDzzmzDTSxjUskAoD/3byHPi/RhCLz+
 WhCDflcm/58XPBgvSM4n47RyqFbDNTcwv8ow3HEvHOmK+UqpXKmi2dKz9GZcL7mSQEW6cRXcX7X
 KVm0alF8VJTNZi2qVC/D8ZC63tfmg1TmaQ7ImXjAjk6YcXMbUSSaocZQxbHAWlwbQ0r/KEtj0Ia
 pG2WbCrAPne77zHYlerjS6FfN2mW4X8cVWUtmlCbUcEadNZ30zmNpG12zOwq2HNprux+Q+JeI2Z
 R+bXgKZQgHTCrXsCcLWksum6UhWrB4cBkkwisSK3m6xFNOvcSsti539GEJnjG1DECx98JkGp8xV
 DHZwCQNRU2ONGaeIGXmOlz0mfBToMo6VizaT/KUY3RkorCssXg7dyU3VGm8vrAryLRkMlzjhi4P
 v6cK/gxuBNrQbYxLRyQ==
X-Proofpoint-Spam-Reason: safe

Currently there are some race conditions around the boot of SDCA
jack detection. The core creates DAPM widgets/routes quite a
long time before it creates the associated ALSA control, and
the jack detection IRQ is currently registered in component
probe. At the time of component probe, the DAPM widgets exist,
shortly after this the DAPM routes are added. At the time the DAPM
routes are added the register value for the control is checked
and the appropriate path is connected. The existing handling
in the SDCA jack IRQ handles the case the control doesn't exist
and updates the registers directly, which works until the DAPM
routes are added.  After the routes are added the DAPM graph has
already set connected on a particular DAPM path, which will not
be updated until an IRQ is received when the control is present.
Thus those updated are usually not reflected in the resulting
DAPM graph which can lead to the audio path being erroneously
powered on/off.

Switch to the new fixup_controls callback to register the
IRQs, this is guaranteed to run after all the controls have
been created. Which means we can avoid the aforementioned race
condition and as a bonus no longer need to concern ourselves
with a case where the IRQ handler runs and the ALSA control
is unavailable.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Remove the bus remove callback since all the IRQs are freed in
   component remove and the memory is devm managed.

 sound/soc/sdca/sdca_class_function.c | 12 ++------
 sound/soc/sdca/sdca_jack.c           | 44 ++++++++++++----------------
 2 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 1496a15f7d2ac..32cada9e369cb 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -191,7 +191,7 @@ static const struct snd_soc_dai_ops class_function_sdw_ops = {
 	.hw_free	= class_function_sdw_remove_peripheral,
 };
 
-static int class_function_component_probe(struct snd_soc_component *component)
+static int class_function_component_fixup_controls(struct snd_soc_component *component)
 {
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(component);
 	struct sdca_class_drv *core = drv->core;
@@ -217,7 +217,7 @@ static int class_function_set_jack(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver class_function_component_drv = {
-	.probe			= class_function_component_probe,
+	.fixup_controls		= class_function_component_fixup_controls,
 	.remove			= class_function_component_remove,
 	.endianness		= 1,
 };
@@ -404,13 +404,6 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	return 0;
 }
 
-static void class_function_remove(struct auxiliary_device *auxdev)
-{
-	struct class_function_drv *drv = auxiliary_get_drvdata(auxdev);
-
-	sdca_irq_cleanup(drv->dev, drv->function, drv->core->irq_info);
-}
-
 static int class_function_runtime_suspend(struct device *dev)
 {
 	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
@@ -563,7 +556,6 @@ static struct auxiliary_driver class_function_drv = {
 	},
 
 	.probe		= class_function_probe,
-	.remove		= class_function_remove,
 	.id_table	= class_function_id_table
 };
 module_auxiliary_driver(class_function_drv);
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index ae9636622a840..2ac74b9826736 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -41,6 +41,7 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 	struct jack_state *state = interrupt->priv;
 	struct snd_kcontrol *kctl = state->kctl;
 	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
+	struct soc_enum *soc_enum;
 	unsigned int reg, val;
 	int ret;
 
@@ -55,10 +56,12 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 			return -ENOMEM;
 
 		kctl = snd_soc_component_get_kcontrol(component, name);
-		if (!kctl)
-			dev_dbg(dev, "control not found: %s\n", name);
-		else
-			state->kctl = kctl;
+		if (!kctl) {
+			dev_err(dev, "control not found: %s\n", name);
+			return -ENODEV;
+		}
+
+		state->kctl = kctl;
 	}
 
 	reg = SDW_SDCA_CTL(interrupt->function->desc->adr, interrupt->entity->id,
@@ -96,30 +99,21 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
 
-	if (kctl) {
-		struct soc_enum *soc_enum = (struct soc_enum *)kctl->private_value;
-
-		ucontrol = kzalloc_obj(*ucontrol);
-		if (!ucontrol)
-			return -ENOMEM;
-
-		ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+	ucontrol = kzalloc_obj(*ucontrol);
+	if (!ucontrol)
+		return -ENOMEM;
 
-		ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
-		if (ret < 0) {
-			dev_err(dev, "failed to update selected mode: %d\n", ret);
-			return ret;
-		}
+	soc_enum = (struct soc_enum *)kctl->private_value;
+	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
-		snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
-	} else {
-		ret = regmap_write(interrupt->function_regmap, reg, val);
-		if (ret) {
-			dev_err(dev, "failed to write selected mode: %d\n", ret);
-			return ret;
-		}
+	ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
+	if (ret < 0) {
+		dev_err(dev, "failed to update selected mode: %d\n", ret);
+		return ret;
 	}
 
+	snd_ctl_notify(card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+
 	return sdca_jack_report(interrupt);
 }
 EXPORT_SYMBOL_NS_GPL(sdca_jack_process, "SND_SOC_SDCA");
@@ -192,7 +186,7 @@ int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *ja
 		struct sdca_control_range *range;
 		struct jack_state *jack_state;
 
-		if (!interrupt->irq)
+		if (!interrupt->dev)
 			continue;
 
 		switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
-- 
2.47.3

