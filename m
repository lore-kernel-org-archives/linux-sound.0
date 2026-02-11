Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54993563E7;
	Wed, 11 Feb 2026 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802459; cv=fail; b=SNwx45PUNxWb07pDmnEF7YVPjNOZPNaWhY2cBPXR7zjJ6hk0UWAme9NP++tN+06Te+A0g4KeyFj1dzm33htgKCt9QNNOIJldCkPVtbj36KeLAdnObc9bTttpZtycU/Ka9nka+3e1vvsqE4TGQLeKFE6HSp8p2FQW6QxaejkHjW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802459; c=relaxed/simple;
	bh=b/C3OTj2FZFjsQwqJX8iSAghrge17PBXhO+OP3Z1zNQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L3dyblhuCHQ8r7mlpW5Ec+4UvAxnejzgha77kohaEoWwOxZyxLcBZLPsGouqqx1jplWrNdFPMT+jxIkukzCW4gCenJ5U/TFA84TIo4/h5jReF2AxKAxIOvuoCCmyydEADvaASVIacBDDNwLR9jxNUnQatLEYE8aku51keIUb5xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RA9wJ5qB; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RA9wJ5qB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFbZJNXkNZg3t6PnGIcwemYGN9/5rNn0DAr7zQh3dVr+hC58i8NhnEHZhdwRmNILOs6HQodcY7HZ2swh0pwsduX6l9NRugYk37etx6cqnxj/O2SD4f3GflDBraT9XrUNWYKxz5rlghpNk/A99oz+fz2qlpjU5RQX97SyTAVaMehhNhCQ7WFbLxVVA+xQn3dFtTcSsus1sehMROGER2ZotCMSwyK56W7pUTOCTdwO7q8JEdhJPCLC+hX5jz3EVX/RQbkIfp4eZPAEOc8fjS8uKzAvpDAmpC7JMOWEEEBEpV1UqEA3iOMSWSWB1LRnq4Lg5AS1VuHIddCyJM+QfvpFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCrv4kTI8Rcg2odxqYYjGpe2yoq1Didj62k5KtPVXsc=;
 b=nra1s5woO2SABCqf/qd50YFWFbSDFqNmuj+NZvl/3LnWwrtPhIAaf3a/bALwadifvmJ54lCpxPcRoqRaldnI2o4wMfgZ/ReGwMHGRHGdycgq+spMjRchFmlWGoD/jua681iPt8tSS1BslRV3sYtWv+SXjoNHWUe+j2wvyVbcird7HIzHxFAolteD/kgVeTT01alu2PuJo3gZhuLLgryon6BYEUH3/t2zEmkfBPVSJ0jiuy5e+JiHFnXQkeFFOAduXAaPyfBRja3Hy5dwALIjgB4o7zeXB0+g5qpeU3VFYwr2njcVJynYrGeKtG2RWxN7x15FgmNbDjsbSQqtApjlvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCrv4kTI8Rcg2odxqYYjGpe2yoq1Didj62k5KtPVXsc=;
 b=RA9wJ5qBzkKVh1aXE+PK9UIfwiA5u7vUTCb3t+lN4HFx2BXr19JGwPpjR5aUQ5IatRYgJdGEQ56XD52RSsApG2hahVwbcxRh5CVrXprH1iXb/0pNWm15DNyAgOGP8vn2sGUI4OOEoDWV5vGE71kookcXohGZjINkv2V2yJiD/nWo9Fdq84x1M7ML4Doar9Ia4LpswHTO0AZhWIr+C3QUabtBGiuloiDw1wmZCLk5a45bAP/3Vwpou1NpLwJtS2P1t4BZcGjc9ITR8IDovou/XQdVy2XQB5649Xva8wUMEJ4OsihiY7NvU2eVc7a6ogTt184VAVkR2i77OQvQ3Hf+8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:34:15 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 09:34:15 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH 1/3] ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
Date: Wed, 11 Feb 2026 17:35:25 +0800
Message-Id: <20260211093527.2892297-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: 5129bd1f-ab84-4f7e-5577-08de6950b8c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mKmmMaE9vCJUe5SxHTKDlWagzjPBGLKuHJyChepk02VH20KEZ+odhfcV18YZ?=
 =?us-ascii?Q?+MjUmFpPsDXYk3w/jI2yYg23HP1c0hVKc5Kl0jg/vCobpqee3y6JRoLhOBid?=
 =?us-ascii?Q?/Vf9ZPcfO4hQA+yZtC2MvvIyTULXhZXkQmwglawXUfbks6FdWjzbgtj5+Q3f?=
 =?us-ascii?Q?udNIQxrjC4SZGymZFhc095+YGlNyFPjue9oVbDOV5Y51MCGn36w35nqbUYSL?=
 =?us-ascii?Q?EhhCytKtiK6U6xFJMG5zilqCImI/3+vnCYdrhPlzb9x7aAV6mnPk+T7jcxCH?=
 =?us-ascii?Q?GW3ZoSN3d9HNET/tc/MibCo/e+wj7s8C6e8GOSsgeKGdn6iS/6i85T3hvz7T?=
 =?us-ascii?Q?vH5gqpybO0LFN1u37ote74bDo/lCMnrXe/V6EvXFaRG/d6SqJC4Umqrx5Smh?=
 =?us-ascii?Q?i6veFe6/7wuasY7/0OGK2SdmDBfqmIdAykVbCwTc7RL6wkbrwg1GQMQucTtv?=
 =?us-ascii?Q?0s9qTwPhtM8BnnwtxiCaZC3ULxppiOihFcn57ZoPVMMagd2K2nRIQnJqB5JW?=
 =?us-ascii?Q?L+D37OSwzTfxgnJTnj3kXzA2VzHHWOUqnX+N7XWY17B68PivdD+NpHOJbkIM?=
 =?us-ascii?Q?IOqhTJyn86CafHjnVc7Ed8yxHLvM4wLUKyRXpSyIsNTymhYjWcAShzuPg7TD?=
 =?us-ascii?Q?PE09fdKll6C8xs/xPVw28Tffkk0cE2VDen1Bf/JWYsOP1R80gFYYZMr0rPQD?=
 =?us-ascii?Q?nAhd+VoNqUz3PjSwHLIJ3tVW0oZr3di2hliBqcsVmGaBvY2qSLYnDq5e2+lQ?=
 =?us-ascii?Q?YIDddzCHd2vHS0HvOKyWjbclEADnwvSs2m7Ta8hqhE/5HSlzWJRkdDmZe3yi?=
 =?us-ascii?Q?tv/Bk9NzsYmUEoCl2/HWe9mI6qUIwTEN9oSZQlniVc6qHU4HJG9aOf8k3x2a?=
 =?us-ascii?Q?JIcrHhZIxG3Fkq9ahYK8Oqfnd96b18xqDdx0PqTfQx7+PlsCWcP4zDEBngK1?=
 =?us-ascii?Q?HBB1qVr4LnrbDXcE0kzGCTJeV/I7gIxp6LD+66d+sZsFsqlygGGBGjLInxwS?=
 =?us-ascii?Q?OxD/Vp++B+xHnKykrOK7cPtLCfj5LdSdACzoScxotRua+u0JxQIEGlOq+gtU?=
 =?us-ascii?Q?tyEiCJwECGeVuaDush6IQCx7kmbMnK4qq0Do2opUc88KG+w3VMow8lsxZ3Fm?=
 =?us-ascii?Q?qN7/lfd+T1v1Zyiu0q81IpjJiwMqnUf+Az9y4NVMDe3edo+NMJy/1L5huJyY?=
 =?us-ascii?Q?PziYCH9qiqUyI5K2TC/FFZCWenchk1skz7uPwuei5LsC2B46J3GnCGhXs5Vi?=
 =?us-ascii?Q?8jDTRdM4FzucfeYdypkSyBhw/ptpjFdNQMHk1jKLXtFZ/Mi1/L+oK9six94q?=
 =?us-ascii?Q?L8etEVoIPH8eevgJvuUERfRHFVc2rc/du18ZirypeT7YUdq7Hpzo2QIhqhQX?=
 =?us-ascii?Q?FUSfwFeYCnHp/b6tlYgHaCeeayTG+MaUEQpiGLDNu8RTWQjBxn2Hr2fi+7f2?=
 =?us-ascii?Q?U5/wbg5wvLR6k/LM2uMB06iek0v/IR9JhbHV8Fx8WX/gHRYx2AIGoL2sZsS0?=
 =?us-ascii?Q?OgRtY0gYkNedaXSaXU1K3CbPpx66GWwWMVsbN31y4FnVOnog+SGc0rTPfd7n?=
 =?us-ascii?Q?Ic+6Oj4Tt1YpY2J8e/tvQl/li5/shRa17hzxKFKB9jb6Rfj8Oqio0gjMCghJ?=
 =?us-ascii?Q?pIdvhjX7cm94DeVwfnPOKJU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dv4tDMbCaJi3jbF1Hnh6lwqOI6ElNujDZkUUfVXAiRnF7QokLeO/1ZMWw/qJ?=
 =?us-ascii?Q?1x7XwQy7QeDQF7YMnHcDZVqHHQ+7oKGhc7Su60MIycakvtCANZPt9/jGZ+tZ?=
 =?us-ascii?Q?wK7aoOWg5Bt+IbuKnkm7hS12XAs0M9lR/i16wcjAM8vRZExp/f8DZ1tzxVTP?=
 =?us-ascii?Q?Gvp/9IJ8WQrMLB/tCyRcCLZM4Xxj6atlED06ml7y4lEEyLBumY2YkaHL+zXl?=
 =?us-ascii?Q?gHsPVMTMQB+2R18HIv9vfZbDZsyp/+TnXQu4SGLpk019oWA3QpoOjtKZNGUT?=
 =?us-ascii?Q?NmxW/T01URaSCC40O+LjYBja0O3jF3+j2x1GKVLvhKSqAvvoFMZNooAyVarV?=
 =?us-ascii?Q?0HTCiSxv2Yt9mNtEItI1LOOHzP9sDsf2LjPOSQ1gQT4Y4BNvFK691kN+ID+o?=
 =?us-ascii?Q?UuPV+YSAoHhRUeIgfEsWT40ft4/lTt+DPJb/JgIQ4n9xaqjHSUezQisgJztr?=
 =?us-ascii?Q?kg1vCZSBJ1GmGnfaHH9IavFvQzj3ckSI2UtgCPx0TWkYtRFhJ/KU9OAp2Ds+?=
 =?us-ascii?Q?iznqeVnIlXMK9AZ/2je7kNksNg5s6FwqMWnNXcgtb9yAtB3LGr4FaS+j+lYG?=
 =?us-ascii?Q?dg+BHCEe3zXMMzVB8FBmMM3cYU4Ckj/PFRZwk3v8qzCNyTe6ZoJimk4C8xUe?=
 =?us-ascii?Q?oo162jk/jVE/kQyj1htslXMmZJkKHV3tK0rmM52Nn0lvKpGjviLxfVdV0kai?=
 =?us-ascii?Q?iCglrO2zQsftrps4p48cRADzfPmo4Giam1w1S7FwZaQ7EDfXI8M/SgaKwXSR?=
 =?us-ascii?Q?vAYA8WlekpfrS76+8UHrFRLozG4D+nD2/WcQ0ZJU1DgSUSZknoL7AZFuWiQ3?=
 =?us-ascii?Q?DsLmjf9ZqzJs83mRm7N1weyM7SQkd2P//jTzPT99dNbAa/Q3mQsGO386U+Bi?=
 =?us-ascii?Q?AMO4/j209fL9/VwbQ5hAxGtWjzYa8PJdffMMAWh1poCxagA2HNg2ECgo2OAD?=
 =?us-ascii?Q?Qcm2qoxFKiBn4GDssTDiwyiI++Va1IDl8TZWDtWldT2E4rEaZ0nJCztdDNVJ?=
 =?us-ascii?Q?W8BfBMXOH/FQQVZciwoV7z9fzjixAemrrRWP0anBU5ZlHygHYYvoKvoexURh?=
 =?us-ascii?Q?lYVkiKL9sxSOmxMTOErjVS6soUjBz/kGgE5EMhDGsnO+ZhZBmpOW8MnzZs2M?=
 =?us-ascii?Q?4QvHK86DeokkVRHH8huYJm/bMtwyg7GNNbQoxpjeixG++WbSikgySoX87Qkb?=
 =?us-ascii?Q?q2mHEejYiR+vj5Jxev9/iNujz/02CkEqyjLtXtzZYzhSASCzhrGZewgvGUPn?=
 =?us-ascii?Q?VF4Of2n5pP6jGdq5NamlpGgCzorf+aJ2WU1KYQBLx9Ry3QD7x2+gQ5Uon53u?=
 =?us-ascii?Q?L5MX9W4ucKxuQEYLPVqCtwSo0y3TLkF20NeHhLgq7UJ481qiqyAz5DKMCKe8?=
 =?us-ascii?Q?qiedMRRNKXbA380JkQZ4z2ioNYOEX25Rs7AWCuzNgUdGqPL1cL8ncPQMdazS?=
 =?us-ascii?Q?1X3Bycz76pWPgWC8JKIZ8JJb0q7x55qTEqBLHfdxjCnQa9xgf6L3/jj4sB6S?=
 =?us-ascii?Q?QpR82WvoeOVzkiUpza0Pn68FPXUcasJ7FmmqGG7SAvQjglKvJs0lknT/RenF?=
 =?us-ascii?Q?wPT1/9pa1dKAbsNv6KLxvGtXLfcVZbJkBiFN1KkjeOwqSjJdanBU1UPghQGb?=
 =?us-ascii?Q?9kLUZCbALhQNPdD8RUfJSUMdDscnK+8dfA8qkhIUw6QflZwK/mSgv/rnyleb?=
 =?us-ascii?Q?n6JeKGdAHpru13yQIINrI9Mg7lM9RVB+h3E0ZZ+RcSvX05OLH2sZ7aPCYt/e?=
 =?us-ascii?Q?D56ujNUO0A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5129bd1f-ab84-4f7e-5577-08de6950b8c1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:34:15.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEhE4JKxoyhQKBjtw1uNUA8CGNO2neFu1etCulGYg7O4q2vXDb3NJLNgwgLb0iMLASwn0i5HV+RcDOYXthpTpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219

When including the dai-common.yaml, should use unevaluatedProperties:false
according to writing-bindings.rst.

Fixes: 8d7de4a014f5 ("ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI properties")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
index 1fdbeecc5eff..259e97b7a3c0 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -60,7 +60,7 @@ allOf:
       properties:
         dsd-path: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

