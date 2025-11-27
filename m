Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF23274B46
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261296; cv=fail; b=qVlrF9VdLGU9+u0qFsFsI2PTuUcZpY1QnyVJB7ST3KCRFYgABYN9dC6EzU1CyNMuphfzpWQRMDmG+mKn2JKyG1/YwAgydcO9qMaAnam0yWYeqITWeP2Nx3Vi7PPuJNRTyXOUs01eoO0lF4KylSwoothU0ZXpnNJkhbZjM/pKqB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261296; c=relaxed/simple;
	bh=Wq7+2adDF3EOcsikk/sp06NTxvu5C5UqHqZAoCXJDn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msXIP/TH1nz8v64nHDzbvyCVHzOwN/RGFCW8ADrGveQj56jl5/ATRPLmd1WYZVmy8FC4vQKvFTeg2qi4A9FvaZuUaoDFsH4ZAJsNpZOXKrV55qFK8WI9dX3Fi/RXmsKbTUeXU5blxom5Xv4Jv4poggBYgsgBEELS3tPi3gaRhPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=aFWYI5x5; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ruq/eZIM; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="aFWYI5x5";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ruq/eZIM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR60bEh181871;
	Thu, 27 Nov 2025 10:34:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=oIo2irFKxYE5NsQdnrB41DTQEK/x/ygUZjzHbTvzrB4=; b=
	aFWYI5x59yZ4yKHrVTGusiP3S3zXxVAfzLZjaVoUrd+vS/GusP4Lt22WnR/3QE/v
	8hw7mDzKDUR3BHDo/ZhBSqohseuV21B3cWixKgpcV7HZV9n7FJ/zpbnFKBYRbBiW
	Rd5MHj2277uPWTBKLgKC0Rv76NBjUSkA++t0aM7Bg3fnnOy+/P9Oah4Vyk7u5j/I
	ytHZUma/nTY4JUpR2+U/MPaMgbkN2Ycubqld0m3eKB0Kwn8xZRIZy/0SjhrUrkbx
	Lyzvw1DSx68+1GApSWYb+tNT7nu/2v2zwcMTh9mQ+utMxAYUNDu6kqpkni/kaqY5
	9qT/+6iQTUD+RNoNuRnOCw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023077.outbound.protection.outlook.com [40.93.201.77])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5jeva-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:34:35 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swm9B5hyUhyuGw60ZqKGQk7QZpz6zj09n91ueeFWbhQ7SAQ5H5VpWwk2xbWIQLXTAZ7BQFRjc2B4LRFI6Gg7jq5fDFlUa8lx53JTrxWOLA7YROwq1f0QxBa5FMzZKLjmI9wiPZN/iiEJokQU4Y/b4ZjMvD/l4IaAEFLcociBOt+W17CvjtQfwjH8EDz2tT9rutK6g1wwZcHV0/nAxmUdk+9+7CvlY3cKuSj/+9+RkmHzK6i4n5x5Sj1t0emp38rtUf+X3osVsI6RJidu9tFxpCvKyL44+3wyOdqhagDMo8HlotnHwNwnOg2io3/Xji1UeI8tTRB1KYIWG+Io6ZqlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIo2irFKxYE5NsQdnrB41DTQEK/x/ygUZjzHbTvzrB4=;
 b=xpu3ilI/jHuzg69b5aMWYLGIOXSgseWvmTaqLvZOiqTcNtHGD9C1ymUH9xP7yrA5hPU5VjpvJXjmtaY2hBkEqQ91Fvw1ha7foazyWEYdURN9nB+OTbTAC80H7fN9mocZnn3QBR7krIQ+IAvAJj4TcMR+s4wxbrbebQR2MTQHaAnOy4Rporjyk7YCoQAiBENwqY3QkAOTuqMhhmkzNs1dJUNQuJVxiQejOfyDRY4ndW/uo+4iCiMUfyTuxHk5IYq1k08jWq8Pc7kBXfd8EN0zAada5TIrldtfpmZK5v33iConHsSzxiIqsRL7UjFvK8zzkDj1nVHrqk3y1X/K8Xp+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIo2irFKxYE5NsQdnrB41DTQEK/x/ygUZjzHbTvzrB4=;
 b=ruq/eZIMMnHQyziorvAPRMTNJDUftR2PG+77j9RGk+ElhGXDZWK53igeBGAlvJaGld3Vxwe7249plnAMEnHwFlNUR+DDkR7/ZUd2aV4C25J19eQSnb8XldcnE+9/oHuvmJGEukYD+zDOOOAEoLpsY2jx1gBDlWlUsm9FyWsWy5A=
Received: from SA1P222CA0158.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::18)
 by DS4PPFD3DCE27BC.namprd19.prod.outlook.com (2603:10b6:f:fc00::a55) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 16:34:32 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::ff) by SA1P222CA0158.outlook.office365.com
 (2603:10b6:806:3c3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Thu,
 27 Nov 2025 16:34:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:34:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1576D406543;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 02E1182026C;
	Thu, 27 Nov 2025 16:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 1/7] ASoC: SDCA: Align mute controls to ALSA expectations
Date: Thu, 27 Nov 2025 16:34:20 +0000
Message-ID: <20251127163426.2500633-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
References: <20251127163426.2500633-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|DS4PPFD3DCE27BC:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 46db6879-1c41-44da-bf2a-08de2dd2d787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6+dUUJrEiMVQospBErpWLNSwrgLZBdWGKHgVyCN5hsG8iSkY3kPeNkf3aw5k?=
 =?us-ascii?Q?GOCqgfYkul7iBdaAqwp5alQC6MgSW0H2BQgzxJu9F0g+73JxaN4c086JcuMm?=
 =?us-ascii?Q?Dib/MKq1WNUDVjpChLP4iqzxihLiXYDXpVA/qjt7o8J70O/tLay1DFZshDcr?=
 =?us-ascii?Q?oVd83svoADjMAcB+HFkvgjq4gazTbkxGeUzdb/gjhlC2pGmRxrpDrAbslYhS?=
 =?us-ascii?Q?n7YwvmEqOEpsLSk5Oqb3R/+1wtep7h8mI0Vgm0iB7N5O441EXjZqvdSXaPeG?=
 =?us-ascii?Q?R5KCsdShA0ww6k5HDsLqlKenlEOUXNATZX1UrRL4QoXHzQiJLFymRhobA3Mh?=
 =?us-ascii?Q?oXQiMREDipRZedvvvvsZ8nDaxK3pCx7cXN7kwHqmJmDKTmqseNfdv4icw7k0?=
 =?us-ascii?Q?CLmP7XpjYoYplZUlDdT7SuU6vhjZboz/qslBVqW3cvTSEx+f0m5w+esDNmxH?=
 =?us-ascii?Q?TuxohbPLiNfiNleBG3JDe7RYo4huUgE0SRSNIc94lNJW/svHPThptKe0NRh6?=
 =?us-ascii?Q?W5+ZJo73b/0CW3L+BtO0r6usYCkVYgT8UTnU+G7bJ7PA/xeOdJ7Q/WMv1J8z?=
 =?us-ascii?Q?6PRPAUq0tqZdqIH5jKAvVJSIIynv8L3tuYmbNIiUaLJLHT3bYNK3ZUa6BeDa?=
 =?us-ascii?Q?u7f4AFrvI5PLEa9nHbTrdpAptl79XO67WKNobPfo6nnQhUoxNVwWhYNktCBT?=
 =?us-ascii?Q?VQAtOJtpR1UgMx0uJQXsPHxpCxnhPc0fXB7F2TMEpew6UigmuXgCs0T42Via?=
 =?us-ascii?Q?XOw8XC2Xzy9lpWL5oKvo0TPYTKkx0HgaWJInPHwsjtJjrscKyD8RUoZ08oYO?=
 =?us-ascii?Q?rnLUk61FlCPQMrFencybdSG7rkRagXn13geA6SJj3f/S1J+YNPqxuOHotUNA?=
 =?us-ascii?Q?CNLbAJ1Ipuitg07ET5y0xMtf/SfCpjMbjfrOmkUrroWenxl3MzMAQJNvZbsi?=
 =?us-ascii?Q?7HY32ZIP8xzZfXntMtiE4F81OQ8GRzHYOBmc7ePr3zR4hJ3h6a5BeJI8DeTE?=
 =?us-ascii?Q?xIkW15Brx5b+8z4/qWnz5jx5oPduXIUf3TZM+WBc3C7Y9JAY6jdSDdEzDgcS?=
 =?us-ascii?Q?tTePOodXJ2XndYm0JTkL8WXHPOfG8rsSR7raVZ4mL2AlkuxUr/mAm9qTnzJQ?=
 =?us-ascii?Q?qHf9ivC3WnytM/97hjdu0857iod34TKlkqjEuWGaRoTuxaZDuOVSV/Yf2sdV?=
 =?us-ascii?Q?HfnDFOmFajYpoNKqxtnifQGXcJ0/z2xDD88VlGPD4qtQRqyEyCKeXLUQosg4?=
 =?us-ascii?Q?oFT59xGpG9PR4ECJDC5CauyZnB400TJLS8k9ZZcHMWeEx0Pm8N3Yd6KYARb8?=
 =?us-ascii?Q?wUU+SxuNmVTHrAe3AqA8yc7o+YzyrZNVVNqLH2Mp2E5Xks04o/MvMnCdQXGj?=
 =?us-ascii?Q?LEqPZsc3JZh09xeJ6UyTPMaIeb6/JAxZHvf173qOIzEzWipZ9d4XtFjtxquE?=
 =?us-ascii?Q?3AZDu94xZwB7rjAb1as98qSmjgVNFX+03SxYILd1Ear0fm8Uy13pY+e1AVb3?=
 =?us-ascii?Q?ecbN2tmjT189zrZyPiSCjwuVym/ZZmQjmJZRU7mukCIBbFetpCspaQzlWk2U?=
 =?us-ascii?Q?FZQsi/OZ+dZ8Qmp94Xk=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:34:31.2813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46db6879-1c41-44da-bf2a-08de2dd2d787
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFD3DCE27BC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEyMyBTYWx0ZWRfX6MtSUnXXBLdC
 2divqLjOylgIGru5wLdmYVALZ/oXuUC9KAAjaSffqUt882ZdHK30i0NnqNS71jvBlUD4mb6juVL
 rdaIm07s8phVCaFeOBk3Mek6EQPs67Sf6n5NreqSOuIOhrapGVmkW5YFgqgDJROeuFP5gXdCbx2
 PWnOdOMoaCmNCyHWxujUcccg151RiJ1dpK1ZQpA42j3AN1DEF+5OjXehSXag00axDpLNQ+SHlOi
 twfizOhgW9WD5cuecAfJAbB6MIlkdD35oZkUrt4nBqiFQICKdcJdppEMINTqjx4h/QDgaWt7+A/
 2JSXI97S64sDh7WGbb8kz9F+pKCTYEKvVJZ6cfR5mzDG50IC3OLK97Fl6W5Xg2rCx6XixDxLQdY
 OfBjz9GgKlgZFRFr0ljdphzH5sT2pQ==
X-Proofpoint-GUID: mViqUuH4Vdxi3tQ9Rott8XN6zQx2F2SQ
X-Proofpoint-ORIG-GUID: mViqUuH4Vdxi3tQ9Rott8XN6zQx2F2SQ
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=69287d9b cx=c_pps
 a=YgmEgYFPUO0vKsAsXG+6iA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=KnBv9hxWgsMqdMZwMHgA:9
X-Proofpoint-Spam-Reason: safe

Currently mute controls will be called "FU xx Mute Switch" (note
the switch is added programmatically outside the coverage of this
patch) and the accompanying volume control would be called "FU xx
Channel Volume".  These names are taken from the SDCA specification,
however, this does not mesh well with the ALSA naming system. ALSA
generally expects enables rather than mutes and expects that mutes
and volumes have matching names.

Update the names and invert the mute controls to make them more
standard "FU XX Channel Switch", this does slightly deviate from
the SDCA specification but it makes the rest of the Linux ecosystem
a lot happier.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca_function.h | 2 +-
 sound/soc/sdca/sdca_asoc.c    | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index c97861508a158..2564fad33fd46 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -611,7 +611,7 @@ enum sdca_entity0_controls {
 #define SDCA_CTL_NDAI_PACKETTYPE_NAME			"NDAI Packet Type"
 #define SDCA_CTL_MIXER_NAME				"Mixer"
 #define SDCA_CTL_SELECTOR_NAME				"Selector"
-#define SDCA_CTL_MUTE_NAME				"Mute"
+#define SDCA_CTL_MUTE_NAME				"Channel"
 #define SDCA_CTL_CHANNEL_VOLUME_NAME			"Channel Volume"
 #define SDCA_CTL_AGC_NAME				"AGC"
 #define SDCA_CTL_BASS_BOOST_NAME			"Bass Boost"
diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 4e3f193c75eff..0e21ed1091720 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -886,6 +886,9 @@ static int populate_control(struct device *dev,
 	mc->min = 0;
 	mc->max = clamp((0x1ull << control->nbits) - 1, 0, type_max(mc->max));
 
+	if (SDCA_CTL_TYPE(entity->type, control->sel) == SDCA_CTL_TYPE_S(FU, MUTE))
+		mc->invert = true;
+
 	(*kctl)->name = control_name;
 	(*kctl)->private_value = (unsigned long)mc;
 	(*kctl)->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-- 
2.47.3

