Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011058.outbound.protection.outlook.com [40.107.74.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F31922F3
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533748; cv=fail; b=FMBAo+6n7TZCZ4qpWsDHbjoG2dhJ/CYRLazQGaN4s3JCuB0DL4ILBi4DW5Q1F0xeY5WeSPlfAyLYgLdOgJVxBK2n+Uugc9TO9/9UqN68xur0t/iUqS0bTXrOQcqwgSMU5wfm6YAohnA1glff1RMRCdgZM71x4sSZMMsoIUxFasQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533748; c=relaxed/simple;
	bh=oS/DH1anuyzvLjHnRehSDUF+TQc1224KvST7mLAU0GE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ikJbspvTYdQdf4y4eC6qKWZvTz7QxTJrciWyKiR5YzF1eZd/xK7D0FOuQxijBHpog8TxSfj7RdGRHzhGyYOUCza/H5NAS2PW0CUff5P93YYpnD+V1R7YxsSfwGIiXHKGVLtsu18FkhGJwgcAtqHz4EjRfC3TQeWPe4MQcxqDe4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CNU2irei; arc=fail smtp.client-ip=40.107.74.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CNU2irei"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1uAruOTlMjWnmJk6eyoZLWshdDAjrYbpIEAe2yB9JPatfXTyvfHu6UfQQI0RfXNO+F7YK7DH/17FTF1avDtSxmVq5T5qRbc0arkjHHQwMUhTv6/TGKk47MOOgqqK50gk5vaBFYdSD9nMYjSjX2obvQo1esBiu4TCFL09bHIKSgzr6vfCTNeWp512qHfhVCkI8hkpcsuurcRhIujx9YlIMlcvEcD62tQDsCa2dS/fpkgfGEn5hAKXYaP4m4i/Lyo7pmRVrBwo/XN9c6CMexlKa+i3gKwkg9OQ47/HYLkVS81OaW/Nz6Uzm6vgVKOpLkRnaRsZLLXMFnWMBe5b65+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vckfQ8bvkMW6vjzpUeJSkDEYSBO/SoB0PPgG6Mnui0=;
 b=rkzygTPIYqOKoQ2WAU7J+asliY1+NaART7YBaGyXAhwpv86ZmMZWJVbCFYprcZz5++3mPwqM9VvarVWeSsCsgr+thSpG/PYJYc6r2kqc4myxzBOVtD8BoOGGD54WcSCDX2CRugcz0Xhhm026nTFrj8yHN5CCetSfI96j6Eo9rP9JWbrXLIHJhx5y4bbrinlLBR6zSNOe1g6V2CenhwUUsYcqSrbnE6cI2Sb/r/Z51WDB/kYPCx3Vv9xx+wxi5tOt0gc0lKsZmEItyI9AcAqHjt8tKzIiy3u+vHDfqSHJO2HQmt143Ox/jmxs0DbH57BhkaRujKKiP6dVqZi490IzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vckfQ8bvkMW6vjzpUeJSkDEYSBO/SoB0PPgG6Mnui0=;
 b=CNU2ireiL1V0tHZ+YBlrsaK0W7cL9z8/jysl0CRLPR/bbPmo/kF42cR9fs2Ig8o+zh44x2Mt4cYrFh5RLHpdvQ05NMXsdzz1PA8OOlMFokKb3NJe7UGTDX6bSoYIsA3Xp/beNZTfu0bILgst3rJsMnLHVoApwImBiOf+3MmJjNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:35:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:35:44 +0000
Message-ID: <87tt8hbi8f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 090/157] ASoC: codec: wm8971: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:35:44 +0000
X-ClientProxiedBy: TYCPR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: b597e79d-a1fd-40ab-2ce0-08dd5605e369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h1hQXw0f08R3LZI/sEiV/FucuBWviUf/8T7AT7YsY/SOzeJVF5/460XbOur5?=
 =?us-ascii?Q?77bgsfueJVByicKul5uaoMpFrX/C36XJ3KsnIDknbcccVk3iUoI9EZ41xys4?=
 =?us-ascii?Q?PCxs6O9KwbnwQhefWpcB90D7qAtVKHljVLNh2Sf4Ww5OvAEFjIqH1NEQqjU9?=
 =?us-ascii?Q?tQ0daTyWakhNebjxBi9Hx64he9B0IXmQC5VGcNRGHEW6M36ZSjRZFBY+HNlr?=
 =?us-ascii?Q?d0n5QdXHYl+R8/CicXlTRxePonM9P8rCqAQBCXXhsmcLmrlPHS0EJxji0b1c?=
 =?us-ascii?Q?imtrP7WWf7LTqKYU74lDjNhV3+zGoSv9phVQGUQQx56DcmMZlMGfdhKaGccA?=
 =?us-ascii?Q?iif/i3Pi7bq2Qoayf4Mfd1KyXE1JbzczVOVXBzWBHWgfHNS7XHREAogWl8iG?=
 =?us-ascii?Q?pu2WxfwOz45rH1oBuZZ2lqjR+MdtUjmA4CdrpfzC48TpR8RA2RCE/n99FSlZ?=
 =?us-ascii?Q?/htsB0v2EDdJir7n9ZVmJW1vvyVWOFfRiNhFGM/IhX0CQP3yxwDC2hajWAqk?=
 =?us-ascii?Q?nLJartjZU7HbAzeWp7887UkEfK/brfY3c3y8pzhHmo8L06UdXeiiIUlMuPRQ?=
 =?us-ascii?Q?uYDbMe/wjmnIw8ukRa9o4TJ/Mx9xTMhfkrM0VzjMiYK2jek2ycgD4GDA10zJ?=
 =?us-ascii?Q?D3KzYQt/N5x8ky3Xk1Bbj3bJ3gz3lA5fd7Gpapzp57JNxpxcB8AcvqpRkqUW?=
 =?us-ascii?Q?RNLBiAEhlbIU3UmK8j3bAWc3u+sqFm/AmsHbvMQm/qiytY7G21Nz/c+uQYbd?=
 =?us-ascii?Q?9eSZd83RrbxfnD0AAB4EJJ3Re5RTlT7FLU6i1DllhFYQxoDXSUMmTDksHnDo?=
 =?us-ascii?Q?w/MFPbPcyK8+kGlA0qSAjASHmgjeoGxsvWeramQ7aJJY7czp4i6kcikOMTXe?=
 =?us-ascii?Q?GXZdkaokBlVc4frfzqjWmIkDpNSktmfbOS5DRNciVP5cYtrRiepeM94PxVhJ?=
 =?us-ascii?Q?8nuWAjVfQHkLLTwanUcsYG1SP9N0A5/qfFHH3K76luXwUW87cMhc0CSduw4+?=
 =?us-ascii?Q?vogC5bAg/uKd3TNXAOjItFoa6NPslMivFZb4L1n2vYVViteaz8rg0KV8oYhy?=
 =?us-ascii?Q?aDuBtpBB092p/AggZtVNsEHQ91WVGK56mBMCT9s3eBqFIgcNAZAU6H5lI92t?=
 =?us-ascii?Q?wsbzWBGCJsGK2SSBSI9P5sJ1W36sLpH/41vkgHhGGiWrR0tQNX4174FBaw2P?=
 =?us-ascii?Q?c63cOQzGVB/x/i1jCFzLE8qCK1/NbB0YoDFEu9NiUZrgLYSUJ+jZ51zWgWww?=
 =?us-ascii?Q?rkPzLHSg44aaiHRRID9nWmNY3rfbkmjPJqDb/HbOEu8Od6Y2xoKvWC++0B9N?=
 =?us-ascii?Q?8LGczik631CoRCP9jlOAGQm3iSnNgoLh7LV9+3cROiep4I8aPp1LOyk0+yS3?=
 =?us-ascii?Q?w4tznaaoTWQeuZrSXVvFEDPHHpebD762TGUqhjveL0n+Hf6br+WjdBKsaBEQ?=
 =?us-ascii?Q?wjTx6IA9mLuDP3fVhysaoSlYe2gCb0+w?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S5li0bXuji/dLY229uWomThxLUWDIHeoWNTPnxZivsBscUw0iX5yfLZvXins?=
 =?us-ascii?Q?nvnezgTvjcEToLDubTA8s9+3jJ297BI/55Jfd9mt6C18iEpzNtLXwYrkFw9g?=
 =?us-ascii?Q?Z01KWbRcZTHYJpmlM5qTreTr2/K8TLo2WZ/XrZjnyP+Mco75f936C9LRMP04?=
 =?us-ascii?Q?QB8PRet8bOHsJd/MWbYXXLtcBxnOsq3iKww2mPrp6JalrUj3kfFaRZ/Vo1uY?=
 =?us-ascii?Q?tTq7jnrRgqdaOeoi7Siy5mgPUPqWoeFLp+STvazCNzT7cNZunoin+W2EM+uT?=
 =?us-ascii?Q?1CC8sgcSoSZ+870Q+SdJbsEADtgpk/HF6AOZh5iNMbHmPliCWRlHPwihIa6h?=
 =?us-ascii?Q?gdWgdDpRJueSxLlY7RAcG0BF6g3CynqgmA1CIra3hSVSjYigzPB/fqb1uUag?=
 =?us-ascii?Q?NTAf0Y8/ql+hJ9dY0eapAzcMATopNOY9eXC77j36X7gQpGKlAP3QN+YgzA5c?=
 =?us-ascii?Q?ekd9Wd7CFOcHQQbCXIzvHN1BGKMqJwxBmVzHyZDXi0/xGp5yDEnQmY7QSWTf?=
 =?us-ascii?Q?Lkfp5+YyCBa4AbBvbasqwgafaqOI5+OPZSZEU0hLbAdkxx4s2ewy4xjgjUvU?=
 =?us-ascii?Q?ZGscC3xU5U/2H+G7hVX1wVlhk31GPd5WgHsqCiSkdXYfTpk5y1f2p3awFKBQ?=
 =?us-ascii?Q?fjRi6S2U/s3dwjzO7w3Asg3s9IMv84loOTcIvv77lZUb7zs/CNVcdHUlN2Zp?=
 =?us-ascii?Q?pTLBhdXZavFv94fOLdorzOxEq6P5d2soF7C43slu242Cgw/85Ntpkfn7yedc?=
 =?us-ascii?Q?1DF7nJ0Yt1zw/NtlCSrNUqa1mHgnsCCxQ+C7YH+M0ZCkZXx/m54Wr+LW763n?=
 =?us-ascii?Q?4INRt5ydCCyuArkiou0WIHJpWtEhzPJj2ABn8RHYcrLbYGU28iLficVDRMN3?=
 =?us-ascii?Q?8iE0cP1RWM38W/wySiyusZyKlZI+8XNqx7CK9UL72H91VmgGZewTP9+W4G0F?=
 =?us-ascii?Q?p1CfiOl22EpoID9d7IgbCC840LRW8LbRLz93j1w138ZB6sNP8LZKYMDTZt0B?=
 =?us-ascii?Q?8Zo8WDLVFLDh4X0XjAEaRkx/Q7nGlbYJKmHMBbjeVEGfdMXAv9J1ubeNpNYC?=
 =?us-ascii?Q?LvVq5x3YyqJ2/SCCOt+94ZFiw+tvRnFlYGzYAJx8TTtEQPIW0S+3GA8Yhtk4?=
 =?us-ascii?Q?AP3z2etIzDLHmi7Q4MxUqeV+1BAM7tYtVvDiqTWM55NTNjbDyvUV0LHqmcba?=
 =?us-ascii?Q?h7CBp2bXZ488QYHXo9chYSyhNz233WB7HfHgR/LxgR9k1WOQblre5xn4w8O6?=
 =?us-ascii?Q?JabdBwNtaQb0zq4SJMfSZkFCLUvPKKAqcXTPvEizhU89J7SSegjBFm/Jh5Io?=
 =?us-ascii?Q?1WwjibhLKOW4I7/jCRh1j/ArAfT7+7i1xlOoq+0AdSN8vun26G2FHj1oB/51?=
 =?us-ascii?Q?TVKpUOPSPFLdtM4WddZI0qV48ywHaeDETD0UQomZmQ2cfJGSlWfzMwog4pxz?=
 =?us-ascii?Q?1twYc7Z1YehSkoT7U+oKE5PcTEEM5P5m2gztDYtLXfS5xN6yxcWvujwcEt2W?=
 =?us-ascii?Q?jQ62ektJ7hySzhK4DWD7H5ETz80wLxfxtbbOqeB1udM22gTSYnqMDdD8cFYk?=
 =?us-ascii?Q?XPEOLLoeP5h7tPp+3RoKvhFNNy8tBwajste3qzFA84R+jC7Ki/VIlARIuBsS?=
 =?us-ascii?Q?44FMLBtCh4qmAkF8p1gcskM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b597e79d-a1fd-40ab-2ce0-08dd5605e369
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:35:44.8306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3frRwme6J8YLC9AMPfSXuHSuY0SJ5py69+qQyffUZUeZjsoYskhsi85PpVeyirbdDjsiUWZloWMgNyHIgYMUOd1RKBWebn2dAonv8nNP1lMa4sUQK5pLKbTNnauqjNw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8971.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index b97c7d5bd4e7..62dcddeb78b3 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -452,10 +452,10 @@ static int wm8971_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface = 0x0040;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

