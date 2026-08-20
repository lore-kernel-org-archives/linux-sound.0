Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB1C42BE99;
	Thu, 20 Aug 2026 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226729; cv=fail; b=afa9gZRpj5t2f0b1wmH/K2mXge+l95cR8XdkRsOJ003pYaoF+qlvgB6AU0sUkmBtcLGYwmcYhKlxeVbeZxaQhl8OBYEmOnT+XM/xSnz2etC/vcbgg0S435KxLHePGSjIHSfPmD8RMB+48dzfQXVjtMeRp4NHkmEW8jlcnTTQ4bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226729; c=relaxed/simple;
	bh=2bqI2s3ba8hX68mmq9jTPJdh883J76rQ8C1i0WbEKoY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CqrTn8AgW1wya9pLCjymRhPvpgSN/HoDcygIiS9vO/8zQMcTUNQDfh3+PoaltMjzXumyAcPoWBJ26yWoz9ZbEuGUPhiY2Ew9Zsc3jdajXjsyvcWSxuv+rSlfPqxLMDq//WUHO+8eI4wnGN8ZQkKN4fhXPGM5kYjLWESCDdmgKkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lYcy3wkP; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RjL8frz7; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lYcy3wkP";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RjL8frz7"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7EU8x3543179;
	Thu, 20 Aug 2026 06:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hZLHx9eLhj9odv91aqJabg4l4HJqc/qoCfd+odngf
	0U=; b=lYcy3wkPnEOa2sEVcHNwR04ib8hho63KoaDE1+Hk+x7zv/IW9rxfOvE1L
	NWVx6YVy4mDwYK65GetxIbeXQYdpqMCaAxnTOURw1y2gf5J5OsQpRcmuYoXgfjwS
	GfInfM4sVf1HU7E6UkirjuZjj00oiurojbHm845k9/Kond7qf3lIKQ6n6A+BGcnV
	4vudb+0mP/cL0BhgPGA21pUJTtsO1XgkFeVd1CuZwbH/aJI+0yXHgkIF0AJ+IF81
	8EMuyXaLWIDnti9Orv1SORSOnr9VOH+E9LAfcRlhOnnjNi2UyEgmiMcDIGxJnjL4
	mW3eF0JUp/BF5Teh5g8CK0gwRVR9w==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g5qrkayq6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Aug 2026 06:51:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfKW2wucsWj0UvDb1hRuLIEIqUsOggr++9qMga4YkBenb2Eyc2jGcQpqkxe4GDk4QCTpVTYkgUIyxbZ4n3H/TPpIAI1qYLGN6SLvhY0DceMnnQrKU75aPa7ecvlizg14QJzclu4IgtGL77vbaULoMAI2LuaUuMj0Eeg+ygheO243RJbVZZKXU9TY+yjx7X7XeX3ZGqWrDqXkWSv2UySd2yqOttg0ZnA8FSrct8NzUUc/o2iXpK5xdBN2bXDi333FQSooIJhFJmXsuZUhChiHxqg8AJ9PXcOAccf1+RUQpoB/2fqt6oag2wlNddJINrP8rV8SSUIkd+P+KRK/rjc/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZLHx9eLhj9odv91aqJabg4l4HJqc/qoCfd+odngf0U=;
 b=I+F6K9ucvBWjDwc4faEP/Zp3oOKphnNKi3om/6UK2bvSg+Kf4jgknZwR6Ad2d4z83eQKXOk29ssILi626ojXoazfh2m8InwavGnSJw31ttFfkgHdimno8DsVHqfZg5gOUkrvKXnbkjSbQBtJ8RFUMpIMGcTyNUGZ8/unatN1CV3fkfA6DJ/jcfOyLt0pPzOcHizaVfuw257nPejP1UD/Txby7OqnlBjtNbezorSXQXeGV5jmhN2+MFf3y0w6RMrxeyyGdroUz672B9qFquZAIhs7pSTxz2omRf6CUYqsBbGHnugUnaiQgd8ms7k7yvL3hl9Qwrdn5grrIY5+JS9OSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZLHx9eLhj9odv91aqJabg4l4HJqc/qoCfd+odngf0U=;
 b=RjL8frz7ZBmoNe+Wxfhtlz/m6b35r7dBl43u/m5hbGBqd7Qh5pmJxhnFbZX64T4qF+3BfG5qxU1qAYk2GZrbCtrL3kpOCM2ERbY9IFit9R7YyZAQdE8xZ8k3QIVHUzAdHX05RZBc0eYB8RKcHrcO+cTIjkNBtpgndbLSAmh3Vxc=
Received: from SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18)
 by DM4PR10MB6888.namprd10.prod.outlook.com (2603:10b6:8:100::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Thu, 20 Aug
 2026 11:51:46 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:39e:cafe::96) by SJ0PR03CA0283.outlook.office365.com
 (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Thu, 20
 Aug 2026 11:51:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 20 Aug 2026 11:51:45 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 06:51:40 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 06:51:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 20 Aug 2026 06:51:39 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67KBpNea065128;
	Thu, 20 Aug 2026 06:51:34 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 2/3] ASoC: tac5xx2-sdw: Rename gain and volume macros
Date: Thu, 20 Aug 2026 17:21:13 +0530
Message-ID: <20260820115114.1203-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260820115114.1203-1-niranjan.hy@ti.com>
References: <20260820115114.1203-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|DM4PR10MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: e7424893-c9ca-4cd0-e918-08defeb168bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|7416014|36860700016|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	g4E7mr+2oXoDzyWopSOGb+X0WSkWDKL0jAkbORuQ/FAGnvie9AMC2KKPvqFJ4apjhqrb9U93PysvGsQQv4eK8B3+oKzfO+SZQL2hgECadw4XPImttkPgAVr4VWV/sZalAeIPOts/dJBvUmHUYMI2yLBtLZq/YpueMGrO/9xLJQFPKszOLJMp8V7lQfRgjg+4Ba1+SyehBQN7mCApPTmz0VTft8W/RIQQKMnF8EDaTasASc7S9ddbw5xSECTxsLPqaokV4DKVdsHAIIdRbdqB7puOI4AAdORyBUrVU9S7hUUhgw0Zhfodz7HIJJr+XCNSFZUTN40AFoRYw1SPVIrdKIzIfbAWMbb9nd16owLj7LS4o3M00Zb971qCnP0Oph0ucQxbAUmkkTAsclyA2ZmGMwGKufX+QcIoDpZjGQsAL0cH9ixF6BMFUbNkzFgTi0CKSTAKL3fre9Fu6HUeAXbHojj8KVCj1VPgI8V/Sl+77wvnXqxVklqHK6RJ6CSyOoosPVx3gWnI5kydGMBpX2m3oBXvKFZghTW4bw6hO83OhA9ASkGTBtAiRYPc9YiyVXmPFip+PSheH0xuoHGbFCvzPc0X7y0qmAgqu1qx7xQF/dsGRnV+K23ysZZQONRNFB/Dxz6IkJ1FRH8QJYSU93OMSuviFkTruXNyOfgyj/rzubVmZlV01x4nmtqJCNBlmyPeDeLYJixRlLtNW2C3Tpqe4w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(7416014)(36860700016)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rSIRmj31+69qm9p3gLSfN3soTNPB0mFLmF9LXmT60LzElQtwhvwZFIH4RaeHOfjIbDVrM56LPWgfW7p9sg1i9WSAqIgBvNnkLHYULaSYENyGj0Rucz8Rt01EHni6GAdW+9177RV6oLqmnlVt5dX+bd9tfZrBN1PvJc9V0sNIcT3WO2K+4TZi7cJ7mAXGictfxyqXRupGv3iKlmsRwdmGUk/G83bVXu9qc3ZKm7D+CyfgH0GzJ8sBquwsQMsKdF1bz8dfl58yKkwlFZEKuANv7NmiZLYC9d+AIaE4HC1KZ1dmdrOroohewTOExwluT5qEm1Q3CYtZvZ54+NtSqtCF6ML3TUfrvdoPZ0zV+17HOzRBvO65OubRnrqx3d+Byhul2szAF0VCqN4IB54BP1ypTopga6v1PJLq4MqApr0XhbRLMfl4t2jJLqPPnyYqvnjk
X-Exchange-RoutingPolicyChecked:
	XmhP6osFGOuIxHYXfQj2uGIXe290bKjXd/48JhUMcFHVW3eDVP7r9IBDgnU7jPhEqeMoaMAR3MAAiVTYdtX4iW/8npIxaTx29SbXZ5MYUtrmsawZRslYCCZDa97N4XPoyEsVOL6q7n/o4Kj96wDALEtLw7c7Q3Z+xUppKIv5OAsPNgyjXV+xMaJgwCYvuaO//6zsadoieh072R7Sg4KdEtvQH0xqJ2gcJelr8f+awk4UK17lOSiu2wmuqDeCxezZfNArDCB9NLfR1mViSaSvlpLhd+5vBVcVMvGV2TsWTSNTuKrDIbadTEtEN95AtFczvLwdc/IXZzpGdAOhBt11FA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:51:45.1664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7424893-c9ca-4cd0-e918-08defeb168bb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6888
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA4OCBTYWx0ZWRfX+STLAp9wmRH9
 l2+FNfSc98aXBNyP2EBnwbrl/1wcOH8X6qmh3Gft7Y+PnlAk1CkyWpm7DunZgykEwDcs3F+qfQo
 9QuBUxLyI9MhSVWPFXTBN6IAPllIIL5xJ9OGw2CE9GmMR0TIe67qaGULGcrRTWivqTfrSIzrfn/
 qWV7vsZ42OrghsgTZCIINAGG64DH6Hl+Pi4INi8rBz+A8WPhgFu4UZu5lX/YiOb8ZWAFievhD8A
 cSBtmuGVxnEIXWsYFoq7NAS9S9Df7bAfv5eCBtuxZJAcAB1npwtEopyb65o13NSB5MT8l2dvr7d
 4i6FgqBsiG/KeQngkSblsHT3ubRn2vDd4MQNC8ds6cMhlSuI+BvSJVZ4WdgkeiH/+ujRv9+aGh+
 8/cLFq62Uuy6sFpM2brVyDO7hE6Rxvs9D6rDkenUTqxGxqqnaWWaM4jm/Gds7XYADfKN18vYc08
 mV2GQ9ahP+HdFEOB4jA==
X-Proofpoint-GUID: REGMynC2l8p_bckIfsxx7x1JbP1dk2sA
X-Authority-Analysis: v=2.4 cv=JprBas4C c=1 sm=1 tr=0 ts=6a86ea59 cx=c_pps
 a=6O9SViV89A8ZJb2Gg0v8VA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=3lyA3a0ieFhL_Wy8GbUA:9
X-Proofpoint-ORIG-GUID: REGMynC2l8p_bckIfsxx7x1JbP1dk2sA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA4OCBTYWx0ZWRfX3SDCcF50EIti
 lU85mAiYGrjQa0BfQJlhaVQWPnM1CnZMclL85YHgWfWuHE2sn1TwbE54ihE/PuHmsfAcJ1ye/t4
 AUUxJmmFl4M6NyDAjngHg8Ul7M/5+u0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200088

  Rename gain and volume macros to match the hardware intent. Currently,
both TAC_SDCA_CHANNEL_GAIN and TAC_SDCA_CHANNEL_VOLUME are defined as 0x02.
Keep only TAC_SDCA_CHANNEL_VOLUME and reposition TAC_SDCA_CHANNEL_GAIN to
0x0B. Remove the now-redundant TAC_SDCA_MASTER_GAIN alias (also 0x0B),
replacing its single use with TAC_SDCA_CHANNEL_GAIN.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
changes in v2:
- newly added
---
 sound/soc/codecs/tac5xx2-sdw.c | 48 +++++++++++++++++-----------------
 sound/soc/codecs/tac5xx2.h     |  5 ++--
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/tac5xx2-sdw.c b/sound/soc/codecs/tac5xx2-sdw.c
index c062065a8..065e7d456 100644
--- a/sound/soc/codecs/tac5xx2-sdw.c
+++ b/sound/soc/codecs/tac5xx2-sdw.c
@@ -123,9 +123,9 @@ static const DECLARE_TLV_DB_SCALE(tac5xx2_dvc_tlv, -7200, 50, 0);
 #define TAC_DOUBLE_Q78_TLV(name, func_id, ent_id) \
 	SDCA_DOUBLE_Q78_TLV(name, \
 			    SDW_SDCA_CTL(TAC_FUNCTION_ID_##func_id, TAC_SDCA_ENT_##ent_id, \
-					 TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), \
+					 TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), \
 			    SDW_SDCA_CTL(TAC_FUNCTION_ID_##func_id, TAC_SDCA_ENT_##ent_id, \
-					 TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), \
+					 TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), \
 			    TAC_DVC_MIN, TAC_DVC_MAX, TAC_DVC_STEP, tac5xx2_dvc_tlv)
 
 struct tac5xx2_prv {
@@ -385,33 +385,33 @@ static const struct reg_default tac_reg_default[] = {
 
 static const struct reg_sequence tac_spk_seq[] = {
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
 };
 
 static const struct reg_sequence tac_sm_seq[] = {
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
 };
 
 static const struct reg_sequence tac_uaj_seq[] = {
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT), 0),
 	REG_SEQ0(SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
-			      TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS), 0),
+			      TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS), 0),
 };
 
 static bool tac_volatile_reg(struct device *dev, unsigned int reg)
@@ -468,25 +468,25 @@ static int tac_sdca_mbq_size(struct device *dev, unsigned int reg)
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU21,
 			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SA, TAC_SDCA_ENT_FU23,
-			  TAC_SDCA_MASTER_GAIN, 0):
+			  TAC_SDCA_CHANNEL_GAIN, 0):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU113,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_SM, TAC_SDCA_ENT_FU11,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_LEFT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_LEFT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU41,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_CHANNEL_RIGHT):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_CHANNEL_RIGHT):
 	case SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
-			  TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS):
+			  TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS):
 		return 2;
 
 	default:
@@ -531,7 +531,7 @@ static const struct snd_kcontrol_new tac_uaj_controls[] = {
 	TAC_DOUBLE_Q78_TLV("UAJ Playback Volume", UAJ, FU41),
 	SDCA_SINGLE_Q78_TLV("UAJ Capture Volume",
 			    SDW_SDCA_CTL(TAC_FUNCTION_ID_UAJ, TAC_SDCA_ENT_FU36,
-					 TAC_SDCA_CHANNEL_GAIN, TAC_JACK_MONO_CS),
+					 TAC_SDCA_CHANNEL_VOLUME, TAC_JACK_MONO_CS),
 			   TAC_DVC_MIN, TAC_DVC_MAX, TAC_DVC_STEP, tac5xx2_dvc_tlv),
 };
 
diff --git a/sound/soc/codecs/tac5xx2.h b/sound/soc/codecs/tac5xx2.h
index eed8e6cf3..a84c5ca51 100644
--- a/sound/soc/codecs/tac5xx2.h
+++ b/sound/soc/codecs/tac5xx2.h
@@ -174,14 +174,13 @@
 #define TAC_SDCA_ENT_SAPU29	0x35
 
 /* Control selector definitions */
-#define TAC_SDCA_MASTER_GAIN	0x0B
 #define TAC_SDCA_MASTER_MUTE	0x01
 #define TAC_SDCA_CHANNEL_MUTE	0x01
-#define TAC_SDCA_CHANNEL_GAIN	0x02
+#define TAC_SDCA_CHANNEL_VOLUME	0x02
 #define TAC_SDCA_POSTURENUMBER	0x10
 #define TAC_SDCA_REQUESTED_PS	0x01
 #define TAC_SDCA_ACTUAL_PS	0x10
-#define TAC_SDCA_CHANNEL_VOLUME	0x02
+#define TAC_SDCA_CHANNEL_GAIN	0x0B
 
 /* 2. smart mic function */
 #define TAC_FUNCTION_ID_SM	0x2
-- 
2.53.0

