Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C73209
	for <linux-sound@vger.kernel.org>; Thu,  5 Jun 2025 01:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749087654; cv=fail; b=LVKw2hCGDy/xlzphsaL3OaEqLoolrmVTnGfBhYyQr6/as+I9rrg59ZxpeeoNGLHe67Vh6UYOi5/QwWNLMdWdINSo0yQMLkye+cDUMAfizlaU9rVkXTjdI9pg4t71HcFVIaFecVPtVxz5GrbPXsnAOyLooWeGmQBcNejksZu/cBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749087654; c=relaxed/simple;
	bh=h7Ib6nP8g0ZvM6vbyGwcnwKNBK8TAUTPmPJNFuYVIAs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l674jnS430uYajq6Fctl40zvYELvDGF6jqfeVMV3fXPkccoYCDEe70gLGD+AsA4BB/ROYnWsoLQx/JpYgCheBh0lIW5EK4oal2kYgsIzyCZgVsn/oC2zxufloMv7Wbtl1NfFulCfxszEE1nYRQh2a1afq1pdEue9vjQcTa/XwbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YlaADzJM; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YlaADzJM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wttb8um1AvNv0pF2t5ekO8oJUdHLDydZE6CA9pHnI+PY5fAzyq6ue4Xie1KnbdKtit/iSO1IIJL2dlUHf0Begml+RMSYfd6TA3J/vrJRfDaCvSqXE1kpi4CgyuFF2lln8YrD+89+bl8R+8AWWsZFNrxY+5Ny4RSPHO2Wtx3cdchyPfmnuyfM3TT3wTLMg7RiGANJZhRxAFnEbeW3TSgXJegD00i73yjV+YDYk4kf2uECHukKNQ109jxeigsdj+7ohLBVKJ3UAj15U8mpxDjYP6+P6KJuIGUh2v8sGtNQP7onirNp3I8ZReNGQbCAXgc1DRLBHmntZyOMf8FhH3q1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSZ3dNSBLNw5P85I16bZ/z/OypoMorrLc0l/d70mpzE=;
 b=ThOdUC7JAwZpc0WiGwreY8p1rZlsWkCwJgssLqkzLYRfA2/pe4SojPThoBbINIhG3GtmIBEDU3IG0L+2Bag5AFSfVIBHiFv0yxXHB62tVlkuiqo3L/R4KooF2aSmdwdV3H0QZRSwVDbbwi2qfIoFBuzwzSky3E1UQ/VNRLm115sC8lXtaV2PIi4EMZ5MRzCw/D9kxrMydkur6NDMRhtVR9lcxaQoowh1cVxbJtzG8YH/KA3x6Q5cfU/oX/F5uxiruEa4j2+hXKcpwHSnjPFlWaQZTePI0XOLkSf6ufmcO1argrUZX+121jS0d38KYDYe9revEQRROjt5aLh16u0B3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSZ3dNSBLNw5P85I16bZ/z/OypoMorrLc0l/d70mpzE=;
 b=YlaADzJMvMngOxR3UuaPnQzFfDcLIQ2Hi8nAg4L4UoMveyT0PJsmHcnBE+5YYdY/lgcoUoYedJMb2rHDHQ4I8kVsmuuWgfVgxZ9H0gpk4ymRMS7QVvMFi34WGjGzUUrffPdSqUsoCiSz0OjmoqiE+fNDLizdUmLe1PtlNU775ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6231.jpnprd01.prod.outlook.com
 (2603:1096:604:f6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 01:40:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 01:40:48 +0000
Message-ID: <87plfjj78f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()
In-Reply-To: <35983696-730b-4a89-a675-3e73fbde47cc@sirena.org.uk>
References: <875xhcut6o.wl-kuninori.morimoto.gx@renesas.com>
	<35983696-730b-4a89-a675-3e73fbde47cc@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 5 Jun 2025 01:40:48 +0000
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6231:EE_
X-MS-Office365-Filtering-Correlation-Id: 0057ff76-4f4c-4475-116a-08dda3d1ff81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K1wKBbujhjlbCJCZZZ7SjozZdzhSUGxKySbQxBkU2sAvKy55SU3S+qQIlVOi?=
 =?us-ascii?Q?kgBu6YK8/zNz68AEnEFdMJW/nFhkZsloVIh1k48shLIowB8hSSHvblRJDA39?=
 =?us-ascii?Q?9cdOEcMiMxVxBOXDSdF0U1Ymo8iZBK4d92E1qFHAE20I6Y7WIjYc+a/u8ZoN?=
 =?us-ascii?Q?FU3nvb1chWRfOy2a7cu8WRZqI71YFShustDJzpbWRiwuQ+mtr3zf0GXcR6F4?=
 =?us-ascii?Q?apg7Ok3tUl3KZE0L4gq8D4XE8bZ7CL0cg/ZveIYQAeZwuYbDQZXjQF3V43kK?=
 =?us-ascii?Q?PW8mi6BSR9KM+TteQAgleuztFhHPEKusmA6sg/M5+1tRr/pyQo4W9O06Zvm6?=
 =?us-ascii?Q?opu5MCq5rC9y1khON8hqx8dwj8Fc3IzmEaxvqDcqL3rWxl8zKTU2AVzCRdxk?=
 =?us-ascii?Q?+35grpZqm24gERnjJkTH9U7aAajU+6Y88ukgOp7HSpRnuYzmeZdXeyUnieK6?=
 =?us-ascii?Q?aTqzkpsgJTWMKiFMPM5RHoq85t0eRj+Y5bJOxEqU8lawek+ioOiykrMk0K4x?=
 =?us-ascii?Q?p+uQnnRgWvTMKBQNaN7DRh88FWWMKnzGUo4cJ87HWBnzOj6TKRcaIequo7dn?=
 =?us-ascii?Q?3rqVJdbVSpJ27JmzVozqd4dvPpr1OY2uPWDJYSLRQezVAYN+YEeLKPr0fF0m?=
 =?us-ascii?Q?YDH41Liy43zj+TgLHMwgDWAa4WNMgn4CP4EBv7R+67Z2bN7vsrAfbpySvLdq?=
 =?us-ascii?Q?QdtZ0vwCvyDvM7457Cy6UVF/R6j0MXpfM3l4UcvnqwLqeUuk1EOj8DF+bEPC?=
 =?us-ascii?Q?lDW/INtf0ATFasEMgBmiJc8095ds9RhNJ55vy6fWiXWZW+lWLAleEfYSFvN0?=
 =?us-ascii?Q?Y/PD+FCoDWWjnkZAhUkJrGLge0mSWceWXoyB9WtkWbWs/5NmkACwPsiJaolN?=
 =?us-ascii?Q?7FtQFQCW/JtAakPcsbNt38hKHTTgLgjmatrAEnIDDuUjKZzxoyxcHtKxFE8S?=
 =?us-ascii?Q?ld/7nXX8AqNcD0HiZ+Qc614fR/nxyHqYrPHWhADfrHS78NPh2mt6Id+a7RHB?=
 =?us-ascii?Q?6jMLWRGleFJldjo5VztFytj4uITUXCtwrTI+kFtP7hmoolVvSbG1pafACHDa?=
 =?us-ascii?Q?470EI6SK1NINyZ3+dgJUuZgQvoxuXz3bKFPfdalTTDGht8njD+HWBmR3NylM?=
 =?us-ascii?Q?ibG5eSQW+hVOCMgeR9b0C6jKT8EYTJ9vTnGBIl49kmlIcZ0DJqqPAERXkqBj?=
 =?us-ascii?Q?wkeScVA3SoehXzgHO+Npz0JLVZ2cKk1arZVKz5Iz1WtkUvnBcYf/tZytcuZK?=
 =?us-ascii?Q?XnkqlaE6mzCz1ZBN+lIo34QNbbcby05qt+2gCipRWGjy2Kobov/2kXwY9YPA?=
 =?us-ascii?Q?YYnXz4NIc3OPyfBBcV1J0Vxa21AnCbZWgPuSK5Y+p2uJPWocKYrLYc3gafnS?=
 =?us-ascii?Q?w7RJIJ80QRCGLZauwx5f0hgRfoEOrELRCnbnBCtMRbN1LP3wRBCe9mz3QMQn?=
 =?us-ascii?Q?3o86EHx1VWU26aGJKzfDgmcMZXXKJVoAPoS9HH27Uat4+L/U4+wFPdxoiUtD?=
 =?us-ascii?Q?jakRXuMkkxs1olA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XmgY08WHzU46bepBWXhvh7SpU7GX/Gb2yle+g1U+CX6d1O/yzAHJoFMAOJfg?=
 =?us-ascii?Q?nUdxiLwp+FJoqO9oY4tX/ZVnqACKMnQIky9miDVQ0J5MvH8afrZsmOQ4Wwz6?=
 =?us-ascii?Q?DJXqb6W4tEZrsldEbKfINCaFErL7iRd7r2j/+QD0iyepBxPYexdlUUO3CaEH?=
 =?us-ascii?Q?PgZZ0j++iWcVThj8t3zwt3KS5lYlvv4kdTUvNXLCVWavt+jVpOX20VIp48mh?=
 =?us-ascii?Q?zMv0I/pxl5Xp7bahUDdlAh4ex9ONYWU2ckXU0qp7At5BI2vS/jSSLDfcy4ip?=
 =?us-ascii?Q?TtU9AiwuDLdCFZJGx3erjGIxS2z9wZ8MXZ3zj9t51Ei/GQF4eAdYj8zF8GJ1?=
 =?us-ascii?Q?K5lw0yOBILdH/BCHxHIpppOe4ySwipOF8ydRFyzA0VWdsefH4LLTsswLjg3J?=
 =?us-ascii?Q?YHS4tyyO5Dwqpov79/obYq47qtpWeAeruyhx/07bSg7QKRvdU41+o8e6W+Po?=
 =?us-ascii?Q?BfhYmlja5HVgR8A0EO48r795I4/jd4sap4svzSIyLPQmnfP4weoe4Jo8NY01?=
 =?us-ascii?Q?NtsvUtQAKI8Qq6SWW+SFWgbbQwm2QOuRQ8qD3ZJ1hKq7wOTr7s+/csLZnET9?=
 =?us-ascii?Q?STN17Ycbtl8A8tPbZ/qskww1tp4Q5Gsm8yhFOnbRbzbVHOkp4xEJoLTu+txm?=
 =?us-ascii?Q?Bk/gKoxRyaj3nAXavh0d5adVi7neKYKSNrRwyYowRBy4kr3D84c+Pf689m5P?=
 =?us-ascii?Q?RK9Ev1b4TJWNSIE2jfT+XVmNvWF9SGebhweLbJZjXwGJnoVZwdfn/sLJQ6So?=
 =?us-ascii?Q?pANvkE8k9YigzEFlL9lLCXSnz4IN+QYsp2iJdfLx36brxZggmD2vYpP64D89?=
 =?us-ascii?Q?N1LR6n9+EBgptBoYabzel0VrhzL3PVX5KLF7Y6qyyNw1BCe25MeqhrVvdZoS?=
 =?us-ascii?Q?8vy4XS3ZU1WiGeEUf/7chX+iink6Q1Sgw5/JqQ/NS0XGCAlZnwwKIoo2HGQa?=
 =?us-ascii?Q?pyIqgoIjBwmIZj48+FxQIvwuCnRP94NYwjsZcct6GFA5E2e8hhFp7icOT3T0?=
 =?us-ascii?Q?adwl25efBRNTN8gQ8zWCH3ojCA2nABGuX/Qbk1VxevM+oN0VrqB+OPSk81jf?=
 =?us-ascii?Q?VW/hJydpWJ2CkfB6IsPCPAjww21t2N4BeHNRV5TkJwxLNE/ygJfZWiB/+hl2?=
 =?us-ascii?Q?/c6qPs30Dxsd09B8tTZ3Z0zvPi9+gwHgnD6EdaDhw7Q6BVx9xzxrCyxYu9Hk?=
 =?us-ascii?Q?i9iCYXlXTrU6Z2qC/HWrofCxwWgVOvbCFuKoFjMq6Nt1YM0Nyd7NOdSiUwj1?=
 =?us-ascii?Q?NugKYA4StOYa/smenUNgcCvZMim5RJOVcJUnZPFR0qRKHIo5kx+BRhRza4rV?=
 =?us-ascii?Q?oCtudPvja7SP3+TY+zA26XqXURj5rc465NW/RWyzFBlfZfrTW7kxFiTfCBUx?=
 =?us-ascii?Q?GdCMb+CCnl0nM+39DHiOHRC3mz/FYC8K9lpehiAaMWDNZfd6RVj89L+I6bx+?=
 =?us-ascii?Q?KnPwFxcyJq9RdJvQDtLraJ14JrjSPtm+TwM+Vu3G2cQaht5Vz0ALJ6G1Mgk7?=
 =?us-ascii?Q?fO307TyjZTXq8OqbQomKE6gJic32PuJAFR+TsRvBgQRym2JWFTs6M6nxSAOe?=
 =?us-ascii?Q?+sTw0HTGkV9hKWklEblUC2yOOxVsIVkPJBEq1wEwfp7eLBsaBiNOQr9NNgih?=
 =?us-ascii?Q?pY0YkkEw5iqgIsmGvN8bSeY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0057ff76-4f4c-4475-116a-08dda3d1ff81
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 01:40:48.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1nUUAD2coKDr9H0VxTWcC41Hoi0ETIMKBCn9iKxX1C6u4uihU/SW1df0U2v3tD4GIlZ+mp66bwLF7NmPbNY7j7BmlYtPjfKBHUz+SR2lrFO5wGXFgV+XAYj989gimwp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6231


Hi Mark

> > No one is using hdac_hdmi_jack[_port]_init(). Remove it.
> > We might need it in the future, keep it and its related functions
> > under #if 0, so far.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> > This patch try to keep code, but please let me know if is should
> > remove all.
> 
> It'd be better to just remove them.

OK, will post v2 patch

Best regards
---
Kuninori Morimoto
