Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F71917F9
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533681; cv=fail; b=odPYPiG30D1ODfIl8gZFn3qAKnHLvSLZlu1aIPbEsE55unOb0zfzk5GT4thMfIaGzYj5XodxCdWxveV7r/26z7gYRVwmLHumWT+ZeHKJJtNhuPmJbDz2/UoDd0KVn3VcXApLqW3CXkKKM1sEH4EC74bilXB/taIEAY4pEQnewWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533681; c=relaxed/simple;
	bh=99q5cPWGTs3pOWjQY+w45AeyvZaU0RirpdJOhyjJnGU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=p04zULkA6pvQc5B7TsIZsG8dQnL2LFsEEFwvO1UghfsMEAXwsxwH2HO08tLk49ogA7FscyjgKK2buAzIb7iN5QoPHNMZKMDgDu7WLAIO7t6RnFdkrwOM1GvzM79G+qNzKnRcwiZkMpbl+3k8X2ungqXWBGR4LJPA9sLJpJ6qP28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b7NWVmhF; arc=fail smtp.client-ip=40.107.74.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b7NWVmhF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mcz28AqSLxxKRJ9PDQ1sBkY5YMcfxhSrpdVoD27UQhwsUx3ucXONHMORpSqh3rwhkfg8Yk6c0m/Ue1mCZV2eFlpuPqr9e8k6bvSHSm46DqZXBjvEKNQLXC8LfmR9P/5Ybx/unhYEP5ZWX/PsPbVCn7tOGUAH1vnoRCYxusgvDaXuxOlPC30vYAlKuL8xPxUtlBI3/cmOhjxKNBeGPhvMTpSco/woAmkeDKQrd8TxEc6ACbhQZh6tcJ+AfF0goHQg89x36Q4+IU6tMs6116o5jCKoQTRp9hdoxjpk81s8yuDUPZChVeC2RtrxFfhmvE9cAs1anQ8Li7AOrKwF+VqTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYkUK7lPQXU/4Y9Fm9hHRvHdUVjSEsbgvNQ3x0RKAVU=;
 b=TwtvkE5b5rrnbTQhDFWuUvPFeCAbDD0P8qsXki1nB9geqbqiWCacJBhZMxlFkARdRSusH1vdc/VAM8nNrziFC+yGnz45sHL+Uo8zwv6GSbDvNwZitCRlq/YjqcZ+2qHHx1+rH9zSKFZyXgNtvBVhaKY/XpfJluU1BEE0Z0gXIs+Wi9ZHB9q4nigRBl1QGHngGDJfeJBuitp2EyKOMpV9OjUsgcu5mwFTmgXLjbm6TS4xpFaRzYlxvtVgX/je6dDQtcl6HjHHFSgUDwDPz/wIVYkIyXJTbWKvvTYO6A69IcXTlrEh3RZ5srwzWE+N8Laa5Il4fs2AyEcqL1GkPVBpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYkUK7lPQXU/4Y9Fm9hHRvHdUVjSEsbgvNQ3x0RKAVU=;
 b=b7NWVmhFAnMttpevPBFxpOOge6qTq88SQuaRdQzT+3uHsfqDMy64GxlV1DSvoTz+Y5+hdSZ8e9ABDoxDwrhT3IWHj/QKaNX5nttGALBZcojMghM3OV/KKRdA0DXELLVFHBYkMds75gvYTW+Js/t/yyF0CO4Wmzm1Cil4fASiUu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8745.jpnprd01.prod.outlook.com
 (2603:1096:604:151::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Wed, 26 Feb
 2025 01:34:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:34:38 +0000
Message-ID: <87jz9dcwup.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 072/157] ASoC: codec: wm8580: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:34:38 +0000
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 97884eb1-d7a0-4d25-4edf-08dd5605bc0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9RnEOrnuqNGymQG49s3cGvx343mz+yDtnUckfkX+W2WtDxyyBWLRUyyVhwUx?=
 =?us-ascii?Q?Zjq5mpLBWhSb1wI6kRwKOUqGPfR46X81PiuECAN7nFwemNrPyr4JFfkmgCMl?=
 =?us-ascii?Q?4dH+vcQOtgAQnKVRz21RKiiC/cQfmCp8o2cuUIzT4y1/1l4wsTup5q1POOtE?=
 =?us-ascii?Q?AbN52WPktsx7uqvDl+3miGPtlXq2//biNQVTj/xNUB3UcZvmFIf3uJZ/8i/X?=
 =?us-ascii?Q?cC+cefr4jjJM2hKKFvhXHsyBhmE63BvyDOTBr9jVDzgJAkXFwzzk4LuDgoEC?=
 =?us-ascii?Q?5nl86JmC6OGo1mCm1E0+8wVsrg+Ptvb0MQWpKljsE3zZ77oiOjRUtGbyvy2j?=
 =?us-ascii?Q?zCTtj8RtVEEUuRFP2wQO+d8CFnEki+cTRZED6lWNE8pcGgmNVQm5j2uW1xA3?=
 =?us-ascii?Q?clNu4NWlxd8KXAp+TBeH3quFarYlLZCKmo+bplkzQmMVF65BPlfw8Ib4Je0M?=
 =?us-ascii?Q?HyHUNAQjduehMBC/mtPqEF27HknlB6FBDDLqeoWgx1v4BopuPEGv8MRjVC2T?=
 =?us-ascii?Q?fUgLdt5IqnefzRb+DagoKByqempXfwn5RZP0aK0mhpYz713kRkv+sUxHrc7t?=
 =?us-ascii?Q?xVQmZHvpK7qhVvVCiQZQGOiNof1gaO5vs29vJ5jpZ8HrqC7y0DmjukG4gHwt?=
 =?us-ascii?Q?xmZlbOGRfN88pKGWC8+0tTUa8/vDY4vCqGylV31MCqp6zEz16drrmQsCdVUk?=
 =?us-ascii?Q?viuCbEZSzcRdMG/cAsr3xAmc5gw8l7Hf3xNqVgcdtQE5LIKnRSaeKjjf2YVx?=
 =?us-ascii?Q?ZV+MzJG+VVYllC8431/kGQY3ZXWrwwal4O1x/bkdIS6fvGvCaDJ+DdfAhtB1?=
 =?us-ascii?Q?5nF3+EEJ3RXVWVi4oiDTzJ/bJpnHDZGDycV39PqFGZZzUG7E3hzpEdxZs6xa?=
 =?us-ascii?Q?EegQRgtS1iKY2o1x/cMqz54V/QZ0VAGyYAVx0qlzIxuXWpIvxVKKunx4o6qI?=
 =?us-ascii?Q?3bsFBH4EC5Kgw5yGC2IT0KToC92A17TfEWpwygurn7Kg6njXV8SAkr4i2tnC?=
 =?us-ascii?Q?AA3PT6IHaIx7q/M3TY3Z5dRgQIw9UKW+JQxhy/XMpjHrOBRF6uIRAn0Qo0bZ?=
 =?us-ascii?Q?g/VnCt815NLlwhSPTYHutXZ5IctZz2q6ddmKR3Noea8sMNsEdwJaC9ka472w?=
 =?us-ascii?Q?vLMHgIlFR565x2byWana9jm51nDP5N+uiA7mv1Ic883j2cLjRZ/rvS0lnaGn?=
 =?us-ascii?Q?GpVFcXFckTJGMEuxxEt4okIyphTtlswoRM6ZyxWeVz+z4F+YdtnP+b5RmR04?=
 =?us-ascii?Q?CfR+tJs4dANULa79EiGCD4yPYktaL5kBrXn7IHiNQTvYnibmONP+/wu0T2jo?=
 =?us-ascii?Q?b/88W7+K9s5HjXQ7Gmmb3zTxtFogpp+k9N+PKUGyripFbfqdTODPr71lV17E?=
 =?us-ascii?Q?0fbrcNS+DYFPKlHzLE064eesVoeTGmYRHm9TdD6qgT7nJnq8UIMR4r9Eb/cS?=
 =?us-ascii?Q?3BM7mcVOy0AN1KzPZ09vBLkVm/t8au5T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1M7PwRfZWbZmhmEBSb5xU/q0WXe7L21V+LHHJ0dffvVjlRw9m729slPc/kf1?=
 =?us-ascii?Q?lKWXE0cpyX49xaxo9xnQjEG6jgGls2ttlVnQIi5p6nX5j9ex+jgMeWTvFRNq?=
 =?us-ascii?Q?6xs2VOhySS31yznOajaOcZdECH7BhJPw3809KzT5GzYBywH6A3yahMFyfrv9?=
 =?us-ascii?Q?cB2huh9sWR+UioCEMcS9V5N8QmAOp9Z41k/06YrBAiSGh5C4nhUzdj505HMi?=
 =?us-ascii?Q?zqHizC9GrjckjbjCtJFI2v258QKiY8PhcH6WIQNPNAncyhfKOq9fBfh2wbQ8?=
 =?us-ascii?Q?QepTnOqneNGWpl9H/Sepquv3CuZZlPnO2Gskr+ziBelpweU0cEqWpHkrcqmp?=
 =?us-ascii?Q?Kse6h0s52lq+nL/HCPQCzJEKDlZmv+wxRqrYcO9eQZ6Pv5xFEGKJUEw465ks?=
 =?us-ascii?Q?+0341oFCluaPCffQBsFedGDhCJxvakXILO9p49sxB6EkMzIiDre6pwb6xJj4?=
 =?us-ascii?Q?rldrnPsTKrCb/zDjD1oKv7jyVXP2PLhu497OQ2Wll/3im70WhtyK4QXJBi2a?=
 =?us-ascii?Q?vLLPk4Mz92rLNU1V9Gi+mTzR1lZzJiiJSRi4qDvMlvhTj+s4FUBWIYzRTWcF?=
 =?us-ascii?Q?o7wtZG7jbhNm3A9G4erPtvZuj45/MuCGt9SaxpJWSVSZ2pwFQ2Mv1Dpsa3QL?=
 =?us-ascii?Q?BPXJW+mQ7QEVMtmJjSs7D4nWhxXZZ0txLWKcGo0Q1m8DeSaiGtaE4jJOyrKF?=
 =?us-ascii?Q?F56cqvWTchB3NahsHGGYxyZeR+ySIjnLB19YevNU606TamOh8vdSw9QoqUgl?=
 =?us-ascii?Q?uutIdFaGhiWhI4R8RskwCHhFqdc9SmftarNRbyxdRpb0lXrVhoEJQdDWy0PX?=
 =?us-ascii?Q?BXLQeVjuIKhmfHPDN/k3woz3CmRSGY4ORF7aRMaG7NOBx/7CDSOG1C2w31rf?=
 =?us-ascii?Q?IGkMNLKAb/CGKL9IHV2xa/N1xMzJM0Jdl7QFpZNk1NWreNa87F3OoacMNUfA?=
 =?us-ascii?Q?70dQfkgoUdcxntobDDxpNkXOKPJYquox99yNhdME1kXfoXNV4BTlY8aJeo67?=
 =?us-ascii?Q?7S/iBku7Gpe8P0cdGivbrW2H6V8APnXcdy5Ujfd9ZNQV9xy0VhsPt7u8Yx83?=
 =?us-ascii?Q?CAC7fk45mljwskskniVKJyN24slw3GaZb5VqcND5I89U8j+9nM5qMHepyP8Z?=
 =?us-ascii?Q?8feMRn4H9+oBLlpCrn+PnlZjZdwchZyYKyCrnIpbaJE13CvsOeS+SsdxsfVb?=
 =?us-ascii?Q?k8b2Ql9z4kmgiV3WurSwE7FtNCJ6u4YnevSWLGuoV355NM3UDXU3Wq9J2itD?=
 =?us-ascii?Q?sMDIIyeDnN0PBtja3z6NcKecwaZX7cKqaNObOryJRtNzQOvA2NgCX6Q8qiOV?=
 =?us-ascii?Q?rv5XpKkyxpvOTBW2YZIqDQThkxvnq9pPnYVHTfSqgGhPeNv086Nz5T8rxNB6?=
 =?us-ascii?Q?J8XJNsjHKAagNSTQlKMuntkiaaw9RFyIQUU7DInnnTO5MqjYw/P6J6fZSYtg?=
 =?us-ascii?Q?79q4Id/+fd33SBMf/G2u4t+PnPnt6bogUetari2dwP3IyhaQbkydlcbeIDMs?=
 =?us-ascii?Q?By6tFAQxbBCa3J00YXBg/IDRME5YsY6w5nIG/D6pxeWRaUuXbinxYoWlrJTp?=
 =?us-ascii?Q?mlnW1IOWlvTIT31LrkOQkae4EhqCVrXcx6LhWBKCSmShZeIrXqOCo7CO8r9L?=
 =?us-ascii?Q?WAUrFMDSgd5533wxnmXx354=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97884eb1-d7a0-4d25-4edf-08dd5605bc0e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:34:38.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMujPcryoh1jlWFg9CwFN8TzVP/uk3YSDPeE3TT4gSMHbaIgIyOnK+Nb6LrL07I5nCpS+TSRGbQhizHiU09oC21KyTGCxHOh+RfDsaAgHP3x3QIQJBDfcFRll1eTztDi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8745

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8580.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 73a8edc797fb..ba4a08456e78 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -614,10 +614,10 @@ static int wm8580_set_paif_dai_fmt(struct snd_soc_dai *codec_dai,
 	aifb &= ~(WM8580_AIF_FMT_MASK | WM8580_AIF_LRP | WM8580_AIF_BCP);
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		aifa &= ~WM8580_AIF_MS;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aifa |= WM8580_AIF_MS;
 		break;
 	default:
-- 
2.43.0

