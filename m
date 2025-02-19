Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333EE22097
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739928003; cv=fail; b=NIMCbPLjXUB7WhAc6lGXhWSqziJAc8YDgP3qIQPb1P1zYWtoh7idvrkNOY/4fw09T7SHFWdPGTmrlPyDSFg+p0ViN9sce4CzD3mxGY6h5Qzr990tXdMy6SF1G7TqvqAY5dNBAy7pH9CCM5KWf3920ew9MnmhCeQFNbzPxDSE4HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739928003; c=relaxed/simple;
	bh=7Zy3rjErtEtIf/iGRbK36pjDBRli/6BDtA2aP2/undU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Q3eUwBKIyzF2vfudefG1iIb6vY5ntJyXP+AtWVDI9giNKCPs0EyLNk0/laKr6Cq0G56rRDx2YDfaA9YMHqCLkgdkfzNuBW8TuKbsodK5R8qmZfyoSSepw4mC/DRexIU9oxY4M43ePSK5NupqPBEo+l7P/W5v/fQ8ge9wrYpGPVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=moaePZu3; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="moaePZu3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYsnTKjAI27y5t3i9ELXQjpL1chcz6YXTQzVSWFHvdGmgzJrCHxbv9qO32BroZbiqwQJXnaYvDXFvKfGhdh2ogksTzfsQrY+EG2KptKHwiIwVMLaDDU+ZlZEaorf7IrZcnSjjqqW7PBx066jdpPj1ReDsqODCRkUM4wwZrZr5ITEjoTO2z/Jow7GsgiQ77qThCGvmzpHwckOpxbmNzZVp12d6vMMHfObYJfHHM62l55xcuSKFYhj1Z4SjquChUAqPix+fspfM/puAful/hPjIv1d4bDR916r4Krm2xOnEvu02aa5TbWD6+Dz+WnirBHYluTSvOox6tQRwzZxMkc+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSj9bmyyuu8VnKDFa77A+8rB5RD97gEt+2Iuc5dtOCg=;
 b=Nlhzsc6h40KYgPXZJiygslrEanZV+UanVEeewjmsrxluZK5Y/oJhHcLgBUzYcHWF1ulWFYkSzK+D/qoBcc6CZYEUfa1pxnH7mqSbxCzDjEfTCItjJOl962+8KgpsFZ889DANgHCt7cvrZnB6fXwm72ANBNfmK4AvwcBt0PsE6uzcNu/Kj6uoy1WvOSZgVp45dIX5KBvzZnpX+7LP3+x6TuzhKVA4dfyBPoP+guFeZaHkZYh9xWEzL/Gg/PWgeoZZOdoeX6uXPKXShvjyu0Cf45Z2Y5nVbVxdcMwxLlhbL4lj1DXOWNEejPANWqXGypHOqYRlI5GVhhkyoA5RmdyRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSj9bmyyuu8VnKDFa77A+8rB5RD97gEt+2Iuc5dtOCg=;
 b=moaePZu3sYHHO/GmM+LmbXUaNHB/xZ3sCpWOecDtfCNdDoKoekvH+x8Z/BBTDLJ1UB6T34Vp5YwSzn2GeYHxfy3+OSNaHL/xF6w05i8dIB85Kcuq+Q8uZ8Bp7EOhmK7wA4IQHNGF8/+g4WB7Kb4KqQuqyfXkoMFy9qxQOkbh5+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6754.jpnprd01.prod.outlook.com
 (2603:1096:400:b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 01:19:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 01:19:59 +0000
Message-ID: <87cyfevigx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC] ASoC: soc-dai: remove SND_SOC_DAIFMT_CB{MS}_CF{MS}
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Feb 2025 01:19:59 +0000
X-ClientProxiedBy: TYCP301CA0012.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: cae9939c-dac4-413b-87b2-08dd508386f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/X28wa7CdSobDJCFPJ+5s6+qACER3cGkGW0lZ3wjktmEbqR0OHGQxMT3ctRw?=
 =?us-ascii?Q?6ABEPZ909GNFL+85w4I/HmtBPDAAPXlJ6SQCVjGD2VTKKlTKgfz+j0JBZhe0?=
 =?us-ascii?Q?ZPFssrZ6CHcLjQZ2C6RpNe2cip0BG0pM6BT5ckaTeKqDnBKcuLkxWi1jky7N?=
 =?us-ascii?Q?xL0KeXfqok6QzskpzZvzbq9u7prpYOra/QzfhtAsVP4RaQ+vSRPEqfpaSRfb?=
 =?us-ascii?Q?IvJGPSOQVcTCPbxPohtO4cX+tzv6pxUhAAFAYLFqUH6lt73TYh6SNHJ2vhZr?=
 =?us-ascii?Q?faPyxH5D03vh7Vt5AeEJW1VKyQIcDwnqQAwz7t2cTD+OpfWnHy8xxIgR1UTc?=
 =?us-ascii?Q?h4DdQgQAZn6xctMVOP/duEvt/MrHNvgszsPtW0mPf43DGVXh6U6xs1SVPvU/?=
 =?us-ascii?Q?NxYvU+eqmmhwOcDwiHkr5569j7YnqdB2XNzql6i2jlsOMl/kAMGtVPo5FJAF?=
 =?us-ascii?Q?6Y+kVrMYFP1qQ93t9jUrLHc1IEWhhPf4jbpIy3BTmrEb5d5quoo9qEJenFd+?=
 =?us-ascii?Q?NZnK9pfp1wKCzBg9ooUQmq++DuDbNvoarJi3VTzfaG+RDWML3g+C47aGeood?=
 =?us-ascii?Q?yecTF3R37KIczPA6swTWzApTZjgAempPcrtpc+sRi4HWzNtDqMeFvU5hwzPv?=
 =?us-ascii?Q?YgD+40+Rm+dTay6YpNpkxo/0rscHowXJRJ91cTzlLZlt86wGmEpoy9Izz5NH?=
 =?us-ascii?Q?71z8KfFj95L+pVrb/xSKPVTpRRA/wsxneKS4V8pghocCiroN6K/FEoVGlxRy?=
 =?us-ascii?Q?jwRwtcQIfb6AHScuKVG+PVAb9JijFucgtTUezkTUobPD11ilbGop3KM9yuWK?=
 =?us-ascii?Q?bfnLzOIWgBvMY4GCmZghtqM32w92yzpQFyU+QtRKNLOswTem/ADMTKMiiJAK?=
 =?us-ascii?Q?UGmx014lwVd7AVtyPkcZXoKAoBmp8jojimoVD3K5xctUJLhYPvrBSImhK8nd?=
 =?us-ascii?Q?jxO5lhwAExF3kftPWjgBgZZS7j5tVgn02yvdIgEayDCLAlUyL/HFtZqe3zVj?=
 =?us-ascii?Q?OlPHPf60v8BJEOUpx+ADLHeyAKwUVoTOmxIq8g3tFsVI80vJVpivLhDKf8B4?=
 =?us-ascii?Q?CsxETQ3P3Fjtk/E7NA29aOmbfOPehCurZpiPy7cmxkCb9FYD120g9QuWyr1b?=
 =?us-ascii?Q?xrfwI/gG1+pOlnhHSQbFaZzPs4ZciS9PrsfiSo1CTw8xEdIp7+yZKkGyaDb5?=
 =?us-ascii?Q?K1etiMuvbFYwJaVIjuqCtRdkAVSYYbSD7CWqzUPHuwoAkWcxMpNxQYprH9x9?=
 =?us-ascii?Q?ZVwVgvL37JsFr2703JkT9Io0eQJB/VojQfWPRFBbO36riI/o34tTrqg4It7k?=
 =?us-ascii?Q?3idsn3z6W85pOYAhIzD/M9qiNXPXlJeJL8kIUeX7SzcWPNoK3GHbQ6CKI+Sn?=
 =?us-ascii?Q?ufeB+H5+ItT2vK66AIkVL1+8o9Rgp1g//wtk9EIpEkmTEO7AsASabNNkiFW5?=
 =?us-ascii?Q?hYFsTrj2e+rm5n0tHmufCFyT4ih45Oqo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LxAl1yXY33uEdhmJlGHUKZ+hdJOxXf5T91xBmhnRNsLm48YC+6SdskbTkeR1?=
 =?us-ascii?Q?SQOqZqk9rSMubNd2wa84pkt+RQ0LSTGmXPwdjRtxDBaeIpdISXa+sbDwxMGO?=
 =?us-ascii?Q?hNgbPtIRuUm8XbS0oxdqnX0I/nVScmYA26Ye3oovQgFecCEHylj5QMbMqqA6?=
 =?us-ascii?Q?OmL+xzWcvIu5aBu5uE0yKtd4jrpXSfnvsQa0JtSgAnhNUqRwrzlyet0mtPms?=
 =?us-ascii?Q?5XKvurO67LYUc1sWhVgX4pL6IhsG2k+SAMvvkD5mu7aGZTpH3sMMV+a6Gh9p?=
 =?us-ascii?Q?gYL/dvBgaAvNKrtFymw09ZWR2XNwiFkjQhglRqJw8K/vwwaJH6dr/k3wpoGJ?=
 =?us-ascii?Q?CqdTOLj+kfSMM1s2O0UMjh8E7x36bOQOGNeGGKeE+B3aGP9HRqSM49sjhGQG?=
 =?us-ascii?Q?yNP6AlSgcEHzsI0JiOhi1f82g8CY68kmNI/YmvqvcC4cw3nk/P8X8iSwO+rq?=
 =?us-ascii?Q?8jMXyNRuxwpwnA7elB8MN+VTiZwPTB1UotE1CP8Zz/sUcMmMsrX7PO/qWbLB?=
 =?us-ascii?Q?mghOcfg4WWQ7L0NG/4HgoGNF3UMjq56zhecUonSzbWP98auEkKOd3c6zBz69?=
 =?us-ascii?Q?QtBZpEdE+gpeg8K+WL4t8Ob2Jh02ku8o6x7uFbHHjBtVeMFH69VlS66mTyZu?=
 =?us-ascii?Q?7G0tJjLxzr29U3vasHIg/jX9JjKU5JcH0WtLnJKVdWoBYuxSM7xs/qXPAzCN?=
 =?us-ascii?Q?y1EAA+Dg7l9/OuDFqq7R1W5jEkE4Nl2pDoBcXkKqAbFzWGpQKDvF9vFNA7TY?=
 =?us-ascii?Q?ljxQHW1OGl37VtXi0ektvG5L0qGVpKPzyf0ONAA6Q62/wNPzNVsW0h7XMHic?=
 =?us-ascii?Q?sohsMsJE3kHqohV8lcbqroisE700pkKv3aCwIQdBEHDr6JvsmUw0j6+b4iys?=
 =?us-ascii?Q?RN3UFPjLE6B3oS9jM1loJ4dez267JHaGvWiZOpbB93DJ+COV3Nvuqbejfqn3?=
 =?us-ascii?Q?PVTg4lQA0R3+cPMrL+RKEFiQnA4CSczVroyVGM3B2eAYGC0fj/QENXylmL8A?=
 =?us-ascii?Q?48wIDNoijYAFbm/J5VElkPODMr/W9cwxpEoAE/AeWtJRl8hGVTbptuMrC2jh?=
 =?us-ascii?Q?+14cbnY47OgmTUeARM2huUK0XxPAFHE+0fNOLBbMyv3ZWBTtWIsA8kr4R2MH?=
 =?us-ascii?Q?cvXIEEcg4m5PdB+yHvgEwNL6TaVDN8ZfeyJyGVu5pBDm9cHYJ1XzegF3HqdG?=
 =?us-ascii?Q?z91GqOMq1IZwWbvNH4TYZjnXQi7yj1DrRTR2cbdv/lbhlnuyhJa1caZnBOpE?=
 =?us-ascii?Q?EM2mF64SJIPAboXlA+SyXJhtv68Yn33fAr1izyOaTSRAAHL+Qv01fl8Q3mEP?=
 =?us-ascii?Q?pYFUAicRgJR8i6zcrfC++nb/Cbo0iYjGBC9R5zhtAzOtJ0hi9RFJBfb8FUXo?=
 =?us-ascii?Q?o17JMaomFPjBgyuRWR2pWyZolMm0vprD7IKoEA7mZ4TvRP80bx8B9NCYXx/m?=
 =?us-ascii?Q?jVxyy2hBDCM8bDhZaojo5iBr0Wy03e2y5fqeNFKsths3s5WDOdp7STeZvTly?=
 =?us-ascii?Q?o1MVCTzKrydyDG27lnxzMS7eVjpOXK8euuKyfXT0FhqSEyB5eV3XfTx9Kd0D?=
 =?us-ascii?Q?V/Y3nCU74vQ/sAICJTT82/f+sjfKv31zYxKKNMIE+OKaVdX3GVEI1tLqHnB9?=
 =?us-ascii?Q?FVMHGwH2RU05d+HV4z5t6GY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cae9939c-dac4-413b-87b2-08dd508386f7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 01:19:59.3560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JeOxCA1vzVYwTz1w+UCfNbhdnLiS0ZX+yakM3NAOueM5ycDdqX99/F39zzDOKJuGrDYYobgwcE9KYXfQt+EA9JKyz2/vWgGmaek4gidw382Noh3CIJN4bmY03t41Np+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6754

No drivers are using SND_SOC_DAIFMT_CB{MS}_CF{MS}.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a11501752637c..c3a3ba4b0bb7e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -118,12 +118,6 @@ struct snd_compr_stream;
 #define SND_SOC_DAIFMT_CBP_CFC		(3 << 12) /* codec clk provider & frame consumer */
 #define SND_SOC_DAIFMT_CBC_CFC		(4 << 12) /* codec clk consumer & frame consumer */
 
-/* previous definitions kept for backwards-compatibility, do not use in new contributions */
-#define SND_SOC_DAIFMT_CBM_CFM		SND_SOC_DAIFMT_CBP_CFP
-#define SND_SOC_DAIFMT_CBS_CFM		SND_SOC_DAIFMT_CBC_CFP
-#define SND_SOC_DAIFMT_CBM_CFS		SND_SOC_DAIFMT_CBP_CFC
-#define SND_SOC_DAIFMT_CBS_CFS		SND_SOC_DAIFMT_CBC_CFC
-
 /* when passed to set_fmt directly indicate if the device is provider or consumer */
 #define SND_SOC_DAIFMT_BP_FP		SND_SOC_DAIFMT_CBP_CFP
 #define SND_SOC_DAIFMT_BC_FP		SND_SOC_DAIFMT_CBC_CFP
-- 
2.43.0

