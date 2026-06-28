Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A00360EC9
	for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 23:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782689764; cv=fail; b=tAwtQa9DVzTkErZhgx5bZJP8YMTW4FPvKqzTDD1ftETXxlBsy0h5RnIacslThVszVXYizRh4w6gZEC2NlS8rwHLz4AjgHJhqp4teBTrERhNhmbC9wEfmJ3VKokIB4Bu2UPDNZhuAVOZWlMaNePRBbdjpeyasR39boWVbeIfVtpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782689764; c=relaxed/simple;
	bh=NVzWTW5dsqxQLEuI5tYWX62rbjFnuRWyGnLy1+mJ6NQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Fz/dn7JCQgNOmccIqwZUTvGReAxMD3nEzYBSOYnodVaARE1nbHdhW8g8HGg8cr5WnYIHlKKps7A9nvP13WYbLUmmXmvp84ZgTBvwYKd6WDsd+KsBKTq/yyaIubInw5bLNDaHTRdrsbA9ZJEoSSHvf5HZmPsxXpsXq5oxxiTQJTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tai4FyV8; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tai4FyV8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RskENSrhSLaxUHyou6JEoXZf0fKK4JxWe9rPOpfqg4B00p/A+joMtWKYrrKQO7LHN4NDusrGwLog7n8vKIVPG58LSW5SHl8qZjdMUtg7T+6M/n4eiDNDTDtBCSgm9zU+kaSoDanXY0sbO6xbGf1ribd8CyuxR3tSDb5zVCCQfiZ6UpjcLJ+dhJgk1XEk34SV6DDQoqDrGvfkNFR7lWQtixauZ/CNh79obn7BHo6CuWFUdphSfW4FSlMyy2O2McDZKiVTqmFDq1ghiuWKaxRzseWw+kgZX/CnS7X1+Dlnw8z+5/XGJN69BQEhkJgHi8skrVIdREttpFO2DjIB+Vi+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbYiy9iPoKsGX6Oghft4wmMj8qYfSRySHYmzUid4NRo=;
 b=tOX7Pfl+edz1YfdGq8rb1EgkdvGvJ+phoCc/beDq8zY6VV3PvWSrnsbn92Xx4keWk4hxZagdz2trISEnAjzEitEHchfSmhRnHpDwzrFgnlM1t+hSEMyIMjAvDeVyBEC63k8DuEIJw5jc7zPVmYFY+W9pRCk5U/POGqoRaXFFIIwx41un+gFGrAdEsqD013tDhbZj1dKdLSGRNsV46GHxMUd+J0Yim0Iu4MvaLAq519veD7JXm0npT7dQuZ69mju6OjRI6TSGyAqQb2mO3TAtWZvO0gyBCwjaSlrQtFv8X+qoXXqKY8zy6hsVEIM0OJKCjSVqwaPLk484jc1NhjUGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbYiy9iPoKsGX6Oghft4wmMj8qYfSRySHYmzUid4NRo=;
 b=Tai4FyV8Fqs2rELmvqqQ8/hmHpk3yqzygIxrv+3H9WuKI8UkQDGGy6qyXt2pjWGLuXFdBHeRNqJdwrH/OZ0MeOLRBNdvNAeC7iwn3JUOq4EcEt9vnTpFtU+Gxt15DUxVjx9uvenBK9RPl6gXmn9dEJYC76KKsvjX19AF+0y8gm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS9PR01MB17557.jpnprd01.prod.outlook.com (2603:1096:604:446::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Sun, 28 Jun
 2026 23:35:59 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.018; Sun, 28 Jun 2026
 23:35:59 +0000
Message-ID: <87se66dyqp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood
	<lgirdwood@gmail.com>,
	<linux-sound@vger.kernel.org>,
	Mark Brown
	<broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai
	<tiwai@suse.com>
Subject: Re: [PATCH 0/5] ASoC: intel: use component_name for Component name
In-Reply-To: <d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
	<d5e3fc22-8a17-4672-ba5f-167d8cab2aa8@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 28 Jun 2026 23:35:59 +0000
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS9PR01MB17557:EE_
X-MS-Office365-Filtering-Correlation-Id: c009f6b8-6b9d-4e8c-5226-08ded56e021b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|7416014|366016|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ySL/O4ah07bZMWdfCGu1y4bKtiZsbXFovUAFYdCTpHci2vOP4kUOMdPhNkw4q1lCsClCobAuhvcd7cKYUUGP6+pzJgMoF5ykNQyr03MBzMLz3CrigjGgnt4GAyQgEfv9SqGPUxXxi+X93TL8ZLesU1AUadjW8bt7Gly+qnzBApYXXY6dSypuYUrFr7hEjAOPBld9ucJr2hP6262iu8mwZWPvVvDvg0GCm0r0nHszwQ8bNK0pmmsKn1miWFXC7kgLFPzLalAwu8XFjL/6KsmW3oLAlx9Wh+2DOiXC4ZKz4aCacyrNovJB+dL5YuNQhFE/ERiIvzdEJy2npUeXKE7jo2JNvAB/yf+2orV1Kuhfy+kmceThqI0aPAwABjTocao3yS1gLcNNoGNlUHiofSOJ75B5wDgAKmptUkXZU6I3qhlJvlmljIBJvrUYqCswve0Uv9y/cD0UjOVi6wzmyDDzusCOvrtWGPcnMLc8U61cKVtfthK4tk81fwkO4gq1j0rxL92dbJZMQqDOQCsWqNZcO93N7ZYfwVfmJ9a2febvpdAvG1r4V7rwXB5FGp3zheqEqWSd8oTlTKd3wSMC80fytjQKS7HRxPswUAerPqcCEauWueuV/ND290G+xgp3y28kJfERbae1LVdwiD2FJ5qyDUeScmNw68MlrVy/9t8XBHkSqtfxnhK4oAe4LFrcCxvWJlOg+gUx9BHC2uBSTc8jl59aRh9U447MySDI0fzV6Zc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(7416014)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eSteDlWUjPRRlceEgpvo9iPF6iz62gj0awITfMDPMN0yzhzoQ/MuYi7xwoi4?=
 =?us-ascii?Q?RFKCqzdgnlUmC/Ywp/zs7Dw2bxlR5jriPjh4bXqmala6ACXoTHChKOGUUFxa?=
 =?us-ascii?Q?Pz0oKkAarJZwKDhgWqF/zov99GqelEz3FB5bgyuCR3+Fdysm5lxlfeQ7xdlM?=
 =?us-ascii?Q?Hxjd1/AY4OHKqOWhfKZckbbrP2B3zV95xOp2YeNkiaKCF2k5V0lOHn+X5Dfu?=
 =?us-ascii?Q?ogASKx2F0sulk1PK+OrHz+S1XCsn30HEUUD4Irj2HrgzKU9pM1uwJKum2bOP?=
 =?us-ascii?Q?Aq06QNjqACaPCC/HjseVeQlpL/1VL4mTzJ9du/VxteBDejnp2F0fIRlcX86C?=
 =?us-ascii?Q?5ZtWjAfOuJZfcg2/1SRTx7n189wzhnd0vU6WOP4fYoMLg7swDjZp6YFNg/Zy?=
 =?us-ascii?Q?F9oP/TmXjzTNqzyWYDjnKTRmdl6oYdoXzcpA4R0nw4dYa81K+xfb6MWgS5wL?=
 =?us-ascii?Q?otGgqOY0xFqapfsNFD/3c3/3PdTGr/6P4MV7cm0jBwy9HHHr5p13Jh3yMLYV?=
 =?us-ascii?Q?UT/gFCru1H936P1IrKuh/m3HYViAn/gVcP5rsgG8weQJfbFiFLrE4rGoKvWA?=
 =?us-ascii?Q?TXJ0lK5KTKS6cJkEsB3lhoHiSQdD4qXJBBhca2s4LaDNYCkGyuPNoRwys/az?=
 =?us-ascii?Q?4jQhgHl/P9D99lPD2AI/lCSuN4r6lLEMDq9Htbs5oKgeGClitmeAbay9Yedj?=
 =?us-ascii?Q?yoFaF4I8utA0bAzXMpDG1u32WMexQ1OLpMxlxCpP14N7l4WEEl1fPsG+H5+/?=
 =?us-ascii?Q?tfrmRH9STPp0NWjefrC72bPROYBEq3O2Gf0kjyLPuAy81UhIwo0di+rzqCwR?=
 =?us-ascii?Q?+Zk99TB7zPB829h+2qfbiSWk1xxheARI1pu7zsq/xOs6672o9DPlCjgzvxud?=
 =?us-ascii?Q?tWga+XHJdQhDTGlVOZTb0ScVXNxAjVr8VeE/9VduAnvPUPY2yNhnNJM51uMf?=
 =?us-ascii?Q?u3rk7zuoReM5f/lHm3FUZetjyKjjCpVTMOqGc0OsBRknOu/PWUS7R5e2tBKi?=
 =?us-ascii?Q?0kSmmeCznaTf+vrQMUEbY/qiaoLjSl05nLMEsui4/YAn83TKzP2Frqu4nlgR?=
 =?us-ascii?Q?rfAWGPxszBi72UND16nJLuKxJ0jNSJvZd96hx0t2PnSQP6xYDEMqo+B6rD6e?=
 =?us-ascii?Q?vtJUL/S9PugvUmqkKwKqDxNeqGz8AUB6DEVt1JKMHt0vFIlZndAg0lgMAb33?=
 =?us-ascii?Q?yAAGP99PwGiOTXVc6QRHMSxxpynS9apT9JfPcmslMMjg22rvBM6FD/j+hxji?=
 =?us-ascii?Q?ERBCCpmWyI3AekhREPIOUp+/6wplw0okxJvCrVD5oFYcBj6Q51O6TOLBq++A?=
 =?us-ascii?Q?NwTw/fzJ8s3rY7lxjVqsoGJMrQc625LJBJ78JuVvFeS9bwm16Be4TRMGsFlh?=
 =?us-ascii?Q?oRKhmtqRCAClrh/fpPiQHQS2nj7tCWooUJAtMjlJjShg4QIxj1E0Ou6Q4cXJ?=
 =?us-ascii?Q?MxWyCaLwOGU4tnM3BnqTqfo7FxRX3In695fF1uadLEVxSx50KL68PUmuU2Gc?=
 =?us-ascii?Q?sz62Dj7R1XWQTK4mmoOva9NjL5hwX3b0Bp2/6PbjK5/j7/N17OHj/7TaVc7p?=
 =?us-ascii?Q?fRm6KCH19y75cYwA5iJUP0QwShvmSPsyLBNPsiyBtwf1BOnIZ8zQvFTZSL4N?=
 =?us-ascii?Q?qMk6DpYojqAD5yGQBh9KK2EI1NfR2T9U1a/qHwTDBWFMcT/yRAK2oI7dFuMk?=
 =?us-ascii?Q?bdRpWJOcvTzAIieSyfUOgrPFW28ncSio1bL+S2wtrdgBLp8MvnMcpXszIGQ4?=
 =?us-ascii?Q?RQBetsgolW+XWCRj3N3/Z9Ac17IHkOyoHA98AM84/+tGQ6FFqb+J?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c009f6b8-6b9d-4e8c-5226-08ded56e021b
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2026 23:35:59.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhWvdWKcNlWCzRtmVerMfUppsnipuJbAzTxaV/2XmCOdz72Nqp7dvTWUnxi0I2XCnPf+IrUPyP7DiTVrjjG+yVvir7p/tA/EIZls20hgvEr6Vb4oUcRY/iXLBjdwtOba
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17557


Hi Cezary

Thank you for review, and sorry for un-clear explanation.

> Does this mean you have a patchset or two that follow this one up? 
> Looking at this one alone, I'm not seeing why both ->driver_name and 
> ->component_name are added.
> 
> The driver is supposed to define _behavior_ of the entity it _drives_. 
> Component's name is (typically) a static part of its description, not 
> its runtime behavior.  To keep the design nice and clean shouldn't we 
> leave driver->name and component->name alone?

It is difficult to clearly define what does "driver" means.
But basically, I would like to capsuling DAI/Component/Card into each
soc-dai/component/card.c. Because current ASoC is not capsuled,
each driver can directly access to each members randomly.

Here, We need to separate the member which set via each driver and
set via ASoC framework.
The behavior and its name are set via driver, the others, like lock / link,
and other necessary members which is needef for controlling ASoC are set
via ASoC framework.

About component->name, in current implementation, it is set in
snd_soc_component_initialize() (X) if default component->name was not set (A).
But, if we capsuled the Component, people can't access to
component->xxx because it will be capsuled.

(X)	int snd_soc_component_initialize(...)
	{
		...
(A)		if (!component->name) {
			component->name = fmt_single_name(...);
			...
		}
		...
	}

And more, many drivers are basically using snd_soc_register_component()
to register component. The component is alloced in this function (B).
So, there is zero chance to set default component name for this
function user. So this patch-set try to set it via driver.

	int snd_soc_register_component(...)
	{
		...
(B)		component = devm_kzalloc(...);
		if (!component)
			return -ENOMEM;

(X)		ret = snd_soc_component_initialize(...);
		...
	}

I hope this explanation makes it clear for you.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
