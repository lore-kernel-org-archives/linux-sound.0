Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795737477;
	b=tbIogpUTnf4m2/LPgWN52dOo8UnyCr/Wq9rKGf7WWnXm5tV7TJGMp6184ofiUsSpkmIZ
	 lontbazbVLVBkBBG7CWZl0H2BK9jC27kLO1lww8M1t5SPOitNdPlWSPT2ws9pWvSnUA0d
	 zmAa2m4YgzXWD3pNhtXmPVeHhM7fe7z7jL3lhzaozVLafImIyQqYhYCsFR1at8mEi9M8i
	 oPYf0Rrlfo6olhRQiMigLDWzPGJQpUaxni8qNzabxWgDwyNAeiEG/sI1NWLV4bnpasJZJ
	 Fv+4fmS56Ww6LRehWRqQxe5edync+lBlM0REuFaPORcmxZl9HcCrKRU/GSvfLU8RwwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737477;
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
	bh=8RosSpT2f4VYpjw9hmGi1XWb7D4v/rHiaYtSh5o/GpA=;
	b=WTLxt/2kDe9Yi4HYtUNuGvA1TYgc050vSQy+5DVV4dHQ0gyI0V/JoQ7rQDDzv99dtUuP
	 uBFEsNh+wRWQUSwitFrT+eAWK+chnUadlKEIsrrfs8OOswC8EniRU6hBHy6AlnIZsW2Bp
	 EqARjKwADhb1ZS1fVID+9XOzdJQvjZ5HW5FbLTmzbWOHMZdKgdHjBESyOevqw1Nx+jJki
	 t/iekLs31G7MtkSrI2PQFPAi82u8T56x2YoeU09vwZNljGceWudYX71iUibdObdqc/HwF
	 gOZnz5Dof383Wy/B93p0a8JzxbURmfB/i89k/bemg5Kt80Jlc0nIdGUCVj1hGB7QnCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=iREeuhpM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.46
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011046.outbound.protection.outlook.com [52.101.125.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24B606A31C
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 23:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F24B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=iREeuhpM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0np+EFp/W2pixJlEHuU7PPnI03X0D5tVj7eBJ1/J1D3eeIFiVgZbzBlmtLJF0hzV+1RHq9OifNttX3fsTJ37RBSAjmUYZgdtNxDjFIU90ZHdSFG9LuJIOORv/lmmiwsjheEIRXflrTvL6hjALKrp73dQIoU6EgQaZKyRvu4oiMlutIlgtN+aej5UIOnCYSJe/zNiFCEFS9D7tq+/wIULscCYqaWqsvAroh+ME1rrzYYSUvnrt6/byXPi6idEOL8h4Zz5emdF8TgPMw2OfcaSt9C3/EbfOrq8Jc9nkrZt2aOk8BtjIe4r2NKWAZmEozyC7NnJgOcTtP85Mdn8TTdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8RosSpT2f4VYpjw9hmGi1XWb7D4v/rHiaYtSh5o/GpA=;
 b=InrZ7ttW/oBMDShW3lsDVsribE5Au5Nry7hM8jNcs9GeBKFzC63ge7Cd82hoXhkhPipO2j6I3VJ2J2mMfoKHIM82wNb7ZMMoYIVdH9+R6xQJbXXxBBN2TlzEue3DdxYq8jubyh8LRLpgHr6+K6ITbJkBMAzQA2QZBNS+sgQlXFseVQfgmZ24tfYsqcme5fGHoT7L3GqWwEhzKioOq2bzEh2L4Ytd6MVEGZ05HcA2PiPI/81aSVvycNKV5P4XLITw8lvMdev1WnH2kls0nHZMCh4Xe8NgiBKoWSsJhCsSOOVEt23hBdJgXL80eTKrjuW566kd7jmqWZQtCQhO00hbbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RosSpT2f4VYpjw9hmGi1XWb7D4v/rHiaYtSh5o/GpA=;
 b=iREeuhpM6Fc/ZiLlvPdL+AWPHI8xIhExqeGUhutcFvbR+Ufv228azu8OR9t5pFTEwzB/5fkdoO0c0wHkLiX2Kk1mn2TSRZzf2INTRj87aGXXEXbT5+Sdck6k+F+RKZLYFBqEutNELiXcobWb9o8dauNQ9X/J8W72y7ktiBL2P+A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY7PR01MB17984.jpnprd01.prod.outlook.com
 (2603:1096:405:3a0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Thu, 26 Nov
 2026 23:57:55 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 23:57:55 +0000
Message-ID: <87se0nqh6l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/11] ASoC: soc-component: rename card_aux_list to aux_list
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
References: <87v75jqh7j.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 26 Nov 2026 23:57:54 +0000
X-ClientProxiedBy: OS7PR01CA0295.jpnprd01.prod.outlook.com
 (2603:1096:604:25a::7) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY7PR01MB17984:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2a9562-ebe7-4467-8eaa-08df4c1916c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|38350700014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZooNiMg5N2cGAAhTsBe+p3eyPFNXxyqBxLp+OtDdMPCL8Ui5uKE1pnnJdrS6URn4Hii5VDDNa7Zg4s2kDFC5hocgibKKoV2dsZERjagHZV6l0F0UP5Ekn+SVNYe+BlJa1x2GcJTGUJZXctsr3hBmS/iVV0rSCqOEcBgPbyB/mzSNweMofMi6sPBwsSFsCWz8ZjnCkjTlxU7jREKectT36fHe250VDiXOKz2LdR34xOjcED8IqF2V+/ZgAFW9fFFIfMMWUdJTqLdyZyTbbh1GrPBWQi5/vh1eRuEEJXZhkJ90A2cwJqHc0TuEXH3Wu7S/0Lm19sawZBlZ/sCXIOlqYzUP9K2RG3h1qMdHa1jxfZpmHEuFXNpmE1Ise7FMIlRykUT1nMBXumiqKU+cnPZwJU0CVAY72B8mNLRTpoAsvAF4hcYSbKtv+pI99oeKrlyiOfSUDlCOb77jRhSBRM9CyNxk1ZdhrBPZj/2KG5AHfh+Je4ZG2JxIuXw415qPBU/kwkz/HpWSs5H1R0k05XG9azZsfmoiWnHHzIGS/O8P80LemgF7HPdKFv9NcRs0pyk32cne6mL6L5CTdeKBpuN1sIpzKzLldeaRk3FY60M0xIpGcLRtIX8zQ6wpPNzO+8+yejxskfDquhGwvCUNNQVnWX3RryJVOqmZEvQIrKp/NJYBsBMG1oBfqGYKf/mEP2kqYnWub6nGeSyyM/gFja5WAgIW7oefOqUryRwtfShxcJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(38350700014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?84sXZG6oFbgzO03boFltGbT3yT+V1ZUAOkLnWDj5TxuMFGvgQBLJBXEfSe7w?=
 =?us-ascii?Q?JjERRYvV2n6hW/zl0+kyyXLKUHe8miGCN3L6Dha8j3OEabl1jax4Bzi0aMWL?=
 =?us-ascii?Q?ZuR1ndYhBPbjlLN1zQsFgOC/Hs4xg1lW/sZM90j64SjsxBHe0gV4txH5y+h7?=
 =?us-ascii?Q?B0lflObHi5Mu2f16dPdiiZfICo4o460gSZk2A1tduCiFU463MC1MjT6C+W8X?=
 =?us-ascii?Q?KdVRax/LOv4Wkf3o/iPLRS0Lr+92L3hVgm7vifSmtwwEozgzvXNHv5P5UKtB?=
 =?us-ascii?Q?dPKaBZe4OMR6ZlGlznYgA6JTTtV7c4DEAbg3mNP16K+nc5T9fH2pQamcfFG5?=
 =?us-ascii?Q?mLOHJRiAYNwT4XR949D4fVMh2Co0t64NMnrutK0hKmGkpc1bB1guGrGrZa0o?=
 =?us-ascii?Q?1t75ARXx3AuwUuLI2eYrSTRhsthM532FOTcf4LJoFPiYqz2O52UkJeEYFvpK?=
 =?us-ascii?Q?t36kPveDBtw+hhLfFoUtG+gxLFpA5Wg6xuTpqMTJlSjQfHW00HDNZf/LeJ6I?=
 =?us-ascii?Q?YR8Txx6gceRHu3JjTdaB4REEdyHjtDdP1plXI3P3cgzMV9EH6dJyKxC0oPb/?=
 =?us-ascii?Q?u646BLEQ+81WybXHOsxBiBUQiuu5uF17TYotL6QwAn/OHjFtjMyYGn3+N2Kx?=
 =?us-ascii?Q?bVaXOqQjikioNYOFBXn7arPMtk4TZAgZwaO+fd17vg0FyncHgfCdEHh2G0y7?=
 =?us-ascii?Q?62t/4GelpbEXfCQ536fR2O+ELI3tnOnlid1M8C95+gVnYlE/OqMhvHwzieAr?=
 =?us-ascii?Q?8BD0397zWMDaz/LIXj0sV1dNKjd3PnmitvE6EusYmTuxTmGgHMqyo3e/5X5/?=
 =?us-ascii?Q?s6i5M9p195qAy5u8Souhnsrws1ZTl0IT/cK/q3MW0l47gqRCxmMRIbqWY8pa?=
 =?us-ascii?Q?1mxZ+F6VO+ZG3DtJaHKE2i8L9ZdSg+nzEOF6sSuONHSmu4WYR0SfSMD9vX9j?=
 =?us-ascii?Q?6xnHj/DhVMptFG0wc4+znL2r6ifdim3WhzHMF6oRYFDLjI9WiRprZuofG7GW?=
 =?us-ascii?Q?hk0qwHOACPNbSgAzB5WOWsPNGMIioXF7l9JDH3lmA/D2mYgGKe5nWr1pqmmz?=
 =?us-ascii?Q?y5My3dTA2ZeN7w0V6s3goS/b+qCHZdIL0KsJttnaUSIRmOlq9r3w4nbQmgCu?=
 =?us-ascii?Q?t0tT7KEM/upE2U4QtW+jLeIUvRZ/KcYvRHj6BNwuXJoqs0O1kqbBGbxuuDYP?=
 =?us-ascii?Q?vd/PK1jPjbPZ/+qqqbXHcgqrNW59/bR68I72JFwIIu+c5GxChXdPurza7y+3?=
 =?us-ascii?Q?szsj2wjfzIpt39OX0tL7ONXmhjzNRLqDCeAUzeVNjIZ73HtoK0n3pUQzb8LX?=
 =?us-ascii?Q?XT6oUff/fBGo0+eAA3/eZgyFe9cBIqZ2olQCACciC6kf7qw3y5BoLIfsN5J/?=
 =?us-ascii?Q?m8/WN7Ro8NvHzbeskl+YvXICE4jyIwSiCKbTqwVbOzC3zUGlqw2Kq4YNVEau?=
 =?us-ascii?Q?xjkVOfOxWwgfD/lbrbdqjzJn+JQWX2fXstNfp88xi/xIPAwmAIXS0JV1xCQr?=
 =?us-ascii?Q?a28aff4l8aW0Lx2xLmdDYP6CyEouQXHWC7rUFsZEclWXJFpPe7aNDz4N2tmr?=
 =?us-ascii?Q?fH/82WayOiNS4cyQSYccK5iKNlGwkXVA2fANv5RSqiwvNFHCgOnDsJDOjmZq?=
 =?us-ascii?Q?YGSkN6XpRCb3E2bVoDUoq/xXLN6HD7NVoMMJZstSdA5ZlEqIbIyUIzStU7yr?=
 =?us-ascii?Q?zM49KF7DnIOv5JvLvQeH8CB90kr6VGLxobvO8M7dcYPXVSEYHLH8zoK5wYXy?=
 =?us-ascii?Q?uZNkRtCKJgu6PTl+JkfvQSLooXoI9mg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2a9562-ebe7-4467-8eaa-08df4c1916c7
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 23:57:55.0993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCa7oiR86c6JR+wy2LXI0YxQx9X5p8ROhNHg53Kgu0YFcXTOFpSzKJPa+hz8iY0W6glcvZwcu0BUEpJRkOHzET6mm32CfID6FaYrnYoTJTBOBszt+9y1xW5S2c8NB+/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17984

Current Component is using "card_aux_list" to connecting to
"aux_comp_list".

It is unclear and confusable naming. Let's rename it as
"aux_list" and "aux_list_head".

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 2 +-
 include/sound/soc.h           | 6 +++---
 sound/soc/soc-card.c          | 4 ++--
 sound/soc/soc-component.c     | 2 +-
 sound/soc/soc-core.c          | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index a5fc083055ce5..72513e62f7511 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -219,7 +219,7 @@ struct snd_soc_component {
 	unsigned int suspended:1; /* is in suspend PM state */
 
 	struct list_head list;
-	struct list_head card_aux_list; /* for auxiliary bound components */
+	struct list_head aux_list;		/* for auxiliary bound components */
 	struct list_head card_list;
 	struct list_head dai_list_head;
 	int num_dai;
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 5abebfa329b52..0a184462763d5 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1015,7 +1015,7 @@ struct snd_soc_card {
 	 */
 	struct snd_soc_aux_dev *aux_dev;
 	int num_aux_devs;
-	struct list_head aux_comp_list;
+	struct list_head aux_list_head;
 
 	const struct snd_kcontrol_new *controls;
 	int num_controls;
@@ -1080,10 +1080,10 @@ struct snd_soc_card {
 	list_for_each_entry_safe(rtd, _rtd, &(card)->rtd_list, list)
 
 #define for_each_card_auxs(card, component)			\
-	list_for_each_entry(component, &card->aux_comp_list, card_aux_list)
+	list_for_each_entry(component, &card->aux_list_head, aux_list)
 #define for_each_card_auxs_safe(card, component, _comp)	\
 	list_for_each_entry_safe(component, _comp,	\
-				 &card->aux_comp_list, card_aux_list)
+				 &card->aux_list_head, aux_list)
 
 #define for_each_card_components(card, component)			\
 	list_for_each_entry(component, &(card)->component_dev_list, card_list)
diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 079312216a3b2..e0f617077ee80 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -248,7 +248,7 @@ static void snd_soc_card_aux_unbind(struct snd_soc_card *card)
 	for_each_card_auxs_safe(card, component, _component) {
 		/* for snd_soc_component_init() */
 		snd_soc_component_set_aux(component, NULL);
-		list_del(&component->card_aux_list);
+		list_del(&component->aux_list);
 	}
 }
 
@@ -267,7 +267,7 @@ static int snd_soc_card_aux_bind(struct snd_soc_card *card)
 		/* for snd_soc_component_init() */
 		snd_soc_component_set_aux(component, aux);
 		/* see for_each_card_auxs */
-		list_add(&component->card_aux_list, &card->aux_comp_list);
+		list_add(&component->aux_list, &card->aux_list_head);
 	}
 	return 0;
 }
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 21d6579a6dfd6..eedf8a6d312ba 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1785,8 +1785,8 @@ struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *
 	INIT_LIST_HEAD(&component->dai_list_head);
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
+	INIT_LIST_HEAD(&component->aux_list);
 	INIT_LIST_HEAD(&component->list);
-	INIT_LIST_HEAD(&component->card_aux_list);
 	mutex_init(&component->io_mutex);
 
 	return component;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 894a81b2d9836..47a5d71da0fcc 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1279,7 +1279,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	INIT_LIST_HEAD(&card->widgets);
 	INIT_LIST_HEAD(&card->paths);
 	INIT_LIST_HEAD(&card->dapm_list);
-	INIT_LIST_HEAD(&card->aux_comp_list);
+	INIT_LIST_HEAD(&card->aux_list_head);
 	INIT_LIST_HEAD(&card->component_dev_list);
 	INIT_LIST_HEAD(&card->list);
 	INIT_LIST_HEAD(&card->rtd_list);
-- 
2.53.0

