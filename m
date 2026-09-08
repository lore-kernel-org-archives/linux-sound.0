Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7565837A494
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 06:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849433; cv=none; b=RdLtcIQN9BTIT2/4tAvQf12c4O5afP79s/SrXjwa4pJEHoQv617Si9coTGbyTM/EizgSsH3cJGZnqN1mAiKkLhZ9pTRpQhHA5zfi5ZpmkdvcscjXaTiVEE8nJSGTUul6EkC45XAx2t7A9UhPkL1zeV7cmO3o5U7SuKEfOouz81g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849433; c=relaxed/simple;
	bh=YiTuIbcS6hPcgv6ItYlpBhz0L/k8rn6qCb4bzAgirZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=toVP0nQ67Lh19mX8bYAaXwaU+LEDdtMG1LKu8XjtT/K2xyx1kiaJK35Cv5nwLS1X0Hiyrk+jtSyGCN6E5eL2eHTJQ70lxmwh/Ofv54LLU4gfEUYLVaXAmpJmesiKCbYHF1otyuA0Lsz0P5JHWTMlNzhvAznohphZbQ7RS/KjJ50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W9xc75nF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGkB7VR6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W9xc75nF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGkB7VR6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Ledn3299172
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 06:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QuIDTG3AsB1
	yUpm1Ko7cKVJyJNN0vDfKHooNGo8PMHE=; b=W9xc75nF4BYLWWqEsV4rTwC0E3p
	cOliblW7GwT3rpwegZQ2lPVEFbghYQegmM+NBZjtOIPVWVaTs+iAV7dL98QjB8DC
	8VQEF4OlSQ7YDjz6ZP6wUeR9rWjuv8Z0nxb4XDDiIa1r7N6F2rVjfNLUg1fcEHv2
	Hw52hSMuIGCr5yfsVmuJZ2HMftrAcOnHQJ0d5S73K36wEpCcJNeM9r6JfZoB9oJm
	fkCuuUaa7ECNENIkZt1fcblhzJwPadgTx8VCgUUSz7fWHdEmyU59SCWuWmCOWjfq
	ZRPzNjzqq5RUpX1LU5MOm1cenQA4MOGzfp263TLlJsh4fjG//HSwX4ZozZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8gf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 06:37:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939694871aaso677193685a.2
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 23:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788849430; x=1789454230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuIDTG3AsB1yUpm1Ko7cKVJyJNN0vDfKHooNGo8PMHE=;
        b=kGkB7VR65nwQlvD+ANb7kv7Qou9eetKzm6oMs3h/+lFYuDjc9jJBBs9mg1gd3oVoJ8
         6sAQX2WEWlie+G17MwVb8inaW3H+ekBB+1RpXk1yLA/cqXWmgs4DIAAmGyfbQVntxGKA
         Nn1PbZ0iLe7JR/eOpcHEs8cRDuTKjXxCLlmBw0JsHFdGbDAwnoq/OdpPS+9FzvCMmDLj
         HcnV2+LQvbjnerbyKvPf/Sl3wIEtyU/edC3MgomO1ci4mO/QaiMuAUCGSYwKHPHnTuJT
         IxElQ7caa/wpv/DSn1wmVD6F0SZdj348ZOB48doJeKOx/sGLKz3O92Aw6+EpuIo7wHur
         6CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849430; x=1789454230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QuIDTG3AsB1yUpm1Ko7cKVJyJNN0vDfKHooNGo8PMHE=;
        b=eYEa6WC7HKrah8helTnNOe4woz4UTQ3n+WMxzNyZgpKGy6O3T3okuXVRiKKiTWk2MW
         DdFlMJtFE8NCk6fENSJR3KvPgQB1wZ72e0PEloYxr4A3NszDfE8J+Pq2a8HyE1TJpdl0
         y/+/FN7hCsZLNPgSnDOGPjDDpxEZp247+YAbHyBuwajRQ+3+dG7y3k+01GJvPN+SgccO
         d8us4D9Jg5J7B0yv86IHd6ZCPujpTX3z1cKh1plMre/6rEIqQ85Dj7xTBmLFHBkga4wz
         vFO1xRWfZx1QOtijmdxEtZAAma+0TMTVECtUDl705fs2JyzgxU1HGC5xREsiqJ6uVvWU
         /iVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzINgWlGbLgB3gL3hjmmkbXG6qCoDuU4QHGSpDjUoC2UjQat6hyyo40qIF06ksJS9NHye+XZfGKsUJ3Og==@vger.kernel.org
X-Gm-Message-State: AFuF++n1k2JdzNkijG62gajxKi0V0Bz3nD5FXJqDWqf4sxLNWMq1Zyzl
	9BZPgPSoopyMHhKgtSRnbRZSC+F8g6w2JaC0km0Idw0HwhbIhQmyYDUoIbrqje8B4JHAGrzmHlU
	B0/wFHRz+J66N7un6HJZ3f02kR7HBOUJqU763Vtus1YSu3MSNoZEOo3E8KwCzJdZkTg==
X-Gm-Gg: AYBFou0LZFGyUR+MffXCaH/kKaiYtxV/UcOtqyu0tHON8wUmqDlRDV5qTv5J5N2xoRM
	9kpULvKZHZXiW7mzwacCHOBHmTLuK8dsaTb+UKTQNI4P0743uaArANNf3lAWi8AjzKFJdcaGpaQ
	FcDmNqLGx9SP1m4a7s3spUI+5xe2FYwu2T16og64tj0SScR3ovXrDwhosByKzQGkiWuIPsUobNJ
	JSWQfDl7NJIEz/fLRQ85CabXlgstTZmZwhnlUVnL8dksZow+9IX8/02hcBLOyXyqtJulqICiIVl
	L2f2S8CeQ8mPENb4b33x8atMCIfvTNCOURjVBKA3pmaKo8+HTah8XCPj7xz/GRFmpjS1CJoLB8G
	TzzpYtZFC+AVpWg==
X-Received: by 2002:a05:620a:831b:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-939804070f6mr2346388785a.32.1788849425712;
        Mon, 07 Sep 2026 23:37:05 -0700 (PDT)
X-Received: by 2002:a05:620a:831b:b0:92e:5fe2:fd35 with SMTP id af79cd13be357-939804070f6mr2346386285a.32.1788849425193;
        Mon, 07 Sep 2026 23:37:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm277799675e9.13.2026.09.07.23.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:37:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function driver
Date: Tue,  8 Sep 2026 07:36:43 +0100
Message-ID: <20260908063644.463819-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NEo9lKmaeCpldyuAZe-o6H3G6CvlK6R0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX2iQF2i9PfZCR
 KdrSB19291/Nvrtj7pnT9LWAxecxXjcMA1e8zqx6QchthaMunUKn7JO6wSJy9j9qBx56m/dbsTU
 zpbSV0QfFiCor0O0OPs/k116e6gNBE8=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fad17 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=w1d2syhTAAAA:8
 a=EUspDBNiAAAA:8 a=IEwj7ntJ1M3WgPGe5dsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NEo9lKmaeCpldyuAZe-o6H3G6CvlK6R0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX5/mZ0wxjMhq/
 m79T2qyb14oOCdsv3QzsOcGdRbcmqvE/DLfIgkzlvUmfK6esIVdaoMmN+0Ul9jWkXBMOKw7cS03
 QlC1Z1pY2xy7x1Lj+vLsb4yrL/jzSysN0XWaihEYe0vxjEXRtsJxvru99U7XXehtIocPMkrgnt/
 uQQtNYO0l3MneDGldijQaKE2tbGaD8pnxPzaPLZWShQ0v0Y+zk9/feX5wnCNcrKm57rsBNwfeC1
 iXBCinb5B4zPA89C8RUpQBOFZmgMl5rxivFFht6KJCojYpC1swRy/HRZ9dEsVhE8P/6vdvEjlby
 QF6ROI+UKo6NA1XzZBbvjypODxlVbb+g77DPBHZD1Ubd0OF3Ls0svJ7wXdG6t5pmmT/yX/7U1j1
 QhZ6p+t8jqDWYy76T4jwqqjkRiOkoI6/3Q0xrcznedMTxnDarig410D873AKRzjs51M/5ExAoCp
 Tis7ci6xSDXV7NjQNUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080069

Add SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function driver's
auxiliary id table so a SimpleJack auxdev is bound and enumerated as
an ASoC component.  Wire set_jack for this function type so the machine
driver can register an ASoC jack against it.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class_function.c | 5 +++++
 sound/soc/sdca/sdca_functions.c      | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
index cc7045dc26e6..1d7fd6603882 100644
--- a/sound/soc/sdca/sdca_class_function.c
+++ b/sound/soc/sdca/sdca_class_function.c
@@ -367,6 +367,7 @@ static int class_function_probe(struct auxiliary_device *auxdev,
 	switch (drv->function->desc->type) {
 	case SDCA_FUNCTION_TYPE_UAJ:
 	case SDCA_FUNCTION_TYPE_RJ:
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
 		cmp_drv->set_jack = class_function_set_jack;
 		break;
 	default:
@@ -552,6 +553,10 @@ static const struct auxiliary_device_id class_function_id_table[] = {
 		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_RJ_NAME,
 		.driver_data = SDCA_FUNCTION_TYPE_RJ,
 	},
+	{
+		.name = "snd_soc_sdca." SDCA_FUNCTION_TYPE_SIMPLE_NAME,
+		.driver_data = SDCA_FUNCTION_TYPE_SIMPLE_JACK,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(auxiliary, class_function_id_table);
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 32d9b7f30a4f..30fa0324648a 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -78,6 +78,8 @@ static const char *get_sdca_function_name(u32 function_type)
 		return SDCA_FUNCTION_TYPE_SPEAKER_MIC_NAME;
 	case SDCA_FUNCTION_TYPE_RJ:
 		return SDCA_FUNCTION_TYPE_RJ_NAME;
+	case SDCA_FUNCTION_TYPE_SIMPLE_JACK:
+		return SDCA_FUNCTION_TYPE_SIMPLE_NAME;
 	case SDCA_FUNCTION_TYPE_COMPANION_AMP:
 		return SDCA_FUNCTION_TYPE_COMPANION_AMP_NAME;
 	case SDCA_FUNCTION_TYPE_IMP_DEF:
-- 
2.53.0

