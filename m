Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794712869;
	b=yY1qzHnWAS2glrtzC4lPxs7SSNvvkWaTePeKQzBcu69f5ErIfIJNDE5njV6Fx//klR6G
	 ev84UCuhT7kHakpQDhskJHlj0b7ZWj8Y8bnfzaSmYb18RjsLuhCv5kW5Ll9p2TyCibL6t
	 CSBUPsHPXp86QHNOba1wvXhA/PHxZSBk8Zg+k2vzetrLWgJatbXdAb9rYbe6GVt58ooZz
	 2hH/HYpWMa1GWGMcmWiZairRQQwvf6AL8cuS8YCAXzCBDk5hXoKCS8bNJmMGZ/Ut36rbi
	 cfwsdR/6q2mLbOqhw2za+D/b2kin+MNIrJCzLqeh2zwdUm7oZl7dSfmifgoEc3YUAng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794712869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H5kWqzjUD1p2g4p7hVbHajMTBJEnOY5nkEG9XXptiQ4=;
	b=0OeOa6ZB2GGAqc1zuLjo6F3kkmBPGJRJADywiih831l1j+3U9QvWNLxMdk/p/cyufcvj
	 IeBmmCvdlq3jDPoSGM5V80/ndInvMxZJWGU2LO2mDBxGjDzlf6Rql4r2Kmb27FBLOharT
	 YrVk8DYvLamTVjtMLcjBvPl5gVKpYXln9Z0T5kQnCh9NidBH37EPm3szsSDdkublH2k+1
	 2C48nXZr3lb75tgbp2qgYRmCAGtml9Gb0kDB8S6n8RPmG8oqy10HuDK/+UJNvGMigGnc1
	 WQ2B21TiZY4Y5U9We+7jNJniNMOWBHaRz7Rvp73/Dia/hxGRx7nRLfpUwOsuRKjLHpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UggFAQf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MIOHT5Kz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1F606A337
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F1F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UggFAQf9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MIOHT5Kz
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF0x2eS2929408
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H5kWqzjUD1p
	2g4p7hVbHajMTBJEnOY5nkEG9XXptiQ4=; b=UggFAQf9VQHdyU+pwxbcMfiahFU
	pNA/DbTldxqF7YLr7Qu2iUxBULYTu/mP1rnQdnP9vCy49iXSHReA/OMnEcwRGPjW
	AbQtS85FSc8YXacwnMRYVXcMesd2vpq+VNrLmEIOH89/XwtUt0RSG7vFsexFbDqF
	7bMwK3r4LxJsD7NBORJLE4SNaQBBT7/eI/D5GEaIIpLqLLsM15viw7Lhyo7TRkqv
	7nJDY0V23E0JecHF4ark2ZtkdHVYWLqZGliKxzR3A+GMQaO8FJVAz42jmsbFkegS
	TTPFrAgrlSB4egj6AAKVjLt8s+CwWt7YfHrfZ3C+lRoBflOb3lgMdiTE8Tw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8t3v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 03:21:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37158b53d06so1886183eec.1
        for <linux-sound@vger.kernel.org>; Sat, 14 Nov 2026 19:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794712866; x=1795317666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5kWqzjUD1p2g4p7hVbHajMTBJEnOY5nkEG9XXptiQ4=;
        b=MIOHT5KzyXvLRCUHJNIh4r6wRAdbD3cM/WA7wWynyUHznMuaHG7+6MyA+MgRT15hbZ
         sA058eLoc4su08IGt7DUuX8ScNtpJjOea7mM1UJfFceJIIEzHcS2QFE/rdjeTgsSnY6p
         5dpS12JBqi19HpbYd1+hsJr3YN7Wjpw7RVqYNQhmOmRiMKLzz6Gr/UsDH2yeFCye04L2
         okGMQlei+ig9uBvydn+MXRoW50CZFVU23/yMRCkWAw+/Xtx0good6zUVVau7VpmpxuVI
         M35Tm2i+kwb7qgbxOJXvxAlrff8NO9iooV6XgJ116CWrOw3hgbv1Gv3w05h9gbTf/Viz
         yjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794712866; x=1795317666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5kWqzjUD1p2g4p7hVbHajMTBJEnOY5nkEG9XXptiQ4=;
        b=zdjd4gfBgkHkH2zo7qM3FdkZnfaBcArzunOoQ91LO0ttI4s7YgEc47eMX6hlsi2atE
         mj+PYBA/JHMvmwAMNuvmYJdsuhFicq8t0qLpQpO7pMnNUzDY2uAOqTjVQC8aA5p4bPf2
         zYJYj4BjheM2kz/im5E6m4CAtiAuybJOK3MttDl1u3VLXA6ffYgO/ntnuQLnTTkNnyjd
         gYEIFAZl64JYsFziXujblFYJFFhxrY3SuI3YIJ5mB69pA9yDFJBVGy83XLHabof2f11d
         cZ0khQxCayhT8NA8AADHvydP8tt7omiyqbtyQXhHEir6KoCat1P2NGjYrHboEcEyc2Kq
         6nzQ==
X-Forwarded-Encrypted: i=1; AL+hErGgPjpEJyaLnQA2UCOqa1iUvXOESBS0DyZnwmIG4C4xOEtEhFxYUqSD00sfmFYMwgzwYKl+7RlBE6SSuw==@vger.kernel.org
X-Gm-Message-State: APuU4Z85L8e2UANN757wjPvC1q1f7h4EeFmZYu7fwayxEZ7Q9TEoVVWt
	/p5s0dNMkG5AvxaFcUX72O9d7RquRir8CvUCH5SANNdyb+lI46UJvQOowqbc6p0Fq+l0rKLJz3l
	JmXVjIU9Sc9khQHStP+DRyUSVnNrsGacFEkXX5YAf1RSisZoPSlE8J82UcgGfJM2a4w==
X-Gm-Gg: AYBFou3y9M+oqCwTX1ORUHW09qhohI4Zos0cwLeP2Ub+/0kiVvR5OoNHh4Ug8K1DDS9
	vN49JL+vZqbHXy6bhyV7tfEWUMXKdqoOps3uqj9KAYb/VTmlGbJ+vHWbS+mBBdDwX1aHo6K89w1
	EUiedwZoZrzjm3Oq9bL4j6MyIfM4ZHHtN2bW3Ka1ejYNDXBwzzCBWmyd80l3TeuLYbnvOsWuz2D
	51GUk48XsMfClIVr8bWf+hNwIdYDBLV6U9n9mVhJkjjR9korrR7q+2sfWKejFGHOigLPBS2dllP
	hvN+YKvUTTKDVEeARaoX6MNBX30M5FBEEEPUtLhNQb9kjFJCi9RRWo1RwJMc/61v8KYULaJgb7c
	6zHCejH5e7UBFS1c2Sr2uQr7TJKvtvTEAOvHGGaBsnMxLO9nFP5G8NJh728uqTTPeyzO/2+Lo/s
	1UqN0mF8aDyC1CRRdqb8RGj65P8FwqLpO5
X-Received: by 2002:a05:701b:4544:10b0:1ab:9742:e860 with SMTP id a92af1059eb24-1b4f5f67318mr8963970c88.20.1794712866396;
        Sat, 14 Nov 2026 19:21:06 -0800 (PST)
X-Received: by 2002:a05:701b:4544:10b0:1ab:9742:e860 with SMTP id a92af1059eb24-1b4f5f67318mr8963948c88.20.1794712865835;
        Sat, 14 Nov 2026 19:21:05 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm21300791c88.14.2026.11.14.19.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 19:21:05 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] ASoC: qcom: q6dsp-lpass-clocks: Restore clocks after a DSP restart
Date: Sun, 15 Nov 2026 11:20:26 +0800
Message-ID: <20261115032027.414953-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
References: <20261115032027.414953-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af92523 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZRQYKWXtZuY-NXeCwRUA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfXx7lbada5xrjW
 8rFP7pmMqJcNlML9BNT+LLaPYoPfyVqEIfkgoAbd6bIzVCY5lGehs+bGW0WsasTCpFvRSHEWJTk
 zIJ5dxOLGktLcWaBVIuCddQ9MSnmqBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAxMyBTYWx0ZWRfX04Aqvl5/QLvH
 lsiqFpGzBpkqfhjaAT8AYDnhRwX5sEs4OT+jDKOQ5ODVCizLs1D8jbBrHcnsT4UakSjIk87jOcj
 0794pgK8z223N90TQ9Vi9jiH3HzO8JRGgOwB8Dwo11cST1Y+HEcixeZrZC9G6PcqzN9wyF+D8tl
 hu8z/kdcvuBGDpbfaZ955J1fcnYIXyv4FmNW1ehokTbakLXxG3jQPKNrzCGcimazGz3C3QGrLrk
 mBKJHurYaK5tGcdVK/bIMd4JDx0voMCE67b5n3/F2AyzAEhUqfhsyYRmW/c+/Bvi2ObdzKNDBx6
 KB+l17TQaL7rzrafV5dtvabcLYIWpSbsCc122VfkpLUbjl+vguAxzGJk29R3UtB08axyeXJvvEj
 /aZwz0dWVzc2zN/U0vwcnDAjpQRhQJ7z8YuwetbQpRnGg+LQ6Afme8wemZeyuyMcb8kyQSRZo7P
 hQ4xwIR9WZ1a/NiIzUQ==
X-Proofpoint-ORIG-GUID: Z1kAh48ktcO9K-MRtmD2n30nGAIRNnXf
X-Proofpoint-GUID: Z1kAh48ktcO9K-MRtmD2n30nGAIRNnXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611150013

The DSP forgets all clock requests and votes when it stops. A consumer
that still holds a clock prepared across a DSP restart then holds a
clock that the DSP no longer provides, and its later unprepare releases
a request the DSP never saw.

Track which clocks are prepared, and add q6dsp_clock_dsp_down() and
q6dsp_clock_dsp_up() for the DSP service driver to call when the DSP
goes away and comes back. dsp_down() marks the prepared clocks as lost.
dsp_up() requests them again at their current rate, or votes for them
again. Unpreparing a lost clock skips the release, since the DSP holds
nothing for it.

Fold the prepare/unprepare ops of rate and vote clocks into one pair,
so both kinds share the request/release helpers used by the restore
path. A mutex serializes prepare/unprepare against dsp_down/up.

This patch does not change behaviour on its own: no driver calls the
new functions yet.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c | 147 ++++++++++++++++++----
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h |   2 +
 2 files changed, 123 insertions(+), 26 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index 94d96130245e..22d3f3c6d46f 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/platform_device.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/slab.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
@@ -22,6 +23,10 @@ struct q6dsp_clk {
 	int attributes;
 	int rate;
 	uint32_t handle;
+	bool vote;
+	bool prepared;
+	/* Still prepared, but dropped by the DSP when it stopped */
+	bool lost;
 	struct clk_hw hw;
 };
 
@@ -29,17 +34,45 @@ struct q6dsp_clk {
 
 struct q6dsp_cc {
 	struct device *dev;
+	/* Serializes clock requests against DSP down/up */
+	struct mutex lock;
 	struct q6dsp_clk *clks[Q6DSP_MAX_CLK_ID];
 	const struct q6dsp_clk_desc *desc;
 };
 
+static int q6dsp_clk_request(struct q6dsp_cc *cc, struct q6dsp_clk *clk)
+{
+	if (clk->vote)
+		return cc->desc->lpass_vote_clk(clk->dev, clk->q6dsp_clk_id,
+						clk_hw_get_name(&clk->hw),
+						&clk->handle);
+
+	return cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
+				       Q6DSP_LPASS_CLK_ROOT_DEFAULT, clk->rate);
+}
+
+static void q6dsp_clk_release(struct q6dsp_cc *cc, struct q6dsp_clk *clk)
+{
+	if (clk->vote)
+		cc->desc->lpass_unvote_clk(clk->dev, clk->q6dsp_clk_id, clk->handle);
+	else
+		cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
+					Q6DSP_LPASS_CLK_ROOT_DEFAULT, 0);
+}
+
 static int clk_q6dsp_prepare(struct clk_hw *hw)
 {
 	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
 	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
+	int ret;
 
-	return cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
-				     Q6DSP_LPASS_CLK_ROOT_DEFAULT, clk->rate);
+	guard(mutex)(&cc->lock);
+
+	ret = q6dsp_clk_request(cc, clk);
+	if (!ret)
+		clk->prepared = true;
+
+	return ret;
 }
 
 static void clk_q6dsp_unprepare(struct clk_hw *hw)
@@ -47,8 +80,14 @@ static void clk_q6dsp_unprepare(struct clk_hw *hw)
 	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
 	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
 
-	cc->desc->lpass_set_clk(clk->dev, clk->q6dsp_clk_id, clk->attributes,
-			      Q6DSP_LPASS_CLK_ROOT_DEFAULT, 0);
+	guard(mutex)(&cc->lock);
+
+	/* A lost clock is not held by the DSP, so there is nothing to release */
+	if (!clk->lost)
+		q6dsp_clk_release(cc, clk);
+
+	clk->prepared = false;
+	clk->lost = false;
 }
 
 static int clk_q6dsp_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -83,26 +122,9 @@ static const struct clk_ops clk_q6dsp_ops = {
 	.recalc_rate	= clk_q6dsp_recalc_rate,
 };
 
-static int clk_vote_q6dsp_block(struct clk_hw *hw)
-{
-	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
-	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
-
-	return cc->desc->lpass_vote_clk(clk->dev, clk->q6dsp_clk_id,
-				  clk_hw_get_name(&clk->hw), &clk->handle);
-}
-
-static void clk_unvote_q6dsp_block(struct clk_hw *hw)
-{
-	struct q6dsp_clk *clk = to_q6dsp_clk(hw);
-	struct q6dsp_cc *cc = dev_get_drvdata(clk->dev);
-
-	cc->desc->lpass_unvote_clk(clk->dev, clk->q6dsp_clk_id, clk->handle);
-}
-
 static const struct clk_ops clk_vote_q6dsp_ops = {
-	.prepare	= clk_vote_q6dsp_block,
-	.unprepare	= clk_unvote_q6dsp_block,
+	.prepare	= clk_q6dsp_prepare,
+	.unprepare	= clk_q6dsp_unprepare,
 };
 
 
@@ -146,6 +168,10 @@ int q6dsp_clock_dev_probe(struct platform_device *pdev)
 	cc->dev = dev;
 	q6dsp_clks = desc->clks;
 
+	ret = devm_mutex_init(dev, &cc->lock);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < desc->num_clks; i++) {
 		unsigned int id = q6dsp_clks[i].clk_id;
 		struct clk_init_data init = {
@@ -160,12 +186,13 @@ int q6dsp_clock_dev_probe(struct platform_device *pdev)
 		clk->dev = dev;
 		clk->q6dsp_clk_id = q6dsp_clks[i].q6dsp_clk_id;
 		clk->rate = q6dsp_clks[i].rate;
+		clk->vote = !clk->rate;
 		clk->hw.init = &init;
 
-		if (clk->rate)
-			init.ops = &clk_q6dsp_ops;
-		else
+		if (clk->vote)
 			init.ops = &clk_vote_q6dsp_ops;
+		else
+			init.ops = &clk_q6dsp_ops;
 
 		cc->clks[id] = clk;
 
@@ -183,3 +210,71 @@ int q6dsp_clock_dev_probe(struct platform_device *pdev)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(q6dsp_clock_dev_probe);
+
+/**
+ * q6dsp_clock_dsp_down() - Mark the clocks dropped by a stopped DSP
+ * @dev: clock controller device
+ *
+ * The DSP forgets all clock requests when it stops. Remember the clocks that
+ * consumers still hold prepared, so q6dsp_clock_dsp_up() can request them
+ * again once the DSP is back.
+ */
+void q6dsp_clock_dsp_down(struct device *dev)
+{
+	struct q6dsp_cc *cc;
+	int i;
+
+	guard(device)(dev);
+
+	cc = dev_get_drvdata(dev);
+	if (!cc)
+		return;
+
+	guard(mutex)(&cc->lock);
+
+	for (i = 0; i < Q6DSP_MAX_CLK_ID; i++) {
+		struct q6dsp_clk *clk = cc->clks[i];
+
+		if (clk && clk->prepared)
+			clk->lost = true;
+	}
+}
+EXPORT_SYMBOL_GPL(q6dsp_clock_dsp_down);
+
+/**
+ * q6dsp_clock_dsp_up() - Restore the clocks dropped by a stopped DSP
+ * @dev: clock controller device
+ *
+ * Request again, at their current rate, the clocks that were still prepared
+ * when the DSP stopped.
+ */
+void q6dsp_clock_dsp_up(struct device *dev)
+{
+	struct q6dsp_cc *cc;
+	int i, ret;
+
+	guard(device)(dev);
+
+	cc = dev_get_drvdata(dev);
+	if (!cc)
+		return;
+
+	guard(mutex)(&cc->lock);
+
+	for (i = 0; i < Q6DSP_MAX_CLK_ID; i++) {
+		struct q6dsp_clk *clk = cc->clks[i];
+
+		if (!clk || !clk->lost)
+			continue;
+
+		ret = q6dsp_clk_request(cc, clk);
+		if (ret) {
+			dev_err(dev, "Failed to restore %s: %d\n",
+				clk_hw_get_name(&clk->hw), ret);
+			continue;
+		}
+
+		clk->lost = false;
+	}
+}
+EXPORT_SYMBOL_GPL(q6dsp_clock_dsp_up);
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
index 3770d81f2bd6..e4655a0b77c6 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.h
@@ -26,5 +26,7 @@ struct q6dsp_clk_desc {
 };
 
 int q6dsp_clock_dev_probe(struct platform_device *pdev);
+void q6dsp_clock_dsp_down(struct device *dev);
+void q6dsp_clock_dsp_up(struct device *dev);
 
 #endif  /* __Q6DSP_AUDIO_CLOCKS_H__ */
-- 
2.43.0

