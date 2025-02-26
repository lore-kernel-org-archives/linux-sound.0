Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2D1922F3
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533745; cv=fail; b=OdF8SpGps/FCzA0rEjhEGrnR4Gu6BzqfEWsxYhA4GpKI5bE5E7ehEIZ1UZWYeb0KlOzNILRAigE3LMbymr4oTkbucdc0nTwyFqpNUStt2H5GXCiO8rY4H0A2BjEjj5RF9hNYAEm/TWHyeZNERlPczn0XeJvdWzO4U919QhSffVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533745; c=relaxed/simple;
	bh=UVcyJavoiJrvwkKVP6nzdDiT91UwDqNWizxfr5QjTnM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=sdKYYjbscvpSmiRmd0L3RMdgN4RW+pOORWXdaNZbkSmsbtPYQ1KHe8K9VaA2aNM1mtvvuqkuVOt1o+nYr0e628MbMzl1zvB23edK6/AJdvn9qBkYckgM4F5AYYqE08X0GmRdf+iCkdprAEXYQNMSUgNFW5r9jpdgVdyqLlsEVdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DjQW4Uk0; arc=fail smtp.client-ip=40.107.74.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DjQW4Uk0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKLz1agmaUmkqpPW5cBt0BQemzgsY1PXHtLDVNS7EODd48d4ABhYw7DsjKj6CryTN38svz2UO8yn0KmKzncg10Ifbv/3OPW9s8yJcL+IPzThwJ+rOwmMQCwimf/8oeHL68SFqzuH79oVwBaO4pEmAKbFV1UgPzoRrqPSzQ8LTikEd7jmQ2DMyqzKlG/izrScBDpFKg/4NvT7dgIN2SgCl9k7Ll+r2OPrXQfJmxk+WqRVy8jiO/oFnw/4Ix8YxWRWJjuvLaRLiMDDkDMYKlUEAuLWVWX7IdBVague8AMAKmE5KwRQHABjysKBShwC0vKgDsfQ6zKCy3OdN0s0YLD3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzcZBpR95QPxAkZ/cnDibJrpCyhH50vCV+Xv6uYapk0=;
 b=QuDrzyvPc9JGaQDbaxUokc5W24S1CbcT5fIkRm0T+C9gUOuaJ2CcpO4AWcsv7KIFhoOVnbevCJ1N5c50dCALNHxL2iLtYuMAOLdMhuCH3jA8ZP9rpl2Jk1zBlCWluhm7LbF4FpPIhWyaoyOJ03+RtQ4d/GzyW1OyDBYT2WaltvOOF14E+T9bKT0CmBNnDQIr4oFlJbN//V0jAxBo7n9bcYxijCfi+8XrswVSBU/Qa8J7dWq6AnQbvXSCOCI87JEVZCcJ+IAgifYUMeQ/JTU1yuqBqD0mlmvwK4nv82Yk8OAKcu1Oq9Jb+VW6u5xUZiI5URHOBOfw9pfPTyP9Glbybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzcZBpR95QPxAkZ/cnDibJrpCyhH50vCV+Xv6uYapk0=;
 b=DjQW4Uk0qtHrum1QhcA63c69TcsbzW+/b7cb62C3RokmBM3E5qKgyhpdSTdUhByKmTRByVkAgaFCm/ydM6T3QvvcjV8zi7mhqYX4cFpecSICHjBPKOX9TDUpjkIll6yWeQ3m/aVc5eYgXlYS6AHOpszX9j2eQlILFozoNgE39Y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:41 +0000
Message-ID: <87v7sxbi8j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 089/157] ASoC: codec: wm8962: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:41 +0000
X-ClientProxiedBy: TYAPR01CA0223.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: 53a85c5f-e051-4ef5-1323-08dd5605e15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wh2k1stnxia4fpucS0+K8VaUiZhzpeTjqoxX1Nrr9nZr+iEhZVmU7E0Muzwx?=
 =?us-ascii?Q?peKIy8b2jIDRLNGzE6x7KRES2qRqux5ztm2zX1ucRp2zUj1RyCNbTdm7rZbC?=
 =?us-ascii?Q?u1PxPOr12sy8EkJimrG1nqlyihUEw4HD7uWCJcbD+YGfwwAw61uiplki1iek?=
 =?us-ascii?Q?v1eH6hPfZFa4LUI4YO8jUG3pnPW/rWXjGq1t6Cl1hKZMnquncDq+DqfG0hYr?=
 =?us-ascii?Q?dZzsbsxZhDIP9QUTJwUjV0bCvFzLKoKHIpJnzosq6CkuZr7HUe/L8XWzWp7c?=
 =?us-ascii?Q?hlnK43J0LioVJhJBE2U97iDMUXSA/UMp3ueVTofrjc9bMtjvPtIx/x1J6dyY?=
 =?us-ascii?Q?LS7xOip6AatWDuslX/lFEuYZuUC6nYpSaz/RDs9U/Gfhs5m8SCV35FY9dwnT?=
 =?us-ascii?Q?eXWFlL8Knt3MGrmtZqGog95KBGMD6MorSieYZNYNlwZ6WHpFWf/EM2tD11Ha?=
 =?us-ascii?Q?6TmyYKl8h66LOEZHBfWVocJubAoiLbDCpvsGBIydkE2jPH/6hTUJ79QuzYzQ?=
 =?us-ascii?Q?6mUjXt1CoKCW0fierXMMdrxrhcTpLjGimHHjUeY/Ey3zYNqiUErYGM7rxznc?=
 =?us-ascii?Q?+cBw1OUPbNr4feOdmteAe4YjFjvtFr3nyyd4cqlHtA2+BTAuxHHloqU4wcWl?=
 =?us-ascii?Q?X8mcbczWDkADOXajdYxTWAKZ7oyu0zV7UehaYTzsqO6D8i7/4OLQChbOde5Z?=
 =?us-ascii?Q?T1L8fJzO6o4eWFghMy8VOjoMvr8r6KYy2rqJzvw/W3opH2rAkg6eazuhPVj9?=
 =?us-ascii?Q?T2gAeQip6sbpZYJvxFDpOMqmkmhaORV8Ced5WUyRZ3aGvLfmaWG+P2T8TNPR?=
 =?us-ascii?Q?uNa4xqkq36Fov4LU9+xzF6WD8k2kMcZtREWnGHckak/C6NT+oeer79NAEDTU?=
 =?us-ascii?Q?DBG+b+jNigyLl7aSZeMQHFKE56ePuS/zIx0mrOw1IbOYHIfn0plt+fS8RoF9?=
 =?us-ascii?Q?Rc1x+OobvxYpvREDKFbo6X6rUb6zz91KQFVMq/pow+aMCh3a0dpGjyzQs3/K?=
 =?us-ascii?Q?5tV6AHLQpKW1tosmXQME4c6rAkVu6sna3cWNfjEHXUacs33tjhm9hib7v2wu?=
 =?us-ascii?Q?wap5NQbvdWWlbD64Mpv83jHeQW7PbwAgf6DpBh2IUKEN4kNrV0RAyVDWnINI?=
 =?us-ascii?Q?WjV490WyNkelueuwCLE1nXn0MsNd27M7xWn/XE02wOsJ1ZE98br33Yb1pVo+?=
 =?us-ascii?Q?DTnc9lYe0936nufsHBgl/gp3R8LW/0ivRNEH77L5dVUAsPZM2TmEicSmAPqf?=
 =?us-ascii?Q?JdEiZqDDJTDpu04QhPTO/eCuyBWRmbQyb9OEmKVGixsCl0hdc0Kq8plD9cKX?=
 =?us-ascii?Q?/4X2qMsdH0YdZEnWV6AJgQBblsb4CZw7C1IMNK7WINnS1Wzp+I190GEluJXP?=
 =?us-ascii?Q?ianJA9vRth+42nrm2Q5s23jKV8iJiQ+lncLPOwseltdzHeCGwJnNz4jb8Qx2?=
 =?us-ascii?Q?mfNRQoicTlR1XvAlCXnEMIyUDky2bfgB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ygxl81ffu+l8ru1OsD6o1YOf1v68s/2WqHfXeeku8iJsTAF52/2UlDFt0/BS?=
 =?us-ascii?Q?btVFJBKxnzsjY4PTKPrlWy+iKlPk6jVjMv3coXQks1PZCCWKYvMji4hpl7r4?=
 =?us-ascii?Q?8EdO5l+N8ftsi4qkxmAqrMlCYc/gfoh2psKt1kdyraWa0j9eNYFSZ5tA2jZP?=
 =?us-ascii?Q?xv1R33QIzOGdQRZ6KirIwL1lhEOVMDhuM+8u5GyEMM0CwehQYrgY1CAerUhA?=
 =?us-ascii?Q?hZRe+3SKbR1W5wkvORZq2o2wcFkDzPYr4lleOKkQdSOO90u5Ju9CAvdJRcY9?=
 =?us-ascii?Q?6LV5agtBp+Mqmrh0FgA/iNToW+peK81Xsg4ESZQ61gzOrH0T0i+Cq7q9gywR?=
 =?us-ascii?Q?uE80E+SpPPmZY9wosQgDM1tgigNweWNXV0BzSQ18sUEQESbwb3hos3I+Ubm7?=
 =?us-ascii?Q?HDyGZKSJ0oq8VzMuiVZD0sHOmMTM8tTWvE9YWvrdXxJ/CrLTeuNz7iSq3t4P?=
 =?us-ascii?Q?OujrAz86NAUxmqgS/QYojAQFOoOmbr5qCgT/No1R3hv/1YRazBjwBU/1WwGH?=
 =?us-ascii?Q?jWJIbKq3/UjQqzzXCQK1s0Jd/68yxREjfj4/DtEB9+dZB0OOrtrpQIgnDpCK?=
 =?us-ascii?Q?VW5517ncE+zHYAD17D66uexK3GhVY7VlhqM9YneaQDU05j8Ztzf+T4f4G1ET?=
 =?us-ascii?Q?kv4T+JP+/D85zA4CvEHULeDsV52DduozD4urpXj2yyzVbcitpca45FLGwBG+?=
 =?us-ascii?Q?Hz0wbiMpztiAvs47WxMxA0nm/p2wiu5OKCZQJ23vLauyjXcM1yRygtorv7zT?=
 =?us-ascii?Q?7rhOSQ5XIov7HN4nojqbv9TTqOapPTxj7lqFSgSaTrF5g3TDor09vwnGdz/M?=
 =?us-ascii?Q?VrPktGfpnk4NrE4ZrLs69YE4JIcZgJpdeqHiLhs1T/X9ZXEhwm3uFFFmtO4j?=
 =?us-ascii?Q?kTGxwxbUo/ohpfwLEhrcFr+sGhxq2rZVIle9B1iF6hRnxqyQdr9gk+RxgI9l?=
 =?us-ascii?Q?nlctXGhxzx9so6xhIVKq0jjmmz7Tjys+bP/OKHd6gFqqJLPdr5SRmVjynquf?=
 =?us-ascii?Q?VRkLeBj52T1nIrxQigaBbPPc4odTWyhBd01JthDwprNeCSIbozRRZPMtu6iR?=
 =?us-ascii?Q?t3T3g2ECJwp8C0Or6tVp+iSCLGBW+Z0YHxBTaNrnjmiXGKUNsEAVgqcvCIKr?=
 =?us-ascii?Q?4mc++3JLABLShN+YWEetyh8gNboLgaJT2pHsi+Hf0Cwdjn+YrxMhRAT/ouPg?=
 =?us-ascii?Q?70uDXl9ix9ndhgwWF3Gt92uBAcdASzJx8tpND7hnPXcubUygl2xZ5VITgu+J?=
 =?us-ascii?Q?e07N5EyU+hrtsLQvbu6eH8+s4om3ERf5Ko2vLfr8relPLLvpd9FCepfGILyR?=
 =?us-ascii?Q?pykBjG8/q9ce6fUTWaYY9egmf0DRAU8dhGFCJzFllukSxbqLSjdspMo4nQX1?=
 =?us-ascii?Q?YQOq+kcj/57BOCAiqDKi98An4QSn3gUAu0ZU4KRMzxIvX4YrkoyhMep9QzVy?=
 =?us-ascii?Q?DGPrGh0FY09d3FfXmS9AyvTfafLgAeFNWGZEqtOTC1YKmaLcJ/JUbpWUQlw6?=
 =?us-ascii?Q?DZlKwqE07C9kdvYvAVTUORyqIPc6tC+VPhfy+J6gjSkhqaJwUxImedvES/oD?=
 =?us-ascii?Q?PXhEfF7vVX6PijX926QVQeLkSo3AUJpxfJ3SZlTUNzypY049KEBgQxpZbXJB?=
 =?us-ascii?Q?hdudVxUKlAY6P6YIHZ1rupc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a85c5f-e051-4ef5-1323-08dd5605e15f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:41.3966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lCr6opbxImJyWaaKBiy2I3fTJsZySdG6KKjaqjrTpYXjvzoRLtUzWeyOrLsq3e7Z+mSF65/k/myUTV+/MwoT9/4Qvi2L3oFTqqKh4TTXj4yF06zc6rhMfglfDl745dv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8962.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 08d164ce3e49..0aaac24eeb5a 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -2762,10 +2762,10 @@ static int wm8962_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		aif0 |= WM8962_MSTR;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

