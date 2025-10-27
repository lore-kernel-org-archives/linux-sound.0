Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680C298CDC
	for <linux-sound@vger.kernel.org>; Mon, 27 Oct 2025 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761548062; cv=fail; b=dDYCDH/awccKRl6oVc0YN9RzpBNe9UfLQG0x33cEn5DS6Qd4wKrl80K2zBqxTMW5ULI9fzDxztMNgxrmjCAF7IavuuKbmC8ZMAFknMWNEeoSRci+0mGKpyW0MMnEwLBEmdOKXOk3Y4UTAygvkB/85f7TE8etpxbfYTlv8OHPWlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761548062; c=relaxed/simple;
	bh=Hh+eDMaFxGNYbpwKEMgSW28iaR+Slox1AFG/zPoPPXk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=kuzfIPzu6LwUMBeVCpWriwQKa3zrb+k6+fmwKE6cjcK4fmDo5PhpjRlqCzz9XucoIVRyGJjM3LbZ52DFT42iAHhgemzZ/UHEhQ41GpwD4B60yRIL5/Zy4Ix3GDZ1cHwvSRZR+w16+WLuuGsErPmYy5tlsAaJmtOmQFSzPGmoUpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aecHj6Sz; arc=fail smtp.client-ip=52.101.125.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aecHj6Sz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZU+5lXtS+pVIqij3QPj5TGTDVn7IrsXFvYvcEo8ocC53wvPwDTX+UKHPc7bXDni9q7e44ftP9Rm0CI87FzMdla8MboVbKzZY5Qm6i54QDp+YQYX4YjuWoX5YxCsoq2EeQ+0MMxl/Bf5rtH+q1zz1/bW0LJreAHyTc9K/eR/9IJqQipbmI+ZRgJrjs4/JVTsja5uGp3GzpNpkxgOyimKOEdqNkgZPzSLF5NJhitTdHtV4s3/FmI/IHc77i0EkSPtZdusWJGbOM4AYkhPrW6bga0GVvEFUUooPGyGEjfYHT6VpWxj9Cu1GX8t/HYUQ+PKLY0TE0kT83w9+lQyUbqwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh+eDMaFxGNYbpwKEMgSW28iaR+Slox1AFG/zPoPPXk=;
 b=pgLayA4KSjq20GOX2trJc1g04jba0PHB4PxU0I91cnxniBRRpGLTTe0oRz8zrr5l+AIjfufQU6kXe2OWl0rXgtRvpwwE8zU4VUpnKkur4iSsUxv9irkerqEdASzKexfK0dnHR50GOsEFUrsXyawoDFq7DJgAO7ldZHXujTcUJpaG3qvjylyU+ZUdHGziixVsA0J1CHa9XF87mBNWd4fH9J6vqfCv48m1M42q1+FSo3gTHQbjgqWYF5Ek5xU859vwvmJyWU47hix+On8Bou/QFoYfPRcxyDBn7Pu9mhvovZnYpdVEK9AQ3243lgKoJ2PVElVbqFVz7D4eS0kRQzaRYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hh+eDMaFxGNYbpwKEMgSW28iaR+Slox1AFG/zPoPPXk=;
 b=aecHj6SzmEFec3BxBYf65o2l3sm4FoLIZ5QxaF+KXqwbW05TMct06HR1TVRKpxUoUjucPPwCefgeIG97wBjK+waRZmgkJczxK4HPfsAV3AQfVRGGmP3nhmueMiuYR31EoMEu57qPaRG+uUWEJE93j9O7pHG7lQXYhGLqDemvlaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8462.jpnprd01.prod.outlook.com
 (2603:1096:400:175::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Mon, 27 Oct
 2025 06:54:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9275.011; Mon, 27 Oct 2025
 06:54:15 +0000
Message-ID: <87ms5comw9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	shengjiu.wang@nxp.com
Subject: Re: [PATCH] ASoC: soc-pcm: Preserve hw parameters from components in dpcm_runtime_setup_fe
In-Reply-To: <25cbc999-bb13-453f-8210-c0fd38866d2d@linux.intel.com>
References: <20251023081404.3740-1-peter.ujfalusi@linux.intel.com>
	<87pla8oowa.wl-kuninori.morimoto.gx@renesas.com>
	<25cbc999-bb13-453f-8210-c0fd38866d2d@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Oct 2025 06:54:15 +0000
X-ClientProxiedBy: TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4769f9-f942-4ff0-1d51-08de1525a49c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?tPAUjZbQfq8dYckAdWdVzElNm2L7lFwQaqDD93BnXE4bJYlGeArM7KqAzl?=
 =?iso-8859-1?Q?xsH7tv1nIUcjVjm9Usre5TbR/et6Yo5asw8iSqXhgfRTjv1Knk/7sniULf?=
 =?iso-8859-1?Q?FIhJf5OwRtm+HkDUsCrczzdd62XCrnP7/xeWh39icHdDY/U7nAdEmSZ64V?=
 =?iso-8859-1?Q?iE3eY/rvyCvTMbIdi27+HElIhpH9qXRAc5Z5l8jxERlM+t/cyyNy6Lpjti?=
 =?iso-8859-1?Q?d2v4JTYA6ReRCZOrOu/zk53qf31SqF0phux7l/NVgKr+tROVThnrUfqnHc?=
 =?iso-8859-1?Q?rqS2z54JAP/yL7m8Gc86Rg2kwODGFiYdif1oakTNQZK01nRNx+oaDUr/kQ?=
 =?iso-8859-1?Q?IAjU24JK1Zg+Mx4R4g+GuzKLDz3qLj+3rWksrLi2ycIPbiPgrR5sG6r0yp?=
 =?iso-8859-1?Q?7lZ5qei7vQDz+GFQk6nZF2mpcQerSzAHneRPwCmZHAZ+qNAZ/nap8EAQTB?=
 =?iso-8859-1?Q?bd1xLCtXXmkWFVv6QY+05yf65S+C4FwLAuwg/kjR7T/oFZC/dKYGVJvxd8?=
 =?iso-8859-1?Q?UsKtCXjqW0JmJU3/t4WAkcYIiZ+YESMwh84aWCsrbw2rUSzD6TRgNzYGbM?=
 =?iso-8859-1?Q?kR3CmQ/DSbW7tOA8DiHuO0KH52XOwGKiqLJF2WaWD3XFZ6iJti/w8+/xT+?=
 =?iso-8859-1?Q?kvFQT0Htvp4+dKr75lIiaWoFSbGp4gpvMydzYXQuChcWD7sx3JEP8Br5Yh?=
 =?iso-8859-1?Q?oYGWCNTWkBPz8bLh35Aj85Hl2tlqiuefs9AIUrB7Mk7waOUiBcQmn9yA7z?=
 =?iso-8859-1?Q?z9AFXqy26ARlyfv+XzGXpcqsQ6G9COGFbVTjfNk78GRu3dKnQixVSGl6Y4?=
 =?iso-8859-1?Q?+oiBP9Mj41Na8dU4nMScKSzp3QLvmkqzoHXYdxrEBanEiNSgFmMRzOvSdw?=
 =?iso-8859-1?Q?aQMedsozijZsZT/l1BlgmOVv1OKpZA1S5kQ41Hf7Hu1v4diFL20/xfIIoS?=
 =?iso-8859-1?Q?R1T0qK/SVlzHxwUKIatMyRu0lSzYJ0Sqnw9WdRrWavlHtPJrlMORLKYZ9o?=
 =?iso-8859-1?Q?P4898jAI08akrLFpMMzvefSpWGPD2NXmGco3cgbpyTK+T2M7bInBUbX+Nc?=
 =?iso-8859-1?Q?lJaNIzD2BLAD/Ks4KOH9+8PJk3fumVnbotgZNgPNn37LKBIeMuwjMVVKsx?=
 =?iso-8859-1?Q?6LCKc5oOHRpMGZ5cH0ceELS4G6k2B6RudlIeXP6weTQ4Kx0rGyp3/Pfm0L?=
 =?iso-8859-1?Q?3lY2iFwDw4d012Cr/pfYQDI+yppAlxhT8rtCRBFD0Aaj+uj2eW1bJ6UNrB?=
 =?iso-8859-1?Q?P2KdVRM/wiDSThWu7EyPXM/4I4BlDhQsJ+AQ95Y0HS+5IwkAUVQF2PmEYx?=
 =?iso-8859-1?Q?5iv1FaF949rIMTisBzrA7AQgbbQBHT/ky13UoKXysktRNywPpnRhRyDuRk?=
 =?iso-8859-1?Q?bcQAS6oyITmVETffOrxHt/b4q4jsU75Jp9zb/OZkr8eyF3jJoYY+OCOyBp?=
 =?iso-8859-1?Q?A26CbSaGbDi/Xd33IJhws+HNmUWcISWr34glDzRBs3QKS8tK9FQyw+9cWT?=
 =?iso-8859-1?Q?6zKAQurf3+23pHze1UEYWuqLmAw5yxNCqSk3505Y+hQY5GGj3NY0cd/zG6?=
 =?iso-8859-1?Q?1Hd/E1A5BkCcLAl8pUcWQsjITbRA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?AQ3UYj/qzuVS5JGC+IpbFiMbHJEaoOyg1d6mBSbLbOFlYAdIiTYB89xGaV?=
 =?iso-8859-1?Q?SP20xxmCEmT3LLZbqu/n1HzLtry3QuV20gY3AufB38dsgc4xwU+M03ZX1J?=
 =?iso-8859-1?Q?TqFIotQTcy8X6DSm0RQEUkoUp4Kce7cdQUh6E6arLe4WxnQio+yVG7cjpd?=
 =?iso-8859-1?Q?NZFsxpupLQANIsBbOsHZ1LqEkR98I56aflbBKRS5sIS6YXhS0Jz2S5RVcx?=
 =?iso-8859-1?Q?nSwEaLLFJYmeChXNkWtf42UCxfdYF9tg7UFnFV7gjAqmiv0ABXInk4/sxh?=
 =?iso-8859-1?Q?Ih2SdA+V0JnZUwS7ja9N0JiEVfzCh+MWXcI8+pcKxbkk26ayhcl5UnAKWZ?=
 =?iso-8859-1?Q?jgPULkt0hg1d5yOn1GaR9vKDwWUs5HqPZz1cM4zPKqQTHQCEjaVQ+YnLbZ?=
 =?iso-8859-1?Q?lRT/Zpyl63wfqZk9m4F26Es3I/hqXR3/nWhRCAdu8Oy5n3mkX7NOTn/zoq?=
 =?iso-8859-1?Q?gVTIJtruvrt9XWJryCqE/W94ckt8W7cNaIr81CtxbBtbkCCcw3Lomuzpz8?=
 =?iso-8859-1?Q?OzNFgS/cqUexe+hvDbo2gZPKmS1/ta5RlOFqN9MBdMw3fdflUhgvv6c3KD?=
 =?iso-8859-1?Q?IODAUdk61ZwdHbGZKx5O5ic5TO8KcN40OCTcJ86Xdz7TaX0n48f1TAjJsA?=
 =?iso-8859-1?Q?BcU9jcA2vf/ZyqxqlnZUVv4Pj75/GiZU8R+64oaeqgRjR6KK6Z+QlSvr+M?=
 =?iso-8859-1?Q?ThRBR+vBOjueklymB9xxKkImJET4CwLYGYG9vgp91iZ3ZjAu4YVRlg2FXc?=
 =?iso-8859-1?Q?3av+5Niehp+tjjEOHUOQ1kclg676/kRdOq4JBvGqrpSLzefCnHBh2Kf67S?=
 =?iso-8859-1?Q?AnjGWDrFcMQEPlJ3/OnqoLDpD+P7cTfBXKYr1iz5JM24gJq15Qw5oT7/NI?=
 =?iso-8859-1?Q?H98wwzaAHkZkeFuO8usGNbdCbfkH4GSHbkECwUPD2bpaRKWEH+HQ4gYY2q?=
 =?iso-8859-1?Q?Wlrgp/5ceQR20cszq0eCPEmmRX1it3922u9XtRvcKiWQkH9+XnEjMHzNCh?=
 =?iso-8859-1?Q?CurTlMy//WoeEzVUTlpvOB01pzwfnlPBIY3NvFku5J083pzrvdTAx87YRI?=
 =?iso-8859-1?Q?8UjMerxk9+P7SqPKpjrC642CxgRTazbVz7CVrGkB4jUxygQ48VL1C49fx1?=
 =?iso-8859-1?Q?VMHJDKj+AUhiH0D8/aStQ/R+OlTWvrcBbh6jOElMmHU412+tx0w3SKcF07?=
 =?iso-8859-1?Q?aU7RZFPbUfjdKpj2HeYR+1Yxznx/fhBJju7BE1qc5N0WCqlF9fj9lNj2uq?=
 =?iso-8859-1?Q?uyKaIF+3V194B2deU1x5iAIJpuuGIOvBj79igjO2M4wFYrTCojqTbnPo7v?=
 =?iso-8859-1?Q?+2ar6UDWuHue/lioJ8P4oxLgH15VsnFkt7bsy8EDT8bRRoJixxbvb/dMvu?=
 =?iso-8859-1?Q?knMqyW0FJfXBHowRPLn2DLiy/f0/lXp+uj8dAZgdfTOOcK6bLZK36GZnDd?=
 =?iso-8859-1?Q?t66Bk8/Gimle2BIjAwmEtCCSwYx6KEGrGrZMdlGoD0W4RZE9fP8ZvfpePN?=
 =?iso-8859-1?Q?PnLsBnRgdtofF+U9WvSDfl2uweYcvx3rMSApzIUo6H1psJg/zvnJzTa12w?=
 =?iso-8859-1?Q?lkjzdjQj6gMJmPAUHuvUwLLI/EIZk/jBuVcClQtTI7+pJsT9J9F0E7Ze0S?=
 =?iso-8859-1?Q?twVNs9QxlYAeUsEkQcbfxaLEV3UHhscgKwfj0U956SpHX7qa7tob7KNCgv?=
 =?iso-8859-1?Q?h3Y2HCm52IE+0Q0wMI0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4769f9-f942-4ff0-1d51-08de1525a49c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 06:54:15.5799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkbiKBTtyB7A79alWTXYlFU4GIFpRmHSov8VS760z+BgPYkmeCtP2Lgra9oKz1/TQg3ccj/0n3imrTmE/NLlV3uW7sqFI+v4ri2FQ1V1+MBVxggPgdkuvZixaUxdFon1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8462


Hi P=E9ter

Thank you for your feedback

> This is how the RFC was done, but decided to not modify
> soc_pcm_hw_init() with an added bool.
> Other option would be to add a new function which would do only
> conditional initialization.

Yes, I have noticed about this RFC, and you used other metod
083a25b18d6a.

> This way we would loose the rate_min, channel_min from components, see
> my RFC which covers this, but it is using reverse condition (preserve vs
> force).
> The force boolean might be better than the preserve_config as parameter
> if the preference is to modify the soc_pcm_hw_init()

I guess you can ignore setup xx_min if "force" was set ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
