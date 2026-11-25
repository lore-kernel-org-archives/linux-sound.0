Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570934;
	b=j1mVfg0RhA9qMn+ZUiyRZy0VcTNHi/KG61DKhbg+qsQu/wuY11YjhGjbtWQ4NujfsosW
	 D2iyx6LHyHdTDZy2v5jBIy8B73fOLWhqUabFSHkzcjUoy3n3YeNR6Xxtm/8Gi4FMNv2rx
	 nEzd3zUNi75JJItxwb0dV5SqMMHdXDjbjhdkf5GF3YYMMfgdULsYca3iLjgHKvha+BzGK
	 uNMoIzJhUnh4ZR20VxJVJUH6BgKTE46TlxyX9f4a5H7YrMHA02JwZ9OAcxFKwR2Ir53dA
	 twwt0tkYZW03VQrkx+qjBD/o7BWz4GSggXC05KlS8XzCOP4rfg5tIraCk3qLY3PDYeg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570934;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=PA12KQFqQm+vuw1gAce57AzohbRJnDNrXa/nW5DkEMc=;
	b=TX/ClXSaDsAAXb+PtgcGdRx81ay6ZVI58CMcw2bW6HuLB2sSbFevNWk4YgeIXxCmexak
	 nY0X5XflGRjapITrVmV5HGlamZ/TOMdlkbdxrmde56H3+uZ3L8OtVuW/b0BCrQZxE+3ge
	 Q+Hsy5WDx0fsKqFzp/TzmnfZdQnL2en/G7eDsEYKIJgbf8U2MKAOeRUN+oAtMxBN9RNuF
	 cxCAL+9JL1yxPYEFPGAfLUww1uA0Lk6tjEgNTWTkwGbtNuHgNGK6+/sq0HNzypulETtlY
	 ebdjrEwHs9JW+2WFmROIN3p3UBwIqcpFJB/rGbZ9O2KQV/u9eD6jepZH4fNrGc+Rfjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=clTxw00Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.47
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4D606A327
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC4D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=clTxw00Y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQ9I8kL/vCxcUtC668ULpBiCxCi1VRuv8UkKSLrp3HNiSBMn3ldUkTgV9xuDuhGyw4/dNd7x9SsLzqiUCOQzpZslzVRdv8G62B2o0YGbUeba0uk/7VCNumuZU3lgijjHqaUFyzKmMTSRCGxF0NzdyC3JMC/EB0Xto8XRkw+UHAr8VaWE6KnvK5kSKscS01utL5Lxgw00+Lbt9Wi4k9ddTDKu1bLbrYEbwu/xhEpSyxM0RPsreGe4vT1CCciSCfsaD+EqOl5OVdWL/Apv3NYTC3ZHqKPdVeVA8BBBG1BLZ2MXo7tpJu8OT80CG9bSxX1SyJdzxctSurX6k/3Yw5DePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PA12KQFqQm+vuw1gAce57AzohbRJnDNrXa/nW5DkEMc=;
 b=Sq5IpMsfwxFh+opduKD66se9beg1QVrGl0DJ2JXsPhAK6U/ZAvQ5cTMwanXvZlJR+I/AdZK9nGTN5vJ3eKxfYyJWL1dayMrSaN/EwqduZDimFehw2PQuRcrSPq/+kfTOC2yNaMamPpBmatWljOvhrfkTvoWEtkltAXbsnMCUUEby8xo03r16k6+tkrBtvJGpotLdM74xwQn9RKEVCvHVl1qIGLKGnPN9hcwxSouQKaoud3tZ/jJKT1n6JRn6HD3AQ6Q6kH03IadZUKyG4g8qZoScxCUksBOIW1IA9HSp7BR4q/k9LSusMJF+3t/Yf2o1HsxkFLHzEN8UcJsbHL+BLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PA12KQFqQm+vuw1gAce57AzohbRJnDNrXa/nW5DkEMc=;
 b=clTxw00Ya5S/GsYnSw4ZGZ8irwRO/OQS33P605V7CDlzodtdPmIiqmBQYfxjOZMVpKCeI0kr8UtH2/OWki+1gx6jX0b+PMsGYeHlrJjkRNSlmhv/3xnfGR+21/aLGxG9X+OJL49ESQOXxjikb5vkDxd0uL5cruE0cKkKlkeqZ54=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYWPR01MB9838.jpnprd01.prod.outlook.com
 (2603:1096:400:234::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.5; Wed, 25 Nov
 2026 01:42:11 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:42:04 +0000
Message-ID: <875wxlg00k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 03/27] ASoC: soc-component: rename snd_soc_component_regmap_val_bytes()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:42:04 +0000
X-ClientProxiedBy: OS3PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:604:da::6) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYWPR01MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 71972ed9-47d1-4bbb-ae3f-08df4a954ec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261102130727099003|261026121527099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	ttrnbtdfhrZczefyWKlKL7DI8+dZhBT33dMDkIaIIwiNt+lGkrbkHd2Uak3O+v/lNmItTTRCAfjUHyvLcZOg1IYS3s+j/aCA4bYs0EBVG8YYo0M0ykuZtobgbrx+h42HEm+NkskyThiUsrVnzNwkQgoSZzzt941EnAZhHNQo/Esc+v/U7ljzctv2PqqFzHYAou4YHcCfV+SRkz1wvNI7BAzFQPukIkFieiEbMhfFAy7C5oO9ZyStANIxoiQhumdMs70m0mjUItjDdOug5rxzf7vbbHdtbw+5dlHB0Pf7NUwt1ZjZw2jSdt3yuOMcEGARn2FSMA99rA0RcFLBJjv1d1K0T/eq4CunbjkyiPBaQIjw0yOZtnqJ8ybUaYXPmMlzGm2CciVY4Rh+SSEM3U0SMrUXKmzLB2a6goVQeb5F3XllBYThKxL7ffa/ApreNXUiVV88dUAt5GkKWIzpV1eBKQExYIiFzMhuxeLqfU+ErmSpT41vxu2qmCHGRZJUOtB2ALh0xgwuFUbnVpRORT7MCWvgh9WHIGYxKVomBaKQAf/KX1X/fqvxxmQoPNJCrk7ncoefbZa/xKsMZhV/Bw2xGSHeDWY1LunnjSaWHaafh1zHfJouQaqadP7eACNcqTqUMljxHdRN+WuQNrhQqb9LoU0ZPJFLqEJoRkjoYxfOTXc/njiV5MGLRrg3W06sbWgPw4zeHC+BU3wqB6SNPMw0MEYztzjqC7KZv8G3XNDWx/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261102130727099003)(261026121527099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?qBxnDIa5Xc+ekA0G+ky3AAhoc1f1whR4j+av7i/3+UVjFRs6U9LaLBTjSV?=
 =?iso-8859-2?Q?NK1jT/BX+T1Q0Wvr4tnKNAdLGcOh5DHJiMi71mJzv25d4l1OuW/7vzW44N?=
 =?iso-8859-2?Q?Rce65jNRxnwNZPVSKwDE/bGfW3vLBt/ablg57n9HyWIQvZIP2zNCN8hqt9?=
 =?iso-8859-2?Q?SifgKAYx9T8/ItQqCyWmSAiOg1bpjmFtzmCy5n5eyySI2CKPhZFc+KGRFa?=
 =?iso-8859-2?Q?pvKE0qNlU4rcF/1Hjhx4ha4l0uMNFfE4zBt9pA2ZMnsigWPEQecP4GKFC9?=
 =?iso-8859-2?Q?msMUONpBoYVJu/fHPEf2yqwiaouletMsDwtdlgZRADr1LDIWUhauX2tUXV?=
 =?iso-8859-2?Q?/kKrD4YLviw9gj0KBL10F/0FdE9U/kriKHwhqniJ1M8qwAvl3rqlt7E+uZ?=
 =?iso-8859-2?Q?1X1c3Ki02Ca+/Tx2UNtif0iMSO/KLTm2PlF45GpZY2A6TLdh6FpEfbigHi?=
 =?iso-8859-2?Q?XxAMf1XabEl+EzDH/8iDHUmjtSCszuKAm1CT4OnuRUjTdC+FLcuh3T6XIH?=
 =?iso-8859-2?Q?Sp1/ePlUU7EVMeYaEieV8kh4VG16FuGrpYUCut+vXFiFlp8q/ZBu1+bo6D?=
 =?iso-8859-2?Q?aBgC61irQnf7EJ/g1W85/snsi14a93Nt8LcCJPdyo0jR+/YMoqR5UobEdR?=
 =?iso-8859-2?Q?0ALs8CFecAhNLMpijIy3hcPZPs5VDqBO3DfsbIRVYvYeFAvXEUHpeAfObF?=
 =?iso-8859-2?Q?ZBnyNv0c6ZQKG1zvBazICMSxd0TK5V3OJbPbIN/41F2l7ZP+Hmp4X+ZSGr?=
 =?iso-8859-2?Q?yLb1NwrEUVJ/yK4TV0n6vhTGDv4sERYKLIyrIlXEQpPw9uDAsaCYk+cwWG?=
 =?iso-8859-2?Q?IfXQHH3PxhegWGFPgxKvRWN1iT0MfXjnht97zAGpP4Uk9x+0LscmUUbCCy?=
 =?iso-8859-2?Q?PticR2IJukvKBdinaNlJ0wsHDbN/7SOpnPPKZIl7TFiJbClthIuVClOrhy?=
 =?iso-8859-2?Q?GZEHz5MKYDvcK4udLjZgVBXWMMCLESY5KBsbGb6oQMtLe3C8+rUfaNsKLV?=
 =?iso-8859-2?Q?IbIC/nRCT7f2INSxt71YjnuUiwItB3DpEmpV2L8eIcxnxzzFiD2yXRAdeP?=
 =?iso-8859-2?Q?RJr3t5yhKcEQl+QxLL2Ev77FL6/1g4EColfXaTp3l8e+JzDVnV0TK2Urzf?=
 =?iso-8859-2?Q?zeqnTfkQql0hMXEEqowkTv+ckSrwJJ6ee4RjZ6gTnxMA0hb86oUyGxdFm4?=
 =?iso-8859-2?Q?35L4wt4upn/XcBu7RAmXkZ5OeE6musjy+M63pNRe1lImjY/s90SVZ6vmkH?=
 =?iso-8859-2?Q?mBLGP2D+66jr9Vo5eRIoHQxKTYoQSnjscq1dwTOBuUTDWtVbFSe0xwYpqi?=
 =?iso-8859-2?Q?amwDckdoZoiGRBjSv7cvVQ9iX3r7zAM9ND7gbYZN5KhUmUziMSvWYuJt+k?=
 =?iso-8859-2?Q?NQEEGDoY94S1dAqIqiFIRuEBYvKP6NNvgS+cr8UKwiwpXQJ+H4D2UVg7ce?=
 =?iso-8859-2?Q?8v9ZNSXaJV9BMkVBShLEq8R2JZQgZk7bmSjD5m9G9PhD6VFBEnWQHHIWck?=
 =?iso-8859-2?Q?rVuaEL7vnnw8O+Bgq/qZd9+KbD7htCMZBWd3Yz58e4B5LsNNLV8WarptrY?=
 =?iso-8859-2?Q?bG/DqxuzctRTWYu9MUJXbaSqyLz7TGdUJjyjGtoJzxQ7yZb/OPu0b7PwEk?=
 =?iso-8859-2?Q?Jp4X2qC7Ll7YEE+dleET5tb6kMDMxISHj57NtHwVYTjnV29bj/N3CQ7MnQ?=
 =?iso-8859-2?Q?TX4iw+P/a3C/0S8bXikv9XdFswcM0p4FNd+d9+PHdzDGurowvAnamCqR7k?=
 =?iso-8859-2?Q?MonnZc/sDMjSOz7i1i77udiclEZsE9gmRjX8KfKIEiUR+y4cFPlI6Y3ZuZ?=
 =?iso-8859-2?Q?4blBihBMlVDEcf3psE1KuVLAlXCbBfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71972ed9-47d1-4bbb-ae3f-08df4a954ec5
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:42:04.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwubNCB6Hss7dsiJpp0IWjGaW1Y03PJ+CfLbOk+nz43K+v3PK9xdg1MB0WfFB97i2Qp3DrY/mD/wnoma2HGQafbkkqirtegu8F4z/k6SH1U9yf742VS68XpEbHYBIHnl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9838

snd_soc_component_regmap_val_bytes() (A) calls regmap_get_val_bytes() (B)

(A)	snd_soc_component_regmap_    val_bytes()
(B)			  regmap_get_val_bytes()
				 ^^^^

Let's align the function name to original function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 3 ++-
 sound/soc/soc-component.c     | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 4e30a22a767e2..fd2db8992b248 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -333,7 +333,7 @@ int snd_soc_component_stream_event(struct snd_soc_compo=
nent *component,
 int snd_soc_component_set_bias_level(struct snd_soc_component *component,
 				     enum snd_soc_bias_level level);
=20
-int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component=
);
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *compo=
nent);
 int snd_soc_component_regmap_cache_sync(struct snd_soc_component *componen=
t);
 void snd_soc_component_regmap_async_complete(struct snd_soc_component *com=
ponent);
 #ifdef CONFIG_REGMAP
@@ -448,6 +448,7 @@ void snd_soc_pcm_component_delay(struct snd_pcm_substre=
am *substream,
 #define snd_soc_component_init_regmap			snd_soc_component_regmap_init
 #define snd_soc_component_exit_regmap			snd_soc_component_regmap_exit
 #define snd_soc_component_cache_sync			snd_soc_component_regmap_cache_sync
+#define snd_soc_component_regmap_val_bytes		snd_soc_component_regmap_get_v=
al_bytes
 #define snd_soc_component_async_complete		snd_soc_component_regmap_async_c=
omplete
 #define snd_soc_lookup_component_nolocked		snd_soc_component_lookup_nolock
 #define snd_soc_lookup_component			snd_soc_component_lookup
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 1f40caefee8f1..41fa459d954be 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -386,7 +386,7 @@ int snd_soc_component_of_xlate_dai_name(struct snd_soc_=
component *component,
 	return -ENOTSUPP;
 }
=20
-int snd_soc_component_regmap_val_bytes(struct snd_soc_component *component=
)
+int snd_soc_component_regmap_get_val_bytes(struct snd_soc_component *compo=
nent)
 {
 	int val_bytes;
=20
@@ -401,7 +401,7 @@ int snd_soc_component_regmap_val_bytes(struct snd_soc_c=
omponent *component)
=20
 	return val_bytes;
 }
-EXPORT_SYMBOL_GPL(snd_soc_component_regmap_val_bytes);
+EXPORT_SYMBOL_GPL(snd_soc_component_regmap_get_val_bytes);
=20
 /**
  * snd_soc_component_regmap_cache_sync() - Sync the register cache with th=
e hardware
--=20
2.53.0

