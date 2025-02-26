Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6712AD18
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533446; cv=fail; b=btv7TdCGjV+yF+CDS4/hL/i+y2hFpQV8I8qrjgjdRno0IC/lx53oeCJSi66uGidJbXPY3s2vM1Du1MihzKfTs/HF5gvNukJBaauy3tCHrKZe7nNvgKbbe0Gs4rCS7Q1L9j6b30z1grC5d7QlN9lPRIGyKFCQ3q/b+fgBxnd+1aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533446; c=relaxed/simple;
	bh=Z69dIG1bQhZ4HVh79EKlPMWPxcNx4HgqwuMzfFq3DjU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Yhh4WQtuztPNH+2xCsVX8OU5U05Po1WjOuYXGSgdVetT1Wj+TKUqHhfVVSolC0rQlaIuM21QTb7K5P44Oi/kFpeIu3E0ikBX3tPFWsIRyo0/kZ0cklD7UuI2A3tj2ZoYHZe1B+up1+QuQkvqXS3IATE1ZugBsHLEpDQBvdutylc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KPjPDN16; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KPjPDN16"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVGykXFEdknM8mvrgrdURy+DWkx/URuew7Gz4uqk6iuRmmCCwAD0+KU9mSh4jKfztoDVA8G2DFWZagL1Mq6qmXAEwxR/xvP3krEbdj/NN0btcoYtcr8b6B43rjb3cU0utUp+6IKfx/Jfzh3ti4vuPnNy9UJzk1+0gQdJmhJMnhywRYfNKcC2BtdJHzQVMfqs7JF/a4RhrfOX4zntdw/oiuw0onIQlgT3s+hWnkRbJpCKMTa8d85iLYk6CTnqw97tDPQr/TkHgB3XNZqVmRdrPw/h0bZ1Q8buSuDURq3LSZuWSgWsKT2pzpumwT/i7fi2FHLBCr+7kPSg5xfI+X9uiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NajVQBx+MGNdtf64PHOX79S+0OdmbzSptz36gr92R6g=;
 b=R8dLau8qN5w6793xp0wHQomtqGQNoOFfqbD/0jzAGlGQ6/s6LE0dHYFXhEqV7EYflp9e5P1DCiUAPmOv2RAXetbgDhd5fpdnyjqBnKFVvRb0o++VTcWkTzIzSNX56KWGp4FX99RfFMTKe87E1s7dshavS0mCRfvCzFZOJIMgaZoicKP7J842ScXMonxg5I5fGOExPCUrnmrW+l79lDdRdfGqR0xs8WxUh7rBNnS/VL1thBDR6dnkhmRF3QGs4fGiR8zLsnEQA6HKo/LFfV0dIQaCd3r9y1EbO/E/sg9RC7SnWq5ndrUVb73PC22zoUVU4SX4IQRGqQb9sbmJ0L1e2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NajVQBx+MGNdtf64PHOX79S+0OdmbzSptz36gr92R6g=;
 b=KPjPDN16sS/vqjnA8YdXFjB1i5D0eUqMH8Xcxc7HtgsZGBHlgXjQ0xGU0rYdA/aLb/LC06VJ/RAmhd3XOneNB+idi4dV77pO4uHd7a53B23w9YWBLAV4p5EsR6/7nQRmI3VDA50THYQF0ITL32VuIB507hGpQ/NQca3EJ4GKTIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:30:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:40 +0000
Message-ID: <87zfi9fq68.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 011/157] ASoC: mxs: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:40 +0000
X-ClientProxiedBy: TYBP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: f19cde45-11fa-422c-da9b-08dd56052de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8dXmv8yQLbOSxxfPvdBeLsnMxl47RmMtpdwhwp8qLcuCTjyi9dZ8Lk4Vgogn?=
 =?us-ascii?Q?/LhtbonCbnw8rnPAr+EYU2mG/emO6eUM4Dxs/xrXdhy3/CmHAjFe0R7Qwuxt?=
 =?us-ascii?Q?D30RhtS8Tyv5O9llBFjzx8x1Wre7/A5k7pad9btwQ3U/vTByIIfnq1o+hgvB?=
 =?us-ascii?Q?dEOhPggnKM1ZKPq4hBDidxI540dIXu8yvlS8Qj96Vzf5Uxi9ZTg25Y/GaXya?=
 =?us-ascii?Q?pDhrchpI/J6v3jqarb0yG4wMB+4iI5smfZfPX6IaIrknxceS5LiB3PW8DmEq?=
 =?us-ascii?Q?YQzthHYmdmyRd5UHEwEAXn4su23t9rpsVnHGZfHdo+zDt4tLZUqSBr1snQAw?=
 =?us-ascii?Q?g1XDcJ+3efU80nUI9WZO09hiQHS8sTtXT/e6oMjPEnUK8xcHc/qLAvABuxR3?=
 =?us-ascii?Q?JcR+Wzy/j4U+a3vYZj3xtKMorRizu17HIwToAOdqnTjBfVO4gbNCgeXNj5RV?=
 =?us-ascii?Q?3Pq/PPf7QI2Cox7Oei78lF23XcPbZb3l4e3PCw5gKWHwsFZw2hhL7bZ4ww0w?=
 =?us-ascii?Q?BjLITkj+k8LvX8cZGQAwA8d5FqfrQBS264CmyEFkwf/9tgYIRBOFlM3Z8kWD?=
 =?us-ascii?Q?/q/PeDJtUKasfHBmosC+drzXdGGPcKFCC0h3rMucu0DksV4CO5ITeLV7KoAF?=
 =?us-ascii?Q?lTAa1CP5Fkhhx1+9qMaXmC5wt36aPHdGmHpwow3Ofk2ySN05KiDzY9+KfZfb?=
 =?us-ascii?Q?GAPSg+gdoLGqsHfhjfdxUNPTYLpjuDypPX/c/fojX+d4TZPwRyaV7x/jFb/Y?=
 =?us-ascii?Q?XNbgyJuWpfOwWgO1d1h1DFnTEbL7WzKvnOhIWxznNqqu2WpSm5opC7t1r8Lc?=
 =?us-ascii?Q?Wd2GndO8ZEeuIAKwjsPBLLLF6nvKQF8rmS1lXy6L/iD5HOOJ0V9jeb1ojs5h?=
 =?us-ascii?Q?s0A8VRpdaR7A2mqWanfFg79yflYod8SPzZUPrZJqw6erob8dOOFMmaAjUDdc?=
 =?us-ascii?Q?Tk7i9WqZZZITs8h7EFN6SrvcWGkcbYJ2U5Q5O8NqcY0XcoW4yc9Z3+bXa6pT?=
 =?us-ascii?Q?0PGAvLAYbEPQCJ7RFwl5ai4YHeAxM6/cF7BHlC4ZbbN49HCyQ/nAYUP9Yo6G?=
 =?us-ascii?Q?N+52NwrVmmiGOg1MrToAucmhcd0Pu9W06GRoTuywiV7W4Livh0ldmpzNxbVQ?=
 =?us-ascii?Q?SUcaDy+MV/bAwPxMBAMRu49ZdwJ+vr7E8JaBJcQqL74+V2ktCHSpW4S/0tn4?=
 =?us-ascii?Q?xTd+R8yxcxFCvrdAOrXr7bk81djj5Unm8p58uWAnRJeuND/npaptrtKuCrY6?=
 =?us-ascii?Q?a9W2f8yQSFmtRVWjB6ds2xjMDCTVKjzQEelOBHI+FNMIJjE8GOkRTckNJ6I7?=
 =?us-ascii?Q?3ygUWkx9G8LGEBHX3X3SynRxEe7e52PtMy+wnFKuPvvCWmoPNEYGn+CjkVfj?=
 =?us-ascii?Q?mlH3nMNW9z6QsNf3RdFZwAtte2iUWZ+SlOZFhjEWU6wQTDzKdeD555qq0YaB?=
 =?us-ascii?Q?yOfA1gOau+qVpusNdJM5Mlp8nnY9GTa6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6rq8MzI2a37NgAxtsNSP0MwYQ/cGIq7xLyTshoR0nHWU6gBELalezVzS25Na?=
 =?us-ascii?Q?uIb5W8NSKhdlz0ihqngYBb5KLYknONjP332WguMfKDG9CZ2xZecGtU5JAq6k?=
 =?us-ascii?Q?6EVMdRlCtxe8BzqV4QsM0+eORLmYm3xDwkxgL6DGJkY6g/SvVMwXAsZE19sc?=
 =?us-ascii?Q?+8REbUOk1QfHaJ9F4qNOqiWfJN0VH+xkPcVntYBYlshvQ+4Ykp4aeLHzL6oY?=
 =?us-ascii?Q?Z4nqNvOiZblk8UiKzpvjIs9i4416JC5NQCQeGiCJNagqTG30hawGGLPPsnAB?=
 =?us-ascii?Q?YrIZubrf0bC/4IUNQeyqwHxKo2uJYMIM1vTL7YRn+c/qmPi9Zc//js/AYbkx?=
 =?us-ascii?Q?M2WMBc1DcnEa+oT/4d0igk5c3ePWV3GmxPkrerZr7J8OJZVp6CNq6p2111SK?=
 =?us-ascii?Q?FzInWKblaT2a+QeHXlY1kdtKQMV6dKGpd6ZzmTVNLlmax9ttjB5ZBHwRy53Y?=
 =?us-ascii?Q?HWVC5Hb0pL9JHBX0p6weZVQINtT4ezodNP9OHXKkGIGb62d+H84QtfJB4/i4?=
 =?us-ascii?Q?gikeOj43uUWrPCnSkD14urBZjhwzqxdO+LIUVKDvcHXZfgYY6hvnkHJe4ITW?=
 =?us-ascii?Q?IkEY9Pxml28zr74nYY3L4cGsM+lGzhqpjvKJIkz6G0teQBxG4u4u3qKpl0gM?=
 =?us-ascii?Q?d4Xy0gJ2GFnYxMK6KRjGnwltPFESdOYRdms/4MaGMpvcmdmvlx2VmwHnqQkM?=
 =?us-ascii?Q?lcygUQK6DrxhE+y/w8FX4LJjObOlw6gNsaVSSlSg0S+ts945GoBGkKAEFyeV?=
 =?us-ascii?Q?M+6eLE20fGx1xiAqHAifgQfj0tx513sGoSn//zGKBJOjEIkPjBVanx1dCcuJ?=
 =?us-ascii?Q?4ZmI1SQjOkXaJlxsaLu1jvy1es89Sk4GyXtPtSewC7QHcH8OWjVQB/A6RA6X?=
 =?us-ascii?Q?Su98Z68z+mQ79t6ZiGQAuWdVzNDGTSyBBhS0rSx9PSzn92Sxe//Tp9QtF/yK?=
 =?us-ascii?Q?DzmKW5KIoOYDY9jIGdlVuJRETKfpRsBmCiyDVH2aWVmb+Ri/g63Pb3Fy4w06?=
 =?us-ascii?Q?pHETz3ytr/qjXvAdPJtS/fV6/RhmR7kVDqhh59qwQBb8kyNXg+xtzBEyRQ8w?=
 =?us-ascii?Q?LlemOHOZ+JnpBQQJpXITbYoyuxRkY5pYPyCGt8my9CVGyPjNhrObje78OVTo?=
 =?us-ascii?Q?qeslGg70wrreeYhriOC8+vzeZRk8xRfKKnzMWiuUSdUXiodcOPWDH+TliRD/?=
 =?us-ascii?Q?fGb+qiRWZ2Gkzhw3pRknrRGLC1FG5vNqTV0O7KAf8BL3Dk0V7iaxIyG2ndTa?=
 =?us-ascii?Q?YaiJ6VaeIykZyywgncWpIxbmkfcs6Pv+fNpQCQv7Vx55ognhWy4ZQ6b2uSEK?=
 =?us-ascii?Q?St+cV2b9R3HSfOvbt+lYW7DjPMDkDzGl8ir+J0slOi0kQSxLXa1A3KJ2RWDA?=
 =?us-ascii?Q?k1hqXDRGQNehnJ1iV0Cr5N5aYyWY30u58v9OUEgYmBsWMlnYPbqxzGaMMmyC?=
 =?us-ascii?Q?ZtnNhP318dmXejwEmeF9XA+ELWB+tet2lpIeuzgg3H9WpJdE0fy2yz0gJJi2?=
 =?us-ascii?Q?H9gCcZQNs3DyYLOH4Zp3960NcuUk/DJDa/8T0d1Muzd0NJXNO/BWXGVdcUIJ?=
 =?us-ascii?Q?Jw3H+bNZY2J1PBGGgRenf0dqUWKFnck1WZSm8JMT4as22MnX157uhihx7pLP?=
 =?us-ascii?Q?fKR2kSM/XnftgeYYbFQaGo8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19cde45-11fa-422c-da9b-08dd56052de7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:40.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hZvg3LUFFuc85g7DXByKhDABc37WydziCsrrNZe5iXv8Hn9sfkC3MJRombJw1T0kElgYYdGg9omodSjRZYMOsY/8Z5U7b5QNRWTGHEfbZrnMuCYNTcfcyAMXlpmvPiy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index a41a13ae38a5..245f17411638 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -59,7 +59,7 @@ static const struct snd_soc_ops mxs_sgtl5000_hifi_ops = {
 };
 
 #define MXS_SGTL5000_DAI_FMT (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | \
-	SND_SOC_DAIFMT_CBS_CFS)
+	SND_SOC_DAIFMT_CBC_CFC)
 
 
 SND_SOC_DAILINK_DEFS(hifi_tx,
-- 
2.43.0

