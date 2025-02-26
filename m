Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011064.outbound.protection.outlook.com [40.107.74.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF1518DB23
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533551; cv=fail; b=uzxq57jVnHA/hyAEBkDFBSOLTV+X2Q6/mpOjgW/O47SNnNVAfQOh7sWrXl30pRxi5hBgBbiIaWN9FshZglXvR+vvq4RhNFMyF19cV+nLM/JvviqAkT8quQP+NEUluAK4mLSi+L7ZkDFmOVP8NWbwQkZGMzlbTCM4R7q+UWiolso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533551; c=relaxed/simple;
	bh=DDQAnQPc0YfDG4ylNquzF1fCE48XyFldBIVGBBfuuW0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=NKpxjdUxijuYcfiLTYdRYhmFvnlnm9oKxKp8HoZExxXWNv/kK4FhRUviBScADyJ2tTItjnrnbrBt3qf/XKNWTTL00Rna4Y71VjC3DR5upv5U6XNYaLWJ4B8tgKDbmwdNGR/q2i1q/g96FUSO8bf9yLz6f5wih+EmZQdoPl2sw7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xd3m+dDO; arc=fail smtp.client-ip=40.107.74.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xd3m+dDO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ryPua+xwzvL0ae3EMJ38dMWsOFPSUxT0VlbfcNl0pwFA0e9IzWOcBr0frzAwmWPuBSAksK3Ck7Hm+KK6KrolvsOITzbu3aMdEDjxcYjgwpocARQbfea1RcL38wlflrwNPfi38t6yqvefyjBQ2KCVNSJGtGkVzbfA0bYZ1RcWMJiumZF0B3HD2ZqiWRPE5tnfGQVePJ73pYlK84vOUg6tVAwiVJWjgEnvDllw0L0cXs5cmxJUdt7CXfuOeYEg30Uyr418eSC2tBvwtokPbuaiEwhKM6CtU3FQ0nU7bmOObyqxelN+bI9l6b2Al2kO6OhR1JyVD+IL1FIBj2SVR7wLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmcB02zpdV9abDCksFI5MhOH1taWh2rva72+1jY+FEg=;
 b=YQ/hZWDnF6B2fqxUetcKtA1KXcZXNw/cs1dWfa4I/Az4YRmGmBMfzBPW0KVX2IW6XqKMMepq2hUTP45VLMRco1Kv5/k1LCjoJeEq64ki5dpmHlwgu5CFMt014BcyRj16NoL4BTT88AzA5s00odawY5UmbQeU8ZmK1j9GKxLSmILa7xGohlj7qFGeQY9T2RIEvSbFRL07JPDdfISBATspSQwCp4nhw8jj3LXjNhrI5KHf639w+Jcls+T3Dy2gLAdcRA37Fl7YvfGK2Xp7AbK5+KGbsbyqWHtUVcRpdWWDABLf/1su1KTzU3OJjegy/NxORlrDR/CyeD9LW7JY+i381A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmcB02zpdV9abDCksFI5MhOH1taWh2rva72+1jY+FEg=;
 b=Xd3m+dDOS8T+Hv+mftkj4AIsmjcZpHVfgK2GnH0y4EEDVOEDPr1f+h/SPJVa+cIz8KCemQnr6IM+02a0zQFQYCqgZzCbEwEK7E+5cJPOyYLEysi4ojQIWJcEm1OfsusIiSqNYjdppXvcZFvMOCcq5LD50ds3IyaTwlhMp3wu2Pw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:28 +0000
Message-ID: <87y0xtebis.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 037/157] ASoC: codec: nau8540: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:27 +0000
X-ClientProxiedBy: TYCP286CA0185.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: 741a3578-a0dc-419e-5459-08dd56056e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QY6Uq8nNmF7h8Ua+FHJqfaUZdQawXfIGmi9PEkguilISsxktL2zqxl8XZReF?=
 =?us-ascii?Q?h9VOHVsBhKvfciH/lvY5e+j8fpa/bekjnIVvxw8l8KenNXkkwaNjPmhNsebt?=
 =?us-ascii?Q?+1YQiIHr18rTxpIQCPg7B24rJmFv0B3H87Dx0XNKRTDdywgPQa62dlvcOkBz?=
 =?us-ascii?Q?efRHArv1Zo/1HeOEb0IGjt/1GWDqNQLxQx4s+J7iFyOhqn5kkgdPG0rWTqBO?=
 =?us-ascii?Q?uRoWderFagLSknDu9DEidK8pzelrmhQFu5r9SXw6g28V1Ki2VXupKlfzCmn9?=
 =?us-ascii?Q?XeE+GUN756tZC9/kdaULRJJ8tMmbSrBAip7o1yU/OKcIMzSBZXI1SPw7hE03?=
 =?us-ascii?Q?SVGvtswPYoUTn6XD6cGGg/GuvCX4uCOMgbjspcO3DbAY3SIDRKRXMLNKlZTK?=
 =?us-ascii?Q?4aEERIIh9mugQcNwjGJTZOnguZmmkf47SQiAy9tk0XRV1Cen1yUVhC/s+4qw?=
 =?us-ascii?Q?MAXY+G3PqjculkYeyuHD0ccFKW4m1Wf0+YI6T+q0LZh9QF+kErhhaXiS+GC9?=
 =?us-ascii?Q?HuUM52nx28IN2CnXxp+P3BFTeetS1GOk0Sl/vVMPcI6EyXr2hZiSmMI3Fyzi?=
 =?us-ascii?Q?8Jk7O6zSDL5N8KJovudsuDkUQYlziMbWWrB7mLqNvcL5WmLaJZyVMgZ3grBQ?=
 =?us-ascii?Q?oKnXZfIUjoyQ0kWbf0Lk3hW0eanXkJ02Je4JTPbq+vJkNnMWCJm4HjTA1WnX?=
 =?us-ascii?Q?QQb8BEEXwrJoHx0SOUEt6brFdTGVQdVo7MfMJPPfk9FftbgpLHR0Ue6j3t00?=
 =?us-ascii?Q?j5LdKFGZk6C2GD0whlhnbDPJI0euhwXndnSgAUW0JD601/IDos6ca4XkH/Av?=
 =?us-ascii?Q?xa051qcFNli2rXmdarinnS8noEMGue8CkRb9dm/2SpAG/cLpjn3j8VWUYO1W?=
 =?us-ascii?Q?gEf0SJFLIBOtHLPEmzPhvD6wHlS/E0dx0Qe6Lmpvt3KhPD/6OOxdHstKluLB?=
 =?us-ascii?Q?zrcSlWwWQWCA544rt9TKQhJ87WURfMjXA+IJ1demoq8PL2tV2nivbGRDcIBy?=
 =?us-ascii?Q?VOejDRVjvPRUsvOkd40robmzK8iHcAlUgCwe9QedNRoInAR8bxUgY7EFSZC7?=
 =?us-ascii?Q?EYC7J+fMQwOnAwl5W6WoFeC2CkfR3Yaaxxv9BJQoyEU3OutjPoWgLqmeqIrF?=
 =?us-ascii?Q?zc1LFTM8kACe6GBajhCK3rU3/VyedpoLkSjlq+O06eaNE/fwaKnjlDfBfXWw?=
 =?us-ascii?Q?Gff97FcKws7rApW3oA/0GWkPThMBSaxcq8kBtPCJy6WehCTJctZuKoeG68JL?=
 =?us-ascii?Q?8qg5k0k1bfczynNabTOWeb9gK+IYDPnlvzXuTqZMesMgN8Rmv5wFrrzI91OH?=
 =?us-ascii?Q?aRgrK9UWRjCSmSs5Y8+n4hcykgcrFU5HoifCv2Be0sOVQFktlbHIpBl5oZte?=
 =?us-ascii?Q?cnJgwWUDCiuG5I6K/e0YRGJvjINXrOieSkZl0xLP3a9qn461kRPZYqgkjoVd?=
 =?us-ascii?Q?6HhiHgsYmZfoP86VbcNHNZJSK1D09PL5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b4fX27uRdXCQvfIJA5BoxEn27hZeY7SQBfh93SdIhcuIZfGja1bqcPKmQmSy?=
 =?us-ascii?Q?oUmgEYB6o6aSbycgPQhA/tUmYyrsN19v1WGqF4Gb3RV1Te4UADyQDu7fiQWa?=
 =?us-ascii?Q?Pp4ANMLBRoJNVHzKKVO4LE2nfaIq+4IrPzwGn/055l+4foAy8WGpVhEI1Y5R?=
 =?us-ascii?Q?18VJe+xbcuueL0jfVi74RJwcc6N2nbnwFKjw5z49thT0hIy20VtzIY7tayMR?=
 =?us-ascii?Q?kAtScfz2uW05k/cvaiK1Y9E5Quy4kLY/jj0VgPgmihh1GABBwBigwqQRgDdD?=
 =?us-ascii?Q?M4QoXdDRJATKqSI473F/2iNyaLKz5H1/GAUrALxjeiT0VV4yYbUs40+MKXY8?=
 =?us-ascii?Q?2EheB2s+6iA7Ngy/QzFeSBWxWpCuXWDLQfUUj6AhwCdV06V0CTAGxEif2vYv?=
 =?us-ascii?Q?t10aHh2w44ZofTyX1pzTVks+H6P0qZTKhmahNorNyXmG0UETPTg14cChLK+7?=
 =?us-ascii?Q?Br+THt3DgUeX5uFibZegwI7ZYa+kLMGAnPRbATuD315LTEsCvD7XT57X2WmN?=
 =?us-ascii?Q?WDnF+8YpEJNveK5htWBvuxuRfQCU31wEvxVBndsQM0VSk6tQ55xYh0V1rOUM?=
 =?us-ascii?Q?D7Xi2+RTKueIkVtIpDvr12pD3+n21JPwb4V0RWGs+XpYzENfSR3bffwTrQiz?=
 =?us-ascii?Q?R+Zzhnv3wW32qwXWTbK2tAegluOWGbG5xoFHiY1QLJqUx5ZZwn/5vnHS2h8Z?=
 =?us-ascii?Q?lycGFfX8/A8IQHelNQEDJNbc/0oXUm1V+mpABLov+ql9eQOVXlIfh3iB9eCg?=
 =?us-ascii?Q?41afqBgvX3t7n0ycdNOrQL6uft4/Fc2wNwITvPlLOs8zPWPsdmsGZwEiIspc?=
 =?us-ascii?Q?E58t41qr12zK1ylE4tANQGdzS+Q+B+6W/xJr3WvniWkgPbvxkPvnVb4XFWHO?=
 =?us-ascii?Q?MCDkaTz5D/GWb/qV241fGFJlY+aqu0EQ0jpnfWtrxkqfpbyC7prqvldH93Ns?=
 =?us-ascii?Q?RrJb4GcW+j1i3/roxRTLI5yKsiatbJMKCGuHbB92E7mvKtHUio2wx1JgcSNn?=
 =?us-ascii?Q?9k4QNstC8oRtmkasA5BeJ96czlM4GeF0asnLHd+nnSxMlebWNiYTj8ZMpAAE?=
 =?us-ascii?Q?mKF+QkcLZgot3wLrzfcRo8dQQxpKVyn3RablmF8L+6jZlE86qQRTvfZz3tOk?=
 =?us-ascii?Q?GR+t9FUYpsD0L2cd3vyWWh8WUNTT+Nm8H0LZ18fGivm040Qxi4j4UdIrhuid?=
 =?us-ascii?Q?PZkur6KzvWP51g6CGka0BOtST1GwvmD7j4TtgLg3Plen8hVRf0/ZqtoYwC4g?=
 =?us-ascii?Q?2c0f9Oh85DVgRaaCUrgHOwFjZi9sdFLSk7MSBW7ev3Zpx5SOi1MwbViEMoln?=
 =?us-ascii?Q?PsBjPfQiDsfllTuOSSU9dtJOoFPcSxq+ig4v3rBCLdXeK9jpgEaMbdO4yMCn?=
 =?us-ascii?Q?W1QhEnCP/fTAB+uErpiKkCmcpSbfOqDOAXwvzU+Jz+j61cfWWYzaqbhqs5AO?=
 =?us-ascii?Q?D54A9y26IE8kbXYuAKic1OiAmb7z3a8lgpWMvWvF+xQtDMrk56eTD+M3YsgU?=
 =?us-ascii?Q?m6707+CW8EQNysNNG1XOZ9hx88wkZ/aCFkyz/x5hO2LkYwYGvLDz5cOpOUsl?=
 =?us-ascii?Q?3xVfxjOfrOhqYOsJfF5MEuzk8BKeJE1XeOKvSOjLOK51+8wImXmtqfwA1VD4?=
 =?us-ascii?Q?NzI5ihTLfahWqL4p4mhoGuw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 741a3578-a0dc-419e-5459-08dd56056e36
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:28.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4/ysdmuLMQdxZFsd+0QMzVZYKvBnWEru/gI7k8yoNCWjyzVW5YMRX6oiFtljGvrLN7zVFFEXg+uJa8MfkIFFsw2VvaNxXN/EeliZ18UTY874eOozMivok9rO9RYhPXV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8540.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index 7e59448e7ac6..caf2edb23088 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -482,10 +482,10 @@ static int nau8540_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int ctrl1_val = 0, ctrl2_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl2_val |= NAU8540_I2S_MS_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

