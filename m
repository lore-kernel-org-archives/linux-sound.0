Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BC436CDF1
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763652653; cv=fail; b=gzUsLOgJj4v8Mq8lEIGxguH3CacOsK8v2wJDOBV46VHaOEfiZLF7dpWAC6JkSKkRndgLKOFeqnIybT0om9aEOOurUKD9KJL+1hQUQJZ1PdnAoVFGJT6ICEymyXv/eucc1t8gJAcNhIV+6zjgiMnl0EWhBOohswatGhSftBliWm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763652653; c=relaxed/simple;
	bh=ykV/ncStSRJmVhoJRIct4BWwCc80WgCw229/GEZ1CU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tPyolGeInDnMPdzp6yILFsjQEd6eNJ17WtelHPclkwjDmMyO5D+zHTPYmGBqMNegowlzZ9BNgh7awrP+/WaonyzM5BQCEpgQJEwjHTYEOcew+6vTC4sAjm/TvCD61a8vfDRJ+3OfHnZaKuUmgUogY8WM19ypdTCQ58iK98+jHZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cfUgBB73; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NhJ99+cX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cfUgBB73";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NhJ99+cX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKCpaYM1058789;
	Thu, 20 Nov 2025 09:30:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=uzD5YYq7FexZmvuWp1BaRk0ylxvKbRwDFsWYGS0pGu0=; b=
	cfUgBB73xxy4DZFELMpIslT80JU4yO2Z5DEyZqhM6BLtobj6WuAAVsK1cUN0Dm4A
	q+Z0L5WNEOtgCbJjpFYQdv5jlePvXN2kixNkU9rotSlZJukpm5kng3dlnyc3Kiei
	xvzpYVT3Z62oA+bcTgrN+TkRxPjpsRd06kNRnLbGpukDvO9rxWtGwk8oUGcVqynQ
	s1TxqOV9hp0tYqRFnlFMjySo3+vUJ0oWxsiYqLEzgxbe+Epde7XoSMaMvn89s7UJ
	96eAzDNv5vwlY3AAQ5yPVTUoAIPm3xk74zLwZz9tHJzO+5oFw7rMWD0vjHgB8zuc
	mPJ9VRhkkvlg4tMnoGVhiw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023138.outbound.protection.outlook.com [40.93.201.138])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmamgr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 09:30:43 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbyAnYUi2e5BZrJA/b7fi2A0WKhsHHTadW4i8VMo74nz3bh2Y3sUAm1hRloU6NfqYVRK9w3mUlKC4OqsrugCbwAVjUCS0zH7H+sblSQN2QUUaAUmGYZVDr7g1OvuNPWEtugG6/oNnt9+np8jZPm8ac+VZsf8Sf2eAm+mkS+O5wIc3SvHsGK2I1sBLqCkAebMy1qHZZSMExsW93c9XJ4dYV51pSVLX4COpXU2kcnJNsI45g2oPXoV/jxAJEEzvBJXnMPN3X8UpZjzAcZa4+Smflr6sIfrvUV0btUcotZV/i6GAyp6/S5+N6HdeRaziB4hmISKSz5ZS5gO1wv7UjqFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzD5YYq7FexZmvuWp1BaRk0ylxvKbRwDFsWYGS0pGu0=;
 b=AM0Q+9i54MeEH6Rf2kiZ2G9LkWHjoV2vPtzni/gVY3gkHV+Cl445UBfNJX2Q7UY1QglOYx8MP1rkVSMPZkOXeu8etJIyP+bMdGOAek0MoaXz8BgNatEQI36wwPZ3e1Gs6+wuRkTJvW7eNlRhN9QNDiQYl+ViCyBOeER3q1qJ2oxjSYG2GswifPEjyglhmEq74aptdniRyI/lAogip0N/WqLMEn2oTQD/6MFp/RMN+cwR6kv/GePXpP5XBCL/QWa0rA2CkrpnQAvwD0WRAoAWgIpb3pER4Hyy/X499M94dilQVKOZ/I/aLhPQu8Msb9vIRUafsKeGsiTV03Flwy9kiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzD5YYq7FexZmvuWp1BaRk0ylxvKbRwDFsWYGS0pGu0=;
 b=NhJ99+cXCLnL64HhIgybpE1sf7CDEqYGP2APUIE9y2qqzR30jWfvADl37mnLUoIxEEYpRE6/gRdIp39pdvrJb3A0YpJGOpc0Xb9Nd1CSmCnqLcfcxyE/V9SlFlh7un/waIGStTOSkuHbeTYgDCFdkkoakOBZupBE+ssu0KHgtVc=
Received: from CH0P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::27)
 by SJ2PR19MB7342.namprd19.prod.outlook.com (2603:10b6:a03:4c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 15:30:35 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::ed) by CH0P221CA0044.outlook.office365.com
 (2603:10b6:610:11d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 15:30:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 15:30:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1E8A40655E;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C5D6B82026B;
	Thu, 20 Nov 2025 15:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v4 11/13] ASoC: SDCA: add function devices
Date: Thu, 20 Nov 2025 15:30:20 +0000
Message-ID: <20251120153023.2105663-12-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|SJ2PR19MB7342:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d93113b-8355-4c50-a6b3-08de2849bedd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7XeIx9j+8AaJh0Hp8fgjCTLInQdRbsscVqVmx2OHGtFTDsZJHMJCemo1wvPy?=
 =?us-ascii?Q?DHAegBRcqVJZalFYgkZnxTTPUtPKbImlAaEWmZZwE2W7eXh3fRCBe1nY4JrU?=
 =?us-ascii?Q?O+Z9E1xBC1qBIMSOwJL/0xSdggqks8I155LliRiJLPdL2FE+yaiu3kRjyFb2?=
 =?us-ascii?Q?SOxex6S72x7A/JPglzDqQbX18p0mBmlnC/rRp61ws59F3ONQapYE5Gl5iWgP?=
 =?us-ascii?Q?lw/o8btUE3Mkn1ARSBHMEWFqR8PFwHvGPrsN4Qdk0PWMkFqsRaAXVldHw6B8?=
 =?us-ascii?Q?UACJPeM+Jkm6baV5BkrBNqjOfB9mKw7sgSLKx2zMDed2h93AEr0tdSrXNXOD?=
 =?us-ascii?Q?Fjbw4v1q36QW6drLFMlNIGnie4Q2TFzXzp9mVt2iygtPtIHuOKxba0GVZTxI?=
 =?us-ascii?Q?OhjLHUPhsnnbkKKbAO0Wn1hylciX3LyVHzjC5E08eegu6vnlqgOcfH8qTapM?=
 =?us-ascii?Q?dZIla9gcp0JGTqkDlLlTVCv+82yletfqnivWM3Dp/LxTPR5jLc7Sl0O/7kqn?=
 =?us-ascii?Q?sJ+fg2W4FpUQdWYFJrVEj0mBSGJCfKHi3+SCMXGfWC/UHjucIBemOOs4gnVx?=
 =?us-ascii?Q?295Yyr8zepWbV01GfuK+LoSvV6B8NfN25uiZDbz1pMmYFByMQL3PDZsE+ljI?=
 =?us-ascii?Q?L/IQrmZ91oFgwdA6Y4TomDAUTDe16UDin/i39JkSOIXMySFRt6y3/dVD/Udm?=
 =?us-ascii?Q?WB2kZ5JqrkmcmdZh80baWQQPwLv9+IMUYR9GJ/MUr1BDVNaJFpOis8EEfSoj?=
 =?us-ascii?Q?8Y2sZ7vGFh9H26qzCgv+UTMof2CWaCH7qshSqjZboobpgLFT1SRTivy0QCz9?=
 =?us-ascii?Q?QmABjyaNeGT0ph0bFKbEfMG/rQ+4qGmpCbalT6Ze49ybBtaIkUocqgcwkU4J?=
 =?us-ascii?Q?6ZteV2V0bNUx0inW9TXITk+rfw2ghW1Ojgq9/wU6nZ/Rvhyb5vrXAP0BjRqj?=
 =?us-ascii?Q?uiK279rEYrqp3YO+O0/J+VnCBhBJBo1nJuK2lQL5y18QkDckmlLIpukkk+QL?=
 =?us-ascii?Q?/J9r0biDb9n0yeJR17yDiKSbFYJaZ8qHVWRl2w1lj3f1m4DFBHkAwgFcg4vM?=
 =?us-ascii?Q?0z6DV+HUvw0658E9+IjQSAzlxJqtitjf2KFfBXuVQGYgwBfMt3KNHHsnL+JK?=
 =?us-ascii?Q?Uf1YJa3eNj2PBlQg3itpb2Xd+9PjW9cCr6JKTjC94Xdq4sk+v+fxizlFWfwH?=
 =?us-ascii?Q?D1qroBf+3ct2AhsGgXHY6aDJTT64unRUnFvEM7EsshWlKO0mjrlpINPbIchw?=
 =?us-ascii?Q?DbBQE1HIvzm9dRb0IkZS0pTXvvOkTISLT7gjrPGlBA8gGK3iBC5j9SERFa2c?=
 =?us-ascii?Q?X3hIKLNjzu7Ye9IFyIA+qCV3eaFRfCKcep6YwntfmKK6C1CUiA8GYwvJWn0N?=
 =?us-ascii?Q?csQ40/GPoJf5XmJ6GgAqDFojX0QvDiDn6JcfoLncItW7+yKeisei20gEoxZE?=
 =?us-ascii?Q?ZwPW4H9IEi3Sj0DMeDwXzo10sln5zjh7O3ge4OO4c66kMpTewYFwcvx49c8W?=
 =?us-ascii?Q?PDEHCpGesLrZQWM1FayA39MDiGU+BpKWqJhL+SOYoAe7NtztWaYMgCPvaxQK?=
 =?us-ascii?Q?nLQQ1zBcphbhQe8c4lQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 15:30:33.0738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d93113b-8355-4c50-a6b3-08de2849bedd
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR19MB7342
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDEwMiBTYWx0ZWRfX5A1AQXakS5eo
 Nt+dI+ulEzkxE7e8FtwLBhyElzEF1sfkw5bTKSTwy7PpHjfb1jsIBnkWk5OB7ihi9kQRNYwGrQw
 B2rRySyCnTKzmoFma3qEblgGLrhaOZR0Aqfuy/OPStU+zSbQdmAr4+texJR/HlLhlTNNddoLOu/
 /l1TF8cDj5WVu96GKbQ2WeVZLCACE6Xw3ayrRCo/Ry6/Pe7cUnMdxb8WjwoRgAnGqos3EfjcaDV
 mtopUV+AiVOZ/6gg+lLDUFYWed0GDUFHvRlkeE6JHfzlXmWkA1ndNXsylIZsDFm+wPidq04TvLi
 pQoNmhH9B4eRHXV5U81ehxnj8ixIER8L63qdLV+CpH7loFjTMSnzv3YS86Nfxc4F3gKUnI7DsE/
 npajNuZTVBJXtZ8m9kOoeqAsYXM9UQ==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f3423 cx=c_pps
 a=S0nsQJN0x0NZxitFF6bqdA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8
 a=s4wzVoPRHm42yPvCsZEA:9
X-Proofpoint-GUID: TLvFirR0PWx0vzqBM2JfWxyTV1xmPyjX
X-Proofpoint-ORIG-GUID: TLvFirR0PWx0vzqBM2JfWxyTV1xmPyjX
X-Proofpoint-Spam-Reason: safe

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Use the auxiliary bus to register/unregister subdevices for each
function. Each function will be handled with a separate driver,
matched using a name.

If a vendor wants to override a specific function driver, they could
use a custom name to match with a custom function driver.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

 include/sound/sdca.h                  |  13 +++
 sound/soc/sdca/Kconfig                |   1 +
 sound/soc/sdca/Makefile               |   4 +-
 sound/soc/sdca/sdca_function_device.c | 117 ++++++++++++++++++++++++++
 sound/soc/sdca/sdca_function_device.h |  15 ++++
 5 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sdca/sdca_function_device.c
 create mode 100644 sound/soc/sdca/sdca_function_device.h

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index d58d602212771..67ff3c88705d5 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -15,18 +15,21 @@
 struct acpi_table_swft;
 struct fwnode_handle;
 struct sdw_slave;
+struct sdca_dev;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
 
 /**
  * struct sdca_function_desc - short descriptor for an SDCA Function
  * @node: firmware node for the Function.
+ * @func_dev: pointer to SDCA function device.
  * @name: Human-readable string.
  * @type: Function topology type.
  * @adr: ACPI address (used for SDCA register access).
  */
 struct sdca_function_desc {
 	struct fwnode_handle *node;
+	struct sdca_dev *func_dev;
 	const char *name;
 	u32 type;
 	u8 adr;
@@ -59,6 +62,8 @@ void sdca_lookup_functions(struct sdw_slave *slave);
 void sdca_lookup_swft(struct sdw_slave *slave);
 void sdca_lookup_interface_revision(struct sdw_slave *slave);
 bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_quirk quirk);
+int sdca_dev_register_functions(struct sdw_slave *slave);
+void sdca_dev_unregister_functions(struct sdw_slave *slave);
 
 #else
 
@@ -69,6 +74,14 @@ static inline bool sdca_device_quirk_match(struct sdw_slave *slave, enum sdca_qu
 {
 	return false;
 }
+
+static inline int sdca_dev_register_functions(struct sdw_slave *slave)
+{
+	return 0;
+}
+
+static inline void sdca_dev_unregister_functions(struct sdw_slave *slave) {}
+
 #endif
 
 #endif
diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index a73920d07073e..e7f36d668f159 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -4,6 +4,7 @@ menu "SoundWire (SDCA)"
 config SND_SOC_SDCA
 	tristate
 	depends on ACPI
+	select AUXILIARY_BUS
 	help
 	  This option enables support for the MIPI SoundWire Device
 	  Class for Audio (SDCA).
diff --git a/sound/soc/sdca/Makefile b/sound/soc/sdca/Makefile
index be911c399bbde..babe3fa2bb3ff 100644
--- a/sound/soc/sdca/Makefile
+++ b/sound/soc/sdca/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_regmap.o sdca_asoc.o \
-		  sdca_ump.o
+snd-soc-sdca-y := sdca_functions.o sdca_device.o sdca_function_device.o \
+		  sdca_regmap.o sdca_asoc.o sdca_ump.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_HID) += sdca_hid.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_IRQ) += sdca_interrupts.o
 snd-soc-sdca-$(CONFIG_SND_SOC_SDCA_FDL) += sdca_fdl.o
diff --git a/sound/soc/sdca/sdca_function_device.c b/sound/soc/sdca/sdca_function_device.c
new file mode 100644
index 0000000000000..91c49d7389db0
--- /dev/null
+++ b/sound/soc/sdca/sdca_function_device.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2024 Intel Corporation.
+
+/*
+ * SDCA Function Device management
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/soundwire/sdw.h>
+#include <sound/sdca.h>
+#include <sound/sdca_function.h>
+#include "sdca_function_device.h"
+
+/*
+ * A SoundWire device can have multiple SDCA functions identified by
+ * their type and ADR. there can be multiple SoundWire devices per
+ * link, or multiple devices spread across multiple links. An IDA is
+ * required to identify each instance.
+ */
+static DEFINE_IDA(sdca_function_ida);
+
+static void sdca_dev_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+	struct sdca_dev *sdev = auxiliary_dev_to_sdca_dev(auxdev);
+
+	ida_free(&sdca_function_ida, auxdev->id);
+	kfree(sdev);
+}
+
+/* alloc, init and add link devices */
+static struct sdca_dev *sdca_dev_register(struct device *parent,
+					  struct sdca_function_desc *function_desc)
+{
+	struct sdca_dev *sdev;
+	struct auxiliary_device *auxdev;
+	int ret;
+	int rc;
+
+	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return ERR_PTR(-ENOMEM);
+
+	auxdev = &sdev->auxdev;
+	auxdev->name = function_desc->name;
+	auxdev->dev.parent = parent;
+	auxdev->dev.fwnode = function_desc->node;
+	auxdev->dev.release = sdca_dev_release;
+
+	sdev->function.desc = function_desc;
+
+	rc = ida_alloc(&sdca_function_ida, GFP_KERNEL);
+	if (rc < 0) {
+		kfree(sdev);
+		return ERR_PTR(rc);
+	}
+	auxdev->id = rc;
+
+	/* now follow the two-step init/add sequence */
+	ret = auxiliary_device_init(auxdev);
+	if (ret < 0) {
+		dev_err(parent, "failed to initialize SDCA function dev %s\n",
+			function_desc->name);
+		ida_free(&sdca_function_ida, auxdev->id);
+		kfree(sdev);
+		return ERR_PTR(ret);
+	}
+
+	ret = auxiliary_device_add(auxdev);
+	if (ret < 0) {
+		dev_err(parent, "failed to add SDCA function dev %s\n",
+			sdev->auxdev.name);
+		/* sdev will be freed with the put_device() and .release sequence */
+		auxiliary_device_uninit(&sdev->auxdev);
+		return ERR_PTR(ret);
+	}
+
+	return sdev;
+}
+
+static void sdca_dev_unregister(struct sdca_dev *sdev)
+{
+	auxiliary_device_delete(&sdev->auxdev);
+	auxiliary_device_uninit(&sdev->auxdev);
+}
+
+int sdca_dev_register_functions(struct sdw_slave *slave)
+{
+	struct sdca_device_data *sdca_data = &slave->sdca_data;
+	int i;
+
+	for (i = 0; i < sdca_data->num_functions; i++) {
+		struct sdca_dev *func_dev;
+
+		func_dev = sdca_dev_register(&slave->dev,
+					     &sdca_data->function[i]);
+		if (!func_dev)
+			return -ENODEV;
+
+		sdca_data->function[i].func_dev = func_dev;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdca_dev_register_functions, "SND_SOC_SDCA");
+
+void sdca_dev_unregister_functions(struct sdw_slave *slave)
+{
+	struct sdca_device_data *sdca_data = &slave->sdca_data;
+	int i;
+
+	for (i = 0; i < sdca_data->num_functions; i++)
+		sdca_dev_unregister(sdca_data->function[i].func_dev);
+}
+EXPORT_SYMBOL_NS(sdca_dev_unregister_functions, "SND_SOC_SDCA");
diff --git a/sound/soc/sdca/sdca_function_device.h b/sound/soc/sdca/sdca_function_device.h
new file mode 100644
index 0000000000000..5adf7551d3a44
--- /dev/null
+++ b/sound/soc/sdca/sdca_function_device.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* Copyright(c) 2024 Intel Corporation. */
+
+#ifndef __SDCA_FUNCTION_DEVICE_H
+#define __SDCA_FUNCTION_DEVICE_H
+
+struct sdca_dev {
+	struct auxiliary_device auxdev;
+	struct sdca_function_data function;
+};
+
+#define auxiliary_dev_to_sdca_dev(auxiliary_dev)		\
+	container_of(auxiliary_dev, struct sdca_dev, auxdev)
+
+#endif
-- 
2.47.3

