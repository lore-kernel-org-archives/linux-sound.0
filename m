Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18552BF3F3
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909503; cv=fail; b=M6APnNakKoVanRRzX85SAWSIy4HphUNGnpBvQ+LimHPgjvzZaVt8z+lMkslnZoUclwx0RmPtFlpKAKwuSaJhhxGnOhy2bF7hi7gpyhxlR0tdEqIcSfP5QEbCC4r0S26syXEmlgP6ylknxEYkqemd+Ul3X4U/r9kAn46vdySQ53w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909503; c=relaxed/simple;
	bh=K+uqQy9JQHwNboZnFIFoA/U1WjhRQgyIDCTXvojKuDo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FSKV4pP+RLEb9Tq5S7STJ8S2uN0WOPs8m1KtosYshmXwJSBrKMCD74M+Ceq2sMnSA0wgJtNuvY3ZbjGhqVhiKQ9LTmyC0i14jSTcCFqVk4s4fDgDIoRooRVJTOudV1xjY3vDr6myAlVceB5x+/6e6TCuhMTPFvzC+pUmhkerYS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=F/WaTnlv; arc=fail smtp.client-ip=52.101.125.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="F/WaTnlv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuMEEY3Knfgy8jZ8Qvh8lufghot0PovvnSyNIp6cF+xzdYJsxqSv2LBzRFBvsnMEbsTL6YOqvntiWYO8of9ECPDR1jY4Vw5Ga6kWQVlbl55+y8JWMM+ZkGB2PmTPCoR0GrR9XQ5Ky88aXTO0eO4sHJ/mTymM2ZtzVswTFwPiyLak9Dh7z9SyZUz2Xzzyixsyfvch4G3iVA4WkhvpMGjXeJMldhuyNTPgN3zXL7n8Sk+sq3s0X8mfKvP0xE/Iu5goY5BYc9xMVZwJKZ4PS902fL1xj9wRALKqQ+y4mi8/wAAyHKHRdq7foLvIv79MHsAFIMa86JATzwlXKr7nrVBt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1o5zuB3jK96zzSTtebaFIk6UR1LR/69EMSt6C4JdsY=;
 b=xvuKE1hKCRFH5sGQit959CE5HtPMUI/2VshUtKEvwO4UVuWo9oKqXCVB2iLTWRCJXfKS20XxM3j1YUKnwzkKza1XlnnCWSeaXUhE7135pf+UoTXsWQ7me/aiT0U/84GjQH36XHuH8WJAzEu4yAOdl/rdP1g68JKiuCvSeSBN4Ei646e3mk0J4d8j3jY9DcuA9h9o8A8b3dJ9e787LZ9FFRpsaWZINat5MAU1BerYkN65sb9EDY4YOLTP2GGRWaNe+MWMmpzrbzT9i03hwyIW0MEduZvNQ6aDhQ7pks38Qn8YPYDYIM0Ryri6N1PsBnvJrhROzhl3fedG5VYiC3Agng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1o5zuB3jK96zzSTtebaFIk6UR1LR/69EMSt6C4JdsY=;
 b=F/WaTnlvN21BLzGIuNLJ7hvFtuYcsA5DQ8CuuwiQIm7HTtBpHXvqtxc5jPcmyyiA9b6PPMFUWMoUVeAr05cVS8rbemXp0ry0MpfjZZphwXghhv7lVGzQv4+q3AKA21sjhY2uFrgVJvnK3B3is47ntfnIkOj0RrZi28TbTw2jEk0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:51:37 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:51:37 +0000
Message-ID: <87jyo06chy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/13] ASoC: soc-component: replace bool member to bit field
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:51:37 +0000
X-ClientProxiedBy: TY4P301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::19) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: ad81c8e0-b4b1-4c06-5d0a-08df203013ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7NUq1GSuVU+CqwnE2V7eoNTFzjGKubZ+VhmSjkMc7DdmtNr8p4jfhptEw4MfaRvhiBmZpkgnurdmt/OIceXBrmtaOW4AjVUFWgJs5OSXWazh77CSXhQ/23RGg0Q02P/K+Wrr8texpuv8NJjd5hNy2ylnriowaZ0ZlLgVx7EaeTfK5xA2TQmJj8MoYmO945AcQueEPtxUOxeSyfycQTwLalpMu5Ab/H98wY+whSqwW3Swb6iq4+hM1sQIPcgD1r2XwxP/FuBI31GieS06poFXy4BRRBKHrzC4tr9t9tgFKCL7PA1IjcdHZtH388StlA2dZPiYX6cPjRJJYihJxYf28MbCW6cyKD0j/Y88qtC/Pk8kJ6Ek87D7NvuzblxM3MrPuFKu0PLUgczgib4G7ZjAL9QHCJ8td6ibgHyVM27aZhHx0nMoqb73It/ljNi2EDaKtRYyldgIZvDI7QLmIO4lDKkbpSvUeLGKoi2O//35TQPvl1WjPa8+l71owUZX+D06AtLB1aAplv28D7Lj0aYERMm0cZqkzNsmGIklONtOnorQptVWPQxLroNzuJB2JX11SztvmweunSz/qbS2kg/Y/yC1gBJ3u3JxoipY8w+XpICccUA4x6JWs036rnG49Av5oLQvjmKd/eEiScTpvMItfXHz5JKRCRG9YTj9aV5gmmy76y4jW5KLc6v61EHde+OlAjogSQEgX3Mty5fZmTZs7uzmsFz6CqU3q9JeY4JVSHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?B07gvWYGUTEnSZYm3D7NX6UCPDzh3UAlByQHFSXGWTo3pUlCKosr2yU6y+?=
 =?iso-8859-2?Q?AmeuVr8oBZYRyhtLhF/pqiolLeSW6SAdOiALuVwp1ismPZE7WukN2Dz2cY?=
 =?iso-8859-2?Q?yusubdXCNKf4ifsecslYfSZhJJDmxucIm3ucpjHjqXIUrJJxzfjaPE0IiP?=
 =?iso-8859-2?Q?N4d42p+i2/p3EPo7llMXFIi/0P76FCpc3NtDlULWsz+cVx507V5+kSNFe8?=
 =?iso-8859-2?Q?eFHZ3JnRyTwq17iXLxXZgF3LB5KRJR+wn9UdjkAVImRfGYaPguqcyPJvEf?=
 =?iso-8859-2?Q?SoikcJ7CBJhayXZ8vfgGmu7gH3aZ2WNNU2rfXhEz0KD0uvpeqN8TKw+ecO?=
 =?iso-8859-2?Q?mhNK3JBb5josH/v0ZNdQCqTA8aP8rXhIDD6E6LoCXEDluc/uqHCJL1Y/G1?=
 =?iso-8859-2?Q?QRr4hWHi+tPVgDTSa4FaMgFEug9wQpfLdnETtRgn+JouN+Hsn0euX06hus?=
 =?iso-8859-2?Q?9TgyhHWtXUnURKRFTu5c4jyqLMRAg6jsAxGO+2lmxwFKxfEj2RgYk8vz6h?=
 =?iso-8859-2?Q?eVHZ8lSmJgdakT59bAeb/utKzeWX5vyt5DuTGTQmcq/t6jRVxlIEYtIf2C?=
 =?iso-8859-2?Q?IWRmSYZOMWHiwiCct/xv7XAhs/iyP7DkCB0v4gaga+Tdy2GLQky8IlF9nY?=
 =?iso-8859-2?Q?e2TA2nmOw/99yD/No9/3Q6jCcWn7KgmqP0sQYPsaRLrh4/PYILjmDYffd5?=
 =?iso-8859-2?Q?xMX48wjngSDa2TP2F5y/knC327sGQwWwJ1T0JDsIbNXUuQuu1wFCejZ5v5?=
 =?iso-8859-2?Q?mH334jhsvwtE2biDrzua/F9SMRy4kxB3PUsvxcIJzXw+U7UXzkLgtW86Ns?=
 =?iso-8859-2?Q?sACZh/Fq+GddhI1XkW+tc933GRXzNjMkMWk/LL6gDPBBvp5BTbcMm9owSH?=
 =?iso-8859-2?Q?r+qdMAoUHq8LGYjMB3Tq01gxPWrEM2xIDadUZpSesQ5lh19DVRn8K8+OXY?=
 =?iso-8859-2?Q?l2sn6EJ6YNSLAVZv2TBgIqEqsH5CdIb/+rcVBY9MfTfe8ROIn3Pow1/PET?=
 =?iso-8859-2?Q?bBuYUFv+rxGWbUGXH5CLWaF8gME/kW+5kPm/u+DHpfG1PBdnA6Kie3T7wA?=
 =?iso-8859-2?Q?mUnXY3JHQm3jf92WAdVxmO0oKbblpt62oyY9zqd+dy++gCcEqS0xZSNf/R?=
 =?iso-8859-2?Q?DND+1bhgwjtuPBiEVHXiEF23+fYIrwr+Od0uJS3NR4gASZ5U5q+4m5NgiC?=
 =?iso-8859-2?Q?kWmgNRJU/uKN43PUhMHpnogOO76NFuCr8vqCu6ds3DYdzmWHuOA4sgvhRK?=
 =?iso-8859-2?Q?rCKmpAfZLMoEPwhjfhUXlHQ+CIxjn/OJoamztdXBUG9pJ8yjbid4iKxG8l?=
 =?iso-8859-2?Q?Enpelyt7i1nnJOI12NBWRWdcpvjUYEm3KQ2unHohXRZd95F5VHJKmSfW/j?=
 =?iso-8859-2?Q?PPqMKdZjMmY5RNvCAoiHouuavr44yYLsF9QnJyF4QCCzTPxU3WmSZgwJgi?=
 =?iso-8859-2?Q?5I6kuZNrabJ85U1XcZ/Afvn4ryMQxW+tmyKgJedepcDUNIWWKpkxJ5W1FY?=
 =?iso-8859-2?Q?rfBj1KWnQTpGhfLyKM3YxRC4nnxuil0CiCho6MN6wE9GTSee32TJASTCMe?=
 =?iso-8859-2?Q?o1SOM9Zjubd/JTYnxRNOrmnmJgKWY1eRKpwKeE2uWs3Ic1oINfpbQl5eFy?=
 =?iso-8859-2?Q?yRyJ7OY7ZByLkveRzvhrYNLJmMbw0UohGZuM314XqciFq9LFerjQvjPUcX?=
 =?iso-8859-2?Q?HTAPzSV94Kj5AQfU97kKHCm78qmKhS7joq3+OdXOw11ewDaLZ7HSdDNI9J?=
 =?iso-8859-2?Q?ab8QrvzoHk/TZVMvf9sf1K5KGZwI5xpZyikS32Qfy2Er+nqmn03OCxD5uT?=
 =?iso-8859-2?Q?DIFtAat+JVBl+FtLMOP2/XhnuFPeb5o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad81c8e0-b4b1-4c06-5d0a-08df203013ff
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:51:37.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oc9H6bFH6w37tju9Ts8cSfXkhPa92Pdh/IQ2z9ZPQaEDfYG9xDWq7mlTEasf/VCro2TGiueCXbX2dXvTuw7o9a6FAf5yQog7PQIWnwKUuAxFZBrToMraF4DFRxE7V6uv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

soc-component has meny bit fields (A), no need to have bool member (B).
Let's makes it as bit field, too

	struct snd_soc_component_driver {
		...
 ^	        unsigned int module_get_upon_open:1;
(A)	        unsigned int idle_bias_on:1;
 |	        unsigned int suspend_bias_off:1;
 |		...
 v		unsigned int legacy_dai_naming:1;
		...
(B)		bool use_dai_pcm_id;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 2da196de6b89c..734dc44773e96 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -196,11 +196,13 @@ struct snd_soc_component_driver {
 	unsigned int endianness:1;
 	unsigned int legacy_dai_naming:1;
=20
+	/* use DAI link PCM ID as PCM device number */
+	unsigned int use_dai_pcm_id:1;
+
 	/* this component uses topology and ignore machine driver FEs */
 	const char *ignore_machine;
 	const char *topology_name_prefix;
=20
-	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
=20
 	const char *debugfs_prefix;
--=20
2.53.0

