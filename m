Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD86145945
	for <linux-sound@vger.kernel.org>; Tue, 18 Feb 2025 01:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739841280; cv=fail; b=H5jS9aL1Y0dFt/x+u7PZ+EYuwpTwqcYTfRMX5VV6X7gJDxBs1ubDF/w0cRQEKsUNWBONnEoxcMPgT3AjvpghWu3G3LGC2zzpxoHxGYnAl6nIpn3GMbfzlYIKKf0e8K6PBDGSh5S3R9VeegfLPZkZtttR+I1yiOkq55w8AK4cido=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739841280; c=relaxed/simple;
	bh=WfTUCADFPQgBtazq+ogBJ7xL/Wa7y0NH8kAxiW/Y92I=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=ckigR0RqQjQ0JIoX4DxuGHyHXJNVtecnBjMzufAk9PoawlmK6nUFnnkSi6gFX4TVFAK+2pO7yBHjrUJPCK5EdoN4Bhd3peDyeiH378Y3Tp+ldhMTXDrrf29SK/0hp61CPeWraO21tRMue5kbgGRSQ54iIUPGOp2lhg6iNKAXq7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kNfmFYg/; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kNfmFYg/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UF9VY3VbJggpkFcAjf4dCHsseGVzNvKOCD4Iy6F0y4EtHis55NJs8hOfvX6ZOe4qkLoQKh328cCiour2MoltuuXfB3U4XoSuMcy78BL1162cJhGCEhTiyHaDmSPvQOiOtzDpyqBQbGxQfkpIC/QPZbyQt9j60d+rQ137QuwUUKhYGMeep4FahUNB5TZoCfGvTGcEONi7xLxfnk1nEG9F7vvxKngfTedkUUBxvCB1fEb30hicEAGUDVJShdFF+vuCaF+FLG6qfPm+LGa21hc5iDrpnrrpm9UY1Oy4OYRjYo933AqPBC0hxVSKp4+klc4jCu250smEZ/7q9Il6nafrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqU6BW/edfM/J6ZgpvEQlXNt/yx/2SvxbE6jd2H1tYs=;
 b=q10HzDQKegl8ygRbkYI9RhlkiBR16ppqgv2vnnHR5w4WFzbF724KfC9nZ4D14qBcOUeuGo/x1TJQanjYjvEIwqJKjh8QknrnD8m+c30tzjHNAgSmBReU+XiGvJl27gWM+Makh9Fh0atoSqvBeiUrIY+uO0HiZnmuvD/y84eNXmM9JhRyQHvjelgiFStifqU+5Jv7Vmlhyuo1gozWi4Jg6ywaXya5/vFkGrghVazSwOJM2z61eFB2nbVC8Ru8h7grtq68dBI3vbjLJlbZR7aKYTl2kDt3R9Yx+yrIdvxQdPg/3mbREQZUvYNNwYBG2got0aMUfwvY9hH/ZUluE1uYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqU6BW/edfM/J6ZgpvEQlXNt/yx/2SvxbE6jd2H1tYs=;
 b=kNfmFYg/OD/8fPB2iYySscgVrBBVXhC2FewT8MQWOB7gXpCjymLHq+X+Di40pLroFsp+dTDYW15QeGrujM4gnbtY/LfiFspfKO3Um0ltpY7dMJDlc/Fy3hZtE/gPTgiS90MtXN4nKggSQK/fuxZW8OAJnQxB8RTHTSwB+ohJhAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by TYCPR01MB5934.jpnprd01.prod.outlook.com
 (2603:1096:400:40::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 01:14:34 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 01:14:34 +0000
Message-ID: <87y0y49hqe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/3] ASoC: audio-graph-card2-custom-sample: Separate Sample DT
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Feb 2025 01:14:34 +0000
X-ClientProxiedBy: TYCP286CA0275.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::17) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|TYCPR01MB5934:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb87e5c-b089-4b15-b95b-08dd4fb99ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hC39PA4vbElEFThQ/sdvV5IF9HFtq9YrNcMYOkxqvdQHBcREtBz7YVc46/oV?=
 =?us-ascii?Q?Qg9zEkwo3d3OZvZEbLF7rH2nNP/uPVoS449DIDxL26OKVBg02ZjQfugX7+ne?=
 =?us-ascii?Q?Q10CP7ZoOGBz+vzPnmtU5wg+ME5zr+XT3OxCc5SOP0CERlfrAN4CbpXPkWmN?=
 =?us-ascii?Q?i8BbSrMAjYsGxvsupcgLI06Efg7fW7QIzwnA3eSjocf374J09d1GRG8W3m49?=
 =?us-ascii?Q?3zD99IzFcy7G5eYNiBxrL2ONdf7ZasF7GZopmCzu8S0rqFZSRYwVlnK66/IB?=
 =?us-ascii?Q?0r+n0JRHDxc6WonaTeFxhbtMy3VNFCKttA5BL8AGJgAp/be02eOUa0eUQ8+/?=
 =?us-ascii?Q?SFBuwlaf1zRCZWCBBNLfy/R3Y69ylkYHhj9nCtCO5myrrobMxXcvDrt1Bezt?=
 =?us-ascii?Q?AbBOuw2N5WS8yT5RjvfHTmDHuNi5+0psPIQZmN0z5xfjZQOnlPIffXoxY1ym?=
 =?us-ascii?Q?Xn/QKkIJjx6I3BTbay7PoeV2HqIDgCEXTlTApEL80uihunBon8N4DzGbQC3E?=
 =?us-ascii?Q?52oxY2HkHBvMtoJirjv4V4X70qj0inHmo8pq+wrVZNTQny7BgAAN5pmMPPNM?=
 =?us-ascii?Q?suNdK/7GClh243+Y5wZpMFY/4Hhh/FpAaS1XP2bu26GcFlUdKuQ7HjSP578V?=
 =?us-ascii?Q?guwU0aUoIFseZlbWA0iT57VG56hSB3w4c/QYux5ril+13sD/uVDuIo8H+/23?=
 =?us-ascii?Q?lma3CtbIRP5gtXQc+XFCt1BEtVJgK5jr0B1z2qunyFqDnJzK95J/NpDaleiW?=
 =?us-ascii?Q?qvATjy/cVibePnpbF+BI6M05yRqwL1LbanO0ASso28OqIQaDoXnK3FWx6ZN4?=
 =?us-ascii?Q?XkoxP/4qBJKCU71RwujbRQLZ482tIGeLiVvhmEb0vjesobVnKuCqdlPqGZmN?=
 =?us-ascii?Q?gypVXkjIMoripQRPTGk16H1+QSbwv0QXXUWDsuOCNabis/0r8xjDxIQVFst6?=
 =?us-ascii?Q?tL7Sf+qi1HYxrL8+dOwkMOTc8JMNWgKRJN5f1SmfpuofKQ3jmGjKhSN1dVbg?=
 =?us-ascii?Q?NLVUPeMVy9DBN+341ErkvwLiZd+T49zuI7Y/phj78CSC5g2e4zlaTxvticYT?=
 =?us-ascii?Q?MYPFZbtl20EBn/Y16k+yvgioeJ+folhCQRQfZqGKQArMbC+/EVzPROf5GRwL?=
 =?us-ascii?Q?rFhYBAhpOO9X3rv80ti/FOwRXV9K0CtjWBsol094hjQWLz6rn0UV1u8PEJiZ?=
 =?us-ascii?Q?vZ07v972uJOfYFF0waRWUR+lMesj8FI1UZH0NHo0Yfmp0Yvu+GeQd2vCMNxu?=
 =?us-ascii?Q?8P/9WXMxZ3dcx23620rixuP+yq1HUqex1cezdKBhgzctBZKwibB4z1QqaCbG?=
 =?us-ascii?Q?ze9hE7knX+Z9k2ZlsuUOGR2cvpz2oL0zE+m+fHgG+pPQoD1oJgBC+uQf1usJ?=
 =?us-ascii?Q?lEx3eOLtOrDfk5XPDbtFMS3MXaGJ5A4uzDB1ksdwk5Z+9c7Q8BF4D/DANx9F?=
 =?us-ascii?Q?80XI1PTjfqJMIwz03u/XiNnJnO8b+y/W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?omiy+5KwKAmiqtuNF04kXLvUJjdzm0qamol/q848jUqXAbbSLDbYAAvn9oi1?=
 =?us-ascii?Q?YT+wrkVTJ8aRssQTHgwtIk/cD2P5qFegoPqHV1qQ32cYrZI3C8wA6gcoQX+N?=
 =?us-ascii?Q?N4puoUCv6C9RTJjVi+30PGGgc2Yn6K0LvJ1OgG2gL5jDAXd4TLbvb50YRXJI?=
 =?us-ascii?Q?j0RHQPfUpTXpuwql1INZFQuTAXtF/ubRVHCAXMckgajTMwKV3iF60vo+u+Zx?=
 =?us-ascii?Q?JdtrsE/m5c62hulsIduhh/pMwcwBCVz+Crpm3StXuu5ygCqEswtXkPlLa7Eq?=
 =?us-ascii?Q?QXSPhhftX5LB7T+0cOiZH4YVfTJcUuu9ZBuVn7sjLB38ijiOnfj/G6s+e5iT?=
 =?us-ascii?Q?aFCEWMoy90Q4pVpTT5aJq8djsOVYXHuw17Iu3TLM8V35u6jQkaZl7rdcmFU5?=
 =?us-ascii?Q?zaKDhH9kHTVfBRBQRAo9XK5BSx2F6Yzal33xu5i7eEdYEKhFYQ2uEH3A4ZX3?=
 =?us-ascii?Q?Dv45hmRhktNf2hoxIBXWNFVu38iS6AVRplF7kt4k2HEHqpfec5nZ3SIxnqHo?=
 =?us-ascii?Q?x28HBCKhZjRbzBbfJbNJkBodZNq5zqhUZVpqCMccCkgW3bhs5G7RQT3VFZKB?=
 =?us-ascii?Q?KCsxsd2Vym7eIZw3x4RcZTOuMgQfh3ok2meigQ7+R6+g+3StxGIPKJlRycTt?=
 =?us-ascii?Q?cqIX0X+ZYCsvI+EjABH4NsnyOwVf1hnk77/gMYsG0KUSg2b9OYj+D8Xsa/Gp?=
 =?us-ascii?Q?dXXb480TY6DacpUf8c701BQoDBoXyXrXHw5v+PgxShJRUZD/rOPGTZz3Y3Ab?=
 =?us-ascii?Q?3yWOD4PpMk0qR+S9Q7Wx0F+NxXKCbLS1eUCMVhKL2LNO0clgGKax3j3L29Jp?=
 =?us-ascii?Q?OX6Ia6JRUuXPyBg+nTV9ouRqTYH2rfJH7l4/5A1msqqoVBYLDpxQG3aJ57oh?=
 =?us-ascii?Q?kL5FHbdWX6TLm3t7F/F6LaSUqAcT8qFZ3JF5NRM47m7/W0f6g63abl5KiWZE?=
 =?us-ascii?Q?IC934qgJWuPz4POE2U4PT9qDXUcc8xEoZ4mcn5QRScN+xcpOxHhLEn6mdNGp?=
 =?us-ascii?Q?dNP5WGF5IY2DODr9nYHpZ6f1CId+6hwc3pHfSqFBVUwXzwIFNjWffY/MFhqk?=
 =?us-ascii?Q?BZA+xYoYwyF1DqNCB5VBrCYNmsvraZqVXhx9F4xLZoQn7GDvNF93gCSzjnzL?=
 =?us-ascii?Q?2V+A6keWhUhHixWovSYi3eSxnRwt6rL6G8o/6sMdaV4YcD/9h0ckLwdEZ+th?=
 =?us-ascii?Q?YktpfXmW0SfYO7ZNeiuAfAxA0MM1fgLF1Pjc6BClRDmWx+YX5ZSy7GrPQw7x?=
 =?us-ascii?Q?0ZgE4w8HONYOjbssoFAFWts1xj2smVxVKwK+qywCEMq9VqSslCqo7q0BAIdX?=
 =?us-ascii?Q?h7dCAZndsZz8KgoZryWkvsWfRPjzTQyoV8iaMZ/xqMAsxtU0FbiAwNdznwg6?=
 =?us-ascii?Q?mc4ItG6RxAggr/mO19jXA85atdZi93f+NIrp4jmmYkwcNUbidW7+TqiEPpCu?=
 =?us-ascii?Q?nA59fjCX/CzRtM6FSvpIGvXNxsXRrI1vaoH070/KUzERYh3Okq5qjannJbp3?=
 =?us-ascii?Q?eYbeYFASm8UcUjqoAX718nmM8zUd60PKbfmBl2peOr34kA0nQBoHBu4TFTeX?=
 =?us-ascii?Q?ae8u3NXxhnl7aDs3m8At0KA/3UHImBC0V+U99GWhOgum/ngEvb/4xxwZxUzp?=
 =?us-ascii?Q?ZBLW4kId4BuBerZnik5CdnY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb87e5c-b089-4b15-b95b-08dd4fb99ade
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 01:14:34.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrdtI7ESksffiGmydZGmuulyFyI3qrTTazGP7N9sKHh4iXJPLeR04pCY8zM7S/vqnVwoAq/CbKf2Ht0yugGmckJVV/g+UX71+ky5WBbrKf6HDsW8JxRK1OWvNF9B/jfW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5934


Hi Mark

audio-graph-card2-custom-sample has many sample connections, but because
ALSA card has number limition for links, it is impossible to have all
samples into 1 ASoC card.

This patch-set separate sample DT into 2 parts, and remove original sample.
Because of this separation, we can see all sample connection via multi Card.

	- for normal
	- for DPCM/Codec2Codec

Kuninori Morimoto (3):
  ASoC: audio-graph-card2-custom-sample1.dtsi: Separate Sample DT
  ASoC: audio-graph-card2-custom-sample2.dtsi: Separate Sample DT
  ASoC: audio-graph-card2-custom-sample.dtsi: remove original sample

 .../audio-graph-card2-custom-sample.dtsi      | 702 ------------------
 .../audio-graph-card2-custom-sample1.dtsi     | 396 ++++++++++
 .../audio-graph-card2-custom-sample2.dtsi     | 382 ++++++++++
 3 files changed, 778 insertions(+), 702 deletions(-)
 delete mode 100644 sound/soc/generic/audio-graph-card2-custom-sample.dtsi
 create mode 100644 sound/soc/generic/audio-graph-card2-custom-sample1.dtsi
 create mode 100644 sound/soc/generic/audio-graph-card2-custom-sample2.dtsi

-- 
2.43.0

