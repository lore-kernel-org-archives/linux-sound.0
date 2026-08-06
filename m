Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42833FE36;
	Thu,  6 Aug 2026 05:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785994562; cv=fail; b=kExKhhYejptTdt7l08h6nc3CJMwC7x/MN9Pw3ZzM46gqJX+Mvx5tEigzSI0WDs2tl/Zv93qAWB8Ut7stK86hzEPx/wqq6pfnZrwkyY2JreYztu6rWctuM+LP6cfkCdu00A17SdejIqIPJ2NRzttohzEm9eKDoz6msmMdY9REC5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785994562; c=relaxed/simple;
	bh=ocqRXZAtYiMQrKfPheu6ZDs19rshOK4A3JfLvoXlAG0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SkBc5GuY0Hqn3kBUDAco72C9CaJxrshKNCB3J2EkytJBDKDt/mq2OBiwbYAro15tiukHCC2/xFUgB/32+bKiQE035paxK4j91g9SEIr2OgX+1k9WxLJYp21jAVCAuJj62qz2beXyt89i9h+KK39Pp/xfrZn1VG9ktQBVAoUSv8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ckFZ5ens; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jsrvhWre; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ckFZ5ens";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jsrvhWre"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675NZRqb2482411;
	Thu, 6 Aug 2026 00:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=+wAeEcetoE9BE
	lSEWInQAiEvg6X6CKRkgNgwk+fWdLw=; b=ckFZ5enscoFFkiMtT8ILt8/4D/80O
	ccFrrbfO9JSe4MppG7SL1J5tQgEnlrJSgDo7rclrWF6nxxAbAgiq7ZaiTsjpFpoJ
	Gpp0F0hsKXhfZVnJyB909Hxr9P0Fmm5z1xl91T0TyjDixyLQQHOmdZvReuxHuArQ
	1yrgV7O4zmI4XuOXOAS8egASeLw4GlaEdkdMT+FVRXR0ky0Hu9WDt+G//0qKvN2e
	d4hlAXjfO1F0gKu2FbhNIMqN4qNHQbTtL8R85dOgC5yE0IvMamgr9YWfBLqtS1Bi
	VTJAHU3EapOlnLbuOwegRBOYGfFdZw22cQjT5KRMNcUeDeiiNehcdgXdw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fuuyr1v48-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 06 Aug 2026 00:35:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lw1Y3A05C4OvSJgGg2Wb1MoQWKKB32J//Gzc//MwzK/2lm6QX+3qA4PTUpfqfUHAh7uVCYitNWANEM4InoPczRJvuK2s8GZrzAE5BfW+xyRCAq9jVwelz2N0ZfUER/HZZSYoO+nLl0zvkor9MOV9blrnS86AYp8/URimLI5aPTgOp6wEcI8QeGS5NUz3lsVHsSW2rgjl39zyOzfhzEXPdA1n+EzgZQ5D4bEGIcMQZO0igZ/FG/HZLKAzyoiFfE6ZHYhqqV7P50VppywtFFT8CgmYrQo2NBX7KaDhAQQSCNa5uBgoW+XRXwuZsqWujoKTuBDkVHTI6u+iOft96d/zuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wAeEcetoE9BElSEWInQAiEvg6X6CKRkgNgwk+fWdLw=;
 b=n4ioeVFTYG/kOB0Txvc9A7TULGJ0E5/clK+62OQFIGNWMir7p/p10VWtKElOQjEXtGxuqXIzKJ3C8lPpHXjuNhLw0gqQermYex0BuWYdbSVTsFbsCR77JdbkX8MddWjO4yVkGFvOxQ8xFWBYaEiKeYov/39JjXjiXsUEw/ztTzvo+uE/cfR/bApe6qBMP5IXkhiLioYeI+sHRsp1ooXm4YGvC9xS3U5YW2S/CogF19ZHbG9pkzHlp0xaZj1+Q9e016bgCkHb/jm159mK2zlXcXG80u6QjkYlunORylDktWP1SlWcQruKj/hEoFOO54BWQbIUhF7eX/2avIf8UMWxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wAeEcetoE9BElSEWInQAiEvg6X6CKRkgNgwk+fWdLw=;
 b=jsrvhWreX1GeDi1cLIAmMMH5qIXAGs0grCdVU6KcaUQhNCg4Ah+pZ3mwp3nB8Gvx8qY6n+yiINzQ5UkbUXYwa9wQNC9S5i8osFq3wFy1V2D9zy+v0ySM7aQdVpcdW7dWz6f9sYdN6J8oei4bJrcgOtoWZuE+kY2nm4NHP/qtyd0=
Received: from SJ0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:a03:33e::15)
 by PH0PR10MB997976.namprd10.prod.outlook.com (2603:10b6:510:3bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 05:35:23 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::91) by SJ0PR03CA0040.outlook.office365.com
 (2603:10b6:a03:33e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 05:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 05:35:21 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 00:35:19 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 6 Aug
 2026 00:35:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 6 Aug 2026 00:35:19 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6765ZCGu2746850;
	Thu, 6 Aug 2026 00:35:13 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 1/2] ASoC: tac5xx2-sdw: add rev_id 0x30 support
Date: Thu, 6 Aug 2026 11:04:59 +0530
Message-ID: <20260806053500.1955-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|PH0PR10MB997976:EE_
X-MS-Office365-Filtering-Correlation-Id: 31060bfa-65c6-471d-e809-08def37c822f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|18002099003|56012099006|10063799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	bievqCXjx0WvdyOq2KkQ2qD6d7cK5N5BpOwT1okfofo1FdHpiGNj2ME2SmeIkl6c7EHC6crsbhR9v92CKxt6arJAyz7l5WKY3QURlyz6G3YAb0ejJzIw8v101DkPtDIbavbp3RiU2FVxy4SvtyDLGwez2Ru8DiibVE35k/TLEvOahAMZlMgk3jy2HzT5DwTw5oJf6Q2HRlpizuxHyBttArUBhTcDvmcCKuH/OD7UPfQBuobJ6lo7AxgeQnV0eDZrcIzsgSLfcHaUIkqE2rffNuhTCBMvZOVClUzpZ/IwR3B9PIlFyb3mEZ4WwNGIHrRfxCB4VzYtoG3KNXtJBlZ6mGNRZsDNgIE8lkQ9IhpWUWXBRzsADkDmn/JIRmBW6stvFaILnMZcALeDfHwTUGieS6CeYc/Kj9R9OGbjIpO0oKHhGwHbrj3n/r0ZCRuPxVQ6s7qw//gBtlvSaO2VCQqxWkx4qO0rBvWDa5WawUn3vaeNXKwAbof1IxfP7pBalin2P+33qY6kblygZ0Wryumnnwqyw4bK6JRb+zTKS+vpHOVjBFmrNFDg96N/Saa19Nwp/e532HIjvQYIAQtZfuxfz2shbxBwaMHwr99USj95F88VQ1X4KEF8d28AHTeqq+YTPPSqpOlSw4vdUvksmEzqBsBg2gTYGtNWTL4HghAjtnOHBN9OSI6RlKx5DhKwCNAdFApR2yRtPXYNhkCSQjlaDA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(18002099003)(56012099006)(10063799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jwD4lpLquIYW9b0v642+XZiA4CGkcJB1/QlzAhiNCaI0r3Y0l4kre2kwEjnE/QeT0rOtT0q2IQcjCKcjYhp8VlDZxdWJAcrxGn49Vw9bViBVgGm+MWrAs9cDcP5Grhz2rWeoyd2O/DM3fzjuEIOILQ/Sehr/aPvusTDHCQTlHry3YNfJUo5EM7qJ0j5mP3k2YGNrAzRNPUyI62jN0dyJTOnVxVvBzJZUtzkyrYNRc87IZKmRfuRW+geYjaLCR9+rqNOuf6gPYbIAXlDdZBKrXsa9eqZWxr/gHxLhAUn+5zoUDz2qIOcSQU+xvmg3vfz5zTVzZmvs4OdfTLpVDwabwv8TrAIP2bUCvVsrgCr1DI3zUgzD6dSJvEUBgk1zjrXMJIdP34PFaftqo0e1y6v6R5nj/yGTONHVuBHoad36aPuF1gt0z6DcJRfCsor8SzdA
X-Exchange-RoutingPolicyChecked:
	aPNVqHWdYbpk3ccgvKdT8wJHfLYfOLduiqaEsjpKjz4EGs8MBBOeb3TAoAbk5sTUl+vL2ozE3H10zyiSw8SROWbIOOQbUEZOOahSlzU5pI0+SJjos01X0QonakIA+XjuV9/9OjO3RNmgONRCW9810YzVGsJvGvucG4HRSJO0FMaHCY+hvB7AdFnxQlysWO8Swsyds3YymAic8RGg8j2ISNPs2xb8xtyvrQ7xMQYelQsAHpUUsB7vCuZc6SGnZDvw7BDWQwS2PhBDnx3D7pNh10MlAHUbf7Roe93DcMUWy9Rzgeyy/2j0P4Gamv3xU5BoN4v6DRXXhJ6KyKR29Wt9Ow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 05:35:21.7604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31060bfa-65c6-471d-e809-08def37c822f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB997976
X-Authority-Analysis: v=2.4 cv=B/yJFutM c=1 sm=1 tr=0 ts=6a741d1e cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=-fOwWHE0jTgnZ24ycJoA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX+uEpeFyhQcnM
 BDQTsA2sYoZymGiqNf5lltxOj46lfoeDoir/RCT5gj0DKBd0bnyEM8olZcvgvHFSJoGKwi8WJTY
 GUK2pk4MWyiiPdwdZmnt3QyfoV5kV+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA0MCBTYWx0ZWRfX8X+4NS3G3O/l
 pG1Bs7RIW4dFHN4WNVV/3rK8v0zqOsiSTfKpFuRvdRjZMI4fgm+CUD15uiab81SmB3c++AjDPI/
 kzIdydeI2jkhkM49IYAsB2/nP0iLyXhwB9VSYoZEeR3SyFIUjvnpYTE6G48Elytc2gNByPZZ+qI
 gXX3M9jV/CtKb7b0FEBhaE0qoDZj3WvInyMGuGxD1HoBSBYAPb2brmqGRt86sR57VlKAnB1Pu+0
 Lpjbmza3V06m3fxyLsveHgtEyWFou8Z5JSz19UTUiX/rP9e1IGJm5dYdCbwocOgK8pL6GgQaZ5C
 qVH0iedHqvULTZUujc0gzvmq30lyDNrtKzw6VKa7E6j8dG8u+n3wa+/aSkL81LUKixx1VxpR/3+
 Qi71tmQd2vGAHKWDS2YMWw/PphqhfCUdn5wVHtbzcAS3hosqg9kzZ+aeFuV93cEXRlevzCd5MUk
 h4FLE+R2zoB4npXf8Og==
X-Proofpoint-GUID: r1BaIWSqpAcdryfbbTablR3071AIA6JB
X-Proofpoint-ORIG-GUID: r1BaIWSqpAcdryfbbTablR3071AIA6JB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060040

* HID interrupts: SDCA_12/SDCA_17 instead of was SDCA_11/SDCA_16 in
   in older revision.
* UAJ port prepare: write 0xff (jack connected) or 0xdf (disconnected)
  This is required to solve the channel prepare timeout error during
  boot time with the 0x30 silicon.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tac5xx2-sdw.c | 58 ++++++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index ace06f5ab..8fedb5292 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -88,6 +88,9 @@
 #define TAC_FW_FILE_HDR	 20
 #define TAC_MAX_FW_CHUNKS 512
 
+#define TAC_UAJ_PREP_CONNECTED		0xff
+#define TAC_UAJ_PREP_DISCONNECTED	0xdf
+
 struct tac_fw_hdr {
 	u32 size;
 	u32 version_offset;
@@ -138,6 +141,7 @@ struct tac5xx2_prv {
 	bool hw_init;
 	bool first_hw_init_done;
 	u32 part_id;
+	u32 rev_id;
 	struct snd_soc_jack *hs_jack;
 	int jack_type;
 	 /* Custom fw binary. UMP File Download is not used. */
@@ -261,7 +265,6 @@ static const struct reg_default tac_reg_default[] = {
 	{TAC_REG_SDW(0, 0, 0x78), 0x0},
 	{TAC_REG_SDW(0, 0, 0x7b), 0x0},
 	{TAC_REG_SDW(0, 0, 0x7c), 0xd0},
-	{TAC_REG_SDW(0, 0, 0x7d), 0x0},
 	{TAC_REG_SDW(0, 0, 0x7e), 0x0},
 	{TAC_REG_SDW(0, 1, 0x1), 0x0},
 	{TAC_REG_SDW(0, 1, 0x2), 0x0},
@@ -942,6 +945,7 @@ static int tac5xx2_sdca_button_detect(struct tac5xx2_prv *tac_dev)
 static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
 {
 	int val, ret;
+	u8 jack_prep;
 
 	ret = regmap_read(tac_dev->regmap,
 			  SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_GE35,
@@ -951,6 +955,8 @@ static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
 		return ret;
 	}
 
+	jack_prep = TAC_UAJ_PREP_CONNECTED;
+
 	switch (val) {
 	case 4:
 		tac_dev->jack_type = SND_JACK_MICROPHONE;
@@ -964,6 +970,7 @@ static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
 	case 0:
 	default:
 		tac_dev->jack_type = 0;
+		jack_prep = TAC_UAJ_PREP_DISCONNECTED;
 		break;
 	}
 
@@ -973,26 +980,44 @@ static int tac5xx2_sdca_headset_detect(struct tac5xx2_prv *tac_dev)
 	if (ret)
 		dev_err(tac_dev->dev, "Failed to update the jack type to device");
 
+	/*
+	 * When uaj is uplugged and booted, we end up with the channel prepare
+	 * timeout error for the uaj ports. This writes allows the channel prepare
+	 * to succeed when the uaj is not plugged in.
+	 */
+	if (tac_dev->rev_id >= 0x30) {
+		ret = regmap_write(tac_dev->regmap, TAC_REG_SDW(0, 3, 127), jack_prep);
+		if (ret)
+			dev_warn(tac_dev->dev, "Failed to write jack_prep register: %d\n", ret);
+	}
+
 	return 0;
 }
 
 static int tac5xx2_jack_init(struct tac5xx2_prv *tac_dev)
 {
+	u32 jd_int_mask, hid_int_mask;
 	int ret = 0;
 
+	if (tac_dev->rev_id >= 0x30) {
+		jd_int_mask = SDW_SCP_SDCA_INTMASK_SDCA_12;
+		hid_int_mask = SDW_SCP_SDCA_INTMASK_SDCA_17;
+	} else {
+		jd_int_mask = SDW_SCP_SDCA_INTMASK_SDCA_11;
+		hid_int_mask = SDW_SCP_SDCA_INTMASK_SDCA_16;
+	}
+
 	if (!tac_dev->hs_jack)
 		goto disable_interrupts;
 
-	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2,
-			   SDW_SCP_SDCA_INTMASK_SDCA_11);
+	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK2, jd_int_mask);
 	if (ret) {
 		dev_err(tac_dev->dev,
 			"Failed to register jack detection interrupt: %d\n", ret);
 		goto disable_interrupts;
 	}
 
-	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3,
-			   SDW_SCP_SDCA_INTMASK_SDCA_16);
+	ret = regmap_write(tac_dev->regmap, SDW_SCP_SDCA_INTMASK3, hid_int_mask);
 	if (ret) {
 		dev_err(tac_dev->dev,
 			"Failed to register for button detect interrupt: %d\n", ret);
@@ -1051,6 +1076,7 @@ static int tac_interrupt_callback(struct sdw_slave *slave,
 	unsigned int sdca_int2, sdca_int3, jack_report_mask = 0;
 	struct tac5xx2_prv *tac_dev = dev_get_drvdata(&slave->dev);
 	struct device *dev = &slave->dev;
+	u32 headset_detect_chk, hid_detect_chk;
 	int btn_type = 0;
 	int ret = 0;
 
@@ -1081,14 +1107,22 @@ static int tac_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(dev, "SDCA_INT2: 0x%02x, SDCA_INT3: 0x%02x\n",
 		sdca_int2, sdca_int3);
 
-	if (sdca_int2 & SDW_SCP_SDCA_INT_SDCA_11) {
+	if (tac_dev->rev_id >= 0x30) {
+		headset_detect_chk = SDW_SCP_SDCA_INT_SDCA_12;
+		hid_detect_chk = SDW_SCP_SDCA_INT_SDCA_17;
+	} else {
+		headset_detect_chk = SDW_SCP_SDCA_INT_SDCA_11;
+		hid_detect_chk = SDW_SCP_SDCA_INT_SDCA_16;
+	}
+
+	if (sdca_int2 & headset_detect_chk) {
 		ret = tac5xx2_sdca_headset_detect(tac_dev);
 		if (ret < 0)
 			goto clear;
 		jack_report_mask |= SND_JACK_HEADSET;
 	}
 
-	if (sdca_int3 & SDW_SCP_SDCA_INT_SDCA_16) {
+	if (sdca_int3 & hid_detect_chk) {
 		btn_type = tac5xx2_sdca_button_detect(tac_dev);
 		if (btn_type < 0)
 			btn_type = 0;
@@ -1695,6 +1729,15 @@ static int tac_io_init(struct device *dev, struct sdw_slave *slave, bool first)
 		goto io_init_err;
 	}
 
+	if (!tac_dev->rev_id) {
+		ret = regmap_read(tac_dev->regmap, TAC_REV_ID, &tac_dev->rev_id);
+		if (ret) {
+			dev_err(tac_dev->dev, "failed to rev id, err=%d\n", ret);
+			goto io_init_err;
+		}
+		dev_dbg(tac_dev->dev, "detected rev_id 0x%x", tac_dev->rev_id);
+	}
+
 	if (tac_dev->fw_files && tac_dev->fw_file_cnt > 0) {
 		ret = tac_download_fw_to_hw(tac_dev);
 		if (ret) {
@@ -1959,6 +2002,7 @@ static s32 tac_sdw_probe(struct sdw_slave *peripheral,
 	tac_dev->hw_init = false;
 	tac_dev->first_hw_init_done = false;
 	tac_dev->part_id = id->part_id;
+	tac_dev->rev_id = 0x0;
 	dev_set_drvdata(dev, tac_dev);
 
 	regmap = devm_regmap_init_sdw_mbq_cfg(&peripheral->dev, peripheral,
-- 
2.34.1

