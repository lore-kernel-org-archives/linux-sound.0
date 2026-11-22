Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364098;
	b=XFHe9evxPd+DwBECSD0UUwCzTnR4N3fxXPfdVLhxMKADvebKcOSUSP19Ew4un2IAlFAS
	 NO8gv/5I+NxLtwQ9Uafprgmru7+r1Y/RtmBNQqyBy07tzaSeyvV0LmEPed5e4uoWH0JN0
	 GC1HjjZU7xInyKFPLyo6BPkRp/qFTswNk386nMflsbn4aaHf8MrR5waR/RIevoEO3pCAw
	 OB5bP/uMSXlnZ3mMxtECDF2+v9fnOnrtDco9KFNbEcCJ+G1bYOxtSeSHoJyOqXI0CCuRz
	 D3zg6+J5YgfN7F0vk0FLWYE/MAc3zorzPYU3mtGFKmE1Wf+fmuW8oyedXcznv0Bc0Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
	b=qTG1i+unS1hmT8sknibc/pdfnVh6lg4Hc/q/SV9HWdx3fsJv3/hkVLN2rDY+jYI7tJBV
	 XAhNakXSFv72VKjLDXovdJjRA/SMrVH+l6quppptyTI4kzvZqWVJM80WgQQPVOxZD+QHq
	 Trfwr1tQR37frGKJFVm9KmVhPaUoGJtS0JFmtDqYVTk4Hm6XZOD+Y0cvcHcoeHhjGXE3c
	 CsLc3qyVl6JYWoiOPEvtP/fDhkyWsrkI43uJvd2k/K2PYR3HwpquCkTatg8B2tAdA6JZO
	 6hgSjxRjyEM94vGKtwbX9dr+OpK9NGqvX+mlhZO8sZqkPdqEthapu2BX0V9Var0YGbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1CE60A2600
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1CE60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iIQMXipO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JRppqu18
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQIWZ3382277
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CK8GS13yu76
	IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=; b=iIQMXipOBXcfer219SBFft7VYCe
	+Id8znt7MekKPgySSZ14jJyWkBiB+MSVe3x2b4PRdilfmK0+IgS5NjQeW5WLHWM4
	pw94meLN0i77Ge0G5sD65LM/+PRC5zlPDZjQYpV/ymU8oCEdxkVPvSQ2JTZEZmNe
	6Qih8c4tpER5SUKDFs/Y6aL3PuRxPhhwuto9xMoKSfL4YtHZxTV2mG7r39/bUYQg
	cGsUXumqzR0vZrmPBgOfV/cKQP1Tgv0tofMnc7Fh0yX5TTSSgPtS9OJ8JT/A7GjM
	wNhcJSaiR9xZRL8aeB7DasFiPaZ2uyFgn5PkR0ztVroZzK3so6aN3+Hs/Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upbp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so435121285a.3
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364096; x=1795968896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=JRppqu18YH5PHHQEo+s0GZY99av/5p/zbgiMImgU1LvV2oR+Hqa5+9j4f/37ohGgwf
         4O0WchXPoebdpQBX+6wUBkl191k6O/Jwfp7RvYIk3e7u2fVqaTf94NKru8vrGm0ieawx
         Rz82+Nt4QedWm2GET/zWwZvkfLIxDDRAGQ9WOZyw9jHsz3LzL9EQ2Vmu+8g4YRsE+Dfa
         c+j2hRfuBbkJGQC+rBnpKpUy8DWplEg3bEbkg+AEJdCUIt3N7GL0TW3M7+mlbvBKbN4h
         FHBzC0ciL47GU9IgtXTfygXxkD6gl528ImhZbOvg0nhRIUsvOERzGtbDeLSV54DxFN/K
         bs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364096; x=1795968896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK8GS13yu76IJ52KgrKphmzT9BBMHkucBqW3IFJgEsw=;
        b=dl4Dh4bDHvuuFQMxHn6/pYnZgDgNg2cnCQCIU0zORbDMg64GO730/yxkFr9mixnm5u
         tJZWB/8Q9tfSdEfR7YhSp4C4iuhxHRkIbi8nKbV+Hr5/GyNHNUIliSVH3OcEBpWCCQxZ
         5hYmP65UWRPi78lSMdI5xqP3aOp5j/wt9QNRh60mYDGMPffh44CWddZIBQJK7Ooi+ruF
         tzAwaAPYpkn8R4iwXvFrBipY7VGVypbWN74beQ3ASlaHlOUIhKntJN2qzREC8gIzncBC
         cZPJTztQkSA+xNwT/hhW0DO4p1rzx151Wp8Nff2k13lE7e39qp6U2huPGHt3SBUIHTfu
         M4Jg==
X-Forwarded-Encrypted: i=1; AL+hErHESoexqB31pyMSKxLAdv6SSUD44IEkjayY1FX4+bbe89rMXuNOm69bLVIWt3anwcN+sOYhgQYzNIYOEw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+J5F0KXC7W59CTf64rmw/WuAgc4KfkG0V07tCzQyfWVRVeHoI1
	gV8NO97zkJfEIWJ8tRJ7xDh0NipoMfXWaVtrLfn8CUFjG/2WjM+GGj++ASEi1mN2QzPqkKZSxGt
	SzDhN9ZGCNSKvCzvDngaLbrZJ4U6ljxSbGix3gE0VIqxY39v1H+u8xH++XYE0CPLpfA==
X-Gm-Gg: AZFdTZdycj7w19LbTpXnO22BHlmsJLJpdR+jT0g35rIP+/FU8rHXIwpDNwmtGrI/qNI
	6SkcvMfILGHsmJdGmrTUu+JfxU8fAGdR14tOcKdduwOtj09sRHBYAYsZUhkQvhrV/WAiCZN/MRi
	2BjIhMLkg7EYJftlP/wnFYyxwmfUzn5rLDi9r4qmDwMinF1Bnr/aa3WrGjC/trEtdwcnpfLX8Zp
	lQv0fiB7+12Mfqg2A2qJODu4/3QCuGZlZ3Rd0ITh6ohtKYBMxpqbRntnrtmXtpRq3F3SH2Zg7wC
	wjTjzNRU1KYCsoQykt5HI9qwj8eiyUI83TvVrbtaozTUnkaUUI8URWjDrXBgoiilqnVEu3TPQ8V
	mCyJ1y2IniZUxx9BbyM3nd++WFf930At0eAm4focsAeDAVhDSq+AwZJw5RHmEuY4W
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738823385a.72.1795364095813;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:170c:b0:949:7502:696 with SMTP id af79cd13be357-949bab33006mr1738820485a.72.1795364095325;
        Sun, 22 Nov 2026 08:14:55 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 04/24] ASoC: qcom: sdw: add per-direction stream runtimes for multi_direction links
Date: Sun, 22 Nov 2026 16:14:17 +0000
Message-ID: <20261122161437.5994-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b031500 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NbmS5_GTq9OgXFR-vLoA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX3MQS4yax+Xrn
 gNX2eC5jVRo7vuFvFP02qv+F3k0tOBbozbjzPiaJUu5YulrpzFdDeaxszbMDLCqlrmNpQ78uCxv
 liDUgAQ21W/cwNvDhozKZg2HmNsIcLw=
X-Proofpoint-GUID: GJmUiEspLAnoQk-oU-s91FnO-1YQEp3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX1+696VdDM2bR
 F+gz6XwMKoIbJR7DJqdAhRHIzwPvz7SZKcj9dy+hU35TF8yt4WrWYNUK0qkgpAoQJobA2c6kB9/
 TLwTuakbkz0im2W0CXfknOsAGoxRjmgZX/4qoHXLTv5hBHyBFhaTgJkqeBtrvXAWjVjBzj/s0CH
 rcBQaGYscfHNPF12XF/048TpnokGPjaGjf7ippuL8h6ybKWKCUHRKD76Znm3tKRphTZwb3/iLyv
 vowrJkBwtEih8r5aOBZdPI6ln5XrJGPOqyqPw2d13i9BFqOnjebslzLRMOpDFYI5OpY8Sulr6Nb
 ThBGiA6m20dDc5MdoBsvZlw3fcUSac71teUyTSbUd17nQs97NT3r3/t3bwOnGziXJiqRcwRSDYd
 Pc3Gu4Z8RtEdeLwCF3i8digqGbE0CsB60rfHVNn4DSPROk7b1FEZR4uq2/qEfUbf8WORw0WCIE8
 bq0fZYHc0Ogyovj1qyQ==
X-Proofpoint-ORIG-GUID: GJmUiEspLAnoQk-oU-s91FnO-1YQEp3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

A SoundWire BE link with multi_direction_codecs carries codec DAIs of
both directions, and each direction needs its own sdw_stream_runtime.

Split startup, prepare, hw_free and shutdown into per-direction helpers
and run them for both directions on such links. Stream runtime names
are suffixed with "-Playback" / "-Capture" to keep debug output
unambiguous. A small sdw_find_dir_stream() helper centralises the
"find the stream for this direction" lookup that was previously
open-coded in each callback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sdw.c | 225 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 171 insertions(+), 54 deletions(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 6576b47a4c8c..953a6eaae127 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -5,9 +5,55 @@
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <sound/soc.h>
 #include "sdw.h"
 
+static struct sdw_stream_runtime *
+qcom_snd_sdw_alloc_stream(const char *cpu_name, int dir)
+{
+	const char *suffix = (dir == SNDRV_PCM_STREAM_PLAYBACK) ?
+			     "Playback" : "Capture";
+	struct sdw_stream_runtime *sr;
+	char *name;
+
+	name = kasprintf(GFP_KERNEL, "%s-%s", cpu_name, suffix);
+	if (!name)
+		return NULL;
+
+	sr = sdw_alloc_stream(name, SDW_STREAM_PCM);
+	if (!sr) {
+		kfree(name);
+		return NULL;
+	}
+	return sr;
+}
+
+static void qcom_snd_sdw_release_stream(struct sdw_stream_runtime *sr)
+{
+	if (!sr)
+		return;
+	kfree(sr->name);
+	sdw_release_stream(sr);
+}
+
+static struct sdw_stream_runtime *
+sdw_find_dir_stream(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct snd_soc_dai *codec_dai;
+	struct sdw_stream_runtime *sr;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+		sr = snd_soc_dai_get_stream(codec_dai, dir);
+		if (!IS_ERR(sr) && sr)
+			return sr;
+	}
+	return NULL;
+}
+
 static bool qcom_snd_is_sdw_dai(int id)
 {
 	switch (id) {
@@ -49,43 +95,42 @@ static bool qcom_snd_is_sdw_dai(int id)
 	return false;
 }
 
-/**
- * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
- * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
- *
- * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
- * Soundwire stream runtime to each codec DAI.
- *
- * The shutdown() callback should call sdw_release_stream() on the same
- * sdw_stream_runtime.
- *
- * Return: 0 or errno
+/*
+ * Allocate a stream runtime for one direction and set it on the codec DAIs
+ * of that direction.
  */
-int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
+static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd, int dir)
 {
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
+	const char *cpu_name = snd_soc_rtd_to_cpu(rtd, 0)->name;
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret, i, j;
+	bool used = false;
 
-	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (snd_soc_dai_stream_valid(codec_dai, dir)) {
+			used = true;
+			break;
+		}
+	}
+	if (!used)
 		return 0;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
+	sruntime = qcom_snd_sdw_alloc_stream(cpu_name, dir);
 	if (!sruntime)
 		return -ENOMEM;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
+		if (!snd_soc_dai_stream_valid(codec_dai, dir))
+			continue;
+
+		ret = snd_soc_dai_set_stream(codec_dai, sruntime, dir);
 		if (ret < 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
-			goto err_set_stream;
+			goto err;
 		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
 			continue;
 		}
 
@@ -93,59 +138,106 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 						  &rx_ch_cnt, rx_ch);
 		if (ret != 0 && ret != -ENOTSUPP) {
 			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
-			goto err_set_stream;
-		} else if (ret == -ENOTSUPP) {
-			/* Ignore unsupported */
-			continue;
+			goto err;
 		}
 	}
 
-	switch (cpu_dai->id) {
+	switch (snd_soc_rtd_to_cpu(rtd, 0)->id) {
 	case RX_CODEC_DMA_RX_0:
 	case TX_CODEC_DMA_TX_3:
 		if (tx_ch_cnt || rx_ch_cnt) {
 			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				if (!snd_soc_dai_stream_valid(codec_dai, dir))
+					continue;
 				ret = snd_soc_dai_set_channel_map(codec_dai,
 								  tx_ch_cnt, tx_ch,
 								  rx_ch_cnt, rx_ch);
 				if (ret != 0 && ret != -ENOTSUPP)
-					goto err_set_stream;
+					goto err;
 			}
 		}
 	}
 
 	return 0;
-
-err_set_stream:
-	sdw_release_stream(sruntime);
-
+err:
+	qcom_snd_sdw_release_stream(sruntime);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 bool *stream_prepared)
+/**
+ * qcom_snd_sdw_startup() - Helper to start Soundwire stream for SoC audio card
+ * @substream: The PCM substream from audio, as passed to snd_soc_ops->startup()
+ *
+ * Helper for the SoC audio card (snd_soc_ops->startup()) to allocate and set
+ * Soundwire stream runtime to each codec DAI.
+ *
+ * The shutdown() callback should call sdw_release_stream() on the same
+ * sdw_stream_runtime.
+ *
+ * Return: 0 or errno
+ */
+int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
 	int ret;
 
-
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (!sruntime)
-		return 0;
+	ret = qcom_snd_sdw_setup_dir(rtd, substream->stream);
+	if (ret)
+		return ret;
 
-	if (*stream_prepared)
+	/* Also set up the stream of the other direction on such links */
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_setup_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			qcom_snd_sdw_release_stream(
+				sdw_find_dir_stream(rtd, substream->stream));
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_startup);
+
+/* Prepare+enable the SDW stream for one direction. */
+static int qcom_snd_sdw_prepare_dir(struct snd_soc_pcm_runtime *rtd, int dir)
+{
+	struct sdw_stream_runtime *sruntime;
+	int ret;
+
+	sruntime = sdw_find_dir_stream(rtd, dir);
+	if (!sruntime)
 		return 0;
 
 	ret = sdw_prepare_stream(sruntime);
 	if (ret)
 		return ret;
 
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	return 0;
+}
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
+		return 0;
+
+	if (*stream_prepared)
+		return 0;
+
 	/**
 	 * NOTE: there is a strict hw requirement about the ordering of port
 	 * enables and actual WSA881x PA enable. PA enable should only happen
@@ -153,15 +245,25 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 	 * accumulated resulting in Click/Pop Noise
 	 * PA enable/mute are handled as part of codec DAPM and digital mute.
 	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
+	ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream);
+	if (ret)
 		return ret;
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		ret = qcom_snd_sdw_prepare_dir(rtd, substream->stream ^ 1);
+		if (ret) {
+			struct sdw_stream_runtime *sr =
+				sdw_find_dir_stream(rtd, substream->stream);
+			if (sr) {
+				sdw_disable_stream(sr);
+				sdw_deprepare_stream(sr);
+			}
+			return ret;
+		}
 	}
-	*stream_prepared  = true;
 
-	return ret;
+	*stream_prepared = true;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
@@ -187,9 +289,13 @@ EXPORT_SYMBOL_GPL(qcom_snd_sdw_get_stream);
 
 void qcom_snd_sdw_shutdown(struct snd_pcm_substream *substream)
 {
-	struct sdw_stream_runtime *sruntime = qcom_snd_sdw_get_stream(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+
+	qcom_snd_sdw_release_stream(sdw_find_dir_stream(rtd, substream->stream));
 
-	sdw_release_stream(sruntime);
+	if (rtd->dai_link->multi_direction_codecs)
+		qcom_snd_sdw_release_stream(
+			sdw_find_dir_stream(rtd, substream->stream ^ 1));
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_shutdown);
 
@@ -197,18 +303,29 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream, bool *stream_prepa
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-	struct sdw_stream_runtime *sruntime;
+	struct sdw_stream_runtime *sr;
 
 	if (!qcom_snd_is_sdw_dai(cpu_dai->id))
 		return 0;
 
-	sruntime = qcom_snd_sdw_get_stream(substream);
-	if (sruntime && *stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
+	if (!*stream_prepared)
+		return 0;
+
+	sr = sdw_find_dir_stream(rtd, substream->stream);
+	if (sr) {
+		sdw_disable_stream(sr);
+		sdw_deprepare_stream(sr);
+	}
+
+	if (rtd->dai_link->multi_direction_codecs) {
+		sr = sdw_find_dir_stream(rtd, substream->stream ^ 1);
+		if (sr) {
+			sdw_disable_stream(sr);
+			sdw_deprepare_stream(sr);
+		}
 	}
 
+	*stream_prepared = false;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-- 
2.53.0

