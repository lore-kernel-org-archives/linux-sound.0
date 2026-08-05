Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013082.outbound.protection.outlook.com [52.103.7.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A253E317D;
	Wed,  5 Aug 2026 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915944; cv=fail; b=W58eXSVq6dglb0Xp3eJzKfvv0dkmJ+yylslXj82Iny/ApEqW3x6adoW5SIutJ0fSxTZ1lg9UrLaX6RA7FY80wkPHbPulF024mPPd7tyPx9qBJ2hRGQDvv7rfPn3+tycsAmMQI3YO2mIMKrRbIogoK9I0JSHuAhBtGOo75T6oKbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915944; c=relaxed/simple;
	bh=fKsEU9ZZV9Mh97kuUe6/sZ+KIEzOQY2bAFS2NI9H7s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M+h8EMwNfyLOj5FJXAeZcCHo8OlAP/yIiB4sq8OLIoaWPhH7h5kIpUxDu0JYASGB98K/bLZbaQ1w1acp76jPmN0j24JDq0No+eEBDepoVEm1vT0If5rB9LvHxpjTxMaGTOBu+v7i4UBLzw49AK31VUExerJEERl0fR3/HMU/bFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=JEwi3kHC; arc=fail smtp.client-ip=52.103.7.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="JEwi3kHC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwDtspjj7Yh/x7slb7EtnTydreb2ier/nEdr2ThULEKm5xgpdFNh8wrQGn+YeNFRRyisfRXq0MAINFgr+K3yOf2CBLNKABZnPaR1719up1OUeYD1OTZYTi5bBkXC09YGoutv6iiFpljDFvc81dbWxHm/hRELKkFvtNsmD7HqXlgodWdTrk9Set7BaF4hoH40VaXnx3c8RKAWsQpBnOPAbDugra2vHQ9ztMExGKpZ6SiviHBCPnnFIibiu6Wa821Q/2TZEDJNJuqty3PTF7ju4RyfOyvA+/XyxH6tbiMW2ZvD0CLOJipwDnjGsOxGCkllSO/R+q+J7EaL4WdpaEcrYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKsEU9ZZV9Mh97kuUe6/sZ+KIEzOQY2bAFS2NI9H7s8=;
 b=BuH3PUgIIDyp4lgD8YRgo9TY50Rr/NswJoj8Ze3/8iBoveDb0m+RcGUvjx643VT8stLxLsn/WF7JGf9a3tNFAbnGXpdwW8gU6+DDzHV0IBbVONDtM8HIDRE4cQFq58P5KRuoU9/5i3HvSYSoPWB5nqq5KPa75pz4Y6iJfg7OOwaqI7if7MXGV/TaWJwhYqSYnz4uWNWF2czLqWc1QNaM0BsE9NtMzkO0AIKsuqAIaYIujJ6NYTqpNH/ENLOQ05lC+zrzNqGMV1I4rRUNpJSXqSLQkGwURr/tOIOEQ6yNhG/SPIAA61XrWmWIFoSEExdgFB/sRfDYJQNfchQGdeevXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKsEU9ZZV9Mh97kuUe6/sZ+KIEzOQY2bAFS2NI9H7s8=;
 b=JEwi3kHCeuiCUI7FM0yQIlqdbmMor477t5r28gcM3LSNa/YemDJLoeRHyLRsglMNcEQYnPQdyg6XtdiUluZqCQEkrM9cODyCkmQATWeCL7earo6jOZ4X2qLt66T01jh38Tnzl5TzJlAUYFyv8EtKvqxZ67cIkrhZex13wece4XzgakplkOQPUR+fmrTbnhe3BCNCbptCkHt0st1gTqelfz5WjnRkEJJuU7A8tENgUkIx7o3GvYxTHLtw41hLqVHHoR0hDhHFLcydB/ZwImeIdoSK7qR3u0rxZi5n5aGaMXhrWP1hKN4fIQNZLU8GEOkWPzZoOmdC1pBkYLyKLfIwhQ==
Received: from DS7PR19MB7724.namprd19.prod.outlook.com (2603:10b6:8:d9::20) by
 SN7PR19MB7786.namprd19.prod.outlook.com (2603:10b6:806:2de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 07:45:40 +0000
Received: from DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86]) by DS7PR19MB7724.namprd19.prod.outlook.com
 ([fe80::70de:3c05:ac62:7f86%5]) with mapi id 15.21.0270.017; Wed, 5 Aug 2026
 07:45:40 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: mapengyu@gmail.com
Cc: damien.dagorn29@gmail.com,
	huanglei@kylinos.cn,
	kailang@realtek.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	marco_giunta@outlook.it,
	perex@perex.cz,
	sean@starlabs.systems,
	songxiebing@kylinos.cn,
	tiwai@suse.com,
	zhangheng@kylinos.cn
Subject: Re: [PATCH v2 1/2] ALSA: hda/realtek: Fix headset mic on Legion AW88399 laptops
Date: Wed,  5 Aug 2026 09:45:24 +0200
Message-ID:
 <DS7PR19MB7724F026ABE5C6E950B65632FCD32@DS7PR19MB7724.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804185325.22861-1-mapengyu@gmail.com>
References: <20260804185325.22861-1-mapengyu@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::15) To DS7PR19MB7724.namprd19.prod.outlook.com
 (2603:10b6:8:d9::20)
X-Microsoft-Original-Message-ID:
 <20260805074524.17686-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR19MB7724:EE_|SN7PR19MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fca1ee8-8182-47cf-3eab-08def2c58b48
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|8060799015|19110799012|24021099003|4140399003|23021999003|5072599009|51005399006|25010399006|55001999006|40105399003|2607281247196008|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gXBgNizTalUt+b89RDUKrwW2rI0YpgKaFGbkbMQH+Kb7eSw6QpRhSYFAtr6q?=
 =?us-ascii?Q?HkSfQEaA5ZgYjqFSdFnpdwwBr3OQcKSWBlVbixnuNHKE/Yp7GyzdU+uAlsqM?=
 =?us-ascii?Q?D/2ZymnOjBwCVM5QId4udb6GBqGlaQ55h2Tf48T5z3JmwocBpma0ACGnCKJo?=
 =?us-ascii?Q?urGdLj9R0+BwjcLCguN7eP9T/3gfTkdzrK3GqTAv0MMCqZ5STI0Ba7KGAt/U?=
 =?us-ascii?Q?zDcE9ysoJTlXAeRPV3YWgO1rZQevoNefcgw1DqofRgEjATS4gJa8TviqbCyL?=
 =?us-ascii?Q?IbqFShSIgft8WfRgRtW1wf21JJZL/DSgh1FhApyZbjfOuVtXumzUxnuEVvTB?=
 =?us-ascii?Q?hfKf1LE4/dRGsyFp/dtsq15YN2NUycAUFkHlK/LbG4ozfisuutyTMWCAT6GC?=
 =?us-ascii?Q?YCeWXskSN3xMfPoQUJhr9FN8t0NH7bxizAqkUERy1rVGKhQc1hOBxBuBuCLJ?=
 =?us-ascii?Q?RHmzG1G6EID7S9ejxj7lQwnbI/fPhvUnfX1nDzN9JECEg3d4iFu7BqcGBYLC?=
 =?us-ascii?Q?90iu4bGS6txLftWj4pH4A+9rfRhsvPJWQG0pxk/Nog9cJS5R1l+Jlj/0Aapy?=
 =?us-ascii?Q?DRekWo9VnIqdTRLsOQxJw9H69SolH3RucYtOoUbk1urqcdkR8R0bPMJk7wK2?=
 =?us-ascii?Q?IrLcRKzO8yozJ0rKQYw+1yna7CFZu3kbNnnM6j0Al3ez0m14iVGSz1fQ90Ft?=
 =?us-ascii?Q?aiSAAyOjP4+Zmd0P7boMhuIpGirkfGEOAzkUutQVHZ2mk2VPZWZF7pEuienu?=
 =?us-ascii?Q?BLN7ARyyJPPxuuWl1sG44iXpqfW0M2z7f5FX3oCuzrQ9KUIAHg4wh6kfJo9G?=
 =?us-ascii?Q?Yl67nD4nK/tx0kSouv7aqw0VDSWVoNPsFT6i2j1MG1YE6VtboLgKkeFOoIqn?=
 =?us-ascii?Q?OuxTr8xpofOl8ZFY363qGnN1J/S1I5mHRB24zdIYKUUiD5JdvoPvomvYl7sf?=
 =?us-ascii?Q?2XUU7iYbdDgSEiAEfwSEGQucpwWeG5joRaXvHsGhDJq/Bgjq1lupePrMiiVH?=
 =?us-ascii?Q?hkBU?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B5p0+UzE04hDZbb2gL2ob2JvtrvJZwpHnz3janBLXZO73IzI/kWWdY0ItuWt?=
 =?us-ascii?Q?yFrVtZJy+6olw5JekI1gTxQWyYR048fQSPMrPiFdee/Lk8jeXDI23b3d8N53?=
 =?us-ascii?Q?8HLiwGxZW2JZyUnpY5smkJThTGVzJbNk3xKsBhZ9HCOziGyKcYwsDNJPNCBZ?=
 =?us-ascii?Q?EGJrVo8APEYNes+3wis82GNyOXZ9taVGbZo9CIQ+9FXtV/BLQ6XrpbV8FXSm?=
 =?us-ascii?Q?Bh2DE4xvyL6AuGhq8eV1Bg+12Fch4QExlNF2wbrO1j2OCDSD4zDYglzWzAcE?=
 =?us-ascii?Q?hlY8jk+JJRVU2OTdgxlbaNINE2h5sa8fAiHn4OaoTND2mtZz/66MdhpYbEdr?=
 =?us-ascii?Q?XqwO/4YLZe8ADAfvEEtN+gSoj4f6IGMemR/XlStBf6ph9ldjW1Fxq1fmFVHb?=
 =?us-ascii?Q?oA1PojLk7wLpIOqBdII78iYyC+7Vw0lRKQJt402ZIsnznI/7rzRDbeha3A33?=
 =?us-ascii?Q?41nhNYa0lbKlDEPUIk+5zt1DFIgYBI5J/KXuLehAzW0syeG+Bny+Y9qF1064?=
 =?us-ascii?Q?UulA2ViT4aIE00umQN746mw2NCY6f61MY/zUAIQffj1FRTltkw95bwhSgGES?=
 =?us-ascii?Q?gmEYjQ8BFRWTJ84uX93rw9/27JKMJX5zSX0pIHxm99rSwFYcU0zlNCoZSD+A?=
 =?us-ascii?Q?Zk4sgk0BLjwzQePDJcCUD00e+4JvYiUSwXDlzBLBjbUF/VAgolucZoI4KNHV?=
 =?us-ascii?Q?qOcg3JkjiaMqC2VtSQ9PnYJguTUAoTEKyOp/6ZYjNSjYgQxPdAsoZwFYbWgQ?=
 =?us-ascii?Q?gADqwXMp4Dcr+LeGGL4DGKjGQUZOI3QsAmNjgM3SKdPUR2JJlv/6uDyELD/B?=
 =?us-ascii?Q?c3LgcMzqiMiVDyV6+Dcbni+eERMsdFNMF6IqvPHze9FCPM3+eqGOVmzq9QSt?=
 =?us-ascii?Q?2GouHSy99NEfQtLZkLo0hupOhNEfKV1aqstzwImAzYYpmd5K2yP0r8wq8OFI?=
 =?us-ascii?Q?kqKnjorKmCUdci+TbT91p9bJHdEyS8JYK33g1KZluY+fb2jNwB+Svj/PbMkI?=
 =?us-ascii?Q?fVhowJiTxp5X+HxRAqBaJl3MHRcM9ll1awav3sos+Z1UcJb1ukYA/RyLxNMF?=
 =?us-ascii?Q?Nj0nEfjLaXRRhwe4z/wicOVhqRPXRDACeE+OyY1+tfarH/bdEOmYcd9j+fJ5?=
 =?us-ascii?Q?48fiKJz4IijpH4xtbf3T0bo97VJH2nnkc3GQ2pIN5pUAJWppBaK4FDrH6NyI?=
 =?us-ascii?Q?3laVylmINXuUMnvvXIQLZaQYoM3z/gkIQEVnzN+xIi1xU3tkJp6/XssPSBO+?=
 =?us-ascii?Q?GD2BrEYQvtAiUafvhfwwbe6A9i7GngKR2x1Wu0f8QTihPeQ2Hc+qN2N/6EOO?=
 =?us-ascii?Q?KdR+HiQSxrY0lsWzojcmQrVf3JiHOL+qYAu0qIZKk9INiOUKhkfNcMX85+HX?=
 =?us-ascii?Q?I/FLfafAb4S+VSE6Vp9+s2jaa+tRMgvkQSyknmx2hVjC4qmHXCLoEwzpZuEZ?=
 =?us-ascii?Q?jKohDmrTQzQ=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fca1ee8-8182-47cf-3eab-08def2c58b48
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB7724.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:45:39.8400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7786

Hi Aaron,

Thank you for this, both patches look good to me. You addressed all
my previous points and I have no further objections (in fact, I think
these are clever and useful solutions).

Tested on Legion Pro 7 16AFR10H (SSID 17aa:3938): headset buttons work,
internal mic remains selectable with headset plugged in, SKU warning gone,
and no bogus 4.0 profiles exposed anymore.

For both patches:
Reviewed-by: Marco Giunta <marco_giunta@outlook.it>
Tested-by: Marco Giunta <marco_giunta@outlook.it>

Best regards,
Marco
