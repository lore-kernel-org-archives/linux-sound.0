Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4F118859B
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 02:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773021868; cv=fail; b=Ee3VEqvP41eTJmEeVSFXPacl3PwJIxjNzcLh9bqzIa96nlznbqTNh6IR68FJ1Qw5+4sZBIwmODKe0YfXn62uS9uSd5kB1vPW8tb1X7BZISj9IC8X9e6zZ8AP4QtsXbQShBSi8+baGYK/fk5AmtULpGnod7RvzlX6W6Zmzd07f+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773021868; c=relaxed/simple;
	bh=a+oeOf+B4g3N6XpDGONgIYOkJr5PWwzsOdWOwQWC3Xc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LpRZkPUSP8AkS1xR8ivgkIWPOcj9d/s/GXX9B4Q7o3iKMqIPzCN86b100OM8TOVOA9vYyKVj0Qv42qsQLdDdYQgG50O/73ee8Dl3S9W3H4F4OcpK4BIo56eO/ZWXXY6NP6UAoQ6ASW0KfKsd+O4gHYUjfjFngFuv2Ri/rMaAjRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pJeiOw1m; arc=fail smtp.client-ip=52.101.125.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pJeiOw1m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FABOTa+udW4b3wJN7MG97itnLje+iWona1yNZqdBfsPwIDF0Osx3+YX0sxH0/PODKuBrDjrElk5oieGiNrYOiEncXoRyhP3QRSz1DFSFoEkKqeN6Rt+aLYJms/YFJOwgFJGKhmVhUKspSwpSAVTfsjIMr9JB+p78iNz48a+sh7DyxEQtx0mPtDw2lmt+MmWOjGXx8U6yH4fLcBfKr1D+dO5EfgdfNcq42k5Zy4iDtyJUo07w7lNV149HaDixi1U4cO9zpfxQU58zD5+C+48Kk2JhRrEZ9VrgsK/KvfW+oW+1PgYtbO6vslfH9CFcHLj8BEreDoOacpsjtMw2SK2Krw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xz/mEeMXcW5CuWTjTrsFnV6kySyrT9LTaayA6ICtVCY=;
 b=NEQdPL62sJ0s3ah6C/vMwXMGPI18OV4vhpXLVBNjApoYbg5romOopZ0/wy3xzt1aEQuAOfOpmnjO3ohx4HO6CDxuNhk032GOdlJC1EwICfLmUM2pMDNqLVf9c2lHTdcKGu6DeLkZrUeJPKq3L4c6afp2mDza2bS62FVOS0qYDEq2sC6FEUlRXXDqQ0w4U35PjKT752Am0mo0WAEjgfZWD4hwFN90Y4t9VFl+F3Bkhftpynmjy6p1gbVElBl/vsizE516qMVUumg5zpcio/8m+MdSRkvtJf/FkEPQsfSIyl8x9ScbNt40F/UYhgtW2ngFe5Rzd6VmYXImi59uZbTULg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xz/mEeMXcW5CuWTjTrsFnV6kySyrT9LTaayA6ICtVCY=;
 b=pJeiOw1mj2YLjhupv37ToKylEqBh4xlidhhJlcPS//x9WxOyHQoM+RHYKB2y4mRuVsnPP1713f5JW+SUnnUDzt9zFUZdjVF/tgH9UOERdRRH1ruWN1J0wNcuIWXY/Qo1DJ986Wx740JduIA5eo/YvsgaOwu+4ZxlI/EOeW1njN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OSCPR01MB16445.jpnprd01.prod.outlook.com (2603:1096:604:342::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.24; Mon, 9 Mar
 2026 02:04:22 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 02:04:22 +0000
Message-ID: <87fr6921y2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-dai: don't use dev_{set/get}_drvdata() on DAI
In-Reply-To: <aasumDrXSf7rfOJv@sirena.co.uk>
References: <87bjh33uoz.wl-kuninori.morimoto.gx@renesas.com>
	<aamBtfjzkM7onEfp@opensource.cirrus.com>
	<aamGgjYd4ySf/4fW@opensource.cirrus.com>
	<871phxu8tb.wl-kuninori.morimoto.gx@renesas.com>
	<aasumDrXSf7rfOJv@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Mar 2026 02:04:22 +0000
X-ClientProxiedBy: TY4PR01CA0026.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::12) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OSCPR01MB16445:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b4ad27-8e05-43d0-6fd6-08de7d802e95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	ztaBWPe/jdmWicoK4gfFbHtseAKXRRYw6rUjrFCpQdcKv8VJ+9UnUErMHT2919jk1lzEncQmjHJ50pgY3r34NyrCM4B0tWGYL69zV0HZYst3fou3Mn3lkbGFDp30hWobPKCOGthERZZvh2g6NYrME4vkqZxggpQ/ew4DeJo/z1v3vDb7dgobxzfxw/OCtUJdV7AUk3B106Oc5CSRv1ACKiYHFmTwu1oP//msZGB1QutSrvDey6gKviMvCDVzH+v2jTG9ZyAkQGyzSSWy+O9SOwBj96GsIonNKjuLBy65vAmMNrVD2+m+Mq6cKT9hBTf3xFLPn5RIVqHzx1R1hY22+EKgAkLnUJE/RmwaITvvA/w6rrP3GVJkC2YWQYfXd1pgDr9RZiTpdCV69CIDp/jk2UmncON7eNuayrgHesHSrqGKwClMz/WbBDFJfBK1O6MKF2nopUR/yrF/lUUHKZUssQK4MK5dDyHwDveGMKHEDCXSVlBqh9LsBigajyGjAdGl5w3qKoAHn3aMxmJqd18MougS1yeAM1YHotLBOa/PYagC8+IQO3wbhPzJMI8/P/BvxPU4McCdFnMG8k8WJ6tIQUbFm+1P+cSsA+W9gzjngq5HsdYolmiGcw4RDpHVqy7nLOiGrgIOyKQC3gYGv7nAj6xLVgOG7DbqlkXPtUB2z93E3Dy/SoR/g05OSY0QOTj6tJhYJPLKG8Qrhaigyw59BQbxP21wmuNrzhbWbryUAtG55Mmepj90SjEMEAJrnosS8ZADUJSOGyvQQ8sw9nFThjjdpUyVwF0Is26NmUp9vWQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a2FCutmSM8owBJJKJKCXmsuAFHGBPIIbszIjdd03tGVA3kSGlfp9RSndRwha?=
 =?us-ascii?Q?YSnCwMrBX29Se/G38eIA8U5x8ZeRqf+/LECqYYw0evBjPsTlekhCDFfcLegR?=
 =?us-ascii?Q?eYclQobhCNav4JbMGU1uR+0DsHG8379mzLpnCzt7kK9Rc8NMUOzE6QW2r00d?=
 =?us-ascii?Q?ui6EYJ81by2lMaVQnptzlF7wxX/shx+/6rTaUgoQB1oKK0RjsqGsLUeIU/qP?=
 =?us-ascii?Q?LNtf3STpoRh36LsGj/RJv2PofI9ve0Zu56rkuN/KvU3KVpoBKOBraY6P4ZaH?=
 =?us-ascii?Q?QDgUigKqDMjk3t2BYiQe4ZtL/uwSRSFa6egkkZVvu6wLsRAzlZK64eP2r7t6?=
 =?us-ascii?Q?L2/BCq0E5sp2mII7oe5gkltCGBYeqkpx2H/RxCDu9r/fSksStwy916+XVAAb?=
 =?us-ascii?Q?Tyca26rnCH1SqJO2oi6iqqe4c/6pTsa2RUDFOo8joQy0bPj4Efz6kemFnQXC?=
 =?us-ascii?Q?/qIPal/q065hIev5jIk0DZG8HaSnoEGi1zUECSBvgCHM93HbxLWfQURYni2T?=
 =?us-ascii?Q?14b+kT2G4/NCOGXBDj/E+fwxVm94Xvg6ls5SL3ndH513VWNpwPrpWllNRAJG?=
 =?us-ascii?Q?S+rESr7xE8nBaBECNLKv6ztIo7cqacY1PpUT0AGVl/IVrfRGWcFwygIZ9QPS?=
 =?us-ascii?Q?PP81vPQjzA58qdzQbg56rvLQ2jNpilA5lnX8G+u3u1Nv0IiZ/v4LMdvvXwa8?=
 =?us-ascii?Q?Yk5o+uwVrKKNSKbt5X5FKkjKl7thTlbgbRKRt98iKmuIVbYsWIcQBCV8WPHM?=
 =?us-ascii?Q?eDOX2qVCo/+K9sIkVovBTvoqwCdi1e15w15bn19rj+2up4rAdvj732OF9JU/?=
 =?us-ascii?Q?T5a3uWEEhPzI/QfFb6vlbCiw+twlvMFY4XG9w51S5cwIm7tk3VB8qHLM93yk?=
 =?us-ascii?Q?I/o9z9ZZ6Js8dvhAuerjlKqHvxxgaIqboAMUckesUo6JWQSUnNLQnL7F3+iz?=
 =?us-ascii?Q?EpmWbpKDppGFTXWGuwkSiU/dFh9PAUn4LARwpcGSCE2YWAzeJmpXnXZHqU4f?=
 =?us-ascii?Q?dsmXZ3SZQSWAxXtJz3yQ3ThJZTN9QK8avmO6ChTubPAmQbPWe6l1DNM+Qd2b?=
 =?us-ascii?Q?ekg3F+TAj4332cs8kZHt08evqFga7osvm0rBXcS3WeNyV6ttUhY13qpWaod1?=
 =?us-ascii?Q?qHv1y4BDrCjJYiKAKlEUAFh11IKW/QfWip8cB2Fgw3BjuhGWVVVm0yP+tt1T?=
 =?us-ascii?Q?vY0CS56Hl1XXnZOZ9UEJYFEliyIb9w4E5jMGfvNjEU9VZJpon17FzJ5c2l54?=
 =?us-ascii?Q?6D19w4iwvtaPVTsKau2ZDwX5YMC+aIuG0Eepk2omVlzjQW7z7q0/Ey9xMpJx?=
 =?us-ascii?Q?bTqpG1A5rIlgg/6NY9cZbE4wDtYQOXYUjUUm7uc0DuUyi8QSt60p7HoXhrPq?=
 =?us-ascii?Q?zNNX2qV9El39VKqnVlmk0EDrGS8n0F14V3n5jMCKcxf+lphwQJwJ9G5zPUY1?=
 =?us-ascii?Q?iZxulLjoQO50fE3dUdHjh7HtIvn91jXKixminj6nUS6pt8WLeiJhc2WgVfWm?=
 =?us-ascii?Q?nbwb9jc+birNVNVv/X1ald/1kK68CwDftSRGPAWN2Zg/VZEJuVDU9XWj6hux?=
 =?us-ascii?Q?/pDxxap5sARZj56hEuXXBCMRZshNAvoclpIxSTQ29jIgZZbz9YCOBMGuUcmU?=
 =?us-ascii?Q?GO78mXKB7G2ZSOD/N1Eb8bJaniSo5xL8x02wz+bfVTvIBqsEdiRUmKAFouEv?=
 =?us-ascii?Q?DxCzcOidtObUFo1GWA9wqnnVcVzKh0QtTzSJpvSBdcQ5ZphUhuPdJqajvQvT?=
 =?us-ascii?Q?BcnySMDTJhJ5V2SQpbn//oF6vJ/NdytYY5VGU4HFxIrZ+CHGDC6H?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b4ad27-8e05-43d0-6fd6-08de7d802e95
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 02:04:22.5593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2HLtLDxJg2oS9fMhpoPqP+DkwTS0m349hhljgpYU4L6dFH/GktpNmP3Ap4218lr3cr+I0+mN/ArlaLka7sqERdSc9cEXGlE9+woOMWsMOrjjVCY4/tAoMXz4Q9zcX+N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16445


Hi

> > 	dev_set_drvdata(dai->dev, data);
> > 	...
> > -	data = snd_soc_dai_get_drvdata(dai);
> > +	data = dev_get_drvdata(dai->dev);
> 
> > But what do you think ?
> 
> IIRC the original demand for those functions was that drivers were doing
> a chain of lookups from whatever API they were working with to get back
> to their driver data and that this was before there was a convenient
> struct device around in all those structs.  With a struct device right
> there it's less clear that's buying us much, and now you mention it I
> can see the potential for surprises if people think each struct has it's
> own driver data.  Don't know what other people's opinion is though?

In my quick check, rather than setting DAI-specific data, it seems the driver's
private data is set to dev during probe(), and is used in each functions.

Because there is no diff between dai->dev / component->dev, I'm thinking
that we need to remove dai->dev (= replace to dai->component->dev) to
avoid confusion.

I will do like below.
	- replace snd_soc_{dai/component}_get_drvdata() to dev_get_drvdata()
	- replace dai->dev -> dai->component->dev
	- remove dai->dev

Thank you for your help !!

Best regards
---
Kuninori Morimoto
