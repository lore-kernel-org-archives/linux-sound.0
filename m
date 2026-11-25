Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570995;
	b=Z3q74Iz8MFxTzLwPlObSEZbeVfCD1iiC75E/bqq2zMVESygZfcncmcuLguERqAKLNt7y
	 lemP54WLgjS9vriJfC45OI5KIYbE2TTuvjSFJMz/tdsQ+ZlDZuN4nOaa/uzqAyBD0oIoC
	 8o6z9ZlvRa9PcAOVm0N39IFQ41Z1cekC6q0GlhlIAelsPUWyGOKSUxzbAW+M6lYWVabtU
	 DYBNaYNPt/su8tjrm42Jvt8O6Ucoiyk/TgI2jHDapOmpM188DFYkcjiMejmC6vBcOoNo/
	 LsJSHydFB1RciUezt2V651jmTFxoj+1hA6El2473UsGNfgUbaOevILTW/ZNQ0YgBw4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570995;
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
	bh=09HltCZ6hhuO+Ui4joJ2Jzxjy9uWWm/+ce7LQzxE1EQ=;
	b=UFYMfoD63XXPBKKkLTSIPg1U3eYGdugV6bYtKrvIRDTYYCz1M8he165vBXiMClJNb89d
	 qSjePQz9b2kIlRWQnMZJK16msutc7KsdmJvr4aBTwRlrc3ImHrsBJVdGANPPAWlbqrtSv
	 gKkpTwV52Q63AMd+vGozyS7YK69hqrTAH42/lurS7f4A4M9hntXRXXai9yRSUbenekvRa
	 zkPiB/wa1Fz6Vrhv/YOZKl3O3tpqFWbS0bPKXdM4hjdGKXmp7RnAoupyl5GpVhg+3TgLc
	 Ls5yoYptGWzWmfBZCsQIewsZPvsK3F3Ge5xL6SveKvZFJs8pe6pa85nh6eBLmEAfRDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=S7SXUHWZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.43
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61515606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61515606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=S7SXUHWZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEhIGfe2pRu6XGnkFHWevv2w8uhiG0HD53yP9XGc4ziR++8U7FvkwuzIJco6kjrx6yotn+yAltqEo2GOQMST/JjCxZloV050GiduF9cfUhpJoD3hJWc/Ui+Yk3xxNFXANLyaLavEi8/5g4CmsIzKEQToN36In0ZFriqt70qRRqs743653bIgprFM+iMUMcjRNQ0iSgQ1tOW2rVn6qtzveqIqLlaYAsJa/u31Z5fxGTeHvOn9oKd20CzuT1F1ix/3nUj/wjCP+QpOGzYh/4H0wRLjpejvwoK0jwrJHXgOBqiv+vRinpGK8zF8f8wSXaRX1vcIOFKtSleTj0oMhtKzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09HltCZ6hhuO+Ui4joJ2Jzxjy9uWWm/+ce7LQzxE1EQ=;
 b=DMxR/LkrXSfKG1IaNvoVgYJ3yi6JWA+23LtMw5IXUXTwVVHvWzonsVaAX86KkCBqoLlECeU8o154XgCbjYpUgctGD0Jiva8lF0EtmQPm3fjsOkLCp0GSmh2MPIJhN3L1T2aR8s7Hb//maAyrqfjx9jYwG/SCR8CIdl40ihhvOM7Vv39nBn7bNDctlMobPoQBXtNKTVKMPA/taeko7SAe5P3+Q6fCZm9X/DpmjoDeNH7apg63l7pDLzIX7auNnWhHHTmkh+bMhrfR6SoIxhO06WSa/BvbupM99nPvDAC6t+SpmyFqkjDfeIpxvb/MbzGypBxau0vA/GPLc8BGlTqHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09HltCZ6hhuO+Ui4joJ2Jzxjy9uWWm/+ce7LQzxE1EQ=;
 b=S7SXUHWZdPSF3Lcum7+WvFkm0YiNXvI1Wnidqr3ZcVTfHnKzKVZMxsjXDASafnJhKXfzKphwej9m/gHLkcJxU6fXjQEINIjvF6VKD4Wo+0brqYMpYZJDX1IunxUQ4bgQp421gBY28z9/3EIfm33a05C7Uez69ftcFLyPSD9cOjM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB10476.jpnprd01.prod.outlook.com
 (2603:1096:400:304::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:43:12 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:12 +0000
Message-ID: <87tsl5ele8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/27] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:12 +0000
X-ClientProxiedBy: TY4P286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::9) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: a52912c5-e1c8-4796-c1e4-08df4a957762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|376014|1800799024|10067099003|38350700014|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|261102130727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	85avjREmanS9QlfczF260khy4LJTmas8ci7bL3JmrGTwD+gV0fKHMhLA6jcpACTln95gu53rCgfPwgCo0M9qNs3RuNrU+TacswHPZQsOlfdszeFird9prGlSpzkCvUQ8M7J7ARiafPhQMAAqcJAsMjAOruMQE9z+HTH9KtYr2EsCEgfan/wNO401LTA5qfZ3YpKqplWehQgOYsVA+K5/U5qVjPQ5xT8ycT6r3zt3OTw5O3OB09EKl0HGm3WCuo/hBuXDyesnHOQKtYmA7gd5+CBVO3M6N7xRNkHdljvp+giqWeLgxg21oVeqYLGYLRwzqdElxyAnGQ6NPUWAkC0Bxlc8gw91OJNhadKuJQPvoCJONkHE+esidInJeUTXdffSrzO/0xYIg7og3jnAJBSVkaAFrJejKloOoR1Ll4RpKIZ2OoSLGVEXLPx6Wevn1udRL3b5oa8/L9PFpnJou8xCOXe9fnAjprYonMfNoecHf3QYGN9UkTJmgdWzA/8FlqsElpkJT/X/ERIHNyHG1l+I8vRVdWnnu2ZS/9yPJg1IGAfHgimJ/UwHM0F4ao+hjDoYVFWPr4daNYGpelRplRglfJy38lO+MDMgZns4YsSS/cgXFhrgCoShgu++rh2vaGwTl6nQpztTeTRAdyCD7YEPKDz2OQ5Sv2GQqGlFHQ26DOC/8UwsZ4fcFQeftgjTH/ONrmAn7A7RSnEjePPq92NkVbK8wQsbkTIRraoLWpJ2Wws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(376014)(1800799024)(10067099003)(38350700014)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102130727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?kewOaLXIysXEbgVepAUiOra3cBQYubS6hT6O/OHTeFwWqMW4SgBx+RcDvN?=
 =?iso-8859-2?Q?Bwe19zI+18fNPC1AWzzJeHUCa3+kKSExdcSV1RP510oRVX29ruduaIXy6c?=
 =?iso-8859-2?Q?csp8hXzx0JQQadxS7wXNbE08iAYgJryoo63TXiDLNjcLrNGhzfLqiVWq5a?=
 =?iso-8859-2?Q?YNtCSyEIPY+Yln9hMj2JDo2NiLeFKTmzRojy8nTD1PzFhl8oxshn1VCJLG?=
 =?iso-8859-2?Q?xLycYJ0/TB4dfk7k4S3Ltiy4H3oqbuaxCe4aFjmqDLMguxNNpFuzQhNLqe?=
 =?iso-8859-2?Q?twOBMGYYx6dZPvtj+rD5LUJdm0HdABXxgCARHcWX1pEvRHua688HGXRRfZ?=
 =?iso-8859-2?Q?EgHaDKhjss7DBSY06u7F0dhWSPPmmECe/YL85ZUyEmCLTbnRfFr8hwbSJ8?=
 =?iso-8859-2?Q?MpiAHEpsBxY3dTO9EdiGmxhMKhgRVzhlALZ2R+Z2L+Ly1+auqrf25nLXJK?=
 =?iso-8859-2?Q?gQPIKTwEibmJofQC4rCXftBU1yeUQl9uS2ew1DcjdYSyEEOFjnmcxpF5H0?=
 =?iso-8859-2?Q?bBS1Jqvrp4ALqRjuvpZZ9JvtFUBV5WOMu3Q4pEEgosFPuO5kRsnZJy7QKL?=
 =?iso-8859-2?Q?b63mmq2RsllGEobID8jiHvnQWcF1aGywnLBTtOrfCnImRGnIWD964a76a9?=
 =?iso-8859-2?Q?EQArdpcuXhxr4Q28tRQt6cFOII3pFW1NZ0amiDcJkIPYw+QkB3ET1lVhvM?=
 =?iso-8859-2?Q?41UddqfUsF+mTBp2kOyCgHublUtc/j4y+GkdUt90vhxGXNufYaMNyCs2C1?=
 =?iso-8859-2?Q?nUlYJ4A5iup8zSmsjO0JQWeuHSqiZ6szsJtqGkiAuCM7JZUoCKTy/xmGus?=
 =?iso-8859-2?Q?I4pH0KiaEXHwq7LYO/ggOY1UgHb2yrbCDSsW/iPQ3OshVd2cVhQ9QQB7Bn?=
 =?iso-8859-2?Q?dcBikCCVm7nfkBy9UR80B/PuSLeb67zS6tgEfYHHQ6qcVAHa5G05xnRTxi?=
 =?iso-8859-2?Q?y3t7flBo/jiNpS2Atgknev/XfnKIxeCP2RPpyI/DPJGBdUufzltGpYKnlM?=
 =?iso-8859-2?Q?qSSnAAXlMYvYQ7j1suoLtuGAnr9r+DqJo+6p31Ow4+oYeP+G8slYwfqEAR?=
 =?iso-8859-2?Q?RWk0OXETkxNSg0Rp4Xav49lov717db4ZCYFN14wVCaOU0MNgaZJpmvpcUI?=
 =?iso-8859-2?Q?DFvRu1Q8FRLWDCKoTAxUwsEQjKmSuDw3Oc9j0B0O4Rjo7uz8BMUBKsGp3s?=
 =?iso-8859-2?Q?mfK900e9xjtTPvulMIAAXJxx1oBvqK+sMHoPxzxzg853oEmXyNdhDw9ecQ?=
 =?iso-8859-2?Q?rMlyvirglGfLrvX78vGX52oaDLrtioICE9jjsR7eZiOA5GODAFbFtzfyg7?=
 =?iso-8859-2?Q?+pEm5AG1TfdQfnr5aJ75H2He14JgDGcC6iMjpP85WOpqxfnDtyzuZAh8w/?=
 =?iso-8859-2?Q?pgATIYKxXruqW/enQHNEgBROGWaDsbcne/7tEhktxpauLQ3iwNXogt/rW2?=
 =?iso-8859-2?Q?7vOQvgf5+AF1URd7exLz9XMwXo0vFxZ1dFOhdjngr8hVno8ul4z1v/ZPXT?=
 =?iso-8859-2?Q?7SSSeJ3IbU6F+C8khHgBRiJn9PoMkBclhyouWxBYwt45vXZRiHl2BqHyGD?=
 =?iso-8859-2?Q?asvYzRQGyLRrL1bR2QtQ/Livnnd1e7SGT0ZULavwBVxnTM5WIC7AB2a3vW?=
 =?iso-8859-2?Q?CNeV4eFudrkJyvS4fEfkOFHO9Zh9+uA+X5MvLgAC6TKMPxfffEBL/6Z2W+?=
 =?iso-8859-2?Q?Thjk1DpubnRLMRYe4vuq8CmzSgcZIHUUbvNzM7NIHIvR7828JvUWA/3Sc9?=
 =?iso-8859-2?Q?QjNznTw4u2vclo91sVIs3NxaSUt5YQPM18sbzZzsCZF0AumoNjw2f0a70A?=
 =?iso-8859-2?Q?mpQBLjw9K43n/DHXyHXdpepyfbbNySEzNHf4PQy5r7MMm6F/Yzk7?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52912c5-e1c8-4796-c1e4-08df4a957762
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:12.4592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2WhTej5uSWMpaaKc4kSnZKZEJOBEPtB/yPeg6u9Z6E2sP5AJ+BraEAbIqYNYDrYl4VLtchqmdLkHb1LNgSq1QiEIDpXTdfT63Te0/+qaajeUy9i05vsALxxhA2parKf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

move snd_soc_register_[un]component() to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h |   8 ++
 include/sound/soc.h           |   9 --
 sound/soc/soc-component.c     | 213 ++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c          | 213 ----------------------------------
 4 files changed, 221 insertions(+), 222 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index d6685812cad76..965c2555010c7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -279,6 +279,14 @@ void snd_soc_component_unregister(struct snd_soc_compo=
nent *component);
 int snd_soc_component_register(struct snd_soc_component *component,
 			       struct snd_soc_dai_driver *dai_drv,
 			       int num_dai);
+int snd_soc_register_component(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv, int num_dai);
+
+int devm_snd_soc_register_component(struct device *dev,
+				    const struct snd_soc_component_driver *component_driver,
+				    struct snd_soc_dai_driver *dai_drv, int num_dai);
+void snd_soc_unregister_component(struct device *dev);
=20
 const char *snd_soc_component_name(struct snd_soc_component *component);
=20
diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0f8e46c131c91..338ba5cf85fb3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -447,15 +447,6 @@ static inline int snd_soc_resume(struct device *dev)
 }
 #endif
 int snd_soc_poweroff(struct device *dev);
-int snd_soc_register_component(struct device *dev,
-			       const struct snd_soc_component_driver *component_driver,
-			       struct snd_soc_dai_driver *dai_drv, int num_dai);
-
-int devm_snd_soc_register_component(struct device *dev,
-			 const struct snd_soc_component_driver *component_driver,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai);
-void snd_soc_unregister_component(struct device *dev);
-
 int soc_new_pcm(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_SND_SOC_COMPRESS
 int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 7e565da045b60..ca51f976ec409 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1553,3 +1553,216 @@ struct snd_soc_component *snd_soc_component_lookup_=
by_name(const char *component
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_lookup_by_name);
+
+/**
+ * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
+ *
+ * @component: The component for which the DAIs should be unregistered
+ */
+static void snd_soc_unregister_dais(struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai, *_dai;
+
+	for_each_component_dais_safe(component, dai, _dai)
+		snd_soc_unregister_dai(dai);
+}
+
+/**
+ * snd_soc_register_dais - Register a DAI with the ASoC core
+ *
+ * @component: The component the DAIs are registered for
+ * @dai_drv: DAI driver to use for the DAIs
+ * @count: Number of DAIs
+ */
+static int snd_soc_register_dais(struct snd_soc_component *component,
+				 struct snd_soc_dai_driver *dai_drv,
+				 size_t count)
+{
+	struct snd_soc_dai *dai;
+	unsigned int i;
+	int ret;
+
+	for (i =3D 0; i < count; i++) {
+		dai =3D snd_soc_register_dai(component, dai_drv + i, count =3D=3D 1 &&
+					   component->driver->legacy_dai_naming);
+		if (dai =3D=3D NULL) {
+			ret =3D -ENOMEM;
+			goto err;
+		}
+	}
+
+	return 0;
+
+err:
+	snd_soc_unregister_dais(component);
+
+	return ret;
+}
+
+#define ENDIANNESS_MAP(name)						\
+	(SNDRV_PCM_FMTBIT_##name##LE | SNDRV_PCM_FMTBIT_##name##BE)
+static u64 endianness_format_map[] =3D {
+	ENDIANNESS_MAP(S16_),
+	ENDIANNESS_MAP(U16_),
+	ENDIANNESS_MAP(S24_),
+	ENDIANNESS_MAP(U24_),
+	ENDIANNESS_MAP(S32_),
+	ENDIANNESS_MAP(U32_),
+	ENDIANNESS_MAP(S24_3),
+	ENDIANNESS_MAP(U24_3),
+	ENDIANNESS_MAP(S20_3),
+	ENDIANNESS_MAP(U20_3),
+	ENDIANNESS_MAP(S18_3),
+	ENDIANNESS_MAP(U18_3),
+	ENDIANNESS_MAP(FLOAT_),
+	ENDIANNESS_MAP(FLOAT64_),
+	ENDIANNESS_MAP(IEC958_SUBFRAME_),
+};
+
+/*
+ * Fix up the DAI formats for endianness: codecs don't actually see
+ * the endianness of the data but we're using the CPU format
+ * definitions which do need to include endianness so we ensure that
+ * codec DAIs always have both big and little endian variants set.
+ */
+static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
+{
+	int i;
+
+	for (i =3D 0; i < ARRAY_SIZE(endianness_format_map); i++)
+		if (stream->formats & endianness_format_map[i])
+			stream->formats |=3D endianness_format_map[i];
+}
+
+struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
+						const struct snd_soc_component_driver *driver)
+{
+	struct snd_soc_component *component;
+
+	component =3D devm_kzalloc_obj(dev, *component);
+	if (!component)
+		return ERR_PTR(-ENOMEM);
+
+	component->dapm =3D snd_soc_dapm_alloc(dev);
+	if (!component->dapm)
+		return ERR_PTR(-ENOMEM);
+
+	if (!name) {
+		name =3D snd_soc_fmt_single_name(dev, NULL);
+		if (!name) {
+			dev_err(dev, "ASoC: Failed to allocate name\n");
+			return ERR_PTR(-ENOMEM);
+		}
+	}
+
+	component->dev =3D dev;
+	component->name =3D name;
+	component->driver =3D driver;
+
+	INIT_LIST_HEAD(&component->dai_list);
+	INIT_LIST_HEAD(&component->dobj_list);
+	INIT_LIST_HEAD(&component->card_list);
+	INIT_LIST_HEAD(&component->list);
+	INIT_LIST_HEAD(&component->card_aux_list);
+	mutex_init(&component->io_mutex);
+
+	return component;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_new);
+
+static void snd_soc_component_unregister_unlocked(struct snd_soc_component=
 *component)
+{
+	struct snd_soc_card *card =3D component->card;
+
+	snd_soc_unregister_dais(component);
+
+	if (card)
+		snd_soc_card_unbind(card, true);
+
+	list_del(&component->list);
+}
+
+void snd_soc_component_unregister(struct snd_soc_component *component)
+{
+	guard(mutex)(&client_mutex);
+
+	snd_soc_component_unregister_unlocked(component);
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_unregister);
+
+int snd_soc_component_register(struct snd_soc_component *component,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
+{
+	int ret;
+	int i;
+	guard(mutex)(&client_mutex);
+
+	if (component->driver->endianness) {
+		for (i =3D 0; i < num_dai; i++) {
+			convert_endianness_formats(&dai_drv[i].playback);
+			convert_endianness_formats(&dai_drv[i].capture);
+		}
+	}
+
+	ret =3D snd_soc_register_dais(component, dai_drv, num_dai);
+	if (ret < 0) {
+		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
+			ret);
+		goto err_cleanup;
+	}
+
+	if (!component->driver->write && !component->driver->read) {
+		if (!component->regmap)
+			component->regmap =3D dev_get_regmap(component->dev,
+							   NULL);
+	}
+
+	/* see for_each_component */
+	list_add(&component->list, snd_soc_component_get_list_head());
+
+	snd_soc_card_rebind();
+
+err_cleanup:
+	if (ret < 0)
+		snd_soc_component_unregister_unlocked(component);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_register);
+
+int snd_soc_register_component(struct device *dev,
+			       const struct snd_soc_component_driver *component_driver,
+			       struct snd_soc_dai_driver *dai_drv,
+			       int num_dai)
+{
+	struct snd_soc_component *component;
+
+	component =3D snd_soc_component_new(dev, NULL, component_driver);
+	if (IS_ERR(component))
+		return PTR_ERR(component);
+
+	return snd_soc_component_register(component, dai_drv, num_dai);
+}
+EXPORT_SYMBOL_GPL(snd_soc_register_component);
+
+/**
+ * snd_soc_unregister_component - Unregister component using a given drive=
r
+ * from the ASoC core
+ *
+ * @dev: The device to unregister
+ */
+void snd_soc_unregister_component(struct device *dev)
+{
+	guard(mutex)(&client_mutex);
+
+	while (1) {
+		struct snd_soc_component *component =3D snd_soc_lookup_component_nolocke=
d(dev, NULL);
+
+		if (!component)
+			break;
+
+		snd_soc_component_unregister_unlocked(component);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 406ab3620ac1d..3663227adda68 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1377,219 +1377,6 @@ char *snd_soc_fmt_multiple_name(struct device *dev,=
 struct snd_soc_dai_driver *d
 	return devm_kstrdup(dev, dai_drv->name, GFP_KERNEL);
 }
=20
-/**
- * snd_soc_unregister_dais - Unregister DAIs from the ASoC core
- *
- * @component: The component for which the DAIs should be unregistered
- */
-static void snd_soc_unregister_dais(struct snd_soc_component *component)
-{
-	struct snd_soc_dai *dai, *_dai;
-
-	for_each_component_dais_safe(component, dai, _dai)
-		snd_soc_unregister_dai(dai);
-}
-
-/**
- * snd_soc_register_dais - Register a DAI with the ASoC core
- *
- * @component: The component the DAIs are registered for
- * @dai_drv: DAI driver to use for the DAIs
- * @count: Number of DAIs
- */
-static int snd_soc_register_dais(struct snd_soc_component *component,
-				 struct snd_soc_dai_driver *dai_drv,
-				 size_t count)
-{
-	struct snd_soc_dai *dai;
-	unsigned int i;
-	int ret;
-
-	for (i =3D 0; i < count; i++) {
-		dai =3D snd_soc_register_dai(component, dai_drv + i, count =3D=3D 1 &&
-					   component->driver->legacy_dai_naming);
-		if (dai =3D=3D NULL) {
-			ret =3D -ENOMEM;
-			goto err;
-		}
-	}
-
-	return 0;
-
-err:
-	snd_soc_unregister_dais(component);
-
-	return ret;
-}
-
-#define ENDIANNESS_MAP(name) \
-	(SNDRV_PCM_FMTBIT_##name##LE | SNDRV_PCM_FMTBIT_##name##BE)
-static u64 endianness_format_map[] =3D {
-	ENDIANNESS_MAP(S16_),
-	ENDIANNESS_MAP(U16_),
-	ENDIANNESS_MAP(S24_),
-	ENDIANNESS_MAP(U24_),
-	ENDIANNESS_MAP(S32_),
-	ENDIANNESS_MAP(U32_),
-	ENDIANNESS_MAP(S24_3),
-	ENDIANNESS_MAP(U24_3),
-	ENDIANNESS_MAP(S20_3),
-	ENDIANNESS_MAP(U20_3),
-	ENDIANNESS_MAP(S18_3),
-	ENDIANNESS_MAP(U18_3),
-	ENDIANNESS_MAP(FLOAT_),
-	ENDIANNESS_MAP(FLOAT64_),
-	ENDIANNESS_MAP(IEC958_SUBFRAME_),
-};
-
-/*
- * Fix up the DAI formats for endianness: codecs don't actually see
- * the endianness of the data but we're using the CPU format
- * definitions which do need to include endianness so we ensure that
- * codec DAIs always have both big and little endian variants set.
- */
-static void convert_endianness_formats(struct snd_soc_pcm_stream *stream)
-{
-	int i;
-
-	for (i =3D 0; i < ARRAY_SIZE(endianness_format_map); i++)
-		if (stream->formats & endianness_format_map[i])
-			stream->formats |=3D endianness_format_map[i];
-}
-
-struct snd_soc_component *snd_soc_component_new(struct device *dev, const =
char *name,
-						const struct snd_soc_component_driver *driver)
-{
-	struct snd_soc_component *component;
-
-	component =3D devm_kzalloc_obj(dev, *component);
-	if (!component)
-		return ERR_PTR(-ENOMEM);
-
-	component->dapm =3D snd_soc_dapm_alloc(dev);
-	if (!component->dapm)
-		return ERR_PTR(-ENOMEM);
-
-	if (!name) {
-		name =3D snd_soc_fmt_single_name(dev, NULL);
-		if (!name) {
-			dev_err(dev, "ASoC: Failed to allocate name\n");
-			return ERR_PTR(-ENOMEM);
-		}
-	}
-
-	component->dev =3D dev;
-	component->name =3D name;
-	component->driver =3D driver;
-
-	INIT_LIST_HEAD(&component->dai_list);
-	INIT_LIST_HEAD(&component->dobj_list);
-	INIT_LIST_HEAD(&component->card_list);
-	INIT_LIST_HEAD(&component->list);
-	INIT_LIST_HEAD(&component->card_aux_list);
-	mutex_init(&component->io_mutex);
-
-	return component;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_new);
-
-static void snd_soc_component_unregister_unlocked(struct snd_soc_component=
 *component)
-{
-	struct snd_soc_card *card =3D component->card;
-
-	snd_soc_unregister_dais(component);
-
-	if (card)
-		snd_soc_card_unbind(card, true);
-
-	list_del(&component->list);
-}
-
-void snd_soc_component_unregister(struct snd_soc_component *component)
-{
-	guard(mutex)(&client_mutex);
-
-	snd_soc_component_unregister_unlocked(component);
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_unregister);
-
-int snd_soc_component_register(struct snd_soc_component *component,
-			       struct snd_soc_dai_driver *dai_drv,
-			       int num_dai)
-{
-	int ret;
-	int i;
-	guard(mutex)(&client_mutex);
-
-	if (component->driver->endianness) {
-		for (i =3D 0; i < num_dai; i++) {
-			convert_endianness_formats(&dai_drv[i].playback);
-			convert_endianness_formats(&dai_drv[i].capture);
-		}
-	}
-
-	ret =3D snd_soc_register_dais(component, dai_drv, num_dai);
-	if (ret < 0) {
-		dev_err(component->dev, "ASoC: Failed to register DAIs: %d\n",
-			ret);
-		goto err_cleanup;
-	}
-
-	if (!component->driver->write && !component->driver->read) {
-		if (!component->regmap)
-			component->regmap =3D dev_get_regmap(component->dev,
-							   NULL);
-	}
-
-	/* see for_each_component */
-	list_add(&component->list, snd_soc_component_get_list_head());
-
-	snd_soc_card_rebind();
-
-err_cleanup:
-	if (ret < 0)
-		snd_soc_component_unregister_unlocked(component);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_component_register);
-
-int snd_soc_register_component(struct device *dev,
-			       const struct snd_soc_component_driver *component_driver,
-			       struct snd_soc_dai_driver *dai_drv,
-			       int num_dai)
-{
-	struct snd_soc_component *component;
-
-	component =3D snd_soc_component_new(dev, NULL, component_driver);
-	if (IS_ERR(component))
-		return PTR_ERR(component);
-
-	return snd_soc_component_register(component, dai_drv, num_dai);
-}
-EXPORT_SYMBOL_GPL(snd_soc_register_component);
-
-/**
- * snd_soc_unregister_component - Unregister component using a given drive=
r
- * from the ASoC core
- *
- * @dev: The device to unregister
- */
-void snd_soc_unregister_component(struct device *dev)
-{
-	guard(mutex)(&client_mutex);
-
-	while (1) {
-		struct snd_soc_component *component =3D snd_soc_lookup_component_nolocke=
d(dev, NULL);
-
-		if (!component)
-			break;
-
-		snd_soc_component_unregister_unlocked(component);
-	}
-}
-EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
-
 /* Retrieve a card's name from device tree */
 int snd_soc_of_parse_card_name(struct snd_soc_card *card,
 			       const char *propname)
--=20
2.53.0

