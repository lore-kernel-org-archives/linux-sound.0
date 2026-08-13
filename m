Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B353E44F0
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608385; cv=fail; b=VMbCyjUw7qSMoN4ZkuJju8axBn8xq3pdqdKj8MCuVoy5tC7Y4zPUM5uBuB/ToYOFgOCp04nspEudjKKHnJs3NoDzX7N4U9krcidcPv2WqApebbUKwrBzI1aZ1HodLRA22LncEaAAjWRuc46CbhkuTgducpsmBPpunMhFKQOztQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608385; c=relaxed/simple;
	bh=xk3JteMOv93m9Tx4CCMqUZt9IkuI57uXNEh+Mx4nBLo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Eldcufu29tgByBduflBP3TI1RYoxlDcgrC6hTubhivcSe9pFZi8rhoGdnEoxqZU5OMf7h2hCI0WnWPHdPYAVGRFiGgb8SI3UZroxxVOw6u27AzSjpkGutN+j4QxcnlxGOYGSAMFtQ+zjVmT9xB76ZYWo6LrsS3q0QXYW4dTBwMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ciCM/S9R; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Fb+6T7wB; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ciCM/S9R";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Fb+6T7wB"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5hpXw2318662;
	Thu, 13 Aug 2026 03:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3pIXrqdsu76Jg
	ZKj3kDbiWuLsq73OpqvV3lm+4DmIWM=; b=ciCM/S9Rr2UYDNRHcN7/WrzTbWrpx
	LpukY+ZKJ9l6LuMiOb2ZlEkN2I+yApZieRKq0jz53jPCeTanoolQHeZCMVQpz0gq
	MN5bw9HetcpMsXKqkJaUbhxY6kFdTIKoIVUmfFl7xuDAX/YhsTR7BfT9akztMlS2
	p9P5Hm53Vb3oQpAZiboJxQtk6/wbf6ZLpg4THdSW5No7/gIJyHDG0Acl8KjhUnbe
	OVBNs++ukLQxe/HgPBTPWOT4Mk00g2rqqLutHFmaQkPysFvmPRwEOYDlaZCZPLbM
	dSc7pikZrgilOv9DTDhdUWP1540SrrHMV/4iLbxkrdPWLYMawXCsUFkAQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g0mun7nc1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 03:05:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Re1Ygf1upNQosQdiBgbbt4EimBPQxum8i2YQeiEJ7AxhJ7/mkpNdYWK/rcNsG56vANmPuKsRuxAaDfdLQy0vyyvGAsA5kg9GpDgrAVSKPNNFjnX0f3MyVCN0G99NGAJSrGfIuW0PlKhZS6h3fNHB+nrivcgFB0yL/CXv8Po5+uD+Px8a83WSX0hrxJlKDS+UYctCCPUnZuQ4Sh0vKjTj4fWkBCT1R8dvGJz7aUFsV8TJI2hgcC8WjNA1G57rXVXnT2N1Iju0vwHVh5M9pAOFVuHvOrs3PSiCMtAmY0WDKH9hZmcWsrUXZYURO+eysQ6YLBG5K0eq34QixK76R0u0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pIXrqdsu76JgZKj3kDbiWuLsq73OpqvV3lm+4DmIWM=;
 b=ss5T5kDO3ZW1IeA/aXPS4zWaxWDIkhTt4GRVNYdb203TnCSP5uXm1uQ1zZ08ZVjzozjukPlWDnR87bEp0jp5UK9KojtusrrSMk8jhJJhIRoLP/Crwq24PSjtF49UIz7VbdcfG8LCGIXamyHBjFpL3/4hRCp7duqT7m9ihByX8XzurxQEN5p6MZ7M1qe7m0PZrrjbpWRuchMTRm81uXxyQWWP1xwkgGCHKK6l3Ygeo9vbCzHRgOzw6kjc4Y8HOZVW0su//qiREktvwvRn6pcKkN750Gm9rW20xx9d2qKo+3u1nTD2EqL8+nd1geWUXgU2CXeWPNzF9QtnikMR0gIO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pIXrqdsu76JgZKj3kDbiWuLsq73OpqvV3lm+4DmIWM=;
 b=Fb+6T7wB+P1gG8fIUzihVKz1Xvc0rk/Y6O1AUQ5uFjIqQRAGcMaaIxf6JgkxVvEfBpmkMp92g8Z0s/nduedAjdbMQ0fD78ZodU/f2s53W9QXl7NC5djVGoOg7F7jvqBvVrl1YoIlACzEHyL33ATeUIRpF68F0fq6XO5XtRH/zYk=
Received: from BN0PR03CA0045.namprd03.prod.outlook.com (2603:10b6:408:e7::20)
 by DM6PR10MB4316.namprd10.prod.outlook.com (2603:10b6:5:21d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 08:05:53 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::73) by BN0PR03CA0045.outlook.office365.com
 (2603:10b6:408:e7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 08:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 08:05:53 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 03:05:52 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 13 Aug
 2026 03:05:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 03:05:52 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com [10.85.14.112])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67D85m3v478163;
	Thu, 13 Aug 2026 03:05:49 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Refactor calibration start kcontrol creation to separate helper
Date: Thu, 13 Aug 2026 16:05:40 +0800
Message-ID: <20260813080540.1030-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DM6PR10MB4316:EE_
X-MS-Office365-Filtering-Correlation-Id: ba6a3487-7465-478f-7a0f-08def911b22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WifLYZjyMlKrPDB59lt/w5tsEYwaSv86P0CxgoL8BOXs6MPQZdflPnZZmvJTMmItQ0albnAbZ58sE0H/1CpimWep1N9ZICJ60HAmrGchVK5idqH+vQTOdmTVMD2ul1pgWh1y5qPqoCqunD4yYMbBZJj4vHQcqerZJX717yoMnI9x94J4mEkCfN3F6ko2LXAAwTiwYt24df2ipsNLna398ALgGVY1HzZrOvloLfovUP1kK8rB7xd+4m9P0io3w0rV9pEqKFqx/E6p1w6A37lFak77vDE4vXyM8SdlNdohbXanI468rliOjU2o++GLb8jLBy2XJ8WA60KZ16MCvEI06UCit1bB/cTV5kHKTuNafAwGITJfRFI3Cfja77M+3QOpTefdKvbCwH05fxMI7gRip0PncfR2e36oUIVKYWrPzHhVlF/ru6Jp9Wtd3BArWnLSnlaXjqlWfrDcHa/aafCM/kFIprUjkDkb3euEWVpJ6xeheZWT95Q0ouK53qDBMFP7bAjGyEZ6k6cQEf2/Jf/JG7ItTCtANGhkD88yr+uzKMJz/0uiZgKhGXxxe7pwyGjcQm5lYRx+ufoQpL6lKd6pknFEbt1L26R47p5OcZaD9WH9sTcahD6ZYVlxdAR7ITelnEKkChvMfcg7jNXywSFBSdWZJbj/yyQOwAhK6Jo+hPVpDo9l5sgmeQbjVfRavk1/HwdHkoyGL4qe5XviWKJLUw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BTk7Mix6mMwbcoqarTt1RaEls7Bg7+t3jICOtwdjUMNEjlxHTy9xk7oCGZfnL6t/6oQKLnh1qZjNr0v0y4ON2PvHWhSx02PGxiV7zyKNMNFTs979nW7bZllqvGnfq/IBcOxdOltZ/rcm54vHF5De78rYJw16y5LXOlvWb6s1jM0srAcWHutSuuT5ZSdI22b2m13H0HFTZSII8PeZCcA5+2ibGZZFdW4Ce4FqRHbz8Wen04jY365HBmMdi336Bhq791zuZJ1E3IdjQxO2vRNiwm3+NrAQ6kJTMMjTqQxpzbI/Q0ttWST2HgQxgloChPG7k3qOK2xMDqw5OnnJ6CWtYv06mhKCsnKGAjQfMc3dR6h/g5whSZDtI1flx1iWhkVDrswLku3kqjUztPr56HLtp9sGOOkm/OXO3QvdLFO3Y2PG/hmgJkD+zHXQm4vyrfW1
X-Exchange-RoutingPolicyChecked:
	aYRF0tnauIOnh86iWCIu2dBdX95oq4Ca5dhZeE5z7CGd6aqj2/IySfBzU6AV4D4sfgMfivli5xbFicaau7BIs1QjQ1BAbyDGm6o1fAdsOGjsc0cOvT9HND6D7sEe61rl452GLyq6o5XIKul5LVpyRxfW5dWNUunxTJWI7vyqhOC9OBGTuyKol0VsI4OJTn/yff4JIS44fNj3waxe1P2f8w1/fwWiCSS7X+cw5qnHjBh/PciIuTivwVSrRHlNiMeiKNuY5RDOGdTK6Il30/xieduzwjWDKFqUcQqI5LCqtzPsMcAFf3VIwP8010mGav4C/Qg8Ft22yPg3o1NfKX4dfQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:05:53.0992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6a3487-7465-478f-7a0f-08def911b22c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4316
X-Authority-Analysis: v=2.4 cv=JPQLdcKb c=1 sm=1 tr=0 ts=6a7d7ae4 cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=mnyRSSFBICsc5ylbAAkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1NSBTYWx0ZWRfX9ICZXKv/60IK
 PJEcSKT21wlAEDXUZ/c9+EL8y7aKehviI3KMsujrW2NMDg3RWdwwtyXzggPhD8HNUVriaKDOHbd
 kwNpMkmsPBEUHIZO8cy0Q+BjqcvLBBg=
X-Proofpoint-GUID: Z5ZdYEApm7lT-xR7Zh9Ny3GOajJ2Oacu
X-Proofpoint-ORIG-GUID: Z5ZdYEApm7lT-xR7Zh9Ny3GOajJ2Oacu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1NSBTYWx0ZWRfX+7rSoW6aHtqb
 lcm4QjyGTdfNuwc7bDj5K+I4dyrB/W5zTKZz6J2WywDppQ3aYAEG3T6oSBz1OHZ7LDi1vWDu7Dc
 rxt1rt+ibPIQrrlsi9jkf7DDhPrC1gRljg0ktgZ+muwrQSrSVwNi9B07TCaDd/l/9aKOnJSOcow
 1IJnlkvEC/9WyOKF2yutkCatbExAVz9IM/lb+s4ddKfYzvBO644w9tJohM0IhylUYsJcTIAHdx5
 nR3RjpA3ssmVAxBWv1GXxszhsLbG/4QIFCZV2zwnnQ1U9eUs7ngjKlZ8569WGWntAWsJSBEWyRU
 8Dgf1PlTEMWKRVq4zdUNQSxDYUayMNNNzqzniCaKjALQFZMiZIb6BOt6OcEh6b7ZiL9ICbN7Tuc
 3r8bybcqj5sL73A9EXC/u/LP0948tyCGA7uMo57el5LiIIXHcGi6somN8c8AP4bGSFWeoat8Pj6
 jkgx0W2Z7ubYZq36W+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130055

Move the tas2781-specific calibration start kcontrol initialization logic
out of tasdevice_create_cali_ctrls() into a new dedicated helper function
create_tas2781_cali_start_ktrl().

This change eliminates duplicate inline code in the main calibration
control registration routine, improves code readability, and makes further
extension for custom calibration parameters much easier. No functional
behavior changes.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 71 ++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 69091fd76c53..6f349f88f194 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1456,6 +1456,43 @@ static void alpa_cali_update(struct bulk_reg_val *p,
 	p->val_len = 4;
 }
 
+static int create_tas2781_cali_start_ktrl(struct tasdevice_priv
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
+		"Calibration Start", GFP_KERNEL);
+	if (!cali_start_name)
+		return -ENOMEM;
+	/*
+	 * package structure for tas2781 ftc start:
+	 *	Pkg len (1 byte)
+	 *	Reg id (1 byte, constant 'r')
+	 *	book, page, register for pilot threshold, pilot tone
+	 *		and sine gain (12 bytes)
+	 *	for (i = 0; i < Device-Sum; i++) {
+	 *		Device #i index_info (1 byte)
+	 *		Sine gain for Device #i (8 bytes)
+	 *	}
+	 */
+	ext_cali_start->max = 14 + priv->ndev * 9;
+	cali_ctrl->name = cali_start_name;
+	cali_ctrl->iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	cali_ctrl->info = snd_soc_bytes_info_ext;
+	cali_ctrl->put = tas2781_calib_start_put;
+	cali_ctrl->get = tasdev_nop_get;
+	cali_ctrl->private_value = (unsigned long)ext_cali_start;
+
+	return 0;
+}
+
 static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 {
 	struct calidata *cali_data = &priv->cali_data;
@@ -1574,37 +1611,11 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 	 */
 	cali_data->data[0] = 0xff;
 	if (priv->chip_id == TAS2781) {
-		struct soc_bytes_ext *ext_cali_start;
-		char *cali_start_name;
-
-		ext_cali_start = devm_kzalloc(priv->dev,
-			sizeof(*ext_cali_start), GFP_KERNEL);
-		if (!ext_cali_start)
-			return -ENOMEM;
-
-		cali_start_name = devm_kstrdup(priv->dev,
-			"Calibration Start", GFP_KERNEL);
-		if (!cali_start_name)
-			return -ENOMEM;
-		/*
-		 * package structure for tas2781 ftc start:
-		 *	Pkg len (1 byte)
-		 *	Reg id (1 byte, constant 'r')
-		 *	book, page, register for pilot threshold, pilot tone
-		 *		and sine gain (12 bytes)
-		 *	for (i = 0; i < Device-Sum; i++) {
-		 *		Device #i index_info (1 byte)
-		 *		Sine gain for Device #i (8 bytes)
-		 *	}
-		 */
-		ext_cali_start->max = 14 + priv->ndev * 9;
-		cali_ctrls[i].name = cali_start_name;
-		cali_ctrls[i].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-		cali_ctrls[i].info = snd_soc_bytes_info_ext;
-		cali_ctrls[i].put = tas2781_calib_start_put;
-		cali_ctrls[i].get = tasdev_nop_get;
-		cali_ctrls[i].private_value = (unsigned long)ext_cali_start;
+		rc = create_tas2781_cali_start_ktrl(priv, &cali_ctrls[i]);
+		if (rc != 0)
+			return rc;
 		i++;
+
 	}
 
 	return snd_soc_add_component_controls(priv->codec, cali_ctrls,
-- 
2.43.0

