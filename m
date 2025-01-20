Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2066.outbound.protection.outlook.com [40.107.20.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E1196DB1;
	Mon, 20 Jan 2025 08:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361236; cv=fail; b=fVjJRJZUttfhWkBSaLjhbqmdBFhk+flBC4xdEMrtfy8wRqCNcuHx74dKIRQQH4jr9a6ZpdHNobQKvdpOZR+c1mKGTdsMyGnptgCXgcOeH7Ax3WC0f3hVBz6HNWgzKmnHg77ufpyl192giqnCNctjbp6/O7aoAKd0kEdHSHU7JcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361236; c=relaxed/simple;
	bh=zdZWiRGhAtlWVwqBexZNSP8QP2/WicfSiAAuwqbFUZ8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c9BmGH4CbpdfMjNS2X8VLdgrGeNZiQAxAcFJfHMsAkD2gagM/t/GvBIKWHxjs95syG6rtvUFisrxoQoXx9xyG64F6V7IJIBC+QFyRxg5gEIQukoEwsEFxguubyipW3jboNDJkbEo0QBYH+SDUCK6zmRZ95vwt7gNUE6LAKksD7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oAlFq53I; arc=fail smtp.client-ip=40.107.20.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oAlFq53I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1aZXda+Lx31iQ8spz6/QR0nZ43NNqkkFquYSv6cb5CtYm6GN/0H6LTmqZ+qqqBJcjWHl/dIzB7UVTm6aUbyAsgHGJyVAecb30gosXd+OM27lT6r10st7t0EpnYR+cX1VWMi0xShVJ4a/I/0B4ufqriS8SPqeyOCxtbh8048ndKtBvsr6cpgnWG0Sp4MfFZ98gI6uXpBm0iOvCXs3rxk73TOjx1sNjusw2TFE07wOEycPXVjEzDkvOjmj8nxw2dsuHSNksUgH9ySkSsck5+LcNUnA0PCiHU9fypVICHZij0zsvG9T3+xSIeBp+TdwwERDe9PIrz2Azxc3J5CHgzB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60PUvq+kqo8ZtB6HHCWWbhm607K49VvYrcNwSEFSI1c=;
 b=hLoQPdNCcyljK34bFeO3cVTZxqsg7hfjMER4lM/AWCdCEbJbckBPDTBCzUPIBvcyD88Q097FLDJeetJpYL3SGjqGEeyRtGWtlKrpuCOMeD5udRT1GTqVmSpPrwsSuNiESU9ox5VTH6ei8QOvAI5K2dT8g9ryZAtqSxBqwtvAC7u4Fpyp7OAlCL7yu1lKv3KCs3cU8whaQfFKl/NCVIs12qcoU7NgB9RLjNNW8Ga34UAK7R5p+dI6iEf/hFf5BoEsM7agg394KSOrXTmJ6VbpZnknNHr8h9zvQ2vyk7WOZNCDliScZ40vo0ktcvsnP1VSEwgXQNSACy+5V6Iicv5fVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60PUvq+kqo8ZtB6HHCWWbhm607K49VvYrcNwSEFSI1c=;
 b=oAlFq53I1aZy5C4oKIPegUOlb5OObUzj2LpMZOb6pyOZsAGzA5lhgrHHmYS2UkCaTESZmmx6iYhQWIFlICurBwicxOINezUboVK73zWg9wriHohsYOIP8LxSehN9XYTuz0YK+N/jyEwDOGGL2nwQB4Dy+7oO9lOCfr41t8XfxLwyn3Q7Q18n2331zUtdV86wtFF/kL3rzTgEfxk34fFcq+pYqvKJHM/w05tOLVTfcRYhJvNBpj1Kk6jcj1BL+j5Pmvs7gSulzXiMnWnZP7MSAdoaCculwa9kQ1n0bsZUryGZI/BF4uzK/vbBgMD369QpVo3MO7eUC/WDVXwIVfKkMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB8933.eurprd04.prod.outlook.com (2603:10a6:10:2e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:20:32 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:20:32 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
Date: Mon, 20 Jan 2025 16:19:38 +0800
Message-Id: <20250120081938.2501554-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB8933:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea227c6-5e6c-435f-56f6-08dd392b4ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dfUYdFVq8MoYczlOsfvKMNTBs3YwGlsOll1zz5txkddr2lhfkfLNnSLyjFjg?=
 =?us-ascii?Q?rEKHP5SUggYk/r7cOMup9T8GVSv/Lp9z5V9dF6XaX+19GHVyFGIQJMvnY0jw?=
 =?us-ascii?Q?UcYvtGjReqUTHAvF4nGQelKBQ2VPDOPT9Sw4BQVBigUYgm5qtfEKtbrQ6XGz?=
 =?us-ascii?Q?tHPl40kEatFFH6fuWSIAdGyl5bwJK4qWImXDZ30WdPiddRXepwwidbkHoGId?=
 =?us-ascii?Q?0IvZeW18T2KMM71FsKVBksl/OofTOgYZq/QFjt9cp41k+mQcpSS9Nx5EIjfE?=
 =?us-ascii?Q?1fav3cIMvpLzF8HOJyEENJRonwycrcnKK0/SDZc9Ir3nF5q3ZhfddGfhORoB?=
 =?us-ascii?Q?BVRduf8Cv5/otSMD1o7CHrGAkhhpo+2IefwatKaeAC3X7g2oCw8qPvX4hO6d?=
 =?us-ascii?Q?nqyg2kmFB2x/kFmZ/FO0PwzjDpySipQbqJQ/7Oc9odDbHJqlrx+s+cWdquaf?=
 =?us-ascii?Q?WgsMJpkiZIwFhBeggnAO/izzs90cFwm/tTKgNB0Or7/Wng84IhyI2G5L6VyM?=
 =?us-ascii?Q?jivTRh3pa4z2qvy0C7cMDxh6JK4CN3xpnzA6pQbCxTULhPfK8xgtbmV+fdMV?=
 =?us-ascii?Q?azusheFDq6/3UqY+3Z21var5rwgoLEKBVuawymZWmH/gGybB5q8Vf7pLwRxg?=
 =?us-ascii?Q?xz60y5iiS56bXG20LtkmoV5cOmWpdg9ifIKePQrL5pb7yHpD5GGSwybvfFcY?=
 =?us-ascii?Q?WWcfas5hTktZZU9j5BR/ePFX95zqrgZTRuJmMfQMZuXcs24f8X7nEAe03bq3?=
 =?us-ascii?Q?cnjeyfHV4wuCTg4by+jgSKqhYslKegSndxgxXHDh+1haFxCtlGCORcc/i+04?=
 =?us-ascii?Q?7eF17BgiWFQYOx09reUsaRP/8CkDQc+qrPhVVTllw+pan4qZZmEX0IjQpUbw?=
 =?us-ascii?Q?jcc+ICXoIePM+ttky2a0l08+Az2osnkODsti60a89uclsADfJhLhtXXEgXAi?=
 =?us-ascii?Q?/0HTiDlwB3TTbkvVCaGMp2Pz7r2l03k3hnRp65RMBng4aM5FNj00CoGHA0tm?=
 =?us-ascii?Q?5tu1kfy5b5Y8ZNO0NYBjJHNRDWQ3ft8VhMhphfS+QZSz3Em722i8wb9ZYhSL?=
 =?us-ascii?Q?nluL+JLZ8B5m6JCZII0uDfzg9l5CRJ0UirV1FOACLJ0LDM0Oa/gOARyXSg69?=
 =?us-ascii?Q?aeqH/5hy2y/8CadHZPd1qKd62A/lFTdJIUq6HpzaAmYBXoKz/uOj/w/ltv1I?=
 =?us-ascii?Q?L74tf5todjcA8yY3AYS26mkCWfKAk/lu9ce21qqeYTzjVJDRQRmydDhyZQ/e?=
 =?us-ascii?Q?Ir6oV4gzi8XVex0JQFK0rpvsVLFAFtXSS9Q1JkLSxkFKdB07SDx+Vbn2NkpA?=
 =?us-ascii?Q?Vky0EEHpzYWSbZ2cfZytN9mcF2llLaJsuuV9aKUURDfU6ZEQixwW2gP7EXPE?=
 =?us-ascii?Q?Ng5O0kKPT+er/anPwgq/W9uy79pMENC6x2ayh+ITOiAFf/r/E6q3bQEKNPL0?=
 =?us-ascii?Q?rdTo3r8oboLA7rYQHcyVoUsIVBSn5YMnn+hNCBApOLCFPk3DDWY3HA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PjZ0zXNCPGZk2cmIMCW3eWk7NPF1hXo1tKNaFgM6F34SZeN5HVYD7dRIcInh?=
 =?us-ascii?Q?GWqrfAvEJ0uqyDayUCJ8VeigjcVLLVkbJFahvqhgbbg3SwA0pBaWjWUG34XE?=
 =?us-ascii?Q?KsnZzkvjeZYG25ulEOrQqPtpE+XsMecmIPUnfXv+VOJH6FgoIKhUYybhNWId?=
 =?us-ascii?Q?wdJ63fe+6+doSHiBgL79WFpRnioqJ2mJN0fx+zfLKgDif5OCVkOaMR3a9YME?=
 =?us-ascii?Q?2OYvWzEXZGvIP8V2tNgJ0+lwKuOU3NkhkZ9Yrc2yruKN6Kef5V9E9G5GtmfP?=
 =?us-ascii?Q?3ukJ/z3NGRRL0SX4zQYei30C5CF8FMZl9OK0LAuW9OkH28M5tCN1BoooS4PB?=
 =?us-ascii?Q?djo8TPuv8ppyR6IhKTGyqI4aW+KH8U0QfVl29HfiyOQMommTeglX6Zrfe0LA?=
 =?us-ascii?Q?5WzZpIDdJR5PHS381q3gGcA/+hEaaD0t2Ai13MADf5Y4WxrU9qMkqN+jEWC5?=
 =?us-ascii?Q?c3YCRf16AF7sRstzdSRaZZMfo8oaJd2RG/3WlTBNbHWZ+B8lPJGrEtdC38EL?=
 =?us-ascii?Q?O1bIEK8EYRUZGMRlao7LcGFB4NIreJE4TOiCOa0HViuptfNp/1DhU2MC1GlD?=
 =?us-ascii?Q?s0zMFC92NHlncbjgAIylGLDhrYyyCeA6XidrRC0kKh6Cs1ZWRu7toyC6vPbS?=
 =?us-ascii?Q?pK9kUWfzLq0XkcZxY4mBt7zWdbbDVZl7YDNqm2f5fK+3VaTcK6FCSXhheGX2?=
 =?us-ascii?Q?dYW/DKIt7KBkVAz6fZ18cKAUwxmbIVSoVDwZkAob7bIhaHj+BAXjCzhhYKEK?=
 =?us-ascii?Q?dWSYJTHyT7Eee70EwSVzs6YTeS7YFMHstdNBsQ82LqLsWKQ6eekiGNWi4COH?=
 =?us-ascii?Q?E6oWP67Vb3nTVX/CP0LNSXuHmTuh49OUgVgj+BKNWw2v8JCPfPMAxpCW0m96?=
 =?us-ascii?Q?q3a80NOjc4kwCVqy+4D0gkk0myDaBJEmsME1/q6fiu+wo0Co48g2M1+pk3Bb?=
 =?us-ascii?Q?bIuRQ9smoPjGLDNfM4JCHJtwjP0cbnl8VFKvLFvUt0hgvv8DiM1rKs2ISgYI?=
 =?us-ascii?Q?7cMO66/+PAxknrjuQkwOxmWpd5l9Y8l99cH5XbOIp2HaQZzIV+7QFQ5igiYQ?=
 =?us-ascii?Q?ypXSBWhrMW2dW1btBZfRwsv9D1li29bbJVpNkDQy2tt9S1BBdRXcig8FDtWr?=
 =?us-ascii?Q?Tmap5QGYJodqjFbj3jXIXk1uJnN2TcSFLp/7sJrJEZNEelzrKO2FPyFGgn0v?=
 =?us-ascii?Q?Ap223QF9G9Y4rFHn5MPIxjN+74xStvIfsHMWHyGUrLRgfRHr7A7nYNvzfVvO?=
 =?us-ascii?Q?xgfEh2hW8QymWbKcDOsUj7XPJyZB6Qum9SOQfqGcViJj10ciOCSwYwUQTTlw?=
 =?us-ascii?Q?aChs9Sj/xjl/EztEV4uPThmrHyslI00lh3WGv2vh/1E8PbMruB944FEAfAtk?=
 =?us-ascii?Q?As5jMg729/whA/XQlcmQ1iP9RgrQx+5SIcZ+5xIi1pITlZtA+0ZoRd/8cR+d?=
 =?us-ascii?Q?vI7PmG1VcqTgtqQ0LHL6raEzGYgt63Y7I02P5LV37SgG8snNPgO7opCngfD1?=
 =?us-ascii?Q?SOOoSTufez/oX/KvMYifPGEBPTB+Vv5GH8YJVkJeX9kPzEo/4zZk/fHJNhtQ?=
 =?us-ascii?Q?wn+x13BKNCIRdZyNCTW1NupROTgnD7mWevCRdFU3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea227c6-5e6c-435f-56f6-08dd392b4ea0
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:20:32.3827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i8Dg8RUge/1Thsi4OZrYyApCnO21gpkVzjn6/0kAdcxbbNK6rZkVc/yjxUzg4V+yiD5KzuIFIi2m6lYr4a8Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8933

The asrc_m2m_device_run() function is the main process function
of converting, the error need to be returned to user, that user
can handle error case properly.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index ab9033ccb01e..f46881f71e43 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -183,7 +183,7 @@ static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
 }
 
 /* main function of converter */
-static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task_runtime *task)
+static int asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task_runtime *task)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	struct device *dev = &asrc->pdev->dev;
@@ -193,7 +193,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 	unsigned int out_dma_len;
 	unsigned int width;
 	u32 fifo_addr;
-	int ret;
+	int ret = 0;
 
 	/* set ratio mod */
 	if (asrc->m2m_set_ratio_mod) {
@@ -215,6 +215,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 	    in_buf_len > ASRC_M2M_BUFFER_SIZE ||
 	    in_buf_len % (width * pair->channels / 8)) {
 		dev_err(dev, "out buffer size is error: [%d]\n", in_buf_len);
+		ret = -EINVAL;
 		goto end;
 	}
 
@@ -245,6 +246,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 		}
 	} else if (out_dma_len > ASRC_M2M_BUFFER_SIZE) {
 		dev_err(dev, "cap buffer size error\n");
+		ret = -EINVAL;
 		goto end;
 	}
 
@@ -263,12 +265,14 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 
 	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
 		dev_err(dev, "out DMA task timeout\n");
+		ret = -ETIMEDOUT;
 		goto end;
 	}
 
 	if (out_dma_len > 0) {
 		if (!wait_for_completion_interruptible_timeout(&pair->complete[OUT], 10 * HZ)) {
 			dev_err(dev, "cap DMA task timeout\n");
+			ret = -ETIMEDOUT;
 			goto end;
 		}
 	}
@@ -278,7 +282,7 @@ static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_tas
 	/* update payload length for capture */
 	task->output_size = out_dma_len;
 end:
-	return;
+	return ret;
 }
 
 static int fsl_asrc_m2m_comp_open(struct snd_compr_stream *stream)
@@ -525,9 +529,7 @@ static int fsl_asrc_m2m_comp_task_start(struct snd_compr_stream *stream,
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 
-	asrc_m2m_device_run(pair, task);
-
-	return 0;
+	return asrc_m2m_device_run(pair, task);
 }
 
 static int fsl_asrc_m2m_comp_task_stop(struct snd_compr_stream *stream,
-- 
2.34.1

