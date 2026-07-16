Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012065.outbound.protection.outlook.com [40.107.75.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA25B41F5E5;
	Thu, 16 Jul 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208166; cv=fail; b=baalGesvAwMFr5jEP0ZZX+xsHp5uI60VxckKoBCMC2JWZEU0AZ+A2RyxITqh3Fj3LiQp4j2kimLu4P1IQpcKp0gN9ymyN5iK8ha0DB1YBKHNdnhTwo+lT1S0M9IN6tFN+wePS9o/fgfnhaNT9wi0ZOGwvhfChRdwJx4kZ4StvZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208166; c=relaxed/simple;
	bh=rzfg91JfwtKFs+zV4y31FjodBIj20Tj4bW8TVe3RWDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gBRdguDGrBy1qdqBMNjX8qu//mEoJ2OOpuJNe09mkGVr53/JrgqB4ACkPUVmVTKOaXmTWQMGezA6bBFeLWydm+OgWjl7dlBWnBx0P+ZG7gDR5qQy1eGYgj7wefY6/9HNh3VvjSEs9NZrszo9iuNag0eDcXx93tRtAizoq521jG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=aBI3Alph; arc=fail smtp.client-ip=40.107.75.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="aBI3Alph"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFBJ9Hp6KWQ75elNwKFRPWn8rCo3W1KXTddEfgB1tmfxGpApCiriZ/5t/3z+4lLVH2lp+qoxmiqlXWdAJkN23FhiJ1y2Q/ET+ugWG4dYIUn4esV8/LJ8ubh2XExvk0+5vGC55VSOIK4eL8PDXo0OI3WCvzl/p8q0+RREW7NWh0v1rAfXgcHSPYGgiwckn+jKUurU7qKx3ZvuT0oNA9oz3aaRB5XsMRDD9StqQi75VVg6cZ7ngORzJ8ZQZK5TmnsKE7R0DQIRMEpeqM0eiG6cMMgauIufcNFGQ9fJUZ5ctXhzekvk7c8LOE5ThFkICLL5o6VtmGZwFf89SwNaANGQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrTsDyxMp/lXU0tmsU8Vl9t4vzDe6p9beBjW7lDznmU=;
 b=Hx3JhcWXfpyFNdj6msokO0d6sSOK1iVvAtzBk9GTBv6a4XpV0xnpvTR57VUolXng+7Y+TvOiuw5FpRUvVmEYzu4SWBcYxUNosIYpyw5WTnmN9SQq2/zS/Ac3sCESEyypeDV/ga39N4sM4Qgk1uQWV+gBtDX+kZHLu72h/tFcELBkgeoI+MZFWHJIlyYZgft3EAsqrK205QoNGALcxogcaMlbXnhE4tw5vhxiBNjEgS/OE+TDCqMExhfSPQraBKcylTtirKB+zsQ2RQW8kdHLmbMgQONnS+Vi/RU9Otp3x+s6GLnDReyv5n2ul7fEMEVjWeJPWEHIKTByhiFRn1qVAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrTsDyxMp/lXU0tmsU8Vl9t4vzDe6p9beBjW7lDznmU=;
 b=aBI3AlphoC8nM16PSkF4WhCzLmM/5Zhr2KgPJyeex8RqL3vQJ958YYFWoPHdNB/ZtBNHoC1nKSN7W7xlIfJhURxDjCDC8DWVxI4nMV0lSssFaS+aeiK+1eCJAy0bLrlug5c+dtcfw5Ueg6JrSAvDH4tVqAX1/pIfikTkXhVf+9n9HQXuAXKeQG4vJu5rf8rZ8jxoJkY7dM45xLx6ljNRkBk+8COjieeJmYjw8ne5fJvpZxp+rYruEPGbNbRgntsrdVcsE7fd8Sf9Sos0vFwuuKELgVHDksELmLjgosTrjZbZEnC+kbQEANLfLUWEC+elcZMIxrXLQv9jkyZPQZjpIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYSPR06MB6694.apcprd06.prod.outlook.com (2603:1096:400:472::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 13:22:39 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 13:22:38 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-sound@vger.kernel.org (open list:SERIAL LOW-POWER INTER-CHIP MEDIA BUS (SLIMbus)),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Remove redundant dev_err_probe()
Date: Thu, 16 Jul 2026 21:22:27 +0800
Message-Id: <20260716132227.589778-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0026.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::20) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYSPR06MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: a5975f6e-18d5-48c7-af1f-08dee33d4eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|23010399003|11063799006|56012099006|6133799003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	fW1OHf6jru1HpwrGr+vKvbSAMJ5SnNCsi12omO+0dAAl2zr8KDVjvNj+AhYp3/AdJkc/JVVFSEGgwAMW1EW/VlBpNxqWQEm6iQimltJ5dxPGnCTS2HLQED6AeiSviU9XzHGBneQlD0ok4Vjyh0KQJbmqTvvawuW435QiKYlhgv68lvcIvsrBxs1GfyM6/wdmVgip6WCKogBKpHVBMJkC6udN4Oc/gEaEx3BmPRRmUXhFGb72+6QE+bwzHL5uJ/cTszx51DdPjcTX5VYL4iR/mWcIlhqgCaCrnR9uXkOHfFZkQksUeolplWpWG8Gkd1TmxrDfKjweZ2U3pmgLuF/mwW1SMNfisXellG31Z16aRYqK969S1vVgvEA1NMpoKSGZcXcCuFMiGCfI9ELAKISLuDOCyvWkcl5wFCVcOE6LVdwPFhvylG0Kk6OgBXcaXN25mWdwj3h82+/Jmj+z4amw5uOH0WmYPUSrc6llOfk8pMZqRhzY1KtC1u2XbOnD380+2oJTLluj3+BSIVM32c9vAorEnbfSo+IQsSYolPRGNDPaIJ5sMVUUNvw2gllhWrf+zOZsFf/kog4zZDXlyyYJWuyqTrWaP9tEUjHvjMTjMQWeErCLRuBZ9iufwnZaW34aD7qHdNSXhGpbrjdmaZbD4qpTj/L4Cktx0EKxvn7eCNrlMnWw8u1KXV3b2gpKAV8OVbuF6LmOYHGF/lXIDKZUyilOvke7idyNtHmvVSGQ0Mg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(23010399003)(11063799006)(56012099006)(6133799003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PlbfY+XJHM04ZBydJWx1ktQadlnz8fE8Uz3K+nKgHKYtPmiIUTRLLJ8QXTon?=
 =?us-ascii?Q?38e1lC2tNFws7flJEME644oqw6OLG4SIrg1ZzJooG5d8OtxuQY9PE1cFxsJR?=
 =?us-ascii?Q?MskHvDIK6zISRieJ+BKK5lNoGxS0mUC0Z2HObvbyoA1d6KqTqZ3/6F4LYWkk?=
 =?us-ascii?Q?igpRr2LqBCeH/EwQX4bdYTKBfbYrW45yhj/GjsfHY3p6+AYcu778lHa53RLX?=
 =?us-ascii?Q?oxavbal1kQteWD5EUkd5KBxElNEMDViTVkwgBvQLZmHDQGAnqSwtW3vDq2o4?=
 =?us-ascii?Q?fNbYmvnu2J46LKrSV20Or47JKmosR26pyntaoNxrGVk8/hoVrhnWlnSu6Opo?=
 =?us-ascii?Q?2nvyW0pYl/ZudoO+SzPG20GS8D7qkPEjCUR9ODmNpXYjbr5URt5HCW2t2HdK?=
 =?us-ascii?Q?3QnGN9W772hRzQ/qWvSjPmBqDKiMXPrTGN481BqcWtG6xlwaf4ezdA18w3PN?=
 =?us-ascii?Q?n3+5HKbfuLrhzQFHVCRZIz46CEqY0dolr+PpNuJ5wc8A56qK0qCc2iuQzdHC?=
 =?us-ascii?Q?ZBbsfLVobknb62bXNwkBnK9MhVXMYO7A5oAXelKBiXG0czIATrlASwqpeisM?=
 =?us-ascii?Q?wq6hv6kuoM0iRvMOz4FwCGlTUDYMKbJKhF3y8WYwmOwFZlG24x3KFpniOgz0?=
 =?us-ascii?Q?dsIT4UUPSMHZLC8Gh2JsaPZXhHra2cRZDOJa3eA7GZMBZo24lORz9St8mOwG?=
 =?us-ascii?Q?H17WkSYcuq5EbEMnBxDgq2bjZzkYBeAEkLPpllSvYz6A+hnwYHpu5NcWiXZD?=
 =?us-ascii?Q?8eXPnRO6ps2FoH3KPE+fZDNZ+zYJdsUdVrbM+lqixtEQZWq+7T72dJK1JMYJ?=
 =?us-ascii?Q?fmxCy2Xzg7+DcxdJKuwCUDkzWMyx6pBSpw1UHRCqJsq82Sw4GAyjavSckAV5?=
 =?us-ascii?Q?/WK3mi8AglHQqme/cf/p7ZCq25jOBnCIDkunRCJjEe0sw5uDZFB9NMTlIreL?=
 =?us-ascii?Q?0SaynsBsfdYTZ70G8KlqRJNj2a1Y6q9t56nnaiWeYuZAStAAz2+LP/S70IB2?=
 =?us-ascii?Q?rbwjsRDiKhqttkfbGiuLHFgGo5iFQ1R/U49Ftpbk9PHS7HKrnawcMwbwnPZ7?=
 =?us-ascii?Q?9iXE0ny3GQ+HgxH6+hI7RLSaJQyEcZh7Ko3bk1/ELjbippS9fDmFI3jU4/RF?=
 =?us-ascii?Q?SrJwvTfHRA3W11DfCHCDutu4S4aNe4dHwGZ023POoQN7bVQOdo4dcX7kjaym?=
 =?us-ascii?Q?7AuMYlLrn/35h17MAzITRFEBzeSSAeSRjzsJ5hJY0OW0+9RTfRTTOUufH6C/?=
 =?us-ascii?Q?PCQuAz7BxfxaF0lK6utMFqnH/wkQ+69N2eBiA/0SPXBbYwIVvQcdupAsMww/?=
 =?us-ascii?Q?tNtWVcAgp+XPtuyVCx4bHY3k3nP1NFRvluDlsLRbe+V5OSr388NJiPHqugii?=
 =?us-ascii?Q?VmZCywXwJXJOXGzbmORCLRn+uBCSs8HfMJvf4prQf+KPRvwxxU775auPZfNu?=
 =?us-ascii?Q?HjznEvuJm7rn5ZR6+1/Micu5Bmnu7ve+Xuk3JFHL+noFODPXTHyrOBF0Oqc4?=
 =?us-ascii?Q?OZpx35dbYLz+slcyFQqMfHg74D5WbioClNxKVItmn87ggLPPatXRF2YDPZ0w?=
 =?us-ascii?Q?0D5o3G/eC0zwpH6hlAJkWvSZcvKJDbcbWyWIQI5h1EPObvoUEKrTQ+bxQ+k3?=
 =?us-ascii?Q?vlFQXWsCpnqMMCNcqn78LNeaGNnYpE7rtz2Zz/zeflFxKuR3+kQYVr7E1Q/4?=
 =?us-ascii?Q?2kM1O81fpPW5ste2PVdxWy/eQeCphjuyNQQ1SWzTNzPKuW9XFGRpU/CFWw2F?=
 =?us-ascii?Q?jxHjRjCbhA=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5975f6e-18d5-48c7-af1f-08dee33d4eab
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 13:22:38.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwG66SdrZ03IwQgPRqiclNsHwPlupWVWd3dakg0vuzkszv6Tx6cVeq51+yLfVxjf6I0L5mphYc2oYYgumX1ozQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6694

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 934c44c5bc1a..a2e919df363d 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1613,7 +1613,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			       "slim-ngd", ctrl);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "request IRQ failed\n");
+		return ret;
 
 	ctrl->dev = dev;
 	ctrl->framer.rootfreq = SLIM_ROOT_FREQ >> 3;
-- 
2.34.1

