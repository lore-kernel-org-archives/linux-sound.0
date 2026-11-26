Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795728547;
	b=1Lmnypqzx0XSeISRJZorfSigJmQpi4q0srPFocrihHczSHzjDAOGUo5wzfspzAixG+rl
	 a/2e2hN67NruvOR6REuY57j7ewpcfr2JFtGeufmuzY74Vymb1pa2ROxT/3/3Id+DieMc+
	 vCS51qLQdq4BE+mX5LR8zq20oAdoua+gotpjSd8sH2V7m6CiWcSy38FjC/nNeM1uFzdXv
	 dbvkEF1g+SdI5rTWjqC03b1HVjW6H+gfJyUe25BPOj3weBhj6O44jGCfZ54uPmdcJFcm4
	 oaiXp6KRM76QELajdnn4maLPLo4jNd4mNun8A0tn413ocfXVsiSG3VQZ+MxNbABGo+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728547;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lUNm0sWG0krB8jK9LUwmQA3O4M+eSojvKyX2zp1NgZc=;
	b=rf/8jYMsoDcqJcP1A4dfuq4t9bwZOQok2KlwUZ5Upv76HY2VRBphUaLhqJit4/cjXez7
	 dxHEhLsZEN9YoMuy3dmXhlIMhtyKxzrdV+VDucCimA8mM3pb3/HWYwQvb2XsHBCC2fPLc
	 EkLOFxL1JJ/06/mJLhOUxo0Tnld03z+kvvgMi3Uor59Bfg2QS2DkHoEkFbpCREIEWPLhc
	 JqOnzSXYU2KVi1+loF+ULQQHXEUX+6IzKETlfdooF9g3EKUM0vkyFlRpEGY0/Qr+BdMDo
	 yofjmhjiXD0C2JP07yX8TZWgBzNv3MU7kX8Ya4zOxSQRuyBJnjlprQITSC7ux5rXA9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=llarUn4L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.42
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19010042.outbound.protection.outlook.com [52.103.7.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C2606A32E;
	Thu, 26 Nov 2026 21:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9C2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=llarUn4L
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygJL2NmLNNE4fe7d44HYrgrLKDEBngoih32yWF1KwpdcyHU3sIcRkOF6qybgAd7R4b2/ovERysxJCFkqhIaftKafqotlWF/lzoPNYPcgmajOOct7DlWBVw3e7FYHOHzZzuTvtadAmnuTtCY74sGltt4XDizE1XHlybPbF6Y3wjeq90dG6j8RAFzOpP+0xtP8h+u71uLJPPMqcbl3GyqcGghJRJe59LhVmK+zG2i/VYEjllwwhRRlh16/v7sVKjeOlUEQfkOujV4flbAsnwjzwja8Z7bwESpFe7dO1N374Um+M3fhj+EBlV4I2PqZ1G7esaLMLihH1Nw3mC+ZyrXOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUNm0sWG0krB8jK9LUwmQA3O4M+eSojvKyX2zp1NgZc=;
 b=vMJfzOZ+tk/cDD0+77m9ISEyn/wuvfRyJL6irGkV4zgzkr3D0BZ8UwR3OWIvhO769Y2ZgYaQ2jUmPAq5UvXRH8h/Fdh72Zh5A7S/D1IAIRpk8t3k9WOHPQakfUZe7E5wbLnZ4/iXypVEtzOHuXNgKltyZnh5xkEaavUCtIrlSSdvvFVS/zfl4QeC7Ul6eVYXl9s9wXMI6SgykSxC6GLL0LS0I54a/Oy88454c5oLslFqXmqqNqaan6GAqL29lICK+McJO5wm/a6DPjIh78y4MDwIBYrE+d86tjYkBDzw0Kh9ZO5FzxDvIU5a4+Db76qAFYGmWqVPi+BeFoX8bDYs6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUNm0sWG0krB8jK9LUwmQA3O4M+eSojvKyX2zp1NgZc=;
 b=llarUn4LsLrEKSSgZAQQHsjijztTQowg7wbf0Zl3F2K8ejJBf+6TMY0h413Nlap82xrj4vJQXERczaR+A6n4ivlVkZWftKb3snIWkmnuCwB+mwkzIVOVpMZwhfJaeT5BdH+5FcFNt8fKO575TJNRKs362MVoiNn9IhZCb/Hz52IskdUSNONV7HrZXtZRZldmS2EKMiS3Yhe/0aoD2seXLML/WeG2IWi/ABuRd8vlWV1xRWgwtDbk5NXeg07pNyUDIEvXEeyhCNUPBp8opiiepZAawrnC4afxmrKM+lA91MnBAxZumYJ7ydtpzozVfTaXoK7hJ6mtkS02CcXFwlUiMA==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SAEPR19MB026956.namprd19.prod.outlook.com (2603:10b6:802:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 21:29:06 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 21:29:06 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] ASoC: aw88399: fix error checks in aw_dev_fw_crc_check()
Date: Thu, 26 Nov 2026 22:28:44 +0100
Message-ID:
 <SN6PR19MB230344E00782F3291F260136FC422@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00008BF9.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::475) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261126212848.11778-2-marco_giunta@outlook.it>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|SAEPR19MB026956:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd243e1-c87a-472f-d75e-08df4c044c47
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|23021999003|15080799012|24021099003|55001999006|12121999013|25010399006|51005399006|5072599009|260925184616899003|41001999006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Lg0Zw8inKTlqsCSGyaoul/yoaHPF2UOpPhQ9A/trFqg+b6IlK8aufr1W8uT?=
 =?us-ascii?Q?HilOR3epg6g6MfG0ScaWVic+4k4J9Xnp/7trWD6QU3vyOpGcTtqZZXKTKwZe?=
 =?us-ascii?Q?2KW2nj4VgeTf/s5DIf6JNv4NfvY97jrIDdR/ySFGuQkn+K3phVMwNIj+fQHi?=
 =?us-ascii?Q?6HW0wxvdgZTEooU9nJww1nWLa3OmOiSjrWwuoae+xhbeBmsXxtrt5737WZ0C?=
 =?us-ascii?Q?pqrOwqq8Xk6rGFZu/NYFBar6MpQY2TlsY9Wtkh4i9rapiJJGBjY0cKfHHJox?=
 =?us-ascii?Q?WKZXxJ/buqGfdYsymNCGORcEjgHDr9rUPdlDYnO7TXU6EJR6GbMgljcP1uW2?=
 =?us-ascii?Q?axLlz3+dgKlTH0bIpJBLXqO3I+PdUMwe8AmzzKFnznOCWgQ3w8gnk7okDpwv?=
 =?us-ascii?Q?sEZTNHJTYeT6XT9W7qlO6PzybCD5eFqjCUtt4wVH0+9d2PA9ASyQQay70CGY?=
 =?us-ascii?Q?55ZMa0CH84jxJ9E9llkHhCjYi/aHkDZTw+4solMY+S3uC9WadtSEDC+5tdZH?=
 =?us-ascii?Q?iQ23fPrNW/HceLEnog0KW3VjedUwmK4MCJBAy2PbyAkhiHfYKjLsE4YtYU8c?=
 =?us-ascii?Q?GEr1W4flCWEtYDbcXpS0QjOYOWgVzfv/1fYJVLXWQzb7jPDPUTi1JJCLBn67?=
 =?us-ascii?Q?+Eav/RP/pM2dhcSVDqiX0c/V91ABU5ZZ43hR4su9XjIl9uknXNLL0dhHfdk3?=
 =?us-ascii?Q?W61xsB/Z8bjCjgVTkZnrc9Y60lkRAN4YqNNQUN9VvOfoALfORsz10/VEkLMV?=
 =?us-ascii?Q?7llS1OR34m7OS7gKHj7avrksr+l8KetKzV+CcsexBVTU4Eos0JWx90xexjUp?=
 =?us-ascii?Q?zv+s6qBLqU8BN8kAmwTkj2UPeHHOa3IOfrbur80y/kSI4D54LyZ81gD0eKUv?=
 =?us-ascii?Q?Qj5/SbonrD6fdPwMpKbrgNv2pIhBBZk0GIeY9v+B3A8CNWgrY5XybeaDZC2E?=
 =?us-ascii?Q?0u9tVGMHq/7aJOdT2hCq99zSglckcAnixKxer+Rrks9cXWMiuZCqL5eZIoBy?=
 =?us-ascii?Q?/FF163OnsJ8suYqvcCUfprMe/+yif+t1S9t9+gS8n0ulpJ8nPfNnm9J2DcW2?=
 =?us-ascii?Q?3eJ7bAmP?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Gnm7B6N6k694VQ8z0ZF7JUMvvLj3bu2ZN8orQDle3lMWvJyxD7qFncErwPpf?=
 =?us-ascii?Q?xZYN+kL2MsozwVOa9FYonfn7i/LvRn4mPeWC7+3HJgshi5gSMDgeVqPljN3j?=
 =?us-ascii?Q?N572Slt9bSNON9A0jC7v2F0F5bQ3QG4Z80GZlKlO9A7wlVG4zl8GKtqNweVV?=
 =?us-ascii?Q?RlBjg9SgZlIdxEosI3qdUK9ngPJKXfIBAtRCsmr1AwLbmvNPalU4F7XeugoJ?=
 =?us-ascii?Q?/B8bmzO0oMbwJ776jUMWiOp+RVMHrhOuRwA5jzSeFw25H4sqIhNfcBm9GAjW?=
 =?us-ascii?Q?YgKvrFSKNt7XfRX4HlZ61QbIbpMZNwAPmvi76kdcYZyfEdTMJmqfRZtpM65I?=
 =?us-ascii?Q?KJwdJaWvGB98ly1ohxhLzmeHuL4O0rqOPA8zaD/QCrN7gTTseQIrSXsSZ2y+?=
 =?us-ascii?Q?7YOpvjSOzThPfpiMfdOhyEDEDU1zjq+jTjW4vAbtY6+GDIIwvCtoenkvt61R?=
 =?us-ascii?Q?0yAOi2LwXJuT3WFS4BuCrn+Pfz+IVFm2XGd1WHUQzKx/w3wECWaS6TUlp2DO?=
 =?us-ascii?Q?PuaO+i6ehtRpzzglC0mLExnnq63BrI/mRrCZaY/0nmyeJH6pzJRMzaIDhjFM?=
 =?us-ascii?Q?4Vc+B4ZRU95VNMi52+Nzb8pF50RDrWr44AkXefTFVRS307ZKb1O66axLUWql?=
 =?us-ascii?Q?xI6/cTS31raUkwy9S0tfsJwoOMANAm1h6AVIewgUUuz1B07e2FelPKYFMnp3?=
 =?us-ascii?Q?CklJCKQOEcYevgzsjvFPYoiVfaFkxMlMzs+cjJymN7BZm9z74G6Bx81g98y6?=
 =?us-ascii?Q?5dgQjCt49gVf/1vzReGzBflFmZtqMa4IBS0b5dIxeoFtsxpkrNxPbHnTyBA7?=
 =?us-ascii?Q?szrna6EL7nZJrR60/kvRLkFCkfmLUnBUfbg8ztflzIjE99xtZcbyz36DF+PQ?=
 =?us-ascii?Q?JrD1mmQeCF7HMqod3OZZ2Og6A4wb6I2Qcg1Hvz7yg4xnSVf/jmljpVjRfdLI?=
 =?us-ascii?Q?UwGgcSZifiUDEX5BY4DL4hMcZ1qR8MUJ2OJmeUsb+H7GoVdCV8Qz07iY13E2?=
 =?us-ascii?Q?F6H8XZMmmajht3gpjmGqjoiZWu8GbpedCrKg0MZBA4sP1/76I9QAMEYqWu59?=
 =?us-ascii?Q?/JldWfZRXGFdrkaJlLLzV7xKhrC3xobgb0yvkC3kQxicSiYB0ZRV8jVhCFBA?=
 =?us-ascii?Q?XdVTTzpDCk/s1gaKn9SLYrVQUFQR18hHyjymZ2tSiHxuNkM5tPqjveAHjOMe?=
 =?us-ascii?Q?GlYEgqeOqXHk2Sixbg+hJDpr84729qOEb5cOK6GYdq0S9b2Aq46b1oUhd9Lu?=
 =?us-ascii?Q?G+eBsN2UpoUBnTFlAtzSu0FIqJkgk22GNXbOc/7vpHF8UZ14f2wjbx5ldT0p?=
 =?us-ascii?Q?eRrb3GaisoNDY3negCyE7G9RtbMPqT/5xC0r69usk1YLosgc0zHFPGS1yvIZ?=
 =?us-ascii?Q?IyEvCvM=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd243e1-c87a-472f-d75e-08df4c044c47
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 21:29:06.0112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR19MB026956

aw_dev_fw_crc_check() does not store the return value of the regmap_read()
of the CRC result, so the error check after it tests the earlier
regmap_update_bits() call instead. A failed read therefore goes unnoticed,
and the CRC result is taken from an uninitialized variable.

Store the return value of the read, and check the regmap_update_bits()
call immediately, before sleeping and reading the result, as the aw883xx
vendor driver does.

Fixes: 8ade6cc7e261 ("ASoC: codecs: Add aw88399 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88399-lib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88399-lib.c b/sound/soc/codecs/aw88399-lib.c
index f2e2c88f5ec0..20e809035107 100644
--- a/sound/soc/codecs/aw88399-lib.c
+++ b/sound/soc/codecs/aw88399-lib.c
@@ -437,11 +437,13 @@ static int aw_dev_fw_crc_check(struct aw_device *aw_dev)
 	/* enable fw crc check */
 	ret = regmap_update_bits(aw_dev->regmap, AW88399_CRCCTRL_REG,
 		~AW88399_CRC_CODE_EN_MASK, AW88399_CRC_CODE_EN_ENABLE_VALUE);
+	if (ret)
+		return ret;
 
 	usleep_range(AW88399_2000_US, AW88399_2000_US + 10);
 
 	/* read crc check result */
-	regmap_read(aw_dev->regmap, AW88399_HAGCST_REG, &reg_val);
+	ret = regmap_read(aw_dev->regmap, AW88399_HAGCST_REG, &reg_val);
 	if (ret)
 		return ret;
 
-- 
2.56.1

