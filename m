Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD863446B0;
	Fri, 15 May 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840328; cv=fail; b=ENVXHGXADAeZYCO9k0hOeZmmLM0uLbTmhTqCuAPGG1rzgPtgFw9c745J6GHUh86RQdTGB1dgcvt4/ioal7L7VxTyL9Ri8togvrHb+Ceqoq9cpSbcsYXtJltAYRYlUG1BrPeELnitcV2soJUIwDkjqTttQYhaUs6lvCkeLi8RewQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840328; c=relaxed/simple;
	bh=Zdi0x0ktJqt7ij/mTdXcI2qY91LyUY7qeA3PgJib4rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNmF7oG6HHUlJsbLtGA1ryOKEMdHUth8puXeOeON0Xl7P1pyymMFq9UHe2k4ZR/6ycsVFisP7nLvc/pBIZdkhywCltkan4dDMRA2dEkqkzAMt/aIg8FGl8WFSXnaIu9NCxmlN4pXFAqq2mzKZ4NOF47Mggq3eZYu7JOsefzD4j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tnjz8y4c; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=wzv3ZRvy reason="signature verification failed"; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tnjz8y4c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="wzv3ZRvy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F3mkq6371296;
	Fri, 15 May 2026 05:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=ktnoy4EiBafipnGFaL3Uq/0JMnz43wWgrtsXIMNdV5o=; b=
	Tnjz8y4cV9aVzKgEjAUOU6hC8hw24UNsDChvJpC4GOEyyGCUxWHisHvHc2XHajKV
	cKpa1UY649Bn6hBIed3dedqFpvTqpiHiJieRXr6fj1KAHzGTLeg+kmgcvtFsWwX1
	Z0xH4mpXqN09BLAeypszg7Obk3tqSie7DVRr6anLHOo63JUL97RiOuc+dVARMnnw
	9nIWx23pnzYgt9zrn4nnq7P3XDReH1XlZ7D0h5yhL2Z0oszY1BE0A+cNUBoMp6F4
	y8Oh3UkLjpfeEPsydxbyFkXg/iQYDbASt/Dmx+eDiXwV1YaSFYrWOnyba0uAywyU
	ixxcRS+DQ41bIPf9xFFcog==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022113.outbound.protection.outlook.com [40.93.195.113])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e5m2prrgw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 05:18:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqgApioyA+87gLBvXyW4wHHyHBoSnxis5Rlke7Xj14LZK4xxEfTnsZreYCjvKD0l/u/mAfbRE/UfgngdZCcGJF+w1kOdHVRjriiGQ8E/4X8JwKPr6WaoFwsKdDepP9HKeQ/dv1NemAv3IgIcjIKjq+NXp5LlupMinBLwT/TZt2/YMN7PMkr6s0CzkCehJYoIAjTBkOzkVvBmAi7M+VBQylgYoTH6xvLuzlFhAnuA+pvZi8oaDRoy6v+D5cgF68FRqKaYwm/HTPfIgVWzxIgOVwnfJGsGqUZDeVrShyfyQv+UY6pAkGVihoOUWSnWKfcTD+yHX7/2d6n0GU+VRw+B/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBKnmMyrqF98BRIoYOZ//t8NEy9KJMvZcc5Q7W4hWts=;
 b=qHvJ2e0ESjzjtXclqL17FFnGnyAlSNiXGWImB8PTubbBHYQHZBjoc43JPPn9qcy23fetk/SVjEHRlXVNC5YvgvDNzbLqwxhNeYflylpWhl0+bm9dG50tyHTPsGg0wwncUvJlnoHqsiFPGBt9khkR9x6Qsx3B3YDoko9KX9ie4VZrH8rmFX6ReGr3+FDaJSeBdqrv7PrAQ9tJ2YyB4m1uKRK6OIAtwjzI+yRPOlRSjfOlYOKvcWjPvvjbxRnQVYqMT/rWiY6QRWDS+1qHWzHwlTGdroGKgUSo9RbDIYBd3F9ncZSNd9L3NqvuS8WuY87JaAl+oOx0fs+kz+wqsPT8Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=realtek.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBKnmMyrqF98BRIoYOZ//t8NEy9KJMvZcc5Q7W4hWts=;
 b=wzv3ZRvyzPlMJW5rvqPwbOjhiNZAR5vgsAFCwN+WSGE717ZOkZ9rVDRRV05ygWWBFk6rrFGZKKYDn3dBCSOyYHQ5UVOQK1toMhulvDoUzhLwL2CXDVNSZoGMb6CguOcJjwESkNYsM/sXNF7AbOKKq4v735EZOFmro3An1Vhnvv0=
Received: from CH0PR03CA0378.namprd03.prod.outlook.com (2603:10b6:610:119::33)
 by CO6PR19MB4772.namprd19.prod.outlook.com (2603:10b6:5:344::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 10:18:12 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::df) by CH0PR03CA0378.outlook.office365.com
 (2603:10b6:610:119::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 10:18:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 10:18:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 67802406544;
	Fri, 15 May 2026 10:18:10 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 49704820244;
	Fri, 15 May 2026 10:18:10 +0000 (UTC)
Date: Fri, 15 May 2026 11:18:09 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Nick Li <nick.li@foursemi.com>,
        M R Swami Reddy <mr.swami.reddy@ti.com>,
        Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
        Peter Rosin <peda@axentia.se>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kiseok Jo <kiseok.jo@irondevice.com>,
        Kevin Cernekee <cernekee@chromium.org>,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Thorsten Blum <thorsten.blum@linux.dev>,
        Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Marco Crivellari <marco.crivellari@suse.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Aaron Kling <webgeek1234@gmail.com>, Teguh Sobirin <teguh@sobir.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        Hsieh Hung-En <hungen3108@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Shimrra Shai <shimrrashai@gmail.com>,
        Zhang Yi <zhangyi@everest-semi.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Qasim Ijaz <qasdev00@gmail.com>,
        Sharique Mohammad <sharq0406@gmail.com>, Chen Ni <nichen@iscas.ac.cn>,
        Neo Chang <YLCHANG2@nuvoton.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Kees Cook <kees@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>,
        Tim Bird <tim.bird@sony.com>,
        Bram Vlerick <bram.vlerick@openpixelsystems.org>,
        Peter Korsgaard <peter@korsgaard.com>,
        Linus Walleij <linusw@kernel.org>, Wenyuan Li <2063309626@qq.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Xichao Zhao <zhao.xichao@vivo.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v1 2/2] ASoC: Use named initializers for arrays of
 i2c_device_data
Message-ID: <agby4VvKu2XSS2FB@opensource.cirrus.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
 <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|CO6PR19MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a009dd-d90a-4be7-2cac-08deb26b44c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|61400799027|11063799003|4143699003|16102099003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	W739RYTzlxoDk+6QCIIs0yNn3sPc9QZiMFXR+gG8yXffAwDuwHt12DCWCRLkCCXENhVxcQgnCHFvG7EchpnTa9xNe0yyXI7GyqtI5HlMy7HosSNKK89+gIDJdusq3s/N8wjsN5rxKiEgz3h4TISf632ILdgN8l3E16lYEJD0U4uoBE0WYHzOCQxTERnfosHYE41sVu3QSnSaZwlFZ6AopaD2DT+NWlKldSGMwCegQhsN3yrxsIsb5k0koh2UXJthjdnDlHzeZPi4xUG+omEGReBfM/J+7exaArrlOeibt690r4FtJnTIjhrqJzRPGrY8s+qbNKtJxc3SzIaBG58C1jHdRqmDowvPAzo0fAVajMwkFKD1hQm3yxBu/LisVhMtmk4Wng6QP3YtKQik+Um48pyI4iiJ8oPTcdMVZOZtTSdBM+8meXWoCNhN6ahq3NXreLeNQDM/NcFivak/XRMCwiuc4prYvIQ9SfT7/YEvft0y41PAQ7xwIf92weFvzQ0qml4e+J3AtQyEfF7iMsNvXnQKSbqEv7mXi7j8BJ81MStryKOPTzCrtyTxrSCgO1+jKpK9GLDsQyj/AJ1fWiFyfLMh5ehYIPysQiuua89atgA5kw9HpVKOZCWmbXH3650ZrPqE800xgZLG4CFWp1mHZzQDiTBD8ENDcg1UdI0jCqEy7BI+p97P4xQkEJExSzIDEK0ZHoKL8ku/R0V+a9JHpDF+XFaEo1GYrG9jlogU6VA=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(61400799027)(11063799003)(4143699003)(16102099003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ympEJhN2CirAsZXTma3k+X2e1ErY7tanTBSPBWWzsJlkuFfNcPQzpmG2joSsH+gub+oxT5UUnUcDHOt9F5xjr7iQb5COywV0gDDorPGD9HDUueGQA5+yPdrCni/ezvgo2Z+/oJnxgJz09qhCZjh4U28zYKfK4i8507E2WOQROHKmEDKVB9D5eYUFQ5RR1ST+WeEK/jBdzqWG9P8eljjvuuvSjjZDDDxjoiRTnb7st7RDJMY8Iy9IikBZRF73xY4MXJfcj0itS7fmG3Im9AiEOvn7XOBgczotLy73N1yaaw+MRZlfapXHn+Eum2/23IxvmNLM4A3WoGKJfAFNJHOwasFKIHWRjj0pi6kSC3rXX101pLmc+w91VUnRET7Eq1keGPjY5o5Ld0qJQyzUp8ijpYsZ89xDIbNf2fai6ephJOCAIPeZ61A6+JoqmsQ+T+93
X-Exchange-RoutingPolicyChecked:
	vhC0Ow4pW+MmovljQOmZYjGxhX6arWi+T5KzU+yH83B3QGQLlYoFJ3wu3oSa1SF3iVJiFAsAmg2ZPVMAZkBaT0X4/PkJ2doPx7tmlcSUT1aQHxDqKmF+VI6E1eEndmcCL4NOHnc8wye6mcY7ozyZmUJGQzNwSUeO+uJXYSdTMnMR5e63ou0UThAbm9p1cR9bcN1DXFLG2/3Q4LzwOubXCbYLTr+IE9qFZcoiEMDxj01pR2rVFYDAlgcXh/SMW93T9mtn+UxA+fmLsMVm+MQ9XNiYjxe+rIuUBqqBEgQOj9IKcpL25B0gEHhjJZLTW21hJP3kPq5iAZYYQW9deefbmQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:18:11.5438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a009dd-d90a-4be7-2cac-08deb26b44c5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4772
X-Proofpoint-GUID: vwPr7v-6HZa3g2XRUYPOl5fpQ8aMX-05
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwNCBTYWx0ZWRfX6iK/DN7sR2nG
 XpqRiYhpng1WAga8n4QHE1uGXdBbDMdarlRa1lbq5+Qc9j83kjUz7CLZvNUUxaxXZ53epRGlsT6
 LG50/PpTazeXFzli0hgBdYJKkrrAj/BojGBUmudmV9rXaOyUVkLCUotv/kA4yHXHVhRR+2vVNCH
 Eqofz+hYaLQvLbdGc5p4CY98k0rh9MX2reCeuWdUyOl1uADZSirEV2RsdWXMQaUU4QdoLAm3kBU
 51BoLsKeQSvsa17DRsT2ZFDblM1BtaryqMDoKVCwOGU4X1gqCNJzXWvaJM5lFGKAVbESRROVJGQ
 IrxFR+evi0NkcW+kcxrzfszhHZNEgiCR+SvEGr9NWgdivUqDlI7m6l80dC/Dw9eFmaal5fl8iEc
 fco7Y36RqvGoDdKNO7ty9WNar3DIyqG45vZMKUxDxGsnndGK9VyJ7tt8KxywQDOCj6coP4tRyV7
 t7bS9e3VXp12J/VyfoQ==
X-Proofpoint-ORIG-GUID: vwPr7v-6HZa3g2XRUYPOl5fpQ8aMX-05
X-Authority-Analysis: v=2.4 cv=aMHAb79m c=1 sm=1 tr=0 ts=6a06f2e8 cx=c_pps
 a=39fn0iQLwZAYlIgUf1ob7A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=-W4hE_00JRDff0mwMXEA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Reason: safe

On Wed, May 13, 2026 at 07:23:04PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> While touching all these arrays, unify indention and usage of commas.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

For the Wolfson/Cirrus bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
