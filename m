Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1AB41D11A
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792351455; cv=none; b=aw7mw55WiYFItkejq4uKP1pYBCGr+9GLrX3R4sFnNPAnxjaVQirQa80l6nxzUnaumNvhUk4LVeUp0jZkJ95h0hI0iQR9mIUNHwgfHxiRboU/Ov7604PfRl72V2kuqokk6Up2RNDUtKmSCdy6MsOhN26SV8AE25hLXmhBFmFGoKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792351455; c=relaxed/simple;
	bh=A9JqsJ3JdFHwwfzZdup2DtWNIV6CuNIAr8OH+g8ihCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0bV7/cmIuawIJnliunIDEcsLWgcrQSs7BUkzLp/QjkL/121FX6izygyshW5R1tQWNPRPTVmpsdeUCuqNvl9mGr36MSfI8pmovYp28v/KqSDCfzpdWi+8HjSOekbAls1fKDtbjcRJAOjeOM8AUvq8RFIYjGBNOTpsdJNZBv1ejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HSMCN6IP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQSeAFP2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HSMCN6IP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQSeAFP2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IIURrv1010778
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ehLEox3TtWa
	JJUfnw2m5PWlJR0h5h+JMt2AHDszIvVo=; b=HSMCN6IP+Uw0NnoRCipt/QRKMiI
	wRJkEi2qjKDJEVxMOatE9OWpFc5UzVfKUmgp5tXEMNzNexVZaMKFPvYRjMkoN3c6
	l0UfwvqEn77bSYDoSLw/17gUFZPGRMX+GYRSYoFWJh4XGONJ7wuXTht4CdPgeQd9
	Sx0wrrlpljLISFZQBPFjczX1zg+DSGxtFf3EODlwxJj6KVSwknUmaXcqc21QrBo7
	nq7CbiSckitxMcr374Da0D2+WvjKORGEhL8j0mjo1J9qvIzH/BZE9FDQE5f4n7uc
	xEJYvJ4REUk+RXQ4poAqU9a5U0WUuUosdbAIAM6DnMFaqrtHDoT/wsLgY6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxktug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 19:24:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so267101585a.3
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792351453; x=1792956253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehLEox3TtWaJJUfnw2m5PWlJR0h5h+JMt2AHDszIvVo=;
        b=ZQSeAFP2Xh6l2h1nFP5t85NQza6txeq8aaV+Q8QvG3kHXCHWIyFMqosvvUhIVw/Rqa
         eUsJwNCz4LqF4vQvH4V13r/qcKP78OaR9b5tJtUWvkBcmurroIwICAnjZ9qI2+ANYxoM
         nPPnBh4EkMD4AAMqFSGDdAhGbry5mfz96+7gac3U6mmKGdkipNCyfzE9yf2MFi0NGxRA
         X+HM8/l0LEiaEGyyaX2Qb2BvoKGAmii4axUYBTd5y2Pc/axHt29KUb27gNmd5tAVbFGH
         6MLKYzisnglEfLm3b5UmTndTAjiUx8ieDxMKTRDHEHyp3U+gX85h0zOBUnKWDWTK4MwB
         S/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792351453; x=1792956253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehLEox3TtWaJJUfnw2m5PWlJR0h5h+JMt2AHDszIvVo=;
        b=s8aPw/VASlsBXnHL7l3rBLfb9kUxPnjFKWUgPcHr/pmaXql3XxHP3R89uvwGjtg93p
         aVrGnn9FS9PQJy55qkXFrCEfyimTThNHPoM7mAQsgcWQQjmmND54950b01A1e4xLmbmO
         CSSNgmV4O43e9ZoHZpHttZhuI3eP+zVVdSMwBlamFPAW05bk2vNPhHZQjg6I5DuBVYiO
         2Y16i26/z4cRUzf4eh9Ke6Y1+Ms0fEOd6AB0odhyNI3zPtrR+MxHOVm6zsg7B8lOZdDT
         EyCPwNFU0NhHUjrBj0G4oSUQZ7sjnCISWaS8MbYutpTKyXN3rC8RN0rDb0XrYEPdvrqW
         tJvQ==
X-Forwarded-Encrypted: i=1; AKwUvByWR081oBgO2lZvp06TLxaR/bUNQu35/K2vPT13FwMO/xswBK3CnpEetzsQ3fpKMqodQdDLDD1ejTIvyA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIs4/vhz8Qg7HdUxhYNOALmpEEPMtDLoAgzePpGV4tJnKebU1/9
	Jcpun5mOmZUVKT0t4KvgHbY1K4pf3HYKiUXc9kTz+BV7pi1RDUfB2PzwAWVIijgYq8xxuc17Xmi
	j45d9t0A88AkuGxzoNCs03mZE7GFYDI7evfYb2JLEjXfj70SsNhF9UyhYryMQZE15gTk0bW1FmQ
	==
X-Gm-Gg: AYBFou1U+0q9RtCPsrbbo5tQgawc+EdDQE1xmET7EMNqtgJCCoRqK8oAfhbwXzLodQL
	I7WMHFsgyUT2una62BVACKBHXnXf8/j4Y/RS9pj2VvSQ9YVftPtJY/vx3dkWMwEhj4JX5ab74Gt
	TNWgEbgRyK31cVgBGPtQaeJFgYNL+l7Fvx27XAMKJFFYxvfOHtUQyr5mcFKjETuefkdwjzYCSDi
	+/sO+kv681KMzFHivN+9PRwSbPCfHeO1DeW9HXIC/jYmMOrFnkys4/VQl/IycVliL9zjHqpJOxx
	o37pFpFiVRIE2luVUbIBf/JV9aq9fO4sPVWu40KSKImB+DptockR0UH/02BFTysVl0F6CIZXEPz
	dSe+2pnMdh7lC
X-Received: by 2002:a05:620a:8909:b0:93e:e376:9b1d with SMTP id af79cd13be357-93f29b8062emr883945885a.9.1792351452799;
        Sun, 18 Oct 2026 12:24:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8909:b0:93e:e376:9b1d with SMTP id af79cd13be357-93f29b8062emr883943285a.9.1792351452277;
        Sun, 18 Oct 2026 12:24:12 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce33ad3fsm184417105e9.5.2026.10.18.12.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 12:24:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH 1/4] ASoC: SDCA: propagate sdw_slave_read_prop() failure in class_read_prop
Date: Sun, 18 Oct 2026 20:23:56 +0100
Message-ID: <20261018192359.287987-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfXyIBlG7ypMQ4w
 uX5AgvnClLY58vNl2U3drK7zd4saHeHr/1VB13pzty6SacM9cAHTbOzERY+i9N70bXhslYJZEim
 KkOWWIT3mMXIqpDHwWNG60uArb5MjkA=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad51cdd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6IGIi60M6HWO0oJrOSAA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA3NyBTYWx0ZWRfX17I3ehM2H0BI
 ggCkQmGY38tABbFiYeMV9XFNxBn4axKuQ4zfPORU/Rst+96I/zOmxjXZ9E9xlVRJ5plB3bd01ha
 DMJZfAciHCvT0eb6LaSZ3oMyt9U1fmak0lDbx+F0fUssP+LP+Ea2FZsanfADaCui4jvZUdj3J+I
 Al/UwEvYe14Bl04iwdg+8PBlyJiubVA/mN1rdvJ596v9FK1Tpko7NBbJ0LITMn4juesW5uRvbT6
 YIcMyC2JlT3ZauCYzCHBCH0sv4UX1s5aoRfRS4QpqX8AEsp9b7jJTWNOws2S4rYPCrKXLgCu+sR
 q9Yd3U64gjJpzkNg9YpxyDLptfCnvP/YR2zvQVl4w8Cv7fhBn2BE86HuFhwuuTdvD+p5XXdtLhL
 L8bKr8DZL9xa24QfYdbOo7b8cFKfd5QOIfavc800gT2WqQsXYDpUe4+xXbDjVt8apOQi4XKOdk2
 zOVD1LvfRrdELNANFBw==
X-Proofpoint-ORIG-GUID: aXmZWtzTzbY0SibpSR3sLHiwyYJ3eNPW
X-Proofpoint-GUID: aXmZWtzTzbY0SibpSR3sLHiwyYJ3eNPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180077

sdw_slave_read_prop() can fail with -ENOMEM; propagate the return
instead of leaving slave->prop partially initialised.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index 79fdb672be1d..bcc660aeb739 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -27,8 +27,11 @@
 static int class_read_prop(struct sdw_slave *sdw)
 {
 	struct sdw_slave_prop *prop = &sdw->prop;
+	int ret;
 
-	sdw_slave_read_prop(sdw);
+	ret = sdw_slave_read_prop(sdw);
+	if (ret)
+		return ret;
 
 	prop->use_domain_irq = true;
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY |
-- 
2.53.0

