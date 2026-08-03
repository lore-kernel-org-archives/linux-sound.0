Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602F306752
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 01:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785722111; cv=fail; b=T97OnhyC6OEd4divZSTi1tNzWNgU7PE2p0Ub59szjMx2u5ZFV1pZt7mjWljgUjqK3kdcS95Zg0Yn2XKmAr1XCdfzcbkereqocNmLZwbnWfYh5smxSjhuTpR6bJmz8BIX9ejEub1Cgk2ejifj3gb3MHq2w+Z3gCW9YLNpuTLbzjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785722111; c=relaxed/simple;
	bh=JA41tmpRyVPYw9NHjpaTGn0cH+36THelOCICK0VBbr4=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=gAvRA3IRSPO21oCS2QuTcKG2scBp/lIXNJcKwdYrjbG9C2ljBBIZoRrdKyZsekSwrBNL+XUVLOfZexTyEh3OERk6NtO0PTXVNpWl09mjIzqy5I8t1EOs7ntlyd2QQtx+Va/oeogoeZKVWFxXEjLMehhvrhaj86KJy1pX3j0maS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dQBKri+u; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dQBKri+u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJgf6G17g/878MMsSRrrCOdKUqBgHjdCVH0VyOsXfgU3osc+N4Ok2YY6kwYFwgvbmZHsydmIbh/SjOl2uIxmWg5gdriFPs26wl3F0dTaFJji+WLJGDi095IHSC5ut4nj32BUrJikQ3a/doe7iTEKQRf06rXt4uy3Si6r8ahLp67GohsaqoROhR2qC3DCZ/sai1Wokh6NTlU9dqXaClo0LDQGU71/x7bxQXqgXnzooL5JVjGAyb7AiuB4nBAPUnXROw0JYV+NH1yoDurK6kuLgy6s/rI6brr57r050y7Cq5foTf3R7sGVSVbnBGOHYMxud/ods2Av0zdsTqY0XmPYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGLQ1mI0xJJQ3IqbtxI+fM2jEpctASaXrx1dxBRBa2M=;
 b=nwZPGQ0TeKbG3MgFCYbtPgLH4oK5QGGp8nZbvPErv2M9B1UQdwDyb4dkx5pVGIVB/K/r0Tnj6G6v//l+q6wZz5H4dM5LXQ+Oih/MIykgpc3ykjnu9juXdxRSWPn3fybrNZ1d+k451AT29VM2ZGeNedJ9imkmRktdh7HZm55VzYBdkXhK7vm9qXnb8qEAp4aL3GOGdbvtytCOc0NQ1/NPszcm/TpaY7iBnE72AuCSGyjrJJJfdcnNVg19ndQVTUPQt11n6xNPt89DYRAi3QZ3/YJYwk8uyr9UIcsoOMPx4DgJD6u9GDKT9Sz19Xd1k9TgZ4rcKdhU+EAQ17HYJ3HZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGLQ1mI0xJJQ3IqbtxI+fM2jEpctASaXrx1dxBRBa2M=;
 b=dQBKri+uvMquAoNuylIrPAceFhJOkoAtKu0EO9MNYvn+qoVR+TUsA/QlkTGX1cO5AEXJi2WlqZH2nL2zeJSIUqTaTPLsJxt/2C6UaiMTLr8IxEc8fARwKVIg76UbJhskgUq+SBBwBM4VPZ806AX3DNQz9zfDC4F2qMTZ7JPPN48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY4PR01MB15074.jpnprd01.prod.outlook.com (2603:1096:405:281::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 01:55:06 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 01:55:06 +0000
Message-ID: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 0/4] ASoC: renesas: enable COMPILE_TEST
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 3 Aug 2026 01:55:06 +0000
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY4PR01MB15074:EE_
X-MS-Office365-Filtering-Correlation-Id: c56ae94f-a22f-4358-12dd-08def1023dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|38350700014|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	j37kSSl2NdBnn4YPurKwpB++E6G1k0NgqfxCqdo56F6UcT++Ywa4R+JjeVZgZajqSlKnvx9ry/BdInoVFPk7eEM6NTGdgPvkA7PHZK9r8+lkQ7yYFug3b5/Cz1NxblyMF1YHZL+1UZhKwwsWq5zql+Fo9tYKVHYFuepvVV4TWkYlpiyLK9/SXLUd3DUPYxzUlHpNebBq88TZHn0X7ibYFzSAbYebS8BhI2nLQkvoHJgoLtcGOHTvh89bXjeWov1wIJjdAhLr6gOlVgJGbn6SJlhQdGholyDrfKKbOOjwpl9tZnzg7BTOl2B/VLyjHvogo7+7nHdDLjaZQ4uOYxwvd32FSIYXUTP+NnCaBfiw+SW/0TJB1yQE22H7qCsqS8HMsPOIQkQME+ah7SJzGf0AbzkomN/qvH0JrenPVehs6G30rPyVpCE3ZVrqRFtVj6A42YiKIb3cLgeljGEw5MNThjZAutEeApyQp2lJapflBUt13B61jQvdUeajbBsgUSMqL+rRSrr4geZdqb4lTFZbiBtomAxa2D0bHo8A/BUL5u4vUC3dOnRq2oh+JWo+KzhvqO+BwSdmLZAk2XA988878Z4ANAxZngI1l6jzBpf5+hl7zCAhfPTTBEwwGNeTiyk4V664DP02s1XkYkvYVzu66KG1fuN7KOMPFh4tsDknvxMuFVMfewfK2J8V0w6ceCF0TIRRj2PytxwR7fU3/ib5Vc2BUKZukLK8fKRH4qC25ZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(38350700014)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nBlkKGbeLeaPc+weu9l3LP0We2yiO+P5TxPEG56zfeE2NUtT/lhNJwGSAjHm?=
 =?us-ascii?Q?y9LbO5xql1F/Iw665RjNkFT0z7jtJlBrkXLo0sDsVGsI95WPdXkTb1B+D+c+?=
 =?us-ascii?Q?9lzjFaRIxG5CqjuVH4XEpQ746yXwkwIvbQQUqcLgjetKFZDzo+LLFjyVbnh8?=
 =?us-ascii?Q?eoSsokuHncHysMI57uazzHTfYN6C46QfUpryOA2bALdbXCKJlj9ZCLvvkuYP?=
 =?us-ascii?Q?ZzWSPyxsjfWepVMArDSOu/D5JocSVv36yvztX3wiJLehEi2XvyMt8ASxxgJY?=
 =?us-ascii?Q?FubsOdl8yFkWGRRPIy/whKt6e/J0S8HLclnewQyTk8kji38wc26mOG2FNQEf?=
 =?us-ascii?Q?Jz4jFJjP+S3+eA/tdODJfHAJ4m27u+DuEJ6QLj9/ZhOQ0C3BinK6F0trxp8b?=
 =?us-ascii?Q?pWBAcCHBAqxaH41J/bL7p0IJgvwhGqOzH+vtBIvYIgS4HaR40TexdXZ85hOa?=
 =?us-ascii?Q?pIXkzyrc7kjDSluqWV4x4six+rrrQvPY+Kwo8jqn6DFnuVe18a/QlcTDdXTv?=
 =?us-ascii?Q?7REsC7oxf6BlxOQKZIpxaTcslXlc3DEvQ3fRTj+7XzB7yOHOiOCLfoHF2wDm?=
 =?us-ascii?Q?rifMLh4YZX4dthSoaCNRjinaRpLH/cJaZbLS85XVVgcpK2JlDGmE9QNSEb1p?=
 =?us-ascii?Q?S+pTq+gWw5SzTXwlPijiq5wfMaVdyL1qmg3gobuUaITYykeKxeBvGAEqJgWX?=
 =?us-ascii?Q?dv8gD7plO4U+Shx9CwQhmr2bz+sya2GxejIt+aZgUw0V8zd6wfigFAQLWzHa?=
 =?us-ascii?Q?eoRnxmtLN2uGzCc5iALOMPefCN0G87T+RZzid3tWIrNENlMGvdp7WRQqlqtv?=
 =?us-ascii?Q?dv+50jWy4A5uxnOEi4q9x2WNOY+HrXm3+MEqXNtHIhsQadHord/Xb1AUSLrn?=
 =?us-ascii?Q?gknRUKc3xtgGxfHCPoQsd+Lbofvc4O62humhMhaXRrIMvVS/GK3Q/dT6Lr6l?=
 =?us-ascii?Q?8wY40XTGzTf9uBJHKZze59pvXm6+bFCA1OYf9JTW6w4awQmLgW78sZ0hD7hC?=
 =?us-ascii?Q?ZQau/CbkBhua9yQFFhAip/Kc+TtvNbscee0Pm44hXdS0wiIBwPnobVurOxsg?=
 =?us-ascii?Q?kYQwueCryG5I5isv69WxD+PDzXgvMC9tNVS/EJtJPh2T2jiimKmpq8+7ZT7X?=
 =?us-ascii?Q?tnjNHP2/wp0nLiRt91FOYh/CCiCsyrMuxhuMnAUDz53iDe/e41nUE3V5/Xb4?=
 =?us-ascii?Q?v6X8yr1Y8Nm8sAJuA5mld2gCWLY3zGqApIr+pjd1XaOMBZ0c20u4ywvWHaRY?=
 =?us-ascii?Q?rzbZTQeQQdNsCZad1wsh9B1+PcI00K9TyxQf9IfwgenXMPecETXva1lAYTPj?=
 =?us-ascii?Q?e0fnXNrbSq6leGVSdeXOAtr4zWh0jWyDRnaoxF5Wa5U25loXKFYi03hqAGZo?=
 =?us-ascii?Q?6eKwbfi34Ns8ZcrsmE10HqPUQ82fcdTuXRD00nWTy6iPt/uEPWfrJEoCI1GZ?=
 =?us-ascii?Q?IktzUnV7vmJ9+O9dG1wX1yD8GXDm55pjJoNL1oZqjIJm2hC37l52BtfNviXt?=
 =?us-ascii?Q?eW3Dapd5iA837/5fkemSWKa7+BI84Z5YQYbA4dnKpdPH3LhuuyVR42znMvaN?=
 =?us-ascii?Q?48TWjqbOJGBWgckt9dph0kq36vl49bjHL8c79aSCe3pNKRLMaiMQLOSIEMuT?=
 =?us-ascii?Q?Dku6c7yyg9ChQZ9TZa3l3TpFSMyUbiiGuKY1NAyDUdiXTYuBJyBrO+YEJ0sj?=
 =?us-ascii?Q?9Lm9C+wWwbpYLt48wm+rxHxEBltPyKiGQegQzqQOgWoXnYlLdpJ9Ik9C6elH?=
 =?us-ascii?Q?YKgohmLugKLFAjDoU/xreBexVOiaTdw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c56ae94f-a22f-4358-12dd-08def1023dbd
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 01:55:06.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqSnaol/WjglH6EsNGNkqnxEeCt+ANh6c3B9zoB6lqw2bkDejdLPnxTjLebfzMbhwzn94mJgxHcVWnewFeVlFHFO/cHWgDyXIroidleSjjOQcVKCBtQ6O9AOXroQemrc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15074


Hi Mark, Geert

This v2 patch-set enable COMPILE_TEST for SuperH or SH-Mobile devices.

Because they have complex dependency, and/or no defconfig select them,
we can't compile them by all{yes/mod}config (= COMPILE_TEST).
So it is easy to be overlooked for compile test and/or ASoC updating.

Let's enable COMPILE_TEST for them when SuperH or SH-Mobile case.

Here, I guess ssi.c (for SuperH) have not been used during this 20 years.
It makes maintenance difficult. We can easy to get back by using git.
Let's remove it.

v1 -> v2
	- back depends on I2C for MIGOR [1/4]
	- to avoid compile test on ARM/ARM64, replace
		- ARCH_RENESAS
		+ ARCH_SHMOBILE

Link: https://lore.kernel.org/r/87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com


Kuninori Morimoto (4):
  ASoC: renesas: enable COMPILE_TEST for Migo-R / SIU
  ASoC: renesas: enable COMPILE_TEST for PCM SH7760
  ASoC: renesas: enable COMPILE_TEST for AC97 SH7760
  ASoC: renesas: remove ssi.c

 sound/soc/renesas/Kconfig  |  17 +-
 sound/soc/renesas/Makefile |   2 -
 sound/soc/renesas/hac.c    |   2 -
 sound/soc/renesas/migor.c  |   2 -
 sound/soc/renesas/ssi.c    | 403 -------------------------------------
 5 files changed, 7 insertions(+), 419 deletions(-)
 delete mode 100644 sound/soc/renesas/ssi.c

-- 
2.53.0

