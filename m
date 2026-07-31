Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37404657C0
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785515204; cv=none; b=q+oBwwONlOc9P24zvJe5OoQb7LVyOfsDH6/7lLgvAASnVLR4OcVpoWfo+kqpj0+ZUuTMvmUtRd0R0XHDI6J41P+rJ9h6spfpUjFKXKait7TplOQLm/b9uRgj8elYV+vGttNF+5MVIrsbTeAi1E7rfew4DqzL+y+XMGJW58/WavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785515204; c=relaxed/simple;
	bh=g4mCtkQKfSnP9v0/IAMpPjWNvIEkTyugT0raETCPgOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/gFe7FHqySy+/JF1z1PO/qUQgs7gzmabezfoDXIsF+gAMfxWy8GwAMIaJcN3tt0qd/6M/Z0NMnyGG005TQeFb7Wve6398yiamZmuA5UYc7xME4sSTWw2sK/tPx9/AV92BTfBbYLYJ5NqP+5jnpT6smfpFC8I7GCc+AhHS5L9Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbcGgBPW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzRfODRe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbcGgBPW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzRfODRe"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOcY7403962
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RlnVv0Va6Mv
	enaztwTb7R2WJJt5+xjQMMjx/dE8Lz44=; b=bbcGgBPWJ42t34W+eKcSWjNY1o7
	5WlYqYoPdDIqV4CWY+EzGjE42vyIBFLmVo46vky6Ka9Liqs/gvfV3pERqAwj+qDa
	fuxPTlfoNaxyZtzhmUf+Z9anx+EhTZ+mYUpAxD1JpJmr8GxGjPEk6GOepxajeAGN
	KfAXb0SY2RKUZ3wqfs8nvmE/Jti+1+AjJz3u+2/kYfg9H+3enwv39bOFQSr4ZAEc
	nSOY4/w0KjbejWs6MVi4kEOsVloHqIBt7DVDUU9S5riLIQdJ1DtDXSP4Yk0I76M7
	cwaHp5ahwkrVAQj8GSLCb3uI4I3fh0nwUWnn66DJnXdbZBtd9YNpBPSMFdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frufkh46d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 16:26:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso10936271cf.2
        for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785515200; x=1786120000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlnVv0Va6MvenaztwTb7R2WJJt5+xjQMMjx/dE8Lz44=;
        b=KzRfODReSIfdu75SZ4Z3mUSdtIYSrSzC6K9RlZae1xaxYpzGWFHSCDHP6JMpUsdApg
         rVqWV82dLPxXY5EZBqFsb4MyqdBBVus1qm9kN8j2PCS1NyyhoeMU+ZNidVSK6wYN/OBi
         eSb7lZwTF+94dUwQNY8f89luF3bNdr9QZnhn7wIhV4d6YrgHP0EBNrwKrS1MWzlaarHT
         npX6bFqf/dyqjn6rfJQWWE05v39cLjo7bldlBrp+AtHtE10dBJ7A+IkvkkQRJk5GXMi4
         V7daxnSjJGjUjrRbYZzuBs1ce8aoFikSYcD2qORPQvkxYDF3SIGsz2Qvh/paKUHdZg1K
         4IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515200; x=1786120000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RlnVv0Va6MvenaztwTb7R2WJJt5+xjQMMjx/dE8Lz44=;
        b=HJ0R5OFDXB1snFKOjRqHflJpSuPBm+0h5DQQc84Do46i+tGIiNhSbq6093TZIjiw8J
         3qPFHImG/wjXAYaDFXssO5xQNskSt2bwqAw5ZjLyMdNba8RDiYaYbl0mc3DtVxfXrnUo
         SXND5tYMDf5qXhZHFSq/eAjTPytMPrAMo4cThMVxLhxseB3tki4gqFdoCICmYuGReo3W
         6aD7SVB3QtmfT3F3uZPZB5gbUTFHJ8lgtk3EV9cFk5liUKnBa1D1BrA40QOIf4ATMPpj
         8KQSpc2am2Hx6wZLj68svvJOTH6QESY5cfIpPIQz8OIQz+d7hW5TyJ0H6+nDhp424cXI
         P1QQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPMubVs6p/jayOtwC5Ma0Ywb621q1fK97gCFZ8GLfgiB+66Znh7bA949GiDpSYTK8bcE+HRhPebnTEmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ0T75iXALiD51kxvI14lCqZoaV0+4ktQkZxEl/UKxWGqqBYNd
	Onr/NEwvMVesAe90IxxsnlpsOiwAlSsJsGFkoSs4iVNfKFUYah8u/VJpSQouF+xcbLQCT0Wqjqp
	uhDFSWaMxMWdK2h4oqTLQsSa9cKx1FyROQ7lwG+pUt1QOHZOvildYFE0mRhgLzpJ3Bg==
X-Gm-Gg: AR+sD12Ln74FDbBZ9mZBXCLXE3KA5fiimb+rvPPh/8A1kz+hsaDuJlGZYQJfC70NUXw
	o/ukTMPHKWNpON9RqbLNUxEj8nVZMIAXgfEfSuHM83kmTRhr4BiFqJU+/b+JObFqyKQhRTu3PRO
	9KYY6aycJCoHILO8Vw5b/6bUwObg6kfgSPcsfk9WQRPIjwbnSDm9KkG7jAzBxrV9WFjgxTVFlX9
	tJFswq8UDsHg4ZwtNTopr0fk9nXNf5p5/N4Do0qwGDkUnCgdXgUvNcHy2z1Y2thxJUNztclqj3l
	nCDbw4FRDhc5HCD5Rlwy6DVQI2wl5I26NJFCgwt9SrSPnugRKIQ3y4ApU3dm1fj6z3kFVpGyZwP
	IE6DZSuruJOXSyg==
X-Received: by 2002:a05:622a:250e:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b56795b87mr18817791cf.33.1785515199479;
        Fri, 31 Jul 2026 09:26:39 -0700 (PDT)
X-Received: by 2002:a05:622a:250e:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b56795b87mr18815121cf.33.1785515197820;
        Fri, 31 Jul 2026 09:26:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm7084050f8f.7.2026.07.31.09.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:26:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongyang.zhao@thundersoft.com, neil.armstrong@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: qcom: sc8280xp: rename snd_soc_common to qcom_snd_soc_common
Date: Fri, 31 Jul 2026 17:26:25 +0100
Message-ID: <20260731162626.1588561-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260731162626.1588561-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfX6WnTH9dUL1nX
 kfCfb9SDtJLWepQGFdVUMu+2LS18dFXDBcIdAz5ASDl1hC93jH095vKe0zvw/DAUcwCAd43SCOY
 g/gWYNLWS0jwfhAjytWlfqECzXjtDZg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEyNSBTYWx0ZWRfXzVI8AIf17ZM+
 LdQY78AsCvpF9P+PqsT9GbS4D6PlItBpgJka5KP2ULn0rpm85qqjhAz1Bh8s5U2CxrsizVSU2Rc
 9rlbu5Ps4xx1d0Dj12jmQV9tY0EF1lHIkeJ2suJfnkVZfnT2RgSadVplzA+XmNB9A4wW7VbXumv
 xWkyY0NAie/Es7WAQ2yXt24d6lDNi98Smlf+ye6zLFH91fnvYKuHQxx1dBJgSHFzaNAUXbS98RO
 YioL0SyjEs5H2Dysketl/+hhQv5dtKMYoiFKmt+Ei4ZHpsAu3rL9MtsJGb5l3RIfkl9y2od2I1r
 mk1q1jbQUQUHTIUY4ocB4UwK6mm5Vj218YGDU6BFtNZhyWDzVGitUHklg62tcLwMd/xys8OjhG+
 Wi7+Dfj7WiWZ9lvSPZK4uaH4vi0naQy9xqu4GFDEOaFEMfhWo1eYXgYYqEfU1NmiDImAHT2ISKx
 rH69mbHxGXOG4EZ3Xmg==
X-Proofpoint-GUID: mjy9SXX2vwGbDPtpQ68RyHHCKhVrcKVr
X-Authority-Analysis: v=2.4 cv=BpOtB4X5 c=1 sm=1 tr=0 ts=6a6cccc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=a_TC-L_1r3bpA-kJg4EA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mjy9SXX2vwGbDPtpQ68RyHHCKhVrcKVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310125

The driver-local structure was named 'snd_soc_common', which occupies
the generic snd_soc_ ASoC namespace even though it is specific to the
Qualcomm sc8280xp machine driver.

Rename the type to qcom_snd_soc_common so the identifier is properly
scoped to this driver, and rename the pointer field in
sc8280xp_snd_data from 'snd_soc_common_priv' to 'priv' so the shorter
name doesn't repeat the type name at every use.

No functional change.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 60 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ce2b0633688c..d938eeda64bf 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -37,7 +37,7 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
-struct snd_soc_common {
+struct qcom_snd_soc_common {
 	const char *driver_name;
 	const struct snd_soc_dapm_widget *dapm_widgets;
 	int num_dapm_widgets;
@@ -57,7 +57,7 @@ struct sc8280xp_snd_data {
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack dp_jack[8];
-	const struct snd_soc_common *snd_soc_common_priv;
+	const struct qcom_snd_soc_common *priv;
 	bool jack_setup;
 };
 
@@ -121,7 +121,7 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	if (dp_jack)
 		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
-	if (data->snd_soc_common_priv->wcd_jack)
+	if (data->priv->wcd_jack)
 		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 
 	return 0;
@@ -175,14 +175,14 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 		if (ret && ret != -ENOTSUPP)
 			return ret;
 
-		if (data->snd_soc_common_priv->codec_dai_fmt) {
+		if (data->priv->codec_dai_fmt) {
 			ret = snd_soc_dai_set_fmt(codec_dai,
-						  data->snd_soc_common_priv->codec_dai_fmt);
+						  data->priv->codec_dai_fmt);
 			if (ret && ret != -ENOTSUPP)
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->mi2s_mclk_enable) {
+		if (data->priv->mi2s_mclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_MCLK, mclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -190,7 +190,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->mi2s_bclk_enable) {
+		if (data->priv->mi2s_bclk_enable) {
 			ret = snd_soc_dai_set_sysclk(cpu_dai,
 						     LPAIF_MI2S_BCLK, bclk_freq,
 						     SND_SOC_CLOCK_OUT);
@@ -198,7 +198,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 
-		if (data->snd_soc_common_priv->codec_sysclk_set) {
+		if (data->priv->codec_sysclk_set) {
 			ret = snd_soc_dai_set_sysclk(codec_dai,
 						     0, mclk_freq,
 						     SND_SOC_CLOCK_IN);
@@ -269,38 +269,38 @@ static int sc8280xp_platform_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->snd_soc_common_priv = of_device_get_match_data(dev);
-	if (!data->snd_soc_common_priv)
+	data->priv = of_device_get_match_data(dev);
+	if (!data->priv)
 		return -ENODEV;
 
 	card->owner = THIS_MODULE;
 	card->dev = dev;
 	dev_set_drvdata(dev, card);
 	snd_soc_card_set_drvdata(card, data);
-	card->dapm_widgets = data->snd_soc_common_priv->dapm_widgets;
-	card->num_dapm_widgets = data->snd_soc_common_priv->num_dapm_widgets;
-	card->dapm_routes = data->snd_soc_common_priv->dapm_routes;
-	card->num_dapm_routes = data->snd_soc_common_priv->num_dapm_routes;
-	card->controls = data->snd_soc_common_priv->controls;
-	card->num_controls = data->snd_soc_common_priv->num_controls;
+	card->dapm_widgets = data->priv->dapm_widgets;
+	card->num_dapm_widgets = data->priv->num_dapm_widgets;
+	card->dapm_routes = data->priv->dapm_routes;
+	card->num_dapm_routes = data->priv->num_dapm_routes;
+	card->controls = data->priv->controls;
+	card->num_controls = data->priv->num_controls;
 
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	card->driver_name = data->snd_soc_common_priv->driver_name;
+	card->driver_name = data->priv->driver_name;
 	sc8280xp_add_be_ops(card);
 	return devm_snd_soc_register_card(dev, card);
 }
 
-static const struct snd_soc_common eliza_priv_data = {
+static const struct qcom_snd_soc_common eliza_priv_data = {
 	.driver_name = "eliza",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common hawi_priv_data = {
+static const struct qcom_snd_soc_common hawi_priv_data = {
 	.driver_name = "hawi",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
@@ -309,74 +309,74 @@ static const struct snd_soc_common hawi_priv_data = {
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common kaanapali_priv_data = {
+static const struct qcom_snd_soc_common kaanapali_priv_data = {
 	.driver_name = "kaanapali",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common qcs9100_priv_data = {
+static const struct qcom_snd_soc_common qcs9100_priv_data = {
 	.driver_name = "sa8775p",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
-static const struct snd_soc_common qcs615_priv_data = {
+static const struct qcom_snd_soc_common qcs615_priv_data = {
 	.driver_name = "qcs615",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
-static const struct snd_soc_common qcm6490_priv_data = {
+static const struct qcom_snd_soc_common qcm6490_priv_data = {
 	.driver_name = "qcm6490",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common qcs6490_priv_data = {
+static const struct qcom_snd_soc_common qcs6490_priv_data = {
 	.driver_name = "qcs6490",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common qcs8275_priv_data = {
+static const struct qcom_snd_soc_common qcs8275_priv_data = {
 	.driver_name = "qcs8300",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 };
 
-static const struct snd_soc_common sc8280xp_priv_data = {
+static const struct qcom_snd_soc_common sc8280xp_priv_data = {
 	.driver_name = "sc8280xp",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8450_priv_data = {
+static const struct qcom_snd_soc_common sm8450_priv_data = {
 	.driver_name = "sm8450",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8550_priv_data = {
+static const struct qcom_snd_soc_common sm8550_priv_data = {
 	.driver_name = "sm8550",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8650_priv_data = {
+static const struct qcom_snd_soc_common sm8650_priv_data = {
 	.driver_name = "sm8650",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
 };
 
-static const struct snd_soc_common sm8750_priv_data = {
+static const struct qcom_snd_soc_common sm8750_priv_data = {
 	.driver_name = "sm8750",
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
-- 
2.53.0

