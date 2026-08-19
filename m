Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE673CB2D0;
	Wed, 19 Aug 2026 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117721; cv=fail; b=YrSnXYpgaK7CxlxMWgjYTNIsfP6kXxkJ741xllsXMQB84ud5NGyGXy9vqD9iqF51/8shT/aQXdQlJstS9Ph7KEeKj5rdhl/LqNe7JMRx/dR9iAd96pjIVO4louxadKi1Mobu88yI8wpT5jheT6/aTzmE+eIU+v9iMgVXOiEb78s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117721; c=relaxed/simple;
	bh=PoFrndLmjvbXVmvW+qPdQ8/dQGOphSKRlj75khn+u4Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YxRZkaM9ZQzlvdSpQ79NdxrBlbTKucFtj0A+CWE+/K+yliQy4Bvc/5Qqp10NGHlnXnAQLwMFsPJ4m7Ua8hGPYacHqXHx1oHj77gc5BafCaOnKhpOmg4y9C9v73HqH93wrgUbpwI9QK2uaj7VPCt/HNi79rZk/D0cmDrhvNaK1nE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Rg0xOo7W; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VhBmw0Rx; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Rg0xOo7W";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VhBmw0Rx"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2iwUu1310702;
	Wed, 19 Aug 2026 00:34:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=o1zzDQNAp1rJwyQ0T1cvJOcf3v0/7i/F8Qffm0zsE
	Pc=; b=Rg0xOo7WI12AHIma5bqT1gHYT5RMtmwAUVIMNM1FrppOSvfLxU6kgqnyp
	idpJASijTMHiCqyJ04aNEIVcxYaW5phRzBU/8IKDw62X8TGxGywWBzmYz8QX0wea
	pePzmh03t182Zunnfkv2bitf/VkB9Rdgrnlo55uX4yS54tyfvxbyR1OwqqzJIbka
	M++JoThrMIg8jJ0xnp/XKJFE2qVBkmcDrkBgRcphFaf763MuDScnfUZjz3QwkKzK
	PaOfWIFqcZfrgHNt8bMwCkz8cr0RqUha7QmNJ8qt+iR9i5ogijZdM8s8+c8m6fIo
	ZXPQGZ6ENC4/RZv7OSLWrjKeJluxw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011054.outbound.protection.outlook.com [52.101.52.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g4yf3aax3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2026 00:34:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5LPNdOrpRfZPyoxzYFYdgJF7IOpXCT8U1r/+CdiWanHvoerjOSfqp8kmrKcMeCdA0y/MnJyc2fqsRiBcBxnAdWYehpXQnz+jnp6q9Ez/7ydEXmjmc2fPZTURlL6DuxoJxD7ZjJmQRMAsuR5FRoA4PFqowOAQUa87UsHPQaW9IGeEY4MfXRADXI/Wrdxe0Rk3vNbkfvX3frZtXkFQXJKUL3F7kH1ysfVZswuDWA7O1MW14zxWMgiiz4lW6w/SptO4A95pWB8x6mnP+sFRPHftlC6jFp8nlRrVtLvgoLZrXh6bqLDXBCpHpof4LYUOf7UIQqvyzQ73U85j7joWxpcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1zzDQNAp1rJwyQ0T1cvJOcf3v0/7i/F8Qffm0zsEPc=;
 b=fIf8d5+xwn22/f9VUrjvbbp3eRGyBvA4vZ9/KuGjR4JV29Kp5Z+dfVNtEL2G7VGSHj1SaRZIPTMQkAeftWza7/hPrE7mHIV0End2/gfExvZdhO+HZ+gI0AwIMr2/VE4i9y1lY4mEfB6ilpq1zA+ToiBRNzQsJXk/tqmspqDET1kezey/ATzsAj3GfezViBKsZ9DSWk4ZQEbWpxlPxIkJPsao8Phubjmusq/piE6moNenGfX0sUjRpFl0iNB8Jh7gtCYbw96SxC076GyJ4F1QdalzeGJmzVnmRADI//pNPzH9AgOosqPnsjjcSi+0ZsITdi2OvKCzIS+VBdX5ZPH6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1zzDQNAp1rJwyQ0T1cvJOcf3v0/7i/F8Qffm0zsEPc=;
 b=VhBmw0RxpE35OQduyur0GXbAnVil1M8PwXAUZAiLuFToelm127l/rKpmmW5nsaf4pl8O9+DDLEGOIsF8+OLHV/hOy6WZTm7hKkX2zf+MXG+qB2q8t6kLAb9ruKa2r77zvWFept6D2hxu8Z44utUDkTzMVhFRkpIcXQQXTthXnVU=
Received: from SJ0PR13CA0237.namprd13.prod.outlook.com (2603:10b6:a03:2c1::32)
 by SA1PR10MB997679.namprd10.prod.outlook.com (2603:10b6:806:4b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 05:34:54 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::6f) by SJ0PR13CA0237.outlook.office365.com
 (2603:10b6:a03:2c1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 05:34:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 05:34:54 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 00:34:50 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 19 Aug
 2026 00:34:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 19 Aug 2026 00:34:50 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67J5YYn72784631;
	Wed, 19 Aug 2026 00:34:45 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-sound@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
        <ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <baojun.xu@ti.com>, <shenghao-ding@ti.com>, <sandeepk@ti.com>,
        <v-hampiholi@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 2/2] ASoC: sdw_utils: add spk component string for tac5xx2 family
Date: Wed, 19 Aug 2026 11:04:27 +0530
Message-ID: <20260819053427.2277-2-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260819053427.2277-1-niranjan.hy@ti.com>
References: <20260819053427.2277-1-niranjan.hy@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|SA1PR10MB997679:EE_
X-MS-Office365-Filtering-Correlation-Id: 71adf98f-0c67-4f1b-68b9-08defdb39914
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|7416014|1800799024|36860700016|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	+ChwJx7ttr/MhuIxRuKdG/qcB37NB3yMAw5q0bvCbH8QJbABC+W2LDA3hYkFxHNy2CRGtHIbaTTgbwo9++alzyHuc4GyYitIB6EjYvDoZQO6LZ1CNEeHf02B8yJEs21OY25oLOjvOEWDEXfgk94KyxWC1on9ftSNTWL9HT1zSKKMVWiDQOAEZQPR9rOnWJwi4tEZeL/5fhOXNEx1ttPHRj87CW6fycNFQm7/qp8D930ptfofpRLCFvteK7n65ePIwqAa3jWhzKnc5bL9JOGFJjZx1vBSOpUUTKvHFvNnmeInFRtfQqsYZJVxJS7atI1m0ReP38YrTdkjfrCcLX+XL37kfMxl1viB4VhVkDt9AGJzI4hL0gjuz5uGkxLZ0muuPF2u5fythG8JwcT/QLoIv+wyz92zeKuvNak0zGt+KUylauTTxZDdGH3j/I2/tN4aAnemDPCBRGSijpu/fRUER/B77C+R5u0CUdyN+NeJAa9im6p5QusFpegNkYi8G6m3wI0KImDiYIepT+3NtnRBW1cet5xhRQ5LlM4obhsopu26RfYKMLnWzl3Tm4O6g0hvwBTqQnub3QsaBRfRgAhNPVRaYQZcR3wv0f2WsF63B7AzsMoyfVd0mIJyhEla0BDR5hPWhY1vOcc1XrM7s2IfrNTh7SrUqjFZ3sDGqVIZK8R318227G8eNTZfxpUrQ0e83HPieqFQXMTAHTYMwow2qA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(7416014)(1800799024)(36860700016)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DvDsJSvEhs+8Z5D9LbXVdTQ1VC2CzqnxtIxcTXEOy1xzf3MbfKcI+6pAgzvOcl+UCg79jxDWNQ+M0/f8F7JP8C56LixZ5famxQ5M+VfuLgH4xrDwzx0mLvKBCtvWSlvr1I+88uX2y8v3GM0ybrXGdaYLcXlTFqr7mGLrZDQ4BDMDkykd6BA5Jtgi5LTXyc6Rl08xpTFz7Jc2T70Iwy8ijVOc1Vvo1kIHqJjLiGX0jBrmkKX9AwjyRRGTKbHB8+UM6aP3R+ZEaF8d4wQ5F1BvdTiQrnt2uqU0cpv5I8hDfTLmSeds3oQwhAFRkTQtAbrWHthilf2ZrOfPW4mJQsl+DiWlVdRrptCaAq7ozhGzmpruvYY/PHva2p9SzGSgKq2N5fiaT3LitvR/VGk9UmjiZqjXnv2jYz5mJsnOacD2iHzppvg2uaYrq4mB1DCWehsi
X-Exchange-RoutingPolicyChecked:
	QTfke/CcjwENG9oYmlAoKQ1tdhc10evj73Iq+KIw1RGNEMN8XPDwVdpOcZuG0xQiADNum8PslvZp5SsGoc7toHofbEWSY2ZGnsFN+7XEV9pNd10vt2LwtiEAowrMlSfDMtP0vM+9Y/Hr9xW8hxEib7KuaI7LVRYgV5pP/o7xp+/Hp+MIcTCFzBjV4BTxptK8esTOIZsc3NgyYPtIpfYH/l9+GcuUPSPInxC30cMRzs6PcbYkIut7ZYVNAKRc2cTHWVhEP7kVAauD10Isoi5GvJV3iW3z85/RCrzMZojE4uGNE/SAGjVd4qUBC9OINVx4QoJyx0kHFBjkLXX1jB1AUQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 05:34:54.1048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71adf98f-0c67-4f1b-68b9-08defdb39914
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997679
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MCBTYWx0ZWRfXzrHD3bd2dxYk
 H/TCeVMa1LxiOI8KZV7QPklp/InJAw7Z9IyVDogaG1VNa+2fGxsv0upkbG/TwpB79IQkXlvZ+9i
 rjgPvsMXvSp9Q211xBzKI2AIob4z2g4=
X-Proofpoint-GUID: j0zmmFxnELTtDxx4K5a95b7RrXirrNNB
X-Authority-Analysis: v=2.4 cv=drzrzVg4 c=1 sm=1 tr=0 ts=6a854080 cx=c_pps
 a=i69ZgmgbQZPDBD2C4G6j1A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=CiMMHGYzPJEwwTnY6NcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MCBTYWx0ZWRfX99JEIQR5/zZa
 cqQvJXJjhSQyEkBRx9j4FT+k2OuI5bUWgXZHo/L0TdgcsvU6Jt4hBkmkUPs7jeiMXmBICpXPwCD
 iiGnlTeV+JxgiRrL3nOuzcj+vHdpUXRqL980Jp8PV0O4VGE2b0rxzX/n7Z5YjpOSqNa7eueSjue
 9XYBLWn5RTfzcb0e1ZlD7iOAE1u426XyTwOHtzb7iCjo51woHCZRWWulfnFDjX8bdcWkUGQXrZO
 qVUzO3lVJd6CtpJnYQ2HQcJzwjAgONmQ29T706RG59QI/MJHqABPB707ga+PZtpdDb+GFwb/KdQ
 oMOlinKV5F82KGqQf9sSmfIdHgrXWJrrfomUxSFeIpufGdphKaA+NY/4BL6tQeC8fen16VWT6gw
 vcFVNY74bYdZP+YmEP7LVyrB5Bf1S2GisyQ8VMUVuhKlmhtVezCpLxWDZdtCxv4zSztkNbaPln9
 7ypL0jR2CVhVytOLGOA==
X-Proofpoint-ORIG-GUID: j0zmmFxnELTtDxx4K5a95b7RrXirrNNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190040

  The tac5xx2 RTD init does not populate card->components with the
spk:<prefix> string. With this change, "amixer -D hw:<card> info"
includes the spk identifier for each tac5xx2 speaker component,
following the same pattern used by other codec families.

  This allows userspace to identify the speaker codec at runtime
and enables UCM card matching for the tac5xx2 family.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/sdw_utils/soc_sdw_ti_amp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sdw_utils/soc_sdw_ti_amp.c b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
index d0ae5d7ef..5e0b2c753 100644
--- a/sound/soc/sdw_utils/soc_sdw_ti_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_ti_amp.c
@@ -127,6 +127,12 @@ int asoc_sdw_ti_tac5xx2_spk_rtd_init(struct snd_soc_pcm_runtime *rtd,
 	struct snd_soc_dai *codec_dai;
 	const char *prefix;
 
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:%s", card->components,
+					  dai->component->name_prefix);
+	if (!card->components)
+		return -ENOMEM;
+
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (!strstr(codec_dai->name, "tac5") &&
 		    !strstr(codec_dai->name, "tas2883"))
-- 
2.34.1

