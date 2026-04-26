Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336F138490
	for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 23:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245531; cv=fail; b=Py6bs/ra4az03DCDtHaJmOks9xh+YdhnZdc/a0yfKQM4kutNTuZfg3n2MY4c/qybbwlJQjLTGIiMT1wtHK0NCAkddw9OS544pz2O5MdtpYk19x/eB0Sc4/Q3+c5MB8k481/3i9DpuI+XzO1SwRR8K6m5Y2Cmmnli75auKmnL0oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245531; c=relaxed/simple;
	bh=T3AayX53T25+eu8UHtwUzpgyxbxWCzuoy8X8oZw57Fc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DhNGQWxZlZ1OnC0fNz44XWQKqtOzkSiHo7jesa0SkazfZVw24aNx8k7S5iNCns13imXg4UBzwPwrtmbAVcR+s3uVCCB85bC2B+98iTtPc6bKYoFzWiKYyln1w+8VRL4FyNKOBJ68f6Ea6gjydS3j5Ooc70aWP3ca8q0kMgEj+BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QcFqzVDU; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QcFqzVDU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irOX7wc0AjHXu3pfeLQpeHj6jvUW8ihSDyJ025UwF2/W8cLVdc6y2+IvOXH7XJIh8BOTkBy0tiXQCOw3xXhERfpokJPa5uTXOXjezFQP7BtXOjOAgggKQA+cJ0tqMCuTDO7GeMjA7Fg3wrp5azf0WGlhcZBxC/g9HWhS+434MWsEI+Vyia8jsu18oV9AF1JcTcVbyqoJvjWUD7ptQwp81x0dWDVbnZcY2gZ2SbQDSQb+EyvoTzhaZggqbCnrLySTUWQTJwK2/O9uDkFV3ZdoEzC74g/RAzpf3nHOhKwPW/alVWq+KTBwVrzZYvZZ29Q/U0yBrKcJwxOZOrdXIGqWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM5AN4L9QVtIXOgdyyTKVIEbXzotgKNwMtH+jPNHkNQ=;
 b=D2a+fTNu9rX/jmY8uZcB+Rz/qD6avoNfqANIvC1zYZaXb5otQKjedaGvHYhzOFQw6E4dDvKy9xKX6J/hHbBdaBNA7gzzLm/uP13VXKlVVBLQATs/lY3YvvzJ/SwXxwZovmx4h8kdluybdWH3DVT2pY8+yguOXakUs1wQazMycVyNv7cRmDn3vzs9fWhcmvpmtGxBstgQTThsrT5OO2hOzScKg8R4ZgOSI9H75c4N3Kgy8POpv3Y6aUXudA48v8G7qRG6OAW2Rz4AKuyjXB6xDn0V17uf9RggniH1UXh0fDqiWDyPub2fJkJQwx5XYzB2hRQ/c72gVuUl0Nx++Yw9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rM5AN4L9QVtIXOgdyyTKVIEbXzotgKNwMtH+jPNHkNQ=;
 b=QcFqzVDUHa0GkFcl2hJrDmBNqZ6CuF6K594SrfqG/kBTXy7U2NuT9WJ2wsVPBeUjfKtgTZ/lbXgEPGMEVrpQQ+5WIzZFiDDht+lxystmf1G76lTLwGumF191K6nEfnKWUzuQxwgfVVcGrHIyiD9Zw6d7gc6+7SFTbnHaZvTYkJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB12027.jpnprd01.prod.outlook.com (2603:1096:400:371::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Sun, 26 Apr
 2026 23:18:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.025; Sun, 26 Apr 2026
 23:18:46 +0000
Message-ID: <87wlxtxqd1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [RFC][PATCH v4 0/2] ASoC: core: use Complete rebind cards by default for all users
In-Reply-To: <62019496-ec5e-41d5-a17c-7739b829f15b@intel.com>
References: <87eck7k868.wl-kuninori.morimoto.gx@renesas.com>
	<62019496-ec5e-41d5-a17c-7739b829f15b@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 26 Apr 2026 23:18:42 +0000
X-ClientProxiedBy: DU6P191CA0070.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB12027:EE_
X-MS-Office365-Filtering-Correlation-Id: ee034906-559b-4785-a78d-08dea3ea2ab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	IGiFN/kuHJORDRILrK/0Lej47v+mkMYJdQDzag/TcI2rJ0ZrC/62EX1PF48aa1TUV3Fkz62j9hUXZHqIQt7gNCLa/nQ4VP9AFx2CFL5/AhIcu3YjysOYDpyjgylYbcINjlW523+d/fLYHNBK0V9Mql7Ftsx0IhPHnWF02ix9gzKv4TX1GjhML1po5MdJMkfUxNu3f/sZIx/RRF/wbxul51eJySqGA2HuXQ4j6nzMEGM5MwELVFiGt01RQo1AMmpuTWh0EpBjMCBzidHcdlIrpXyOhd6UC0dh5dsl0o+DijBGftdaKHhIUTGcvhn816IGTwmUttHLWtxwbF5pw4A/l4TqNYe4UiEhEFo7TtvZJQXH2FVtVE+3dZ+Aqhts23/v+4b6PLAVKVed/rytDrZAn8ftoyL+36XVO3sEPVtZFmzM2VTTGqzyaCDHz4kz+lGjIero+F8XTKY8N188RtFH0Se6fXvoR55hZaLvzRXw2irLCrc/croXZQkf1vF//duYCPiYQpewHX2EWGaxHd+00z9d7nELSDxSC9e/d6yZraNhzJaGW4b0B9XsTFcl9MoRDZuiAK8kgmgN9YH1pGjkkWWfPNBpPQF2BK8jZyp+YF89On1JnwVmMv693FQ3+JEMB3ITS7swVsvvXeclDkpzHdOjd+eEEu0pgau2lYkXeTXwg/zzkDx1mjxnAworAjElwBMRrE2uZofGrG2tkXEttvZaQzi81sd04uk3cWrwUCC50ODGixkHXxqDON4W9NKSNKp95gycppmYPLn/7raaRUtoERFxK1zxh6tnAwmHY+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JdekoNCXxyTmD9tlRwYgO1Xl2uDQCfT9mEFyiqjqdJzMgq/s1tCHvHcJ/Kvm?=
 =?us-ascii?Q?Fx0EFdeozAiu9LVSsOo015gmF+WT3nd/0QSxyD5Sx+NyLhLqFeMXdNdlyUhN?=
 =?us-ascii?Q?yK7c4MJbDinopvKsdstSKYWIt9qkbnXgLAw/ng0BMqaQTidK2o/EQquLKPD/?=
 =?us-ascii?Q?DzPwjlq9KHwI1V1sG8MXilivxBLCywf63lg6hi+cvCcsgL6FBnFfT/FmPIni?=
 =?us-ascii?Q?A4n23imwJN0fC/tiZnV/baeCkiEk//vANXs28u4dg9E5ctg3uUyaQKNPDqea?=
 =?us-ascii?Q?rYHzHuFsnxLaDrbiDGiBIioFAeRX4Q/vBr8mTbG6PO+64nlrlDQ67ibOJTMs?=
 =?us-ascii?Q?hkZnWYR16jYu2NsGhKyl/EWy/aIYpYsuTqzynVOOndG76UZQfDzGxrT6WSS0?=
 =?us-ascii?Q?pwhf0w5iRk4s1VWlVY/73eYCFqve3Lf+OJkTiYNRE39aAP+n+KR2IEb2AkpL?=
 =?us-ascii?Q?uvfukSiqf/7K5bkGO34Xc3yFUH3ky+pb0nRoGAbS5aNkDPjpA9xQ020fGPlg?=
 =?us-ascii?Q?Mrn0jp9xmuCmyEXyc2BeRnSUHBXG71lLSaTl6/Ay3lVmUfaI7OghKMPik11D?=
 =?us-ascii?Q?gkic+DfGdN55Yu17ZDaq/bIo5FS1wmylnPDcz5LNbVq9nhYLYeqUcAdWdl4D?=
 =?us-ascii?Q?uoQBwes3/1Ui74vsj8xLQZUovqp2X154mPtJrBoXs5hLQpsoh0A1jd4O5ncS?=
 =?us-ascii?Q?jbdTghMqDS6FWn+2A0iyVdlbZgTHAcHwsnsNKOIwDJskQaN0wDNCKeH54+4T?=
 =?us-ascii?Q?SJqSkLp29TdJZForlxew5dNfmDCT1apzJ5PUhOsHxILbYt+49o3L2o8dp1UV?=
 =?us-ascii?Q?SKI+avOM0v9sQoilLaNMgohXIBQVgm1h3617i8vXJXN4buMWlcNRQZgzvP5D?=
 =?us-ascii?Q?10StllwNzxzrW1u6Lp6xfcLzPZs59rz1ZPPI7d96dsAguXzYS9xmpSNFkcdf?=
 =?us-ascii?Q?7akmPOBkSPS94KRHxTd76XPCgkZXRu5pkzlZUJz7LxiFkgH39190XoYdnE+S?=
 =?us-ascii?Q?gdf3Wruf9N2cf1KXvI9kPkvhJQW4y+gJg+AlefHKv0M5uG60JpIReNYCNDOd?=
 =?us-ascii?Q?wjZuFji6/jp1NKkKlq/BzkdAO3D/YMW7qnrRD4tyWi9TS4u0w/tx0C0WaFuG?=
 =?us-ascii?Q?zB0pUSj05z7mNNRPn9w1aDcijPtQHo0f9jdmVns3WL/AygSqNOf3DGQWibMy?=
 =?us-ascii?Q?ZC2U/vg3wNQYUkoo9DSBbZZ5+2Kls3CpwtyXZQENtuLtsUNwgzSMQ333+jjB?=
 =?us-ascii?Q?iBNqvKTUdbK+nuF4T0rA+5snE/GdZdl5IGtJZkdMdGMEelX0URcChQA5PP1y?=
 =?us-ascii?Q?y6+mp5MAbAtv1JCmrHbN1Ua4gugCscRT8CsXSsJ/r1vFmzu86caf+uv0YDol?=
 =?us-ascii?Q?QMTFZJgJcLB3zqWmxqUTdAboIzbr5n8Xo0No+gEZEyBYIqyDA5Bvof5eb8Lf?=
 =?us-ascii?Q?lZfg0qfafradDde8pd1w5FMvqMkqUAWLVssFNjY+qthLMsBNgIgrXNWWdA43?=
 =?us-ascii?Q?X2utnOMYzjT8cqZqybNUab5r8QQFj/DO9E5YHBTmVC0G1k8OCcWBKPjoDq0U?=
 =?us-ascii?Q?mJqgnuBh2xBI8OKQekHZUBBYYZJToc9WmW+nhuhonB06NHc+Jzt+8kWHydj1?=
 =?us-ascii?Q?FwwmyAbMDuP/Y26Wh4mxntw8yAz7hSSy4shH/9fqRIFykGkMhBjelfx9BXCQ?=
 =?us-ascii?Q?ExSjG4HlU16FWRl5NFEZZdMr9b+8MXUMduNpCdocFDymAfoq+Lu8xiNLazik?=
 =?us-ascii?Q?xW0+bAK9brb8Z5mTV4Lh1Jb/8NEp2q7oHgPm2pP16K6LD6+j2BDA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee034906-559b-4785-a78d-08dea3ea2ab1
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2026 23:18:46.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyYbhQqc9GIz7Q7m9AMMkIVswPg3Cc/E2KGaDnnAn4LecpJH7yDBDC13n8pJ5pWpvRE1Q3kh59Jn9SVtOLbSada8KPLMikc7VeOZBEVmxLJ8iZFTsUxGRutimo0+WEF3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12027


Hi Cezary

> There is soc_tplg_remove_link() already, I believe introducing 
> soc_tplg_link_release(), an "unbalanced" function goes against the goal 
> of the patch.  Internal struct is a heavy hitter, I'd argue it alone 
> defeats the purpose of the patch.

Ah, yes indeed.

> Perhaps we can achieve the goal in multiple steps.  Simplify the code 
> implementing the feature by merging 2) and work from there if you 
> believe the readability still isn't where it should be.

Thanks.
Just I can do is indicate the idea only for topology.
My posted patch was not good enough, but happy if the idea (= use
devres_add() to remove rtd/dai-link) acceptable for you.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
