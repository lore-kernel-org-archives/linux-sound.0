Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD7538E10B
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 12:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799731; cv=none; b=Ghee7YHmjAzazRKfSbxjeaQzfHgQ6bj9HZmOzJ+qeJt/b3yaq7aaQLThYHsmzJp4UqQC+UOBCcX/tZKdU8al0v7WDM5YH4ONXakPyCoApE0c+KZsn+QUqtfBblFp7g644NyfztbNluXV9QFcAKl6VpqN7Z4ByraB3SxseFnDwTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799731; c=relaxed/simple;
	bh=6jShP5otc7Z/xglFZY5mqaUqDhEckaI1JOm+jwe6kcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ml1GAr9QKmSDI+7CAVQteT7P7iTey9YGSMmOu3IAeTDLOEtY9TkY6/T2KuKPqwiP5eajdnFeNPnfEW1O8aqAKL9359KGMEfzJEjdXhsOXZzSP0jncW3l6cQLBtm9Azj5QQiB9c5wOQA6QzIakASN7HqNQRL3xt0qtUg2Fv52WYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwUHlBx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPU75X/q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwUHlBx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPU75X/q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbJ8x037698
	for <linux-sound@vger.kernel.org>; Fri, 6 Mar 2026 12:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xKWL+GAYqNp
	+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=; b=fwUHlBx5Up/NCWMRPmiMRow97nW
	6NwmwsX87GzBm2jr4Fm8IwkbYkUcShqcGpq0Wf16LabS0y0hFq8o3d2S+Qk2Tfig
	Szo4u2A9mKyO3x+nFGaat8FC4S6JSVNEHkUPxUPJTrYJvudTurH4CsczbVZ7ZSYd
	x8L92BHrmpEIJDkoqhhDX2bxUC16kf/ssGd3J8q4kQ3RBJhLnQGvUfvRtDXVxWia
	lzc6+jLpFUaJMa/HUj3rAHBd25CqnIJ/Oum0rozLfuEVt3Szx5F6uNCYRf+FVSe6
	/3deDb4zyLEDxwn8lWeiNQviRYotEuZ+1Fa1Fk7RMdoT0FDUXeYNDLO4v/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdsqje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 12:22:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ef98116so6029542385a.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 04:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772799723; x=1773404523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=iPU75X/qUDdg94+sqBZ4xw9yIWI3mBv3YMKQvNOtKSAyJtfhjGVLw7cYp3O65u/9JD
         pIylQxbAfMRD+J1GPYNQvIBq8Jqgwc0xdN68MYKPJf+LjaYSFjMSFn4gS7e8NrhwnJSC
         7XXmMCBLUcQtZU6j3QnNLQuutHcJtBJcaL+CBn7fHE2C+WVcOJtaBoQ1NrwOomjdSvfN
         OeNaNBfh4XraqMzB8lrXNLtY+BeBVbHv/T1aQsBYIKL+0EXBlNmOwi6foWUWMSnv5QWG
         xptbI1To5exTCvm/Y2ViQbr3xU/gihMQQxhPULOpJCURD1ta6FDtJCzg2ya33pZEt/tw
         Z0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772799723; x=1773404523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKWL+GAYqNp+tTujHQMkzR7HCGoYVVs3sPVjIKR0hiY=;
        b=iDuzA3xe66i3Iv1sP3vADcO0v2unHxFyypA7f1brjfqm+q35Z1F8QbzbY2MQ3F8Azm
         bzy7r/bZF7TQgYMM9jqVyofuH60UuRCgm3LXJTEQaBzgPDyWOcrlNxBycYw705Inreyv
         9vYYHGoHBa32qmfl7BEne8CVyCnUsA/PTxlTkVT/0Uz1j3zlUftP4o/2XaHZREFSvkMv
         EXse/naDFh9gGVH7+s7T0kkL+NB7ENUbhJVyU2lqw2I8pXqma0a7HgP7UT+wb4/zfl7m
         qFPGGpzsA170ZkfBYYtZnJjzJGdcxa6za0u1rfeliMt8J9tLc4XdQI4XYshaNJufQH7l
         dyig==
X-Forwarded-Encrypted: i=1; AJvYcCUxtwOB8IydgFxVlkZ4HNPGEc2dYRaA/OUI/15BebivOfodfNO2dOjizI1+Ftq/UZVXz+szIXNUYhXXGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH3uqjl9ziraQejOOseo7RNmIe2WEJZhlPUwQ49CparOHwCUNG
	QVi7zb02eOrygVu/rmNLjyLtL6FdiOhiIWWagV9bc4IFBQ4sGzYP62iBkFurNYbLn+6NRxtv8+L
	S/jm4ZVaN0oF/E9T1J18wIKyj0WVN4pF+H6KAlHZECopcuG83FQcVP38C5AN+jhSjNQ==
X-Gm-Gg: ATEYQzz0VWkKWwdDab/nbva3afJBNt4Wnkbh6+SWdJzOvhFtojPUMshREQWKkptUmNJ
	2C1lHuM1ggvo/x4UF2gPThu/NtB7znuFLxlfbT482jO70vPADatyr1FEU36DU5Lu5zWbBBN1wCz
	qdVfGaW+z9tKf7T/F+fb2Zyh6Fq/1o5AYqTu2ZEolDAi2XC8s8fnZhE98HFnSue4Wq57COXcL5N
	R6AphbUKwpvPLDhdFchCpo9UjqUDinperBFddYhgvcbCMmWZeZc8Tty0kefBLifYd+wiSZxyxze
	Q0T72meDVFPFHM9TjJz4jdkj0+NcOddFHsk6FIp+rUw0fAZc5v4JV7U8FVHRU/UyItlNcRjgKta
	134Ps6YsUvmsOj+KZs7UEzyvTJUlVykgIA9oDQgWsOAx6n7rC9V/EOME=
X-Received: by 2002:a05:620a:7115:b0:8c5:22b2:8b4a with SMTP id af79cd13be357-8cd6d40d21emr227966385a.16.1772799723400;
        Fri, 06 Mar 2026 04:22:03 -0800 (PST)
X-Received: by 2002:a05:620a:7115:b0:8c5:22b2:8b4a with SMTP id af79cd13be357-8cd6d40d21emr227964185a.16.1772799722936;
        Fri, 06 Mar 2026 04:22:02 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fa87e56sm111972395e9.0.2026.03.06.04.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:22:02 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 03/13] ASoC: qcom: qdsp6: topology: check widget type before accessing data
Date: Fri,  6 Mar 2026 12:21:05 +0000
Message-ID: <20260306122115.509705-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260306122115.509705-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xbkEz1Lgb8HBCrbPRacOURRyuIg4DjgJ
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aac6ec cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5HTw2GpdgXbBP0wXRk4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNyBTYWx0ZWRfXxs0J/F5s3kkZ
 m6rUGnKHKZ6FDybPnibe2m9f23GjDCRlrHQM2+jimzg9FT11AR6aVT6EDlOh68YWZ+RMk4gb4w+
 TDnJ/D9XXd7NMvuqhD+1IFavqVEaqUqURmngVb1QtRqHm53kFOGykp/p8mmKBQzhPHFs0aZkqc/
 dV1tUU45pdQ/w5zyL3d4Xl/PsxTbWKmPdm3LVtJ+/o3r1VD7CImqpQUZ6BzYrwYkj0Hg+wI7uxn
 5n8+FqSDk3o1lxln+DCWJaxXb7qfURnBAcAcZXAWx8/nlCBOfDcWUx/b17FFRFtD6yicLF/O9z9
 5J10GVtJi6C2fEmhg1oA4l6C+Rz7r1ZYyynKZ8d+Ej0yFEBeVY5PfaGjee2gk+guTeYoGqki9XR
 UhMRoo2F2fo5qUY0QJ8hNkVY6d7Fax+VXF02X1YPdsOL/XAxvfYKcufYCl6tdTNbAJXtDaeRNDB
 YfGrHdUUO6fuldi3CxA==
X-Proofpoint-GUID: xbkEz1Lgb8HBCrbPRacOURRyuIg4DjgJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060117

Check widget type before accessing the private data, as this could a
virtual widget which is no associated with a dsp graph, container and
module. Accessing witout check could lead to incorrect memory access.

Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/topology.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index e732fac9b8ca..1f69fba6de26 100644
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

