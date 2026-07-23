Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B0836B93F
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 04:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779915; cv=fail; b=JFbFFsG0N6dg+5IBaSAzLoCS9bjBZZFo8g32ApgrsAkkWAnKrpOVseJE/WQjhDNIbL422CoDVUq3MMwBuq8gDowPLk1vTyGK6aOsjkhWnngZo4f3P/2ygLkq4cIRcFZ6PF6a34vBYz+/v1y6Lgf0wNcCWdakR0ebChv0QlSNCHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779915; c=relaxed/simple;
	bh=/6v0bkFxXsvHv3kCKRxb+mx/LeZQ5GbOsCMVFsM5YCs=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=lUEGa9sWenN5klhSUB6rHzdL8s/op3ZDHmrWp/cmCY1fSiGM+KL8ljddhTRdyqQCRr3ilQPpqPpHDULVV/31G13XIAuXcUwd1x8ccgw2YJT57j9pBdZFmNqV9Iyt8GW12OkaEGw1Ua/OlmKjOC7BfPtXWJeJkJIY1ZhwgXNCZvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n9aq9crT; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n9aq9crT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcuZt6H6s8ivNaEDlGu16YVpv7iOx8iBx163D3qrAU//cyA33SeW9tZ360VyGaIaSqFuoKSz3IKWRdDCax1ArzCCavVg2cpJ6c2h9tMsFkI+WtLuhgBIkvl0FHEV34PwWdD8ssahFNvHSLfogv9WLYBy5rLQKtf9F+R9YGrJzgIV7Kpc9nlOzeN8IhzmBzeFp2SXKmwrq4Ewa4Dhh2gLJyYhQZ0ee98LHC5QkSGRanWQiVnfmGD4fe7Gse87ads+MV579efNzZZ2PV7EKokIj6zP4Z8E+L85w9DqxaNl0P7iML6ByTzF0Q8zLCIuFkImd8m7+/qHUzJ0yuaYbEQ5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEbAbrzb3bDAKbf/ZwG0u2l6bHw7w17qkIG5N/HyYbI=;
 b=OmaWtxXSCf//oHXXqsz1Ab47uUiVLOwThYFzYzoKSONzNu61rICB3oowMEIv1ShakiKbBZOwkfxxSXw/9Izd5pxXiGDVGpB/np+DrB/6OZ4rXBD0PO6qC+UdlSfPoIDX9I5sTX15B2O99GZLK+B4qRAYi1jLdS2zs0EQqOexxFvdKWVKtdkyddTB9QGdDdgnDi1oP6P9W1LdYpm/fnY+FCBpSNyeJ/xkw2u3SYm21pz18YyIAqBmX/uVK7vi8AK9WOIMdEcXKrME5Q8FDkCvDi7xbiaghKMaS2ISExP2CgnbGkIMkFSEa8BBdWI/C2JHED1jYgKYwTejtUhf9n/7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEbAbrzb3bDAKbf/ZwG0u2l6bHw7w17qkIG5N/HyYbI=;
 b=n9aq9crTRXDTtymE41O0iIITXkYakSl2WM8wzcH71Sw8186nBtxCHHuf4fMOLovlPS5oEWoZYayW+whXXHYjp5TT6BGVEesD3p3sSXF/Jav3zm4Bbu4ouWwOx4JcWQe8CpxsvnEnx7vhITJFX4ej/frdljL8X7eAZU/cl6c0wXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OSZPR01MB9329.jpnprd01.prod.outlook.com (2603:1096:604:1d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:11:32 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 04:11:32 +0000
Message-ID: <87bjbytkej.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: meson: preparation for Card capsuling
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 23 Jul 2026 04:11:32 +0000
X-ClientProxiedBy: TY6P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OSZPR01MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 316f9fca-49a1-47a1-51da-08dee8707aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|56012099006|10067099003|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	EZdwiyEqQ6sjthtmQpC5y1KVDNFl1AEW5oOORvD69lXGC3aBV6/MpyWWG17+3n6D16N/ZqC4sB/rSPm5IM47tKbRzjzvQOHU522VJETtA/6TyVRFTUOUy92Z/U2muUErEgY+DltFGvQJNm3SzLf2CdDLcEm8iDrYCyt9raUdRPfsP+drg1QfVevXb7WEI9GGG0yAZrkM+wBxiF3gZC85LI3BuH60Ls/8wCwbeucxrjzBj/t8lLbewWkOS6nO76FMpfFsDvScCotfme+Jf/tkk44oKL4C3KQC9KD63bgO4s4O+VDoRFA13xT3QrkEbMWAKSamoKMlrUsKIYTkiAP0WJbCE0eFsGF4TYj+LDPha4CxduXTp2qi6iJapIms//CDFyCxvFCfcQUmS4ThfsPouuPahdG47azoqnvxXu6v1oBgE3KZFDDVFy97/yDIKKV/Lzgj1jxtd71VOnj5eUcTLRYhIUV5wmo34/qtF5t4hf2oBW1zIBwU1U4CEJyT58e6VYoT6WHbR2R5WxedY8YPT4aZ9/V2dOlnMPTdQuN/5jeG2dJuQmxU0B2tVn14xBX6vDu05SWChHKCPzJs8e5w7+42KXBUgjuhMfbx2AObj009pWHRem5fu5nI1jdDeCyzlT85bQtUGZCr4dbZYn7hNd2XJGzErrcNk0xIogF6oECO1jcpD26Jn4r49wdahYmbyhxZZfsD/vT7SvtCswWluSBnqUjeuI002xQsY+82zVY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(56012099006)(10067099003)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GiFNu/Cd/aNfrfdxeJE6qIhbdSf741Vk2M2by//KKoSimDvLccZgyBfZgjjG?=
 =?us-ascii?Q?BVm2px5jv7E7T0hYwDzLoEGZ4InqtUmL+KcmanDufLmxPUxJBatOYB0qAa7+?=
 =?us-ascii?Q?Xu6WpYyFuE7c03zaclrXQvbApBPN9Fo2Rczfk7/lWDDmtBAd/q7d9FBpYa7e?=
 =?us-ascii?Q?95Jli3rXzjR7H+tKAI1NwMia9eJP7RjgASeKLFBB3QAQ/BK3UhjxDBN/yc34?=
 =?us-ascii?Q?Nx6UPockw6BeSEii1vFpV1ESOF7la5drbcuclz4leMJ7SZSJJ9bZ5zLr1H9F?=
 =?us-ascii?Q?7yYYQaNL6XgVYmEL22gYja7a8HhjHqIVhOMrvHd7dBxCoaZoBaTkbGT9eqyX?=
 =?us-ascii?Q?h97SCwIGS2AFi9Gc4RERsnCnTE9NMDEp8BZZ/If8lN8+DVRFgba7UfEPlutQ?=
 =?us-ascii?Q?VsL5FvTDSs97GOGcfcpwCwxcOMIYLGLJkelCiEIeR2AKRJqLkSYQLiYPa71t?=
 =?us-ascii?Q?0SuoEdbUxG4DV+jSjxMLVeJUBst/RTFCReRKwnV/eE8oM+6wmi3Eh9XOUZFy?=
 =?us-ascii?Q?vkhQ2cE2VjMXieD6CwHJnIJMFSrWeCEPwukUZZCAjCDcrDMqUDxD+VFp9nAJ?=
 =?us-ascii?Q?L1WQSZNL2d+HT+N8q7lZt0FRkzKMsiBMdlz9voLthyD1kLbNFFGoEzSyTpzN?=
 =?us-ascii?Q?nIAzYTJ3D8Yk1uytR3dLOUmXy8XvCs1yF79VYwA2p1eRW0bcsMKUs0zJ2nTr?=
 =?us-ascii?Q?tsWYo92nR+h+1lBVs7y5Kd9JnysJyUJxqtGCcQUuSRRdNmf6hwtWCDLpqWxv?=
 =?us-ascii?Q?myMQI39ySSUXDFp/B52HSX05xOUTeEPaRat9nz0LstTKRKekSPSyyi65c30q?=
 =?us-ascii?Q?1txknjls1MtbxprmVTmYvvPUdzoghA1i5Fx5aWbJjSDl4qagWYBt6AtDUnxm?=
 =?us-ascii?Q?H9ssdG0jhltb6/ao6KDQlf5pffVFIHQXBpTeftlhMoNTGpu54gucQG5sxLnZ?=
 =?us-ascii?Q?NPmndBvPZIHA8EVZW2pf1CqVG8PwU1DKYlsB6GqbvTm0s3I264NS+AK4VUrp?=
 =?us-ascii?Q?ZZCKFdQ2xT7ScrX6OK/g+Fwufcs+Ap2fuUiNkExuTXocRk5YgqyAdXvkY+xz?=
 =?us-ascii?Q?ePUwrxNeqj4LOEO0qObVf6gpKMN17M/Zs96zPQIv7YeqWf2LMEVdlqfBSnc3?=
 =?us-ascii?Q?nW3zvT8HVDS+h+YEg8k81ran+89fCDXz3nfKURv190VmDBIvNPVyVlLMgQaF?=
 =?us-ascii?Q?YGQp7nHGQXmLJ/yaZoNaBevzhYq/eov1JUqv08MaATzGRg/enwbjPu+TTWWS?=
 =?us-ascii?Q?O+ogbOtKcSwhBTK7X/Zl7fDshp/zG7zXRxzx/SJiRPo7ix0AlUZjHT20Izqa?=
 =?us-ascii?Q?33RcNdGk0Q6ZKMwt3yzpGYu1N697zuEAm5kNDhzeWxAWaribiAxus6uY3TrX?=
 =?us-ascii?Q?a7xNPAKNaZcBgGdabF5dUGBgz+Knxw0W2EsdzWLoFFNFZFyTRJo9X0Gz67Ph?=
 =?us-ascii?Q?iQd5rWCCsslwLsqLTpS6ovh8R0ugKqsMjmRdSR0CHLIEZQSFSZ22P7e7A8TI?=
 =?us-ascii?Q?cXWSWrFh9oRNhRKW5Xn/huDOtNvTruvkpc2dsXX4PhQX+9GZ60pgEPcC7cJq?=
 =?us-ascii?Q?bsNAe+QAaWbgqYigw5BIcJDf7gvNtmb1+7q0vwH6mw+DrhG+jSVN3kC8ir4e?=
 =?us-ascii?Q?1XvoDj3VFv85fbphKs4Fj5el4rEuqNdIbDT4esvEfneKTuqJ7Es9n1tCy+IG?=
 =?us-ascii?Q?2FTmpkFRJLww2KIYaCI6BEL0Q3/DQYRwh3K56H/Tma9glF6hqCKnITqlJPWm?=
 =?us-ascii?Q?e4oeaO3ov6dkYAP894EYm7dhaese8xs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 316f9fca-49a1-47a1-51da-08dee8707aac
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:11:32.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6tw0Rn0OfDQmzqKpxLn+z4H/+tO3VT/6uF/IzKli4wUwWs/np2kmBjIDx7cjGNyXQDSR0LC80k1pLQkE5BiHLgx8L2m+G7mDvF2UC+IPQgqmeSOZpuFTxyrxF6EAYfX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9329


Hi Meson developers

These are v2 patch-set of meson preparation for Card capsuling.

I will post Card capsuling patch.
To makes its review easy, tidyup meson drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.

v1 -> v2
	- Do nothing for snd_soc_of_parse_aux_devs()
	- Don't replace card to priv
	- replace card->dev to dev only

Link: https://lore.kernel.org/r/87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (3):
  ASoC: meson: axg-card: tidyup not to use card->dev
  ASoC: meson: gx-card: tidyup not to use card->dev
  ASoC: meson: meson-card-utils: tidyup not to use card->dev

 sound/soc/meson/axg-card.c         | 25 +++++++++++++++----------
 sound/soc/meson/gx-card.c          |  6 ++++--
 sound/soc/meson/meson-card-utils.c | 22 ++++++++++++++--------
 3 files changed, 33 insertions(+), 20 deletions(-)

-- 
2.53.0

