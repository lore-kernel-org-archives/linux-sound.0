Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E3621FF33
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534296; cv=none; b=uKNTlVu+k7A3Pd4/YEqi55X/+hKkT6XBarc9rL2/RezouzK8j2een662uIhvOP0PpgZRe0ullUChdoIhNBnmOxEG/HD3QikJfd3PfuXIE2LxgMsob1OxYahLPw7c1CiB5K9vP4/GVyhO3DkzFLpyPAFuADR3zZby1gqYTjTUla4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534296; c=relaxed/simple;
	bh=WgksRNnJLD6BqxUz9vyEhSOn1ol4D8nCWHkD1yAbE7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1rGa1xtGCFQTMtYgKZ/B4bYi+QvyQFVb/tyvr/qDn/2LAj/cfw9Vk0vTfFxf7TX45ELTBt4T3j9ULnvq7IzVEiyT9Fg/w13Kc7t/1BUacJtkzKZYl5oPRjHy5Jw0oiQBVsBmOSTqUWFDU7zfIcDv6e6bLZMNDFel2npDtp1wyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mHotCi92; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mHotCi92"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAw2Fq017832
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zlyb2ILEilB
	Be+0NeB1eqEutKyYbzy1mNlFgAEnueiM=; b=mHotCi92zo5HlrF8sjm2M+zlov3
	+GAmrSaRqX0Y7OZNSJK2VkFOPBl05IvyywGfNPM1b2NJq2VyzmzFzFXygJsmmqPP
	UrhXQDhnPV/EOI4nosDwKDIT98hdR5DXr/scSJDmZ1y23C0c1boLLSSWGD9BcyLm
	d8i2zvuOmQ56sOt/lmVSc9CRioKNi9IKqkJZ2cXu5GCCTqitx+FJal+FzBqZAO3n
	iT1j5cU7XgJnb+o8E1lXJQ1Yhcu2HKFopSgEhfsiA4oEWH35bLVZPdwRy+EE4hoE
	3rydXYHleeHwzOZfv/hJdgEg6FHmLetz6FCtPEc0CPjATA7jz21ekFlJR7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt9ejd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 13:18:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8635d475527so4065029185a.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534293; x=1761139093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlyb2ILEilBBe+0NeB1eqEutKyYbzy1mNlFgAEnueiM=;
        b=mNNE1yzSrQyma2KyEquDnSFMl1C7uD26FTTmqEkiTJZrAXW3FhJIDhT8OPDqnnAfgp
         o64T8vSQAqoJl1FsWMu1/HVQMkey5j5qtdH64Sc2Gw+qRPL74TeX2FW221al6hEtHDQX
         3tFbyf3xzN7C7mNF/1SNbY32rV+jpuwBwmvpjJUq+ed2/azMXWgm7xmgHUKdQ0Snr3Ln
         msj4Q3hN0MNzRzFhtlVqIpaYqPiOhtlFT3TPqGcQ5S5xDWAGimCmbaDAnAsA16ANUHwh
         PJzb7ee2ZDUQG9TYik41KwOdCNmDPkTCX3I2jeiRtsUygVb9uPCDpa4Do81ekGMqvXta
         P1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXayOtSle7KHdpQMexm9hUQH34r2OnULhIWcySQJ1RaX5rHau2D5HecVetTYS+okfQLxMndlqM9oyMsYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpZ7tEm0tAN5yxMcD3r5kR7JG/Is6oyv0wZ/STZ+fN2EW3H56P
	/V3BxwyWdq/8RvnnjoVV8ZG6NNdwwcyN1Ae0F9AAB6In8aCut6tMrfYAGPz5ACNmSeZV1hmC/n8
	J5TxTGcLsi81u5ZMi3RTJZbqcePcVrZQ+5XHy+QFubCKbrsRgyYmE24oaMbBSoi+x2Q==
X-Gm-Gg: ASbGnctZS92Z3b6fDLq3qRfmW9WGPqnCWLNAPm54163+7rbK7LCAV3gQXGEWOW4TwhF
	V1yj9cHrj6LAhwt6ht6jb97kt7jvnzFHve9W8UFpCyJ3fvhGhfkaxL4iRvJZVzXrMKPOjbjXOBw
	A6J2lF1N7RyK68nuQs9SV9dr4ym2H7K7t6otekBIfjc1a0xYwqhHPrqs5ixot9rfCHRpMYaJjV9
	a3rcdAhGQsK+nUe1uXJd6mFaeg1P1rMlJdTuRg3ohmnM0rQQNnWd53dakBYr+XhrLLNGkzGWieM
	sqLfk2V4mNlqa3VZPSMUBL/F8776TcHqni1QPCTQglfdf19UUdTu+w==
X-Received: by 2002:ac8:5d0e:0:b0:4e8:8de5:fbb2 with SMTP id d75a77b69052e-4e88de600b0mr9882081cf.70.1760534292373;
        Wed, 15 Oct 2025 06:18:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGifIQbCESc9SGhY2SMFQxwvgmX8sW9h2/sx0PYFUmxrzn6ej7nKB9DswF8DGHPCO6IAfidCg==
X-Received: by 2002:ac8:5d0e:0:b0:4e8:8de5:fbb2 with SMTP id d75a77b69052e-4e88de600b0mr9881381cf.70.1760534291735;
        Wed, 15 Oct 2025 06:18:11 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
Date: Wed, 15 Oct 2025 14:17:35 +0100
Message-ID: <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _XuLIktIf2xWq7UwGMucVnd9kymHG8Yr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX12Fv63Ehdl1/
 hUgnReSE3dFIbDt7sVfT/mqXcWyAqLfcE9khN5EA40u6l4S7FLkPE/ZMUef+MG8WKykyrRhaAY+
 RdM+Ws4X27ZiDY1orYJdpnZ9cmypzm7TnawD2tvY/j441F4HzkV2kHDgRPHEeVeV5J28RfqWscc
 Fz22f2bUIY6IlTbE+U0pMFokJFs59Ea9b3DSAKvIcSVQEKkGt840kYZoHr26rSgOinjDyz5mTC2
 KUGVxbju8OJi6N3lSOetWLp/AjHCQP3I9YJ+WabIuBtdTRGbyA6sP299ybCdyq1TqDTIH53FzoL
 rNoa+QpExi70vwaAq71SrFka/D7i/zxQVdhaOkcnydoupHoToSUbX+Bi3hH+5xXAeY0KXzJJzPL
 3Z+lHchoL5CZNjcvMmx6RqM+Izk0YQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ef9f15 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=yqanLTD2VdNSX0FXSJEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _XuLIktIf2xWq7UwGMucVnd9kymHG8Yr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

For record path, multiple read requests are queued to dsp in advance.
However when data stream is closed, the pending read requests are rejected
by the dsp and a response is sent to the driver, this case is not handled
in the driver resulting in errors like below

q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp

This is same for both write and eos.

Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
ASM_DATA_CMD_WRITE_V2 as expected response.

Reported-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 06a802f9dba5..371389c8fa7a 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -638,6 +638,7 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			client_event = ASM_CLIENT_EVENT_CMD_OUT_FLUSH_DONE;
 			break;
 		case ASM_STREAM_CMD_OPEN_WRITE_V3:
+		case ASM_DATA_CMD_WRITE_V2:
 		case ASM_STREAM_CMD_OPEN_READ_V3:
 		case ASM_STREAM_CMD_OPEN_READWRITE_V2:
 		case ASM_STREAM_CMD_SET_ENCDEC_PARAM:
@@ -654,6 +655,10 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 				goto done;
 			}
 			break;
+		case ASM_DATA_CMD_EOS:
+		case ASM_DATA_CMD_READ_V2:
+			/* response as result of close stream */
+			break;
 		default:
 			dev_err(ac->dev, "command[0x%x] not expecting rsp\n",
 				result->opcode);
-- 
2.51.0

