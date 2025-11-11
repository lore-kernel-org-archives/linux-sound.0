Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316051A073F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820627; cv=fail; b=OWZJRVwOrTO8x7uBepabk5Jr9d7a0O2ZpFpmMG0WTBe3hzJDsxsDNwRP1APzYkHC/VKKNEQJdrtnMWPTv94WamlCFC/diJBLi3uVcRcIcKRkcrQ3xabP7U4BNbPgviLgIsB8NkdD3fgHOgtb1V/P+e6HwJPKcYSlSK1WLcCTcoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820627; c=relaxed/simple;
	bh=sZA+jW3F/DtXcH/NUCMoYv/P4OkLhcyEvcRskMdEiPI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PfOr79wAWiyoqK8pDDf/Ma/yaSiJ/cuGW/sI1/h3wMPlSDM9BYyNyT8LN5PtNheXCNbMWvnry2oc2TZ1dsH5IOzT/keHGibIR91N1iqnYWv8GYO4phkjXQt2GRSKUn1dt8S75/EvWD52Y+KWW3LTpT4H3iR8ACQNlsP00+EV2yg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dCrgBHws; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dCrgBHws"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbgmygpPfTanhjMQkq4rZcUOJSP+skuG0b8IJ2cwEh6N3gM695LMI4zrbmrBtvEQQDblXYSD06grv9Y62jcVi2OtSZB9AhesJwQ8J+yuA+9fU7wjFhvB1CffMsF4B/zXE1P61JbL0g4x4Hca5P/R9x5sNMc+P5WtHgSasC387HBfanzzRiYCq6r53IlAxqfmwT95K8sKiYyX4nRbqNt39UoCCa4eIHW0tvAZK70EQKhGvM7ZrL6FzMEP84iUkkmaBzsO1JWNiY91oJFskmpOSiWiXyw5WGPYjrkbFENeWzHxfKBejJFH0S9l/veiM5V5LWlQzb9DT+7M4DrU+uKB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt6pYLj3+GbE2e9f96HmnLW/ItvnDv2WwTU56jyFuqE=;
 b=nfpDKwzPPRp8FOX1SSJha2UdAoKTrKK5061Exqw9v2rRZpOqhlO4gHtndzCgFVWsdjqp92YJoZoq1YVdjtk+iDwDqa7blHOQDsn9HGBnNxpLA3RgaKUtlEWoztLECNEVWJ8lXfHXovMPjltFj6o39sGanatdbN3iJUI0rDG81amCLQDHfPJHrtiiLPNHZ4LpZftIYDgUuTKYTtT97VQA58K9ybpLobPP7UxheMIjOC+7yq23GUSEwJu/7ms4DvWuM5HZq8JqenYyx9q9T1VkwaboHZmR5SYn5V2iaso2kQxzwxcoBJOjag8uFi4ItfmQlsIQyu1NqxqFtlZ3mOGfwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt6pYLj3+GbE2e9f96HmnLW/ItvnDv2WwTU56jyFuqE=;
 b=dCrgBHwsRPAJ6PkD+m5cIdNDoeY8qIkvwxQN9JJ27DgU2/0OqS+PwTmEgcp/5QDG11cL70+VXty8EEA3R5G9t2QYtInyBN4986B9m/pPOe3TOESRe8hqWzZRaWfUAMs3XNDpj0zJnITLnsvAz9qSCX2EIgGsVvw7UmuKiVwcGLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10376.jpnprd01.prod.outlook.com
 (2603:1096:400:248::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:23:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:23:44 +0000
Message-ID: <87tsz14dtc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 087/292] ASoC: codecs: ml26124: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:23:44 +0000
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10376:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d152647-0888-4a06-1daf-08de20b892b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UYrmG9XIPrIpO/GhddqECI0p9cy4Mz7cnPO+FTZZHrddyLzRZURdW/6wBmg7?=
 =?us-ascii?Q?h5LJAoEaMzEAkOdjX4lylzceYjaMHxtptMQ4dRbSMqIcpirm8+ZtIf3Fm4Bh?=
 =?us-ascii?Q?FmtScmv2T1yH21MbQ/0G5TjDVaqbFOEuR00ovbmw9bMMjJIMHzyp1ISdTe8v?=
 =?us-ascii?Q?cKEf49AOnVCeWPyQ9xM9X4oYV+LRflguaT/9vdKD1bQ9j+oqUrCCdi8KjwGA?=
 =?us-ascii?Q?xu6jE5NeHkiWJk61b7k7F4IkfGHvI5mDv6QjV9by/U9qo0MhoLFMyeMqh2E4?=
 =?us-ascii?Q?EIVbgsOYJEG14deFVGR/fVyIJijjf+qTtZOyoHZQZKjykxC5ditfUSJEBS8D?=
 =?us-ascii?Q?LqnD6ra3+MG9/dzkbHivKJ9ZTOTP/vbO2OZNPCAu5Y/oj+eX7ICMNuqh94xz?=
 =?us-ascii?Q?DrXnr6u9WSn8qatlHrDK1buGiTAupC2GtnSa5kUkfn9H6Q6RCFgyF7hFGYSv?=
 =?us-ascii?Q?T0/yUYIPSaFfomMYnLG7lDomRQSgb42v+JBg+eQ85tExENE9IrzNUWL4gBHC?=
 =?us-ascii?Q?UgdIQ2yk1zqS8r78KAJ3OkhtRfcK7TG82a1+Q5UYID8RRifIrztT01iwVdqW?=
 =?us-ascii?Q?EYo63SqX39jir7n7BdAYCHbYnSud7LbO/OdESaWSqYcXhNLr/U7RiElNU9dx?=
 =?us-ascii?Q?b/DyFwnWaQkBcs+t69bBDDfmaQHP0kq7nAbA2bLWMZfBKB1tzWafSQyaK8mb?=
 =?us-ascii?Q?Mo8fNahou3q6CtbGFzEOLvPBzNlh/wQa3CmjJ1HIwlJpOgNpUgGd37JKi7qh?=
 =?us-ascii?Q?6lEEwMbgqbeQdY6tcd+pmVnQ2Bmq5suoB8+OsmGLbIv6RR1XlP5fRH27tCws?=
 =?us-ascii?Q?PGFCLQ5kkByvnhntzkb4mT/2Mffcunr2XgTwZn2aYT2zq/GcScLUjxdb54o9?=
 =?us-ascii?Q?NhnYLOEMVutlaWGrYRlkTbgmqGQUWcbMEdxZgON25vC9qpd8hB+fOPjtFCIY?=
 =?us-ascii?Q?4pu8pOPBqt8yc9McEuDZbmOl0aHv3+9Zv4pLwY30KXIM+sRqHQppp8ePmpJS?=
 =?us-ascii?Q?Axnwxb+VXYYEGPPVSHWbzohU0DoB/CuzxmkE3okpF1y7WTh5xjL62wjByEIS?=
 =?us-ascii?Q?OSkGUPUY4aJrQiCHoSuEhYEz7xF0hGRNEKLk4lquk9w9M9wuBlum3ZKTcYj5?=
 =?us-ascii?Q?UkBrk3ShHmA0rPZGBV9bXYGUSUkut5cyX4gQsK1KhKdsObzSPH+/R9pAWWOU?=
 =?us-ascii?Q?tyhPyyj4jD8oRvKr6yRRilxFfdKn/wAiJUVbzO9IvzJW6JEkonO7bNt/pKdN?=
 =?us-ascii?Q?kw81O+0mQi426XD3IttImRzuOwZP0gNdiegYfi+OR/vXzscRDEFxeuLMw3FC?=
 =?us-ascii?Q?IFXoBKP/9Q2O99g8qbpYkcm169reM3YN7UwnzSOJJaLEQr2ZusfUVT5R3Y2Q?=
 =?us-ascii?Q?xLPl8Cs1e9CRPCneD4HFlJeg84hoJGSZHEOeSxBFhm6ww84yvVsu6mIDSGhk?=
 =?us-ascii?Q?lPwRr0mkhwiWKzyBW9zkp6/+PlvwscrFm4bSSLQMoRKldOTf5na4rlzs1aUi?=
 =?us-ascii?Q?5bMDfXO/IesqxYwCL4S44Dkr4wAqtYPQ9kgF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LZsTAQ9SHX0AXjHwTQdQ2ZZ6/R1t10qestQ3c3Jlw32vnDIq/PEpyxH7T5ai?=
 =?us-ascii?Q?SrkkzHiGOwjOiNk877BfugYvHsBiqfNs8jmfOqWpA+LkxtJSmCdffE1gF0ea?=
 =?us-ascii?Q?/2ENYtezztg8+Oyn01jqE52cfaswe8pr7DvOHUym7eEcouEwIp1g66jYEYEy?=
 =?us-ascii?Q?ob79z1MTORahooXmg1sryAy03BSTGJyzVa8ForE3dKj1+mDMY8XGiBkVI6is?=
 =?us-ascii?Q?LvXpSB63HPA2T6Gli+o1h67qEX1oax/4qU+6qsDR92wdn9eSWg8tAS0w8xTA?=
 =?us-ascii?Q?5OaLfGsWNT/+z5hk4DljYyrKBzUNVXNz2+mrMpY8hUFVdZEfWw/sj3RXiXle?=
 =?us-ascii?Q?zYgiXMs8JBIyJ1UCeUZ18XoEWMSvxlgoLd4QJtebyfoVwhs5JkGnRi1zZ/rc?=
 =?us-ascii?Q?CyLzg9wWfBe2jk+br7y+PdwZ9XsCKTQlgjcvDh7TvmJrBUNjc/e/42y3djdi?=
 =?us-ascii?Q?TPlf19chpZPc643jf4fsXnHRZxQxKGq2F28/ZfGUcMFO2/xi7KdtH5LP9phl?=
 =?us-ascii?Q?ZBMT6gYikp7kCg6VlKEm7Gmrs9uuNGs651Ed0OXHuiF1Zc3+XMNDDLX4PYuD?=
 =?us-ascii?Q?DqjFAHLQ3q88YDPNQwSlVAI+bVpW/tG0bcCh5ZPY4QnRZRo4f3kC2R/3DLPl?=
 =?us-ascii?Q?fLY8jq5pLAVRSoMOv6cMnevqhZDoV94DxGOu4fDdfIjqWY/dSvf+/z68oIql?=
 =?us-ascii?Q?QihGjnRHUiDRgaQ5exVx8eOCXXx6JRJ+w/l+uIYGkiYVnmPZN8h9FnJJLUnH?=
 =?us-ascii?Q?BGgQOq0TRutoeIcM3XnrXLwlAkaeX2L+IRViGDDpI8ZNIMDKYKGmBh5wwfq4?=
 =?us-ascii?Q?It/Eo2OovcE/wCayEspIjwYssqwezMJU7VSKydxNtEOAGu/NrZ0jdWzFnrLu?=
 =?us-ascii?Q?l61O+jQGr/hK8CrmJktkglqapxTewivzwR7hHKwbKtKvRFaBsdvwHVD0AjJj?=
 =?us-ascii?Q?ZbzbzF+zFzQ7EJW1z8a2Q2dv/pIG55wgohk0Juq6mbg3s3hFwEIQevZvPvkw?=
 =?us-ascii?Q?0SEop/utzX+4oZEPNg8b2+4PN9jMIbkWS2zaxWGUjJij9N1b1bsyZayK/ghY?=
 =?us-ascii?Q?BaLv8cQIbVpeeVdHe82MDNjDEQJafY9Zxg8oN0R2JS9/T/hqyhmc3oXd7ieW?=
 =?us-ascii?Q?ls8NsRa71pwIwkpc0zcFoY6iHlzBxsctW9teebvyDq8NiSP2wjddRdp0HM1w?=
 =?us-ascii?Q?dyI4VxA6UXqB7JO9ja1kP/BP83S5Kqm6WOhDQwXNXTFVzFBkxNCl79GX8OXn?=
 =?us-ascii?Q?Y7Rk6z0C7ocCTPWjou0/s5xxUB3KxFFGHhDzNk91d7KXV3N7wHxYfGwlMBrE?=
 =?us-ascii?Q?v2+bex6jRUrlpDdjgymZdHqjb/sY9jBAwj1u76vWskfc5N2XG0n9hwtBD2UK?=
 =?us-ascii?Q?+cfon5QE+VBddXK60L/9WRLZsVaei8I4dNZ8yNO6NeF4Dju2q5SwdrIoB6yA?=
 =?us-ascii?Q?dz4aZk4gi4jWWQL1y7KwiTpP9LKz4cq12WiLI4FX+gwHKrPFsEJHdmOf4YTn?=
 =?us-ascii?Q?p8WvZ+0/sxgzvCX4Z1jb4HMEUCuBhUC1W8RDWbnVWqEWFBOuyPQYpVy78Zcp?=
 =?us-ascii?Q?rs7SYWEYTxSRRXVTo6N0pBaASV8oilMiIqB8eo7UFeYfmUMAITo9fDG1Fjaa?=
 =?us-ascii?Q?+nKvl5e5jOcql/SEftvQbu4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d152647-0888-4a06-1daf-08de20b892b9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:23:44.1987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0yUJNwnGFXND1RmvZfBr8ocIdmdoEfirf4JEPKzws0Uq6oCrvNSfhR0l12oDzD0vbKpwe+vjL37PCll4VP4slFLXR3tzYC/10Xc7NfahogGaX9gcXfeqj1iN//ZAgC+8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10376

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ml26124.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index c6585e8143a5e..fad0cc9023461 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -459,6 +459,7 @@ static int ml26124_set_bias_level(struct snd_soc_component *component,
 		enum snd_soc_bias_level level)
 {
 	struct ml26124_priv *priv = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -473,7 +474,7 @@ static int ml26124_set_bias_level(struct snd_soc_component *component,
 		break;
 	case SND_SOC_BIAS_STANDBY:
 		/* VMID ON */
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			snd_soc_component_update_bits(component, ML26124_PW_REF_PW_MNG,
 					    ML26124_VMID, ML26124_VMID);
 			msleep(500);
-- 
2.43.0

