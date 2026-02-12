Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A36B1F1518;
	Thu, 12 Feb 2026 02:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770862638; cv=fail; b=TABlEkSbt8twSgUfa++2h31s+CClvjIyD/u53i6jYtH654bBrhB7re4B5SgiqWFyoowSyWPEWOCniOcEAKREyE5V3rpLvquyUD47ZZjKQCOKo6iqrVK9nWVyXj2acCFX95GN3Nx0Ul4zNT8lHxwjGl9tyI2wqTQULK+72LKhhb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770862638; c=relaxed/simple;
	bh=U9LvOUC+w6G6LQo5VsToELc8waC5aR2GuxsnCU//9Ls=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FswZcG/H63U3Sn5rx5N3fu24BkLpHt5fqmDgOgS3zfa4ZPstpUdVNLDtF3Mf1GCYJOxji5I3CKb2rR/Pv6EFaM5gXruurFPLQ+08uVitTFf3fqIeS5lxRvsbMPE9qYorldAbjAb1XvQex4I6Ru9ZXu6NTAUz7Yd93B+lmPf/0ro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DJdurHXZ; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DJdurHXZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqHPHQxEHQzziPA1XP1Cfwgf6BwT8PnfH403uKjED8aWDz6mD2nn7U3iHRgAeeYuIRuWpTEEvQA9odNZsGEVxoOm3if+PjQdL4lIhgdp5wAn9fSDMlYp+UOkc3OJsg8sJqNgYbjBYsUmG4feQGy3WPTLW29zr1giGo/66xXUGNyXp7bv1puTRLA8uf+EcjRmbgRcteb+jePjuFu6F4/7PmITo86C7NJgq7WXAyh7ls5458MikyDtw9hl1alDYSiXSCMIHxKeuV3rWbBk8Usv/xathBqU0TGCJj8F5fGrQPPQGqo6UvLOn/ODHS9U/WN74/IhPjZW6Y76wvCl/vNpgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7a5iRxQI4JK2yGlubDBHPY9Eye4tFooaSo9JSfVghcw=;
 b=CHud7t9G+cSesaSQuJX8XLtimkhCpJ8rKbtbSpgcVt+dfdXUfVXVX+xrqm0O31pRs/dZPB2lTgjSEqCXHMVLL3ZfxWkviXrogSkSQp4T/NjhH1nDWxLwg+04DCEzIwpRhw0m9sCYcucd01Aw+18FzAEMRXJspIupWzSBcpThw/FuY5iL6amTPU26LD2l13lo1hkJVVjy1cNoVmVl9OPnYhucgaQQfSOjpgCp+tGZ7h+k1yAR4VRTLKsrjc7aChh3G3XabZZXGObVWXzjlOC5YE3H35x1RyWJ1+OiaZoV5/MMIt4PylFju+hRQr9N/vczIGDF6iJBUFzyjMNJKWaHfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7a5iRxQI4JK2yGlubDBHPY9Eye4tFooaSo9JSfVghcw=;
 b=DJdurHXZ4vQZjbhorPm2LyevNLzdsRfKC96/nGDuDVKe3TzcOMwGfmu0OGl2slFdYx+SfM1jNAK4EvKG/h5HNqyyacHj99G3yzLIerGgimxxu40xYDRV0ywBBGA2qNaehyoydq0W0nOl1UNX6jfvIGIAyuhtHtx+DvOpvGvuNRlRKozC6qf3tDuEhiHWsjXgnkz9y/A6zHoiME9AV4LKQU4eqyVRt0aUW8GoSkT+dBEciFpZw6bWWg75RKx2B481qrbhDKt+Xh8CsLPX28j7PMJ7YkzyxZS88t9fMuJfKmD412kUmyYCFsliVoDNhGa9moxPcC0+TUriA7O9ik3P9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 02:17:14 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.9564.014; Thu, 12 Feb 2026
 02:17:14 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH v2 1/3] ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
Date: Thu, 12 Feb 2026 10:18:27 +0800
Message-Id: <20260212021829.3244736-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
References: <20260212021829.3244736-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a081c0-e416-4f30-e70c-08de69dcd660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/xk1U67KRfCl4COiyjSyVWzCigflj1ufA2iCGlntn9MsNtnQWe2CmD3jlDOz?=
 =?us-ascii?Q?UZORrAsFUdwUrSHZ1lNGkcNkPQUmeE4QmIfUg+qin0/Y1+sfGgqDZS0NmOy3?=
 =?us-ascii?Q?RRMyfy0yw0Yu35FqTp+MtMDxRXErBdP9S8fxzjWPqZMehwfwJ2v/NPwpXuEm?=
 =?us-ascii?Q?CDuEcwBKOGGtU4Z3HKXn5WLFXlN3JxcDjYl3j7SCN/A6fGZO4MYjBO+vYtbf?=
 =?us-ascii?Q?3zJooNgAV2y1vJEM8ODqQs7RXB6RyFBfPJgvYVLy0fKx2tpA209frGKzLT2i?=
 =?us-ascii?Q?ph0LcisX4vbZjgjZYbfB2xWCgcnAyVDYMkAKf/lWxuzQxwMK8WbzdP2k1+m4?=
 =?us-ascii?Q?5eEDw4xvsFg+AJTdrhHt1mZOE0IGlm9QaiHr8b817vDAySm0MQKV0su8WcNj?=
 =?us-ascii?Q?Qqu+cxZ9BriMOzTbCwlvn0S1nFJCTkfbFoaETYO7FjUpcOS80cBbl3RPWAoz?=
 =?us-ascii?Q?2ylmM76U4GR5rTGTi/WXt9D0E/5uGouXthsZ+QhL0c0hDYfWDiidzD5ziB6N?=
 =?us-ascii?Q?v20KkCyfNItJTvDeqjF+fOq2dN75BWcT/xS8gQWLgUHAE8FPFb7CvZjjOFW+?=
 =?us-ascii?Q?BzRrJTHy92JS8cYuZVr+w9PnVKh1MhF7uaDm/7GYokaeVPrgbLDFDWeXWZ2H?=
 =?us-ascii?Q?KFSjZHYlccypmHJCrQ36cFdcw+WHeUo0HZsQ0TeFOLya1mhxXz7ySS3mfvKX?=
 =?us-ascii?Q?BknTOxhRpJ5C/sqt4ZC5P+XLfm4e1+hXWrRbwcdxWeHH/OSNJSQgF45azpjX?=
 =?us-ascii?Q?7rI7c7XyXgcG6bAS7Box2y45vgMGbqZs8S+s0LQyxMQCGNR91kDM8Xq8vPmG?=
 =?us-ascii?Q?co+ibFTseUTm6wLXEAsEco26DHr0y+S9MRsBNPbyou6d6umHD//qX518w2hq?=
 =?us-ascii?Q?tFzWkvDzwK27hFl/6oeIRJHcnFE2Aj2Ki3pPzy3Vdmplc9T3GHmpOfn8CzW2?=
 =?us-ascii?Q?6qwEadTDAbrTg0mZP772ZZIPZlHbltRLlETs3WrV69JF9z1+OV0BzzhHy+77?=
 =?us-ascii?Q?oNE0UE3UynwUWnY9eOoU0/IC65uuWUtVVli/hOkgilIwt9OVX5A2j7TcHYo2?=
 =?us-ascii?Q?1IbvEdyTAlrhDKsPT8gl+U03Jjavob+q6S69fngEfQV4jlCiNpnsiWxuY/p1?=
 =?us-ascii?Q?dSDWNONpItS2B2o+UufoXEUCnOZctYaiCqB5iNdeZ+/cYWSmuHMK0o/laoGE?=
 =?us-ascii?Q?fBYaUe/2bxqeNjJot0ngbbqiKCv3NvMgfQ1vCtQaEssMcn42JKFJGS4KJHL2?=
 =?us-ascii?Q?lo+o4JumdSWyKl858b8fzSIrSU5pAODY4M5YISBHn9mK7I1g6d3hXtFRMiBT?=
 =?us-ascii?Q?N9XcE7JSY2ebh4vviHm4W1zV0xPBss8ArsBZwReeIOq0jo6zAOcaKFQ3Nq2F?=
 =?us-ascii?Q?oI4E/bd7RkmubiAICb23QbTprCVmCMkWnaxj+dC5IqpE2ndfTdJe2iPXeQFe?=
 =?us-ascii?Q?WtzCXUdZbGvrN49k/6wC0RwXtNmCkygymaVzwr9uwnb+eotgvF3kF4NIBSjQ?=
 =?us-ascii?Q?q2Va2nCk0KfS/5XjEGuOEXsBExEeTomYWr6yPFnOdxhxmvLENmtaFpDzs9nm?=
 =?us-ascii?Q?DGLzhTczTPr8lhlac+QtjZGxT0C+jw6/7wgkbAFWA7zZW9hsbZXvAF5pM+sW?=
 =?us-ascii?Q?rAhdryDFIY22D/9HJZQGNRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q5m/OpRGt5mvIv9iZWLSnroCVG5iJuni6cLhYl7LQxLwCCDyd4A28pp71MWj?=
 =?us-ascii?Q?O0rqzLjFQ7dhlu/s3p4YTcYdBntvYo/0iX+VNC8iP0f3CCBQptgsG1FACGdi?=
 =?us-ascii?Q?fhOX3357kBVxNJ42Wcw4/Obh8CG7p++Hm8Xd5gITAEpOsfAt+h1CaTh5vOJQ?=
 =?us-ascii?Q?xgk7yHMZQEmHdYUQG0+jVT/KTUzm52qwThkNXtsM4ynkx7tSwt7d3cSpdtJY?=
 =?us-ascii?Q?sOyOzIG5ANczc3QXnkZaaDWuky1mHhfUKh1X4sMWdKbkAcOf9KJtOAF8dmFF?=
 =?us-ascii?Q?iyQcSI2spTpifiwV5wFJRsu/xb+sxtnD7xXQxYRRr3Hp2Cn9BR3e6MVLPjIK?=
 =?us-ascii?Q?XIpCMCwXCNh03GPguAi2kghS0P8R7Ic3IstLjY/qp6AhImgCbHyE5qYzcy6m?=
 =?us-ascii?Q?TOVQA/pZBIspckKfe4Urn9lla+OINO1AUYRX5djBum5ph6yzFF+mj4PiWd0k?=
 =?us-ascii?Q?CVBSgLDIlm3eXrnKxbICPB1TujA8weU96xa8O7j0qz0KrvNyPS1KC+oWjF4i?=
 =?us-ascii?Q?Os0UCYk+8xOB4ccWZ0FpMM2Ll0ZTll7MvhKnzvv3ZvRPIg2MbODbTnyMoGM4?=
 =?us-ascii?Q?NlV6jmun/B3MUpC3rZVk0E6WFnkpJlnle6iZAOGOllLyyTmwhLBxQ4jVM5A7?=
 =?us-ascii?Q?W4ooKOzsXys8F3RYRMUksAEQnDZLe+qapZutZC/YISE0KJXAewg65pm/wxY6?=
 =?us-ascii?Q?F2gRt7Dbx8XDkhpeC6OWWw3P9ZuAG9XrYOCbXvAR0SfcxD++rNSDBBaQZ+XO?=
 =?us-ascii?Q?DbQG6S+fMkAFzW57aumzk3kdcOHxbSOn3JWL32Z4srJun3fVOFVmQODHJHNe?=
 =?us-ascii?Q?Zsj09DAcxTYGm3Mb2W/Ip9MxnfZd9xzXz4TJkzq7sgTlq3cZDGcIQQdn2nS5?=
 =?us-ascii?Q?x+WTi78QMP/2dv1NmAec/XKvkZUlkQtDOScPd0qXYxzy4d/orgfOyIwvUJh+?=
 =?us-ascii?Q?Y6RcHPg9CMTRe1wnPJLvZVK0xxTGzwEi8zCHewKdnymjYvFdwr1KHLZU92nk?=
 =?us-ascii?Q?9nLRAFZptCRPErJF5AJhGCzbgbLeOCtqowQwVy6OAaxYzLVd6SnshdqDi4Qd?=
 =?us-ascii?Q?4MZTahMiZ6hN9W1HNIyGJxiDt9tRD8WCzLwXNyXcpXezbaoDYInyQ1y8vtB9?=
 =?us-ascii?Q?hATGH/3KTA50467Ace2j0w6KZzzhvW9OQbMd9+vr9PjxGoC11o9SQiY3a7Kz?=
 =?us-ascii?Q?9YOd05yOkThrfzhSxDMLE1Zr+UsENYcaWeJHGZs9Ibqd8gAatKn4KSgMyBtx?=
 =?us-ascii?Q?LaKR0nGawD/jvq6MWeUJw3PWd7bziyk87DnDZ8yNSiJ2/z8aa3XMkZnD0miU?=
 =?us-ascii?Q?h4wHU0qEnMnTXIrTr8Q0tWOcwYYDwP2tZElumtp7an9EZM8Ne4PzP7nh482V?=
 =?us-ascii?Q?33fQdnshZMbOaSFqYWbb8CWo9WAmDlwjfOca7k4TosinJxasr4s3Arvx2kYg?=
 =?us-ascii?Q?Sj0i7lpTWjltxETX5+JCNe/4thRjh6M2jrshnZ4mRwqeIISOg9194kA0dq3T?=
 =?us-ascii?Q?t1u6fCsB98JgOYt/3E97Ak4cLmsky9H1XH+0PCEbdLQTymPrVi33QcjSJX7h?=
 =?us-ascii?Q?xBQaGil34eerqyeiPEuY2iQne3dpFVEd65ekBRBGJgSf+I3AD83D8Ej8Q6fk?=
 =?us-ascii?Q?poHPMR4RURy2P6NN+QgwWyxPsnNPsX4oO4aFtJ6Vq9MqO5GCZuTGuAFDWDYw?=
 =?us-ascii?Q?ufEdgTGunYcE0rIdikRcnrpPQxy1gQEOW6L3YvNK2hU8xnZ7vHvJW2gFrsXB?=
 =?us-ascii?Q?KFTWlEaSXA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a081c0-e416-4f30-e70c-08de69dcd660
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 02:17:14.7123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDexIheFfpAfKu8sUNgFv3yyCj5J3pqHweYrvhaVHTyx2GYo4WZ117jPo2yxTziPY0prgbfD8+9ju1ikU8pCnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

When including the dai-common.yaml, and allow '#sound-dai-cells' and
"sound-name-prefix' to be used, should use unevaluatedProperties:false
according to writing-bindings.rst.

Fixes: 8d7de4a014f5 ("ASoC: dt-bindings: asahi-kasei,ak4458: Reference common DAI properties")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
index 1fdbeecc5eff..259e97b7a3c0 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
@@ -60,7 +60,7 @@ allOf:
       properties:
         dsd-path: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

