Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29113C2D
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785710752; cv=fail; b=HwaK4wfxVkn6LkPBf9hW6KW59dpLFsstFDW8sDEjFGulZ4Wd7ZU0qzKmvLXwNoQCKTfy91Rqxky4XdItiQSjGVsMFy/uXpypCuH/QTkRKUFhNwlTIv2z72VQ956/KAQZ//pNQhYH6bvHExV6Kij/ClbcAd/TbX3JYmTAbX6HQTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785710752; c=relaxed/simple;
	bh=aaEF+DkIFk+793gvbfzNUBATtgy20LFYtvuuRuYY89U=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DrGNmWPBrYKcFzBfhIj3NblBPYT8jsCa854e3NL25lSkzUaiP5TgC4KsoG8fCqTftw7WTdHCL92JebN8a/FSMB3tzhHAmNAqv8rqRs2sV0NXpYtYmtoeBmIchopqiRqpKGM1Mor+S0pfj9xkryNCOpr7xcCiaTYwa12nm+44ztM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bNEFDX/b; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bNEFDX/b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCnWOMdQR6OY4CfPT8HC+hoyTxAmE2sAJqkOoo4x73GccBaSJpX4l3qObvNLGwLrsvwZS89aFDYZfOVnlWlp0/JZEF1GppyhXwsk6UBPXQj8SLAPvpV0/KotLCU0PIVJmxKpUDf43OF+t03ZTqhb31CioZTZRwrsKQdpeZKKQ0dnLLnjaSNkfiDuo7MZ/grYSxG2HHz+e8VwCAsEt8JZRd6OVrXdfU/MNEoTwPLD4jal4bMl0vvFsFnyQa3zdNhoksU4gtQDBZ4kPZgDOYnNwIQ7mOMrWe+4ap+hFWqU72BABAfTTf486HmxPYSyoZZhNGBbuubFSyLvSIBB05FneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2jbhFvuZpgCkHCr4v6wsfALxDDja3j+bOxSZt+OZMA=;
 b=r8S9bmClSYDzPZV+jAY740/ZDbiguJjSCWMW0Qt3zPbBLUa6HtwuJfuPTQPyoGn9M9xgcHQliZJlg1tCSJMNx56ZT1PgW+cG0hGWu4thZe6ZNs279CBWNYWIj0C1z2RWtwXA5vzW0Lho9KdkSn4k02/vIRks37yV5Bak4n+CaFrh5YMHAZr4cproRZRYeeOrE3eAqHrHIVZs9CNI7hxtWDMQalSScOUk7siQnvKr0B7HAEulZomBPbbudOUlBSZVi9Z3ZCyBNdyRuvM/WduUH4Fk3bCAhAnrQNkUpMRdNKppaPUEzmSXJ/DZnhCG0ricj72HCbSioC0mKbvUzQYYVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2jbhFvuZpgCkHCr4v6wsfALxDDja3j+bOxSZt+OZMA=;
 b=bNEFDX/bF6a6zvNDcsCbPJqgyKwIP+itaql5Ec35W6s9nKBSQwoXij31yCKxHM8xnwOeIl+6748eMpDnXno9pmgWh3P8UXM+P8yt0B9vDtSgpXj9OoDPmNDp7gPRv1JqF52N2v6P5DcWyMdeHv+KSmVfcAUCQw6aGwL7Ooz1XSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB6652.jpnprd01.prod.outlook.com (2603:1096:400:c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Sun, 2 Aug
 2026 22:45:46 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.016; Sun, 2 Aug 2026
 22:45:39 +0000
Message-ID: <874ihcta3y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: renesas: enable COMPILE_TEST for Migo-R / SIU
In-Reply-To: <819c2b3f-ccda-4bb6-beb4-4f17af81b651@sirena.org.uk>
References: <87jyqbswp0.wl-kuninori.morimoto.gx@renesas.com>
	<87ik5vswok.wl-kuninori.morimoto.gx@renesas.com>
	<819c2b3f-ccda-4bb6-beb4-4f17af81b651@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Aug 2026 22:45:38 +0000
X-ClientProxiedBy: TYCP301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 9232a83c-d7b3-4f2a-974e-08def0e7c660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	P/oTdiO7kzMBq1jb12Edt+hcPd/z8CawvoOA/EpGCjqiTyyQmCm8mUznZiw1n/TAkUjL2i6zclnC9L6MWBfnVHrPyfy40cko623hWfxqjCmGKxUL3alOCChv4ujRkFSG2QpczjUjysrMux1i839XFrtqfdKuXPd1RX2C2wh/cIyyd8MqaONv+DfP6xYTKZZLmo6imXawBbQqSTnwZ66GPDhDyRCTidW8/vwJ06HPsdSUkk+9NVlVj36gSD1l++vRW4ejVdoWnzldik5efEK/nmAm3X7JLFqun2MoNJHwXdKAuydArso0aOyIzRZ+blh+CocIsBeu5+1aZscM6u6lcqkHqGhRejUpX4Xd5WBlEc1LYKrDKgPZFrsSIl0EIOGc4gHm7wQpiolEgQuFc8U09WRFJvu+jLytcj2drvS6poqkVA5/LehOUqH3QB5cEfrEvAQ3A5vXfY3nR0fkG/A3IJkl8GL8D3oNgzwaiOzDvPPv5R1jrkNeIPe3MTkIaRfPhURqdZPF7dWp6x1DxU8/nS6qHrOvpaYj1SYBK8PPfknBC6yStoLV6WRxE+7oBIDoFxV4RVDlbTFMwKXkGTZ9wbCuAp9gPTZJX+YEl3xtCB0J9YfPUHc7eOXh0dAlO/oLCSl089Twb0XP3vy7yiZr0k5MxbCYZrb6QUAQTzWaKMBX5nEVrVbIEJmMelzhUdWKrX4OZVFUNNvPx/bVB4t8Fw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4/QNg0zw3a6lHc7Caw0neuQZzk2R25eK4tO0qc2v+uYc1YEP6pNz84gnZPZt?=
 =?us-ascii?Q?9bLPLslCx7roOMz7Zg9u/+m5XGyFJk7Q9MyZWjRuSeCBg92FyJyf9gUvOZFo?=
 =?us-ascii?Q?aB2MI7iBsHPyDa4haOca+R8cEx6YUZytLq/MyvVPtmg9ngcjR7KT2ZLv+IIH?=
 =?us-ascii?Q?D4CkMTUyZoPeEDgLBtK7tBAqafu+YLs0hhsxGgnL7OBQSaWARPQ+I5eXpIb/?=
 =?us-ascii?Q?9C2P/rgxA5n2dUIu4NRwfFJ0MD0ja4+jj/wyiIAVg7LwcLEU9HYHtBPxqrHi?=
 =?us-ascii?Q?I6O70bF2kyAKR88qblUH7Bk0/IaApYBFIGoAFK0vnQkNpXmsgQ2LXy6oMN2M?=
 =?us-ascii?Q?98SPVatbrMAQK5un2tAdXKkNmUFSrcU4wMX57Chkvjy1iuR6j0czshiGUdst?=
 =?us-ascii?Q?ztG2MpRCBSlgoUJZPgpjzwZuseMKCMpjPgOiTIfHlruBue1vI5fzBWVYe6JL?=
 =?us-ascii?Q?bDlfVV/qRL/F0RUkq0TmFr0dv+iMfWbP0c6d/+KWxeRa7jaXfL0xRDw/YELo?=
 =?us-ascii?Q?rwWzO8NI8xHADXgKTm9CUQXUeOrD79bc43kDumiMLkWAOJs2nLsiK6L3+d2M?=
 =?us-ascii?Q?Rpk+RZgufyTsY3zQxORNfqzhOAUzjSdtyZ5NVmDdQveSCMEllkW8KLCLDWpw?=
 =?us-ascii?Q?F+T1c8A2o8XM9JlUPEq7liptYgBtK9qjNUNCBAp5chX2iPWKTiVP+j/VmGnF?=
 =?us-ascii?Q?7/GbxNoAjDLbhmI63U3XmSHd+73cVW0s878N3ybMTsVZTiLosa+v+dU0f7bw?=
 =?us-ascii?Q?U+e088ZfvRVY1OduSVzEwuAfFm9A63HX+qhumxhU2jzlDtPmzkDIxpLd4ter?=
 =?us-ascii?Q?/57oV2JAc1ckm/t772eDtNz9fR/YXlJYfqk3k+YijFmdJiw8sT/B61zHir/1?=
 =?us-ascii?Q?FHM8nFDCiEDYeZiaPweBdmQQUCpbSf29xRAI1P5D2TBxHMpSKvfkt98mKp3P?=
 =?us-ascii?Q?salSg3fhZXuuQvWmb2+w2J6qLFJohq5Bg2Kfyjg+Fl8jxa6+0mhbp7HRF/vo?=
 =?us-ascii?Q?W6KT8yN3ND5YgFF41fHegdtA/lMooSMhpJzvmjO1aQEbYSN620JFlhtbXOyq?=
 =?us-ascii?Q?DatmMGkQOt7w9AKsoxteFyS/0X4YpaEI05ycr3O5sFzoHkLxC7mx3IQArO7e?=
 =?us-ascii?Q?0hFtDhMxv6P/fJih8sY2LVmwKrURd14nLRSTlFq90aLe9LKWBbKlCTAiSW1q?=
 =?us-ascii?Q?i/o0Gc1HaKkRd7KCau3+IwTNP1Q7bftZXcM0THthgQRiZaEXjVLcUE3cxb6+?=
 =?us-ascii?Q?dP9g/mWD7WTMQxNDzNejdQbbm2nC9JDchrcZW4MR0oiBF86CkK/TmBpghkhN?=
 =?us-ascii?Q?o/WDZJrc9KFBC+apNYFGVVdzRMOFxOogDdOjljK4S+i8FndhN+b8XvirjpHw?=
 =?us-ascii?Q?oc2zzJDLY4f4KG5TTTfGHsP9/ml7HSZMsynZdr02a+Z78tGOsgUfSugxP8BZ?=
 =?us-ascii?Q?mo7sp+1AE/3jS/+gRkcl5HAR1US5LiSXRBHVTpaunvrUQRI4A6XCsxf4fIXj?=
 =?us-ascii?Q?IYy1JWdYjx9mZRhEm2CyyrZT+0ahVD5BGKUtPtozexXlGPTaP/QsS9FQAwKJ?=
 =?us-ascii?Q?7c1wwxspkapQaoau+VgNlW8oj12d0g9WlKWtRc2rxPNCI9pjioAle1ts1946?=
 =?us-ascii?Q?ulm4gA2CqHvlSVT9e4BEl3RM6aBBUNNFE1epxxq/9pOdyPNzdJOh3gAVUJjL?=
 =?us-ascii?Q?W3sA5VK/6wQHxEGsG8WyEQRosFHNG50tbuwPC01PvCNQLIa1AjviQnkwpS8Q?=
 =?us-ascii?Q?rrDRN44Cvm8hQpgOA1s0kCrboscVMM4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9232a83c-d7b3-4f2a-974e-08def0e7c660
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2026 22:45:39.1022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ3NHA4O6cao/QouSJ5vO4ICwFx4DsUhC6FQIAlcuilxWRzu8HMW+t6cn4KwhyG6zoKtb//7uMH65UGyaDRNgV3lSXtvTW5PGZvo6uJe2/OiLUO5QqNeZVoqV/dPRVB7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6652


Hi Mark

> >  config SND_SIU_MIGOR
> >  	tristate "SIU sound support on Migo-R"
> > -	depends on SH_MIGOR && I2C && DMADEVICES
> > +	depends on SUPERH || ARCH_RENESAS
> > +	depends on (SH_MIGOR && SH_DMAE) || COMPILE_TEST
> >  	select SND_SOC_SH4_SIU
> >  	select SND_SOC_WM8978
> >  	help
> 
> Doesn't this continue to need I2C for the CODEC, that's selected so
> won't have it's own dependencies enforced?

Ah, yes.
Thank you for your review, will fix

Best regards
---
Kuninori Morimoto
