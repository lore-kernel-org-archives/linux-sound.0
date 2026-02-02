Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CD535A931;
	Mon,  2 Feb 2026 10:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770028603; cv=fail; b=rokHkRrh4H1PW11zIWhC+GMwIa6wTRm07U57eETzmuw6lzHjYegdkuZxCQ0QV9dMA/gSwYZLNOLigBMEdTFq8qYHp6UjUx4ShOg/9fffgWab58eDuO7PcWmC07r5hy0yx9F+LyiN4cgqJ/8xk+MDV4oq06xwf0I8B4ljpiNv9MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770028603; c=relaxed/simple;
	bh=vbgCc9X++FzU0Y9wkp8PTPGdDe33ngNybzmNmZSaNz4=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZYI+UqaRMF9Xh41OW68OI/TEVsHploNxVGvQqX90DqdEUgiqnVfu4OWzuoi4umsY+GjIQiJs3YbK3es+EFQSAPIO8gPKfzeYSW02H7/75h8iXYvvULhFfxZ4ga+kxZ7sfk0kCPseYmebNhpsfWBuuKektr1UMRw2Lsb4DTfgss0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kyfq/4gE; arc=fail smtp.client-ip=52.101.83.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kyfq/4gE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Btma5G4K61nnT61QJyhe4XB0GzZ9ywdczzREBR6iFqPmdfK8cFPmg/nmpeE+30RsaojoDoEBOUhox5/tJ8bhKTh84zhE8LEFmlz9bkfhvUXCUH54T2/cfyYkZbXNoruNhl1XpTRHcMjM/L3Pv1Wn5KgGZWqH1YwOorREsjCsZh/ECXYgmsJ9NPU77a/WVBEaYv9sV4yyqvplyv7mDKKCDCoEhRvKJwjJ+zXPWaQQJqVbK++nPH7gESoPFAyLeZhIj7KBmyRH2a5ONe2Huom7xgYZxOlndRnhEHrLwmbBCSwTZEKf859dA7HgunhK0kkDI0Y53FPxb0FkXAHlM4uWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K132Lnz3+mbNSLKizjVxAeBHqsrBgIyDUjaUP8KrTU=;
 b=h6NqckKFGC4cuaPXPoXVef4V64sG85A2qEf1ifsuFxBTcaRYAd4/t56gtziRBTQc4c3atlHgqZUceXDoCMgMt68zMhg+p5PL9rh2JEw2d9IlrlkUixY6Xc2BG4tK+fZhD+ePIWaoCyixbR7XEmQaBIHOH+o20BGyqMEUyee+si1KgoMdy2R9Up1kgTrS8+jXrWgGxv9KB3yDePyUBHrjflzZENila2Z+qqELN/6ilnvn3TORD9EVJVWa/DlnjKxZFrOIDzPs9+CS8Dt5SS3XWmFETsEDS/TFnKPp2pwOecvYW6aBvx+/YEjRNw2xJFsWrqpCbt7ypf8ZMFLZWkxK2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K132Lnz3+mbNSLKizjVxAeBHqsrBgIyDUjaUP8KrTU=;
 b=kyfq/4gEkJL3bGy7zIA7P7GEb6wrrHYU/HS9Wot2qFu7gaGwnezeEWc9E1GaEUc4zSZCOiVSzdnFeq0apcOkHpH357UPJ7zfrp+usely0jlK7yU6kylhMjeh71zwS6kh8fP8aRMd3BvOEa8CNFQC7vGOJMBacogrtSlfsXBV4P8YWAf5K/vlvUG6vwaTlAWBhbZIwo/3peePqkzQVVw8B7lbFUhMLZRUanifF+IMtV7dY+YN4s1qrs93rovxFvVJ5yjWDBx4f/dGtTrJJF50HII+TuN7WwLslCtudpMUM9T+OKf3er6Zx2iD+HuRMcD/+jUg/9te6tnBm/AxvuuTLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAWPR04MB10008.eurprd04.prod.outlook.com (2603:10a6:102:38b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:36:39 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:36:38 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl_rpmsg: Add support for i.MX94 and i.MX952 platform
Date: Mon,  2 Feb 2026 19:36:16 +0900
Message-ID: <20260202103618.13929-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0047.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bd::11) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PAWPR04MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1577b5-1cb0-4d85-6b47-08de6246f23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P5AA1zSetoP7VLSIB4jXSnfVk/1osAmBYDrRehzs2M0MoXip0SHKj69Wallt?=
 =?us-ascii?Q?wZjAGGWmTfRyVeKRO7h2R79s63hlz4h6dIiv5AKHhScE59fW19DlDWrj5VNn?=
 =?us-ascii?Q?vWn8/yJL3ZsEoIodC6MgyMmkIyVvpO46pyfDwsH/1q3SnkvLKKuX8RXO4HHv?=
 =?us-ascii?Q?3AvPHP4YPOE7Kp1vsZkFm3YuAxDnGOkVYE6KY7Ezar+O6oW9Ea/Q6joqg2P6?=
 =?us-ascii?Q?z/VeKGonv+hWH3eRMKA9kCd4beWeA97Kgjz5s4wEnMz0d8/2ZG2AIlQWQ0Vg?=
 =?us-ascii?Q?eMZMuWqLN/1M3tWKM5133Hn9gOn/N7J2BSq50HL9bRIIAmsv9vvPcUIhBb+R?=
 =?us-ascii?Q?TSfib4zBWZE5ejJLKeYtepOzurCWLKR57Ny8B1U7o9DKz6oonELquww0R1Ul?=
 =?us-ascii?Q?MTUXTFdzACdpJocqRjEsxzWOwbyDki3zWJUlkz20OaBMpI1VXZBrOHFkSm3b?=
 =?us-ascii?Q?A6PASsaUNgYF02Y2Thgh9QR51G5OiZ0wRoYWUUF/Jk4sqYEJbm88giOPqEqx?=
 =?us-ascii?Q?egghbIXHNrPAkMWxBFH9DYACEtuACDNgZzdjNIhOcjQXu0wYQlhJpJz2IcbT?=
 =?us-ascii?Q?PogsZAKvgpuTP761oAuKTP/dv/j27KcdhjMEJGuD3SwH4o5qTYWlVj+PnCdu?=
 =?us-ascii?Q?C/BOkHuBYPTMrjRVaLvzABGpMGYoEBDkICfTJ9PqlJpJOYoPD4QcrVEn5Bgf?=
 =?us-ascii?Q?UCs6+DQX8Ucsk0i/of5LW3IXuAyWh0VGUZet8LeSeww6icx6N65BxllhuGRM?=
 =?us-ascii?Q?Dod//Z+Km8Oy1/nX62ylZKtAFHnCALMDk8Sgsnh7D/NG7ZScS0GYd4uWQ3ny?=
 =?us-ascii?Q?srAhCJLNrfbPeoq5EU+w9IoOb8toc3JV0FmE0gCra6L0sI8HVnt2Ij0l7XxA?=
 =?us-ascii?Q?yyYhRPFzw2cKpgbKjRtKHNzzkWpUaY6hitO3N4AnshBevH3HSUpIMieAvujU?=
 =?us-ascii?Q?1PQLPoP6rsuFjoJ3hD8sw4sygTGHxxwluYVCRUjeL2PIcOFgW+uN9QxUK253?=
 =?us-ascii?Q?aFaMnnnmttvT2yqwkKqbTuyaeFQEXcW+9MBzAz4JRweO6XwCGnY9mloaBSq4?=
 =?us-ascii?Q?vMuahz1zliGQJPGIOSWPtAg1x0wqbdTS0vvH3/290DZawThvfBztWvZFCIAa?=
 =?us-ascii?Q?TyEaPsy6SdC/ekXQnT5UiNPsG50nIS2WojeKTFBrszfGuvVoOONmYXooOz6K?=
 =?us-ascii?Q?u0c2suwhIJTyqPKYElYCwtLoSchzy7oL0y+z7N8Z+zyuSF5Sib7yY2zzKzBm?=
 =?us-ascii?Q?MPfHBw9pu1DwTCLQQp3InesXKjmu3jwkxib4yd7vANl0dcAg9OqZus+HYoa3?=
 =?us-ascii?Q?Idl2HlsgjeTJjzbsFERB7aEEe6dQXazuY06MfiEhBVN7G49PT4N4XtvRGFgj?=
 =?us-ascii?Q?67EEVjX3N7u6Q0IquRne509wotG1hb76mfmGXWcslLEyZ8uZ4JQxo4kFfxAz?=
 =?us-ascii?Q?bvhIwhqZuiz1M/0iQ2/KHZSULCjF/+TpziUaUoFfIVHrhhggqrXy2zaJ91L5?=
 =?us-ascii?Q?BUTi7Wo1iihj0JTfeXdE/SANgMc4C2a0OYdCVwD1khb6jM1jsEjK2sF3lWr9?=
 =?us-ascii?Q?A04WXVDw0a6oKk3gC0MRg+hSEuiU07PMhx4RJLnlzIoPmF7PV5TcTCQb8O8W?=
 =?us-ascii?Q?+tcC6esOu401Q4cQPGYgn6o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d9vuttuyz5kFPz2ZE1BT9dAtlhijXr9gydeAUcAMk6Ri/OwO2CxWnI/HNUWc?=
 =?us-ascii?Q?/ol7OhGbnvlv9KoyH8/3Lc4RUqye5IZmUQGKrctHtvGETMjirULZzCBUGTAm?=
 =?us-ascii?Q?cBw8iIoMpFMuMA9fmue/2jLTJ8//G0u1YKs1hMHnG9+5zXbV/kzI76fbgQAd?=
 =?us-ascii?Q?GmxBZkaMplYVUrNCTHVDA/MrT6pKIs/O/8kys4dk55nazu/qWYOsuFMAPxMz?=
 =?us-ascii?Q?5gI25Tk9QulMkx5LZH+Ob2Xz9LZlZoku76Czdo/hR1dlj4/doxX0QCPuBVrF?=
 =?us-ascii?Q?29kzpJMMHKgyFjZUHhTHjoosXKcmba7vO1s2OrY7b04E+8ehqLCk7yJ745Id?=
 =?us-ascii?Q?Ofi+dyhcmRvkQDzoIARy4rQJoxA21utPngjOqcmulavyUGFb8OPalPbuBK0Q?=
 =?us-ascii?Q?pLmRJH3xTz0IKInMEm8S76Q5vbMUD/zpw//HIosvqPpPmJC8ULSTb2hU4+uI?=
 =?us-ascii?Q?funUXo0DHX0ONMUciUEvBJExP4INaQXCO3bupctaiixMn/OJjy7R7UgHY2Z3?=
 =?us-ascii?Q?wMN+tid2jDWoICBQC5aC81nk48v0ZdQUD71hJIBsxLLa87LFjWhgHwKRLGFs?=
 =?us-ascii?Q?BsXffGo9ZjnEtv+onlSjE5z+ejy8jnOUI1iTzVAdDdIMXoPmcEF3v/ofLxum?=
 =?us-ascii?Q?W3QJq4fUo/z7DJod/li8JufokfLEzhtBhIpC+J+LHLNB6Eyq20FuvWLPp3B9?=
 =?us-ascii?Q?zLmhCVLCIqsrRq4z47fQjGid66IblKvGQava8wVsJsmOvV3RyUeUeumugE3v?=
 =?us-ascii?Q?SDGKtrVi72OUY+iMdLXDFEY7ImSlnEIkjHotD+19sRmfEdWQTrtHO3T93ZBX?=
 =?us-ascii?Q?zFIIcHY4NwI+B3vKeUb4aTymmUQubuvCzjQhEwhCg2xTwN7Bc/TagUoIQ6gZ?=
 =?us-ascii?Q?Ja7VHhTh+0W7WUItZ6iv1CpToizR4fZZsQn6k6VnzD1g94zKbfBxJBJPR1VY?=
 =?us-ascii?Q?S9xfGUwVDOzDqh+i334z+w12geHustJ3QSk7eZLLT39Tga98tUXqbqYwzMQj?=
 =?us-ascii?Q?vmmH9ixlydlpKhk9vujcfA5iTl3O0RzcBmr6tQPhSniclGZxVPe/3z+arUaw?=
 =?us-ascii?Q?pAeQh1UjoSjnVv6p5yIupxS0yNwhxtcdxfr+LAv82ubRTdfCPTwMmsmwgX7Q?=
 =?us-ascii?Q?0RmsAecULIqavqyuAbyWPhPZWd33E9GHE1pVvC3xDruGDleyI5Dkc38pHyoV?=
 =?us-ascii?Q?TlwSB77jSkUUcu/Lr9fNX83K84RibCL0D7ezTzA9DBNHHnmkMSWE4m84yb8C?=
 =?us-ascii?Q?0YG5xGBIyXjv48QVDtF4hnp4GdjHtUBMnQTgRRaO1RWoevI35Oa5MSH+Z4uM?=
 =?us-ascii?Q?9HZs9xSWD4oFtUsUm6qcFXWE/uq9grXOTzXLE2qSHwVUnlDOiLqBlUb3iyic?=
 =?us-ascii?Q?nzoJZeeJHHQX1v9rBB60CZBjKLo7oovihZ+gHegtx/BvOZ+FhDa1H386rSDk?=
 =?us-ascii?Q?SPmRuGoosA+tfzhjuD0E9Je7+p0Wx2M1UMVjj2GyFzBgaGG4hHly8Hj/QQb0?=
 =?us-ascii?Q?90doOCsd6XTmRvmHBAoNOvtDtkuouvBSBO4fjnuGGctR6srmqgCg5+Rwdkex?=
 =?us-ascii?Q?rTbsn8kIJQiCqpxVlkM7tK+0b7vJF67OhgFszmNIaa2UVht1gy6LSoGGp2OE?=
 =?us-ascii?Q?hRzFCgtUIMjrMzsKik2mJYmkQYHUAP9ZgubvxZfJ9qyAJWijHPPpXOSJY1wl?=
 =?us-ascii?Q?Wsghjg/Vy8v3rT6HSY8Bumltnb/dw9CSSLx1vwVii52BsWmPXqqZly/lxdAF?=
 =?us-ascii?Q?QhC+rYPL5Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1577b5-1cb0-4d85-6b47-08de6246f23a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:36:38.8655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EasEC7XSfyCt9JHG5l/XhXXhwgcp1pfaET5MOenehuNpCWtsE1At5/4rwpy49n6K/Fui/BmVTIbquCUYafpX9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10008

Add rpmsg audio support for i.MX94 and i.MX952 platform.

Chancel Liu (2):
  ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX94
  ASoC: dt-bindings: fsl_rpmsg: Add compatible string for i.MX952

 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

--
2.50.1

