Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB1E2EA756
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673333; cv=fail; b=d7xGiHZHbsc4l763HjjOgrsmEHiEp1f8Vq3Xt98RTTCmToJUX/NObRBOYJYpg97+7pevJ/sHBjuQKNLa8Vyzlm1kg0eP0J3cQPhy1jU7rXcQtzxmZu+qCJMDDGEPxGQS6jL/i7/VJIQVqSNz97HF+KhASBeAR2/1oIl2WVjlJao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673333; c=relaxed/simple;
	bh=NAvgdCZyFflgibeV47oq0fN2/ZWIcLMHjWjrCwRnDac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJAsNd70TUQCZnmPbqD+zh3FXP/rmFA6waxv2rVGoEQgSU1UaSu15f55nRMAK3WuadNvV6NDkF+e/SwBz3I88dgnGeEXvwjGkyheylXdyWttNwwhwCV02zYQDkF7HOtUiGhn238yxtx/hRjh7TSjj7m3CeBBliX6jt3ArM3swPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZPqVMg2y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=KXubNsIU; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZPqVMg2y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="KXubNsIU"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C7NqXc1382687;
	Fri, 12 Sep 2025 05:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=tpcIP13bDup2GebrLbjVgkyqJzky2EKm1ymY4CzU5DU=; b=
	ZPqVMg2yGgSeo9odx2V0Pv0cqx/35mq2RiTGpv7Uy7dbAaxdiROVNRHey7bPItpr
	n6jUgrbK7QJJ07DkGhKPaKqlt/Jo565vmALvUJ9tLhcmWAWS4gZC+JruGrtlXzjP
	0QqUk5eo8LPAT4xQvfUp/KMZSM+Sb8pmz2lI3Ze9e2w5c+2KLWg0Elww2QMmMn5q
	29wY++oIY5Cz1tbWNLFeGaZSg2ZNkw4UDyty0ZJqQ3QdsvDmcXNqDN69tfSxX63e
	jMfG51k084KhZOKPVFK5uo4u0MDRwrgYUQW0Yz4oGwIywoNfWTDHuUxngSAHJZ0z
	ERlKLzAq9Yanid/KNoBbxg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2131.outbound.protection.outlook.com [40.107.237.131])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 492q6tcph7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+IOE0qZlcoGKwHnMm5nNZHnzBNNblWYb80IB2VSHEs9Qwfvzd8zYxVbsm8aXD5GNU9tZGM9SruGHjJzCgEyIgqzn2tv6SeYUjsvJ3ksbkqPhuxvbzZrGsgO1mp5fbHBzyrrn0C9wnPunVEfa+IXJQuQ6DDhFXRChy+3Lwa0NDDTwBpHyFUdIiQTIOVnh2w9gzXcqxQuveHhMOdS1hj1LDOW8FV1oJvzevoIy01774z1UL8pftjkXILTuAYYNMbonSB5wO2yXrRxmZ20WppBUzW5V/v2lNpuUtb/IAHhEgYyrPGbNrEWnTYrK5u18XwTLch31nAbbGqxJ6i/T38ayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpcIP13bDup2GebrLbjVgkyqJzky2EKm1ymY4CzU5DU=;
 b=vIsRmlMeN3Aa3wcEuRmSm8lYYBTAepOi7bZukcxMeaQiXQNGXcwJD1ZfCpWTEvHIHmA1BDkW7TClTVqY18ACk9TqiligHBwCacBnXcCadyoiFyExeRgjlt/qKOU5gToZ+RnyMGDk4mH1JYPJgsyKnecJHeiZP1js/LHF0f8LMlvT7Bs2cRF+PQhxbAJncmHZZurhg2Jlc8IiYP7T/Y0tShxBviYf9deixKtDtlL+KuoOoSE4psx+nSQRzjkle5vNrBLLp4MgvYhchF8FW72a25dXJ+6OosO3WnBwK55Kq7ZzfNnnbWf3INXqXNbRNAjsgIw1Dk/0R4V+j6yCKwURKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpcIP13bDup2GebrLbjVgkyqJzky2EKm1ymY4CzU5DU=;
 b=KXubNsIUeotg6z2bRNA0P7E9liSF2UgY/wMmpdxZNKh5gzaOxy6ex68YxUbAmEBkbG24TJPMBrUNYYc88oRDr8ubEJ/1q0ZhheU4WdilHCXYtoyndvw5XfO+icraRWiuS2/npyB+GNSbFxMlki8oQRtMPMCsSCLPckF8y+s9b4I=
Received: from SJ0PR13CA0003.namprd13.prod.outlook.com (2603:10b6:a03:2c0::8)
 by BY3PR19MB5105.namprd19.prod.outlook.com (2603:10b6:a03:360::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:12 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::53) by SJ0PR13CA0003.outlook.office365.com
 (2603:10b6:a03:2c0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.7 via Frontend Transport; Fri,
 12 Sep 2025 10:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1E1DC406558;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 01298822548;
	Fri, 12 Sep 2025 10:35:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 04/19] ASoC: SDCA: Pass SoundWire slave to HID
Date: Fri, 12 Sep 2025 11:34:49 +0100
Message-ID: <20250912103504.2679226-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|BY3PR19MB5105:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1d10a253-7b06-4710-fcea-08ddf1e80d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oqI7wXdVG8Z94rkXbpeF7A3khb2GRSUikbTRO/hlXgwAv8s8hMIeorJK+8D+?=
 =?us-ascii?Q?ZoSsSYY9yr/smI665t+7yv8db5G3oINPVKGH9XHMKgFMb1Lgj4jTVU7zqTk2?=
 =?us-ascii?Q?tBVyesSkgfG7uF8htcJFqvKFjr8syexRG7Aews4wh4j7dE9tvgz2RZ+9WfJR?=
 =?us-ascii?Q?J7+mpsYIga+sBaiYfrguqs7yf4YY0Xu7zd8agdnpdMnbjOymO+eIFHTN6H87?=
 =?us-ascii?Q?81lpQICQlHPQnLW5qylDqX6DqjEpOCdtXUd0WDWMBrgTCdy2yTV0z2qjY/ty?=
 =?us-ascii?Q?+jWBavw2G5MKVyvDKr3nEFNfuKqVWf4zzhrNvwd3oVf58fUmNCOmlFqK4lY+?=
 =?us-ascii?Q?optNlZbxQM8NQjThluFMfcn2SAOcxBOf7hi+PuQYBtee5lxbtNECWzuNiv5h?=
 =?us-ascii?Q?XGMYROHf4D4tEOzN5FJ18nm50K5vhJffeg8/2mvAwhSov9kUST14XIBLDpKI?=
 =?us-ascii?Q?nKZx34wcsMY0RLhE9X7GFPUDEqgNcnkdhdjmud4mZ1r6+mj44WP2NiviscyT?=
 =?us-ascii?Q?IYAaj9SyxYGnsbg7HuRbjAkSE0lVCfKP4yKWLNg5holRhEczvezXbFrmcgvn?=
 =?us-ascii?Q?FS/IxwnwOZ+Q61w7U+8kvq1YaJxzy6GPewy7fiIK8nh5gm7bAxs+iMvlMWxZ?=
 =?us-ascii?Q?XmiWqylA1WlsCNDTxngc/Lk9REcLqLP0G4daTllzgNMmNGVKKzBQoFUAoBr/?=
 =?us-ascii?Q?lvz/CHFr14yQoGs3zNzaS0aBQ9fAiSaLc4yrNxLkn9VFgFi6AE0yjv6zYSlw?=
 =?us-ascii?Q?xzcALsB6NzuROzxbBM0rczs/wnDGl2IVn5IwnjdKgJ+ngbdWLkgY0ccVtAWg?=
 =?us-ascii?Q?WPjus2t+5UjyxAx8b54jBsZyvTOZ/YhAlnhNQQfSVXquuUmCStw2627tnX90?=
 =?us-ascii?Q?nv/RJ0szD94oxzmD+Lk9ZTU86I/PqsMhX3TLQ/FTmUw3LaE142cfhjtSomei?=
 =?us-ascii?Q?BmisNPw+bBllBv94z2L5gk68ljPHMI4lGc+Nz6e7LhTJuEKiFwJBHjg8Imiw?=
 =?us-ascii?Q?MpLfXAZVcpfq/iwf1alfqfziXcuqBPu5uvC7MY3v6a/0QL2NzL/ZidqbHUyi?=
 =?us-ascii?Q?ryS8Xa4uBjv0pfbjvv1RIKE6pLBIv/LeOm+YOyHMbGsGrcYf4gL8naA2HG9j?=
 =?us-ascii?Q?Q6Plhn5CZW1YuIuOo9jAjJFKU7gI26B7+z7c9/J7kCOlQmCUCNv0CikdFyVc?=
 =?us-ascii?Q?jkUYZBsIqIVrKP1/bWkyceHpcuZJoLkPKpgv+wCSiEw4c1zhcE/iqy7nZ1VC?=
 =?us-ascii?Q?q51i3n83JQnhH099NFMclbNRVlh8zXZX8AMRATVjJOdgsbY5glddUVj8fjLP?=
 =?us-ascii?Q?Aqc6/dwUZUrs8cGzWaHlRJjzrrhZHtyzOFjUtz4QCtcVF1LzHYzP9xion6NQ?=
 =?us-ascii?Q?FdTPC/EP9qiGUyoQWSMrHeySayDV2OOC62KkXw/JEMQ6YAmyIv+BqKisv8Ab?=
 =?us-ascii?Q?J9exK5+ERCg1lCxJY6+9GuKXqYs/LnHwzp6mmuWJ4FtcjSDckTr+bfYrkmK5?=
 =?us-ascii?Q?eHEk4ZjbXynNe+CgVkuBuydJq1RcxgM4/ujO?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:11.4365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d10a253-7b06-4710-fcea-08ddf1e80d7e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5105
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfX81B5a2OHFs2G
 UOT/yK+df7Gwt5oLQLmNi3ssz2k+sBT/rGAqpY0s3rCT5/uErHZvl/dLShcNHXedtNlR1ungYtk
 y0FPyuqQaXpskA8T07lO/9lnb6TEi57WSBPTZkwsQ1ROOUAdwv4qabCAkEzJHEIa1XT6YnaLU5y
 J2oBLBVsBWMfqmw3I5unQLdf3E2iRc7SjyaNQf9WSJUOgOV2UnfGUdwV6Tfll/t/yNGhIMhXDUc
 di8MAJLhsWfNu1Tf4ZGmgQ/fuInTJVv8CoLZgaYQLM7TZn9KYlM6IQvlgTE2iEBnliHQc+XzGrF
 zdorIkGKBy+wmk9k/Rehj34i7NHJcXw1GBy2wJ4YA3xWwDX84V1XsP+h4xOOn4=
X-Proofpoint-GUID: on5DQg1ozZdivnqTF8VjVgeP5YCg7mBl
X-Authority-Analysis: v=2.4 cv=X71SKHTe c=1 sm=1 tr=0 ts=68c3f764 cx=c_pps
 a=fcxaBkvc0RdMyUcE3d7x9w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8
 a=--uAHVF7q1budoVWL4UA:9
X-Proofpoint-ORIG-GUID: on5DQg1ozZdivnqTF8VjVgeP5YCg7mBl
X-Proofpoint-Spam-Reason: safe

The SDCA HID code can't assume that the struct device it is passed is
the SoundWire slave device. HID is represented by a Function in SDCA and
will thus likely be implemented by a child driver. Update the code to
explicitly pass in the SoundWire slave device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 include/sound/sdca_function.h   |  2 +-
 include/sound/sdca_hid.h        |  8 ++++++--
 sound/soc/sdca/sdca_functions.c | 20 ++++++++++++--------
 sound/soc/sdca/sdca_hid.c       | 12 +++++-------
 4 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index ea68856e4c8c..51e12fcfc53c 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -1332,7 +1332,7 @@ static inline u32 sdca_range_search(struct sdca_control_range *range,
 	return 0;
 }
 
-int sdca_parse_function(struct device *dev,
+int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_function_desc *desc,
 			struct sdca_function_data *function);
 
diff --git a/include/sound/sdca_hid.h b/include/sound/sdca_hid.h
index 8ab3e498884e..3a155835e035 100644
--- a/include/sound/sdca_hid.h
+++ b/include/sound/sdca_hid.h
@@ -12,10 +12,14 @@
 #include <linux/hid.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SDCA_HID)
-int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity);
+
+int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+			struct sdca_entity *entity);
 
 #else
-static inline int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+
+static inline int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+				      struct sdca_entity *entity)
 {
 	return 0;
 }
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 5f76ff4345ff..2d5d20e23e3c 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -1253,7 +1253,8 @@ static int find_sdca_entity_ge(struct device *dev,
 }
 
 static int
-find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
+find_sdca_entity_hide(struct device *dev, struct sdw_slave *sdw,
+		      struct fwnode_handle *function_node,
 		      struct fwnode_handle *entity_node, struct sdca_entity *entity)
 {
 	struct sdca_entity_hide *hide = &entity->hide;
@@ -1328,7 +1329,7 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 						      report_desc, nval);
 
 			/* add HID device */
-			ret = sdca_add_hid_device(dev, entity);
+			ret = sdca_add_hid_device(dev, sdw, entity);
 			if (ret) {
 				dev_err(dev, "%pfwP: failed to add HID device: %d\n", entity_node, ret);
 				return ret;
@@ -1339,7 +1340,7 @@ find_sdca_entity_hide(struct device *dev, struct fwnode_handle *function_node,
 	return 0;
 }
 
-static int find_sdca_entity(struct device *dev,
+static int find_sdca_entity(struct device *dev, struct sdw_slave *sdw,
 			    struct fwnode_handle *function_node,
 			    struct fwnode_handle *entity_node,
 			    struct sdca_entity *entity)
@@ -1381,7 +1382,8 @@ static int find_sdca_entity(struct device *dev,
 		ret = find_sdca_entity_ge(dev, entity_node, entity);
 		break;
 	case SDCA_ENTITY_TYPE_HIDE:
-		ret = find_sdca_entity_hide(dev, function_node, entity_node, entity);
+		ret = find_sdca_entity_hide(dev, sdw, function_node,
+					    entity_node, entity);
 		break;
 	default:
 		break;
@@ -1396,7 +1398,7 @@ static int find_sdca_entity(struct device *dev,
 	return 0;
 }
 
-static int find_sdca_entities(struct device *dev,
+static int find_sdca_entities(struct device *dev, struct sdw_slave *sdw,
 			      struct fwnode_handle *function_node,
 			      struct sdca_function_data *function)
 {
@@ -1448,7 +1450,8 @@ static int find_sdca_entities(struct device *dev,
 			return -EINVAL;
 		}
 
-		ret = find_sdca_entity(dev, function_node, entity_node, &entities[i]);
+		ret = find_sdca_entity(dev, sdw, function_node,
+				       entity_node, &entities[i]);
 		fwnode_handle_put(entity_node);
 		if (ret)
 			return ret;
@@ -1927,12 +1930,13 @@ static int find_sdca_clusters(struct device *dev,
 /**
  * sdca_parse_function - parse ACPI DisCo for a Function
  * @dev: Pointer to device against which function data will be allocated.
+ * @sdw: SoundWire slave device to be processed.
  * @function_desc: Pointer to the Function short descriptor.
  * @function: Pointer to the Function information, to be populated.
  *
  * Return: Returns 0 for success.
  */
-int sdca_parse_function(struct device *dev,
+int sdca_parse_function(struct device *dev, struct sdw_slave *sdw,
 			struct sdca_function_desc *function_desc,
 			struct sdca_function_data *function)
 {
@@ -1953,7 +1957,7 @@ int sdca_parse_function(struct device *dev,
 	if (ret)
 		return ret;
 
-	ret = find_sdca_entities(dev, function_desc->node, function);
+	ret = find_sdca_entities(dev, sdw, function_desc->node, function);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/sdca/sdca_hid.c b/sound/soc/sdca/sdca_hid.c
index 967f7ec6fb79..53dad1a524d4 100644
--- a/sound/soc/sdca/sdca_hid.c
+++ b/sound/soc/sdca/sdca_hid.c
@@ -82,15 +82,13 @@ static const struct hid_ll_driver sdw_hid_driver = {
 	.raw_request = sdwhid_raw_request,
 };
 
-int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
+int sdca_add_hid_device(struct device *dev, struct sdw_slave *sdw,
+			struct sdca_entity *entity)
 {
-	struct sdw_bus *bus;
+	struct sdw_bus *bus = sdw->bus;
 	struct hid_device *hid;
-	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	int ret;
 
-	bus = slave->bus;
-
 	hid = hid_allocate_device();
 	if (IS_ERR(hid))
 		return PTR_ERR(hid);
@@ -103,8 +101,8 @@ int sdca_add_hid_device(struct device *dev, struct sdca_entity *entity)
 
 	snprintf(hid->name, sizeof(hid->name),
 		 "HID sdw:%01x:%01x:%04x:%04x:%02x",
-		 bus->controller_id, bus->link_id, slave->id.mfg_id,
-		 slave->id.part_id, slave->id.class_id);
+		 bus->controller_id, bus->link_id, sdw->id.mfg_id,
+		 sdw->id.part_id, sdw->id.class_id);
 
 	snprintf(hid->phys, sizeof(hid->phys), "%s", dev->bus->name);
 
-- 
2.47.3

