Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288283;
	b=WishBbgaTbMtT2GKIm4SKE7f2C5Tm3WI83Ted91uZNoaeTsQH5u21L5JailtzSpqTaga
	 WOo9eQ5MkAUKaw3E6fZ3rl98+vvksCRSI4to6tMppGHyjZIdlKdvQAH6Z1ywrDgmh+C44
	 BzdSZHlvkO0IRzE2pHHfDWRo92p/+9r6wc7hWWPV+p3JJX7T5n1elwO5xxmfSGdNBKZuw
	 ki+GyRHKCKx9pYdNUrUPKZgylA7rA06WhEsm/kKiuou5C6Bv009nNhwnUQ1tmJokYrkKu
	 xUMaovDh0RVI4MxKOIqsBPeG2PVcoE/G8Yc+fWy7WHB5/08oC/qcn/H6rS9hWiOmx6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288283;
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
	bh=/9RY9gyiTiYKFGO8E4WkNq+M09oRcN5aQ+FR+p10qnA=;
	b=RivEWViqRM68c+6FuhQoeXO9e1KTHhxuB82L42xxgEDis1zBw/p6pbuOiSmloRjzp6oT
	 2k5DFcxiimamJialVUkqVE1nV2ua0LfAwhfdFMP0/JCNUla+m/fmqYAtWy35r+ISb+QWe
	 7vvIoq7G+HNsjPVJREY/qNdWXR8w5SGLIUNFzlTAGpWljyK2ct8w8rcMVnfNBVxJSYLFO
	 CBMBYEEV0pn0p1ksDSqBYNlE4Ge7pZ1+tYFkaGuiRPVm3ACSQfuRoVSaN/3y6UsImVxHo
	 lkOeW2ZP6cRq+iWHTg23nWGnFldKdnb4iMswvW2Ar+aMOzX2g1pA/A2faknbHhYkOBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dMrijwDc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.48
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010048.outbound.protection.outlook.com [52.101.228.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C2A606A325
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C2A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dMrijwDc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vazPJWZCBga2cE5AElZ9nkWvsI+/x3J31LGhgkzHr4OK9B9PU7rtZQMZRG01B5+/XYiEjuFMUCLVirTnUDJodFBZQwUYpyPdqyvaDkI36nt6B5Wrg8ldIZxZcZ6vHtDNS1nCrNZjRh420RdXGqZRJUOGP3dld5+g7xYElySreMAYwnkbHaHMDNIeIKz1jYJDeTCrsS4tyEnUjfUp2KBcvJVl5PxmApVX9LaVeaBRlQ7w/geI1ibyZPlyMheZ2dWUs+OKIj7ctVzXDe0GxI5GyVtU/OqukD0jhsPlg4DrdRx/8Z8lEp4u2WVNzpAExZN7IBYOs8KnHQBxgjBbg+6mig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9RY9gyiTiYKFGO8E4WkNq+M09oRcN5aQ+FR+p10qnA=;
 b=M5cTdniCwf7NcaAIcGciMJCyibMuZv1Q/MYtaIjVOgu1O8KL0ontUopl+PYxNzfHvAQediFP9N3RZGOOciwTkgSB7MPk4OxR5fjgIKx81mXJjongJD4ZnVyCEgsAfDRApekLkflR464iHE7SQ1H1Rgks+ev4G9djczbLjGyGo+ZCKkAXYUDnj00gYifwsOD5RDsDqoYEaS+uFZkUUtf2oLPKEwEwa86JGuwE0VdySH9Br5NxmrrKAkBChscFkf9/Xb+GmFLHNLP73+jCtdfcA+KPqc8+PukKzkqaGchEWYizhdINuxf+viMAjw1/mgNQZWdUROKExcWPBuPJ/YkJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9RY9gyiTiYKFGO8E4WkNq+M09oRcN5aQ+FR+p10qnA=;
 b=dMrijwDcdirouIgTlwBsQHAkxZpsDGuU08ftU9wccwhmI3EitWC4EPk/cJKhaNUKVngEabXYZbrOXcR/JxjER62YFyWohuJMFVmoKuTbEY3+d0BpsfJ21tmlLq8UrfG5ePkzRhRXk1fRXjSW4OsLwgWAqTVl7RIPirgo2LmmB3E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS3PR01MB6869.jpnprd01.prod.outlook.com (2603:1096:604:12f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:39 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:36 +0000
Message-ID: <87qzgtmf70.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/20] ASoC: soc-component: add snd_soc_component_to_regmap()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:36 +0000
X-ClientProxiedBy: OSTP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:224::7) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS3PR01MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: 11af6119-59f6-4e4c-e0a3-08df3eeae8ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|52116014|38350700014|261009223027099003|56012099006|11063799006|261021121427099003|261026121527099003|261102130727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sqtNPGbwqk8p87/sMBGu2WetexfGnFRVO/hDKR2hOp418DweDTGRJRnjv60kQ+Bvj2HPNGFDygllgq0qR7dYZ7iTPYqaEycLknwbUOTcBmLoYdPHuutuKZrQzJ6xLww/N686EXEz1Xc3yZjSjNNGXVOgJxLBcLrN/OsRHnsQazCnFhEGGGOSzeE+nFKWGnVmwlsQvKd4NyFs8iPKC23PLNDhq9SVG8ONF1zXTrJJkVabx+eewM+aVs8fJK9Qb1DtJOtN2j34EVgymh7J3fjUmWcEcCIUQJyyGDtbvSjm3Av8BXliJC5xSwtEgfwC3+VpsDiD9an5JAQCyuq4Dn7NhdAyJrW6WGQR2MmDy0m3Dq7soa7n6lBfOEodJlVxfpzL2/w1xwRMgiVWnzlc61EXwLjrQ7ZDLRxwp8fM5kuwd6zIHSibt8O0JcnfLk2DehyWg14VjTjrlUO/iE2dYYjVqF7Yt+dRenfb/dZoNyYCRVovfyOWL5RCt6v7erYcre2ufQ9T8FmYboVMB+A09mWsnftfudju07OVrSjcTetT3eoFI5G2NfmcwYY85GpD+FGcSW5Cp7Yo/GjvjeRoofW8lNiuJA7SE2qFtMVv+YPGEeXdJQJcgzS1SJrxWlQIOMQo7lu+awbCScfP18zfoYWXPVyzFC8NKF62DF15sMd7Y8PxIP/XX5mRrxsFRl+ATdi4Txg1KsoAcVd6X7otQGnjrjcFOOGwLWqIAoTxONmag2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(52116014)(38350700014)(261009223027099003)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261102130727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rinHQnEXYfUuo7iN8r95VB45Nwo+Nll3ml4vWiE1sdc5NT8q9XHXUTRKPaaZ?=
 =?us-ascii?Q?/28e8nXSB66LEBvBY9+oQmGU9okaJ+tay/Zo0bF2j11FeoUr6aN4AdNEe5N0?=
 =?us-ascii?Q?uhcjXgh2YbNkgPasul2YH9UWLBYMf9/21J1QRwnEFkrddSZD+WcPyg/8R8VP?=
 =?us-ascii?Q?zz2gY0xwdBALD4WbAbjs7gBUDJ3+7PcGkV97sxWb/CdP8uMXQ2dmvkU6sysc?=
 =?us-ascii?Q?bEdI8WuTzGdOdfxw4M+xEXuyC8CHPAJj5PacnlVwMPcXEUr2WSs/06AEwUMM?=
 =?us-ascii?Q?LtVHHwUBU1UlEDsO+hdhXmeXZdrEoVJPv7XvuoiW3M1vgK3xraOMqi4zc0hH?=
 =?us-ascii?Q?xqvwx7u6hrzUWHynEAlaMeu+cZ+67TW0SOwq7yRgc+uk1sWTSgP1qzjVviT9?=
 =?us-ascii?Q?xvNYPZXNpkzRRfsc3WjttDygAxfayQa1jpyC9hTDdS36WQZdbcAV7uVubZ6J?=
 =?us-ascii?Q?Y6uAlldikD5iMgWQRgdfth3b4Adr8wGy1t9Laq6Rg2JvjWYP5zZnzg0pxGJ1?=
 =?us-ascii?Q?2SvI6kLv67iVoYXxMTWmBqPmNpF9fsgfAVJeWJ7hqmykLWMafSMKhEoL8+yT?=
 =?us-ascii?Q?KNQl6nL1FdXKZlaL1fnY2z8az7xe2oXX56aBMi4JgU9tlar7xsX/4ZANCLjM?=
 =?us-ascii?Q?Ddu1JvYli4FIJZK42c5urOvi8ymd9mv1nFs4Fd+kMoxG/dYwn92az914t7AJ?=
 =?us-ascii?Q?yFqDPPh73gpdJpuEELIbZClHSeTzaGhv3Be7YszfNR+iT8hlRiO6w5zqc6oj?=
 =?us-ascii?Q?eb1aLtulGjiPB6pygSVd9iIf1M92IrzG0gpsoG0d6Ec4cRo/3het3nCCj6S5?=
 =?us-ascii?Q?2gVo6wxJcwAf5eRRJ6QjSg1OXElJ6ra9+IpUxAYgrIVRIpMATB/EfAelptNk?=
 =?us-ascii?Q?5SASE5ch1Z9f+4SxGZC9k9gSmBaruwUat2NdBg5hbbhqud1QjoQJjSOPWTF5?=
 =?us-ascii?Q?xdCa+PfKSJVDsqhFBhEpyvbvZAgwFtwkh4Q480BGIB+nYkr/0+dCYpN4/3/x?=
 =?us-ascii?Q?qjwa46QEj/S8O0QAmUP6V0NJhUagk4d44Mw+8lbqoOYNYFusjLEa5DUlUNhN?=
 =?us-ascii?Q?2Tw2zr4GJpnisD+/Z+1uSSuc/pZKECDByczdDqZpg+DSwRk0PjvA37YdTyWX?=
 =?us-ascii?Q?fldaGocKiOHg15gqQY884bIhlYc1lbav1X53iVASOVYqep3SXrN+j/H7tVjI?=
 =?us-ascii?Q?EdEmw6SeHH+lWyvq0dgwkpaXfrMiezhRZanQ7WNEYXNWa+9pY0WbJwDD4dTq?=
 =?us-ascii?Q?SakgEI2QgAmsoEMGgLRvdz5qvSkm6BdH7iJdLO9L+6uTOuH4UzZTaxSdnDCm?=
 =?us-ascii?Q?TyCO38RDodhPlKqT9mSyhSdrg86XnbMiaaT3WEgX5FBxFLvS3nve5hYtW5h+?=
 =?us-ascii?Q?AmoEUPi2Fa3AjojCWdYFyvduV+oZBY/KCCe3rLz9Xh3xlFEUZjCSRyKwS1J7?=
 =?us-ascii?Q?mBBB7b4D0fTQOK5WzEr757i0KKNEQ1AvBko2VYVnqiQo6f1NN3349odyDiXD?=
 =?us-ascii?Q?PDsZWNeT/9hmh8YcRZ/2lupU4cmospgmBhB6Kz4NpEayp/Yc0bmrCiqwScMl?=
 =?us-ascii?Q?Qc+xkGOetDajVe/D6qVDMIo/WhVQBbHexdgDM2XrrK9bT3302FKNLvYCzW9V?=
 =?us-ascii?Q?QMklgiKtviOnFdtIzAHn1nsS+JrsOEmrOoM9aK7LLR3KY0Cv8j2zot8SUov0?=
 =?us-ascii?Q?qiZYpT+Xp+Ee2W7DGAxEChIcAnBChLoktczXODBEB07a1JMIiraeGHJNbrFV?=
 =?us-ascii?Q?Vr65LJDD/U39mEPoR7W7c1ipLMmfheB+2OPte3kpK/SsV+gJvkOn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11af6119-59f6-4e4c-e0a3-08df3eeae8ec
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:36.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5n9vwEZnSCs+Q4g7hDotJyKVIFW03uZgNaM7ebNuFv5KM6H2nQqFbFdj6SzEhpiquYG+pgNSB2aWU3LxIzI068ZDS8siiAgK6EVm5+9f5ACNBkw0madht8FaxfZQLaF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6869

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Add snd_soc_component_to_regmap() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 3ba4e2c84e4b4..4a72cfb5401a9 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -278,6 +278,7 @@ const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *component);
 struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component *component);
+struct regmap *snd_soc_component_to_regmap(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
 int snd_soc_component_register(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ebeac81355901..d8274273bb013 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -92,6 +92,12 @@ struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component *compo
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_debugfs_root);
 
+struct regmap *snd_soc_component_to_regmap(struct snd_soc_component *component)
+{
+	return component->regmap;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_regmap);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
-- 
2.53.0

