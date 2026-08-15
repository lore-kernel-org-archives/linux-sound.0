Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFD110F2
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 02:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786761187; cv=fail; b=WtPZWOAq+tDXnasT8qkLOYJSoBTRjbDov6eDik6KqIWMv2gpUYoukIl89oNYS9SyW99eI7m5PlG31PaHN42B3mlf7FPcVVCyWw5dLOIDZpZeLttzbMMVhzapPGwEKpilGDqFNCkE0woKJYBEEU6iyNwsi6BrRa93/5LAyyWGYQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786761187; c=relaxed/simple;
	bh=xk3JteMOv93m9Tx4CCMqUZt9IkuI57uXNEh+Mx4nBLo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uAqlJ0o916OO+xSzBx3Prz9UerWAqV0fbQ1EFnG7Zx1a9+m57BXao4A9lwDO5XBJ8NZ0/bUO89KdhEZlTi17Pw7Jx7iPIe0kemdQo0/Ut2694rGtBZk/pOHwGqvIjkNXY2d0qRD/1Wmg+BPnjraE2rRTia+teeh/HA2B/Q19r1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=F3SZdX3w; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=bY/ckQ9X; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="F3SZdX3w";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bY/ckQ9X"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67ENADgK2687240;
	Fri, 14 Aug 2026 21:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3pIXrqdsu76Jg
	ZKj3kDbiWuLsq73OpqvV3lm+4DmIWM=; b=F3SZdX3w6XvRwAye7qGNvPUz1hFzH
	Zw4MmLTtu6eitnpUcWoETJawNKQV3puYuQBwXikmFE3GuhEZy3aAqRZPOFmN7N/5
	Mgfzsp4qzawkst+Aba583DfCUtUR4+p0mvpyVQzrlgyO50m8qwiUPvZkonyqC19d
	w7oO4kMyoI/7V3P7Oe8js7VkW3IRrcZXQDoJgT5FSVCGHUsYKWSGkHJmAqFejpGh
	9orzUrYZai6rBBPgeUhUoZ2u3HQRpA4bVVx4n06pHmqiCO+0NhYA4B5Zx/qHbjxo
	vAnVhmOJkm7Z5wLx8ilSeov/Xxt9MRgQDvgPe2YSQLhpC2UN6Vf8JRqpg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011052.outbound.protection.outlook.com [40.107.208.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4g1xey5v3u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 21:32:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DpdFZQ0q+b4GP5p1r0HpEi+VmdSOF5WaiMi7wy/IxipBktreLE+30QXSkIyASvosMsdBG3Nyh8PwIqpuETBQFb9BA3nkp/byToIuy+rUfV1cbaIyuaoDPBGHwBNvOa1r0Q9RcmxobQ8jGhX8CXX54ixanb3UGSXWy/djLwUU9iH0ZfOmsSeaDbQGkdvyIWnEUxZhSQQYFFVt+qe8AjzCHU3aAxThryxNQJ1gKhG9SOW23a6AFQhc75m5ZmjV+aOnhrpEpX0EOMUgRRemxbX+ZVI+F5N00uDXSxgeQjAW6dLeUy9BBFi2lc9Tj1GhZpfe7z0bCuofH+5/IH7BmTudkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pIXrqdsu76JgZKj3kDbiWuLsq73OpqvV3lm+4DmIWM=;
 b=OT62FE9c5gs6DtZ+esUJ3u/sA7P0ErYA1wCv1Rf7waagEiGnj8ZBBlcVm3ilMDJFF754mo+/hYUUzBbVwtz7NpR/0EspWnKNJVlvGK5jJgGiCdsFf/aHgS7N+zoZjJ709ClN6UUpXqS2qv7YFImA4sKte9L6Fa33Z5VeG3JdX8Vt8RcfP7giLvcp4ZK6Vuk5+yQh8CwKLSwznFPxduivHbJ6+L6cmHRo6bUJT1aVg34gjlq495CoKDUFwcj4I2/LcXkBT4vwPx3kOLy7HrORVF1JOtY8T23+1p0MPsM3MGxp52Mg/AjDjc2BmhUfSBgyJu6FcwxX5J7yhUxP09y8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pIXrqdsu76JgZKj3kDbiWuLsq73OpqvV3lm+4DmIWM=;
 b=bY/ckQ9X9tpkA9mvEIjGFqeCwB1NnnbRSgbvHBjSfN6x4t0KhR0/G3E06Z3uSqgAklBt4kAlEHRsbLsMDaHdimKcTl2kVo2VSs4LUbnq2M9X6RagfKHFhD+KMmf0T02pruqHbdjPsN8lw39sE6/7a9tjEZLCbYGJXLSm4KOfVzM=
Received: from SJ0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:33b::20)
 by CH3PR10MB7646.namprd10.prod.outlook.com (2603:10b6:610:179::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Sat, 15 Aug
 2026 02:32:25 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:33b:cafe::98) by SJ0PR05CA0015.outlook.office365.com
 (2603:10b6:a03:33b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.5 via Frontend Transport; Sat, 15
 Aug 2026 02:32:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Sat, 15 Aug 2026 02:32:25 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 21:32:24 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 14 Aug
 2026 21:32:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 14 Aug 2026 21:32:24 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.163.82])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67F2WKpC3784499;
	Fri, 14 Aug 2026 21:32:21 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Refactor calibration start kcontrol creation to separate helper
Date: Sat, 15 Aug 2026 10:32:14 +0800
Message-ID: <20260815023215.1788-1-shenghao-ding@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|CH3PR10MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 921b4c72-9d5e-4376-fdf4-08defa757153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	NRD6COE90oPFFy+KX1y7w6H237LDF8iwLdYkxqnZ8dcJZAKepS6oWyzTlZUFrEhteET0GY0DwVqMxF3WOAIzADH204lBnTmVuVBG6/b7cWk2sC+4hlwOj4/HqdbREXJbonQVw05aBIEYb9zY/yte1t9XJXl6QTL02NqnQc6VAxM3lU+r/Xm98BVPLtXGII0QsIn8244F7CKnpNA745eA9wtpoA7/G3uQilAu7/wTqMUpcgNPWWfPy6B6+CsdukgMIi51H9bu3GWtAEc/H8hW/wau8qyP79GKFPrwhaT2oWV5yXXFWav+B6Rkrc87KIiPeIlj1iaPy5QOUtuL9ruXE6/pnfbUDy1zxwhAJgxlLvqpmZQnCrseJ6NatBfB8Tieasw8WczXeamp4FNiOBKwDc2IlBe+7Qef+i00Qp4Z7tgR6F86we8cM47KSMKj4Ml1b7Fc9QfURaehzmL565542a9bW/qvN6R1yICnGDLlsFGOgqXbZc0UKPnVM9L1AANlQ6GltufEl6MyI9SaQkxm0ulfN5aVESa64YLSdaJacgYkShk78EADd3MVMENtqf2rFzdobjuVRXeCaBRamj6X8kBFIYMu/yx3bnGQMOfY8uI0HtYtOGSH1GaY2MYc1TJ2SXN35kPRgR7fSO/9DXYq4RVDmRBdgWSoGsTknDJqEkvU77SxEX9Tx7dWfDJNwd5xyd9E3RxHZM/8dPg/V9B2vw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JHZMiRsI2OmyqnkI4CJMqvMUdKBqHo1HqBV+LFr9LPaDcTaxriCLlnJ4hPCEcRoS4Vf7szvKcynoys5wfTqlQD0/5zkjlRcMfkCLiqPFgCXVdK1X9aKWQymv/nf65BIKP3wUk2y2Wyd0bFr9n+R3lqRuYFacZ05RNXxbxX9nNRxFqA619HJZEOOZxWZMs6VG50/k4TGQb34QUxfo1mIYlFTcPN7lBd7r9w2aP4YgvQT4JrwOvol+R8vz5zuDX1LFcNoq6fnsUSHwkcnuF9J9iSAlPQ1qRHqy5DdEtpOvYzL+b9ocYad08UpRYoXoj/lnHkMNDoK3skHHGYEj7nq5nocdGsabTFmgmAAxfI5n1IjPCY95EcmI/zyF+Cg9i7KpLpPeKmwknbkdpJ9oN8Feb8ayZNh5Aq+oB/fOQtmmCod00lG4xUxQbWmPqiY9vRxS
X-Exchange-RoutingPolicyChecked:
	VoBxjnaJA5b4fxAiYrOWL+jxOByZpQ3uJyQGQ4kegaQDLxCkNPuYTqxwUtqQUrghfSljUJwnwvRuKRTrLGaWzAqav1v9SJ/iTSsnA58QsbfYnEb17LPxC1QAlcN2luuT51IeJWWxkuUSeiPIuP8utd5Ih43FVm5qBhBK9rdz62wWPr+dif55IOe3hE8GXcBDnADImEtKwFq+zSX1kFmYWvCoBNW4v89XYKKjohNNeXe/izc3uZkfIjbi1OMb75DomHSePRv8IBX2XWlu2JllIOTxPlpQddgHf//9bPVw93YsXYDYRl81QyrbzXwAs8r43nrvRSLtogXvbMvlgm6kOA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2026 02:32:25.1299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 921b4c72-9d5e-4376-fdf4-08defa757153
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7646
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a7fcfc0 cx=c_pps
 a=DEJEzXtY41/hIaqkAZCRpw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=mnyRSSFBICsc5ylbAAkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDAxNiBTYWx0ZWRfX/tZdFIWMXILZ
 XTvR4jB7+In7ehl4yM2m0ZBgFnG7AOR+0x86h81Jt6WSVWbpxAT8hSDOVp2REKBXjnnAhn1321E
 porBaLCrzWZaK5v6zaiUSpCMa2M6Lyg=
X-Proofpoint-ORIG-GUID: JmJLdkf_XoptKzDlcAGqMj-Y42ixGiO0
X-Proofpoint-GUID: JmJLdkf_XoptKzDlcAGqMj-Y42ixGiO0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDAxNiBTYWx0ZWRfX2DS21tHop8WH
 fRAt2EcAyUq2ArMnltADKyRUYSpOlezb4ahrgxNkSJMrkjhEl6zo6NiVqdG4uJd2h1mEIhT6Jb1
 qbeP4yYayejO6gvkd2Ibz9YQvQipmJw9WHgNpiw7SZ4wH8FVqX3mDXm4lVK7W5hFT9t244lvJED
 eZBSabOs/qFPZqOur5SFpDVgyB7CA0z/x/xobLkt95YkNRVRaPXsOHxytMIfoYNxakN8+Ah94vD
 6BwVPvlFqY4xmQ384+Wk4/sIrB5DJj0tTl2eyhbjBzpKNh6D0bNQaGrWXWtdDms2LhROjfTr4Kt
 v6+7cv8AeMdgmKUHdznJlF18D2l8S6Pu9wo4EBRPQDRSiJLI/QGwI6kG8F+4gGwwLFqUD0/JSjo
 MtCQDrk++KEIXCpu7fPu1uqdCG1aQE679vP3qLRCt/8aJIeR7FKbFdfodAL9S5AXlu+SB10m5Av
 8EWwPusOAZieBimGeyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_08,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608150016

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

