Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB29E29D0E
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533399; cv=fail; b=IVKhwWuCBGBj0XpAtkySlz2iZD7aO0nbKrVMCyszq92BMesATfoLE8VNWNnf489k0Gm3uOFZv3baSh1FDXx9b6Hdtd6qW96liaiQnXFRj6yeSxCZWYpaLFVfurWw+4ccLTMvlNwXCY8JWFE1QNG6Tv4881z9jvmjYQvCfMPDKKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533399; c=relaxed/simple;
	bh=s5es6FseolUreOjrBHzgD2DA0oMiwkhnY13HToqXBKM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hOMTH60MjsrxmG8QOEcbo/t2tm4jtN2BHW9vrWQkn313domPv24a7fzBTBC/I2STKOg7J7B7e83IqnIryaoJ4PlH4vHuJK5cL3ePKbHJ/Ri4YXpdoV8E0A8gbRZkuRm6umom11u4KRUa6ECEZKMRXUxZLDSgGTYHDOazohvkBTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=OPoH7iXH; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="OPoH7iXH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpAqgktS4+Yp0Z8zv7gixOzRy1NdJCgsKFj1L/zNs0YGfSCVBARhB2/7WCA9bTzJTtaiYt3tHrZcIfBJPqRoMhLfs2WT0vDlXkZHZejVbp3/75KQitE6Pozhgjzt71dKt/AOAI8eyyvF0Hzoz6ELx3HHHIjPGJ3dMzqJcDW58rfY4V/MOvN+FgGIcH9ZNXE4sOT4D+VkI1AKy7u/aBzAGkOPpgXew9F7bMi7lytobU6j6UBXguVcry8VL8znrQS4hCbkIxUsfB+ir+PA9yd9IIP6ncfdi+PRarBd/0qjN975deqDHOkHb6aEJm1o3aIHKzajYvmVoBLAUKmBmITZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX0KvltBF8Dkzw8PElWkILElud7g1tUUZQWrrp1DLnY=;
 b=Roec7FH5USypJAesVuGeP60i72BZP+1wPDp5mHDV5EIEeAQ3i7uPLvGTfO/HvnNqE/JEr1/pLOa927mb23Kg7NcNgXcBgmwV6cvpzPBdNOPwPErkc3brkohrY05CVN0ae4D+bk+pNnxu5hcQHqdC4vIVeU+fCeTW+LC/qrlIy/ihpD5SYJuVsjGM8xvuESAdEunl359MJb6eBNKt6GzQSnMKS0Tyjb4ajWWxYUU4rRLJ3VRgplnbv8PYBiIfuFX+fchpLdaL6kj+K9CStblQytdsgBxe5dqhwjAbv7bO8b2W75DYVtaFJLcQfNrP73h5gvme6LDbdy8WoA5ugRCr3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX0KvltBF8Dkzw8PElWkILElud7g1tUUZQWrrp1DLnY=;
 b=OPoH7iXH8abiyGchdsk4eHVG2nEf9ufIRoXTTMNJZ8CxogRCWfmzBp4DyCEAmN5r57tDlEriWYmkQnWaMv7383oJHNBo2y4U0CUTHOfhYim7K9U+bwn14FJ536lPyEryrMMJrY6GNK0UD2XnOUHJB09An1MQ0jPxIkKr8kruEko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:29:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:29:55 +0000
Message-ID: <87bjuph4rw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 003/157] ASoC: ti: osk5912: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:29:55 +0000
X-ClientProxiedBy: TYAPR01CA0052.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ec6d1b-c044-4082-d8ba-08dd56051341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PlCb7vJ+jdGS3WBEzcPj5g/Xnh/LcNC/UZmh8aFHRgoF69civFqXAB4eT6ei?=
 =?us-ascii?Q?a0aw9LPjSMvuHvBj1ohe331uRHllb8ldglaOy5OgtMAS4hP5V0tKecOTlrZg?=
 =?us-ascii?Q?0pOArFc8R/aaWRVhpKQvvEUqUckT1TPyjAMMl9VvoAViygrhpf30hnTL3hNw?=
 =?us-ascii?Q?VwvFHC4KATnIbdd5Cn4nVnoURn5/PE3g7I3XgF4WkOhUyQ7I/B9VxpAtO+63?=
 =?us-ascii?Q?ixFUPe8sOjYu91pFocnkkWRtBwleQZPYGoit/MiUc82P4X/+c+/v9+eCu6os?=
 =?us-ascii?Q?dBnVDCWXngi7W0xqY35oQsL9pYgUtzl0Nq/FLOEchx9dMiAR6sIzdoxg3iuP?=
 =?us-ascii?Q?IR9V75eDLbp33evAEizISgKAVBA83tCA+g1U/C97N57tFxHW5/kx7cyytU0n?=
 =?us-ascii?Q?izukVzufse1Pv6+GdhvGADWKtEG+8jYECAl+S8kx/ye4NwF8F/q7duRksUUO?=
 =?us-ascii?Q?7K1OmDU3n6MpHwkFHTuI7Yn+SvJiPmfIenvuXK77hefaAtwcatUsgHGDYCal?=
 =?us-ascii?Q?HOumeyL+1MYyZ5CJQI41ubIbIWjzomcgzhpJgjCih37r/JoThEgEN1uQ86q0?=
 =?us-ascii?Q?5W93BqkB2LCtTorQYuyZKxxF/a4DFdKN6F2w2OEbupVu00w2nP0iwGe+RVXq?=
 =?us-ascii?Q?qYh0+x81fMoRAShCM1ze8AUHo4heFGjM738QX1mHA2ttX8Tqm1+8lhId5Uw4?=
 =?us-ascii?Q?ylPQJ90L8VtqDd1sE7aUb5+Dg4tXHhQixvIIDF8/UFw5PM9qZXZNskbi1hXk?=
 =?us-ascii?Q?V0+F99NXZHtaVLEgOrSSP7oe/X6cpq3qBvsXovLr73pnTBklQpjVslJtwgGf?=
 =?us-ascii?Q?aMiBJ+oQPsBr3kAWRzQfRPvr2n4tBwDGiNM+TaOsplqLcXSjr/SP48GivFd3?=
 =?us-ascii?Q?I6EteQUFc59DpYJC8upHKA2XhPs4gdZd/qnZx9t+IMr72RJsE+KZVo4F1yww?=
 =?us-ascii?Q?Clfgo8cKytvBOG4Vv8U/4Gt3PXK1gr3zaCnRah3iplqdMu6Hl32Oh6owiVEt?=
 =?us-ascii?Q?N1OX6JnVgyjUDhyDwkE4AMASmCJ2d1aTWrtihOAqz9Z1gd0dIijHE79HrwqY?=
 =?us-ascii?Q?cDR1sbA7BQ5HY7gaEnAHImBQSUshgiStqEVJjShoK2wiw6vBCjYjPfXrMnqM?=
 =?us-ascii?Q?cuCgxFbhTfF4MdlxXwyvRBeGtJh6SYQ5lXC5bpIAviNF4pRysHOF9OVtexz6?=
 =?us-ascii?Q?0y/oj4KEuftEzUMyfsm9Gx/HZJc0sST5K7EKtPe5HjOxuW3jVrenp6OhjgE3?=
 =?us-ascii?Q?2CB8/8Ivnewg3qeF6BKV/M66wfe53kJvi7OGTSqHpwv1jNA5e3xKhbNboqca?=
 =?us-ascii?Q?E03EuKJtwNzKHXpgIpKKju6tcRmjnwkxTYCvAfNim6kgeaowk+JMtGO7FX3+?=
 =?us-ascii?Q?jwG43NDYCDZO+E3x7yM3O40zzY+BXcwakZZ8emZmbvdAbfJKnlIUzSi6Dp19?=
 =?us-ascii?Q?XkeRekNpKZiSVWMn00ziFiEIGKbjcOVw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ThjKEFJpGeaQOT1mkl5AYyRcBkQHPYFSS7DMY9GP7A93eyuZNmCr9pDy4Npq?=
 =?us-ascii?Q?8KO/DK2bUz97i3/dtvLYuk8lMhiSS5IPqH9qPx5mH53kOt2PcS3+xoE+symB?=
 =?us-ascii?Q?6HsuoP2QLnjNrbOOhr+rk+z5ie2TJ1xcu+VJrzFjIfWyt05THE/xbqVfYu2v?=
 =?us-ascii?Q?//Be8sg3qGFt0XUGS94UQfxeu72v3oaGVWyN6gdOT2p/OsVtUktwXtJTNod9?=
 =?us-ascii?Q?Z2tUVR7s3CAJOMrFyjlyjYx/3KHmyj7ER2zsHhZaF2j7feeE0PxijUUZkT4y?=
 =?us-ascii?Q?cxbehWm+GoPNR6wwCLmz5ucgVaViGEB6OuxNW3DlGfN327iCyRuRqin9l85q?=
 =?us-ascii?Q?1p+v2uufrGeKKpEZXHIIrtY3K8yxC2h/RrD4g+lxEQNAojIamr2jnr7EGCdy?=
 =?us-ascii?Q?DuQFLnnH0K7bmxifOkxwHAJniamrsk2qjsxBbEEnfE566aWxa90npCxgAAWc?=
 =?us-ascii?Q?IEocTDQoH/bVTVq5Xf23pMRGvwV/vCo3MJZP5ZsiYdgp56XN8Ljf6SNMa4+S?=
 =?us-ascii?Q?8BY9jnfwD6AfV2aYplhDx+OQGWY4iipUXTZ5H3TAl0iNDXwimrBtNIYZjDzl?=
 =?us-ascii?Q?RoVtNMEomSCahF+/PVMr9yb6sfcPziuX3Z6+Fwn5sCqyE/XxBd+NTh86dWRI?=
 =?us-ascii?Q?kdC9Ddg/XSXEPFRKeqnsO0km42ehukP6tp5jDuAQ0X7bpvNGdHBri/YVMWpU?=
 =?us-ascii?Q?bcp9GYu2D9RM1hPQk4vGPXspLzhc3npehN1GTZ/h/vi9QHEh5oK1n1K+rmLs?=
 =?us-ascii?Q?1trHDt/dDUKsikeYeoB40Hsm/Ss/LzNpjdF6tJZ2F2Ef6sm3pNX88aSrnUzV?=
 =?us-ascii?Q?AYPDRgkk4s9bkM8I8Cy27gWRvAuKqFjD1TIOAzRheiPZ4SG5h6B+CAvARMVV?=
 =?us-ascii?Q?6mafbdjEuyA0oPueL5jPfsgydL1eJPAIfvfoC1bv2Z/2SVxAjRzjXvrtF0kb?=
 =?us-ascii?Q?Hum61iKYmS1wcHNpYPi9dH1rqhcYYZc7OdcTQYC8CzXDhQE1l5Z1NNy5BQew?=
 =?us-ascii?Q?l4aUZJ+far/KChki9N1pceeUARpItMEQtMUd6M+Nw/yxWampzJt0pJvf2pif?=
 =?us-ascii?Q?JG05jtG4nETtM0XwG2T3YOkA5rMMfyf0ZJwBfMI+2+TcEKyv7mtfYRr5ELfs?=
 =?us-ascii?Q?cOE1yWHs0UAlTaRCWYjl6zv3yB4zh/yUhgDc+YpNT1B80FhvcZft0m0ff6Ww?=
 =?us-ascii?Q?2hXnY+i4aFY1kvTjtEq89Bvs1jrkAbq/bfNtOmc++twwfm0x27BZmNgyXGuE?=
 =?us-ascii?Q?04jbFudivCainWIpOtCZO+sQZyVNFhhE+5HpJmX9JPtf7lOk8Qn3f6ao/U0y?=
 =?us-ascii?Q?R2/IL4eQdB52cgKFN4EUzVFZ1N3SPNZOaek/3g/PRWDJFzMG7GIN9n3p7oe+?=
 =?us-ascii?Q?myElZI+a/QuiyOWRE8EikkHjvf//MWIGxi2445gnTXMH4rFTfRAXfjNSgTEW?=
 =?us-ascii?Q?bvb/UQcAGNIu7DskF3tbNrIEVy9KJkTsPoj4DeuSrT7qX48HCEwrKhtXw8Jr?=
 =?us-ascii?Q?sDJ1+BO4RtqBJrGDx52wy4WnvxEM5DdzxtKLqEy6AEY6RYqQviRAMoHrJ0Tk?=
 =?us-ascii?Q?vhvFkKnt0SY7zy8/XzVuRjlG3eVlmEamyoZtIAVdn+y8Z1GwGfNSPcYUhG9f?=
 =?us-ascii?Q?Zr/iQGfoQZMqTVnH6BVk/Vc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ec6d1b-c044-4082-d8ba-08dd56051341
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:29:55.5772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8bbTfPpm2SIgEswKTW6wYNBc2ypHVDyZs7PSDQhwMVIiLNrgD4DG1K3DwpLRm2ziuVhzTOynRieG4W8s0rQ9fycSF4cSJsNLc3MStNzGO9INmy4hMNAL/ATynaOS5CR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/osk5912.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 98714c593496..fa5ef7814dab 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -86,7 +86,7 @@ static struct snd_soc_dai_link osk_dai = {
 	.name = "TLV320AIC23",
 	.stream_name = "AIC23",
 	.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBM_CFM,
+		   SND_SOC_DAIFMT_CBP_CFP,
 	.ops = &osk_ops,
 	SND_SOC_DAILINK_REG(aic23),
 };
-- 
2.43.0

