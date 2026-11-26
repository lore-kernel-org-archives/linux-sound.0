Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795728552;
	b=oqBnkZpGpBZCjDSKj2AJB5DqGk994tpJU7k66SOVDBuoww5tM0rOPh00vr9F84omUUy5
	 xdbSeQovtfsYohDb+6vhJbNKWhhz9B0zPFCCn1k6yZjUSthrWSVUTXJMtx/UMJ/owHCjY
	 ZEr22mE9/Nun/RJElCCN2vYlRWRN+8GJjOJ1rbytfAffPbs9KcNh+H4AqCSExGEfn3ReT
	 S7VvdLN3e5/8YcT1bRHKEZaSsJmMcwXpQuQKIcFUTsj1a5aK0iPwC4cqKs2bx+pF7ol+B
	 6dyPGD14HUUmxlopMjzTP1mzE2ydk+waQEl6IQAeq38F6EdvCOpHy+DB1tFMIEsvkvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795728552;
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
	bh=dBX8J6BkMK6gQzl7uw9wFrYfu51exTcgjqtvB1kUGlA=;
	b=C8c1QLhuf21sOeHX6RqQXqdOJdQGFGTZepn+uCZRVrii+hB1IcX4gpELBrdG9AuDwhxS
	 EZXpNeaGBbGg9MMPiAANrzjomh9+hS9Xht3jovl59/7Kz1QCOTeeSLmX1n5I109tQZ3S3
	 PvBAuTSLn6vXYPscE4oaE9zo8nQVTlfeyczjqC+AYvk8Zecm7rZ4rS7/sICYLHZ03l/ng
	 5GGJ947f8rX/+zFONfeBBSZeo1jY2riI98e3BCBKWa+9Mn/zlQZE9Icn6UP+AF2Io7o6q
	 umytBL+9W3WVLnJFUAkeoNIdNOFeOGOtlea8Zu5KejYe6CSJM5TK+vhxTeazBNaDAPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.it;
	spf=pass smtp.mailfrom=outlook.it;
	dkim=pass header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=JzmZTfqZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.7.87
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013087.outbound.protection.outlook.com [52.103.7.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41626606A335;
	Thu, 26 Nov 2026 21:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41626606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.a=rsa-sha256 header.s=selector1 header.b=JzmZTfqZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bghVKB2euofLSicxzFMAEc73StWL7rgPSzffcelUXo0IvyGYNIJe6iUh6zSw0n3HyfZoekPB+iC//oxS0bQyqkMS13UWdOuWaFM317JHt+0kZ+aOTeENJxXf99VmUxyPUz4ify22QOeB5VssUvU2reNus6A+hvyG6SInxqo8cSZ9o3s7ZaY7qR5tj3wqfTvQb5/VBC6F2aAAXoam9ACk9i4dGphaoveckjx5RA8WNdWi8if2tXLO1DH7N6vHT2bG1/eCZ55kZgzXkQm78iCh6oz00riUaS0YnnvxEn4BszRKh+8P12R0/pE61Opk/2vu+QX80R3BCXcy9I4T12tmRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBX8J6BkMK6gQzl7uw9wFrYfu51exTcgjqtvB1kUGlA=;
 b=q8BcIRiXQOVwBktS6exiEh8gpKptQRSsdjObsINkIoeM3ok//sQ5R6eGA88/4X3EGpxIst4qj5Q+84DU445E6LakhbW9rAB/UN+/N97s6pg1IRhQsaMLSimv43uT9Fa/sqL4ES7GAQpWhm0JgbQJUvcfSvUl5XfT4TUsH/U6zClbpnBhOUM2jzB3gNrB0NZB7D2G1pnRhsrGNLPjK8OgFQQg3Qx8reDu45kpkZdxvLvZYEO0oE5L0gLKBy4BiYhwHIY9qyHCzHP9FiTcCmGPVzL724ava0jWi78mjJ57BrNKYjz126xsPREQ/fvAmh4he4rQEG8bCxC6zcDz5kw7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBX8J6BkMK6gQzl7uw9wFrYfu51exTcgjqtvB1kUGlA=;
 b=JzmZTfqZGu6AUubqr8GQs9HTBJKGi4V9E+b58EObdUKMlKMGsBkXj+VdEsmAB/SSiDVAhymwzerqPwa3p2Sja3R/VayMUbxtl4qI1kMkwTJ2/cw2ZYSjZ2/gWuW1l4I474cuTari5GQVTg21pYcPfYu8iHj/+tjYzaJMdYDS7bfTFK25T3JM5pvXw6wEAK2O5Hzi2SF/0xt3fPrBAdjy1M8+Yyb9xPN+o4iuj+8fziO6yrYh1dNTJS9GHBfXWQTqW4zOHmLi2J91CaMjMwVOwGYpW3x2yGwDQKKXPmmJ4qz59T27X8/tl1SMj4qKJEqpXiWxDkeUlg6X6s3iOQeqvQ==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SAEPR19MB026956.namprd19.prod.outlook.com (2603:10b6:802:208::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 21:29:10 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 21:29:10 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Marco Giunta <marco_giunta@outlook.it>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] ASoC: aw88166: check chip ID at probe
Date: Thu, 26 Nov 2026 22:28:46 +0100
Message-ID:
 <SN6PR19MB2303BB00EC52FABBC01318C5FC422@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB2303BE99A9E0E7C4F64B516CFC422@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00008BF9.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::475) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261126212848.11778-4-marco_giunta@outlook.it>
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
X-MS-Office365-Filtering-Correlation-Id: d41bd820-d3d3-44ab-6900-08df4c044ecd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|8060799015|23021999003|15080799012|24021099003|55001999006|12121999013|25010399006|51005399006|5072599009|260925184616899003|41001999006|40105399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OoAubvxkSOhHiroTHx8gYWNP6IK+OlzxHrpjDPLH+0C65IuwjHHCXqxtk/nr?=
 =?us-ascii?Q?2E/E+2S0V+iiS3kq8B3yLUq9BVypRBy1Lqj7WN8wVocV6+9XsQ3VdeXuORn9?=
 =?us-ascii?Q?hI5CVdn1UMQOz/aglGCBkXlytXrUC1Ubm1qHzvn6Og/0aKZ4uV29AGnWQZJt?=
 =?us-ascii?Q?bzD/L2zGqGAk+F1agwcvYM/PtwOOuDSGlxe3F52Iunn5Rr3Ef+0NnhEy5fIx?=
 =?us-ascii?Q?rXsOZQ8To2s8BlQP0pttj3+/737rRckFuEDgFo0IQVLq/Et3lWS+bl39PYOr?=
 =?us-ascii?Q?h0RY39NVPLTNin+uch57JOe+k8v8YzGjIlevyB+zlHw8b7+fTBJ5qgVMVVbD?=
 =?us-ascii?Q?2BvIU6xsErGWx+1Rbsem/y1Iq3u9V5dt0fIPPhwR6V6rTlBW7SJS9zqy4KHo?=
 =?us-ascii?Q?8nBL6EtoNtlmfSCPpqCbBY+Wnpfcxdf9j5kE8ufGpdCb0Ue3B8scRsC/kPFq?=
 =?us-ascii?Q?g4l/OXXjonoMDReWgg6cJ6uLG6CdzCGA6NlmhGtiol8jE0edNgFQIJp74sSb?=
 =?us-ascii?Q?QIQ4TXGtnur8ft+DAlboXyi5JIxLPEAWFcoU/8s1pH7Btyomi+NWBrau6TWz?=
 =?us-ascii?Q?vRE036NcSblBQyIK+UtooPcLJCoVW0urV02FubL6/lquVCA6PHomNn7Gndwe?=
 =?us-ascii?Q?UEPE55WfDSkrKHvI8h65tSDxJFuAcLZ7q98zUHR3b9KHpIjwwNt1K75auJws?=
 =?us-ascii?Q?jlN0mUyJh7mNsQTedgO+iiALHHQ7q7lcOHKrxxPG3gcu7jh6vo4HffHe1bAJ?=
 =?us-ascii?Q?FstAr0vDbAA5eEztgpwNPl3IqE8YGnZtzucCFZ2JHXB4Kq9p5g7PnrVwyYog?=
 =?us-ascii?Q?cUNAQXpgiR1tUeReAJ+E7lgLRTWftV7R2zQv4qNKnq7PQjXEPbXAK2rXVSgA?=
 =?us-ascii?Q?U0BUO2dqz6Mhucnnz+Vhbr0DqojJV9J3N4EsFa4GBfNdVNC/0WnOv4eVjlwL?=
 =?us-ascii?Q?2yM4znbqEumbljvzVCDBS83DCpcAzTCFhkZPKyuwQCWtmqG6dEVqAy3HWJZg?=
 =?us-ascii?Q?X3+qNQphx2B6beyxKimmERVY07ncZRqW6ZHX29RjHbSTwvqI74agAT8FgGA7?=
 =?us-ascii?Q?yxcH4GQI?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p+eQJsoLn71xv97aYnll3gQ39AAUJgUoYFmIjzCF9JEMVuzURfEdMf7MRiSY?=
 =?us-ascii?Q?wqGww5dC9EDCmM8v/HIOqYxD0Gppboqu2QXYCmlrGD+VRVY+mxbQLjphZtiu?=
 =?us-ascii?Q?jasm2fpVml0tuImLIm6/QAojpDu5dEOwKi6aweTLSAOBnD3e7EgZou+EI77B?=
 =?us-ascii?Q?WgQLdtcqsAUO+PtAtGMWr3H5VZ/QBDhkKKazz8k/pHrwnk+zigtHGzSuLU9R?=
 =?us-ascii?Q?zzslYLv0lhIvzQCRnUuD6lagZbzrLOKws1Elc1O0Ti5GV4EOLnl47a1V7ZP2?=
 =?us-ascii?Q?BDkY+5Sz8l44RmNXg1ypzAv0jrH8m2NtTfySz6jwM9o+3l0Kptmwvoloic1b?=
 =?us-ascii?Q?KGcWkFWwAiB/8z9Jwowmlzkc7ayDiZOFD2Tu/mwARaX4voWYrKQnnl7ho3aG?=
 =?us-ascii?Q?XqDwIg3dgacMQTwiUqzmC0ZItXy10smHrrLNcyGpL9HZnX8sSjy3V6d0SAmX?=
 =?us-ascii?Q?G4LQZ0iO4wffJFq6Hgw/RsUNOx1RTRTfNivRCoYLOs/trCKvTiYqok1l68Iq?=
 =?us-ascii?Q?5/jj81vTqlG3P8l1fdfpOK4QDGm86qj8AMqmELZyS/wnMF92gvgseg9I2eH3?=
 =?us-ascii?Q?lNDDpbBQp+8RfnGY5zuBDIpRjuZ1I0qG1i6jTRrUp1ruu8zXtW1i4FcIOqQ/?=
 =?us-ascii?Q?YPn5a1SWsEVLNspDpSsuzC4t9r943lGE6jCNbuOVzsaA/nBk2ELu9VHWFTsr?=
 =?us-ascii?Q?1UA/qi6rJp/9+VmjduM/EpWoD2PXeM2SrWeaTVOpz79T8bn1SOrV8ziS7dMj?=
 =?us-ascii?Q?wAN0yrDNgIaBkAa1qOt8Rdxclm//zPx2XaaVYRPNh4RekT7ToyHsQd9CxLDb?=
 =?us-ascii?Q?JRhFi8PfE5M6iGYD8ZQB0SjgzZba/MCgkENpODHUcquF7YV2LRmSqAPK0MJd?=
 =?us-ascii?Q?If6MCxpA7DyPLXTvPf0flE7tm4YetYhJLphT1oROnA03wb6ZJr4Tp4+F+PUC?=
 =?us-ascii?Q?GRpDGICujtjKdFtzshkflde+DYF11jCZWDeZRtUbo7QOd3UD87Zd8uCpGUt5?=
 =?us-ascii?Q?iVFMY4OaCjVczFDvBGVqEZE8CFrrcwF4soMF47Hb2INdvhWijkCOa4avBsR9?=
 =?us-ascii?Q?sviYAqKx2e6YBwuF8xYfzmzutaGoe0a7x5TBcaO/z/eYcL1ztF0l4pQtLUrL?=
 =?us-ascii?Q?eJZoS2X4bPxp/1NhXKdn+LROM5uU/ECCsaanrIx//mp7IVMVlG7euaUTwv+c?=
 =?us-ascii?Q?0nxQmN17mmXpRFaw6YjFwcC99Io9znAIqgFx9Fr7ib3YiEug7KODpm5UHPyO?=
 =?us-ascii?Q?KCQIHauRmLZPv03YCrJQiXtJ66KlJijOehTheMLPcvdSvOkYL9/jntYOubHA?=
 =?us-ascii?Q?33F1MYYwP22SwSubq1snPQuB8UWvT+IWCzMNfso2oi6JfHftZwpMKIrPWdyN?=
 =?us-ascii?Q?VQusiwA=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d41bd820-d3d3-44ab-6900-08df4c044ecd
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 21:29:10.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR19MB026956

aw88166_init() reads the chip ID register but never compares the value
with AW88166_CHIP_ID, so probe continues on any device that answers
the read. Reject unknown IDs with -ENXIO, as aw88399 and aw88261 do,
and log the chip ID at debug level when the check passes.

Fixes: 94e412c28e61 ("ASoC: codecs: Add aw88166 amplifier driver")
Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
---
 sound/soc/codecs/aw88166.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 5e891bf99bff..92034c90d8d7 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1734,6 +1734,11 @@ static int aw88166_init(struct aw88166 *aw88166, struct i2c_client *i2c, struct
 		dev_err(&i2c->dev, "%s read chipid error. ret = %d\n", __func__, ret);
 		return ret;
 	}
+	if (chip_id != AW88166_CHIP_ID) {
+		dev_err(&i2c->dev, "unsupported chip ID 0x%04x\n", chip_id);
+		return -ENXIO;
+	}
+	dev_dbg(&i2c->dev, "chip ID 0x%04x\n", chip_id);
 
 	aw_dev = devm_kzalloc_obj(&i2c->dev, *aw_dev);
 	if (!aw_dev)
-- 
2.56.1

