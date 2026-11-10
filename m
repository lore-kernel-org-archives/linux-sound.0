Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288300;
	b=egCjybJpgJLC+QFeA4NZJ5Hz/pshrXsIaki/wmHR8ZWSx9rqHw8F9gdPuc7yYaheU6sG
	 P7PqiG5+7LFe4CVM4+vhYqQ7oHaQFYZBPm8Qgi0AXlKcZFhVOgieULoXyLDOnQm5PgUBt
	 UxLxIjKdHokCwOKWY2SfHo3iu/0S89IUYCBixHWqbq+gmdCb0v8nj5zE43G4kwwlAyGxW
	 6GKbDOmvW3PHuYeStSsTQchqPan/mr5Iz4IxJ/SItO7b+aa+1bLtPaeaCpE0YOAsvquGB
	 l2A3PI8VlY+va3MZexb6WgX9aL0pejV2y/l1+KUwzhyHNnZCOqztAm7DxgC1zcNIPww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288300;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ERsa26JL8bwtbFD+Omr+46yZge1ngRr1pQSSmOn+8RM=;
	b=GAvw9TlACuyqa1SMzx2vxrlO02uXyyJQaa2kttnRRlpjdPYSVYO2ZzhrXGHgb6pcRAI8
	 IusG8EmJmGECrYYlGxp0LVal7SEcZG/VaSZ+x9NK8wiGvTsl9lc1XSMbn7EFAlBAtyLgt
	 GkYlaZrieFpuqY48poWG1YV6tbML2uElCMvhrwrF2oQ2im90c1+gqQk8MUdACwVbrkgKU
	 JWM9YAnVJ5Tr1hFehpw+GxSmf2fBho1bUTEJL2PKYz00HoIz4pHh3fz4aiy1SKpFS8WSw
	 5msaEWCNz9q3Ffo0/jeqj6l66zZ0MzcXff8OvN6n4BpRnuxaLbmSQjupRKcL9CQgPZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=lhzEBBAW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.5
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381C5606A321
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 381C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=lhzEBBAW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpoXS4WYf+FGRjTkvWpKzMf6l9DKG+KqQBcZfBobsfvQqi1YdGpgG86HD9xc+PFe0MNKprYW8SGqwFSBFzd+gNw8IK2uXr/mGrpCFVKr70bzehcp3gFMSrWVD3FSPpKr2YAUZ0AqUqclEbXZwybYZk7sotJzDUBh5ch4IPAmvvyq1tDndNe3fiX95ahmbbINqQ72lvDxRGuQM2mNLB+JWSwrH5CGXSr1MyRMFzgQdgh3MPqrwHZN7d4aVF2yvL42r230Tvp9GAxinIe2b5+AmlLy/mkpk3//9VajHJcy8jFP2U9k5eOMAFbm7uYtb/zwtlybkPc51pttd0qMe5wcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERsa26JL8bwtbFD+Omr+46yZge1ngRr1pQSSmOn+8RM=;
 b=yQ5Ap7aHI5/Jl0SM2P+swkV4xlA/VI2mA/2+jhCFN4+/g+Nk+iZF+u3+i5/2gMMnqOHACPjYVa2Sb3g9n+8fvaQLJxEO+3hQ2bn7FXnRyLg9pcGgJDbFTinkn76quBAKjLvkI64llgblCTZoBkvqVp4D3QzBJnLF6YQeAQbhkrlX8isBi58IZJwCMxi8l2RGBYq9BsiH+gVmSob23gOldgQ8Yr3/3xpSk8QBs9HNtWa0qUrBrGkK5oT7U0tedt5A2wZetBRku/ZRZjXAvgZOa18o9wQBHRtkQaiwlXBI8WUA8LZnUhs9BhKNT+lR+bMZvkNIAXvs5W/LKMUp1f6nYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERsa26JL8bwtbFD+Omr+46yZge1ngRr1pQSSmOn+8RM=;
 b=lhzEBBAWJBPQW26n3w4eOyWSHwxBXz9nuedDcpG9M9WfIhpACJgGpC5WD5xqEWF56qeh7DQyVeKHjiOa/RRZHuQrSQW27zXCxzUpfkkCmfCF9JUinSuZ6yUk21lMQpjips/ONcWUksGABtIPSQWJluWkvndoRt+LQqveOPgtWWs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TY3PR01MB9827.jpnprd01.prod.outlook.com (2603:1096:400:22b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:57 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:57 +0000
Message-ID: <87jymlmf6f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 17/20] ASoC: soc-component: add snd_soc_component_num_dai()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:56 +0000
X-ClientProxiedBy: TYCP286CA0280.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TY3PR01MB9827:EE_
X-MS-Office365-Filtering-Correlation-Id: 92664ee8-f932-4c3b-c320-08df3eeaf561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|52116014|22082099003|18002099003|10067099003|261028144727099003|11063799006|56012099006|261102130727099003|261102123227099003|261022105027099003|261026121527099003|261021121427099003|261026140227099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	/9nKtO3bf0AECw3kgiMLOJzbi4UuR/yAuQkS7zlynD0ee+/ZYk7BETSiiFxfBfcEnZan2UJr+JAZiSs4KZCfzGL6Eis9dJcTxgqQWM8HA+9kpxsS+P10efVnRKlvNy2kupqP8aNT8OhdtmvbuoPVLD0mDaGVlElzfimEdA61vqXMiLW+9w4MwKBoj8/JCXCNgwZeUA1ZFUzH+ttAzC6but2eAtS8918jRFLvSx+RYUEsOtn6/uXExZTnXEz8loLSVD3W3agG/Ghz0AL56rVTlAmPjpcK1N3zuPhsFGLSo5eWa1Nc0+rSreIS3NEZgQBsA1l3LAWs9Wup2IZotWyU1YMQ96G7PePEuyt8m3WZMthaDu+hj1VroSh7TRYp0er/iX1LM8BuUrZSxqwSeFGUljhqmtx7iEl6jst1FaX7glBaeEi2ehDX5ZGEGylbKZRDiXo6DVNQ3DnpMIIIpAtl81NjU1rv50gcZEC0n1PX6cmVuLSuIkI+xYbYTdj1JK7gBC5d5Xw++NAzeSAtCAQA3mredjV+tbU7AP/4auv3Ld87PA4nazmLfqGBSV5xuZFDSzzcxoA/hosm+f6Nolri+tMWtzeDESgj3H/DHmQ7CwP7T4Xy95PIKKkreL97ViHa/Sgzfr3ToONvyz3ZwR1Ns5d6Nm3N9b/IXKhwQTO1Z1i7gL5U645Vl5pD1BhRtTlJtM3tGzQjqo5/AHBUhSUMURWGlYibXNh/PSA5fkNLxbU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(52116014)(22082099003)(18002099003)(10067099003)(261028144727099003)(11063799006)(56012099006)(261102130727099003)(261102123227099003)(261022105027099003)(261026121527099003)(261021121427099003)(261026140227099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x4nsULBJYSqCrGX2+Vx6qPw5ISh1JpO2ay3mrqB7epZaKixRpEcreJ3pttP0?=
 =?us-ascii?Q?lhTBNp7rABsmRDtKGXGCGsH09MYnFkeaZ1MjqSHDkH+rIxzJRb2sUgRnniul?=
 =?us-ascii?Q?ZSmXHk5H4Vbm06Jt/li4JTUjOnQDQA6UOOav0rj1p+UvAu5NaXxzSm5tuznx?=
 =?us-ascii?Q?q1T/0ZJOurDYQsJiPFVCiWKqTQ2Hr2GT6iOQRXtV7hh5oEbd6NHlbBP4Qx+G?=
 =?us-ascii?Q?XY8eSpyLsryqsrHIeQK7NiPwfVYmYogWF+fCluTAb8Gk1DEmfWrDkjqUm5IQ?=
 =?us-ascii?Q?rbMD4OXBfoYHU2JSptVZQfO8ree9a5FfCrN/cxNFCbb2OcHKb9DRzkaKo2R9?=
 =?us-ascii?Q?AdLClRQZaVJ2TG0KFAYbk8en4N5CzYbsz6IvKDqEshWj7SvEUHUreQZjRak7?=
 =?us-ascii?Q?BX2KRMaF959IZidzIQXCiQNoRWLMEVasAZ5/NPd6o63uk+TAKaaEtqxQ4HEB?=
 =?us-ascii?Q?frO7nGdMCd9OdCRqrrIl583hYaDt+PamPR5Wodw/uqFKnj7w6FBovFGfG1fx?=
 =?us-ascii?Q?PS/W884jRcnHq+x+WS1q2J1/fnsGtOoqdqAtmg/Z+3d6U6LcKhDcCCr3iBK4?=
 =?us-ascii?Q?QV3FMRatta6fKBbQhzW3LHWnII4zOwMznWUl3vdPRLrTIOapcsO3Rjd6exO4?=
 =?us-ascii?Q?mL6dOetXQ8qqZa4h7NvOl515+2bQhE6IxQZRq+zG0lOPnLdh4qt6Of/3/wtk?=
 =?us-ascii?Q?A3CMP/DSc9yUqQNjmlwSH3xBNZo3qLmetlYxYVtQAgVo4c6qpklJNF1zfhFJ?=
 =?us-ascii?Q?8RNnXAfD2zWBDgi042QYS46raUc5o0yakizrwcLkcMjBrd/Y9qjj2soemhLj?=
 =?us-ascii?Q?fBBTstMzhDP3+zcFxj4lVFiSfMDEfn5w7q24nYjwHFVlppM+4RcBnvUnVeZw?=
 =?us-ascii?Q?Bt3ZVYXIe8wBmE8D1eRvh5yZHFz+oE2iQtK1GGfT+xVf1vZbxZRhr4nbwBR7?=
 =?us-ascii?Q?PETbZ7Hu9ObEaFHxj2a3e3wzTYmnuS6kZECUmyVXjcy3HGUXAZEmbPLpMeAX?=
 =?us-ascii?Q?mG83U4weo6WthIrpfYtof5bCMPDFNKVFEAOH/12c6d7tkOW/25Ox9C0mlDjP?=
 =?us-ascii?Q?IW/z/s8k/QSya9IDewYA0oxxZl3gxU+Vx4xJCtBZOB8penMRomEgMIhn9bL/?=
 =?us-ascii?Q?jsjToGw6qiMYF3GsvqqcH2vmXeKfOgL7fKHJIK5niaUkrfX7NzNQrj5U8gdb?=
 =?us-ascii?Q?gbdGwqEsIqQLS0BvXDy5SYmZhFdsKYTXvFI3WLd8moxOGRYfBKIfs3gUy8HQ?=
 =?us-ascii?Q?Zlw7qyiXEwgHgPuTBaPDx59zGiQYNyN/KzVjLR6sxMCMz7Htxs1+7L8lpY02?=
 =?us-ascii?Q?nndP5Sq8uSbzNTZL6sJxJIGFvySVZh1EOCs0shM6LDvUG+LX20WcYRdDageP?=
 =?us-ascii?Q?scFLHIRMMacwsU9y2uMjTrImrO1Y/Moz+IwobB3K8UB4TqT9KnOSvoCu+0Az?=
 =?us-ascii?Q?p0YQ74CpBZYAMRuwxDrcuCo/pQuO4Tq2+D/vY20nCsZay4eZuGdwtQUn85Tz?=
 =?us-ascii?Q?5apmEtkFP74HZnzO/Umbd8bFnMvy/vTN/4pvrVeLN3bpn+sL858HB805JpLA?=
 =?us-ascii?Q?Rh2R2gdKf1OhWulTJArez6f2mmjK9qFlI2RfOi1CKAqVagJFgbepz0sGL2ba?=
 =?us-ascii?Q?Q9OytlPGlBBKHIc5dba347CrgNZ8FmSJr5dFH3gGIJjoUL+cJFwkpr4Kju1C?=
 =?us-ascii?Q?b4WDnW6+43GkDMCi5QEE0UPVuzepGPmjtbef0i2TE8dbrNlOv+G1vYBCJEF3?=
 =?us-ascii?Q?10jpO7eQQ6jD+2iGhICwCpwVW/FNzr7Vlmdd92RkvRisYFsAs9+1?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92664ee8-f932-4c3b-c320-08df3eeaf561
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:57.1330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NcIQfA6pyuA6AHHVdvrGaicJJI0F6Zs/cAyYCvJNMy9lMMEQP2od035YbwPpfg/rfrsZ3zId37cvT+G7B8quy1qtuY4LtFD06607Wx1rx+uIRgrds1ISIsyXaH1Um3Oh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9827

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_num_dai() to get component->num_dai.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 0a8beebd7b038..f60d797b2c4e9 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -379,6 +379,7 @@ static inline void *snd_soc_component_get_drvdata(struct snd_soc_component *c)
 }
 
 unsigned int snd_soc_component_active(struct snd_soc_component *component);
+int snd_soc_component_num_dai(struct snd_soc_component *component);
 
 /* component controls */
 struct snd_kcontrol *snd_soc_component_get_kcontrol(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index d8274273bb013..93978fae9b840 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -104,6 +104,12 @@ unsigned int snd_soc_component_active(struct snd_soc_component *component)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_active);
 
+int snd_soc_component_num_dai(struct snd_soc_component *component)
+{
+	return component->num_dai;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_num_dai);
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
-- 
2.53.0

