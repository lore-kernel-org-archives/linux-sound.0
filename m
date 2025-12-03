Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011020.outbound.protection.outlook.com [52.101.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8F22E6CCD;
	Wed,  3 Dec 2025 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756389; cv=fail; b=YfuE85Rxs+53dRiSlm6xWlVmjxAOl/P278WamWAIRCXJa/CMiylVL1iRh3QeXL6QT3zLQWso8VsR4yWFdJPW23UXQ7Lf2dhfMsNI+aT3+hIOn3WNYgKXsMABtxru85TLp2nYVK6BtsTjqWNP7gnDmt3m0Sd3zSjZMZ4lFap+1RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756389; c=relaxed/simple;
	bh=b2FsiJ8/6aMkZch3P7qYZawFbI0a3eB+FWVHcpAgQHk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uo8/Pw5Vml9uunNmm+mH9KnubC/uYq5MZDFoNJZbAvVWhQxoA8abihI4wguMEtzFL6XKKqqKhYYV3GvWGmtcatQ6awjReoTqdMqt3a4JLfAkjtPXTxTcnY3O2GH8556VUDMv6A3hlPS9tDebt10QerMB5cLI0QmEE2aoNvMFzGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bh8918zH; arc=fail smtp.client-ip=52.101.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bh8918zH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLREhv/wt61vRm7ggldJiNaA6dhzL8469sHi1EkiHdshD2lsaP5OMQzKTDs+oBDu4fyKrnAmA6feFh907lxg0kgQm33+jonnSkesJSEJGN/QzxpKXRqqEWq42OA7B3iATDYaA/S9YItKgdbVumDyI8WoSNvrDAwZ7o2UvpaD81JMEaED5Y2p3XKbRm9jSY7xthpWjH9tlyGh9TwXh6Fvb1yNCQy+Xvs8VzsFKr1oB4w6EETu3rbbSZe1hDawmTUuf7hKm/B3+xwEXqYsKMERtC/ile5HsWxzikH9rPvBcahaPkzBiZNmTsInbmv8Z/HNtFLJUzNrl4uFZfvjCwxu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mmn75zDMVZWHKD3T2JKj6kKJRR6Pyx2W95M5Ti7kgCg=;
 b=zBNQlKSCUDKhi5tFb84ElzLN2wjlbtMxTkAO9AhaBAbU0JYJ3DFt+CriOQow+9VXFJoUCfybQ6M/jVsPvFcIHCif/ELSMFoI44GJWvVbNSMx/EZbUqYXVFnQYscohZCIhU7/jkFZI6dqgNHVRoVciYNzrnrwO85xWx5fCEhOgxRPyKcMuDCTuz6sCC4WP0/tYp5ZABgZnnq7075pwz+tkStpShKpV448Oot9g8arjq0QFsxbqsbW7JKPp80eTY7uohYFEi8PzkPGr2zi3gTwJYxDwqKZskg+Xg5bRRD1+mQ5+aGYfUnfQnFuHiftXqAhW5o4IEW0CADcrAktjY1rfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mmn75zDMVZWHKD3T2JKj6kKJRR6Pyx2W95M5Ti7kgCg=;
 b=bh8918zHNZqOd0dVTB/VvF9qG8M2MQLyrOwGCPLh2yVlGvkopNxA6s8SWLS/VkoEn1Flw9BN5o+OPE35tuSc9/4nveDmmxYYZrZcWfdT1u7hpOy/pFmLLEDcrsiQXUlPT+ybW2uAGAqpnCCeN68ESONAgJzIvTVuTLyGsqCndrR/33qfqOLB2khT6UVzTlENXBJXLX9P9W84dJbhPgAAfdjRRb+fTVMAVppgePEGLSiHFLXbNvY1WyZ5lrsLWlJbtvR9HnKJ3S2zSpF5C+HPOqHP7osw/8ZW1j4TALrvBiqcLv8f4NDtjgf9AhLjHSEyIw000km9Nd5qVYyjLl68pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU4PR04MB10766.eurprd04.prod.outlook.com (2603:10a6:10:587::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 10:06:24 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 10:06:24 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	andriy.shevchenko@linux.intel.com,
	kuninori.morimoto.gx@renesas.com,
	nichen@iscas.ac.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com
Subject: [PATCH v2 0/2] ASoC: ak4458 & ak5558: disable regulator if error
Date: Wed,  3 Dec 2025 18:05:27 +0800
Message-Id: <20251203100529.3841203-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0119.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::23) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU4PR04MB10766:EE_
X-MS-Office365-Filtering-Correlation-Id: b67d9d95-1339-4407-82b0-08de32539d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+53tD6kGFA/V56dIAp8I6Y+Zs4UTr4e/MPFxTVZKBkoeasYqAMk/Ui1oVmtN?=
 =?us-ascii?Q?D7hq4DNENIFw9V254cGZgDf+nWZNbCBPJTyqfd+eYS67Jywg6IDheW12O9cP?=
 =?us-ascii?Q?CXmw7cU1+ri5vIcQricUO5wLIXzdJByVJuwWZlWwyNua/tOES0sxYE2ydNWH?=
 =?us-ascii?Q?OITRVIXUEmRsYgln+9RbVwNM7cbDSfzzDAP5vCHHaqeQo568V3M7rYl6xaMQ?=
 =?us-ascii?Q?eHskvyvJUWp54yyyVjT1KJ7wllOuXKrI45Vb2HTON83OpULYMBMOC1TIqmaI?=
 =?us-ascii?Q?VpxnclHSmhN2GGxPMztSN5sd3yYFh/7TjVxuJVf+/pJRlKtGySJPsN7Z9O+T?=
 =?us-ascii?Q?sBnJXnZi5YNZYVKmEDeoNNLg0StwXeA5a9mIW4jWZ7zhofj7sq7dhYDUngh1?=
 =?us-ascii?Q?MvPsOU9gOdl6ysT00dC+/lUSCMMVjsSTFWgVgbvBtMpJh/PYxt3xdLp1vXtb?=
 =?us-ascii?Q?4S28Y9akRptFJwncvm4Rp+Zxj9Gfp1ZsDKx6r+nrZyLjjZYYL+QsoeD9PLFL?=
 =?us-ascii?Q?KYhvsjQ+Xm6lMiZ/iNNJu7avxKK5Z5GW1pL9H+VJi6gYPsL705DNJvIOpXGS?=
 =?us-ascii?Q?LjBRCqy1WNBGRIjI6BtcEnnZq9FO3nGDHQiJhnMbNO9JU+MYXRJ75WFtyLTS?=
 =?us-ascii?Q?Jl5VSxy8fksoT7fqEr4B0fhg1LvGfgO9LnDbj3xFOVy4Vuq+D5GnWdWw2G4W?=
 =?us-ascii?Q?tbgljy75DrzgbKQoNLJ6Ep3VZ6e0WYpJK73wQ5dhRvIzB3LkuzafUnXqjHUR?=
 =?us-ascii?Q?lwpdNzLyr+JC4tLVWl2vKVkKMg2Bs/3tbFIZuWnBe3E7U6IhZO9RlBryWxLv?=
 =?us-ascii?Q?YP9xmIamTAdWB9CwR7S1n/+rN9uUK03kgOZyC21jhz/7iijLxI18PWRR+1ZD?=
 =?us-ascii?Q?Ye4JeovSevI0zpS6TCYZD0T17ch5jB5kX5EcD6SpECcDVPR8KAq9d2sbMXSu?=
 =?us-ascii?Q?lq6+IRAfK7sCUh3yhhxwIa8cJRCMZGQZ9+q3RnPZNqNMzis2BdRokaaasNKM?=
 =?us-ascii?Q?jWnBETUZuBaLJkMExljyp6M/HxDOphmLz2MLdk8fPeYY1ZzI2ahlfBoI1KID?=
 =?us-ascii?Q?LtcuDoLrfXnluBJM7KKilGaPnnTrB14TCjQj123dtD3OIGHOg9aWhVT3+QxK?=
 =?us-ascii?Q?hYxFVIu730u45F9RZnlIzTyNBjVJDbuWNqrPnYFiM5PcKs31AFkhtFpFaeL8?=
 =?us-ascii?Q?4OypbzoCEKAnrNyyHgGpff+441PUx1FXchLS504oswYrooCmy2j325c3rRou?=
 =?us-ascii?Q?jtVNuKThRuA2PhlDl4GHELruF3wyqhdvpIeLeoc1yrHqe0IUjb9PMfjvBrV7?=
 =?us-ascii?Q?IZEExs83CEyPyBnOV+7XI/F5wkYECzAvI7BpxC7LDU4XtpwMUMXbIH+PD3Im?=
 =?us-ascii?Q?r6XsfQLONS0teXFd0EKVbuawRg/7LSTfzY6w4zAbSL/xUIyqoJTz1CH1Y0iE?=
 =?us-ascii?Q?QG0AIWs0aIe6r5MEPjNkaISNkxjE8BRH1wLrztn73VND4PMwfEmQ6MkoUwAE?=
 =?us-ascii?Q?4a2BGt2eGgWl1UGmKlFsAfrLdGmLy5RspoQDvysvH0pMsjagZP2W92AAAg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j67NX/30kiNyFz26R4tCK9ggCZzdb+smzmQnIDHADyHlL+MumFeICwfYTNF4?=
 =?us-ascii?Q?CAp+Mdl8h5JDs7MgebpHoB1m4k6D+oL1TVgzD3Oex9LkfQHIdTCSMP3Rq97k?=
 =?us-ascii?Q?ci7h1/tnePyUTIOu3/UWCNofX41LwUVtVJcFUyZkU4DVzD9OUsNs4WiKlgUI?=
 =?us-ascii?Q?S2SpKXlWvPy6cTPm6oxEZBVhf3/GFyzUzdabkF3/RkVuiEdrMQnibVxBro92?=
 =?us-ascii?Q?tsYJ+cF8MLENIglWiPcPa8uwAY80t+yNrbPhO15n7462zqpxO0c7U0XU6Nv9?=
 =?us-ascii?Q?VFzhcdiB+vm+yK+H3xgctsLR83RSDa4cGemsrL7TQYfn5rSgj+hwPlR8kJLw?=
 =?us-ascii?Q?rDOXJhOcti+hcI686vBXKX1c+ndcP+Ds/8/4OqLacx1tEZtZrv8t07L4MGB1?=
 =?us-ascii?Q?5/NF0hj39k+6Xt2fpJ0fxmJdDKjVovdMhG0LC3lSOt6W8coU6WBhbLAOLegH?=
 =?us-ascii?Q?QiAonwk80DIJrASKpoxrPIwQxM5bO/jxTz3O/yTg9CSsbdAte1C1uxCQr8G/?=
 =?us-ascii?Q?TVf4BPdp/29UlOvJ0ehUSbHcTu61hiBHs+xda5vbXFLNmP2EkC86ZnxYa2RC?=
 =?us-ascii?Q?wkihGJ1ZBv48DK6XGn8gid9Hmd1dZ8ElgOkDwVDDmjtk3vzuDaF+SWVeKWSf?=
 =?us-ascii?Q?mVwsJwsUFa6MyLIvy18XCOkPc1nctKid/o6z3gxQG8WcKRO9+DcU23gJHFRA?=
 =?us-ascii?Q?OXe+helCz/ey0BIoprzmr5Ph2PDTMgCjETeZf1FJTjqD4+gOMX8Fnx5x3JJl?=
 =?us-ascii?Q?tqV91EJfNg28miuw8AXbF4wvevNF+B6eTWGxaKC26ftqHHKdoUc7xh6Bi6ki?=
 =?us-ascii?Q?6K4op6YDCGNxqqz6yY7C9NI4OnrERHUkkIw6FHKsg9PEGEwTxla7yOFlR6r0?=
 =?us-ascii?Q?PtRY3bc8vFal5L5XZA+eI2xq/EOD0eOqslOnxPouk9dCjGOwVMMJMXsl+iHq?=
 =?us-ascii?Q?Uk336zAT61J+rdr9A9c3F/uWzIPZ4a4SQ/cvM54GndK6NcFeQYQc5071JiwQ?=
 =?us-ascii?Q?TQZDFgcAFPdlnW54A7Xbph+osxHwiQlYMdTLp+/Pg8eP05Aq/sc/6KPMHhzb?=
 =?us-ascii?Q?5qxTJQqy/tNzew8KxM0B58o3N8kk0Su/sikW8fZ74/RbpiPJ9oU+NQG2qLFH?=
 =?us-ascii?Q?M/wBm3rNzwp3CDr5BuC1aP97JUblON0D4tM0H3pZZHz2E9WVzF8EO5G6j13x?=
 =?us-ascii?Q?PxL/mkN9gokxVHd+v5vs7GoBoarko57L/I171hiZAn9Bt4PuFAesyxJvB4vJ?=
 =?us-ascii?Q?Q/vOvIXA86k763Y3W14bmdDRSdu/UN9B6ddN+84199G3mwynxMOWEcdWzkMn?=
 =?us-ascii?Q?pa4zkxag8N41deTwNR03EqSjVjcuo94+1MNNp8zVB9+FgRP+YvpphxpfYrCD?=
 =?us-ascii?Q?BQKYCXarF1dE6QWAhffaY2xoOD6NkasgA4y6cCqGdMtwhpNLNMGCTEvx7VvS?=
 =?us-ascii?Q?iXhIbNg1TUteaE1DbKlm0i8AvNTv2Q5WSUlryzpmrbN0pad/oCdZ5N/NgdxU?=
 =?us-ascii?Q?t9ZjCu8OgonL9br5mlbe0q+ZPf40RpJIqAUMfqGQyliucVyC2sYe1K5Hi3at?=
 =?us-ascii?Q?PXapoR/hPhr0kYmjELZK1eTI8MHfKe4dnVbwxp1Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b67d9d95-1339-4407-82b0-08de32539d8f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 10:06:24.3343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ORs59on1ObYixkjEeiikAHGpqZp6ocdp5m6bIMitY/ckRxr3lj8cZJS9ygj8HgkvRhfBOHCImsXuOeMShlqsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10766

Disable regulator when error happens to balance the reference count.

changes in v2:
- set regmap to cache only also.

Shengjiu Wang (2):
  ASoC: ak4458: Disable regulator when error happens
  ASoC: ak5558: Disable regulator when error happens

 sound/soc/codecs/ak4458.c | 10 +++++++++-
 sound/soc/codecs/ak5558.c | 10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.34.1

