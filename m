Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74433B95E
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870082; cv=none; b=SCN9VI7gvmNntooo75Tcxor5F9CZ9vJF7KRfGq/l5yGoN4ALt0i/jfhoVbtYpSpf4EfqS5Z4/chTfkDqtFQoIuib7KA1aXOXPfcIIYkqsTnIbEBZ2H0cmdBz/iGIAyXiESqezDqpt7XjqUo01cXxu5vzbU8sRWIPkAAMAGS1YlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870082; c=relaxed/simple;
	bh=z0nBWK5+F2wsJrQIhtl6TV5njKOz8lu+80qf9G2Sim0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dp7zmkHqSfrCDWp0Uk30Yog51fBZ85F2z3Zo8yk6yNTMmEKmXQ0p7amn5Z1Y5Ko6hHb00VnBpYHY6JI0LAdHYK9plYe8DXBoP89TgAJv/xe9IxEa7cZrYTFMTMIuT9NSbwBYkMB2uhpH3mBCmKwszmAVPLx1DBqnV5c3r6fvv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8r2I+7K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNU4R34I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8r2I+7K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNU4R34I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGFNHd3936279
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vJxFLg7wg9k
	swXDRQsScAbUneSzeSw/ohZQ+0IC4ocg=; b=H8r2I+7KV8h3oqSJmnLDpVD5DrB
	TJAJH1j9/fPIoXssIrJ7o8VgeLWj5xTEq4mugrSm8EvoZgZ9DK8gpjFF+C3aJfCc
	p4KBiRrQmTADUN/TTtixKoLRU5nL1Xxz8OENvGrfTe9qkx8GKAPPvlzh1GkG5fUC
	EzW68UON0TZ4AfPm5VxTp7881nOW+R4Py310JLdoW/G3bI005QNpmmO8APk5ZaJN
	BXbXiMZgz1p4pwvBXpgu6V3kqbBKV73QKCOSoe+BLTzlcu/qImKRvr03uf9IdWjy
	0DPKS8zrKQlzuorSIYCuxuKyXcj9QOGPhr4imCSebQlUCico9gBCf4NX/uw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mgchf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so4855770385a.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870079; x=1772474879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJxFLg7wg9kswXDRQsScAbUneSzeSw/ohZQ+0IC4ocg=;
        b=gNU4R34IkcLXbdc5o9GztyjYW24HM3lcc8HC2O+wIHO2sF3Bi0/yNTaTX6PBwxKEpb
         t8O/zpJhX6Ekggb0QQ2r2nPpESaVy5IRUksaAMJQGqcGMwfLiGs0eOgvX9hzI52ITAa9
         QafDfO5fRyBK+mi5vBVUHyfQFYMcaM/m5pVqod2hmpjqPIVJ7rQWw4BmkftsiCPY6NW4
         vQis1O0cNpirHcZITg62FavG68CI8flx3CAECtQLjZw1lJJwHK8qmMwx8OAwCO98MKbF
         Z7G08THef+9HwPHiptNU2kYAhyuH0cPmf7y/tFuUE0ShSyykFHms02d/b1Y7UszWsDYJ
         USXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870079; x=1772474879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vJxFLg7wg9kswXDRQsScAbUneSzeSw/ohZQ+0IC4ocg=;
        b=lNleqab+SzAkn/7larD+5bDLUK9PjZkQDChi9A5usefhwFHuwuqUolUnWvgaE+mBXq
         qoIng0wkZyVB3DaM/3a7Y1HDwdFKl6XwfcpFSoPpIWS6efzkKfQXg9FGnptJTxhy7API
         QAgcL2bXfhXLnjmVyfz0+2RVwkqdI9IWCFi9NBF5yIfgHuQtkpoQGKaVqCQmUcPQZEZ5
         sCLyLkMzYMf6AvElzC0E04ZadPTQts8i1tuY63qSW5umsGHbiXlr/RRZBGwmKUMpjlnE
         /d4eDQoz63DTq3QNkZKuhOD49k9dV+8uXOpjnLGP4/4MacHRisOwaoy74z8YsgYFKSAE
         P/oA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Z8LXX3cKV4qeDPYIe7u0w3uQSCNvyAmqD3jiBeFYPJm6C4ijJAlVTCHoSfJNrE9zEBW0KHzx2qUORQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySB0oq4GQmQ471Tvfa8nbITjyf/6mWqDn4BaIt+NgMBH4lXeAz
	RpwCMup7X41xMoR4aI8xmXhp8NRPbVdy0iSmn55JPyUMIojj7ZG3oV3V6MoB1WYdVkhEtpCFzDO
	WrvihXkTSL/w0IEQ7wo2NwE3FsbfNXL6UigDOJwex5yp+Y92af2iqLXWXuPCQkxajJg==
X-Gm-Gg: AZuq6aK0/wjm8Tk9WfW4NDja72etVYrEogrIVahMBnIINdqoyjf3ADYUPj3MHxUCqQH
	SVg9w23mhB90hItZegXUZn0b00wxqMTrw11guhS41UWogZbxEUdgw+uaVw79vkqijWkqZeKBmmV
	6fZVLnKToczKgUuGI1AQsG8nvDeEhrILmnhJsEaj8MK7YYXcw/k5bmQLtDb4RktT8pA5myP35sX
	FI/YJhv1azsuHRHtT8j0E8YnnQY6fs8QuTS3zWrAFNh1a7xpaODF8rwVNynK6ryKsxmJhACU99g
	bgNtA499P5XvfoDYnlUNXLM5ersd6FxVyfRTfOku4RosXdo2uLSF1uB2N9M84rnkEM4AAq1qJQZ
	1s17nbMP4rS8hJV4u3P6KAX6THliHDvUlZlcGMhE4euwuO9twdf0+Tbc=
X-Received: by 2002:a05:620a:408c:b0:8cb:5176:f00 with SMTP id af79cd13be357-8cb8ca6731emr1093333085a.45.1771870079256;
        Mon, 23 Feb 2026 10:07:59 -0800 (PST)
X-Received: by 2002:a05:620a:408c:b0:8cb:5176:f00 with SMTP id af79cd13be357-8cb8ca6731emr1093327785a.45.1771870078795;
        Mon, 23 Feb 2026 10:07:58 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:58 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 03/14] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Mon, 23 Feb 2026 18:07:29 +0000
Message-ID: <20260223180740.444311-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699c977f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 6zn42YBdEhfnZwl7CAVjcQ7swDPn-BzR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX61V2jhGr93pd
 a++7ecKdcRFQc3XmP1d/skTF1g26QFS8M/7KWP4lGO2Swf1ZKskP0CDfNT6LMDVtx0o0bsBEGCM
 G+8kVXS6OXZ7XpCorD8Pr5wYr9KbZOLEFNTKDS356pSQSEqjfTVTAwGh4LCLgEVdk62eGvtwIWF
 GTIg560h5rhXWE9fDXE3FhIip2rKix6KiSguNlRXKaZR99MNaCSBiC70UXr2t+QORsoneMDHFfs
 FJVLunPuUDY9eddcAB2sfIfazvP2Oi6jLQwqv80lgymxs6iDQyMhYPl+hI8Q0XEVQSR+lvY3OEf
 YA38RYvhkzYisWajzxq/WJOW9yn7Wg8RN8NtiQQkwZkZbDOs1sHnxvuYOumdnfQ7UXqDRpAf8kv
 gKki2ena6yVQt8p8nVwjHoy4khpRZk67RHJ9f+U1l0igi5DS7aMzjfoZPZlvpr9mFB+TBm1Ob9L
 79rfCVKR7123r+M7bgQ==
X-Proofpoint-GUID: 6zn42YBdEhfnZwl7CAVjcQ7swDPn-BzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230156

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 2e71eaa90441..80afcc817d78 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -952,9 +952,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	struct audioreach_container *cont;
 	struct audioreach_module *mod;
 
-	mod = dobj->private;
-	cont = mod->container;
-
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
 		struct snd_ar_control *scontrol = dobj->private;
@@ -963,6 +960,11 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		kfree(scontrol);
 		return 0;
 	}
+	mod = dobj->private;
+	if (!mod)
+		return 0;
+
+	cont = mod->container;
 
 	mutex_lock(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
-- 
2.47.3

