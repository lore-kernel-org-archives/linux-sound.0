Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70030171C
	for <linux-sound@vger.kernel.org>; Mon,  1 Dec 2025 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764584795; cv=none; b=rG5OUWLc/X/N69LYj5F/Ad4zRsKnxM8KloNcwRUmvTt4yfoKBmyTAdLvs8OLP8JWf4MuEzr4zAgtRQ8yrp88kATq4XsWUaMp+fFQ9guVc+DDa1YSmd1gGYoe11w2lKbIsd8QZy8/fpxbnxlYC52DbILBN92RjCYi4lzjKP0HYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764584795; c=relaxed/simple;
	bh=7CANf/AG96uikl0fdZoZU0pYW/CjdKjwwVY6AUUhoHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rYhpdUAuC7yDK5mt7HaxrxnaAgpJLf3zNE3jNmBzweD9DhejGVFAFWkZi4xESc8FB77DTubvSAiqUONXjwZFRqiObuUalbQcBF9e0Ad9HPwHiAug7ewMi8exM6z8Bkoq/hJUDU9sdzpeVNWOtYn0vjh+zF6PCjRXAAY/f7HPfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/oWYCag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CEsrZA3m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/oWYCag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CEsrZA3m"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1A7nHJ435828
	for <linux-sound@vger.kernel.org>; Mon, 1 Dec 2025 10:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q6ZWoKaVpntENYanq5NuGj9wLyX69ZfsTf/
	tWcAzNBg=; b=Z/oWYCagbKK/oQdRuWquTxZjOTcRDq5yLyqZ5VcMMx0SJGGlXA5
	jYkGFtZg3RDncak9wdFQZNMqcgqO8zZSrX3/JAbxQzeOT8mdgdwva0zhhKDvIy4+
	yx5JDuQdochKMeCG7LMMcgCF/TIyB4zcbvnOZHA3PfTeQs/L81CmWUAGjPUFpb0Q
	c/q2fcDn6gyrzxsfMfjxhr6pWAmmi2qr67AVUgtX7QpUQg8nRxjGT5PVCtU8Oqil
	xI7q3h/+MvpcInJChXIkgHWleHfomEHScWov/iTigLaTS+W5AeRnWNaVOVMHPC6j
	CUpfRH9J9xCNx506w8o2XRuqB7tYeIjmO0A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as909r1qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 10:26:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed7591799eso76691941cf.0
        for <linux-sound@vger.kernel.org>; Mon, 01 Dec 2025 02:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764584792; x=1765189592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6ZWoKaVpntENYanq5NuGj9wLyX69ZfsTf/tWcAzNBg=;
        b=CEsrZA3mqGKK2hund4BFA2nRipWfcaY0VOrScvMDx9OO8IhPL6311cpzAM7fBam+qE
         K+uc2r5LdFsP0X7xniCU28Op0o5zJlXK2BE6o3PSF4EeTMYtGu2cEU7awwhyoEy+4WpC
         N2095TPsskAnP3d2SzHeZ/fANU95QlOue8jFf6Mo/7US0AVlaCBasg6yRgIl9Q/GZi9Z
         SfFwbW45Rp1gDxgKazYj1Y/CBJZcnDPDtt4I4iAg3RBJPjsFZVA2iofTxZ3M9zQXNZBS
         7WTFOPqPVvscqmj/8E57tBw1YoXrlH3NRVb+egAgfDO3i+VfaJtysdvcG8NWX2vDFP0e
         jfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584792; x=1765189592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6ZWoKaVpntENYanq5NuGj9wLyX69ZfsTf/tWcAzNBg=;
        b=d7VwsUYIR4cjNUvmq4QaMqXBnhsqHvLA9yCnPTa8TASK10RPBCJytLXOjstCIC4loR
         LVV9NQHd3ARFg4XCLq1BWlhDlxhMAL99dPH8Hh6H/QHgA1TTzpV5n81P3zHGpeeOV9UO
         xQ3/3gZKt/ZroXtv6tld/GIMyAPwOUFb4KA/fBYntW8GuuockXgBBW55qEVy+qPp0+ed
         04msWnA2ZlH17eBaxrc6awU6ZiXg01Sp7tkHhg3QRlauM3BkONT8dXwQ5+GfXljCYE7P
         a0il7tqgD89mdqNcnjlftbRW3Uikap3krSwLSSBQOLvvGQYFU8Q/SpqqBVhghdbIbYaf
         0RtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeeKhwQgYga1BTOyJq590GBPbw0i+enZEEAzBX8UBX3Ak1Z5YD5Wq2qA0XErLd96h7R8XrgLCak7HHxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzkAThJF9IH4GdyslqMrxqtfLDNMSOAVMNiBsLsvwM1w7P0TIk
	b3A+tRmRqc4X16lWn544FEHzq45jO18pGLnwSRudfNWDEEJ02GVGnkcMAkts26a1rKHMWsdXYxt
	/yfmNnI1yxrdfY/4vYgEy2bUtYsX8z/PEX+jqcUeqosKo5yQ6LGuTZgvnGh4+rW1MwA==
X-Gm-Gg: ASbGncszb5iIAAzm5MSfKww0jXFlDhf2l0ur9iXafdtWVrtvH4e9CeZUYSsubHtvXj4
	AyKOf8IMumU8Hcy56k1l44gvDmn0y2zdkazME8kh37D8OUfBXbwBsC0F0r7b4PCsBUWSl5RB8Ut
	Jx+l8wXSwv2wTUDLowlDCk4qvqax1Ib0H1J4Ewp0XIP00KYjRr5D2p+Dtin4Z5JitHIf0GuL07W
	+Pe34Vkk4bP80MYyVHCFbyxMiSiQXIX9+3/wnFKRoSdQAX9nRv14u/BSlccxuRckymm6xLI1LjI
	XtSguM+9urEKKEo7ro/owBwJs55VbZyEXWdE679wCqKuek8SyxT/khOFyrPVwvrIV9SAM7cyxwJ
	yvtQwIs9lUgvO3KsYAiWlvzfhnhPB
X-Received: by 2002:a05:622a:a958:10b0:4ef:c773:9230 with SMTP id d75a77b69052e-4efc77392a2mr274257751cf.52.1764584792316;
        Mon, 01 Dec 2025 02:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFawNTZFhV14LEHpTSvfAOhUpBaBftlS1iX+cVb6huyZJQwDHN12r9ObuX4YuO5hNazBydGoQ==
X-Received: by 2002:a05:622a:a958:10b0:4ef:c773:9230 with SMTP id d75a77b69052e-4efc77392a2mr274257441cf.52.1764584791908;
        Mon, 01 Dec 2025 02:26:31 -0800 (PST)
Received: from kuoka.. ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bf8a7c95sm3475465e87.6.2025.12.01.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:26:31 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] soundwire: qcom: Use guard to avoid mixing cleanup and goto
Date: Mon,  1 Dec 2025 11:26:28 +0100
Message-ID: <20251201102627.146182-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA4NCBTYWx0ZWRfX2Sfg6UPxO52+
 HyH3Y2DCEs9EFwhlEFcPZIdoRWnXliEAL2U0GFeDjl8whRnYuK+qAjSipY8/eiGBYRYz9URXsaO
 /VL5zkkuICLKxv45YFRM2xSuY8H4TAlxd+1z7IptzfxjHFBUNh4Duc9Ss3KjGhafSMPSSOHHFNt
 ZIaJs6dZTivMHRaNbEQKVDKv+dasdV+KOpjXxhrRvktJTQYq3JYgM9G4W40eCWrck8BJ5p6sJn1
 pvqhby3WO/VqqP6Z/+eECjW7ebSe44XJONj+prgpc5nx8QdaOtwEl+yZu9Npm2dSNgAZWnqsKDu
 s2msBOV+XKz9RkoxpS6Fqase0T6HwiXAO6F1i94TPi9op8AyMLjQbGPxGUQ1WNDjd9tqp8RuaxV
 PMKQx6+iNCSpFXoha4QaWgo4qQ7rLA==
X-Authority-Analysis: v=2.4 cv=XJQ9iAhE c=1 sm=1 tr=0 ts=692d6d59 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IDPUzVuyyB17X4GnzM4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 46myMhU6ttwCzhMpgxLSBYGnRYJ7udyx
X-Proofpoint-GUID: 46myMhU6ttwCzhMpgxLSBYGnRYJ7udyx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010084

qcom_swrm_stream_alloc_ports() already uses cleanup.h but also has goto.
Such combination is error-prone and discouraged:

"... and that the "goto" statement can jump between scopes, the
expectation is that usage of "goto" and cleanup helpers is never mixed
in the same function."

Actually simplify the code with a guard which allows to fix the
discouraged style by removing the goto.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 17afc5aa8b44..8102a1b0d516 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1228,7 +1228,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_port_runtime *p_rt;
 	struct sdw_slave *slave;
 	unsigned long *port_mask;
-	int maxport, pn, nports = 0, ret = 0;
+	int maxport, pn, nports = 0;
 	unsigned int m_port;
 	struct sdw_port_config *pconfig __free(kfree) = kcalloc(ctrl->nports,
 								sizeof(*pconfig), GFP_KERNEL);
@@ -1246,7 +1246,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	sconfig.type = stream->type;
 	sconfig.bps = 1;
 
-	mutex_lock(&ctrl->port_lock);
+	guard(mutex)(&ctrl->port_lock);
+
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		/*
 		 * For streams with multiple masters:
@@ -1272,8 +1273,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
 				if (pn > maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
-					ret = -EBUSY;
-					goto out;
+					return -EBUSY;
 				}
 				set_bit(pn, port_mask);
 				pconfig[nports].num = pn;
@@ -1285,10 +1285,8 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 
 	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
 			      nports, stream);
-out:
-	mutex_unlock(&ctrl->port_lock);
 
-	return ret;
+	return 0;
 }
 
 static int qcom_swrm_hw_params(struct snd_pcm_substream *substream,
-- 
2.48.1

