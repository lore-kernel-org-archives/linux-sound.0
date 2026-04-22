Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011067.outbound.protection.outlook.com [52.101.125.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DED32ED40
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 22:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776898636; cv=fail; b=LJOzzgN5xJIcKZv6vpIL1jhvj/OvHEZ6hSiUFCK3nSYOxoVTr0yJ05xSbj5e/IsBZR2OGbjkkCAxcdbwJ15ll8ncu4AUXJayiQs9t6LJHmH5jVg0L+NSvGOQYH+rs5IxmXbA537Z044kAoS83qxsZ5n7Yi9guIEC8gAi97i0J54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776898636; c=relaxed/simple;
	bh=5qagFRQKRBZHWP6tBR4cWn2TF5GlRoa1PqikwPQ4K+Q=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=URS94caO1bNVZFvA9IKrVSuuPgxaXDnMLN7yMh01dQBWtwzlbDnnNT8eRoAdzVvxvUpOcB/EXHUU3ezwMFys30DZ+qwIOgFFt9ZjnXXPhlNLZkQaf/SpeqTs0rge7iaXb+bEyUvxXcGi0X0ueYrXViHVJ2qU46QosnW8ga+Kw4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bQiQjE46; arc=fail smtp.client-ip=52.101.125.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bQiQjE46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMOwK7VgA72A0RRp0/UuRrZ3uQpF03GgEZH6cGdJAi0jm8znVoa3qt5c+m0/IcF//Ee2SA+rodhq7IcGOTPYkqnuFByzzOQ7Uh+OJpwqqKosafDJsKfqhjKA12C48zKVYbmSSdR/xzJAv1qqOAYikjU7U7XJ0qUSt4LSUUyhjnq+Gp2jfdFHZBCQ9WLCiy6issJzDJM8j8fyUa03/q/PWj4FbvsAyXsiwCoILxs3ruuFTTx4AL1Bk0p9JCfB3F2r2Mbcmqv8MC2+r5zh1ktzOArqTvbdbm3a0ppi3YNIfQObZjFzffqysTRqjyjZXXhUNgcYwcZKGPytYMBm11JSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NInSTmKIarCZ8dKMaYz6xDV4CxWgQw/EpjVoWKT8Ezg=;
 b=JVMA6iDwXP1E+zTyD8E+yY20BtTSgcXM/pf0R3U6G5mRiByx/KSuibAucW6HVn0UIs0TSVZzcmCXJpHaNbMMLbYqszxdXzylHXdPG71DJ/ihPxNPMt3Sj0btsbtxv6XQbU9ic1fW/+T74RkfKiOlts46J8G0ZqylK/+cH2fWzF288lsmmpD4Juax0u3X9uIvK/0ioVsf1KvZsHqYlQkqGH/+1xb04s3wNUuvuda+e3lu+CpfouXBkD5kc9prPvQmzDTk+xhvWcjF4BpJtBoLHJkHvLbtX4qR86gbjvUvKuNoQGf4MibLBxbMnYANWE1RmF/HUqcengdl1/GRypge4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NInSTmKIarCZ8dKMaYz6xDV4CxWgQw/EpjVoWKT8Ezg=;
 b=bQiQjE46e2Gmg7WaD5X4zMTC75oKl57NECr6LRbMAJ3njEHT0vYkmXqKlE8nOachjR2+QiWqjTCYpfoQkrDBT/iCnSBx9/4oJ7XjZfFdPtCX5vdaDC22MZeDMpHdiUzG9HKq18npA3D2HZFtg4BoKioYrDga8hRmGvw7eDt9/PU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by OS3PR01MB6564.jpnprd01.prod.outlook.com (2603:1096:604:10a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Wed, 22 Apr
 2026 22:57:11 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9846.021; Wed, 22 Apr 2026
 22:57:11 +0000
Message-ID: <87340md2o4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH 1/2] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
In-Reply-To: <Q-gEHDxFQKq1L_9pbbzxnA@gmail.com>
References: <87ik9jk8kd.wl-kuninori.morimoto.gx@renesas.com>
	<87h5p3k8jp.wl-kuninori.morimoto.gx@renesas.com>
	<b7fb5a68-89df-46a9-8f78-e57c6ab093d3@sirena.org.uk>
	<Q-gEHDxFQKq1L_9pbbzxnA@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Apr 2026 22:57:06 +0000
X-ClientProxiedBy: DB9PR02CA0025.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::30) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|OS3PR01MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6e4e8f-8b14-4f50-9b39-08dea0c27ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LRd3p/SPHdCxsaAiqwNYSAvSL6DG3I7ooLC1g2ux3Fu+iPpJQXDAMii7tl7R4Tw4p/Y4DyyDdiAH/CYupLhcU8OVKnQcfqlgrON8mOH3h4VuqNwmJDiw8AMzxVqr5Qw7/+J5FmyJpJnoy3iDiZxjb7OucGRcnuAq2+LuVsWPUdCfnlEX0BgeXWWPSoJpyKgADlsyTSosNZVT3EfaO+52beO22HgJHj5vz4NkANXP+pa6up8SHPqiGNZe8vy6QNUg79B8dzdYP7xfugsxP9k1p2V5KvIDCgFDqNOblQoqY6QlownYN9KPvEoTWCcutAA88eAjtvX7xGkwIbmkumzDsZmcDggYhDF4f7LbYlydw1nR5WrxT0Bb4nIjhYHPrjVeegRXQuyOx7wVG2uacYSZVRxvxFirRbDmgZPySeOcAWabTXxjNCvijn3VYIJgH86UlrpSxQqVtUpVt1Jwa1nm8lQeaBD2Sx+mQy8Vo9RzXxqqZNDP+p9vWE3Toio/hJ5rnRPxGsBtSXqXrVsjePP2f+V7MeFCMzN1L6fhBuq71sPqQ9Sjl+Z8Egh0iz3kB+NnlUVsxaGsI7jlZ0P/SlOBFN19X8H+fdoDkOAMnJPMX8XyT93naznGPuY9XMedsSYFB6e6Ouq/L/VKeE1sskRxUCr55Lor4Wsb0/suPzADKoN/0czaWW/cm4t3lwj6oblTNV+byoQ74z46o8CAB2ZksNBbCeERFnjzg0ChPcx0HisV8lwzDAvrPxonCMiGc3jzFGkIwqiJNYkYk2ryzlDIGYML/5oRQM24OmfBQ0qHFa0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FE5z3xA2JfW+kderCcZoaPn4Gc0rOpg+tpMesdQZXHiecZTBIfsTXilIgj99?=
 =?us-ascii?Q?vIk8yRzztqBbItyBKms2+F/R2pD3MPhav8e/lIrxpf9nie4wHj9JJXyfYHGO?=
 =?us-ascii?Q?zbv7gCKgEM+jZdzko3uLqK+U3ZF5W4R1AiqcUWS/MhB1XmI8WClzMzR6L66N?=
 =?us-ascii?Q?CHIxVUWATp8GlagMg7Lny92uEM5jk32+BptKkWVnELQBsESJBPaY0ehktIY7?=
 =?us-ascii?Q?7TbAyjHZ31LbGfsq8yzct0A0w6bru3+4WlwwhFoSI1N9g5CgmUkKSjjznaJI?=
 =?us-ascii?Q?X9fVwqXPqnmCzGTLaYibCI7Tfx9L6vGlwgGOcdYWimCoXhCDulq9y8Bf8VXh?=
 =?us-ascii?Q?Uqs4N8sfaUDebLbh4wMCUSNLMoqa5IqZtRFytyLVFwpvsMtXFJlSPntj/Og+?=
 =?us-ascii?Q?7rP5fOGnGwQ4CIuSmCcKzvIHlWvUQg4k5EL73EDNOO6tKTGCw5P0fVaexExz?=
 =?us-ascii?Q?P9gRVZGg2CtbqxCDFt4yXwFPEjcdGikZh5Ww5SKhrRyOcT+dUR6D/Z8ll4ga?=
 =?us-ascii?Q?+0Zpmn8Jz7pw0+IJTFfehu+dd9rRzYcDrysb1DrAkNwyUbzYhPyJOnjVB78r?=
 =?us-ascii?Q?z/TuUuxt8ytyGRIJX68d8fIeEA1g3rSgL3606kG8g04RnHQ2wywyMycKPdVI?=
 =?us-ascii?Q?nkW4KXwuxezZMnppjQ3Pg3wkDxnTK8AGhC96hdbxdgrz8JUgv3VKUjwQpT/P?=
 =?us-ascii?Q?Jn2MqIHsL7A+8v2gk/7UjuYr7KCn5v4jqe+LgOxB5z+iCARsd2g7oGYm+hbW?=
 =?us-ascii?Q?MmaH7RhRh940gtA2nviXmYdcZKpnN6bjkU8Qp4IUo/hyGbBxmFifPpg/24W6?=
 =?us-ascii?Q?HjX/SjA265qMf/R8yNhPtsYGuM8gNcNwhZcM43TGY1JgUVrGW9ogvfjm1HvR?=
 =?us-ascii?Q?RvBjKs38FDVt4aB2q6GVXKaLInbaB6U4c7Wf95q77l2R0BwxhIRBmduYQmAk?=
 =?us-ascii?Q?od4psjmkxoKd4CDXZnhvYl0ACavF8eANkcWXTpwwYEHHaFia7N6IOmnS8z/m?=
 =?us-ascii?Q?p774XSMVo/fyodG9jiCznzWwGcsuoRkG59xBJAxkG8xEqXa0vU/9E7VxTOh1?=
 =?us-ascii?Q?98MDq5CBH7VSo6LQdX9w+WfX7FM8j4Zd89ufm0mPKvrwB2XL36Az/mB+t1C0?=
 =?us-ascii?Q?Ymk3NBYYgZ6dwXEtzVZTm6yLQ+qXUp1ANVlX81QzYzW0XVIi++ap6QfwCmi1?=
 =?us-ascii?Q?CKsm/m8VrXUP3ggI/SJCBSgGVHj+TsRlThVsFmQUDxJFcFqZg/9ABXOTHMEw?=
 =?us-ascii?Q?7ddj5CoLdshp6KlthWOxr2vlc16fXx6zauC1lBYDGYtxrFqB4jJUSeONK13P?=
 =?us-ascii?Q?rbksm+6YNOdwTgT/mkGuaI2dODQJg7vE3pIUaGomeyWYJZ796DlH5M7L9y2y?=
 =?us-ascii?Q?7WaGR/fvR3b2k2krkqfbA0WrVdT6T7jkie/P17UqCDs/mLnehXvdr5qF7++r?=
 =?us-ascii?Q?F/tRuD8wsYNKK/JAGExzZ0iGDRiZLBxtjgnuOVRZhXi+Ghd8wMEymsM9D2wc?=
 =?us-ascii?Q?PCOI9d+F/JMKpJPqYbrntrCwekcxaMFSp0Htax0T2arnaljYJWgjgSvEOABe?=
 =?us-ascii?Q?W6F+OWcSNBvgKasgLRRPWO21aCdliPLbwSmpajILzz66h5JCKLHpQ5M9Qxu+?=
 =?us-ascii?Q?bFVjqB3O8MIVZmEda7ab1dle3LRfOAsRLH88QIenXA04FCBmfGbAgttYCNSf?=
 =?us-ascii?Q?CVleTd1tHAPd33+g7RiXX51A+bIfVHgJrJHCNxGp6/kawc+yFEYv4A2LnMn7?=
 =?us-ascii?Q?00FqdQrHFdBObdwSaQZru4vonD6Fvzd+OVKoecWYM5aF2KuD2Rnr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6e4e8f-8b14-4f50-9b39-08dea0c27ce4
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 22:57:11.7496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOBETulCgvBzq7Kmi7aUOx/7Ia7dVJw5itNeuXTKcT++d0sArUL2I0PlsQW4STGyCZYykJkxplxnY/3v8J8u1zDwlcK7NlBR44jp+jWKgBYYXZ/JHkVPwrwTNX5LxoTL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6564


Hi Janusz

> > We need an update in _close() as well, that's getting the component from
> > disc_data.
> 
> Thanks for spotting this.  We should now get the component from 
> cx20442_codec.component in _close(), as we do in _receive(), and return if 
> (tty->disc_data != &cx20442_codec), maybe also WARN_ON(), or even BUG_ON().  
> Sorry for missing that.
> 
> Kuninori, will you take care yourself, or do you prefer me to send a fixed 
> version?

OK, I will try.

I noticed that it seems it is inconsistent ways of handling tty->disc_data ?
	(A) is handling as "struct cx20442_codec",
	(B) is handling as "struct snd_soc_component",

	static int cx81801_open(...)
	{
		...
(A)		tty->disc_data = &cx20442_codec;
		...
	}

	static void cx81801_close(...)
	{
(B)		struct snd_soc_component *component = tty->disc_data;
		...
	};

Well.., it is the same things, anyway...
It is confusable, I will fix this too.

(A)	struct cx20442_codec {
(B)		struct snd_soc_component *component;
		bool ready;
	};


Thank you for your help !!

Best regards
---
Kuninori Morimoto
