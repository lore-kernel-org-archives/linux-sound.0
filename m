Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571031;
	b=1wX/qWsAW/wsjARq9Dv03tQLX40m8uHSTOUFgQ718JJnEStF9cjP2UT/6FpogJO2dwur
	 2jDxEBjHWxn9E36LO+TypsjRkvBEie+8VWttN9fDKd00lCdbkTxgbZi+WaxloabYnW0cG
	 HuStT1dFKs/7ySrxo+9bxF+sBEjd+pd4gQO7FksflYPoC5C5QFU9WGV3ZyScomTrJeeh6
	 B+1wwu15ifMd2ZtwksT5pWsRCwsGZ3XtMyf+MUtSvAC9w4eRQah/BICuZJ4PBujW8cAM4
	 nwxNSnSbW6iYLc7bQGBrwtefEMqnwd0VEo1iaQImizU167K3Pcq5PuGnbFGUEKhLZIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571031;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=FY8vnEmkbO+RfL6JLmbwhM/BI+eee2RhfuoUX17mRgo=;
	b=Th1TuYEutGgoplO4/xdRy2eYIPgSLaffhb5+l4N0ZxiEHaOmX2HNMVmiAF5jEp9jLYhn
	 N6moJcVzs3JrjHOlKzcwu6B+j7Bi7yyMoXDszGKpdn+ayQWrjHRfJurOWnrBabyoBrJ/L
	 IgjgV52iPUom4zGkf+0VmfI/rvM/vUv3aUYvMejyC9pe8Cgcsl5HNHfN+i0//tBftgRok
	 1RdBJwxOehCM6rHNgYW/9X50m9XYX5pH4VSIMFG5GS/cgYXYiJZcUxz9qqmMlhEsT6+ER
	 4Oriwzl+noanNnZDn1eq/q4l1S9OwHq2ED8t2+4xGwDNfOeho4mqIwMsCBjFJ7m9tsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RnYB4b2E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.43
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D53606A329
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68D53606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=RnYB4b2E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nk3/gEG64sX++Ljlslv6/mPNKP+hLWvHQeKscsrBkDt2UEfcK+j4b/vb1soSAiFadSVHNYnOsGYDZeOGkKo8cpFo7r5CGMs6VAM26GYTf8Wy7ADDWdqPCkC5GRKNOZ2BA9U4R7+tsTgHJOKGm7+fcUASyNKzPahLvjj7JwVCMu6ehpmvtoXxR48yl+HrZRdAqYYPenVMrpnqrM7npGhLH9+YWd8gXewPHB8L9M0nhsh1fJqQ8J8Fg0xxHTY01NAOxLf+pEUZehkucwBoCyzDyzz0XigOjZ0wTcCQ06avxwmQk2WJFTpBz96sto/4g5AI9zoH3tmkGP6nqLQObht6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY8vnEmkbO+RfL6JLmbwhM/BI+eee2RhfuoUX17mRgo=;
 b=bEMGvT0kRpmvA96TA6qdJ0TUOKaIjn9hfX5EHD8Za7uDc87RFly/sGxJJHVrksAlsrdZyF5yzIhW9SI6UXyU9opAc9cDmpbCvIK94jTNIRowg03XpJW5eggRvMCdhk7gHSZES7+7eYSemDbofbFsN35xY1wzkIsD8v40yc2FPGM363SasylI/8S8XECwFWMRm5o5IVyfEwBVauZZ8ZNANmdZhg5tPcQjeR3FuBSn1natjPXZvCLgRk3S9cnv4mhp54R8rYe34p2I3GnBmYZpuLs608j1olDmlRlMIf7DHsAgmKMqxMjlL5VxXB7nyOLQ6GrDbv8f9HWb+miyU8k2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FY8vnEmkbO+RfL6JLmbwhM/BI+eee2RhfuoUX17mRgo=;
 b=RnYB4b2Ew8AqHj3oIFgOHri25cD8QahsGFROVuVzG7RcHx3us/uGLBet9P87LBK8OOvqcXN859DjrdIS27V0EfGztY6Y8p8he13jWtHLTIQ9G1ui+zwME6xot5VjoK9pAgROLK+7TbuZoPMYMXL0aHOF/CqWnk+PSY/AkB06fKs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TY1PR01MB10739.jpnprd01.prod.outlook.com
 (2603:1096:400:323::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.15; Wed, 25 Nov
 2026 01:43:49 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:49 +0000
Message-ID: <87jym1eld7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 18/27] ASoC: soc-component: add snd_soc_component_to_debugfs_root()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:49 +0000
X-ClientProxiedBy: OS3PR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:604:da::9) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TY1PR01MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: ad5d6b13-9bfb-4945-a720-08df4a958d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|261009223027099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261102130727099003|261026121527099003|261021121427099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	Nnw5pC9mKcOWQYgMMMVtFAoj/YcZ9drK5NY1zl3vDkpyJWpMtdx7yfBRk/X0nEfZ6iB3LK7pA4e5Gff4EFoHZLSexq5mnIHKMLzxBsEUqQWk2GHVaFkYXSAWNEMEJ8TFf33V44TYTLSingDz/khXw2lfviQW0zqMO8Q4iol+RrK6JLW8bZ6hdhaOGlWrYyzaVjNnxS2MNGtQTYdgO7lHFxepYTcMuhCvXqZPJXoHGh0WjV/cvCCqHVaYEVBbLAG2bIPZxgRuZ9Vzjo2r98tCz3eQlwUEFeU+bB6oWbRmNroPRTWIn5JWGzxd5McL+0neuptVPq8ykE8Tdv76uVK1fJZJr1xVIc1ZDW/uhehVBjQDS/5vaaUfo+NWQ+qqtvYCucefE0v/TEhmKIkhUQJp+gLrLMc7XSOspi7kPtJ3BkOo4m/Xf2kHkqJwsNtcGuLWJ3Msk0YRnZSHWITeG0JX/6/nP5QYyKAulE0Brrh42zIEcZYt9UMd1GVENE+QnJ+VvTSBJfsvDgJbrv0TCNf4bp+nfdkqhaRv/zX1c2FtxVFCMo92bADPs0nWShdYnnsrxSVIkhWwhZY1MQoUvLpkGEJ3d4/9LKv/dff647Ozk7fZUlLUqnvrJYuNNCz20NiCIzeFuar1Rngsq3kjhbdm/2JwZA2iI0+Ml6F2g5igHD9b9NvOM0xfkuV3I8sa/Sd5XXXznpUD4ER136TJuYlrTw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(261009223027099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261102130727099003)(261026121527099003)(261021121427099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?7nkul5P8x+GkFdHUClkm0Blja7sCGldQreJL7SOd32TqqhjFmCPlIdeITG?=
 =?iso-8859-2?Q?bUQdaJ9NKK4gWpVpiqinQHBt42cw9RM5rFEiEP9VsPl4fWErCKGlBQb+ao?=
 =?iso-8859-2?Q?DjRtD/eKYW7Slxx9PL3sEsZYpHvycbiCckGle8FyXVQyIYlkAvuLY9ZYyB?=
 =?iso-8859-2?Q?X3qeLvA19K67iYmNgN6Mms5w3tJtIQ2ZV5zKK/HFSmcBJrWFpBfAmtVgAr?=
 =?iso-8859-2?Q?tTux7f6DsHBuIqLSMZJxRizscBZmO7wjCL8OzRuQBK8jMzoMaVdqr4Vu36?=
 =?iso-8859-2?Q?2kzqC57y/eLRLgpQSfqJGaPrkZ73q8y/anDOC6vwjQPTY5aJArVi292oMv?=
 =?iso-8859-2?Q?qB9XQZnEm22DVy7zWb4c1bEwP1tuNTB7xYfFNJOuBtXCkFrGJoRSqxHWic?=
 =?iso-8859-2?Q?7fc+2qfU6r6lV7P3bBucSCJYh++mvVe4wwZE//nSckX8MVqE882T7BLB9I?=
 =?iso-8859-2?Q?hboma1hFDuyT4voq0GAR9GZAqPLBEhTJrg7gB+4M6DzxBkyuVjjurUVDOk?=
 =?iso-8859-2?Q?409A+g/tTwYpbAJhjHTCUG5ClE4DVEg3YXayjU3A8BFXmTE5YNbKH91Ww8?=
 =?iso-8859-2?Q?j3PNJC9eYADE/DLmEuc4ppM6LktKWI47wgylRhfFdFVxiiXqqh3sFSGHQA?=
 =?iso-8859-2?Q?xYu/nRJJKx5yeOu79aNwVSUVBYGWhs3NFEJ4psvWYnUuvSyNDnm3FDnB+s?=
 =?iso-8859-2?Q?E+nrsbbKx9wmqJR694dBH4xEg9B8b1DCqKWaKDk5B/nJLbAD8F5S7iZON5?=
 =?iso-8859-2?Q?85+QyDeFKkFOMJKc1818xDGpf5Mf6/A182A4czPrbBRSl5zZGLZA6HZR3L?=
 =?iso-8859-2?Q?2cHzGMrQe3oeO7BuFP2QmYcH8UqtV+yNmmaYjYjCTfq3788HBs0N486cgQ?=
 =?iso-8859-2?Q?Ym6BcjcWCgRt9SZdBnxKLc+sB6D/4ytPkgVk/yS0W8SEAmtSBEh15MXxV9?=
 =?iso-8859-2?Q?L9Q/K/9Zuo9roZ8MWlHt9omVaOGqY8I8B6oz2KfzZSjWXrkM/Fhxx8dIeH?=
 =?iso-8859-2?Q?fZGCQnFPuP2dx+cFKwJk4YVBu/J2dkR6cxd6NWNxlNqEZQa/YYAb24KRp6?=
 =?iso-8859-2?Q?2ZqPWsOM1v/bW21iwoufYhyfeGiGp+T0QR+tscBDDqGo3cQIkHsb2DhMAm?=
 =?iso-8859-2?Q?ltBcPDl9LVDDE1YYpjPbyrDtG5QV7jXNTBBepBwftysOhvyWQsN11Mgfa1?=
 =?iso-8859-2?Q?ipmzr1Np47X0MS0zfyj5WeYOO5i1+VqD7SBk+aR/qqGqQypOITfp04sfbT?=
 =?iso-8859-2?Q?42VyvVOj/SJ9qR4LD3Ny49FiR//Jx6+XeLT9+mRF5oPtX7XCYFfUx5PeCo?=
 =?iso-8859-2?Q?dcJrTjlozGf3E9Yer4ehr3AZB6HkacWPCdLUaAnIKjqFClD5b6VQU6AAmO?=
 =?iso-8859-2?Q?O4R8eYf5BpuKJuIhA43KwAbkLifXZ2hlsSlgmfp/Kom+IWJBCZ50RwyO7K?=
 =?iso-8859-2?Q?32pDnWe0nTLvpsje2eNz55pFyILmvU+cUk/Abz7++nIyADxmW/anwl1iAV?=
 =?iso-8859-2?Q?i0GKPnPI4jOl8F6QbzxyEuNRBvx+eetqApAFixQfG+E3SImU7sqGLqyBTw?=
 =?iso-8859-2?Q?L1W+DLB+P895ALCLF70GdVEWkE9UsLuldNuov0iLi8/c2ZR7abYUu2NZ7D?=
 =?iso-8859-2?Q?YTma9xPO2tQ75IjI5BISvG7ho5bJTv4lW/pvfj4FUigvcllmD0KQXLbSHh?=
 =?iso-8859-2?Q?LvS2RroV+ZJgwvFFOXuiDWv6hTocpgAKcVsXLdBVzA5B/9HRNsiZDvQbnx?=
 =?iso-8859-2?Q?JhO5hRF8NoKBheaqt7lDBmTjNTodPaVO/GA0YV1vXoKjpRn+6WVmUR6FGN?=
 =?iso-8859-2?Q?jlwJyusCdrCDBmONe4cBbNkuAsk1T+GOu4d5Tx4I/Yj8cTu8G+bv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad5d6b13-9bfb-4945-a720-08df4a958d69
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:49.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xeD5XBdbRHHCRKhoxNHNPvyUtsNk6grfOOgkpfU80w0AbaVnUpluGBC6bou6ZIUkIBaQyYS3AZPK4riKUJMMIhJOZpf5DQxAhcsEiiNQuUO2wIE1q+F1CBqbajOpPv3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10739

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_debugfs_root() to get
component->debugfs_root.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index ec0e3d7264cc3..0bc84c9c0e7e1 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -277,6 +277,7 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(=
struct snd_soc_component
 const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *c=
omponent);
+struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component =
*component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
 						const struct snd_soc_component_driver *driver);
 void snd_soc_component_unregister(struct snd_soc_component *component);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 2d666bb241223..110f4d60d4a4d 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -86,6 +86,12 @@ struct snd_soc_card *snd_soc_component_to_card(struct sn=
d_soc_component *compone
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_card);
=20
+struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component =
*component)
+{
+	return component->debugfs_root;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_debugfs_root);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
--=20
2.53.0

