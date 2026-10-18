Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E109A4D4874
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351460; cv=none; b=nJYhcCgN02yTR9oNB5zpJwOK/jnMx7tBKRbBcv+dsDO4bAO5J+OSLUbZ0HqbcbV32kvJE+VAVZCjNf5Ku6pXEKWAX/eYUy6YSeBezu4LsieKqErn3kF6A481qjvYIsGDYWn1GABYTfZH4OE9gVmUCLlcg/O1PLaq0xgi/F4GUi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351460; c=relaxed/simple;
	bh=QO0CjOwBHYKx8E+8rkyRBQaXbVvc8fThw1blsg6jZmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUzjk3OHK1yjAtUWq4FQvVVSHRSxWbW4sAQy62HZpCDWFx1E+kwQFGL8E4VNCFERGZotl/UPH+LEts4ua1nseysLmMSkpP0RwyTVDOG//U6wo47j4iPbhScbX3S3bVYQa77Si5jLvtJFgFsA6Smsz7znbVMROeq5NPEriqkhSJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hx63f9Ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTXac+MI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hx63f9Ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTXac+MI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IIU38L4111648
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PDrpiMxYTLe
	+XHOeuIts06W74d116omNFJBZk5qILSw=; b=hx63f9Ax11zgeUNE+F8TwpEFeOV
	/Jot3AVT4AQB4UfPaMRu/G2IgnHLoDIDo//TTXQIUgdhsxvmt/8kiJPQ4eX+MOlq
	gXtRfP1zSjmBmJCv0fNQv5T1U0v9SgrOQbncB7DMpI2rN/xDR9bD3kaADQJOfWln
	WydwaLzmJU8lq0nT62lipbMumeerDZ+E/OCAzT19KeaZ7qeschXc24nNlUKWmQP2
	F2wAq9PPV6UV7X0+4fLUYBHeaIO5feaKyig868DH2U8Jp3lPnG5HJFQAlMLr/IZY
	lajRdYmECdD/5OVhUD6DOX8WvoquTiDUIL6tgTtAib3vWcUKgKPDoAHQJ3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se3p2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939c30aa9a0so155351385a.0
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 12:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351457; x=1792956257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDrpiMxYTLe+XHOeuIts06W74d116omNFJBZk5qILSw=;
        b=OTXac+MIzT1AUiv5OksxdafSQUzrXm6uDGHZ12iHpMvecBXW2BwPaPBJvpBTn4pfJ4
         mKabMJKjtBph0RF0CjI4g63HJNtT8a4rKjoRz+l562n6/8lQvyXxb3IcZ6ewZa9byBm8
         J/C0bLN6v4zR2qGmGdaCu6H3QB+NQsrYNh9cTDQmfB+uMAvllMqqgI7ttO4kMAtNeZcC
         w/HeSEIiteH3JmEXlLuHJDETx6Z9/SHSLitlmG81uMrermyzX+SOO+n87yuJJqevHuuS
         jwL6ewZiqjwhKPEjKYjk56M41nd83LhQGcd5brNpEeTK/IA8c5YpXCWlqLrvQAotCSZv
         Ayvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351457; x=1792956257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PDrpiMxYTLe+XHOeuIts06W74d116omNFJBZk5qILSw=;
        b=th+SDNurDUmQWMJn+ydFVKcv3sw++v80FtQxElr7k01Np0cQwaXUioRd6czRyLJQsn
         cAFL5SyI5+Evp5VtzLV2MtFQfz/M05f+DMcildnb5QtFZlreuwsDnlDhkqi+qaGJ2v5X
         y55Q92qlDSvPp+uUHy2ZVWv/4nM/WC7v3yTZTcGIvgAxLvD/HcIDCZh263dB61bCpzZ6
         sjUT8Pi0OPg/2UptWmqorX/3srRy1XHD37vpEGuHOI4cuuCGF4XBQjFPtmDNqsbRgsl5
         lZfM+38Z2cZ3zjuBwuw2zoOsn4kRVMogM8qxp/QMyQLZDZdJi6RlMmyH9kIK/TIGBKgk
         E3ag==
X-Forwarded-Encrypted: i=1; AKwUvBzxFGEbHDCiAro6qOp6B9GTAZjqerQjmmnSQkozX8qsmBFb20QdVLSRp1usm3A1sAlRjzPFBRZMZzLKTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLey/D6nFhfrkBiWZn+nPSq4MY25nfA6Kv72J7X4W5ygdRVJ9Fq
	9Fn/sVA6UG9nY5rt6sVaos28pfv0XoQd2rI0UUKQsvmPVIw9DCjme9YtR5Zm10bGEtZ4TEtSdcU
	eEmwUFdigMKRcgEL7np2bgRYkkHG6KRZSMIvNAn5WyPxLn26DczmT7lEx1mOc89ua3g==
X-Gm-Gg: AYBFou3XQHP0j04ZjXq3CI5TlsJN/8S8Ihc4tNXbbDFYIKqbhYkzrEneLQAmhHsrk+5
	K7igw14ixz8OEeu2F16baOzK2Wk56kBw0ARVoVLAZ7EBSLcz1zrhkILaCkMELsVVwAYe3hyOTAZ
	bi7GOaL6f82KGE2x0cUTv/2jsF6EBosoGJs57IZub3sxqvYpeEaAmz3yEu5XpqoIn9EGojS3Prw
	6m5sglS3VIuC6pgUtc6hW004BJdqdUzHsUZdlsHKdPfAZpZU1B6IPMq0Niv81XFXSiVaHXnasub
	35b1u2KpVJ+yDahBQ7vxSnMnYLzZAh41pnmA91t3he90gHLZOtJgQVuQGs2aHTiNZiRuUH12OkM
	ZZoT1nfdxFlwP
X-Received: by 2002:a05:620a:172c:b0:93f:1e3c:4a30 with SMTP id af79cd13be357-93f29d12e8bmr1050469385a.35.1792351456936;
        Sun, 18 Oct 2026 12:24:16 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:93f:1e3c:4a30 with SMTP id af79cd13be357-93f29d12e8bmr1050466685a.35.1792351456459;
        Sun, 18 Oct 2026 12:24:16 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM data-port terminals
Date: Sun, 18 Oct 2026 20:23:59 +0100
Message-ID: <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nX-ZKbsdF4ymuQww7o2yQ6hL45S8BTeX
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad51ce2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=px4HCA8uLphOQo2j6gEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: nX-ZKbsdF4ymuQww7o2yQ6hL45S8BTeX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfXzIf6/TbrMAIh
 gMFZ8Cwv+/NU52shiOaPeYNLxRMR5YIuVl+l65IkfrORhaexC213ppcRksFZMKX1ZsblGc2vnR6
 fdImfwejhRkaoGw51zCaVLLgGZU2zxU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX1UXcHfs6NtR2
 35sIl87eRouPZCawpdOD/V06tkGhzhzp+09DcpxQBWLKTLYk2aYAUur7JhDhKeOEP8WfZbmn4cR
 jxlCgjUobuElJHB0gBxrF7YetZU+qZKyeutdnW/N+/r7zODtTtfYpd37Of9EBx85UEgdQFnvXoM
 87MFeew164l9mV+HMvDGFMit1ccbqACK/gwiX2wPrHlvW3Ao6q6wXE6TCnPPXo4oxLGclVvkVBr
 Y0X9VCfY7zmrnMTBln15GLc3eAgoH5xy/EtbWVfy3cjNVo4n5h9j6g0yqfMNlT+Ox2gBCDYmBPj
 6x0u2iZQH7sE1As4ka6vJUHmwuMvvDq9UKSJJL/aHgxAuqVYpqQgTKhNksX7TOVPIFMx6OPfN8x
 klPfWQwl1CQt9eyE7XP8NQVvaQ/k3s+9tr2Gz3QcfU4ADGkQG3/NYiF5bEZyQkJq5xx6QK70xjd
 QAXUyxODkGRQhY6vgPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180077

snd_sdw_params_to_config() derives sconfig.bps from the PCM container
width, which is not meaningful on PDM data-port terminals and clashes
with masters that declare their own view of the wire word length (e.g.
the Qualcomm SoundWire master hardcodes sconfig.bps = 1 for PDM).

Clear sconfig.bps when the DAI's SDCA terminal is PDM so compute_params()
or the slave silicon drives the per-port wire word length.

Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index 13b70f0f0dbf..acaadd12432a 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -126,6 +126,17 @@ static int class_function_startup(struct snd_pcm_substream *substream,
 					 substream, dai);
 }
 
+static bool class_function_terminal_is_pdm(enum sdca_terminal_type t)
+{
+	switch (t) {
+	case SDCA_TERM_TYPE_RAW_PDM_MIC:
+	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
 					     struct snd_pcm_hw_params *params,
 					     struct snd_soc_dai *dai)
@@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
 	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
 	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
 	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
+	struct sdca_entity *entity = &drv->function->entities[dai->id];
 	struct sdw_stream_config sconfig = {0};
 	struct sdw_port_config pconfig = {0};
 	int ret;
@@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
 
 	pconfig.num = ret;
 
+	if (class_function_terminal_is_pdm(entity->iot.type))
+		sconfig.bps = 0;
+
 	ret = sdw_stream_add_slave(sdw, &sconfig, &pconfig, 1, sdw_stream);
 	if (ret) {
 		dev_err(drv->dev, "failed to add sdw stream: %d\n", ret);
-- 
2.53.0

