Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011014.outbound.protection.outlook.com [40.107.74.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A77018DF60
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533591; cv=fail; b=AbMwF71rVZSIJ4BPl/YaWWg8o2WF24F1DPiatIXQy8QPK94zmEa33N8SbQmi5+l+auAC0YbEhEE32g7lgXGbUE+X3vd7KKNuj5TRRAvQXqjiCSB462+CDZ7qNrNKNHuA2YaUo6HRGdCc0tR0dFgy9ElfiTV3Lg8DYP/dmksJtCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533591; c=relaxed/simple;
	bh=sek47LWEOlslwfhepalAKPZsmw+vq3xuijjhWWdN5HY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LXYH+CWRewbHHCLteSkeXtxoOAg5qPADQ7R8oBRoBr9RmHuvMjTMuUFcuV1k9vHBFH0gf98exfh/HEm/XGAc56tdODWm0GNwN/OPYfF4G5wfNG3GW0+hv7bB6Quy57CWLLCCfvQMWj1m8RWC8gwHUuXmnCFsixxpPy6gLbuAtwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QcJbBpOo; arc=fail smtp.client-ip=40.107.74.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QcJbBpOo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQBUSDM0GcFBgJTGZvv9TGAkQWRiRbomh1YA4wF3V4zBVOhzbXkkXUZam9PRERvYymtoh37Td8cjVgStm6L8gnwf+e2eobk8SmJmRVnXD+9ttO/n/5UYcGw6vRGO3Iv/Afr1hzvrn0CalJtd/bUOCOqb3Mpb1pKwx+QipW1Ic15u15QvOUHVcLy+/kQX0FGajNHguqs5+armAeypORR9iJg/1HQWrciYZ/xIfhPol5+070f1PwZXqOogpqw7fU8+Vyg30Kxo1TyTJ0GZslZc7hNz4zP4mdeeI46PH8exdVcukp2OhMIfU4k+SDD/AKsWCClmRP6Y8JPAXfTvxqoj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJipWsalaEu4PnDLhVBEcXnCtqZxzVQWpdc4X0PCI5c=;
 b=smfStwt/tB7XCZ7E+KRw8hh1KI3kZyJKRa0DR6PI6MWaRfwCFn74LMdNkH2Qrt4oO6MlVO5j5I0aGocPw64mr3x5cHCdDEjv3C9Mrqcf9a2T5LF2uLprgduELoftPtc2Oq9XW87f2py6aZopUr3ySSkP9+0bygH0gmRUK4l5LolcX1FlKFAIXNxwhQJ/SAI5TUFUSdRIDOwmcBWz889H9ntMA66VOnXJjc61oj+V9PbHUFtSIPRwsLHTpLwOug0mllKpKMPOhkPhd9vTnDmfzQ/MGoXzxlKo0YqtS8fPisY4zb3+pvSq8nYQZHqy4mCbbweey6HdzXctSdpGezybnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJipWsalaEu4PnDLhVBEcXnCtqZxzVQWpdc4X0PCI5c=;
 b=QcJbBpOoR88OEbmpvl/dv0tXl9PIKCJkluoW0HUhKDZzkQE4HnkuPCWLVl88zy3dxJ2NyjGZAs2dwP7PhiMyaLhxtCcJWdYs6RIHujonRfQQ5uJ/RAzrB6FmI1oMHBUfh8aEg9kuGtFrwG3vXdCUpeUlGRfe708JLkioPuTfUoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:33:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:33:07 +0000
Message-ID: <87jz9debho.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 047/157] ASoC: codec: rt1015: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:33:07 +0000
X-ClientProxiedBy: TYCPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d4225d-2e59-42d5-641f-08dd560585bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ceQ6pvr86efg4jvj4osABUn66lj6PW6nsGki6mwWGfr1Xb5Kt1RK5ep2TNFM?=
 =?us-ascii?Q?PEnvk6eXpOhVzyX218cobSMcLFcCNVTtDz6V/vjPLJrWV3n0viiGXXfhTR/I?=
 =?us-ascii?Q?d+lbsHpMl5e1cXzX0/ZkjmzyNtpZdcMP5DxNdIjhxToizdHmOuDL8qf6IpEo?=
 =?us-ascii?Q?snWvgOUo1S76b9VSyA9jyWEmBqlaEwfMa9m9+N7z6+pp8fqMq/Wuurqfl8gp?=
 =?us-ascii?Q?pSkp5WfNoE0rPDCusgQ4E4e+Gny/4wNumwSF9q8QjZvXxHLUmpzJ9W6aKc6w?=
 =?us-ascii?Q?odD+wZfwD8N29y5iZ7ow3MAVuc9so7Vw65bFKv76jQRauyOQjGMIaE1X5Cdy?=
 =?us-ascii?Q?ZPKpGcz4gtxS9Bi2P/icLTMxpLgqh4o+U/Qykppzrb/aYhmypl0QBtJizvoM?=
 =?us-ascii?Q?4gfNPuEPVPHvTJAR5Gv5CuARnSR9/xvfrQrKM+YYmukweRp29K9HkGl864Mf?=
 =?us-ascii?Q?D7RGV/Qy+c8TJDlM+FIlJFfGIgqq+V3tX3eEmeLTJOMkAVU8QGR+qPdMGVup?=
 =?us-ascii?Q?3iIWr+fZ6N+Fa1P01FDmne3N/A8xWcewTczzLmqs8UC31n+OAtba6qsKs8z5?=
 =?us-ascii?Q?+BgJnK/REOU8XhOx6jKh/EP8JzWs/eByE54HB7RJbEz94dgIfmSiGIvj8UJt?=
 =?us-ascii?Q?ypA7iK1jX61k/H2awT0MMDVlQady4LolAQ9CG8NbZz3Qmv/WtOcnmXiiPOPL?=
 =?us-ascii?Q?HxfokI8BTotqHcEvJUlOszllRFLsDkQeSvTdOyfTnQUwJLn0/0vPQsbWYXbB?=
 =?us-ascii?Q?YscC3h2KjJLfOLy6yvzmteHw2jpcspVESkg0N3G74vFy5TGyV/ORs50DXB5L?=
 =?us-ascii?Q?ef3CQDTHrH3Dyaum4ZZQo3Qx9pyTYBrS+SNecG6Y8JO7X4yh0TW61ivxWQGg?=
 =?us-ascii?Q?APnJB5elQWwIa7MPis66JLD0UOW0uau4kzOeWPmu2MDtwsraz8SRnB6FpjXP?=
 =?us-ascii?Q?ez3dHxgIfkjSkO0ZtpErgYVaZrx3tU+hp9viUsqDRLPTNswByFL++Q1fB20H?=
 =?us-ascii?Q?2HW1HWjQzeN6Ol57ahArD3cEGITIpP2Ewj45FEc/pcLQEsH5wtJ5UKD2KYYz?=
 =?us-ascii?Q?TC91zLTAuzXtN/Y8t8QOpSZWzqao9kr12jTuUrAMNP6BE10FidsE2b8nC+G+?=
 =?us-ascii?Q?sb6PUZtgDL6hXFd25uaoCZb6XmWrvoAbU7rB5C8ZnQ/BDxtvKsd3EyjJoGQX?=
 =?us-ascii?Q?Do1rQW+8358G8Y3L12ddiEl4W3A8M12VmJDZtkPby4GklGeoeJuokJ7vu1j7?=
 =?us-ascii?Q?gL12KebQM6p780cMXuiggov0Fwm2eu5a+P9ZSfbfFza5t4eDa2fmVMV5P7qV?=
 =?us-ascii?Q?WHwN/1kkqKoLVTfIn5Z2R/vfwDW8WYSrwOcw91ywEYxCUXsSAnJK5mgTJCY/?=
 =?us-ascii?Q?WADHtCqjbCnNT/BWPuPaLGDClell102pBhA1qFCw+8wmMHl3MArid+ee8MTA?=
 =?us-ascii?Q?YMfmx+HEUjb9t4odt4ZezyyFpD7BiYNQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uuo7nGbJ286l5j3dOCJFfArCLAECuJL4doBxcY/UyQ7A11rrGvjDzYHoTEbk?=
 =?us-ascii?Q?nVx1lxxGied/KHpnvSaxzkFDrUYirjlrilLBvZ8X/bYu2m0/yEyn95csC6V7?=
 =?us-ascii?Q?YeusLETRfCAYxv/otvSU2xqR9D5Gr2yA9tRR67kXNaGmZGUpsugzRQteaSSX?=
 =?us-ascii?Q?3FwBA/QDN710cQfiGmX/S6D2+5W4z4qOJlENvzDG+fh1uNdcgvdeVE2tdAJ4?=
 =?us-ascii?Q?VWcSwe2UryzAaQ5yqu8gkcc722kCQrCuWfXSDVIjGTLSpqJloEvagVcR4pBd?=
 =?us-ascii?Q?vxjGy5s79g8kX7/TFA1Kx93nx9v0YxhwzmLMFyIpKx49n1Y+ZZ37di9ZJpNk?=
 =?us-ascii?Q?3Hy8yk0vDBRECnPdfWwU5Xn5qAjcRghEkA1q2f6fBRRDMO1tQpkmwebiorGb?=
 =?us-ascii?Q?HwIgcinrRfTP2wH3RI9mUca9xbeI0Q+XF0tKJMWHCuvEpHVOJFafZEeCa/Wp?=
 =?us-ascii?Q?50wGud1dh9SaHHBD8L5yLKyXFIYFTCSmZ2wbgt2V7OpMq8W6F3QoJGxshTne?=
 =?us-ascii?Q?AtlQOO3gWTw5dUM+zYeFgI9zSu/1eTQp2BZ7mma1MnZFaldGjLC9n1yAv3QL?=
 =?us-ascii?Q?FE0rC0f1eOWfIOajRPawKyFGX20jlgrr9IGL0PC9/dlcGKExpMkN3TkXAnCd?=
 =?us-ascii?Q?QFt+N22avWTcU31Vs33sPdiE407uxFn6hl3dFUIQjwfyJh7n3A6ol1JyEgM+?=
 =?us-ascii?Q?jB6MRxYxt8tQB2VtkVbYEMActiIZULGrgt62rA/GDEjG94poISgIs6RfOZjK?=
 =?us-ascii?Q?oCEWylm8LP60WiAPvfkn7BPm2QyAwse9GvY8fpZe+pyoye9S3TQRdI8c6FZN?=
 =?us-ascii?Q?GehFS/n8XKTyhHJptYtKP0+HP7/wC19pGR8VTj3x4gP9kHaCfVnS3EvHad+s?=
 =?us-ascii?Q?tLgr8BYQ4HGhEq0XofYmjv7zm5T//y/BNSR1xREyDlb2B/tBBDm8CmYaUKQY?=
 =?us-ascii?Q?Q74cTGsu3902deuSka5BNr3d1unaZ/pVpXU72M+ZyD8fC7taa/eAhCLTMKKR?=
 =?us-ascii?Q?n0K5HhzPYcRqFU14XF5FtNvyACIsNx/XgqmQAZRlVapKSTOz3aPj/vai4Eqh?=
 =?us-ascii?Q?At9WPCSP7YXDgqwiJ0rBYl09ku5zJuEM1xTxKXeZbml3Q+QPw+F3kLuffdcS?=
 =?us-ascii?Q?lv+u+mu3n+XA5VfocP69kp0JdlAyfZA5wCJbtNdjSnhUOQB+j2zhv/nLEgal?=
 =?us-ascii?Q?4fIj54S1Nr0l3OM9ELoiKCy5cC9deVPjutGHunayiKJURDh8VCBRjpiROj8n?=
 =?us-ascii?Q?J/g0/w0aC7uuHHXRzBRv1PP08mCk6MDX59AONhJUvQ7RhbqgV9tIGWB4c9Lj?=
 =?us-ascii?Q?SOS8AbjXlF8Ad8I9LHKFmzIplhMk7U6tJrJT8ni8vVyskvbNwqLHl6JuMQYb?=
 =?us-ascii?Q?/d2YrzU//u8DeBifhbq5a/xrpUWJgbyhFY4sinkorMIRVhwvLCdYQ5lxT0LF?=
 =?us-ascii?Q?FAwcWJiNY5nGE2+Hds9sxFSwL9oHnuhIxxuX00whOaK/ZLcnQ5StukTTAp3/?=
 =?us-ascii?Q?QDhmXNJctu52kXRuoTY3u59YutjbkhOfEBz4D1QESDNs9xSIOn5C+3LQIb7h?=
 =?us-ascii?Q?M5iSHYmMAaizO+V929gNDrIDirxBbo1UggjY0kj78ZZvUe08Xit2rvi6BDCz?=
 =?us-ascii?Q?ooEfYFezJ17h2ocOTFTj7y4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d4225d-2e59-42d5-641f-08dd560585bf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:33:07.6247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YfqMhho9ebB2dJ17kofgE/L9ATAlMvnF9GfV7liNmYiUpBc/rjAOhAEpSwzbb5bstOgILxFnWkws82OfKnSQvl44zm6VxMHYrPN6NBaIlcTFLog9O+QB7MNSmStfVFWW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1015.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 0f806dde9c39..a85dd0bcf438 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -753,10 +753,10 @@ static int rt1015_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int reg_val = 0, reg_val2 = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		reg_val |= RT1015_TCON_TDM_MS_M;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		reg_val |= RT1015_TCON_TDM_MS_S;
 		break;
 	default:
-- 
2.43.0

