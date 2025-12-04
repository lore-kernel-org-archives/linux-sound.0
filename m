Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C5E2ED87C;
	Thu,  4 Dec 2025 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764865183; cv=fail; b=c7TBp+g71id1a6aLn+KeVOuH+0jljqs1lO4YS15GfyZQVzZZPrKA0TxqupCKtb2JV5HgNaMyviGYLkgGR2vCeioP/RV+E7FCvZlpqeJE8TN5kjRuWF4DywLuZJwEasizOdGabtey/s+eXq+KnmectciKhoWe2hG5cJkgqoFnW1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764865183; c=relaxed/simple;
	bh=7EtRelC19svfInpEFPPqxLopgC+YBc6bzl/ZqslRAzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3H2m4RxELJUcxOwseLPRRl9fr4Ojp6UEwBYVDDW3II7/Y/US9AW+wDV3xANTi1rneKXyR/8cRl8j+RuO6fyTJmVz2X6jC8Sbl/Kjd8HRUE4Ozygc6OCssYIYxbfrmUjonxZJYHWky59b17yuQnMC87DnZrltqpa1HsZ/a/fjDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YcmNDv0d; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=jMxo9cuS; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YcmNDv0d";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="jMxo9cuS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4Cd9ls510934;
	Thu, 4 Dec 2025 10:18:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=aZoYgoMHJ5OM8wXz46
	LDDnxoYPseSY0zmHvIVNYzhX8=; b=YcmNDv0d2eutN6YU6JEJv22unXmtBs+HEV
	zPmeCJR2YDTrPP4jx33SIk84LP9KTmASUSId2EtgessjBSgNNe1sN8Q+bg9JhuIh
	f5c4R4ai553L6kTN2Osi3MYW2uGsJmAPNSyJEJ6y8fjhx46OZ9fLNaB8ZOJKXysm
	N8yOxQENlS9jGcMSxchxcdqf4Up1uyNotLjB7q0o3pBf2OMePjK01rF4dgB6BqhN
	UGhDaQLEWn0LIeHwzo5eZ+RhH/s8dDB13iPQ6hOxs3wfLngecCMirBFTL5MGMpKh
	jkr+6l4ZXDzwH3frL+L2Z8/SScw4EGRrpPBkyjMd3/bJgStqBgRQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021103.outbound.protection.outlook.com [52.101.62.103])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4auag80a6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 10:18:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8nFtTToNII8eQzP9l/dWyBOwxfViSqu8bemMlR1Ab1bkLlSz/0wjniuwa0yOpPuBSmHReungpxGaM/5cpeYInKCtwmPkxkvl8y3Rp2SYMLMpYD/aS5k6WZFlesHcZm2pnZVufr1A67EO7xDN2TNRWFM6wxvXtKB86vaJY8xohP0ItINvEdTEdl1R8f4mFuyCwLAsMI7Gew33+I3YqQ1vhMS9uLVKr5eGbNtdh7ttDXBjM25s9N+51dheyiu5dEwRh2G/B4fwuRhNkHApE47mwB5PqF0FgKZpQS8FqbaAQz6vrWObYfNNmyJgxOP6FkvoZ1TtHGbrWV5RC/osvckWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZoYgoMHJ5OM8wXz46LDDnxoYPseSY0zmHvIVNYzhX8=;
 b=coZ6GUpAGabH7DruxfeplNjL6l9JsuHsLIQ/nG/ns/HDXrI46R3gSdxtpC67QhequaHZhRCb4rdGaWvlDPgTIwhiSu0ZmtrvUmMXU467CEgIHDHflCtzFIkIEp5opuZ71v9cz6AB57VLHO4zxVvGrTw1ryoFL0KvngIfMYB5qVftT2MA49KqXDzi0smY900XzSGxrXoMZyyM9/1WsMdGHP2eZj6zcwjJNBrlvA1X1OUP1JP1/6HIna9l0VLng3GqIcuHepMAumNf+tCqNtptSPOikdbfKlfjiRBAJllX5IvE5C1pBDRg++yDztt/55PXxtgWPEoIKP38lQbJcnkdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZoYgoMHJ5OM8wXz46LDDnxoYPseSY0zmHvIVNYzhX8=;
 b=jMxo9cuScFWxTnnee2dvo4e3ojFLr25Iz+GVUOiOL27TqwgCkBwjNPw77Smnk9kGYAC5zRIWU6KxGkEPAn3MHidxohwBj/bpM0tMzEm54oRZ/LayEjdOHRMupJ8VZVY3lHsAWZR/efcvSQLMyLXbx0YCEGfes99To7l/UMcVggk=
Received: from BYAPR08CA0004.namprd08.prod.outlook.com (2603:10b6:a03:100::17)
 by CH4PR19MB8745.namprd19.prod.outlook.com (2603:10b6:610:241::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 16:18:06 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::98) by BYAPR08CA0004.outlook.office365.com
 (2603:10b6:a03:100::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Thu, 4
 Dec 2025 16:18:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 16:18:06 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B2DBD406541;
	Thu,  4 Dec 2025 16:18:04 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9089D82254A;
	Thu,  4 Dec 2025 16:18:04 +0000 (UTC)
Date: Thu, 4 Dec 2025 16:18:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] ASoC: SDCA: functions: Fix confusing cleanup.h syntax
Message-ID: <aTG0O6A8niGz4Zfm@opensource.cirrus.com>
References: <20251203-asoc-wrong-cleanup-h-continued-v1-0-5142be4874fb@oss.qualcomm.com>
 <20251203-asoc-wrong-cleanup-h-continued-v1-3-5142be4874fb@oss.qualcomm.com>
 <aTFv2zyDC13VXg2R@opensource.cirrus.com>
 <67ead532-6e38-4504-bfda-1cf7e998c885@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ead532-6e38-4504-bfda-1cf7e998c885@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|CH4PR19MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 36358c51-b54a-4c41-ff41-08de3350b538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jqsIzjGWehVpIAQoU/MjJ55BvZAMYV5t9/3gCq1Dre3kfvypP01uMu/GTm7d?=
 =?us-ascii?Q?c/QRMGaQvW4VEhnKJGFO7XLP+T5B7WlsFFUwj9OdkCLuJgYyXQyF/VHVY3J2?=
 =?us-ascii?Q?n/Wv3d2ECLxoLWNe2e72PC5Ch+BJrvbKjK+kgqvZch39k3XHwdOyDCQEzdtP?=
 =?us-ascii?Q?Pf063wZUvEHN1dMxlTGi9WWfM5GPwwRVLHu5a04UGeYmLW5Ib2B7ll6315zC?=
 =?us-ascii?Q?mEmHZNrNoJgjZip77VStJlaT4EcYqaJqwqXc6p2RIuDZFr78teqp7xp47ISX?=
 =?us-ascii?Q?87TZOwTMvjOlnVSEVlwAs1yvjvlhrkCxR9hHPKfQT36cnCcA4QEpLwk0vtjp?=
 =?us-ascii?Q?BZXMiR/oX1vKOd8oRaF8pjlcQGJpNbcolYT+sg8Cc1YJZxCIboHUUHLOs31M?=
 =?us-ascii?Q?5AAm7uraFJmWfC55632ZrtvCMZ+r0KT1+0xpNtu6r248Hq3roy8X9peq3NzQ?=
 =?us-ascii?Q?vI/JLyqmu3MemYAKe1ZjSXriKyEoqYB/qEBv8Qn2oCHKuCLfRDNBhxVkwTXl?=
 =?us-ascii?Q?Mhk3f5sC4S5k1hKj6P4jf34ZwT0JXwOv6w8atTYg/74ekw+PENC8R10u3r31?=
 =?us-ascii?Q?rPUx+620e/8HMKLwIKqgr83Gu1DGtaQ5WZ8LUK9/e5g3U1JbyRWDSLs/clhV?=
 =?us-ascii?Q?Rehj6ByPm2d5CMUmdYDD9ugnpnw+lhZ8rn5Di1h1Ys70Sq2AvZf0fZuwXait?=
 =?us-ascii?Q?whMp2rfH8TjxrGJ+CJEwyqYhcA+LK3ELPTEu5j+sjVS6fNfBDm2XY6oCuX0s?=
 =?us-ascii?Q?1V3t5kU1jAGRWmor9eBFbvDvQCrmOr/EC205KVx2m2dKXGFLPEKVZ5MjW05G?=
 =?us-ascii?Q?rej91eS+/UWbUt8H/qD8dmHZ4gTthOJ5dgAve4MRFG4UqA90vHQMWUy3eACe?=
 =?us-ascii?Q?0KrW+5gvw2LCklHNfDgQTgd3KJ1chHcc4R6AUyBm+lGUESk+mzUZsAcqfKMp?=
 =?us-ascii?Q?V1MGq0CXCCEGPnal3SkQU5Mf77Pug44fjjtFg3Q4yTvtbcyVXTzbxvwaG1N4?=
 =?us-ascii?Q?l+0hqHYHJg3DdYu0+6318ucAWRwfQxGMtyDZCksvT3qC8h2C75e7VP4JuyeA?=
 =?us-ascii?Q?dQj/hdk8qOBLwPSGyfpHsYxHTUpoldmjLT/P4edq47ai2BdQeco/eAlcgLV4?=
 =?us-ascii?Q?OmgfNQhDcyNqiLUzG0Gfdt/e6Qjt5Inp/Lw4PaHnWIMjFyPr08ByHnZ5zt9f?=
 =?us-ascii?Q?LgADRO+vqvYuM7jLveQWL4vuhuSrhWa48w/lm09oykW4GKe9TLzlEN/xLzCq?=
 =?us-ascii?Q?tDYQKpidDKewJzY51fnxAWxAXRO5ZYMPT/t5eIbGzLI7tbPwLRhfWQvyybYJ?=
 =?us-ascii?Q?QnQVYKW17DYTMLGChf2PbTKRKezCnYDs1SBrgjoSGEyZl7rTvc1rkHHvWkmk?=
 =?us-ascii?Q?59bCxXyol0tqYneE6pUIPwYRemjA2vSZZctrQ1JlC0/OI339eswHhmfaSkp3?=
 =?us-ascii?Q?5leh3Ylaz03UKot9Q8LdKsDxQsVvUMbb3xPKtVJrOUoF1E5lr6KSbFL4B8p9?=
 =?us-ascii?Q?SkByqzZ27g0zagzEu2mbMoLwS+dJTTJEyYrlQR59RcpYSm4UwrA2D2xo6DhW?=
 =?us-ascii?Q?p+8HXsgBPb37KMdOyuA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 16:18:06.0699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36358c51-b54a-4c41-ff41-08de3350b538
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR19MB8745
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEzMSBTYWx0ZWRfXxaon8G6LrP8y
 QP0NUH/y2CCWzYhkAjBRQ0EP7fVb8k/nY31PT953pTvZ5UjRT0AIriCvTaHK/8bTBLTanizlZV0
 +4fQ+lAKXjYn5zuEyk0QrKBFtU+vjFovfGgJdwYoC+TBbhEy29vkXmAxzGi3m33CikKcyJX6Gdz
 b6RSfJdXEVzGvZ2t40nn7aG4dwMN0e9c64/iG0VtDF4Nh5749vs0TpJ7hHW+Lw2gxwpKuT3VjEA
 qQNvb8ZjRZKat+b5mlmQiLEt1gVF/1Qzzh9L+/m3CBWuIoA9Oc9j92VS9XOp6BgJlzJxJArKcOd
 DU227O+G5ZaIK7unn34nAWK2bU93yyXMzoyplQ01GwRtlVw27nQGRzpbbIczv5jm9VQAcg8Jfhp
 U8PqBypLQA0J+M9fN7QNsoWTtCslmg==
X-Proofpoint-GUID: cnYX5GBz9QogpKQTHsJeMiCVnjd0fZeQ
X-Proofpoint-ORIG-GUID: cnYX5GBz9QogpKQTHsJeMiCVnjd0fZeQ
X-Authority-Analysis: v=2.4 cv=SqKdKfO0 c=1 sm=1 tr=0 ts=6931b443 cx=c_pps
 a=QJ8jp5v3SeQRmo9gzrsiOg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=G9bn6Jscb5zWIiOAe1EA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 04, 2025 at 12:59:45PM +0100, Krzysztof Kozlowski wrote:
> On 04/12/2025 12:26, Charles Keepax wrote:
> > On Wed, Dec 03, 2025 at 05:12:40PM +0100, Krzysztof Kozlowski wrote:
> Yep. Few sdca-related files use that exception. The
> find_sdca_init_table() at least has a reason - it uses sizeof(*raw) as
> you mentioned, so that's why I decided not to change it. Just too much
> churn.
> 
> But I want to fix all the cases where '= NULL' is used without any need.

Groovy yeah, I am happy with that if you are.

Thanks,
Charles

> > Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
