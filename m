Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877EC194AD1
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533821; cv=fail; b=FWXoKTjESnoXX0Oc3LvDl1mmsZaAss03Sy3NTAbxYz+yUovpVC53fVrcPkQPEKhJIlxbrejoY8GhDQNy0H+O+r9uAOIcXqctccvxv/8rIXtA8IljP8miVP7YKecn6jHcD8OMlaQyqRLB1tV4gpud5iy9kXg0YgQj8kb9Y7BDOaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533821; c=relaxed/simple;
	bh=/WeepLVm3lH8biQ+sKyYgLl7Lu1RYQlneJrZscGYC6Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=E89Wx14oJSOFJdrvH3jjT9wrcBRWTT4D1r0rSOTmBRJoxy0ZOHXmTwfQxNVjZgHIHaLoxT+oLBiw8W3d/dmogkIFHgvZaYO5d0ehMrE1v1GxUPFxdIYjo5T3BZhkuOo+vW4wl5ul6Qde7ctW1YQzkxFfN0EJx6inkItUMeuS/CM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ctfKBN8R; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ctfKBN8R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2eMl8ToJm+3Z3KV7ldPhmilvt0c6Hwo8VP+mzNL6dr7ICp1tWz1Djs/lVnywhEfHRscq54101/0r0OSuPTGaKdsbuF/T8dx2ls2I8twbpnY49wsvL7amuxBYfnrE7p1tTH79uyY6mEOX4HU3ZEX6e2csJLWjwxm+QUUGEAm+CTBOF0yrRSJrotiudabWTPNwddFp6vhrjnPTECawgTIIfa81las8Qpvwq6oR/5VgPtNGMPQwnYen+Oc28HGWkOD/nPAMuu8wLKhxW4nv5aiKDD95xHlf7YNsVIxqvFWPbMlGSsW8qEpgqPHmuwrJtfBSkFJLv6ENvBfxegNyMu8Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRvMPsPL/gFN7NlICoODC5acDNM1vMRBNs+B50b41us=;
 b=nTnxb8JRpnWWIi5CY8s0IbHbS5uZ2Aq/ysZMr3naVZet+HNAU4OKKkNN7ZTjXpcCh7asJoBaUVXMWGSisxXo29Cy+QpRytp5yj59LrdCDldPyS6yC8B+9aAvJ7o863sXy4e6ayxPuYK0iHJZGUv3fGL3Yg/ehR2wktLQt8Yds/lK3FSOExO9qVGgwZr2mhmYz2ueDKqvn71lfVRa0Q+E62VQwoyQIPBl6J/WopGfnyL//t3kIH1ql1kfztL3MuMkqDgV08s1wlVGCZEYAegf7UU4kdbg2AHEIY5ED+N4NQBvJpoajT8LA69LkZb41CwDv6zqQR70KiChBdwaJ8YNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRvMPsPL/gFN7NlICoODC5acDNM1vMRBNs+B50b41us=;
 b=ctfKBN8RklnmkOFTdEhE9lgXcajgosXAz8hBfbdFeRfMFG/5HPE6yOSIjw+BOOerY8PVG57ozfiFoQvzFfr2zyn6SU+5yUwvmg0Z1oHKz1Ss3Bhi+ZSfEgT/LSHJjOzJrwzh/5573AecdcU/O4dX28FB/i4F2zMsMaxXmc7ngQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11967.jpnprd01.prod.outlook.com
 (2603:1096:604:23e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:58 +0000
Message-ID: <87zfi9a3lx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 111/157] ASoC: meson: t9015: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:58 +0000
X-ClientProxiedBy: TYAPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11967:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b70e4f4-019e-42c7-6ed0-08dd56060f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AwFjgLo+pjkaai7UkR1gjlIoZIMi/Bi1jClTtnFDQV5S37bS8/pCCmgqY/WM?=
 =?us-ascii?Q?n7ajtKNuFRDiZiYvUoaqSaQdKbCcff86xVOJI59x8diXaOcWMygditcH4am+?=
 =?us-ascii?Q?rABHeDNCDI6XnmMCrIEx0d1wK4ro0KqFtVOpJuIxzkNpsd73ZsShCHTFlq17?=
 =?us-ascii?Q?kw4zVcw+eRP2m4ZdLUX0Kd3YMTEB8tviGPHXILg8foIbM/wASXx8u4l6XopG?=
 =?us-ascii?Q?MyP9IBB+PufR3JlX0pkGQIedj2/qusZ8O4q+Ntjsy16Xbgp9pci90bEVsTss?=
 =?us-ascii?Q?JPsflflVTfQxHyTmeDvk6TNNK4Oa0O/zL7PPNbauEdCHzSDPsiF/TAhAzfqT?=
 =?us-ascii?Q?fNESs7JvZnBJ8i2kiz7j44kS104T11b93ITTs/75NTphqtKOWRRqtsGI1DLk?=
 =?us-ascii?Q?9xAero3a2qxJnvw5WhuiUkkHYXmQcNu0297DgOZv5jCVIeE/HgSZGSf2OgHV?=
 =?us-ascii?Q?wsf/07L3buLvg2aV2iC8De2HJW99olRDJdg/NsP/KsGovZ3F6mVV2Ev7FTEu?=
 =?us-ascii?Q?3hb2TO4d/fGMWeh82iPiv1SjaXkvVc9We2M6RaBh923TE4ro80Z8k52dPkop?=
 =?us-ascii?Q?g3YhZUUuXbAwOF6PsxuLbfGy1TXlCoPtf0HPePW+RL1I5+QfWpwtJ74YVcP4?=
 =?us-ascii?Q?Qp1jej4w0MYYb5jpNgE6yqCBVNOSAYPhTINldJmPJ9ZlcfrpAEvj8pIo3El9?=
 =?us-ascii?Q?75TCzflOrN3LGyQngbTT05PaoQTp9utzbaaM37ULviN2hO3cwvA0pN0+mPgq?=
 =?us-ascii?Q?f0Xy7PoKQiRo4LWoqUkfvlXHuuf2t+dDTF2lWNYLnbm0pvGdxUhKeJhUMOH6?=
 =?us-ascii?Q?BEjik5l66UDAei6WmYEEH4o6M2c3WXgla6OWn/y2DYWMQq5o1wFSqRjnvfDx?=
 =?us-ascii?Q?DjYoWiT1zxgIaS0KYvSk5wUaP+GWnL16YSHkEPZhdm+iCt/0WkfYfOTN29cG?=
 =?us-ascii?Q?4zf3DOwEBCddC9QAZygdOQ+Yf39RE2wpS/t0VlaSkS4Kfy3F2R+6BxQFNC79?=
 =?us-ascii?Q?2o4GxfIw0p1Odf4px8lU+JRIvZvYSZR03GQFJdN0XQV6oI8bl8K1jkypfm93?=
 =?us-ascii?Q?QpEF0FwP9FZ/oXf47E7d7FJ1jw+hjsSNPKVMkt5TzFlTuLKUL7tjfjLw/w7F?=
 =?us-ascii?Q?8bLU2/I7jqdzw+yYlqYpxRlh9I8SwPNxFCik00BkM4ukVhOr6JRP7fBruoeb?=
 =?us-ascii?Q?Ewal6dYuSGZLNBEWmxt0KoAVJmUf8V2/QOefIpSxazrk8t3VU2KQFTmO4Mgg?=
 =?us-ascii?Q?mhO33AyBJbONqhwwfMtpTrPR4xBEFP4KDX91ti+1mDjzOCxgdNiJpDC3COvK?=
 =?us-ascii?Q?dX56v3sZSfJc8AAlchJyqxi9vmQZ9AGjJ/n0GhGar18ZwXA21db+SMgSk5gO?=
 =?us-ascii?Q?2/zMvoO7E/E6hT8yr5RlofC8ubZJcTsbQqQW+6zwM6JyV9pAetbyBHAlClcq?=
 =?us-ascii?Q?VIkbT61qQ/qJIs+UqSttcvdhwCulmifQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wSWkQyGJjY28QB2X5EMosif99cQ80fG4AijIlzP2IGUn2dCli85Ksmq/s7or?=
 =?us-ascii?Q?7qoXe7luoakkkSzBix0F3A7MKZ2tEztUBjUDNTGDpgDRCqYVcMBMeeuzay5E?=
 =?us-ascii?Q?SebJ39QDFOI1+jlrI16xUyNq0+lAZ+puoxweyZcEm2I9LBoR99GgyELxi35l?=
 =?us-ascii?Q?jP04ya/2oAHcJHHb+4kxvcnpcvVYTQ8s2CkXflEa4Jy4sQ0Qa9/zE1WXQlHT?=
 =?us-ascii?Q?E4aDfj429viLuQa8vMz5HvuZLPOOHQB4KvR1YCVG8wUwVkFh3pHxGTe8xl+H?=
 =?us-ascii?Q?C9+Y/x/2TFeNWZTO/2uZM3CtM77w6t8WFhZsnYCUzTo64PcKsC/jCE9le6k9?=
 =?us-ascii?Q?kNXjbC78KdMZCbyOnTfPBPwcjJWtKXToEEBJl62nwpGDtRz8kGFc3A/xox28?=
 =?us-ascii?Q?9iJwuWlzFSkZUqgQdKXfnioSlF1woLl/tN2TqcMArqbhTdnCyAI6SZPx6nKQ?=
 =?us-ascii?Q?SKlr/eqe6lXISATNORDsALqhxWxyPKCMATpX8HMu2MtC+MZAt67Q2cL7rpXX?=
 =?us-ascii?Q?VJnEF7R6Qqmh0BSwSnUxj1qyxQcI9l3oyDw5NQTnXDK2WpK+id7tyHhl1dQT?=
 =?us-ascii?Q?2nEjLfMpJoJqcBOTlxYIZzXQyTt6odvy/1KJzaNNs4znh/OeMnG1bRTURG/n?=
 =?us-ascii?Q?NLGbq/NGuBPGI/c6pDYkVYD1j28v2AB0E2+YKpIxKF4ky0OtxdfmdU93eDgc?=
 =?us-ascii?Q?0B0iBX6xXvpFiHIlUh/8ULv8A1fHi8tN9T1GrFTSWQeROmKnzNzY4YGDLwwQ?=
 =?us-ascii?Q?8WXv0cQ+WZjEXDVubUgK//15fBj5aYM5+xnA9WY3X7S3Lh6BBuu+WcbFcEJs?=
 =?us-ascii?Q?0mUta1fYo9hz4PPhUgecmPjw36EAa706m9YJq+TkcJapwyS8krSdpf2Gd1sC?=
 =?us-ascii?Q?qiV1GY9kz5uFZ8xr8kLSztSI8CiEewiGkSE42JKkqm6N0uM2+WcdhLNRZg1S?=
 =?us-ascii?Q?bldgZs9rfklTEmlf/s2TaC74Me1Zg8hE6foa45dySPpLCemteGw+hsOMFf5T?=
 =?us-ascii?Q?J08VeAgc7b+d2Xoq7Fvg3ivqGfFcy16FKRTRUKHzsLP88w91b9ez6WWMyzYr?=
 =?us-ascii?Q?Zd+0LySpskL6upTTCS8iMD1HczNdlCElapU870pGKJLqmgfRL3fVPObM3FN9?=
 =?us-ascii?Q?6FMluAyqygXYyODZh5suOeMwxQHtCGtH+imcXCwqSk6KupuQeaWCMrApgvmz?=
 =?us-ascii?Q?yvx+PzSmYXjlabElnvOLJ3OrBLLNaD07lbR55B+n/QkLPDGSOpKYDCveN6WH?=
 =?us-ascii?Q?xMBfQoJaQKF0ZMkGT+QOfgsLUnaAwK77O64Q6PmQoItChT3o5H5dV1pAm6jF?=
 =?us-ascii?Q?ZHllr/cB6Bx58uPoCZByT/HlV8hShu6pRDWq55FamRWrYKcG7ryHQsj15ywc?=
 =?us-ascii?Q?IU5nt99RL28PkvaDdOjogZmAkgdwDZ3i7rkwYWkmbITgHxdZ/tIONdaIvdzn?=
 =?us-ascii?Q?bh1PdZ7mvBuoqpuJleNhfXiceHcQNC7iuWCFMTPrvSH9XW2bIllKC3ZWES3M?=
 =?us-ascii?Q?pG8fEKz4wx6QwHhaRDqvZDZkZX4kLxPYhYHrIe23yVPId2wTlScS2MmvxOty?=
 =?us-ascii?Q?UbzHDeXq2W2TLVWsiHsitVy2YfgLIQqtEzTHf16KNHYHF26XswEd1h5JL8w+?=
 =?us-ascii?Q?M5GS4cjpWojZL362gxZ4Xv4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b70e4f4-019e-42c7-6ed0-08dd56060f77
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:58.7270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZsncM++9dJUVQnTJhUqlg6XhTRlBYXs9+Sk06q7ldaCJQhCvFqU9SDF8BQ2N1bXGpN1z0N+p9y92vlW9n8TXvGrWIpSXR7K78HHL3mF23gmeHGP+ZcdXXbo5/SnFdN8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11967

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/t9015.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 571f65788c59..a80e9c9d6288 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -57,11 +57,11 @@ static int t9015_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int val;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		val = I2S_MODE;
 		break;
 
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		val = 0;
 		break;
 
-- 
2.43.0

