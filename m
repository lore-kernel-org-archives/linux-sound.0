Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07241A8F
	for <linux-sound@vger.kernel.org>; Tue, 16 Dec 2025 02:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851295; cv=fail; b=WHLqs3AannTUSPQJRyeSvUzjCLJYCFKUVqXIKv9h6GZwJDzowrqcxKx/5admoiPV3jOMD0cm+bc5Gx//cvbRf8MParvG3ZUiDiKtjfpQkNrhQwhapQ2z7i51oUJuR9gXB+RKieYg+yYZYJsjCVFqjkkc/48KNHPbKn1/RMvKJws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851295; c=relaxed/simple;
	bh=GIFJWjZlH+OSrqetKSz/Ft66b/nRx9AxTMJF2rOHsuE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GZM/urTXqz0tY56SaNJ9UfwHBR9f5JCWX5IOB06msWedH363jWNCAt2QyX4SOv00miiHmoa6IPE4B1v27X7rHxev8N6xKEDvIprHUvFHCMBdUY3KbePPXZJe1DjPY0jkaiJq4GUfVyLhS6RfRrwuNsC6lbIPNrpw62J7carG9bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Ow4pRpKy; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Ow4pRpKy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSLqLW4gGtOxx1g/QyOVHxVMZbWmOhZLr2xg69Xs13EDGu3kP0LSvCfzTVSEAJyU1EnQeYswvo0gkFpyuVk0mCFb9dS5WtqH215snW2OuEOtwi53UGg6TFIhY/jHLlOnqo0IYi0FgTbqmQGQkLMtOqcu0okLLmgkAvBVt+ZCIU/MSeUub0TCm/5LHTI8vfHk4WqYIGOLvMnwqPjwlhomNfPMnXQ5PK2d0nLnVqdl61uBVBDEdPtrjEyVOolbbJwfEo9LVxi+HkcOF/BU+S5zXNWlaIE8MzVPXswSYvL8IaHD1Z9cCuNmDLawlWuXfd8KOWY6O3wXddNLNfSk2lKHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAcbqJVTSTjK5hGZTSdAOFwSnPyqIA4PmSb0W5r+JEw=;
 b=YGG87We6FvCXnoem0iKVD32i+wOAgVEJ1qF6g+Nbop5FlSpiCU7ERC3G4luw/lUIdpLvc0Z1kBKIBWUbW1+MFC2ZXSngnDSd5Wc1H295np/4qQeMSkYcbmIsgS3leZ8w6H642XqPf2ilfYsq6FBrVIkyRtBkkk2TNFHKY3IlKWfM3/H7InSs114WUU0G0cCOdpBAn2Qb+/sa2YgRLMLKO/fJAC43LVwWFLXEeoN/wQO8Kz4DkGyOlWq7ZrSx3iYNoLsofs0yx8uf0bMcm+3aGgBgh5LIeS6DqzFe205G00wYaqtbqXegldoQJf+EAez873Lulv+xuE93Aby0Fbj51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAcbqJVTSTjK5hGZTSdAOFwSnPyqIA4PmSb0W5r+JEw=;
 b=Ow4pRpKykCkYAsUbmvZqmy7vCYmruV3GMa5U7GRZYbSkiJfgzW0/E2tS/qg427obXEvmAxPnG2gfOP9pEuZvxiubDJORJg4iP31G1go4ZIStgAGFcUSgaSNRUpt0TOsujD94gzXC0IfMPJK5ufXgOqjYJIlV10RtvZgibbJjtFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8637.jpnprd01.prod.outlook.com
 (2603:1096:400:13e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 02:14:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 02:14:50 +0000
Message-ID: <87v7i7rx45.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/8] ASoC: soc-component: remove compatibility definition for component
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
References: <87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 16 Dec 2025 02:14:50 +0000
X-ClientProxiedBy: TYCPR01CA0187.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8637:EE_
X-MS-Office365-Filtering-Correlation-Id: 48378fa7-f3f6-4f28-f353-08de3c48e4da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/5149myZyqjlmpCZ0GaVOmAeeyEnmIxzfptZUz1OKl0UeK/c8b21BwtspK9Z?=
 =?us-ascii?Q?wLAqfbhFPbiB2EWNJm0oc+UwrQlpqg4Oyp03zzTWvKe1y7cuBZJNiXSdyFhI?=
 =?us-ascii?Q?g6aUxXhVI8GZ1S/P/sPWmAL5AW8GentkoKHK1tjVuOzEFJy5ZXyRFo9a2TNo?=
 =?us-ascii?Q?hyWxZ8rQPF/0TN7D7tIBTy2Fi2/GRBjhznm/DMevZKkglJBp4xaxmWa4oce/?=
 =?us-ascii?Q?aeKYX2imh2GJStnqZJKHhylRtZN/ZCZq35ZIkcqhVm4WBnF6jTs5oPxLxGWY?=
 =?us-ascii?Q?OYh58GJ0GYmR3uweFWz5WIWrvA1R/UxVMAKZ3fsPxAwH3y6QbDMU2IxIcSLd?=
 =?us-ascii?Q?Ej5FRL5sPr4rx3Ird7Jo34jeBdu6FMkBRiMzVBqdf84SBZZzyDb7guFf+0mv?=
 =?us-ascii?Q?xFDxyrqbve9kO9PFyUpZq/plHf1bBypDNTO4tyqW5D02Drm3dnqmjU/pCmse?=
 =?us-ascii?Q?b7cTAnQJyUG5pPX7c5GFOL2O8xHh1wsbOBuKZdgXVnOsgk4RD4EMKhdi82DS?=
 =?us-ascii?Q?5JZIwDrDsRwDgkZu6qXugeoEXRdiEq2KfHISJXNU4C9YaiewmnVSGihN7lWZ?=
 =?us-ascii?Q?SM/iPpBmzj/VUdVPybi3XTfQXBF10M7UFKwb9uz70eCqj5WRP+Yf5KRD0z8t?=
 =?us-ascii?Q?Ue2vrZ3XjfjQWtmpv894boGd8igMxlOjsfjoY6ZB04fV9SvjDRSiRNma113W?=
 =?us-ascii?Q?6TKICO/NeOe+6vUJZbgrZrRYLvi1rcg77VAWPZwfYg6evTsG5Neil4kXyi4s?=
 =?us-ascii?Q?QnP3o7WhgHz4UmvUvNT+GeZ/35HzZpyZHB0F8WwXb1/olgnGugaQHMmI3gcG?=
 =?us-ascii?Q?6KTUrczmMT6BHn1HJD6O+NgYcuTFliP7B8NLfuY5yr8IvEvf5Oc8uRPbT4wX?=
 =?us-ascii?Q?n302H9/5C1OWH8vP5RK+LDfpzzJ8GZx2CL+0ciOKOp2lVXofWva7jTyLWdhW?=
 =?us-ascii?Q?PTAI0/RtxoM0q5th0GtKcAgj1edqk8/N97j7KIZpPw1SmOEfoEDkh1b32OVg?=
 =?us-ascii?Q?Z5cvPYLOfZPJ+siLAYc5KU7DWj8Dy6f96ePgKxr8fv3bAo/rz81+1RnEKH+G?=
 =?us-ascii?Q?OiM2WJGENpySlSV/eajHxJqJyYx9bvHsj8QdUvEoj8zmMxlIc6GfCektS68X?=
 =?us-ascii?Q?qLsTmPSg7jx2MXVGzGw2KB4DsFk4ZvgruN0ZkckC9JwNUIDtxWbLlJvf50jz?=
 =?us-ascii?Q?7C1p1Hq2DaFUnpdiFTyf1DjYN62zs7DMs0aaZzuy00jc11ziVFvcef3TPqxR?=
 =?us-ascii?Q?UFwqMnD+THd/QmuOBdV+Azfsk8keagttdR7fpdwuT/ixNHLGVbApuLmUt4W1?=
 =?us-ascii?Q?AjdjBSrqDgO7OUUpmmZMP7ITDI1wg1KshQgZC9vCZRNmENKyHRpdinFqdzM1?=
 =?us-ascii?Q?++KIo9N7dXHJvdQIjytK7SOf1nS7vwF8Vl86Ye//Q9LtN6onT6rLCT8ye+fy?=
 =?us-ascii?Q?/vxL6P9ZVbsQhGRzzLoqrjFrsAvFsOdHtusRLuNq4bGRdQzRAeDBLEiI23Db?=
 =?us-ascii?Q?4U4tP4acob5VgiACBFA5U5HNuy1NVPiBUYi8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ptEHJKQCXq7yQR5kLXWHABlIx6gNKChXYGdVmB1TwmLs5jwfqvS8kLH1FQlg?=
 =?us-ascii?Q?Ug7GQSWHf2Rc95zqLje0vK8E6JfxZriXpcj/yiVRf+D2YUBqQNMvjoitjuyC?=
 =?us-ascii?Q?lY4KbhPYgvt/9Zq6WKmO4gdp9SxHgNKk1snUrCyf1I35UnuWxb0FCL1vBEnH?=
 =?us-ascii?Q?PdKKGV1IXYavPrHcxKM+auiEZIFusEpCaipqkD+/gR97vNgDBQ1reZTbXNT8?=
 =?us-ascii?Q?CHiIgJ7Nm7mXD9dsV0wYzQthSOqRbEbwAh6dBayES+KtU7PAwWs9AyEG5Gnc?=
 =?us-ascii?Q?Em+/8QX7EwuU7yBfD9GmNzdzjM9PKFQPdxRP2cPZeWM6/WSE2/1T3jW/yPDN?=
 =?us-ascii?Q?E42qK88+QMQMCvsL4aI5+7248TwNhvOHMvALtjcCvd0dWMNZY7Br/ISsAZmy?=
 =?us-ascii?Q?gIxp2OyQl/v1rSON7wzQxsMY7//lgCPNO0dx3wjfsR22BupdJUncpLepXDkw?=
 =?us-ascii?Q?Jx/VZCHFbupPlJ5u+37igIEW8EUchqX7AMrN6NzXmLNpcsM65MmKE4gIYxn8?=
 =?us-ascii?Q?1yL6T7QSkXsRdOB9dn2LQ7vvkoIXbMWlwTxBz6YmRDESrjvy6Zxvzl4rTqx8?=
 =?us-ascii?Q?0BdVvIZ5V1n2K2rmdnb67OMVGJfS9NnDR7CbSxMmLZbWZ6Aef7UD6i5QB2wp?=
 =?us-ascii?Q?1QzD8SbCNuK/S5UlwHQfL3lz/W3ZwhAZnhFua9vVU3lEqPdrh+iKLYvej35T?=
 =?us-ascii?Q?6BmTVVhiUpCGjVOv8UCGkiX8Gs8RC2s5jF3AHH4BCp2XmSckCO4mLwuMzILA?=
 =?us-ascii?Q?9Zb1MnLDfpq90QsUK9IKf+Xk5I1fuIdUx8BwV5LDNFJataGROuup86VqIsZd?=
 =?us-ascii?Q?pFWM55DtCBvNb9qv1lQdj1zNubeCXe46GHfM0dAI/MwJck+dqwnTL6QqrSPw?=
 =?us-ascii?Q?A591Zu25B8O2NkoOsAdf0RNGnF+hum1oV99jkU1krNUiwh+6dM/zwxHWEu6G?=
 =?us-ascii?Q?10OGfgg3mDL30dasXXwY/O8Z9b9WywXfOSFFYKpcYP5vfa/2m8kYp/f+g8fl?=
 =?us-ascii?Q?X/l3c8+q1iSGCcDUlcBofEtWA1csr4eCEyOZIhtlb/CZoqNc0SuL3lpJERCR?=
 =?us-ascii?Q?l0tvqbnVHlkawXTZguXR4BpMjRaSJ3FU4Bd3C1NMddGgYBQZlj7hKX6uTXZ8?=
 =?us-ascii?Q?purXUZHrLy4ZlvBh/vWeksuuaQZtXvT14hkD3QVNj9rsgDSuEVwpHyqIgUB8?=
 =?us-ascii?Q?d+M4QKn28ONbNZP+T0tKMSwy7vWlUPdY8m8CzkGCCtyspliQ6umawfSn63ts?=
 =?us-ascii?Q?qFtUdDRw7JYxI3VOv6a9Ekm3vLKEsxYN/4iTAxpLj+wVFoVW/+lwwhHvn67J?=
 =?us-ascii?Q?Y7TLe9tQ+YT8uQfDPyYwzhO/Ab7H0oEBCYGNqBDhylfr/xP7ffdk8UdjAd6b?=
 =?us-ascii?Q?ZiU1VLLcmROUKpeSaJJCs/0jdPEyGzSuStYTH6AeGrDsCwICzn0zd7BE+0Op?=
 =?us-ascii?Q?qFQi3uC+2lAdoRsgJCasDMgEcAzUf3VFNV7duZF9oMjxZav8A3gnCx0MmzFF?=
 =?us-ascii?Q?tZAy7tPb25c7t5eyh84aOtufvRpzYlD05ZD7abxEliebkccIDCDoFxGL1vaB?=
 =?us-ascii?Q?kuEy2OxiVliCoi1x3qlJ91xeS4RiR+tzBt+TzINXMCVT0AQ6s7ycbi/wgZur?=
 =?us-ascii?Q?skNP6cgIImgcgLsJqzRW+4M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48378fa7-f3f6-4f28-f353-08de3c48e4da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 02:14:50.9188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7fQ43E8qZS7mfxlt8umgKmR/l+WOwtlyVbSBu6zWLdx5hlVoANjJCxpf5cw2UJA+KmpOdBBlkhkQj25yhuMOZUhHidGve9gIXSl+z1VK8xMbO7ZVG1HurJtAMDMnh3N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8637

All drivers uses new functions. Remove comaptibility definition.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 8b34958395ca6..e538784746db7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -271,9 +271,6 @@ static inline struct snd_soc_dapm_context *snd_soc_component_to_dapm(
 	return &component->dapm;
 }
 
-// FIXME
-#define snd_soc_component_get_dapm	snd_soc_component_to_dapm
-
 /**
  * snd_soc_component_cache_sync() - Sync the register cache with the hardware
  * @component: COMPONENT to sync
-- 
2.43.0

