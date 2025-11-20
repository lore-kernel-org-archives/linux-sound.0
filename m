Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA7B36FC42
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652661; cv=fail; b=FzwsxH7GzAlqNX++gEv0eA/HDsmSIi2M4qdQf/egKinEJJrVvzCdU4O75K8EBDB/joPJaqpTugOVUTyPezu9EJLjnXwG+k4Km/RycvPBYR25ot5kIb1/OZXaYgwz4/rioFz6BJjXMJi5Jb0/nexH/+iBo0AcnCzU1gtgy+V7DSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652661; c=relaxed/simple;
	bh=NMFKqdBdUFiAWFsf6iFyfFNye1WMcATsfyzvzAMCylw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PA6Ve6AQzhbz4w/zcy4dvI6zntCBiu98nwOwweK0IK0Y5EHd2CKk7mgzHpBXK5qS2liYfBP/xHqh+7ZskCEmvhXp09V05q/+PlTl5y3Myc40j39rZ7uQXnHKC3ouXR8b2dyO4CfITPmXbw5qt7MG/38rKxAK1Bh9aVy2jXambyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=gW7u5j+A; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=D0kzuVJd; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="gW7u5j+A";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="D0kzuVJd"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK609eW460858;
	Thu, 20 Nov 2025 09:30:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/0gZKMVYGiqvj4jUPBO2D8Bcg7y2YoqVwcdoR5cRLK8=; b=
	gW7u5j+A82/wZo36lP+Btm5JOzyEbaY4E1x4EGI6NxQu7KAr4KGOc1aYTW2t1okx
	MO9Ao6dLRT5hzH9zWbaieoAwZn9ton9R9O8mT3PyGPvexGeRXb5pgmLzWA9t04Pf
	EQS8S0xuHNDM9w1CB+2yVzdW0e2wlQIppdQvfChqpVoKhyR2doekHtaDb954lxKY
	s9pgm7E9ZBicY/jyLuEezUt8smn4eZ+4x90fQs7z4UWehTExV8ughqMz7vFkPzU5
	VubiBNNDuRNFV90XHuXqR68jUczV3/SW8jF6QnMO1jVcBzVWesBJJk1Y3CA5yMsa
	ood1T3/I0gW4ZRveK2rnxg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020115.outbound.protection.outlook.com [52.101.193.115])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4aeqt1enjg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylux9hKB4jiD8ieUW75liHWlGIhTZV/D+dMPNA/+EyNt3OSxdnebDlLpglmFbvQFk+QG0YO2nDtK8uEoyNHJWPjc8jMTqZv4KpzwxRHmfZzSO0qjuc46qZJQqkD2yLk0XkovfaqFNo0l1rWVtCY9KN32ODKbLnnX8W1IJ8xQm9GbEnlM5tUBE3kjKr5FMiq+WcNI9q1Von/XvLKYuQ+OB6M1gXPpLCrw5TfvmUjjMKNtFAiOxpNWY2QJX+YfTKNLo5/XSVxgW8ZGnpH2ZDA+WcBTZuKn39PxiXrmdA3AWFvf5oi6w36xODWUvHtSzgLTHZpxGCPDNl4S/cF/Gj8Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0gZKMVYGiqvj4jUPBO2D8Bcg7y2YoqVwcdoR5cRLK8=;
 b=caacVsIu7zZ9qAoQma+BFHUWg5JcVwCKUwN/asCcVrQP4++0YOnCeM4UegUZREs07r6O1nfHKV/onFrHUNnvHW4nCahGZaimtsY+yvg5fsgcHrQslwTUYblR1weUV3mE/8BEevXrRMXIZcAPoLOaxpgu2EKWNYk1OpyvGO3DiJDQH98lg+Z0VYNk9qsQYy9+TlOfnoIpDv24BqFhGj9XwR+9FB4WQ9IB1uUhbGKHcajijmqlAzRox2oIl6GprhKSe37fv3GzPqDOjmQaASN8o4ayN+AQj+jkHWpF2zyafwZMVPkyRdtlTrkcjjboYBxbL9k+nQUjq9P0HDTg3TOlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0gZKMVYGiqvj4jUPBO2D8Bcg7y2YoqVwcdoR5cRLK8=;
 b=D0kzuVJd7n65Hy319z1OLSd5ZW0Mb2VuEOTkUY52FbmyO0vmQl8S9JuPrT4RIvCT4mQUUmoXkHQjKUn+/up4ot2DdeWZW+YHgRrZQ0Z4Vhto8fvEzcvXouWgTRbyPPgD1dlJuRi2i1gDXnNKvQUgBzEBdoKPdpfqlLPlF4PUQ84=
Received: from PH7P220CA0176.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::29)
 by SN4PR19MB5422.namprd19.prod.outlook.com (2603:10b6:806:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:32 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:510:33b:cafe::50) by PH7P220CA0176.outlook.office365.com
 (2603:10b6:510:33b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:31 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id DAD3440655B;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BC2B282254A;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 09/13] ASoC: SDCA: Populate regmap cache for readable Controls
Date: Thu, 20 Nov 2025 15:30:18 +0000
Message-ID: <20251120153023.2105663-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
References: <20251120153023.2105663-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SN4PR19MB5422:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2308153e-0b13-4c07-c8be-08de2849be36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LcS/QEEkDOV5+uMI5U/DiciL4H13e+WzPcuSYzEQo/kZEhUQrQW9l2hKxAE1?=
 =?us-ascii?Q?Gu2IZGuZajvLX53ECCRLmhp4B/ZwsWxU/n2FrJLYe0DBJMFvl0+J0ijQLKzt?=
 =?us-ascii?Q?5V8qIL5gTboS3xymf5HUpbVyuyaFGJV/VuRv+pkxCs8pI01EapGIqyhSfjPe?=
 =?us-ascii?Q?c1AIHEBLxCWm+P88saBRaa7DsWMQhulCYDsYC8S2PMGaoyZbTTl5VbyRaYZ4?=
 =?us-ascii?Q?18Godg6pnuniDBLf+46V5Gj6frbJk5lqoea9YNzVjIt+mFZxKOST5tyGNvVH?=
 =?us-ascii?Q?dkc62p7uJyXXsEUfhlWMYhin/XM6t1SG2AMz9kq9IpguXuy6zW3cFA18J1Cb?=
 =?us-ascii?Q?yvEKoQpdkUOTnC/fJrq8pYBsqxrmOZgHRUuPOGW/E8JoHj2oS+SvtJT+7+6r?=
 =?us-ascii?Q?h+aK4uorZPsQd/dKhMZhEcadg1Z702059dqiDmO+eYJhGHt10hhkJBo98ogR?=
 =?us-ascii?Q?BH7Wjt0FyhWp1iOuMaglQJ+oneaPqcknvn/+DGjgLblALl044VwuhtWFr7LW?=
 =?us-ascii?Q?vS5l/YhkjHvy+3gsE4yHH96tdOyo8JG48ru032BYV1ZPcXUVqCgE3F6gAHc4?=
 =?us-ascii?Q?Kk9+YVCyUiiXL1ze1Ub/49DKaiYbQIiIKxIgoRoGPyJfPe/jPMSrfXME9Msi?=
 =?us-ascii?Q?pK11jVP4po4IzsKz5anWRlj2JO0a7/nfGPYz8vczlK48KYZbNqPPSmSkHcwG?=
 =?us-ascii?Q?br0QMR6zdA1eumYqpXNC5Vl3CGl38Wg9/z+0B/tZ6j2xjsgfIDN7JRQ2lX+U?=
 =?us-ascii?Q?UFr1rOFrX75OLhSG9dhj7HMGwmq35LxxWW9te8ApRpSfhEos2x8aipuU4H2z?=
 =?us-ascii?Q?8AteXdxXGwwm+9FAtmi3E/I1T6cFuB5n+imSAfd3vHi18TK5zk9iM8mgrBx4?=
 =?us-ascii?Q?jySz1E67cOteGEpZqFkXQ6KlK3qzBhP+WDclUWYiNBgLqwlWPSCtk/TdfE0+?=
 =?us-ascii?Q?mZLqXyT9prmd0JlNeIFab5+Qvakovz0WzCBknDwg5oPESbjJgLWO3tKOMRmx?=
 =?us-ascii?Q?DsLsxyd8lwNpjSDKDrNRSp6b37BqaIQmFpSEPbuG3Y2IHsjDW6b5BWs/racA?=
 =?us-ascii?Q?8hlhM7jijv8B4r+zFkT0RQJBuf8hIznusGAyoUo9f9m/wP3Ec7jKFYjd0j3B?=
 =?us-ascii?Q?pU8ECyT/cSU/ucW7XFLVKMulxY5YqWXJN5441fm8j586X+7jcc+O8ZOwgle6?=
 =?us-ascii?Q?IAIaIyutsCWcZsLRcPzqV0BRvTQWRPWVbm1xV1Pilf6QQb3MeNKiIl3Ri6W6?=
 =?us-ascii?Q?zDEYGDiQVvfh82hMEGdPTKTntk3TsJdAyiIF3e5+FQlQmR6aLQpS5dcbGmY9?=
 =?us-ascii?Q?sG2tNEHubfkX/8a8tKEgU6uc5SfmqcEd5m/OVzEwwUy4+XjaNX7tQf0xOYyl?=
 =?us-ascii?Q?KduNLOE2XD9+wLrOP80k/VE2COhYQSTV1ObMAI5I87XVxvR0rzpfdLGqmU9G?=
 =?us-ascii?Q?HEyVid1YDpA6E0/P/kSjyaauKqKCKNKYxJW0sG8G1AWgByhIqdvf8OLwpN7h?=
 =?us-ascii?Q?NyLMGCjSazAaNQEna0xk/ZeJERv8xBWqzKKWFwHleTbs+NV6qRXAz1IfjBqP?=
 =?us-ascii?Q?PyIpK44z5jcek5qU+fM=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:31.9265
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2308153e-0b13-4c07-c8be-08de2849be36
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB5422
X-Authority-Analysis: v=2.4 cv=OOEqHCaB c=1 sm=1 tr=0 ts=691f341c cx=c_pps
 a=1UxUaKSOIsEpFYfBxZ3OzQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=wOn70VzH7vhGRB8q9UcA:9
X-Proofpoint-GUID: mNenfqoaDKgZ5QEtziWNY662uGBR7s3i
X-Proofpoint-ORIG-GUID: mNenfqoaDKgZ5QEtziWNY662uGBR7s3i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfXxDkuvTLmZiEE
 nkfBO1k43xIenll4gfcH3L7KqVCg6Lo9fVpgl4ujnIEkA8TMbhAr/8jx7Yb+aWTNgEjMam3606D
 xTDOBE5DcRc09ULeBBj6e/MotMXQMasztTa0hZiFUSzZWCwOONyrKFxQQMV7bMaPY3Mv2mjEMU5
 6DxaBf1RMJDK3NhmSPP5vMo9beMxFkJOGLqh77SyLl7v4Y674aoEqOEtJkpvu6ci8P2HW55CS7I
 thbLaDOUfDH5ZPMU0od/6WeQllzjWXVFvcJDe9La9bQztcW8SeUrJ3HVlhxRu2oYCizeIOQb8rb
 D21RRHDH9oW7C2aw3OHJRpcCqZ2sQ0pVf15AY4HiW7yCqN29ZdUpMpMuiq9OAnL3jrTRhZjOjbW
 MJY8walkx2u7uyRWPvDcUvS6VG1aXw==
X-Proofpoint-Spam-Reason: safe

It is not uncommon for an SDCA Control to have no specified default
value in the DisCo. Non-volatile registers with no defaults will not be
present in the cache until they are accessed. However, if the first
operation user-space performs is a read whilst the device is runtime
suspended this read will fail.

To avoid such problems we should populate values from the hardware into
the cache for all non-volatile readable registers with no defaults.
Update the defaults handling to do this cache population since it is
iterating over the Controls and happens at a time the hardware is
always powered up.

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 sound/soc/sdca/sdca_regmap.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sdca/sdca_regmap.c b/sound/soc/sdca/sdca_regmap.c
index 5104ae99df33a..6fbb241d9d357 100644
--- a/sound/soc/sdca/sdca_regmap.c
+++ b/sound/soc/sdca/sdca_regmap.c
@@ -286,24 +286,33 @@ static int populate_control_defaults(struct device *dev, struct regmap *regmap,
 	if (control->mode == SDCA_ACCESS_MODE_DC)
 		return 0;
 
-	if (!control->has_default && !control->has_fixed)
+	if (control->layers & SDCA_ACCESS_LAYER_DEVICE)
 		return 0;
 
 	i = 0;
 	for_each_set_bit(cn, (unsigned long *)&control->cn_list,
 			 BITS_PER_TYPE(control->cn_list)) {
-		unsigned int reg;
+		unsigned int reg, val;
 
 		reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, cn);
 
-		ret = regmap_write(regmap, reg, control->values[i]);
-		if (ret) {
-			dev_err(dev, "Failed to write default %#x: %d\n",
-				reg, ret);
-			return ret;
-		}
+		if (control->has_default || control->has_fixed) {
+			ret = regmap_write(regmap, reg, control->values[i]);
+			if (ret) {
+				dev_err(dev, "Failed to write default %#x: %d\n",
+					reg, ret);
+				return ret;
+			}
 
-		i++;
+			i++;
+		} else if (!control->is_volatile) {
+			ret = regmap_read(regmap, reg, &val);
+			if (ret) {
+				dev_err(dev, "Failed to read initial %#x: %d\n",
+					reg, ret);
+				return ret;
+			}
+		}
 	}
 
 	return 0;
@@ -317,7 +326,10 @@ static int populate_control_defaults(struct device *dev, struct regmap *regmap,
  *
  * This function will write out to the hardware all the DisCo default and
  * fixed value controls. This will cause them to be populated into the cache,
- * and subsequent handling can be done through a cache sync.
+ * and subsequent handling can be done through a cache sync. It will also
+ * read any non-volatile registers that don't have defaults/fixed values to
+ * populate those into the cache, this ensures they are available for reads
+ * even when the device is runtime suspended.
  *
  * Return: Returns zero on success, and a negative error code on failure.
  */
-- 
2.47.3

