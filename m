Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563962BDC19;
	Wed, 31 Dec 2025 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767202052; cv=fail; b=hJsRWxLcVeA5IKmqLYp5UoCeSJTXSgyO7y85I8P0O3OLfd0DiRYBzmkBO8EYxa+cvpddSSoamSrVGXL1trN4udgLXoer00KKWMb/cxWT2fq+AVqJpRa1cpawCLAizgL865nMOlEVVCBLD7P3xaFw71yQptfk332Oi2Ub/vNj3BY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767202052; c=relaxed/simple;
	bh=ga3KAahCuVLIW66LdCBIlYkuPsmE0N0pCvR3ioynDh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohWJecjsW7E7d3bceup2YYyJewxntaN1M3Xl0Gx4zGdjvu/Xjogz/OOvstquIrOtaikh/dLZ+5GgyEKDUDJ4P2A4kySllQI9iZtbirqrZO41NjXSqzB2MqgRRDR/WaPYaZPqz9WuscJXO1tkFhuQWTZ0I4CS32xxYhV+5iCSPWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=C5GP2A7C; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mr9Y0gTV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="C5GP2A7C";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mr9Y0gTV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVF0iar743550;
	Wed, 31 Dec 2025 11:27:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=hB/SJTUQHN+Wf9qMLEztBFpQ4Rbdx9JaUDlUyhUBTEk=; b=
	C5GP2A7C6LHW16XwivGDAUfG4GkCRJ3jSHmJQbxobLsWuH4poDC3oOz1PH1E8cWW
	idGsHCwudXihkzn+ck+XJnn01ItibE7+8cOa/2LAuxRsGM5eryqaub2f8f9CfVvK
	BAS26Y2aUW8cLwYhjdmJiPnhwbVcvVFyH5ZJDo0d7YdONqovCt6zlgGIxnwZW/Oh
	AX4+P9blJeV9Fs7BNLZBOk2MyfNsT/2kenDKQozmMrfHVtN+kj+oVK2m1mt97Xtm
	jez4Z4wkVi+HmTaeB+mht4U2NYVJm0Z1fgM1jYtePiwaB7/kLeRxbezPykBjVTLG
	lUx8rVoqll++7Ens4CZH7w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021076.outbound.protection.outlook.com [40.107.208.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4badr3cakv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 11:27:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAj3qNy5drZUruxknLualHHbxniaDVO3xnEQ4YBm9WSvc/qgBPoYjf7EH3JRMw7/vErwMhjkyeiN3B10EVeQNwySUrLi66qw35FAeIzEGjQvTELaSFRDp1gXljMDf98o5TyQPsOuTTsljVIDW35Wub7YGEluvK9q88HZrs1mccF2A0zLJF0h8aOAvoFAfvMPnmJAYIBBwp19VpIuT4lefo08j6pgqSgUC0XTEsgZUisuLlyugtMqeBdukYfGb0pUbY0DIzjs2CZ4d2Mq9F/+uLu0i3B6Tw13qIDRQ+RYLKVXD/2wjg77hQh7FqATYRHZhmv8GutfjkIuPX6gAXIT4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB/SJTUQHN+Wf9qMLEztBFpQ4Rbdx9JaUDlUyhUBTEk=;
 b=hl37f0NKPXzFv0yQ1Kjk64aIvUMIbz1Hs+t+Pby2cSsX+3z2oTho5cpruUHjDm3y/LF8WbybXom0g6/pkxANQzi98zZQIiO7a8sCbzQN/OjetJwq7WnVtPPJUqiqqEZvbByXY+sb6fhAGdEUa823i9wR1+V+CmomTbEaCyZSaqc4mY1nhADVAl1quFj53HzGwiSzrFKB+xn0IjB6+LBgQ2Kt73Z9JGu1focNvXg/GG+0q1apKr3hvRdv6DGp1S8iO8aAFTOlXZpAPW4QkUoEdc1jO63CJdse0p3G1pSmmpgiMfsORBc2bciU1qpFRcxOkiKI5XvfwO2yDbtOQ5WIgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB/SJTUQHN+Wf9qMLEztBFpQ4Rbdx9JaUDlUyhUBTEk=;
 b=mr9Y0gTVnBh2t3gU5eifNLF0mxnMNhAsk22dPXzqIRvwZVGGNdeq2qnAbaYsZ59mmDriz6hBxIzJ9/aqIh/6XswY7qhY5erqeHMC65qVbmTAI7JwVTWS3P8pZYZYkPqN6R37j0p+B+fOOTc4uv95HJveYhMc7BAy8nKQo2VZcSA=
Received: from SN7PR04CA0182.namprd04.prod.outlook.com (2603:10b6:806:126::7)
 by DS7PR19MB8857.namprd19.prod.outlook.com (2603:10b6:8:253::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 17:27:22 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::87) by SN7PR04CA0182.outlook.office365.com
 (2603:10b6:806:126::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed,
 31 Dec 2025 17:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4
 via Frontend Transport; Wed, 31 Dec 2025 17:27:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B748B406550;
	Wed, 31 Dec 2025 17:27:20 +0000 (UTC)
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 5534B820249;
	Wed, 31 Dec 2025 17:27:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 4/8] firmware: cs_dsp: mock_bin: Pass offset32 to cs_dsp_mock_bin_add_raw_block()
Date: Wed, 31 Dec 2025 17:27:07 +0000
Message-ID: <20251231172711.450024-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231172711.450024-1-rf@opensource.cirrus.com>
References: <20251231172711.450024-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|DS7PR19MB8857:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f167c27a-8aa9-4be5-eb24-08de4891db59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6BN5ha1s0E/ij1SHJRR6RAbMIw0T1kGteyB5NisAU71ZdJOKh5PNwVRGUHMn?=
 =?us-ascii?Q?Vj9FCsFrVlccpE+1h1bMioGwzVmW95UlAcBIq8o44R1pehLnT2tohyceoHxo?=
 =?us-ascii?Q?NwNBz/JcFvxdj/sYyt0MWwNuctO8XSfy3rQkui0ny0nUY+JDSM/QDcIZbLn2?=
 =?us-ascii?Q?u9AszsgoILZ+MloMcmmEEbkWW8N1XZVqarhet/OWPMXhnfMMwk4oJlW174Y5?=
 =?us-ascii?Q?E3YukNLujDauBmVG8dH0til93hx6FePk4kBPCYzBl+0N64HNGh+rYWuE/0Q5?=
 =?us-ascii?Q?E6M1bFejAQxjHNno5HSpRdVx2s6QcJ1bmYt2YKxfZWsZewPDZwqbnRwox9R4?=
 =?us-ascii?Q?EOtzMJqpF56GTCMrq1SlZgAGKR+zy3QDXD0nylqlXiyKZaZVaJcatA3R8hXV?=
 =?us-ascii?Q?jqoFMxTgSVdapTQqGCsnUzjVv+J6FmX1pHvas374h3PGkYn3Tun4jdU/59Sn?=
 =?us-ascii?Q?4IIz5yPC8EWVP0nHkhYzNVmaIASRuCObQqPC695yvk7LlzofrQcKfPvnuf24?=
 =?us-ascii?Q?0fBBpHYymubsgSmzISTuEHETL9hmq1F0TXqdVCVdMwlWDj9bWhXtcR/xJiYs?=
 =?us-ascii?Q?8z0MQexVhjEgxkrTD0KKpQTBVGlIixfb7dlItZfexixDfu4MRk+AlwwtWIwz?=
 =?us-ascii?Q?6EiyFbr9Y+uFdSu/lV2qoTJNiatokcADYl5nYAVegXruseFiQojC92CqtOm/?=
 =?us-ascii?Q?nl7Uzjwu+kUJ8BIlMB0neOxjtLBDV7sLrGRwkjtZTCM74bvJ3qpnCRvjQ4/z?=
 =?us-ascii?Q?1VQz5blwnZn1ebIXr/rF6K9wtJDevWb2sxr2Ld2qPHpnxKmJEsjctTe4/RZQ?=
 =?us-ascii?Q?6QDopG1DmTAx0U3lEXZ4TOBzXDAMztliAHHYomsCu7Pg0PmenzUeAqjSj4QO?=
 =?us-ascii?Q?1el0N+nMW7ivlckXkN3PSgikWyeyje8lal8Syqas9FvRyHMTTLLsE7t0BfQM?=
 =?us-ascii?Q?vFZ9wZuBhtc8P9+c4O2Yuvxc9RnkO2WduyHNG0pvZoj2J9TuHj48O4MJl/Uu?=
 =?us-ascii?Q?XD32OB0yZyjQiona5IUjr9QQXIml8N4/8mqidskq4wB5eT3MZqOcAHJJbtcP?=
 =?us-ascii?Q?yKXZtJvaYwlrpv8V5yD/ZqN1sHHjjnbtVBznUdOWMRHXEnmc9XZh0c73AhuW?=
 =?us-ascii?Q?+Vvpetb/7EWlwuUqsJsvCQmCo4kOegWSQgyYZ0wr9qp5JorDBlmbPub8Cn95?=
 =?us-ascii?Q?fBSeyh7Ot8BEJnU9bHs8gsKnEQ1nfTAcrbxSDj/Cm7V1z4OtlV1KXLFriTjK?=
 =?us-ascii?Q?RRXieKGkrn44DcrGk8Udy5Z25XUrAbqbPRzHVNOsUdjkwpsxkFK2/DR1Smap?=
 =?us-ascii?Q?LBm0BhfT/ectn0c+SY2LwhwVPFIG0v87aZdmyL/CEcJT+2DfjAQeMQGVfWo9?=
 =?us-ascii?Q?/MmRAXxPmUOty5kCaI0ip2N0b956TYE9s7biyUTn5p0sTTrmAJPbcKVcrsTL?=
 =?us-ascii?Q?oec8bT9ruv3Zna+NykCFt4eq2u4Mt0CRI98eFxEc45XWOlg+OL9vZyTTCbg5?=
 =?us-ascii?Q?+nFTmuMhfY//SvRtJk46HKwgqaonV+eyHDOVdZMtZQrjztG9ZytG79Xmgjxo?=
 =?us-ascii?Q?ZUTWyMwHutsxk1czkW8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:27:21.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f167c27a-8aa9-4be5-eb24-08de4891db59
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8857
X-Proofpoint-GUID: fVslh-EWVkbKpzOFO4USoKRqAUQIW3qJ
X-Authority-Analysis: v=2.4 cv=Z8Hh3XRA c=1 sm=1 tr=0 ts=69555cff cx=c_pps
 a=Jf/U7KFl3YoH1y/TBsSIlw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=Ac3_NjksB7D9Vqi9SkkA:9
X-Proofpoint-ORIG-GUID: fVslh-EWVkbKpzOFO4USoKRqAUQIW3qJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MyBTYWx0ZWRfXzvdoSBzpgiBx
 vAYcFVi4wgenkObzRLGacHjlHVrz4pP8NUNyjgPp13dnJHYeJypOa1/w+UtntvnXZ9VqT8tGVAL
 gW4UlJAAH1nh9z3xhPyfQ/YSJA5Hj//1M9zdRkNF7wbTBkvvVfBieoOgBMXtjo94n4Cms0uyj5M
 t5aaQYMBjI884a9dqNKUJgWY2M2Ju3yp0wxZRK2EzEvBZGg9Fqa7BxlJ5mr4au1USE6B8pKgNhz
 GTUpN3q208Fic+i07AQqqbsyWq+nGgd92mDqbutHL1XTrjsnWQG6OS5ZVyiN7p8nO6Yphu8Hm8e
 nlw+GIeQjwz6N4rnc4gOARfj8k4/QnMt8DX1IVojijFcOycUW0KacypysGb7RU23JAjYgIKhBr+
 DbFXQjOeiGZ0aIwYtSIvfyQ5u3/0prZLdYg/RhgtImxrcKwIRRZpFKFovCWh9LCeB47xzrySfRC
 OQSrkhkV5UmssGiEKzg==
X-Proofpoint-Spam-Reason: safe

Add an argument to cs_dsp_mock_bin_add_raw_block() to pass a 32-bit
offset, and change the type of the existing offset argument to u16.

The cs_dsp_test_bin_error.c test uses cs_dsp_mock_bin_add_raw_block()
so it needs corresponding updates to pass 0 as the 32-bit offset.

Version 1 and 2 of the bin file format had a 16-bit offset on blocks
and the sample rate field of the blocks was not used. Version 3 adds
new block types that change the old sample rate field to be a 32-bit
offset with the old offset currently unused.

cs_dsp_mock_bin_add_raw_block() doesn't attempt to do any magic - its
purpose is to create a raw block exactly as specified by the calling
test code. So the test case can pass a value for both offset fields.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
No changes since V1.

 drivers/firmware/cirrus/test/cs_dsp_mock_bin.c     | 10 ++++++----
 .../firmware/cirrus/test/cs_dsp_test_bin_error.c   | 14 +++++++-------
 include/linux/firmware/cirrus/cs_dsp_test_utils.h  |  2 +-
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
index 3f8777ee4dc0..bc6b8651259c 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_mock_bin.c
@@ -56,13 +56,14 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_get_firmware, "FW_CS_DSP_KUNIT_TEST_UTILS")
  * @alg_id:		Algorithm ID.
  * @alg_ver:		Algorithm version.
  * @type:		Type of the block.
- * @offset:		Offset.
+ * @offset:		16-bit offset.
+ * @offset32:		32-bit offset (sample rate on V1 and V2 file formats).
  * @payload_data:	Pointer to buffer containing the payload data.
  * @payload_len_bytes:	Length of payload data in bytes.
  */
 void cs_dsp_mock_bin_add_raw_block(struct cs_dsp_mock_bin_builder *builder,
 				   unsigned int alg_id, unsigned int alg_ver,
-				   int type, unsigned int offset,
+				   int type, u16 offset, u32 offset32,
 				   const void *payload_data, size_t payload_len_bytes)
 {
 	struct wmfw_coeff_item *item;
@@ -75,6 +76,7 @@ void cs_dsp_mock_bin_add_raw_block(struct cs_dsp_mock_bin_builder *builder,
 	item = builder->write_p;
 
 	item->offset = cpu_to_le16(offset);
+	item->offset32 = cpu_to_le32(offset32);
 	item->type = cpu_to_le16(type);
 	item->id = cpu_to_le32(alg_id);
 	item->ver = cpu_to_le32(alg_ver << 8);
@@ -104,7 +106,7 @@ static void cs_dsp_mock_bin_add_name_or_info(struct cs_dsp_mock_bin_builder *bui
 		info = tmp;
 	}
 
-	cs_dsp_mock_bin_add_raw_block(builder, 0, 0, WMFW_INFO_TEXT, 0, info, info_len);
+	cs_dsp_mock_bin_add_raw_block(builder, 0, 0, WMFW_INFO_TEXT, 0, 0, info, info_len);
 	kunit_kfree(builder->test_priv->test, tmp);
 }
 
@@ -156,7 +158,7 @@ void cs_dsp_mock_bin_add_patch(struct cs_dsp_mock_bin_builder *builder,
 	KUNIT_ASSERT_EQ(builder->test_priv->test, payload_len_bytes % 4, 0);
 
 	cs_dsp_mock_bin_add_raw_block(builder, alg_id, alg_ver,
-				      mem_region, reg_addr_offset,
+				      mem_region, (u16)reg_addr_offset, 0,
 				      payload_data, payload_len_bytes);
 }
 EXPORT_SYMBOL_NS_GPL(cs_dsp_mock_bin_add_patch, "FW_CS_DSP_KUNIT_TEST_UTILS");
diff --git a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
index a7ec956d2724..fe0112dc3077 100644
--- a/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
+++ b/drivers/firmware/cirrus/test/cs_dsp_test_bin_error.c
@@ -66,24 +66,24 @@ static void bin_load_with_unknown_blocks(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      0xf5, 0,
+				      0xf5, 0, 0,
 				      random_data, sizeof(random_data));
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      0xf500, 0,
+				      0xf500, 0, 0,
 				      random_data, sizeof(random_data));
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      0xc300, 0,
+				      0xc300, 0, 0,
 				      random_data, sizeof(random_data));
 
 	/* Add a single payload to be written to DSP memory */
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      WMFW_ADSP2_YM, 0,
+				      WMFW_ADSP2_YM, 0, 0,
 				      payload_data, payload_size_bytes);
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
@@ -277,7 +277,7 @@ static void bin_too_short_for_block_header(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      param->block_type, 0,
+				      param->block_type, 0, 0,
 				      NULL, 0);
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
@@ -309,7 +309,7 @@ static void bin_too_short_for_block_payload(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      param->block_type, 0,
+				      param->block_type, 0, 0,
 				      payload, sizeof(payload));
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
@@ -341,7 +341,7 @@ static void bin_block_payload_len_garbage(struct kunit *test)
 	cs_dsp_mock_bin_add_raw_block(local->bin_builder,
 				      cs_dsp_bin_err_test_mock_algs[0].id,
 				      cs_dsp_bin_err_test_mock_algs[0].ver,
-				      param->block_type, 0,
+				      param->block_type, 0, 0,
 				      &payload, sizeof(payload));
 
 	bin = cs_dsp_mock_bin_get_firmware(local->bin_builder);
diff --git a/include/linux/firmware/cirrus/cs_dsp_test_utils.h b/include/linux/firmware/cirrus/cs_dsp_test_utils.h
index 1f97764fdfd7..877fa4a496dd 100644
--- a/include/linux/firmware/cirrus/cs_dsp_test_utils.h
+++ b/include/linux/firmware/cirrus/cs_dsp_test_utils.h
@@ -126,7 +126,7 @@ struct cs_dsp_mock_bin_builder *cs_dsp_mock_bin_init(struct cs_dsp_test *priv,
 						     unsigned int fw_version);
 void cs_dsp_mock_bin_add_raw_block(struct cs_dsp_mock_bin_builder *builder,
 				   unsigned int alg_id, unsigned int alg_ver,
-				   int type, unsigned int offset,
+				   int type, u16 offset, u32 offset32,
 				   const void *payload_data, size_t payload_len_bytes);
 void cs_dsp_mock_bin_add_info(struct cs_dsp_mock_bin_builder *builder,
 			      const char *info);
-- 
2.43.0

