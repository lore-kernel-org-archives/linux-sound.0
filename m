Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65AD1FC8;
	Sun,  4 Jan 2026 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767570142; cv=fail; b=B4nHgQkZ/I5B3gPfQoW/yh5Djiwhv4ohaxvAsOOcrYp9JipKlwuVwgZJw8QxdCQnpRHYmwYxQwrVxS6DO2gplz626tpbvXtU5p/dG1t06zL4BhVN+FGiFn3xhx303B8TFSzpaIHZaIPbX1YLf1l6iPY8IpUevonkPUK4m2IEZ40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767570142; c=relaxed/simple;
	bh=13Gn0cxqn5zW5qheXo7ceBOUvshpczJFrxKhugy11Fs=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=mz/yqAHKahbQQrJuEQKwwLjceFcjTEvX5rWAH6MLlIwo+bg14Tc8xR9rj9/fBZcdXy7aST0koXVxcZTZvOuqdaJt0q3ruRKjuV5FqJx/oJN+XyX9iCL3vUUqPvtaU9BulolmlYVbYGvHD8i2o3pBM55aL1fVbireqbnhf3GWe5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QMI1IGgj; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QMI1IGgj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irdk3s3YVv/q0FmFyZh9i71l6BabDdxi9yA3EpmZSm5hcVg9BpGZBP8t1H4epvrSHzQnk6+zsdbCH+9/mE2dgRgxeUNNzO6GkayczVvIpw1XRMTxasM60vKmtBFRpiveSvJRSnmJuO3Zccw4GDhMu2oRQlp9Lh/i79dfApvuNbwqh/KSeUjMpgs3JH2i1z64F9uX/Tc0JcxFxUTSnEZpuJo9iGcliHD5Py0xX8mVZoM13JPMSQAIn8+UXnJrMoKdgfaEhkLMq0Pdhhyc3f6vISfDKsY6pJ+a9OVx4t8Lnpg5E5h2B4/2uHikogC+AfjtemWcYf5u9VW8Ultv3S7ItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2GCTVcSrNMSmapz3QhhS46RSv97htJaj/eqZ/dIJEw=;
 b=EjJg6DtqlJHXIyPf8LN+3XZYAWlIALTBpkjbtQGQvZ0N6FNLaa1S0xAr9FWtUaxWmBRiTottmfPEBAvdhxb+opWcwaFrDTxssp0mkw1TuvrsUVnYYayWOdWYAQsnfiAz3Vdj69Vzr75q1dVGgYA9vOKhl9Od6RSzozLkWHOeXzOwUdPgS4G1NfXkoF4FUXx0zAB9sYzQCSleOoSzqABvE8C+ERg4WOoQt/Z06E8ODwr8LnImTfQ7dwo7XBlqCQd8NlRd7CJYGzMaadMXCZdONG37cK4DMRkq9XlGkQlKWN0WbKHeGLxaVnTH542HPgG1IarrOUzHUh3rGzU/YQ/81Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2GCTVcSrNMSmapz3QhhS46RSv97htJaj/eqZ/dIJEw=;
 b=QMI1IGgjojEt7sniXyKZRdZHuhWPbKgrEr9eQ0TmKshoib3yu3tz4jFYqVG/cBVS6PBft68salD1F3VUd2ts83urnUcz7myzuo30IgCDSnxMa8vEPqS74OsPJUmZ2dzztpCyp4p8xCs22bXqhlU8+OEZfVs5EVDxvXwJzupD2hc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS7PR01MB15142.jpnprd01.prod.outlook.com (2603:1096:604:36e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Sun, 4 Jan
 2026 23:42:17 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%3]) with mapi id 15.20.9499.001; Sun, 4 Jan 2026
 23:42:17 +0000
Message-ID: <87secl7xnr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: simple-card-utils: Check device node before overwrite direction
In-Reply-To: <20251229090432.3964848-1-shengjiu.wang@nxp.com>
References: <20251229090432.3964848-1-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 4 Jan 2026 23:42:16 +0000
X-ClientProxiedBy: TY4P286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::8) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS7PR01MB15142:EE_
X-MS-Office365-Filtering-Correlation-Id: 172d64fc-4276-4389-bbf9-08de4beae4fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RQ6thO7jdz2rjtsesmJwGFcjH3qN+8B4d9rkhMGeomfwYkrEkrLtKfB/15kQ?=
 =?us-ascii?Q?s7PCTVTobL1SykAIZkDa4vaENzNYkfTd7t/1U2mXFjOTaoesU0W3GMVJokhW?=
 =?us-ascii?Q?0OLxWDy1sTi7aayWkt+y/esAVsYJCAgfYm+NmVxHV0V/jiILZSCIPRM2u8ua?=
 =?us-ascii?Q?pQggLBqsc6Ig7UZTE/NKMshjNgFb31/nbZX6ryTHodmI4dWRg0Ju7gkicDSM?=
 =?us-ascii?Q?hNPyKUzhw/uu9zCYffD6blCuJ5aZNE9bwedD4m0F+leLYd3zSVKcDZ5hwD62?=
 =?us-ascii?Q?kN38yeBHFVEQpkfDCnW350SeS7sUKFo28Vd1becnUppxlTF0HQpcAsWaMFMa?=
 =?us-ascii?Q?fDNuxfbOJzLvXlB7fVFNmcANUpzXbxY24FsdzLEkavsD5hE0uZnSUXAvTDYG?=
 =?us-ascii?Q?bXTIU3DfxdlM+JRsyyVLajfwp6NQ2QnztfDqFR1RzyfxyeDdOv0y8rhrggJ8?=
 =?us-ascii?Q?WNp/PS1ekTSGX7/c63cXR0FVKPJNFR6FTvqrp0OUeSMHvIBbnWI3apwK1HUL?=
 =?us-ascii?Q?VOV7l1JJQHYrhgp9BFsscu8crdhcUlfIUZl77/2noUj7/4EFgYFAnZRMxD0B?=
 =?us-ascii?Q?hjNO+Hwd//VFWvh1Z5SabcI3iAT7kiINX0P2QJTiILuFGtawNKXNV7sPcuRP?=
 =?us-ascii?Q?7NS7m2Z7A6/Si8bKXFj+5n4NAU+gC4Q7eoQYaDqdHSz5cS4ewTd84L0lEyr/?=
 =?us-ascii?Q?Ii8cirCNXGcwGVNFWf3/Oq3G4HXEBIe3duM995qnbRqqKsxoEpuiN2gKdoKP?=
 =?us-ascii?Q?Ulz5FbOtH7LbuEorwN7/uo6y70UA6XZS9uqgfThiNCoe9T6X+swkeJrNb/uh?=
 =?us-ascii?Q?Tj3ngNqsSOKLwwxA/db9o/DUbJIG4LIYPGl0SnsoKo+XefTwsKJujo8vtHbC?=
 =?us-ascii?Q?AcQuzv5yZso/F3qvLJfMgEmKrwCWFwNUR+wf3BwSpUodYcIWRD0g1iiSCmbU?=
 =?us-ascii?Q?11XO+IGps2E4ZdPZbC3IiXykuS6QYEroHhaR+pDaEWVOnvbecAqPhfjCCVBO?=
 =?us-ascii?Q?COdkDaGNxrFn8TU0pPvOG9eblSgC2uPKuLVVTqBzOVOgZZWbwfbZuhBh8dqH?=
 =?us-ascii?Q?njml+uqBuq2fN/ggENTmFYAdu+PosB3E6HVxsO6Gd6v6bgmUnvpho9xXHJrz?=
 =?us-ascii?Q?XX3eVak/SuT/7Mc/ylHGZBdE7jD635taZ79KbiqDi1hKXjet6MmFYrBPL/Dw?=
 =?us-ascii?Q?IXwc6+hrxiv0QfOwb1ylnEU3NNwERsImI2Xo4uYO8pkRClkdxIV7EojXhO4D?=
 =?us-ascii?Q?3lt2RrLzkx4sk7RyMmnPbtjSX7WVQ447XHXSL1Rgga9Kv2+n3Js+hfvQdG7N?=
 =?us-ascii?Q?eJFUyEu2q+wu1gC8qNwqLHaBRzaHrlViqwbAEs/sLXu6TK4hjdFts5uXmjhF?=
 =?us-ascii?Q?gGxRV8WWHZJ3UBkHf4YeL3uOv3QmYrB74tPd1OXaLgSG2Pj1pwDJwHkrpaAx?=
 =?us-ascii?Q?/0oEs0RvNfAoUqd5dzlBzBddxRXO+6pAmCHFRYSRGzZ5hzZa0lUSHpwpcxU7?=
 =?us-ascii?Q?10J/HGf6ptSjn+1AyVDpBf9hZmzV2NuHmngQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XuKCoEPzZ+sf2nkI2KIxO139oVWcKVa6xaoZCkf0W9RuN1+8A7txLwafLwmh?=
 =?us-ascii?Q?/ujDUK7zrCMIdyiN1t17N2IeZBLV7WvpB6IiyqZcV9AeUzjjf578FJ2HqUkW?=
 =?us-ascii?Q?R5whR8es03afjHm6+D6APG9YojKFi6eoajcRnkhrSvqUNC85dITsr4aRn7nR?=
 =?us-ascii?Q?6VFsairFt6ea00C1W7QsNA+p4rRx1h/cdQX56qFmBgkYXTpckWBwhQI4aKCj?=
 =?us-ascii?Q?4NeSsJ5ELTEqSC9OBvE7T+J5+zt0TZ1f/5UnyV0cqTFN08aX7o4mqMtewgkn?=
 =?us-ascii?Q?PljkX1OBCYFe1wRIdXcyUwiLHg1RZIuWdLb4QgK0lNAYxgsRrZ+BJzBYduTX?=
 =?us-ascii?Q?jZOzvckbUy2xbnJweacRg7cdFi+0K/1xdx1qh8RjSUX5Okl+JdmF9salu2I9?=
 =?us-ascii?Q?OCy+LGZWi7DxRO2esjojBW5bApJEtHFvx2UBhKHZLoo0J/KwkNiqHW5lZ0ez?=
 =?us-ascii?Q?vUTr/VzdhxI2OTyu+p1IrYFuU698H3ysuNLww6A19KBGPWFDpy90xruVWIPn?=
 =?us-ascii?Q?jXOHfUJZ++1mT9dw1cRDjiyCAZKgmd9MIMmrgrNVDL05MgA0NnojT/nDVOSn?=
 =?us-ascii?Q?3+XASAs9qJN2DYGiRH8+jfqF1AuOntSJf2r1IJaqZTk1Id08WuVxh/i7HLTk?=
 =?us-ascii?Q?0uAjFje2yq1tWZS0+ZUuEDX2Wk1GRPckFRxWbV72cAInAJg7RozKjPZfiaPy?=
 =?us-ascii?Q?CFnrgDJ5AJQnKZXxWxtwtwa406EjFDq7mcJdCunrxvQhjFFGeEGb4t0s//lG?=
 =?us-ascii?Q?nqteSsg/pqqHSGTu2uL//zH/8n413VO6Ohr0/HNTQca4FHsSC1xidDEjhMSC?=
 =?us-ascii?Q?pbvpZ83YV4m0VPU0JaWhU39nKIaXIwzoBzSrydyDhEO9da9fqqfg8Cc44rpz?=
 =?us-ascii?Q?cF5TS0X7MJNuH96VS93113SocMca7RMGq99pc5yjgfkFcOE1Wwu5TsQTUCwk?=
 =?us-ascii?Q?iVfjt+1yZWlWFl9wLhr78s7wbpWBzse4SGBmwqkalhSVm9EgJXyIu6clZXnV?=
 =?us-ascii?Q?CEw/e/ASaVBKV1jHZWcpMoHWgc/IjAtiF/EPJJljLJf1x5BzKxd2AZNU9T9S?=
 =?us-ascii?Q?ryWr35tB8K+qjnHBSQ65PyJoyx2ib4y11I8r6gaBWLtQ0DDGgllKCEPBQRGK?=
 =?us-ascii?Q?cl/IB6xrToBx+j9X1lK5GD13c0M9GTjgLTfbQQLQ0qmPTQUhYwSIvv+UnSyZ?=
 =?us-ascii?Q?Ttmkj7szpipQPM/RpK+XMxaXen96GydcjrFSRHoMpWPtSu20+CTUwEQf7xMg?=
 =?us-ascii?Q?MDRJhMet6sK/WewXhpQCoGp8PeI5D/AnNtIaRJApZELFYK5zms+bYXLNmbGz?=
 =?us-ascii?Q?s+c2h5zcKP90n7rSMZ47fW6+GJxfpF0uWl0cAABPcsLcaITK1AlKVDx/x+Dk?=
 =?us-ascii?Q?hGKeXOkTa7O3dwr8M9nIOEP0mcWB6xLRx8bNvcWj9vhKPcwSqIDk5JEizlwR?=
 =?us-ascii?Q?2fn3K4+VjUxf7f/QcYYJxGOhE78GP6ldDR6q6F4oTK1IR59PBw0WYeg6PN9r?=
 =?us-ascii?Q?PTuI5viv8+V+ll6BuMQ6A4MhpvdPfbVz9aMl3nIwC9MgLCIhDApCsrAl7UEE?=
 =?us-ascii?Q?fMX3nI3LCtYZyEJlwe7J0ir7+rZ1wRs1UBT3jw2nq29G4dxM3tOQtNMC340J?=
 =?us-ascii?Q?N99jNr8zCYMxh9VGFr6zhyso1Tev1iF5pkmH9/TqsLeLtDtpjMNKm22wNHKl?=
 =?us-ascii?Q?9/1v9nujzdFrjrrBu04J2hLfqccmNr/1b5QZggObaR+RD3c5hYOS60B3+4yP?=
 =?us-ascii?Q?nkZV3tg1sDPQc0s/qzrrAmUlufgBXCd+yuZVoiK8Kro4gyKgbil6?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 172d64fc-4276-4389-bbf9-08de4beae4fb
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 23:42:17.0837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JZ9grP/vWaR5kjY3wa2188+dF6pBrwf+JSESwP17BoT5957HHym5AR1L6en98PCz5uG07LTN01kwK0uDAxLxMGVxu/bCe0d5BGAq+HjmIEVnIt+MBkStsmhsr6wAq7nH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15142


Hi

> Even the device node don't exist, the graph_util_parse_link_direction()
> will overwrite the playback_only and capture_only to be zero. Which
> cause the playback_only and capture_only are not correct, so check device
> node exist or not before update the value.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
