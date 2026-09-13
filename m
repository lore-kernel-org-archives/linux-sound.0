Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193611DD0EF
	for <linux-sound@vger.kernel.org>; Sun, 13 Sep 2026 02:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789267783; cv=fail; b=c4jF8bJGjxfiWA1T0RLQxUDvTgWiIMPjdQFw3+5Q0koZliOvwewl0tyAqr+sXC3xXF3InwXqnClHxDzylwo3hcF4dvsvvF3QiBK/Dd6P+pVqBb2J+I7flDMbXregHdwpwzmE5aXTKzHY38LWqrXtrEsPbtIfsVgh0ZPAIqUKSxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789267783; c=relaxed/simple;
	bh=LKJGbAFJ3J5c9KXKvGjESvuyrbqEXucGW1fLY5J6Tks=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FHdYFIdhyywRr/KWhZDHrO0Ijx/2n1dpGxDADh7jD7cHQ/XXpUS1bsmaHarNFL/Hzs5m2T6N7mgVkkOTNpNKCWiOBU8tdQvfsGqH7u8YsALiWT1y5fLSLbdmwfiCfNWG3C9aYGYfJVG194IS/0A6wldCc6GCweHc0d7gM7+Vcss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bRBE86Sy; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=dZ4cRSPa; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bRBE86Sy";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="dZ4cRSPa"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68D16Qnl1601988;
	Sat, 12 Sep 2026 21:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=mZ0+uAPYVPQDf
	6wRJvrAW96adHybQXrpVeDo8eI8blA=; b=bRBE86SyywlFyiZYTQSyCtoMOj8eG
	6bmgUDOoyUp2Vdf7b/nLo4ErALQp1lO2lXJHJbXQ5ix5D/8ZdCGSikonjU06VRhN
	MDjq1wBpZfRS1fsz3aOAxRkVVt+X97b6M9mQp6qGQ1+p6mzuOBAAgAHlYY5kVA2l
	oTH/hypsG38T5sktkxmHwm8ogjaJPONtPgPH1oNjIaU0NGsOe7Jv7auSt3RXD0fe
	AsAO/u+Jx6lK7fTfK30kyrvNqM1XpSoyK2mY4o9SOHbRbt4xyWKPDsii+pWpnd9O
	Z8o/6sB0EkiN3ovrN1cSEBmp+hdZjIvSMUtZUhmniREdZ9tPUm/RSlB0Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012025.outbound.protection.outlook.com [52.101.43.25])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gmy5dbxrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 21:49:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DVRd3SW8Z0pVZWr3y/lpYskGBOJy3LUM9Etrzk5i1ZlKKCeMaybPC0zC+ToAo5vD2CL71xR0r9G55keaLWX6rzTGNIaIg147w/dr0zUmLxlCSta/DNwr+gjzUn8HL8TUXOvG2yK6qXKoX55DczzNZii4OCXaK6STHWS1KB+6niiA8L4QxQR4A4pQoH/Z6WC751n4rAX/U1lH81LSIhcir3XcwOTkGGGQMgEBookiOILBxZru+UrsKtbziRJT6RP8b3ehvqWVdzElCJh7yxaQa+4ZtH6coL6TcQ/61brzsxTIZ5Fo/3dGWGo6AlOPN6Kk2t2IuArfVd25m/4ilc/RlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZ0+uAPYVPQDf6wRJvrAW96adHybQXrpVeDo8eI8blA=;
 b=GzozF1NdsEhM4WfVoUZrum4mQRYJQX8ws/aQqGigtCmVnXgW/DxpFeDdR3bNtGa7EYei9u3RuAr6o9IuCwELzuRsn8gqg1pneabXng9JepGc2gEI3JXco5sFa+pl/HPO71euhMjPZpmZplWFmpZ5ri+BeiHJfCZ4UQOWcjZPTk8ml51mFQDFaV0V5ap8WIqMNY8OEi3Gk0A+H11bhrRADYOhTrhq+V5BakHCvR2KwQgR5IlL8SdesiQO4oyNL80ycZtMARlKJKBb2ADis3aUdv2/cwaGzDFaSDhKTaN3VrrfEj2K9b4nhkwpLsLI8VnlvgSDzm2ncVIUSwFeJB6h6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZ0+uAPYVPQDf6wRJvrAW96adHybQXrpVeDo8eI8blA=;
 b=dZ4cRSPaLuf4qYJLzvcHgBtjOV6JUkaaBrzeX0WGsIp2HDx1Zho2zH1fxti9RB9ipL5c/D8hYxZakCtfvd34+wUYln4lAgQdse9jJ20TBQTeCIOf2ScDmyNhwD9r7Y0rbDLVybtvIOYPVN5vs3e2e8GUCp320jakJuHbu1QHuT4=
Received: from BN9PR03CA0087.namprd03.prod.outlook.com (2603:10b6:408:fc::32)
 by SJ2PR10MB7860.namprd10.prod.outlook.com (2603:10b6:a03:574::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Sun, 13 Sep
 2026 02:49:06 +0000
Received: from BN2PEPF0000A804.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::d) by BN9PR03CA0087.outlook.office365.com
 (2603:10b6:408:fc::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Sun, 13
 Sep 2026 02:49:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A804.mail.protection.outlook.com (10.167.245.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sun, 13 Sep 2026 02:49:04 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 21:49:01 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 21:49:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 12 Sep 2026 21:49:01 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.162.116])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68D2mvDj2875308;
	Sat, 12 Sep 2026 21:48:58 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ASoC: tas2781: Add TAS2573 calibration support
Date: Sun, 13 Sep 2026 10:48:53 +0800
Message-ID: <20260913024853.1439-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A804:EE_|SJ2PR10MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8b75f3-3b13-40a0-5f02-08df1141932b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|3023799007|56012099006|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PnUBMSmHcR1a+oiCW611uhFy5ksEorxeXP3ypTvZhK23canU+v1ynG5pZa1rvMVKelZcLuPNzw/KRs5d124YMGn40CfPh4lYDinLgz+AGbE5PWbB65dr+qhnxfXg67xShO0jKw4/GjbopKJtOrZSK+u0tgxs0puBieaCZBZYHE3KFjPCTnvlxP0gooTD+P7HR7RT8cVdb3YTrt+c2uaWMdyrCpjiNAxUbh4ZzLE+eZnRIAIuAeW2dEbl6QuuhT91+qSI2yhr4JTCqH+hbhO4h4Jfohe4ak2ooU7H/exWIuwQPSr5jNXpRbarVRvhx5HfX40fNA5qCu0VsVc1HvQTWcWfgsx3XHzqtwUzh6BjrrZjws32ZX//SnQyHXuYnJibRgTFPzxrQF5o8dE8UteJcynkKaju9Ogi2ndvvu4c6GzLR95ieTHiywIq5/GMJ5eBzsCx/pDO0stKdm+O1TNgfKfs50ieL+K6exZmPvZTUUpkfOohNacLBDD6bAHUQ3HJpqoSWIP5EYrEjana8Ag61iSg9WOvTHW/x232CSn85ELWiPlzlpNRYF2fF5NMxl3QtXapeIXEOP101snxyRiCUt4ekUvsA11Pf46tZlMN4YINx/nQrhG0gUIBKj1X6SoAWJr67qVTqMZ3sNCFhlSoUsGXSxWLSBDO4titD0cp5J8YeS5xpgsNDh3Xv8kggX6Z/vKvSMgVhQGS9H7OR0UjeQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(3023799007)(56012099006)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cGpUrgRoqrOxvEpEKbfMm/N4OetZP8bye8WcJikUor3wWuGQ0jYv0BWGHMMq9EvBkPBFIM9eBMED4+1KliHqo+ac7ZBV/Duk/bVCGhvpwm2OOuiBHBmB1FW5ZYoOpSXRU020ZpdqZ3FjMq+OJNRdiYE7DjyJ35Z92Sbk26mw4rUoGehD0V/w+SYq0dmtFUxb63JVnW+4M6chX6TRZ9vR3ERrrtlSYjLdcRWz7LNGc/8QR/YAGiPwg+BXnff5f6HzzZ5C8Zd4Fh0rsfTm5Q6l1/ra1QS+d8YOTI/acL/61UK6o8RgWTo9sL4qBO3EnKfaupv++peRpsIUl+4qA++iWe+RSly1RAAEw5bwpsW0Lt4dJlC0KFp6cvmXiGU5VcuyPKxtuWXUHtvZg5CeIRMCOWg+vE8RTen4CrKGkyjgo3YcSyl8NFMhd9w7f80mjjXC
X-Exchange-RoutingPolicyChecked:
	tlfWv8q/3HbsiVND7X13qXvR+2DH/7dbDgIJ2TuO7gpu3p4Xo+8PcpMMYBZaHDO2Us6bqX1C4MCvZu8iDO3LOgC9CyKzpf+PMWl345IVipkc4pO9Y1ccFr8Ha99zPRKxx/ss6I/8Gd2X7aLbd0yEwfVVkY/Flxmg89hNXpo6m6XREhwwv9Px7jRBiwGvD2T/9gAgXe5MXNE7WDTOZHwIrVtoj5UJRYDVr4ZCn4y9HAKLp2mY2OFrNYJ+D0lL5d8pyRYpLnIQpKNj6pzpAxCMP5DbIDxq9gegAdDKbrLDtY1+NtybqgAi1+y1OF2sYrmVpWRfMEfOxjwGVj1PeP55uQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 02:49:04.8357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8b75f3-3b13-40a0-5f02-08df1141932b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A804.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7860
X-Authority-Analysis: v=2.4 cv=XPal2ghE c=1 sm=1 tr=0 ts=6aa60f28 cx=c_pps
 a=U89Fr+s++Oy0xugnv2TZpA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=WlDOkKGEtCk3-_J7iOUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDAzNCBTYWx0ZWRfX2puvQMt1Gj4q
 Z4NoVeFkgtC85ZaSlxQhfhsZ8yTBBNtxrfCuwa3HkiSq9h7k8GTmI6OlNvaZFTRL1pBsKwI7GxM
 13NIYZo/lwSzfkrtt+n38nVjf7bE9tHlhiV8xKQ3zdRjji9w/zN43fkXBojf1bTLNPqYTWM55y9
 ROI0c1hUsGbuchkAsKLnCyHSomuyfw6JT96KCmEimu4PGt8rCiQZPuhvXEtfWK8DxLJGw0G3mAD
 maf+DxvJ5hYtV0y3jWcsz5eLrJY9OoQjQgMLsyP6Kxs0qLOpD/Zu0gmg6eUMB8HBNw+IoxLifB9
 mK+Lj1cn0q5R5JfgNfbeWtMjnWXROrpwuRNlY0XhQhaF8Fd/uwpjfK8CIDKe/VZFx92AFNE1d0H
 UmVN4Y433DOaa1R5P+YYfqmP4C/aMDbtFfh01gJ6jkWN6UjQJ638vTZzPBshbg8XMRoneWgnwoF
 T+k0Yi3c9J9W8EkdJ3A==
X-Proofpoint-GUID: sdswxdb13jHC0rPB4pwODB_Hb8Gp_RDg
X-Proofpoint-ORIG-GUID: sdswxdb13jHC0rPB4pwODB_Hb8Gp_RDg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDAzNCBTYWx0ZWRfX9dpTCOLRkYNH
 scIkWtT2C5H2biTUstRRnzRrzSUcp+lZJepLc6ep8lkkjgunYX8lBOovytiMtyBJtqGKZ2aSzA+
 ncoffvML3wOEedm0/JACqIb9NUSZCOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_01,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130034

This patch adds complete calibration workflow support for TAS2573.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Add comments for tasdevice_rca::calibration_profile_id, which is primarily designed for speaker
   calibration scenarios with special requirements. For use cases without specific calibration
   demands, it can directly reuse the standard music playback configuration, and its default value
   is set to 0.
 - Correct some logs.
 - Use proper kernel error code and WARN_ON_ONCE in the tas2573 calib_start_put control.
v1:
 - Add TAS2573 dedicated calibration register definitions
 - Extend firmware parser to auto detect and store "calib" tagged profile and config IDs
 - Implement TAS2573 calibration start/stop control handlers
 - Add dedicated kcontrols for real-time speaker impedance readout and full calibration status dump
 - Refactor calibration control creation logic with per-chip switch-case branches for better scalability
 - Extend firmware ready check to register TAS2573 calibration controls properly.
---
 include/sound/tas2781-dsp.h       |   8 +
 include/sound/tas2781.h           |  24 +++
 sound/soc/codecs/tas2781-fmwlib.c |  35 +++-
 sound/soc/codecs/tas2781-i2c.c    | 318 +++++++++++++++++++++++++++---
 4 files changed, 357 insertions(+), 28 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index de087f4ca13f..00fcd0a44e10 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -146,6 +146,7 @@ struct tasdevice_fw {
 	struct tasdevice_calibration *calibrations;
 	struct fct_param_address fct_par_addr;
 	struct device *dev;
+	int calibration_config_id;
 };
 
 enum tasdevice_fw_state {
@@ -210,6 +211,13 @@ struct tasdevice_rca {
 	 * capture.
 	 */
 	int capture_profile_id;
+	/*
+	 * Primarily designed for speaker calibration scenarios with special
+	 * requirements. For use cases without specific calibration demands, it
+	 * can directly reuse the standard music playback configuration, and
+	 * its default value is set to 0.
+	 */
+	int calibration_profile_id;
 	/*
 	 * Since version 0x105, the keyword 'init' was introduced into the
 	 * profile, which is used for chip initialization, particularly to
diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index b763da613769..7367c76959aa 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -91,6 +91,30 @@
 /* prm_TE_1_Beta1 */
 #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
 
+#define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
+/* YM57 */
+#define TAS2573_FCT_OUTPUT_R0		TASDEVICE_REG(0x00, 0x65, 0x74)
+/* YM58 */
+#define TAS2573_FCT_OUTPUT_R0_LOW	TASDEVICE_REG(0x00, 0x65, 0x78)
+/* YM59 */
+#define TAS2573_FCT_OUTPUT_INV_R0	TASDEVICE_REG(0x00, 0x65, 0x7C)
+/* YM61 */
+#define TAS2573_FCT_OUTPUT_POWERTOT	TASDEVICE_REG(0x00, 0x66, 0x0C)
+/* YM64 */
+#define TAS2573_FCT_OUTPUT_F0		TASDEVICE_REG(0x00, 0x65, 0x18)
+/* YM147 */
+#define TAS2573_FCT_STATUS_CTRL		TASDEVICE_REG(0x00, 0x68, 0x74)
+/* YM148 */
+#define TAS2573_FCT_STATUS_BINNING	TASDEVICE_REG(0x00, 0x68, 0x78)
+/* YM664 */
+#define TAS2573_RE_OUT			TASDEVICE_REG(0x00, 0x7A, 0x18)
+/* YM952 */
+#define TAS2573_SILENCE_DETECTED	TASDEVICE_REG(0x00, 0x83, 0x60)
+/* YM954 */
+#define TAS2573_OPEN_CIRCUIT		TASDEVICE_REG(0x00, 0x83, 0x68)
+/* YM955 */
+#define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
+
 #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
 #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
 #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index dc1c552206f8..b3a92da7fb41 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -199,15 +199,22 @@ static struct tasdevice_config_info *tasdevice_add_config(
 			dev_err(tas_priv->dev, "add conf: Out of boundary\n");
 			goto out;
 		}
-		/* If in the RCA bin file are several profiles with the
-		 * keyword "init", init_profile_id only store the last
-		 * init profile id.
+		/*
+		 * If in the RCA bin file are several profiles with the
+		 * keyword "init"/"calib", init_profile_id only store the last
+		 * init profile id, and same as calibration_profile_id.
 		 */
 		if (strnstr(&config_data[config_offset], "init", 64)) {
 			tas_priv->rcabin.init_profile_id =
 				tas_priv->rcabin.ncfgs - 1;
 			dev_dbg(tas_priv->dev, "%s: init profile id = %d\n",
 				__func__, tas_priv->rcabin.init_profile_id);
+		} else if (strnstr(&config_data[config_offset], "calib", 64)) {
+			tas_priv->rcabin.calibration_profile_id =
+				tas_priv->rcabin.ncfgs - 1;
+			dev_dbg(tas_priv->dev, "%s: calib profile id = %d\n",
+				__func__,
+				tas_priv->rcabin.calibration_profile_id);
 		}
 		config_offset += 64;
 	}
@@ -632,6 +639,17 @@ static int fw_parse_configuration_data_kernel(
 			goto out;
 		}
 		memcpy(config->name, &data[offset], 64);
+
+		/*
+		 * If in the coef bin file are several configs with the
+		 * keyword "calib", calibration_config_id only store the last
+		 * calibration profile id.
+		 */
+		if (strnstr(config->name, "calib", 64)) {
+			tas_fmw->calibration_config_id = i;
+			dev_dbg(tas_priv->dev, "%s: calib cofig = %d\n",
+				__func__, tas_fmw->calibration_config_id);
+		}
 		/*skip extra 16 bytes*/
 		offset += 80;
 
@@ -1412,6 +1430,17 @@ static int fw_parse_configuration_data(
 		memcpy(config->name, &data[offset], 64);
 		offset += 64;
 
+		/*
+		 * If in the coef bin file are several configs with the
+		 * keyword "calib", calibration_config_id only store the last
+		 * calibration profile id.
+		 */
+		if (strnstr(config->name, "calib", 64)) {
+			tas_fmw->calibration_config_id = i;
+			dev_dbg(tas_priv->dev, "%s: calib cofig id = %d\n",
+				__func__, tas_fmw->calibration_config_id);
+		}
+
 		n = tasdevice_fw_strnlen(fmw, offset);
 		if (n < 0) {
 			dev_err(tas_priv->dev, "Description err\n");
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 6f349f88f194..5f6fd8a73899 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -613,6 +613,37 @@ static void tas2563_calib_stop_put(struct tasdevice_priv *tas_priv)
 	}
 }
 
+static void tas2573_calib_stop_put(struct tasdevice_priv *tas_priv)
+{
+	int cal_prof_id = tas_priv->rcabin.calibration_profile_id;
+
+	tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+		TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
+}
+
+static int tas2573_calib_start_put(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(comp);
+	int cal_prof_id = tas_priv->rcabin.calibration_profile_id;
+	int cal_conf_id = tas_priv->fmw->calibration_config_id;
+
+	guard(mutex)(&tas_priv->codec_lock);
+	if (tas_priv->chip_id != TAS2573) {
+		WARN_ON_ONCE(1);
+		return -ENODEV;
+	}
+
+	tasdevice_select_cfg_blk(tas_priv, cal_prof_id,
+			TASDEVICE_BIN_BLK_PRE_POWER_UP);
+
+	tasdevice_select_tuningprm_cfg(tas_priv, tas_priv->cur_prog,
+		cal_conf_id, cal_prof_id);
+
+	return 1;
+}
+
 static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -621,10 +652,22 @@ static int tasdev_calib_stop_put(struct snd_kcontrol *kcontrol,
 	int i;
 
 	guard(mutex)(&priv->codec_lock);
-	if (priv->chip_id == TAS2563)
+
+	switch (priv->chip_id) {
+	case TAS2563:
 		tas2563_calib_stop_put(priv);
-	else
+		break;
+	case TAS2573:
+		tas2573_calib_stop_put(priv);
+		break;
+	case TAS2781:
 		tas2781_calib_stop_put(priv);
+		break;
+	default:
+		dev_err(priv->dev, "%s: Chip(%d) unsupports calibration\n",
+			__func__, priv->chip_id);
+		return -1;
+	}
 
 	/*
 	 * Set reloading-firmware flag after calibration, the flag will work
@@ -983,6 +1026,13 @@ static const struct snd_kcontrol_new tas2563_cali_controls[] = {
 		tasdev_nop_get, tas2563_calib_start_put),
 };
 
+static const struct snd_kcontrol_new tas2573_cali_controls[] = {
+	SOC_SINGLE_EXT("Calibration Start", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tas2573_calib_start_put),
+	SOC_SINGLE_EXT("Calibration Stop", SND_SOC_NOPM, 0, 1, 0,
+		tasdev_nop_get, tasdev_calib_stop_put),
+};
+
 static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
@@ -1493,6 +1543,182 @@ static int create_tas2781_cali_start_ktrl(struct tasdevice_priv
 	return 0;
 }
 
+static int tas2573_re_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	unsigned char *dst = ucontrol->value.bytes.data;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned int i = 0;
+	unsigned int j;
+	int rc;
+
+	guard(mutex)(&priv->codec_lock);
+	dst[i++] = bytes_ext->max;
+	dst[i++] = 'r';
+
+	dst[i++] = TASDEVICE_BOOK_ID(TAS2573_RE_OUT);
+	dst[i++] = TASDEVICE_PAGE_ID(TAS2573_RE_OUT);
+	dst[i++] = TASDEVICE_PAGE_REG(TAS2573_RE_OUT);
+
+	dst[i++] = 'D';
+
+	for (j = 0; j < priv->ndev; j++) {
+		dst[i++] = j;
+
+		rc = tasdevice_dev_bulk_read(priv, j, TAS2573_RE_OUT,
+			&dst[i], 4);
+		if (rc < 0)
+			dev_err(priv->dev, "chn %d bulk_rd err = %d\n", j, rc);
+
+		i += 4;
+	}
+
+	return 0;
+}
+
+static int tas2573_calib_status_get(struct snd_kcontrol *kcontrol,
+	struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *priv = snd_soc_component_get_drvdata(comp);
+	unsigned char *dst = ucontrol->value.bytes.data;
+	struct soc_bytes_ext *bytes_ext =
+		(struct soc_bytes_ext *) kcontrol->private_value;
+	unsigned int fct_status_regs[] = {
+		TAS2573_FCT_INT_LATCH,
+		TAS2573_FCT_STATUS_CTRL,
+		TAS2573_FCT_STATUS_BINNING,
+		TAS2573_SILENCE_DETECTED,
+		TAS2573_OPEN_CIRCUIT,
+		TAS2573_SHORTCKT,
+		TAS2573_FCT_OUTPUT_R0,
+		TAS2573_FCT_OUTPUT_R0_LOW,
+		TAS2573_FCT_OUTPUT_INV_R0,
+		TAS2573_FCT_OUTPUT_POWERTOT,
+		TAS2573_FCT_OUTPUT_F0,
+		TAS2573_RE_OUT,
+	};
+	unsigned int j, k, val;
+	unsigned int i = 0;
+	int rc;
+
+	guard(mutex)(&priv->codec_lock);
+	dst[i++] = bytes_ext->max;
+	dst[i++] = 'r';
+
+	for (j = 0; j < ARRAY_SIZE(fct_status_regs); j++) {
+		dst[i++] = TASDEVICE_BOOK_ID(fct_status_regs[j]);
+		dst[i++] = TASDEVICE_PAGE_ID(fct_status_regs[j]);
+		dst[i++] = TASDEVICE_PAGE_REG(fct_status_regs[j]);
+	}
+	dst[i++] = 'D';
+
+	for (j = 0; j < priv->ndev; j++) {
+		dst[i++] = j;
+		dst[i++] = 0;
+		dst[i++] = 0;
+		dst[i++] = 0;
+
+		rc = tasdevice_dev_read(priv, j, fct_status_regs[0], &val);
+		if (rc < 0)
+			dev_err(priv->dev,
+				"chn %d fct_status_regs[0] rd err = %d\n",
+				j, rc);
+		else
+			dst[i++] = val;
+
+		for (k = 1; k < ARRAY_SIZE(fct_status_regs); k++, i += 4) {
+			rc = tasdevice_dev_bulk_read(priv, j,
+				fct_status_regs[k], &dst[i], 4);
+			if (rc < 0) {
+				dev_err(priv->dev,
+					"chn %d regs[%u] bulk_rd err = %d\n",
+					j, k, rc);
+			}
+		}
+
+	}
+
+	return 0;
+}
+
+static int create_tas2573_cali_status_ktrl(struct tasdevice_priv
+	*priv, struct snd_kcontrol_new *cali_ctrl)
+{
+	struct soc_bytes_ext *ext_cali_start;
+	char *cali_start_name;
+
+	ext_cali_start = devm_kzalloc(priv->dev,
+		sizeof(*ext_cali_start), GFP_KERNEL);
+	if (!ext_cali_start)
+		return -ENOMEM;
+
+	cali_start_name = devm_kstrdup(priv->dev,
+		"Calibration Status", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2573 fct status:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for fct status (total 36 bytes)
+	 *	Data Start Flag (1 byte, constant 'D')
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (48 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 39 + priv->ndev * 49;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = NULL;
+	cali_ctrl->get = tas2573_calib_status_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
+
+	return 0;
+}
+
+static int create_tas2573_cali_re_ktrl(struct tasdevice_priv
+	*priv, struct snd_kcontrol_new *cali_ctrl)
+{
+	struct soc_bytes_ext *ext_cali_start;
+	char *cali_start_name;
+
+	ext_cali_start = devm_kzalloc(priv->dev,
+		sizeof(*ext_cali_start), GFP_KERNEL);
+	if (!ext_cali_start)
+		return -ENOMEM;
+
+	cali_start_name = devm_kstrdup(priv->dev,
+		"Real-time Speaker Impedance", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2573 real-time spk impedance:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for fct status (total 3 bytes)
+	 *	Data Start Flag (1 byte, constant 'D')
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (4 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 6 + priv->ndev * 5;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = NULL;
+	cali_ctrl->get = tas2573_re_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
+
+	return 0;
+}
+
 static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 {
 	struct calidata *cali_data = &priv->cali_data;
@@ -1504,17 +1730,43 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	char *cali_name;
 	int rc, i;
 
-	rc = snd_soc_add_component_controls(priv->codec,
-		tasdevice_cali_controls, ARRAY_SIZE(tasdevice_cali_controls));
-	if (rc < 0) {
-		dev_err(priv->dev, "%s: Add cali controls err rc = %d",
-			__func__, rc);
-		return rc;
+	switch (priv->chip_id) {
+	case TAS2563: {
+		rc = snd_soc_add_component_controls(priv->codec,
+			tasdevice_cali_controls,
+			ARRAY_SIZE(tasdevice_cali_controls));
+		if (rc < 0) {
+			dev_err(priv->dev, "%s: Add cali controls err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
+		nctrls = ARRAY_SIZE(tas2563_cali_controls);
+		for (i = 0; i < priv->ndev; i++) {
+			tasdev[i].cali_data_backup =
+				kmemdup(tas2563_cali_start_reg,
+				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
+			if (!tasdev[i].cali_data_backup)
+				return -ENOMEM;
+		}
 	}
-
-	if (priv->chip_id == TAS2781) {
+		break;
+	case TAS2573:
+		cali_ctrls = (struct snd_kcontrol_new *)tas2573_cali_controls;
+		nctrls = ARRAY_SIZE(tas2573_cali_controls);
+		break;
+	case TAS2781: {
 		struct fct_param_address *t = &(fmw->fct_par_addr);
 
+		rc = snd_soc_add_component_controls(priv->codec,
+			tasdevice_cali_controls,
+			ARRAY_SIZE(tasdevice_cali_controls));
+		if (rc < 0) {
+			dev_err(priv->dev, "%s: Add cali controls err rc = %d",
+				__func__, rc);
+			return rc;
+		}
+
 		cali_ctrls = (struct snd_kcontrol_new *)tas2781_cali_controls;
 		nctrls = ARRAY_SIZE(tas2781_cali_controls);
 		for (i = 0; i < priv->ndev; i++) {
@@ -1533,16 +1785,12 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 				}
 			}
 		}
-	} else {
-		cali_ctrls = (struct snd_kcontrol_new *)tas2563_cali_controls;
-		nctrls = ARRAY_SIZE(tas2563_cali_controls);
-		for (i = 0; i < priv->ndev; i++) {
-			tasdev[i].cali_data_backup =
-				kmemdup(tas2563_cali_start_reg,
-				sizeof(tas2563_cali_start_reg), GFP_KERNEL);
-			if (!tasdev[i].cali_data_backup)
-				return -ENOMEM;
-		}
+	}
+		break;
+	default:
+		dev_err(priv->dev, "%s: Wrong chip id = %d", __func__,
+			priv->chip_id);
+		return -EINVAL;
 	}
 
 	rc = snd_soc_add_component_controls(priv->codec, cali_ctrls, nctrls);
@@ -1554,10 +1802,17 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 
 	/* index for cali_ctrls */
 	i = 0;
-	if (priv->chip_id == TAS2781)
+	switch (priv->chip_id) {
+	case TAS2573:
+		nctrls = 3;
+		break;
+	case TAS2781:
 		nctrls = 2;
-	else
+		break;
+	default:
 		nctrls = 1;
+		break;
+	}
 
 	/*
 	 * Alloc kcontrol via devm_kzalloc(), which don't manually
@@ -1610,12 +1865,24 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	 * it, for the default value is 0, which means the first device.
 	 */
 	cali_data->data[0] = 0xff;
-	if (priv->chip_id == TAS2781) {
+
+	switch (priv->chip_id) {
+	case TAS2573:
+		rc = create_tas2573_cali_status_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
+		i++;
+		rc = create_tas2573_cali_re_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
+		i++;
+		break;
+	case TAS2781:
 		rc = create_tas2781_cali_start_ktrl(priv, &cali_ctrls[i]);
 		if (rc != 0)
 			return rc;
 		i++;
-
+		break;
 	}
 
 	return snd_soc_add_component_controls(priv->codec, cali_ctrls,
@@ -1822,7 +2089,8 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 	/* There is no calibration required for TAS58XX. */
-	if (tas_priv->chip_id == TAS2563 || tas_priv->chip_id == TAS2781) {
+	if (tas_priv->chip_id == TAS2563 || tas_priv->chip_id == TAS2573 ||
+		tas_priv->chip_id == TAS2781) {
 		ret = tasdevice_create_cali_ctrls(tas_priv);
 		if (ret) {
 			dev_err(tas_priv->dev, "cali controls error\n");
-- 
2.43.0

