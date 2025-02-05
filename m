Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34425A638
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 00:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738714580; cv=fail; b=AYtHFhTpD+FqDP4J0K4ykFx1NCdnN1IrCoN1EmduhedeZAmMcml59AbVz+aKp/A/Uxk2Tasr5VPLnV+IoinTy/UJJg6KWb6xHG11A8KK5pAzcb3vIEXJFU2ba9T9OzC10CwUQmXMrCOZ3kBXyVFJny2/grXs5wYRFsGX5dReopE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738714580; c=relaxed/simple;
	bh=558OpfzSgKsULFD5gGbwWHnJmRD0gMcavjVVTuPSRIw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jRD4D8k+wXK0Nt6o53DUyTthhKGQCMqLpVBKqmU/okpsL4TSafgfrCMMSQkbOZNfAW5k4tYyLDZ35D7GIrnadIQC2HcG6N9qb/9SsCFYiOWesL8SdlNuC7FnVgWfN3jyHuWkSlrWH88/bR/b5Zk/Wms4/qo6ZqyBJQbAZQcsUys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=o2YQS+MW; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="o2YQS+MW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RfX8CnaKvSWqP7aHzlC7QvarrtITuXjo3wmcSh8k77nqY6V97BGNfZShqehB4QVbfOblPzRMIR8J9GVgFrQt9xGUNa+PUiKwUJt7LEfrvlMNbQjdAMPOltrKS+Rqksm+SNU275LynvcbixBwj4R4lE3oMJT3G5kRLLRKjG2dcywlbECPMcoS0hUj3WANkaU5Shw8STPR3XuGAqDVMzEW/FqOSNbqEOD+B7JJy77JNFTU2BVnpd8GwTo/u3GCd2s2EdLFKjhiMLekZyoa2wvPV4qY10Kq0KrsHIyIBwcWkP0qnRiIOOL7zBBUSsZsv8LeQecukF2Ces97vp0KdS7y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4GZI4mqkCh0WrhDDJOrpVAgujAp3cgoIL9KV7ItJ4w=;
 b=TzlnkcQ9NuKvvT/U+c0eGD1ZrGZpQdm5umD/8iM+KqkwQHJWHqUFqoD80gArvY1lAIEofr+ZbRf4FW/kCq7M8pVzwcnxpFBwsgme7hIy6PNrZ+8SsEiS8DV4hpGcK2vYRGPSOdtlbaxuu1vpsNP+KkRu0tUZN1QEKXj3H8JDTDRzMvslEMt5F/lZPEjD/Jk1aIvBbGAnTS63ymixmXMtmqZg2QHEIkiLQAVw8ZZI3Dz28xnumvFMM/RfMwcAuEvSzzcPkaTEMgYX+R8oB0qUBorHMWXaWiYPD46v17M7qdgJ9uaJ86//UfiKGjBy9imlcbI20PAAHsgQ7N9+WVwwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4GZI4mqkCh0WrhDDJOrpVAgujAp3cgoIL9KV7ItJ4w=;
 b=o2YQS+MWOCUJ3g4/Ci/vAY/IjRN2yhesFMB7HeAzKsYHpDo41KzV7nEmMw4syQf2qI+R0sD/SKFartS33H0+sSPsNoO4X7zLQq5scxRsOPvbhpqXwg2mAtZaO9L6dIeO0/0qwQTPvDvi6Uf8pLZrfU0+lcMf6vzevghoLCSDaLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10242.jpnprd01.prod.outlook.com
 (2603:1096:400:1d4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:16:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.009; Wed, 5 Feb 2025
 00:16:15 +0000
Message-ID: <87ed0d2qlt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/7] ASoC: soc-utils: care -EOPNOTSUPP on snd_soc_ret()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6592qq3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Feb 2025 00:16:14 +0000
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10242:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4c870b-1050-48ec-a199-08dd457a4dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hq2BjlYt0Tf6Ji+7ds4fyd9QneMhI0EkxZ9n0E7KuWzjRlMn9OJ4LUHMiVZS?=
 =?us-ascii?Q?Jm324gbWH6IAoETPVoKYU2007bwuGvUGR5N51+MfaO/QrF96q46IUVm8UoS5?=
 =?us-ascii?Q?4MwyrtnPP4Ldzxk649TcZBP7aYRF+5ImGAhQBu3G1cTYwerUIyKGEh+LrqQf?=
 =?us-ascii?Q?1MdaYh9dwMR+GiDzr0mWVpppL1L6Pkg3uzVNasCyqVTJUF7QuSkeJLWj9oD8?=
 =?us-ascii?Q?Mjzq8xP6HVE9X5PanRdaKxiF69OQacFIt6BJ6xZ9o+AkAV3eI7nwuhilXf7n?=
 =?us-ascii?Q?tveH0yx8o+/cZOnAJwilacWDP93av8Y0z4WmAslM4R5FgVl7wOlpNK3bXRXH?=
 =?us-ascii?Q?eSZPQuyqXsf+ZEcznQQkSmgd/naXkvlQlQ5V2mSzk85q2TlHtyNnEHnfB019?=
 =?us-ascii?Q?5ythQsmh5gR91DDBjrubFma8w1CEkWlGC3q3+xcc8il+63trZq3SLOvRuAob?=
 =?us-ascii?Q?YKBujeW+sqxa8gPPzcJZoKFagGeuo0o4DuoERYZtvY8dyqH2AdoPKsSGmkOa?=
 =?us-ascii?Q?cRkiNcL2VyN2ZfIUo4EOAGzYDFkeTqu1dmAo+0i+lsPM+go0RB9UoRUMdMUX?=
 =?us-ascii?Q?ONR4eJuRtP+TykdEs3kz0NepUSx73HZTkqN/n8GnBcbhGH/qUyS5ncaYNLIt?=
 =?us-ascii?Q?W8suipXNL0kqZ953DYkZLdO/tuH37NrjRLf/LisCBVdzLh0RE5JQxQxfh7QL?=
 =?us-ascii?Q?7WR47hsQMskQwYfDHARpvn2t6SxqT7tofyisc751zF9lh3TULijf045bTATK?=
 =?us-ascii?Q?x44WZ2Loy3R/yfgOCjWSJ9ZFgTpQJh3fkEluX2ZLEbvURltQ3EBsH/NpC7vW?=
 =?us-ascii?Q?gUQ8fEyU0P0Qe/cItSRiQBt06vGIlQFeyQpBMFpvPZf5dWbqIu480DcDudzk?=
 =?us-ascii?Q?18Ist5x8fKpXLm5l+EXxh5MQSpwVDMKXhkf9T1Txgw5XLbkR6iM18SLXoPPv?=
 =?us-ascii?Q?yit3Z5vuc+e/7sw/xwvQDGj10/Ua2vjN/pe8OmomfaJ8TxeQdSXKJWhu5Bsc?=
 =?us-ascii?Q?cFWr4guD3Aq65zc8mHChcRKqE/CJnIMX48HaUye6r84X3EBGNi/I/VOTljYz?=
 =?us-ascii?Q?wpoZ3WASBWD6QPozxS/ytYNIBGOYKACkVxOW21CzoMJeilTdTX9kphKnWHU7?=
 =?us-ascii?Q?GqGae8m/puFMC+XN1dL6lMVyeuFKX83eiDfaYuksNovs+ZViNMZ4VkRilChv?=
 =?us-ascii?Q?X3ToxuKrmoOt+oEP6unDUB3rg5V+M+JooZMnWgqEvkqitRN+qSwzTgx5ADlZ?=
 =?us-ascii?Q?+ugKkq7ZMRyBI9E84BHJihrOpICdbY13j0yHHRdXXs5icqvaMOK95fJoOmQ6?=
 =?us-ascii?Q?OkYhOiLGIuujLAlEMVTbRGPCzKrB4SzKYFyZ8YaiYwTZgOdi6RqJqKwuNB0P?=
 =?us-ascii?Q?W1dmBqqY/jjo05pXFANb1Jaxhu8mDf4pBnz7D88LVYejlRdOCvoDil5EbDj3?=
 =?us-ascii?Q?6zxqqaFo5E8bEB8r8t/5MMT1t8NBEDsf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FyrcCWkaNe2bLSB5FqRGfTNe2WfLJbknJzuIOkhtA/1/RB9Hn6t1EX1tC6md?=
 =?us-ascii?Q?VSv1bxR9lJHHbDzWgFKqlmELErL4UL4cuqdWKLCAxaPVVczFSpOgDD0WGNRB?=
 =?us-ascii?Q?EGtsYFXQPIOEVwjNs3hdJsQ7EYrjBSiVsVaZg1P6U5XoP0ddQ1VZIEiAS/ae?=
 =?us-ascii?Q?o+x9iVHKzH03yoy0U4VmwFf4RYh1I55OYePkHB/ISKMvyO2bXz9D6F3J7Tvb?=
 =?us-ascii?Q?AXy5TBGTuEd4qGYUtHxipZ2qe/E9v2ylKzhNlupX4fTP/valEsoEfplk4omV?=
 =?us-ascii?Q?u4Vvg35MKJiwRUzJyjSyUJAoSvreMc2+Y0rSnk5esB1X407h8Cf+p+q8uLbk?=
 =?us-ascii?Q?C1ewCQ8GNypgsYmICxV5E4bJYeGGmLVCDgJloEkKCafomaF2Wfno7Wd9Tzy5?=
 =?us-ascii?Q?Zq5W6NSrDCWkECOSWpe7UfrQ0LWkWwLt+XSWt+LPAXr9mYAiS9arfa0qbEta?=
 =?us-ascii?Q?a9zP8MGhnJoGfDtWEZKyftSVWZUlIvHD4LKZ6kzpkpWvGnUImMlUHorFZnBd?=
 =?us-ascii?Q?iWb3J1orgM3554fFt414Gh3iClNCDFuJAKDZDU1mrouaoLSi0FEKXEM7Bqpm?=
 =?us-ascii?Q?FCJ3fSl2IGiNRjfO0cbeir38Bg5zE6mmlLCEVt7IblAa5a3u7TAbR87q8VUy?=
 =?us-ascii?Q?JxM0bS0UJjTyo1sG6ySV1x8zttw9w278ob1TJZbm6nTFHGLJZp1dRlG2nicP?=
 =?us-ascii?Q?quKonYAkWCcoZAqrjeetcjUZHk5tkMkmAT79F1JoAS5I+LBy435PRTtgP6zU?=
 =?us-ascii?Q?BH7jceHMYMCcMn5fIIW2srBHgrrwV3D84/XAOrlVPMz97QYXr7H+efUxc1Ke?=
 =?us-ascii?Q?9CTvPgQFpd0E3OtubYOFH8oBGfeJwcr9Ky2ZuS1jeIyIbHZEyHuJrLgFBhzZ?=
 =?us-ascii?Q?+XW/jYcLMtpoEMENzDMhib5qbHAUwe1YLI0UHvHX7oyaCK0j4pTVnqz+4Nyv?=
 =?us-ascii?Q?+JdPudGxUhEEfTK0PJ7LARgcf3Lfj67CGE3xQFWCgx1bgWuAiP3PX8bnOg+q?=
 =?us-ascii?Q?3GNkPLrXj7kKti1ws/4CtW9PwO2Gk7ZZCy5w16QgE8uh/djgNlqQMqC4lVCL?=
 =?us-ascii?Q?nKd8K1IG2N7aWalxY8pimY+tO4lFt/YsfYkeM7LvcvjZlWogbVVIAA5meYtO?=
 =?us-ascii?Q?3mDYSF39mkU7nxMprqFaeniCcrHYxxf6PKYX5/Lnb2QCpinm+1LO2M9HVLIi?=
 =?us-ascii?Q?jb34tzKCGGTkcdwUU3VJ+3aojOECG+CYRRTXooz4aDSoP1KoCbXi2q38Vl2F?=
 =?us-ascii?Q?gNlPRkMRdecC6RoszUUA3CCWNUueV/3TURTV9DfxLIm9yiSpslz+UNsMNL15?=
 =?us-ascii?Q?rvspjsdM9U9axVuqjs9BdA2N3UDAOw4acumjK4ZwPqfP4cdp10uyPuuMvFL4?=
 =?us-ascii?Q?O0nf++wpgUqXkLhI9faTBnW6HSeE+HYLHOK1N6+uM+GKwrWjaSWaJUKZbvuT?=
 =?us-ascii?Q?CRO9nQabWB4m9F8q6wRE56w8guxxLDupzbHmaiEFVV6zoB3lGeG8P0yBWFYa?=
 =?us-ascii?Q?6Ufvs1MDvImekm0hH6oZvWPgfcYwRrsAfdg0DHMksoNqBXo/7Vtm/CqAOdfn?=
 =?us-ascii?Q?6wx/rEBMYXuSvlNddCa6RxSAtv/G4uqujkbCtnsO9nBP1yuP4NjuJ8h63XMq?=
 =?us-ascii?Q?6VTOJ/895oh5j0FpkUGDsDw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4c870b-1050-48ec-a199-08dd457a4dc1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:16:15.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO1W92mYYqG5sorkzO+miMokwGb/AMqFpJHUe8FQwVDD5JuhFAYa+sfcYsmpzo9wx6SvUSORDUC2Z7kZ5zxzIekQej5DId3kI+1RtI/xoXdQpGxUAdMhK/tOo0joSV5p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10242

We get below warning by checkpatch on soc-utils.
Adds EOPNOTSUPP, but not remove existing ENOTSUPP.

	WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index e8958158acc11..318b141c00b38 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -28,6 +28,7 @@ int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...)
 	switch (ret) {
 	case -EPROBE_DEFER:
 	case -ENOTSUPP:
+	case -EOPNOTSUPP:
 		break;
 	default:
 		va_start(args, fmt);
-- 
2.43.0

