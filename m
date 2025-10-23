Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817C030AD10
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215172; cv=none; b=aap6Fj3AFG/UBylFS42RLDPN5SUcyvIgvicJ3yNuHDcOZzS3jDXNJ6F/N0IH6AXFDR7/S2YJHnFCaU54aOzSmhmeTuTiiquqg46X7ZvDZuLMUo7PuUqZgRT6JRQXLdgr1L6DHJ2qi3qTWhn5HWUeolIYMj2y03ai1fCkzsKWY9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215172; c=relaxed/simple;
	bh=a6vR3cZrsa8eEPprG6ADmXlyyk7ZVWqf4VY8FOiCsl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inW+A0WukBauc56y8j6RKkf3Ybu6pfcYQCizDbJRC+czWergncBOWa6vueWv3mgBezgeDLevQ6QYNrA5YsNh4XdtQPXB4Bai9syXC/4WU0tiPdT8WaH5FL77Drwsg4piv6kFNGOq5zmADLYbaNjsqNbG18o4z5EU2OAIS91Q0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKJBMT6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKJBMT6x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6aoEG006818
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uJLxaLL+Ort
	xu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=; b=XKJBMT6xAo2uHS4evgZL5IbfNTj
	ezCvTOEwCWVCcTOV/Yr9JP6cVVz9eb4curSZ8cmZRD4jTr5Emi1zYfbgJS0zXGR2
	9EtlS8lXSkP43NABtWNPs1NXrlUSd1+eq9UtkE2TH5nniUcFo44tIrTXRQgaIBEb
	V2aAOFjpaE1EOq++HmyAC5e+FkPCbSLev1B2eXmzQfNOw72ZDydF19vzOGjifEOM
	0v4wz2fqqeUvbknVDZLeuuU8phOxtomf/enuKsGtgj3oPGhvmvTnu4QTDKOD+YT1
	COgmFuL1HPGRaxTsfamV42oZcElShEshYx81UyRqhnghO0jk+HVWfgRJfIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j7y3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b73b2f90so22780941cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215168; x=1761819968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJLxaLL+Ortxu6N92+2HUswlxaL+eZtDPgykkLQ+IQI=;
        b=DEugJST6yLoGF7LPW8ucQihtg+P1pGeWrHXtDcaANuvXLeNH5JKN4BvQicCydMkKp/
         SxMgq1a3KOMFNO33GbyAeU+C+AMJpv79x6bp6gD9TfKAUAW5jUrpz0XRsWzhPHUAeGkm
         B7nO7aBm/3UTZN8zj1vn+56JSDW/ILxMZTI5PSu1fOjqbV2xaj+h+M4vJGe9oez8hfu4
         U9iwK279cd0oqTd2m6cso5zEa5LR0yoKy+r/iCFOcBGmhAqmEd1ateB3oXqT7CmLwV1q
         GVHn8Y1JGSC6jwEsKuqQcUa98nf/8rSazevmRbBhz0wlMk7hCxLn0cWi9HUuo/BPf0/3
         4cUg==
X-Forwarded-Encrypted: i=1; AJvYcCW5lW5/sIZvDgCYXe21XZ6+lYVl2XWB5JCxE4lN8/EafbQ9d+gJecl4c66ralJ6TfsPQtP2g7537u2/YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzplhK88wPCUomT7i3G76nprHZgKYcCDqHfibWcVBvP4UnmQ93z
	8HCyFaHeQelhuGKXvPBm9tEKx3jww1MhZ+1COpeWfdavIAOQDcdQ3Xb37NHA77ltnMgquCnyCMk
	jkDOTkRQ8aB5zylu7QlUUZz1vTR+rE2x5tnlt6t3QvVhExSIqtcPt213F+ntD6nhR+g==
X-Gm-Gg: ASbGncu1q1tjQin8HuxES7dnOeeeuNkvHJMN9SmaBqJf9T3GBiKXMJl1ee7mvZdnp8K
	kyqaAxaKgtO6ozSIVwofCodOfVXkpikD5nHqmFtbQHxbG/ihMhX/s5PQChS1lfYjq9Qe8Rc4KwU
	FAadjtku19J5L9tH0zrSv2L85mE/QgWImc6kj9FsXkhHI2CNp/j7Mf3w8GbTmZVGmppzxDuMVtW
	ES6CjvECldqMaEVakTqCDUQ8ipg0+wgFh7sZoF9PSAOgAH7jZWwqlESm/Vps34uZwrtClTj8GN/
	2gda04hNVELEdkxHsR6mQXjdbk+dYhT18511Gvp5wN/AlBWgT+nTESkByTsxzkXDzYwA3Ziu2kY
	tDHiwZ2vujRH9
X-Received: by 2002:ac8:5fd6:0:b0:4e8:b739:6b57 with SMTP id d75a77b69052e-4eb5e8f6ce7mr111670751cf.76.1761215168485;
        Thu, 23 Oct 2025 03:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhdQ2ceCXA38LuUnWoaDSYqjEa+OiAO91vDbKuaHtr2AOy23jk3nemYpPiGTiDjDGq73yaxw==
X-Received: by 2002:ac8:5fd6:0:b0:4e8:b739:6b57 with SMTP id d75a77b69052e-4eb5e8f6ce7mr111670511cf.76.1761215168116;
        Thu, 23 Oct 2025 03:26:08 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 10/20] ASoc: qcom: audioreach: remove unused variables
Date: Thu, 23 Oct 2025 11:24:34 +0100
Message-ID: <20251023102444.88158-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX15vd07UisESs
 x0VgLmUP3IYJbQCs27jz9HE0c+sYjYbQW0osa8eEdeljAnn47epip17EEk+dkVYLlQSB0gJtXC3
 820QC76bvelzoEPWpJ/MiH8fWb7no+XntMuaJcyv3K5QenPpxag1qHH1sFAf0826trZkptn0yl8
 ihef5nXCbC2n0noM9ACKABcltdJJIUe4fl3sI/neyu9awpHvRITkQrkC9q3JGJD6EynSecnV58/
 LMV8h5ekTnvfc4y9NNTEk6qHQuCXovVcOgOZuV07n1oaO7GuoKRS01Fh1x/Y1B/2KsC+YGjEI5M
 gnv3NlqlHCYiQctcmcOhsgg5OOiCMQ3UMF+6MkVyw3mF80dfziJm2UXFZ7vfdODeFKKujFSjL7b
 J5uSsWzq4oP6IhEESsqE+YAjJKwLzg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa02c1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=s8dh861zfECFqLDNse4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: tC2ozNGiCUljKafg0QEkc9gxGGbTvnhe
X-Proofpoint-ORIG-GUID: tC2ozNGiCUljKafg0QEkc9gxGGbTvnhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

remove unused variables in some of the audioreach functions.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2365424a9b42..0456d4689034 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -612,7 +612,7 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz, dl_sz;
+	int ic_sz, ep_sz, fs_sz;
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 	void *p;
@@ -620,9 +620,8 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	ic_sz = APM_DP_INTF_CFG_PSIZE;
 	ep_sz = APM_HW_EP_CFG_PSIZE;
 	fs_sz = APM_FS_CFG_PSIZE;
-	dl_sz = 0;
 
-	payload_size = ic_sz + ep_sz + fs_sz + dl_sz;
+	payload_size = ic_sz + ep_sz + fs_sz;
 
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
@@ -680,7 +679,7 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz, pm_sz, dl_sz;
+	int ic_sz, ep_sz, fs_sz, pm_sz;
 	int rc, payload_size;
 	struct gpr_pkt *pkt;
 	void *p;
@@ -689,9 +688,8 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	ep_sz = APM_HW_EP_CFG_PSIZE;
 	fs_sz = APM_FS_CFG_PSIZE;
 	pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
-	dl_sz = 0;
 
-	payload_size = ic_sz + ep_sz + fs_sz + pm_sz + dl_sz;
+	payload_size = ic_sz + ep_sz + fs_sz + pm_sz;
 
 	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
-- 
2.51.0

