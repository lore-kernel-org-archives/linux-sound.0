Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011028.outbound.protection.outlook.com [52.101.125.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C9322611
	for <linux-sound@vger.kernel.org>; Wed,  8 Jan 2025 23:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379489; cv=fail; b=gtHDuac/Chi+Z2FWtvCWZwnfcnml17qzYkEZVADe7Cm8xa6z9IcMleF57IfufMOziiKdeOU69UdiwwZGTBxfyYcG+wqWgZP5ZqEbhGGomnHOL8n0US9Rz+DvCi5kbIZC8OMTkcBpPTDNON4CUy03N7B+i3XyvpZdaUxw/4/JBWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379489; c=relaxed/simple;
	bh=u0P5CX+NfUPhNTudSfJe6G03i03ibeMVtBybNWwXzHI=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=KtaVCDcCqfYD/f7QI9irPjAclU+pNYQgBGLx5wAjkFgdFEQGyvLrDtUl96yPaajjRNJCsT3r/GJ41nLRmTv77LyuXnV1o/Gt+I/sg2rUmlgaCii19tIHlB3GkohkiyfNWpFNUOQTsc1aJCN982ekVuRNdZk5KUFnoIAg6ih1Rfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dm+4XO+z; arc=fail smtp.client-ip=52.101.125.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dm+4XO+z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nA8NrD5a4Y5bDpl/Lmatw/s+iRpXg+ORqwE4oLrlLjfJ5xp9qyin57if2VjxJkbtqLCI0rUQ8Dws3RZ6TH79so9+5k+lG6scd618T+wiQsj3Diw3M5xKKZtle3oMerDwHIAIyfrcvS/3t2YSGp94NNyJXyo0sgzHRl+AGIq+xX4JbDLSMWJn/lXY/eqlU3sD4EEIXhdTigXRGVtcQS+tBmfz7peaR28QP7QS9EuoBtAHQVKQ3+A8nmv+0tp+UviRzkrKH7jtaKnLMMwHKJUAZUoHQxN9vEM6lYiIFs8fNuOtO1zWpgDgBkEkziuon00iDj4k5/3OLBPd0l3vYoIEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6szcglUK5IaMjTfqhldZvHlBRjZRle0i1s7wOoZaYg=;
 b=qWMCh3deVwJY3rWO3fbGo79bwgR+JVSLe1B86a+CpYu+V4pBqkNfS/fvLjHqQR5fIPlPsddtg2WepgIJsmZoN2axl4t5wEJvFAsJU5c3okjm2BfrESUv5QjSdBcEONsKzOKd8e9+sL3ptgrgnEyUvLNhp4rBAu/Ly6LPxyjAzSUM+rA1t2/YNYu7bI2ZSYNYm5TaKAXxErP7eBxnVpsthQEZ2DOUznDJ25VT1/X7JcfkDj3sN4fE0Y8fjmBdlvkSFsGW6Hod+Yu4TfQ/7MakjNkOld17DIqTmSIPBmQx1Bzw2Ny1f+3zHCHrQxHQz2rEz6AuKX/EpndKOC4/LUo7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6szcglUK5IaMjTfqhldZvHlBRjZRle0i1s7wOoZaYg=;
 b=dm+4XO+zDhTu8zgqz7TMXFDQPY4sSADcWUfy7Iw14N56OchSPoxAeZqEasAfGJGrvaCZV0jqxttdKfY/dGR30mDWK5lxwSkAyMQPWi089zlik/EV6lipUiholZnHUBwvfwLkQp8ITLUCFUCquY6us/XUM7IAR/ESJCBGz1nCRks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB9383.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 23:38:03 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%5]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 23:38:03 +0000
Message-ID: <87zfk027xh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2] ASoC: soc-core: add snd_soc_dapm_add_routes_with_card()
In-Reply-To: <c0c0d0a7-4272-4e2f-b128-b72b9f9f8f8e@linux.intel.com>
References: <87ldvmknrz.wl-kuninori.morimoto.gx@renesas.com>
	<c0c0d0a7-4272-4e2f-b128-b72b9f9f8f8e@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Jan 2025 23:38:03 +0000
X-ClientProxiedBy: TYCP286CA0336.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::7) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: cdae833d-b69e-49db-c1dd-08dd303d7e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/dYozJSGhKIxh0iB9xPdmfZ3b3KGcJ70soIzpcSrANxVn6ubaffrjPB6Tbad?=
 =?us-ascii?Q?4X1mfvJ9KhwfhsLE0hIq6Zq1DG5UBjZKP9bGBR63GRv1j9xU3aQauJGsdFKw?=
 =?us-ascii?Q?ijQurrCLQpBmA1EIVFa1GyOtU/IaYuV2iGxFpiMaNa6quT/4gE0SZyTOMg4g?=
 =?us-ascii?Q?r8dZnNDvAQAdG+VuhpSWQkWitW/mAgSf6YaBuSTLd0pN9o887E44dSGjSQ3Z?=
 =?us-ascii?Q?5JtYZM9qS0qvVwQkNSPrY7iJtsD95SzwZMayjvQSZLpbQYDbMUI9iL/0+PX9?=
 =?us-ascii?Q?Xwg0PdbQM+CDh5+DW5pMwgoyzzarmjoWi2o/KRB3KJGjxMkmf/8QI6sOclkp?=
 =?us-ascii?Q?LMSyCJI3+xQbmOESNIGPTpVJwmHAxQWj/cmUa6722wKbI0xE0caAL6vU0Vb1?=
 =?us-ascii?Q?6yFEEv+0Mzs9rihq/2vBmW39nnJFdHrycHlv5l0/GXYgpEgcwfilQKPzkfIx?=
 =?us-ascii?Q?fp8B0yO+LeucK/tykw13E/oFscGvB7MB62g4SpzZ0h8SlSfEnMVvALlFrPMV?=
 =?us-ascii?Q?5Zu5gwQ3So3+4dUwM/i2rpQ3Rx9CKbHFhPjpYEEwUlqOlTK4WfTrc+H7oUC5?=
 =?us-ascii?Q?8cUCXXWpzsDGJR9HKUwhfwas1cdYJAth6SC8b6yJcEfT9zQGtdmKP2bQn10u?=
 =?us-ascii?Q?JKnbCeO0S43oz53Wk5Bs0DPcRZI3sR01Ilcy2JkNxEvZioeR9S/pQTdMnhLx?=
 =?us-ascii?Q?9QqlzR2xN20NatPAlfPGBk/wA8vPzxYKQsEsUq3DolFJZFTFJ5LnpwcKll3T?=
 =?us-ascii?Q?E0z8P1lW92aq8l86SirLBiXtC7ziIuGzOduLztvA1wzzABmln83E2fUid0qx?=
 =?us-ascii?Q?DY28k5l5BjA2jZXZ2bDwO4I2NhulqENDxfsfyTvAStb5MyYfZPTS+jTbxqEA?=
 =?us-ascii?Q?HI9UODxVtGxgo8KNszhUbtew16K3sg8SHvMZNd1DnXgnVjQiFVeCNyErFQ9Y?=
 =?us-ascii?Q?HNNG450vbxC7Jyo1Q4189SWPtSc5ULCA2xVf/oAvNAad243KZNl5pRLKkgnb?=
 =?us-ascii?Q?oKg1BymsNx8uxle6xphs35SIUcMEIm4PrO3Bw/jsii+7P5SHQKFfcVA8NhlL?=
 =?us-ascii?Q?bpXUP1RI4xcfndCxNkkiuusfWb/hibvJ60P8iSQFFMkSupBgWGnU9Lssavop?=
 =?us-ascii?Q?LGqQ0aFw0fmbmHpwfqbSyLZ4pivtJtRB4FvHp0QO4Z1camZw943t0iMvIySZ?=
 =?us-ascii?Q?8F12DzlMVXXhtcI9MUMvKgXwUXFKlIyBGizSPR85fkJSYxYqbFAstUlEeqTn?=
 =?us-ascii?Q?Etq+I5G1imUD3hn5Jcujq3x6csP+VA7ZrSMXJgv9yICIE3G3iDHngcncmgc7?=
 =?us-ascii?Q?1/osg5DhYIT/gmBr+BRrFcGX3XbdEZrvBAxKCcnFtuiOff4p+iQKXSOkaIAh?=
 =?us-ascii?Q?cBdB/egiaxqsTZs3hgOlWH+7iNa42HR3duwlZa4H+FBXhvmXuuhsAcuz/qEY?=
 =?us-ascii?Q?vODS2YqHwEBzRwdrmZW7fqGEDilrdpXb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fQkyHaAw51dDlScL+tFo0l25uoKcPcy+NHuDTmgH7yvuOJoYnTFZqCC0MO4h?=
 =?us-ascii?Q?j7AlCjAiZV5CmjiICdXAuext3U/wqRgRi8huBiTP1ku0/dxLIXOtQsjCmTih?=
 =?us-ascii?Q?7gnJk8vCTEThIV4PTh2RFunTlZwBKHrcrvyP5MPjVQA7N9ITiuL/Kt2bsQlG?=
 =?us-ascii?Q?tnHMdleTpesPmD+L76vyL81zXujRrREeu6fiRsxscdzhNNPVptPh8SeLrnEJ?=
 =?us-ascii?Q?c/XcLii1+WDHFfI4mf4Onwnjulvxj4X1/TS11ll+ZrMO0p7m6x60Sx55HakW?=
 =?us-ascii?Q?qO3N6nupUDbvaQoSmJdeytS0VVFJl6xD3dmYhoPvJkmaxb4xkYGiIhJ4Kw2b?=
 =?us-ascii?Q?ipidTChsm5hXCSOXy/Dk5QITDSAt+MnMLHWjVth8R3y6cwL3fCIR+mFmS2QJ?=
 =?us-ascii?Q?3ne/7iF5SV29FsXt/u9pR8I4td5q8oKTT38mLgQD0Oz3yx5K/UUARptmtNnA?=
 =?us-ascii?Q?Wt66S2QOozievHUFXDIqX964caaOhXIzGnsfIhisN2tC1ces/SeadwZHXmIo?=
 =?us-ascii?Q?9VPmzvYABttBIVaFafjmwy8v9XPW5Bwv4sgQWwHOCaL23hOKMSELsjBNv07v?=
 =?us-ascii?Q?JCAdhWyGzDSMJri3HVAoHuqNgT7v0V25i406VxxCwy/c9qsVcTUo5DsS5LLw?=
 =?us-ascii?Q?aMJPDYiPRi1DKCzYv8LKSd3s/KyVTddQYxu8stDoIVsrT22XQ4HQPohTXL1h?=
 =?us-ascii?Q?UKME9Z8HrjRhigISvGGHEFa747X3HCp+SfERyWzrqn7Qxope29RzFC7BgwQ2?=
 =?us-ascii?Q?jYJomM9nG02hDe9J7JWZ8x5mG6DFd+SlZcAehgYy10gbkrWV3+Ejh6KXuRR0?=
 =?us-ascii?Q?j1cgibfTovLlyh2dIv/JMYQdK/MyY0zY3oR6BivG+MqB5xFlubqJzXVH4hAJ?=
 =?us-ascii?Q?hCXN8m5wVknLCtlb41WHTYkLCDJybMwTitC8stnENB5Eoo3vEpdkN0MjxgSC?=
 =?us-ascii?Q?04AJRsyqxlhFYsXnkKegggehqn/budvp3hYv4iykp5YoQcZQ1T8hfIcgW001?=
 =?us-ascii?Q?cytNqHRwI9pbnFMPZVmP5kqpxIUDA5JzTRj6NsTNsoputghxe8teYJSoaWeH?=
 =?us-ascii?Q?CDOmJkWLL3t/GFX8p+jbbBvk4K5fUN4S5t/kjVixdKtFPfdTloHj/8gipoWk?=
 =?us-ascii?Q?J0DUXih8V43/pmdlNfnatlz85mUCE3QZAP5cjBL3YNjgbC+fUGTWHQTNIiVY?=
 =?us-ascii?Q?Oj2r4dUa7RgYboT7tg9seK1n2oYO0MghjuCp7ioiv6rVu1/DfTozQmgp+hcJ?=
 =?us-ascii?Q?4aWjbg3KLpi2SCT4nq3FLPkslrYogS3TP/KDcsOb0BGn8M4mEMIDJZcTr7ds?=
 =?us-ascii?Q?eMBpuidDExuAoSpju7CF0A5kOxLtJ1tDY0shoG3SdYo4CW9ARmbVngIa9gHe?=
 =?us-ascii?Q?hpnCnYTijVNq5/KXH58F/aqbpfFVJfjHafyUkKFt+lwejCu0pKhUq+aLvdcj?=
 =?us-ascii?Q?fDiUphZSXe+nqbyxI3p61pbOtA9PqR/M8HBi/A7mk84dhYs82o3dZpqk6Ii7?=
 =?us-ascii?Q?rd0zs2vu5avVpYFuou/pI8+HMd86M5rqKI5/4ts9RaFvGdaUTTM8R+Z70cry?=
 =?us-ascii?Q?mOvfZrpUBRZvGTixrqsLJ0EXXPMBFgytcCjKjhbzYLeDWCoLwvpW5EkULCjb?=
 =?us-ascii?Q?wkHAuD/Pj9Qwr931VLy8nqQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdae833d-b69e-49db-c1dd-08dd303d7e98
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 23:38:03.2342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zovKG1yi3A2Gx9GAYf3NW6eS5rUi0Z3j5OV86N51CG3z/YT4YxNOkWKcvhV2XubI4Ta0rmQi+JxEEKPDM4duhcm9FeUAM/2mUQHDex2JG99XKdjJ9x5HFGfa2Mu07V0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9383


Hi Amadeusz

> > Some device want to ignore snd_soc_dapm_add_routes() error, thus
> > card->disable_route_checks flags had been added for such purpose. Because
> > of this, ASoC has duplicate code for it. Let's adds new
> > snd_soc_dapm_add_routes_with_card(), and share the error message handling.
> > 
> > We don't need to indicate error message on this function, because it will
> > be indicated from snd_soc_dapm_add_route().
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> 
> card->disable_route_checks is a leftover from skylake driver which had 
> partial routes in some topologies, as skylake driver was removed, 
> perhaps we can remove the field altogether?
> 
> Quick grep shows that there is only one board left which sets it:
> sound/soc/intel/boards/skl_hda_dsp_generic.c: 
> card->disable_route_checks = true;
> and it only does it after checking that parent driver isn't SOF, and as 
> skylake driver was removed it is dead code (it was shared between SOF 
> and skylake drivers).
> 
> As such I would recommend removing whole thing altogether ;)

Nice to know.
OK, let's remove it and clean code.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
