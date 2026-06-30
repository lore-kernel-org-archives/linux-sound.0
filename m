Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BD537702E;
	Tue, 30 Jun 2026 18:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782844324; cv=fail; b=b85CfH5DbzRTfbRDqB6qE96cwh2ulNPu4ttudJkKhoEA8zdo7Wz+vXWeJeZpVDkpPaE9VWNQXhkR7u3XyUdeJSuBSEC2fDSlgIa2rl/hOrMCYHNABcW+ytbAGSWOIhO1B82w5lQuMBsxg9spuzgenuv8RviwFPYew8rWM8P/AYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782844324; c=relaxed/simple;
	bh=Hj8CpGF+VPnHYJ5Mevg5yoxCErEMxrWvmaLHmO0Ha3I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VMuYr2y6xSL0/u+g4iVRztuI4meAGWP7KdAGhaX9wAxyS8NwJZCRw1Hu7WhHRx1ZW3BkU20tYRQn59qZGaOjySYrUCfkem4XO6BHFAdwg/F/1pWEOPpXxRYBuvKT41Y17KhbicJcW/J2ZzEfZU4eJmgnnBZDJEk+7j59JQKh29Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=FMFnr9wD; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Pq0e/V20; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="FMFnr9wD";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Pq0e/V20"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UGku9b1345068;
	Tue, 30 Jun 2026 13:31:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hDquU9lN6aZk1rod7we38MvhgBeElLx+iu8zXgyMU
	3Q=; b=FMFnr9wD5Iry61IC1MSFjE8IasaEH9o5WtoVYod7pmr1hZRvaYORB66ck
	0+iF02ID9DdErCu/Q9Ig8bxbxLVefRI+kRqtsOqcjKorYE9XOlEajdOxpGenqfoP
	12Ew/gucsPuO8Sj5hisVlaCbK28cY6Sj47ZW2vamk3S7cAZB2ozQqrsEpv2uCOlq
	gbYIhaLML3u0sK67HsT8gZcdsK5RncN2O1al9IdesWIOMhdj+JtpkBIp0YtLjyn2
	Zz+yCe0CIEROMCGpeMfwET+hgRKQn5JtlNInGU/4x3EfpoNoVmDY8nmQeglTvWhh
	/fjJsfHKNnZPbVj+eN6MKG0Ejd/nQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013065.outbound.protection.outlook.com [40.107.201.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f47k7cawk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 13:31:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYOraIquP4P7EqR+xcunEdbCp1datjf17InkWemPLP880F4TVG+rKfeW5u/06XQ3BY2VfAcMmmsg/DiSAsFQXbRLMXqDVUy1bO154TQsWhCCEv8RmSbOXS3oEPS7BcJJH36w4DK2DLxpQazzCuTstntgUSSORdp+N8VF4rTZs8E3lzJmya6ztQeAkZUW8mHCz4ke4uLu63fKF3y9pwHNcqqT2sORjW7/34OshxeHHBKi9NAJUOAqXwaCk0g1bPU6id79BOZRNTAU2pa6lM6dKLj5IhcgU2yp7mMxZrm2dkqMJUvlve//ObvB1ICnFy9eHawJ6eFCYR57a+HCgTM43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDquU9lN6aZk1rod7we38MvhgBeElLx+iu8zXgyMU3Q=;
 b=R388cLrMNbSZghxZ+10N09zLNvEHnP8DnUvXqWMZkrsphgDfBXpqAPg3NXlzrrmv2zYQOIta9E74KhnpP2NEHj0X2JbHR754WpklYlqtfsNtWm1VT0RK5/CL8iCR9inTAUEmYtr0oOn71uq9fcgAhP/dYYzLXEkfoAs0/9azj54y5l7AyjMzFPxWreos/+Cib1tg8oiDDhPKG+eH5QqslpL+8cahQ736fraDqfz1MlzlE0E0wnReR2t3Edjdsjha8qN+KJ8wHtQo8uHNgV+g9GTAWabjoCmabn8oX9+zf6g3tfuf1sunYahpZgDUMzXX4Q+JOzARPxyI6arwfNYxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDquU9lN6aZk1rod7we38MvhgBeElLx+iu8zXgyMU3Q=;
 b=Pq0e/V20DA2Px1RG4wgPsRnAbGRHU9rNS3zzkOxtRb2q9jN+dVx3dlYC5IL2tVzO53J3vgd+wBVNJ3uue6uJTo7J6IlT75jnpf2InIQ6W4BbuCDBuyKBCvzU9mYSeBH7YJh8huOxL/fUZj2c2gZSzmhLk80qvU6jhhi8AxmW3Mk=
Received: from DS0PR17CA0022.namprd17.prod.outlook.com (2603:10b6:8:191::21)
 by SA1PR10MB997652.namprd10.prod.outlook.com (2603:10b6:806:4b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 18:31:39 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::2a) by DS0PR17CA0022.outlook.office365.com
 (2603:10b6:8:191::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 18:31:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 18:31:39 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:37 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 13:31:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 13:31:37 -0500
Received: from localhost (mz02jj9v.dhcp.ti.com [128.247.81.246])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65UIVbj13699019;
	Tue, 30 Jun 2026 13:31:37 -0500
From: Sen Wang <sen@ti.com>
To: <broonie@kernel.org>, <shenghao-ding@ti.com>, <kevin-lu@ti.com>,
        <baojun.xu@ti.com>
CC: <lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sen Wang
	<sen@ti.com>
Subject: [PATCH 1/3] ASoC: codecs: tas675x: use READ_ONCE for params to be used concurrently
Date: Tue, 30 Jun 2026 13:31:20 -0500
Message-ID: <20260630183126.2588322-2-sen@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630183126.2588322-1-sen@ti.com>
References: <20260630183126.2588322-1-sen@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SA1PR10MB997652:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1f28be-83c7-496e-13cf-08ded6d5d370
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	7m/J/gV5jWEDcbZI/ICry0P1U6ORwUUqG81Rnos/WlRbes+RED+pdlh4nbIEJN8FVRUp9yw5Ns4K67GKd0FsPnISeZhT5Oqbo9+ssJU3fx00qOj2+tpttR4CJdFFyQ81FrnnuYH12CtzfjiW3ym+Je0qmL3LpWSCx2CcarbTC2DcZpatp4YB+h7mpT5gDQ6eHiLO+CH9Dtnw6+m77NxFCRTNK6QqRHNjXjPAbfVweNSnJAm+SOP3LLFpxImVrEpSD4bv7r63BtHrh8M16n2LsoiFYt+0uRU4gOFpwUAtepUtz97FSs1BDWtHzdgMa1ZplbrIeX0m0OnVjWFmrRo/yzUxwikUxcGJIm8Fu8rs8bj0/BzYNZQN93Qhr2rG4mItKs1ZZsSiGomywZAnh2ZetePRdqQgzyh8SNR5nfI6sNIagJmgLuJqJeiTuErNLe5md8UA1LmF6krxCUEE7+JyoD1U1Xm+/BunBBHbxxfeCAfnctyuPUsmBp+veT9HgM2gTon8iU+Li1lOzoFUQ3AN+bKSbJHiYXpslgcby5OibGjVu0eNca4oPYWkQXAQ4QVmPandn2sdCXezOQpfOVRSlQkIwaWw87OfY4HvS3OiMAdEk0+1fWGs+MI+v3ANXO8u5hqH30D1BuQZfip/tsgziqRZWLdao7NmKPSE22bCQ9jHhvaPdmjFrNfPccKvnu4dH7wdmAt1vs865kAz3OF6HQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XlpdvBGagdDa32Jieeaw6kM+J83/e9bgCJvKQu5crVLiXLflbVVf4LZ2fi51G1zFMibzmbRyiQvvlTeMcalpCUXVutN+l7jiWctwzT6hFzI7wNepvE/HqfOElcBvmPMk0nfiGvDjpIU0WVzUzSt3DJV6LW1DBUKW8WoIwSYkg+B/CWDVLRcyn91wn10rLK9CEcsT+aL5BD/LUI3JzJrEA2zpXde8tbYyCZjgV9f55Ep16igwzykYRtW1ofUK0qDD8nSXNwDGAII+/jyb+Cxvcp2o8C58+VGNdYJULR/AmGY5HRNJoSj4A7YQe0hQEHMsZ+m9r50NVI+c1SxefQYq1UbAMW61qaFvaZPArxA3NpI6g/5eVXlWfYkNClRAeEfDpWdGGjpl9voC5EiwtmUsOxyQnfX1AxU8qHZ9g2Cv5/nQMnIxk6yVarPte8xCzpLc
X-Exchange-RoutingPolicyChecked:
	IjotVGjOBs+waKy6Q4M/e74rhx6x3F7jcxWXUMHCKwZ4ICOr5Leagk7vVC+tcPAV+WcTmZkvry4l5J0e9xHYxNo451DOWibJywKkGD46/fL5IuDqA+ZeZPrg9Vk2rOCSdorh8x3L+ML/jo6EcBfsxgr/ThkJJGrBP4wVzUu1O+84yDSLRmGD6YCDV9JcnQs+Lh47d2w7VlBqtY8o4f8cAzkZZefL3DNowfBFaciEHaCrFqN+a4YFHPKgdhEVO2jPNuc395ufG+Iu43jN+BjjoUTHywc/e8XXFd4+eCGZVFfKbCUdpBjwFTyZ3JmBAeiQlwxlFfYEtVgr011NDf85wQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 18:31:39.6005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1f28be-83c7-496e-13cf-08ded6d5d370
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997652
X-Proofpoint-GUID: 4F0fiEVhKYfGPBxogfiNEQDGMhYp6AEH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfX4ULqqFxWS9Ns
 4/K8TsXGDqeB2k2ZpnShDik4t0dd1U4g0IF+z0NLVtWOrPuSmxBG0rkRfyFMeoU0qIqV+RkALBS
 deduTNMDCUKRkrZuv2zl41l9RB69/OXUjaIEkYUc0TIqJ8wGELXY1jjzwyPLLIMw+/lUxGYPJxr
 FBbD4VXPzbtdVecDcltd13UwBOnDhFMAj5rXEJkJ7BkACczAQd8Y5YP4jk/48QV3Be6w4tadNtm
 Ga2/y5Ozkkx0QUN4TCr+GkOlvGXqdnwP30KAYbv50XJF+VpEet1jvc3KEymMyzbV/tND2LqtZvE
 Y9xCYwbv+nFGny1MpssuYsAsgszWz7dwoHZlwj1JssS44HOkc9Hpl6aeaXBq3+0/I9tT+di7Vmx
 LVJIOCA9AZgT9Kv013/tUSd0pqvpzD6e2CmQwiyTg+zQXHt7iVv11Uq/IE2192y7xvifr4UQ+In
 qt4fqQoBEjkmmg8vINA==
X-Authority-Analysis: v=2.4 cv=UshT8ewB c=1 sm=1 tr=0 ts=6a440b8e cx=c_pps
 a=GhmtI3pHzNGJg3++3mR9yA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=wctQQDU9PinYv6AisFkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE3OCBTYWx0ZWRfX3X73nHMTITEI
 V0uZbiCygH5S4nbK6gK2/Lek/COM3s8PSMh8wYmDf0izrzYD00fKQDpdrXK/ui0ZhYXpYJ9eTSO
 n3rI0XY/pFORGKkHrnJgHkCbk4lnrkY=
X-Proofpoint-ORIG-GUID: 4F0fiEVhKYfGPBxogfiNEQDGMhYp6AEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300178

active_playback_dais and active_capture_dais are written atomically via
set_bit()/clear_bit() and can be read concurrently from the
fault_check_work delayed work handler.

fault_check_work already uses READ_ONCE; extend the same guard to all other
reads in tas675x_hw_params() and tas675x_mute_stream().

Fixes: 133c81f84471 ("ASoC: codecs: Add TAS67524 quad-channel audio amplifier driver")
Signed-off-by: Sen Wang <sen@ti.com>
---
 sound/soc/codecs/tas675x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tas675x.c b/sound/soc/codecs/tas675x.c
index e3b18451abecc7..a3e0dd75e8ba0c 100644
--- a/sound/soc/codecs/tas675x.c
+++ b/sound/soc/codecs/tas675x.c
@@ -1133,7 +1133,7 @@ static int tas675x_hw_params(struct snd_pcm_substream *substream,
 	 * Single clock domain: SDIN and SDOUT share one SCLK/FSYNC pair,
 	 * so all active DAIs must use the same sample rate.
 	 */
-	if ((tas->active_playback_dais || tas->active_capture_dais) &&
+	if ((READ_ONCE(tas->active_playback_dais) || READ_ONCE(tas->active_capture_dais)) &&
 	    tas->rate && tas->rate != rate) {
 		dev_err(component->dev,
 			"Rate %u conflicts with active rate %u\n",
@@ -1397,14 +1397,14 @@ static int tas675x_mute_stream(struct snd_soc_dai *dai, int mute, int direction)
 		set_bit(dai->id, &tas->active_playback_dais);
 
 	/* Last playback stream */
-	if (mute && !tas->active_playback_dais) {
+	if (mute && !READ_ONCE(tas->active_playback_dais)) {
 		ret = tas675x_set_state_all(tas, TAS675X_STATE_SLEEP_BOTH);
 		regmap_read(tas->regmap, TAS675X_CLK_FAULT_LATCHED_REG, &discard);
 		return ret;
 	}
 
 	return tas675x_set_state_all(tas,
-				     tas->active_playback_dais ?
+				     READ_ONCE(tas->active_playback_dais) ?
 					TAS675X_STATE_PLAY_BOTH :
 					TAS675X_STATE_SLEEP_BOTH);
 }
-- 
2.43.0

