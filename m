Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793890770;
	b=3sWY+8NVIAviutr3ZlkdF1gvkQDUvhWiVGrp9NBMggBxS9RHXIeWq+VnlnQBTN2LT121
	 fIlPl86U+A9QIGwJMPZObLIvPfih7pv/cMIahHmNIFW5TwCDArp8wPHM0c2vVFaYkam4l
	 GMYRYJA55Gxiwgj5gNdNIzms82KsVODx8kl7F2Xn37jlKHVkWJM0dRfQK5iBFJP+jrz3Z
	 fbBaPPOTUigpxClXPmMw4/oDAOFl69FO7ALLrv8E1WhWPW+7HkZPnP+/KZ/5n3f7xv2bT
	 wct4LQe5RmIowZYmCu4uwLXoVwVXnhajLbPNq8ttIk/ImNq8klJwHzyxrzuy9nEPKHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890770;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xEn9bBfJyeN7s0bkcYXtebKhISRaDeVGGV2BA0cEk8Y=;
	b=oK9CMhRiA4xIKddyrtXTvG1i49wlI/W8AtkyoIVWMe/q4XmtS29KCGaGbV81fk4e6Vxb
	 dfDmTlTO1FH+2ykeHDHhPWuyY9Z0SqCbvJeOdrPuji/MI1hbFHZTXJ6/kP5L/+UqWd7Im
	 Z26xR5qW3K/COPZxR+kshSdYB2M4POzXBBrSS2GG8+bJR9yWhQjQR0XefnE7cB5rqku4d
	 d8FFpIta2K1LPEQFLqObIOk3/YYwbpYybIHGS6BakzO8uL1eMk0lErgEk56t9cNmaYSAI
	 oQnBriv30MPtbgoTrlM/WWtFZIlJNv5+6/0m8309JOpEkZqGCDqzf8/WdinzVEj/qPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=IzhzugqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.68
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF0606A326
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 14:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2EF0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=IzhzugqN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC9ZgXMp0uyo2AiPj+7Hd0KjQXBrmcS0ClWdrOSuLnXqzXzlxlBEHYLf+a4DRvOyiZgnK3tiJOC/DAX/9AhibpUXMy/bXea1vu/owbWKaSe8sDaGYAWyivRfkgxPao87y5CgU2xPsPYB00YA0HgymBvk5WQUPUxCGNGO3Mq6bHoPlg4wQp2pIbBFeC3+TZgHV4l3oexuijrSlWw3DRXPju/YZt5x4uEhDcWLDhCUtliX3SaFtFKrqrfa7qw0M634kRkQpnSO+J5CeS6DsW8eu7UoX+pmfpvH/lqwAIgwS5bJluk8jdPvlbfnDqm8EnGD2yCQL4OeI9a97bqa/WF2Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEn9bBfJyeN7s0bkcYXtebKhISRaDeVGGV2BA0cEk8Y=;
 b=KUgcjlL1SOkqN+Rplrtr46cwdCypCBUmvzePERXM5FkDFBb844bmbQ0YmlfXi+yITgpLFi8X1n/a9EnTqm1AyLeA0L74nfRwQ9beif+2/daIE89kFrv6YGch8QKbDm1ZzN4k7Q96fubd1fUVNNbQfav5TrMgcwNKYpsKumgOs/WmIW8T+TNl1eVw3kBMvnMmV1uA72A95fZ9pXcnZiC1pQAptgP/t9rC/oktB8XxaOPyhUT4O+O04idYZZFOWY/nsarO21AU4j4kQ6px6PKJ7qP1eXnhaO8P7h0MIaQ0/Yi0aCWn8WMoY4pPGjqIk/iBb9XbCRtbbzxZfmqOIdU2Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=iscas.ac.cn smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEn9bBfJyeN7s0bkcYXtebKhISRaDeVGGV2BA0cEk8Y=;
 b=IzhzugqNLQxfAlRH3uI1Ix5u1wwbcIU88S6aZYZQ71mkThuBuU+R7PrpPf5jKtI2Hdn8hJ/uvnnxuR9VmJYQM5sp2BTk7d4prgQ2Ao0GVBlnu7sypSTL1/60SJ7OvZesc+p/2g8w2B8RylDGv+PuPZkGkaDugJFKv5vUPigDDFKMOvWjx17vDqLaA2RJ5lFT+hqdOQn+kj4O9m113vPV8cO5oXsv533Y4KQQIm/kU5pInWPLkDD4XXfqatCDeogM7Envat6LRCE/fsgyiqJ2cJlQfavQLEIA+dgqdygKTcfJGT2HcHXIAiTl9zQDcwd662ETlgGN80xdJJeGGyxrlQ==
Received: from FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::6) by
 VI0PR10MB9075.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:214::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:59:27 +0000
Received: from ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
 (2603:10a6:d10:1e:cafe::ab) by FR0P281CA0076.outlook.office365.com
 (2603:10a6:d10:1e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 14:59:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E6BC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 14:59:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 15:59:55 +0100
Received: from [10.252.2.182] (10.252.2.182) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 15:59:24 +0100
Message-ID: <5bd499a2-2c79-4cfd-abe3-5bca88e3ce02@foss.st.com>
Date: Thu, 5 Nov 2026 15:59:23 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: stm32: spdifrx: keep the control DMA channel on
 config failure
To: Wentao Liang <vulab@iscas.ac.cn>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>
CC: <linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20261104024051.1508703-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20261104024051.1508703-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6BC:EE_|VI0PR10MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a96d63-3fd6-4a3f-b531-08df3b4d6269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|22082099003|18002099003|261021121427099003|11063799006|56012099006|261028144727099003|261102123227099003|261026140227099003|261022105027099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	ZWwVw6MvQ0bEdCjsMjamyPVUrHH++KwCwCnsWWQUVg3CkwazqFs5c3wpU1JbSWCK/DgVTkyjqhzuFeGSxGpk8eZw+Vk78cURWIcpTdTWM774oXJsFU9dX8Z9EpQYK09iL5jd3MClqulHJl/C3LdYu58R7E4HpA6H4CPoHikSOtqL4XeXVorcE2/yuHgJEUCTgIzw+u4b2AKzpuo2XWNoKeRiuGFyos6QrcYng1MObX/MAXduGJXB3fewPFlDnpGisVjKPt+9lW8yg3TszDW89tuObUgexjtl2VKRLChxSGqZEs7As7EK+IatnTPhVrptadpAdrAbocO3lNZSkbZuctzgyj8vJAPFOdrpiScRdXXyQQGCmeAtYrttPfir+hnueI7KBt6l6vcw4mmyEOwafiuYgXda2ah+GDUrdlW39/tOpidfhCcAoNofkw35Vuss+FEm8mnNa37OjcDyItfhIJ3UXJNZ8qFP03wO5A0uYsIpZgG2Gz8MCwk9y0cmwT++bimxj9fyVocoA4o6xDkeLC+/XBZI9okuCIhahAFagD/4PQIzz0Ld9+V6A13tFoYP/FYADB4NA5Jnf1uD8qC1cyNE0p2ZAA9lGeNTQqGq7EnSlTc9slHXuUssCQX4DIL6UfNthLe1zTV4I5QDSTHWw58tPCWkIcII3xDaDrSQHPoqCw0sSI0Gy6nhRnSQKqylKUHVlJAhxZhYsLcWvdnSTg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(261021121427099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261022105027099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V2viam5e6RvuhYPQX8y7qfyl23XzZojnA9atedbyCjnkR6LyfAA1hG4IetxIQ84TqEB4gx/nwPaYNVfhDv1jdjS/GfdM8YVJfXWQlCqyk9vkjiTChB2GQRvQc8Iwt1z+eOv54vl0GbBgJ5LnU8gsnyikntxOJSJf9Inqg4VCNwxjBBkhimxSgUFN9fXNhlivPha89yH1acbtj8NBGBow9j5yASmJySWOyDK4G/ZVsdkCz3a3Cpz94XB4yhMSDqrYWg+xXJCDK96hbyLTJqh9vf+SPmvutVAo4bvgQgl7jNg4b53FZs3wpnKuKR7Ot8iF5d+x0f/hZfPNazChduuUJFUxuno5cfim+v+fkw+x2SJra8NzXpVoVGi9pEbFLYirTVHkuaEvVsJbLtXTsdiG2MKJaBa2eBaIBStMzTZjmea8UPTkZ4m6ln4aAFMmZBAK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:59:25.9288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a96d63-3fd6-4a3f-b531-08df3b4d6269
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6BC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9075

Hi Wentao,

On 11/4/26 03:40, Wentao Liang wrote:
> When dmaengine_slave_config() fails, stm32_spdifrx_dma_ctrl_register()
> sets ctrl_chan to NULL and returns the error. The channel obtained from
> dma_request_chan() is thus lost, and stm32_spdifrx_probe() calls
> stm32_spdifrx_remove() on the error path, which then passes NULL to
> dma_release_channel().
> 
> Leave ctrl_chan untouched so that the remove path releases the channel.
> Its IS_ERR() check already handles the case where dma_request_chan()
> failed.
> 
> Fixes: 03e4d5d56fa5 ("ASoC: stm32: Add SPDIFRX support")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   sound/soc/stm/stm32_spdifrx.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
> index 88863dbd05d9..ce75929daf73 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -425,10 +425,8 @@ static int stm32_spdifrx_dma_ctrl_register(struct device *dev,
>   
>   	ret = dmaengine_slave_config(spdifrx->ctrl_chan,
>   				     &spdifrx->slave_config);
> -	if (ret < 0) {
> +	if (ret < 0)
>   		dev_err(dev, "dmaengine_slave_config returned error %d\n", ret);
> -		spdifrx->ctrl_chan = NULL;
> -	}
>   
>   	return ret;
>   };

Thanks for the patch. The patch itself looks good to me.

Just one remark regarding Fixes reference in commit message.
In initial commit 03e4d5d56fa5 the channel was released before setting 
ctrl_chan to NULL.

This was change through commit 98c8dc2fd59f. So it is more relevant to 
refer this commit:
Fixes: 98c8dc2fd59f ("ASoC: stm32: spdifrx: fix control DMA error 
management")

With this change you can add my Reviewed-by.

BRs
Olivier
