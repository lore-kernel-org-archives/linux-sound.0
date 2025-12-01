Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF342F5335;
	Mon,  1 Dec 2025 11:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764587694; cv=fail; b=oHOLrdz9pPsOg8QM2C/v2hjkk5IN+vVg1mtOX/kUB+CqfvnFi5B4MJwVYBOidk6605AyDKvnDQJwu3ySpMUCqUgnaVJ1IX5iz82nE+BSUO9bDrdGiqtGSA1ZOvbIVctoixmLFDZTdHau9WWc0T1Gyr/XmPhOwEOle5HjYoqbAho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764587694; c=relaxed/simple;
	bh=cTvvfgtpurC8dBJK4xxUhHHpD1S1JIyMBVHLfO5/XXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HsuufCBHC1n4nQA4c2C0G/UDKVpqNgh2qjRONR9gPyXjo3XIn5HKljwKl6FNZCwAc2b6Qkxp7gbS076aM0N8HJi4Df7UeHSqz3ZUeeTcMbVmMJBh3RE2NDNFnNpTpDUxA6OaKcZ8hkODy1h+cWaN7Xrf6F+6bf3byTWp8JlgXfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HZkBw6HQ; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=ma11DoS0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HZkBw6HQ";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="ma11DoS0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B15Aob61594117;
	Mon, 1 Dec 2025 05:14:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=j4iVRW53xbIbg7uI
	AxPOI+/jYXpAwKHJaWCzOjjecZc=; b=HZkBw6HQVLjzlmB9kON812Q+Frb5Hwy3
	3hIcjYU1GkG3R5RQprP2qA6TjCcGlSZMSkRq3JIULx8j031PCzYs6hYqEmjSwo/e
	kzGr+pzqN/cqCEB8dzpV7rHf8Pk2LsX0HWd/Dgk+eRSJrFGm4d0xBB2R4SkBBnt4
	A8MGHtfHAI8sVnYUmcLGAqd3/DRouJbSxuGraow1PIT4HEmyFmgRjFQ/2QIB3hFy
	E58BKqKZMV3RbubiyyGu2tmbS3iqWjoo0qFEOXeWrSlReVitmDy3KykwKkXsqSsB
	RPLcxjcOCzevKmkda9mWowCffwy4iaORra3dGYAnShbksOuYiu91eg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023093.outbound.protection.outlook.com [40.93.201.93])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4aqx4khrge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 01 Dec 2025 05:14:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/mhXalHSyZOMe2+LL2l28np15QJoos4vpgT8SWW9fQZ3UCt1d4QjAwm45EslKemjl42uREHZO08PpczLgdoHlpkuxtMFe2scfUBx4+cZHtG6rW/RUvRxh1IZAhousIHdutmAFY/kq1dXe7AskJn/HVPLoJPskKYdjzsPYZuj0KMFeHDw2Qj9hjWF4yAv8OQrhKw1FzR0iao7llpMtn3S4ybxIIaIKpiifLIqbPeVkFKtopoIrNQrKKfP3RxK1J8cdqJZY6jG7vjMDEMU7fA8k4/5SzHAusF9/cZzptuV/ykBO/1dJncns0udpcqaJXwUl6l2XhycrxN3Dc9Yb7MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4iVRW53xbIbg7uIAxPOI+/jYXpAwKHJaWCzOjjecZc=;
 b=X3ZjMF0ETxPyveEWUffplIYYWPuIPPfPqPGCOgtd62CEaVCTQwpXMRbOqWdI2jx0aOELGHpGt2nJr76EGlJUWGnlLfm95T6EtKvOnO7QErHh2+HaFPUkdRtm3HGq0P/dpXltwtzFHZPcIgw8+sviP0SmZPMW+ZLcazSDzq45jIyu5ZydZdVq6DUjpV1McxB/boFpHndgCBkljwzA5hUOPcCISla29OrZWexpM1dhRB/ul88U/uObkgTJwu4oPqcKuK3m2DA577rENTVH6cN6vyg2z75pQOWuitnizHo7SS+nxGRz8TQRPEgjEXYtyuWSutEBToiUXuHpxzqGtMyEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4iVRW53xbIbg7uIAxPOI+/jYXpAwKHJaWCzOjjecZc=;
 b=ma11DoS0ohRYQCIsWHD8C4X6QoRqWHS+IGS5POfJXUqYY1i6eu6/M7MKtiQdYwR3a/zMu6PWjaeI1srP2xuOLz7AQ6NZpmRpwm5sgFuqKbPhpGvLIOMvfBT+zdS+DDdnEc8Fc9+DaoMCLOt2dhWn49lrLb/Pr9B0uek5exw76I0=
Received: from PH8P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::12)
 by BY5PR19MB4097.namprd19.prod.outlook.com (2603:10b6:a03:223::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:14:33 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:510:345:cafe::33) by PH8P220CA0020.outlook.office365.com
 (2603:10b6:510:345::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 11:14:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.0
 via Frontend Transport; Mon, 1 Dec 2025 11:14:32 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3FF9C406541;
	Mon,  1 Dec 2025 11:14:30 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2827882254A;
	Mon,  1 Dec 2025 11:14:30 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: cs-amp-lib: Revert use of __free(kfree) back to normal C cleanup
Date: Mon,  1 Dec 2025 11:14:29 +0000
Message-ID: <20251201111429.43517-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|BY5PR19MB4097:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 51aff13d-d877-4498-eee4-08de30cacda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lGbqmRbbRFjYpCicYpqkEWdA55YuJMSydTLFLxmb0H/cgK/BA4C0IzyNnERI?=
 =?us-ascii?Q?w9gYulXm5phWFmd7YMTYsj9EdYDVnuSDJc0zUPCioXiziTFZGFW6Z549Q84I?=
 =?us-ascii?Q?oxwsWk9JC8U2rZRtR9lWM08RM0cs+3dQwJgE9atINQMlcKmqnrsCJ0XcpkdC?=
 =?us-ascii?Q?sJTSP+r8A/B08xn9xGcCJL2BWg0uNW8LRsZr8SESg/M/g9KD/zo6D3EQN5p8?=
 =?us-ascii?Q?JpoMkVy9MrcPfziVonww8VOoyZIeDMes/Kv85uOLvH/ECdnTY82YnNZGijp8?=
 =?us-ascii?Q?R3NdLUaff8e8o0XMjgzTa+13azUIVDIYZC5mfURmrROFvvpDDBpIytOCAgKq?=
 =?us-ascii?Q?IEJcp4MnEK3pm8TfxZ1fKwizyPseYhnhQOtbFn3OYXxlaQ+QWmMBmn7nvZTh?=
 =?us-ascii?Q?Tb++RSjIWr4/NU/QV0JwVltj/FQ6EM/kg1Dt+87XTgcrlHrXIFfikyzd6j97?=
 =?us-ascii?Q?MG5ESIiW+ZjD/EmtNr5AotRoVDFBECcvyaCU2wm/Dwq/QQgi/T2QeerSjAH5?=
 =?us-ascii?Q?YjReetjVxAycmMUBNkrhB6hogt51vNKXVZjaNHGVy37LEzsoCwZFbZIpZiDA?=
 =?us-ascii?Q?i4YRokIUNxh3eJDW702SGhqra6+pngkTqIImhdRA1sgztQUzvimpmkheYfm9?=
 =?us-ascii?Q?UCpq5co0itwQbrmx0EZtNiF7qKzGVfC+efRaNN4RgpF2QUt+JOR2KAt2nZEW?=
 =?us-ascii?Q?Z+blj93XGIvSVrPGHpG/OrPKuwWTglqYW6UXNLjjzV39qPmBrZ1hoMUQ8sKn?=
 =?us-ascii?Q?38VSl9UZai2tnSaQG4ugkI2zgcvUhHpiKq3uDMPclV6yPJhoyNXDB1CSjkO8?=
 =?us-ascii?Q?L40myp6inxqGWoAmxwfSL48ZF/2p8UGJuH7fLSQjLMZqjB787j1Izpy93irR?=
 =?us-ascii?Q?RkF0IotPRLKJg5thvBho0VKfplb/7wOWi5c3rCiveT1qZh4sHp2G9kj9S8bV?=
 =?us-ascii?Q?bOlSQR73d/43oQ9fyttjW2jib6KBpBu1KbUEtBmN19XgBGX0P2aVrz08HhH+?=
 =?us-ascii?Q?1YFsNYzpaD5DIK6kL+dpJTgXoR4LetEUVuRM5mg7cgPo5Qvb13LSP5ywlS+Q?=
 =?us-ascii?Q?NcHXmXYGUv4fMM1Blhol9OrtOMzewaSkg/+KIjW+M2llRVUT0ToehAkbmVP8?=
 =?us-ascii?Q?uylHKicBvRDYoMh3rvimbg/DqYOI3Mqby7wDDMEirmnwDzZl1PPdhhqTgkft?=
 =?us-ascii?Q?9WFSdoDr/VwUeR5OZbZ45JZSRluhuxyRQMPvx9qj4b//Hxn/1xFF3F01jOyS?=
 =?us-ascii?Q?DnFpZUFinksHdJq3wLsc+AUuLtHegVEStONQGywzTFFy08PnRnwYKf72FqMh?=
 =?us-ascii?Q?LuAn0YotoHyWCXefMtwm8pmGg+xkWdRcKZydi9snA5Z2WUh99z0HUIM13rka?=
 =?us-ascii?Q?JATATeXs652NXCxtXpHCmCCncAJciTdnGXR08GO7ols0uCjMzqL0b4XZhCH+?=
 =?us-ascii?Q?DgiGXtL2FtSWiP2k9l/5z23u00KpFLCbQF4GfYgQRP2J1dpcl5F8nTkHL9QN?=
 =?us-ascii?Q?meVzrYMdtiNKCH9Uu2pWR7p6OCHehv/T/ghk016YD4/Q5WZUbq7q7UBT1OjK?=
 =?us-ascii?Q?Ai+BTB75LromijNscm4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 11:14:32.1333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51aff13d-d877-4498-eee4-08de30cacda1
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4097
X-Authority-Analysis: v=2.4 cv=FJAWBuos c=1 sm=1 tr=0 ts=692d789c cx=c_pps
 a=c61ECyqdR3yyy0DXXr4X4A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=DOpYuz3GLBM9jLxhA6AA:9
X-Proofpoint-ORIG-GUID: e67E3trs9Rxi66JWsH_4RAzG3D8IGNXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA5MSBTYWx0ZWRfX18kCmz1PoZkF
 vbTQ4PdkYjXQmsw9ill8Y3mK8N7VcBWJ72q5qZMCFpwBpq7oyRYXCCcl3fv6ZeF1iapr38rVpA5
 +Rrj4Shvpt4Esili0vnAsJYIv9YXgDcLfoKzCAcPnIVz+VzQYJUbIsG32hWmM7MBnxCw64hbnuT
 JhII80GIA6nXNAdyUjYnRyRLBf4rk2d+tadB4XOija75Eeu0eKxIqqnjj4Ddpx31IgK+finhL4Q
 8m8nwpHvvjXn84pqm5LTnARVLrbRpVksyNX4uZBT9PFu5k4KTgQC9fyNFzCSZY5uTHIyBhwf+fF
 GvbJsjxJnOHdOW1a5GlVuSE0njoNXvGKveB2oQLkvcmY+vAgCp7o5EEZQ8noeVW/xepS/9EwW2V
 1mKL8lEhOOUDEYecqUF2phNsQEFFhw==
X-Proofpoint-GUID: e67E3trs9Rxi66JWsH_4RAzG3D8IGNXX
X-Proofpoint-Spam-Reason: safe

Revert commit 6797540c8b76 ("ASoC: cs-amp-lib: Use __free(kfree) instead
of manual freeing").

Krzysztof Kozlowski pointed out that __free() can be dangerous.
It can introduce new cleanup bugs. These are more subtle and difficult to
spot than a missing goto in traditional cleanup, because they are triggered
by writing regular idiomatic C code instead of using C++ conventions. As
it's regular C style it's more likely to be missed because the code is as
would be expected for C. The traditional goto also more obviously flags
to anyone changing the code in the future that they must be careful about
the cleanup.

We can just revert the change. There was nothing wrong with the original
code and as Krzysztof noted: "it does not make the code simpler."

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 6797540c8b76 ("ASoC: cs-amp-lib: Use __free(kfree) instead of manual freeing")
---
 sound/soc/codecs/cs-amp-lib.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 8c9fd9980a7d..d8f8b0259cd1 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -7,7 +7,6 @@
 
 #include <asm/byteorder.h>
 #include <kunit/static_stub.h>
-#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
@@ -310,8 +309,9 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
 							     efi_guid_t **guid,
 							     u32 *attr)
 {
-	struct cirrus_amp_efi_data *efi_data __free(kfree) = NULL;
+	struct cirrus_amp_efi_data *efi_data;
 	unsigned long data_size = 0;
+	u8 *data;
 	efi_status_t status;
 	int i, ret;
 
@@ -339,18 +339,19 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
 	}
 
 	/* Get variable contents into buffer */
-	efi_data = kmalloc(data_size, GFP_KERNEL);
-	if (!efi_data)
+	data = kmalloc(data_size, GFP_KERNEL);
+	if (!data)
 		return ERR_PTR(-ENOMEM);
 
 	status = cs_amp_get_efi_variable(cs_amp_lib_cal_efivars[i].name,
 					 cs_amp_lib_cal_efivars[i].guid,
-					 attr, &data_size, efi_data);
+					 attr, &data_size, data);
 	if (status != EFI_SUCCESS) {
 		ret = -EINVAL;
 		goto err;
 	}
 
+	efi_data = (struct cirrus_amp_efi_data *)data;
 	dev_dbg(dev, "Calibration: Size=%d, Amp Count=%d\n", efi_data->size, efi_data->count);
 
 	if ((efi_data->count > 128) ||
@@ -364,9 +365,10 @@ static struct cirrus_amp_efi_data *cs_amp_get_cal_efi_buffer(struct device *dev,
 	if (efi_data->size == 0)
 		efi_data->size = data_size;
 
-	return_ptr(efi_data);
+	return efi_data;
 
 err:
+	kfree(data);
 	dev_err(dev, "Failed to read calibration data from EFI: %d\n", ret);
 
 	return ERR_PTR(ret);
@@ -389,9 +391,9 @@ static int cs_amp_set_cal_efi_buffer(struct device *dev,
 static int _cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid, int amp_index,
 					    struct cirrus_amp_cal_data *out_data)
 {
-	struct cirrus_amp_efi_data *efi_data __free(kfree) = NULL;
+	struct cirrus_amp_efi_data *efi_data;
 	struct cirrus_amp_cal_data *cal = NULL;
-	int i;
+	int i, ret;
 
 	efi_data = cs_amp_get_cal_efi_buffer(dev, NULL, NULL, NULL);
 	if (IS_ERR(efi_data))
@@ -432,14 +434,17 @@ static int _cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid,
 			dev_warn(dev, "Calibration entry %d does not match silicon ID", amp_index);
 	}
 
-	if (!cal) {
+	if (cal) {
+		memcpy(out_data, cal, sizeof(*out_data));
+		ret = 0;
+	} else {
 		dev_warn(dev, "No calibration for silicon ID %#llx\n", target_uid);
-		return -ENOENT;
+		ret = -ENOENT;
 	}
 
-	memcpy(out_data, cal, sizeof(*out_data));
+	kfree(efi_data);
 
-	return 0;
+	return ret;
 }
 
 static int _cs_amp_set_efi_calibration_data(struct device *dev, int amp_index, int num_amps,
-- 
2.47.3

