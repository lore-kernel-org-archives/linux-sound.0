Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517865;
	b=mlWbiOUk1IwjPOtWv5l7f9A8wvWgD9TXJEh3H91rhNUNyeqn3m6ZEP4ozllYQ/KSOLc5
	 78EpZGWft8TvogZyeLBVYq/a/UWPuW3NlaTANDFoWp4uMh5+gU6UJZW6qDBAi6OJRrepV
	 e5SP34op+rR6zW0ODvNNAk1vCGgtZsDIxfsxCwLlSrDN9W3LtT3VMor5bkpQKF46Bua6P
	 K8GR/KlUCTXTpmrKDUc1fkPZH/6XUg4s+fKlx+zetSAF2Pqu23jEsrzl9KNlLP4ITTLHG
	 5pGuu+ui6VPqdEmYGz+fJOl2alvqbVUM583ORUyQnTqr1OXk7SGMrNhocZIMXqZcWGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=;
	b=C1vOe5mJPg+bOk3YfGB7fXIGUAubovwSyZ3bWM176b0aPicOtfiPElcsKZjpJEkdCBHQ
	 H0sp6ksYCfIBQdE8bRc23FWGfJkh0klTJvl+m4CaQr9MLR4CE2CAzcF4AOR+RzO0OLj5h
	 TWTKeBx/jqQBV9GgMv9CJFd82lN4TkclvfD17S6mayUBKyZjgqRme7afMo2NVpkvwkCcS
	 HqkNqpVkhJdOZgrF7YM9vpRoQCioOoo2ygXxJ/Rxq5c0gIJ31vVZ2TPJ6cpEozy0tvsIc
	 G77oOWlUh4xikhmL+nYUytcakCnYu/XrZt6ifTPVQwYIvjMCh9VzSo/o32fHhLy7NSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PADmS5pV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="conDt/ot";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2104A606A6A8
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2104A606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PADmS5pV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=conDt/ot
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuifr601621
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=; b=PADmS5pVGNonpS2P
	6nvISQVNMQBcj5uKQcuj8IHQCQPjoXJrkK2phnCRO2O+blDDAg6hSS46Y/HcP3ES
	Yavi4faARZn31DJXKyTwNmoxj1/g7VtKP/BHvNjVj54wMB6U204oA+44IDfaPykE
	9X7Kl7bppeaDpHGgI+rUNU348A3MrqflFkiyi/dyZ3gLsltoVyychBwo4tUImsVm
	B3GEyw3FIzdqZkaa3PW9yUvc2JjcasA/17r9O3phhWscxozyJ2gCOFK4vCNJhEOy
	PGhflC5oJtsoC9Fw3Fe54Yf6teXbdF3ED9dFepn2lcRDdrUDCRuKvj5zgzc/WXm8
	2seHZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j50ky26uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 10:57:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-946038e22f5so864693685a.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517863; x=1796122663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=;
        b=conDt/otMk5JpAFZw/Wv53qlIwrADH7ZO+4uLHzaTqMHR76ynFSyvIr6pQczQugSR+
         D4aDE2B/8SUo4ITjCMrBHlVWlcAxM0qgYLXUOy/z6r03twh+oH5fATB8nVj+n0HUDhR1
         fO8GF9uadCNNhMWTH7L+QvS4yj6wdbE9pNerIBtMB+Nzo99ynfsfD6Ity7NVaUzGJ2yO
         1eSUSyMT7/0aWwdQXK+zFkJXIBnleXzRJ9/6VGFKx+lsY//5IZahCC6V5DFDTHHA3YBP
         f9Rxg+PJObcqUnnpzwmYYqnMoH6xfQBmCPhj5NmCz7sWMg7TblxYy+/IU4iwGma1Hmnc
         /ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517863; x=1796122663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nloSIy9HSsdxB2tu0WY1d4bUbTGa8qh7KGe6t42jq8E=;
        b=Y90nQbug8ngPxR5rlCgYpMo+YhqRzY20cyJXOFtFh9xgh+gBoY7FQAYqe1kWg4dX2/
         6WuyzX6TE9N/g+lXe3A25R569s1yOXoS5UlEpPqikImYO/gATzHOa8aUyrs+kX2Z0+tf
         bUYCT4peUrbMrYRADiaQlo8TTNld7HMKcOJBa0ATMERECkmN6bVPdTRRFpBxEKaI042e
         ipnwUT8IfdTvatSNftr6c/cKjQ/QubMvM/Jq36xLCAlunCrtfWtvkNjrgnSl20ULL2uz
         VQ3iUgwZbBTyGusk3SIwXSBmsy5LnsiHMQB9DR/kAvoD45YSwGQd6y414UhdT7u6doMy
         S3UQ==
X-Forwarded-Encrypted: i=1; AL+hErEPOM6cW2ABLu2k/cHetFqv41JnE3+WciuH0yy7mqur+mWM8NJKfzoLvlpJPi08xcH4KzV7n9i8uwCCMA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+pV84wQG5GL0z/vGkyXxYAT8rvDxa2wykafHgjW1N47AVsdFcN
	DZpAxbdf8hJWJl/Uh3ksoIaFwnx5up6MHAcpiVXoe+xb325/JVgHGSz+5eHmNUngBUEVjToAgZV
	jkXpH4CIEqhUFh35VJiIDoMQXqIn30EfayZEWTKxRjki0+gWElTYmDz3HR0A9wC83/g==
X-Gm-Gg: AZFdTZeIwuxqDOu7lW9TkiQ60yWXUzAytPQrZKBr1lM8u3ucXFJXCqB7ASC9Nbfq/P1
	NM+hlRxeFTevuTlXbZwA3bcqRuKo2xgCs86PVFgv5FnsHoFArfwUn0VfUBnqC8++Behd9PRGvrR
	BCa/R1Lc69T+LczH+IhAJNQPJyQ1kbkfa9KuEizkOAQ/vy7TQLHklsiVf0SSkiKoK3uo4VhRq0F
	Tzg8UHodS9QqtCVgaCpZwSsq6aEuBs4dftA+9OOmRFqEh76V235RWYqo7ML6oh44mTboMkUasCM
	7iXDqWR/y564KtCMA/Bbv1BPeZ1P+nuSoOTW9+6tNfRT6Ofz1LZzWvbckzK6JFI+JwFxLKomcnS
	LKr5ZtYmtdHVT6p5Hmy6bUCYc4yv5Z1K65w1whKhzMOyRK0GHPhQlrnRR
X-Received: by 2002:a05:620a:6910:b0:93e:d1d0:67f with SMTP id af79cd13be357-949bab34f38mr2526842185a.51.1795517863235;
        Tue, 24 Nov 2026 02:57:43 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:93e:d1d0:67f with SMTP id af79cd13be357-949bab34f38mr2526838985a.51.1795517862677;
        Tue, 24 Nov 2026 02:57:42 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:42 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:57:24 +0200
Subject: [PATCH v4 3/4] ASoC: qcom: common: Add SNDRV channel map to Q6
 slot helper
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-3-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ayAkvqvWWjXrTXzEXpTjRN6OIpuoodqIjuPUhdOs2jk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2et6NyceBZC0SKzQ2lYIgo+wv69cNxtyBl1
 t5CSC/KOqiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtngAKCRAbX0TJAJUV
 VpJxD/9mZsgQfJP4wsxWHq+zCG9GJJHOPxcXFLGE/6pmQLSvOncUz0n1S1azU6NuFHaISSQXN+k
 VOdwd7x3V9LLqrVh9DOwKAUA7Xn7h71mkpvQq5w8fviQgz5GOhpCcjct6lXSRvLybd2RRp8Pmpo
 0xgRkgbMDCQJNTGWdg3qrXO/C8LcN/RHetzQQcYqGIztGrkg0b5aDcHGjjxRS37cR4H8APcDvP+
 Y0LlbAHRCmXMLqzoNNrbjzXrSpXSQRFWdaKDoYTl73xTdSURc1XtPzoBZnyuJ/H90pTUfbknxX5
 moxKhalYsmINilbSTkW7aqHk/fD3ei2lnByc78cvYwcFJHhkL+7H5TZDwsX+bZzek7dvfqD9eHE
 LDw//v2UuXORDpa/xKcDeShUI2wHBmKSvDAgR8AyY5FLBCKpWIrP3MJkDfagm3S+s0WPdQn1eAb
 d5NMTVjGwyYZIiIdKPkciDWDc5li1OP0o6bNgDNjFAF9+S/fxRpkCXsw76lCRIjMh0Sf3Cnd8nE
 Jb2hJ9aqHLJ0/1+AR6QCyARZsIX1D413Qdjxygo+1riUVl+MMeAfXgzeGJuBij2QblcVyUQ75GF
 jhJ5YoRVDNOR1K0UCNwjt2AFZwPgVrz/0top3QCrrzCp54YdjU8rqkVQlwCpRFBKu33fLepTIln
 MMa4jWV+uvXZDyA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Y+ptIReN c=1 sm=1 tr=0 ts=6b056da8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=vP20N_l1vn5n2xwiar8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: boUryKbXnlJ3H2dEnQY4IlQ3Fl0Fl-mf
X-Proofpoint-ORIG-GUID: boUryKbXnlJ3H2dEnQY4IlQ3Fl0Fl-mf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX9TZ02tSzDOTq
 3DwAcL1Kv5MBNt2QDbNJN1E2GFjryrcTCcAz57oOrCtiXbUbu1ODQ++w4zgXwSLZaDz8l5JfjEX
 +JpIObZf5tiEM4Pqu/zP2UxSPM1fI7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXw9b5hy4RRlvb
 yACXoFudFWRbujeGI9eaDTkylixEf8uF3qZ2gEaY7a+snvRZQ/GLgaKXWVW4SQDpueqnmMUVksS
 jZh+5lCwVGEmZ32PuyRakFFHJaHkoPMnlsVhsti9TKYOllaYG9JvlOXPLJGgOBwG46r+rprgfb9
 hsH1sFTuGxdBMqmUku3w9PCnm4njHFGaMYS64QReGZzRYw8RWVnyhaCKxbPjLxvmVdOrpNLheIG
 RCfNa4HBOVPeXScDmyBVjBRsljWSYxh5fsyurXsT54Zw9Z3vDIDgNYDMxivPd8CeRcpYalndfNw
 Ldw7yGnCML9O+HwyYwB/OdTBr1fRdq86INv/nsMgY0blvEACYhzUs8xv7HH3MVxXme8H/+6BnRU
 Z+1m9QOZ5b9Xknje+hAmJhBnmwwiWfgYtyR5n5ZdXAW/n1pJZFoH1rOEHPugqw+jSAo9ZQXEsDu
 ktgozakJjD6Xc+zxC+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add a small helper that converts ALSA channel map positions to the Q6 PCM
channel identifiers used by Qualcomm machine drivers.

The mapping is useful beyond a single machine driver when exposing
writable channel-map controls.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 30 ++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index af5cacddf67d..695350d2812b 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -6,7 +6,9 @@
 #include <linux/module.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
+#include <sound/pcm.h>
 #include "common.h"
+#include "qdsp6/q6dsp-common.h"
 
 #define NAME_SIZE	32
 
@@ -327,6 +329,34 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
+int qcom_snd_chmap_to_q6(unsigned int pos)
+{
+	switch (pos) {
+	case SNDRV_CHMAP_FL:
+		return PCM_CHANNEL_FL;
+	case SNDRV_CHMAP_FR:
+		return PCM_CHANNEL_FR;
+	case SNDRV_CHMAP_MONO:
+	case SNDRV_CHMAP_FC:
+		return PCM_CHANNEL_FC;
+	case SNDRV_CHMAP_LFE:
+		return PCM_CHANNEL_LFE;
+	case SNDRV_CHMAP_RL:
+		return PCM_CHANNEL_LB;
+	case SNDRV_CHMAP_RR:
+		return PCM_CHANNEL_RB;
+	case SNDRV_CHMAP_SL:
+		return PCM_CHANNEL_LS;
+	case SNDRV_CHMAP_SR:
+		return PCM_CHANNEL_RS;
+	case SNDRV_CHMAP_RC:
+		return PCM_CHANNEL_CS;
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(qcom_snd_chmap_to_q6);
+
 static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	/* Headset */
 	{
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 37b185a4968f..2b1d30230d77 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -31,6 +31,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
+int qcom_snd_chmap_to_q6(unsigned int pos);
 
 
 #endif

-- 
2.54.0

