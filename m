Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598B82E8E05
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039503; cv=none; b=H+KEZLug4+1qd2z3wCV8U+jqWVbVIEviKK8+L/quVJeifJZmTT1drxDQmfQ9N/xrOCDt22qq6tDVfz0jXAJLgCN3hdPJxin647kIrxPyIFqR4T/9jJcGFyW2BLZ3N8xbI/nDwJhILASxETuINUelKP5SlMkIjPs2P5wQkqD3LoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039503; c=relaxed/simple;
	bh=VszKiwE03t1FNDyd3+/PG4rNfxJCf7hH5fFaj1c3B+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oy5rR5PndhzI9bla8BwcNXxIsKFSOyceWlBuYzAB5g1f8Z0jsUvKKuGLHkwQXSS+H0jGkudqyQ5KLxdrMIxRu5rwgTTAfv6duOKE3tuvwamd6KF3k1Pt9reCp4qG7t7/kl5PL9ifIMhLzSnD4zXVeLtuMwB3aMurGPJVeL2qdCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of4iI84/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of4iI84/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBxmOf001166
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mxfmtrvq+gi
	LYyamC8Jt+iTgA2yVNVmMcYpWvKggyC0=; b=Of4iI84/gzV90+ks43um52HnGk9
	ZFqFw4iI54qVqlQhGWmPZc7bWzwXek8tLS5hPpssQnPsRDikmKMqHNdiMPQejx1s
	+Wbbl0WnF2oHptagJffCAdehOzN2RhVsfFdRCZxFinLb9w5m7YDM5JjrMFB4FYpH
	ZQ1izbsATDD0mnqYZWsIQtFWH+OYfDNets+BBlRSuKgdIGL1yUJe/0hDx1gDzKCk
	8a5Szf6h/3wg8hyjRMAxcu9dQERn4tcDU2oOZDRcNeDt3c42bBqJCHwB99wTv1C9
	7zTN1RFJ9+qixDBsvdILW/4xLtWJhEqC7PfdW0m6V44+aETg6RNnmO7Cw3g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdhcjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 15:51:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c955be751aso354381685a.2
        for <linux-sound@vger.kernel.org>; Fri, 27 Jun 2025 08:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751039500; x=1751644300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mxfmtrvq+giLYyamC8Jt+iTgA2yVNVmMcYpWvKggyC0=;
        b=OVCOKyD4xo26gh3etS/uHvsgI2VOFyG+8yLP/T6H9VfMy1KTKeLbdiX9TcmqpuaZZl
         8rN7GO2luCh1sCaoMP0+2l7j/1NDlhtWEw3rzu3v9bsQ0RMlMoFbapYr7ODjxWXpM6b5
         /Kw9sZIb+Kq1DBKbYIfGh9dz48Vn2+4QX+FElmXCU//qvFtPJoJphBT/k3sFZa0BIJr0
         xQEIgKvNAm9yNXpnUI0wTlxSMfGu/9KJH/9t4IzFSFO/YJ6DoJsAwS8kVlkA7k5Pm4wd
         zWFHhTXSuz1F9e/ospDLpu2iAucDL2tzrQvkRGPlyHLaES0/sYwfi///ZWjK9MXu9zPV
         S/bw==
X-Forwarded-Encrypted: i=1; AJvYcCX8VzSJVPlWSOpwK5GRym9omQrfN3Oseqsgxesu+uiMY+M+Kn8Be/41H32AjXYueYZpFIT3Q08/q4YoPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6ygEa43o5e0oSYzZIWUvm17j/YUnXE2B+5sgEeRtSBoYsdco
	n9hwDxm56EQtPHgbRFFpPSiP6ZJFrDNb1FVLWEne7imRqDMLrpRlp/IfKhPnO/sArPUfcqqFGr8
	gqIO1DzvxjUkLRoS4gb9V7U3RfWmC1OPp6lU7eLn6DsiyT8cD26Ea2/xXL12OYm3PJQ==
X-Gm-Gg: ASbGnctFO0xtZXHmXrN8oZ290nzAk9evkYdBaEuk85PhcXDCZ9q064nTw4lf8vMUjR+
	sjszyGD2NHQQDG+i1Grj3aEFqZw9eLvTXGWr5toVtcyk3X1DAKqLNJo6jR5PtMlk9o4nsMZr34v
	BHzuj3I+AUV4kq0ddqk00cvHIjcMPWZP7VqBTVVbXd1XviMJihek9KvrH2jryDFZPneEO+ltR76
	1VkDf4l8Z9wFrWIyO6w7hp+EPCTay/9OzmiViAfVc17bPDwpTNcsiJ/2MFYlYfTK2HUIY0tb8oV
	MQS/7XYcZjM4tr4bhuiRirDUvMM2phOFzhSTbCE0ow+DvmhnfOd7UYs=
X-Received: by 2002:a05:620a:4547:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d44385e947mr497081885a.0.1751039500186;
        Fri, 27 Jun 2025 08:51:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+PxZlXtSSHqqv60AqWQfGMamHBF1e3cuJ6Z+/HPHmbzZbS06rUYAe0pTdNDgxbScKp+W+FQ==
X-Received: by 2002:a05:620a:4547:b0:7cd:45ed:c4a5 with SMTP id af79cd13be357-7d44385e947mr497078485a.0.1751039499757;
        Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8absm3082663f8f.95.2025.06.27.08.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 08:51:39 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: vkoul@kernel.org, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: codecs: wcdxxxx: use sdw_slave_get_current_bank helper
Date: Fri, 27 Jun 2025 16:51:03 +0100
Message-ID: <20250627155103.441547-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685ebe0d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WmG1VI7HpiTX60UEcG8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyOSBTYWx0ZWRfX4MZR4Ba6HhmD
 7Q6mTAHLJP3BPKKoAAEDdJl5dnvpkcb/SO0sXdt4Ama8Hlx/R1r4CmgwUWT2qRFNiMtZ+ZVQcGZ
 a80C9Y0xz4wdBDDGolCqWhQ2jGnPVR/cxMTLzugIwzPEJhMna4X2+hj0YK7x4d1FwXFAkBE6LKI
 irj9SV5rOyrL5xX0N/EPig9GDeQSpnWGGZycn53b/cFSEA6IkNCd4qovmWtjyrZojH6hKfKsOuK
 70e7KJ4nLeQkPwhIM5/agKsUwISr0AQIP5I5cZsycmjeHdzGIbeahJkNnh/gUR5iDaOES7bXLE/
 m90fdnAMg6cM/0WHCMETS0Ugt+zjk9i6NnJto3EG9KM+vQ1m7/k8GpIf9YmWunRZO7dX4rbwwer
 +lWU2IAf6G3Inye8If+vhD31fkvtizVvg1bkgwPoYPVSGyseiWMeoHcqcG680ite66ymeG1O
X-Proofpoint-GUID: Z1YAqFb1jYLxKrkvD834VY3aniVecRV0
X-Proofpoint-ORIG-GUID: Z1YAqFb1jYLxKrkvD834VY3aniVecRV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270129

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

use sdw_slave_get_current_bank() helper function, rather than duplicating
this function in every codec driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/wcd938x-sdw.c | 10 ----------
 sound/soc/codecs/wcd938x.c     |  3 +--
 sound/soc/codecs/wcd938x.h     |  7 -------
 sound/soc/codecs/wcd939x-sdw.c |  7 -------
 sound/soc/codecs/wcd939x.c     |  2 +-
 sound/soc/codecs/wcd939x.h     |  7 -------
 6 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index b4a0b66b34df..9e411d906354 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -82,16 +82,6 @@ static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
 	}
 };
 
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	int bank;
-
-	bank  = sdw_read(sdev, SDW_SCP_CTRL);
-
-	return ((bank & 0x40) ? 1 : 0);
-}
-EXPORT_SYMBOL_GPL(wcd938x_swr_get_current_bank);
-
 int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 7c345217298d..7e1e99b22cb8 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1097,8 +1097,7 @@ static int wcd938x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = (wcd938x_swr_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev)) ? 0 : 1;
-	bank = bank ? 0 : 1;
+	bank = sdw_slave_get_current_bank(wcd938x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
index dbafcae247f4..54ee56b7fbd6 100644
--- a/sound/soc/codecs/wcd938x.h
+++ b/sound/soc/codecs/wcd938x.h
@@ -669,9 +669,6 @@ int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
-
-int wcd938x_swr_get_current_bank(struct sdw_slave *sdev);
-
 #else
 
 static inline int wcd938x_sdw_free(struct wcd938x_sdw_priv *wcd,
@@ -696,9 +693,5 @@ static inline int wcd938x_sdw_hw_params(struct wcd938x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline int wcd938x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
 #endif /* CONFIG_SND_SOC_WCD938X_SDW */
 #endif /* __WCD938X_H__ */
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index e487a1bb0194..477d6cf27d32 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -128,13 +128,6 @@ static struct sdw_dpn_prop wcd939x_tx_dpn_prop[WCD939X_MAX_TX_SWR_PORTS] = {
 	}
 };
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return FIELD_GET(SDW_SCP_STAT_CURR_BANK,
-			 sdw_read(sdev, SDW_SCP_CTRL));
-}
-EXPORT_SYMBOL_GPL(wcd939x_swr_get_current_bank);
-
 int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 0727af4789cb..f59bda0ad089 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -1014,7 +1014,7 @@ static int wcd939x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 	int bank;
 	int rate;
 
-	bank = wcd939x_swr_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
+	bank = sdw_slave_get_current_bank(wcd939x->sdw_priv[AIF1_CAP]->sdev);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
diff --git a/sound/soc/codecs/wcd939x.h b/sound/soc/codecs/wcd939x.h
index 3f189e5cafd5..e70445b1a4bc 100644
--- a/sound/soc/codecs/wcd939x.h
+++ b/sound/soc/codecs/wcd939x.h
@@ -930,8 +930,6 @@ int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 			  struct snd_pcm_hw_params *params,
 			  struct snd_soc_dai *dai);
 
-unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev);
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd);
 #else
 
@@ -957,11 +955,6 @@ static inline int wcd939x_sdw_hw_params(struct wcd939x_sdw_priv *wcd,
 	return -EOPNOTSUPP;
 }
 
-static inline unsigned int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
-{
-	return 0;
-}
-
 struct regmap *wcd939x_swr_get_regmap(struct wcd939x_sdw_priv *wcd)
 {
 	return PTR_ERR(-EINVAL);
-- 
2.49.0

