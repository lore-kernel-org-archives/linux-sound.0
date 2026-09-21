Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE5650B8B0
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017720; cv=none; b=j8H5zHu5s9njg/9Fy3HfvD/XLypTqLuHHZgdP9rCULHc4bMgNyoGCAqQEPLRquMyMflzBZXeIBiNHbL1pqQJlMTgZ6JPSFC/oozXnxQUG9vc343ecQB95h4a/QlJ1mijMM88CzFd9/lPBUi1bag4SHF8P85x+8OefLWfF6zpJEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017720; c=relaxed/simple;
	bh=3zPDkuCDmQ38oUL9/eF9wJT7+qJydWJzTsR5SSVPT00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMJ4Z9sZ27txTtp0dIwuJZQ0sjkxSliGujvtBQlYvdD3BYZYlK/mS1G3oWTW2wcc9imw+BUcGXaFY5PEU2SDBESSPQwX829bJSATSotqXZpWZVIUrifhxxAXL/NHdMTpRBPVzlC00qXLQLoi0AalxnyHgY00YV9xA23cMjYbP+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTb35840; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rl4NPf1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTb35840";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rl4NPf1B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LHNDSL1313647
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=; b=fTb35840f89+kg4e
	OC1/lIA6e28VpD5gcyCFeXWPMSky34I0fZAaRYZrKjpTWiDr65wucgyuXP+ZibbW
	wQ3DpcptFE9ZLpN/xS3xU/2JmzbvDn9FU8WqeVPqFmKL79k6y/d/bwxRLbPEzqxS
	YphUu7qQaSdr+/kk8ml/iC2A931Zrzt+xuIWxikuTgHMAE8Tq/9BnjZYyjXxXxZp
	I0X9wRXKx0vvnY0pYmlCMChU4PjuEy8lOVnToQv67b4uXYa/hwJfHQa7n/aktEFv
	QKItee4xpjDXFUaFbGvMsi/AKLvEUMuJPwDW+3HNYlfZBFlMJD2r2eKqaq9ztaPp
	1VpIfQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xerdhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 19:08:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so6131723a91.0
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790017716; x=1790622516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=Rl4NPf1Bll78rWPV28VEtvxHsX/aXCLQ5SPaPGf4bwhGLSrwi/yi1PtcLS3JqtFexf
         KOkR++EvPd+Vbuko15rI1xzgNBtJ7efcr3mpP+gX272AxgZwVvSFZe6J2sMZzjzzVkNp
         awObjJyoI9pzSuTBdbtgX6PBV+OBJUmKPRsv7o3R6VNa7vAdtkIj+v+OOfEnv7Kn1Qpi
         w6uiolZaw08OYj6rEP7DPncU4e5XJUCppBQFU/pvcOQceGy8WVuyUa/SqG5DmZ8Q+m/I
         8sMK+BUZrIZGa8yUr6O/YSiOv67VYq5d3Uv5hoKpHSfAkaAdoJKKjF4Gbjb/oprO7wKN
         /Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017716; x=1790622516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDQV9EtK+HUfHaV7DcliO9oX+WewlHGg2nJCScj03wk=;
        b=cKOb56/XNODyoodFCiIf6YjsKGsfHr0CR8GS7o+VIGGYz72V98sM9T2iAbx3hQnUo5
         rS2WMDAXdrKnyX3ZQ8jUwrinfZ1Cmhhlfa3JyWXhNdO+EAxlXdADKChVdO2qw+l4cfta
         GhTTjY+6YCInb91aCdpjw3NO6zHJ5r9Wp8uCrCL+MTWdDzXKuu1wi+aNzRf35U7ip9Kr
         VO9Mt2wmSrqGRrhFWS3CV0HuyJAAVMy1ldZy0u9X0SbEEspjR6mifdzTxqEcJTOP/hhW
         COoIZ0J4ZvlT+JG4aJLPiaZs5BJPmRdxwoKpWpmpvDJTY6Gj31f28QGFD3RJHkBP3WhO
         9hcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsDBrgUP/yUo1iyHxPGPl0tehp999lAh7LXF5iVx0SY3a8UP5qpIWrEQg6kk1UUGaFXZmNemoCWgUVVw==@vger.kernel.org
X-Gm-Message-State: AFuF++n7uEZe62FeSzYCXR+cB7w48EQWXttzpbYzHkJO428/svvIWrHQ
	IXjMXjHl5dejucPhBUOXoTKnlllKWY0A918tFRC3QE2/8EryxhcYanFXe2e0KrBI5PA2Z6rltHI
	F+tlJxmzmu+3RDbcZNwuLA1R6iNE4LQpEnkmNb24uZCNf27RM0qGvtbPMGv8i259V0g==
X-Gm-Gg: AYBFou0F8MglFQDE89SZQiw3a9gI6pe70/8PHjSWuPoAmNpwwz/7z2VQNMSkcITWI6q
	3XaupwPuvXENYspAz5Aep+iYVviBX+3JNrJl+g6m0mbwnlc0YvkKqcUxq9lk99BNS+spzoCVvjw
	bfL3dUvjwAxuNMqhZQFULI6OCVg3hJXqcxzRvkQjMgX7uSBBh5FOJg9nK0i12ciKmgMe9Rq/SSu
	6b0buyr0Wbv+qrerissySk0+nSTU8maUaWq+SAs8YLQf2cQpUK1as/wJJjfE+DX33IVvE/63H0i
	afWVx6guMW8TnMUBkCaD8rpRI6ixE6jIvpKgYKaf+9DY10OnurAeh1hHvNE0xQ5N4BS8Fd2mhJO
	JU5SkA8bCV5JZ+WmRZYD752b9dCQo
X-Received: by 2002:a17:90b:4d91:b0:39e:6c69:34db with SMTP id 98e67ed59e1d1-39e6c6936e9mr10092001a91.63.1790017716146;
        Mon, 21 Sep 2026 12:08:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4d91:b0:39e:6c69:34db with SMTP id 98e67ed59e1d1-39e6c6936e9mr10091983a91.63.1790017715589;
        Mon, 21 Sep 2026 12:08:35 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec6ea45sm25855eec.30.2026.09.21.12.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:08:35 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 00:38:09 +0530
Subject: [PATCH v5 1/4] ASoC: qcom: q6apm: clear g_apm on driver removal
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-vmid-v4-v5-1-e79cfd7af5b3@oss.qualcomm.com>
References: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
In-Reply-To: <20260922-vmid-v4-v5-0-e79cfd7af5b3@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ajay.nandam@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.0
X-Proofpoint-ORIG-GUID: XmcGXB25gQCIilq8LpDo2N-dzeyTXTN4
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab180b4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i9zpEd1wrD5FINdKp7YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: XmcGXB25gQCIilq8LpDo2N-dzeyTXTN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfXwl4J9EaZWNcx
 SEoG5NM4wPVDH2ABtqMRU+r2e0Dl6LgQdEXnxPiuSbqfaGts2iQrdmUQgN+b+uem4qYbRPjqUrQ
 dUnJmUfEsQ/T6MhsoZndM/Q543HEAdi1LmEcpdQGFvqvdIljJZ+RzXv89DQoe5Vhrd/U6+Ypi+e
 qFo+kb78v3ztr2GHa+KPSdVRSgpG7MEe6VXtsqTMyyUgH/SdLCaGR8WJMxYrlrs+C29UUaVVNd1
 v44s3DPksUxG2kAemjzJkLSFVZSkquCgyCCmYISjA4R4IAExVo7st+4hWd8tgak7MSCfv1dV081
 L22hfsAkOhwGUJw/98/bNxMorc/Q5LybxWrWBIQxKXX/CqGyzwh4grTGt3y2WiPB0+sBm7xG92g
 ezaQYy51qiVxG500oPM/hAtkIRVYBvQjWqP1SNQGLPcU1tX4J0CkRgms52M6Pn7RCUUGGwI4HeT
 UmuB2sRiScUcqc4g7ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI3OSBTYWx0ZWRfX3dNwSwjtULZk
 OU9aLiHFyWvSn4AcG6U+wCN/OOqkT6QWf469PTcZao1jJlrHLU5Xj+1QawPWDfiR+9FQCMdBSTp
 Q6YxHgLFG6SXWtaV0A8mDUGkkTgfBpI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210279

The global g_apm pointer is set during apm_probe() but never cleared
in apm_remove(). After the driver is removed the devm-managed struct
q6apm is freed, leaving g_apm dangling. A subsequent call to
q6apm_is_adsp_ready() dereferences the freed pointer.

Clear g_apm in apm_remove() before the component is unregistered so
that q6apm_is_adsp_ready() returns false instead of triggering a
use-after-free.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 641d6d243229..12c6dfe4c58e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -894,6 +894,7 @@ static int apm_probe(gpr_device_t *gdev)
 
 static void apm_remove(gpr_device_t *gdev)
 {
+	g_apm = NULL;
 	of_platform_depopulate(&gdev->dev);
 	snd_soc_unregister_component(&gdev->dev);
 }

-- 
2.34.1

