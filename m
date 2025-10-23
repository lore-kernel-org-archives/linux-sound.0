Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006DE306B08
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215165; cv=none; b=lz4kCzGMxYUwzua2x9r/gvNT4lrN9MUw0h69CfJ86BURHL4Ky2Wg4i8uDZn6StuyrxQBqj1zn+gnSVX8umFvcyFSQzIlvnI6bQJso2UBQ0RrhxGkSFnK6cF9APoj+a4rAj276yQUI6rt9mAkdE/teQpCl1wV8GncxwaH9ZHmD/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215165; c=relaxed/simple;
	bh=xt8g4CkWUD5tNFuL4e7DXexZmzatqrNobgpEMGthfEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dleo3+RMuX2o7dL9Am3Zhab6feoHC4oyoU1Z8Qro/oAcd4eVkQ4NVsjUz0lMg+Bt/hhe5n6o3rp7E9muyjEHkh6+dfuo+DjSVjINod7jZCvNiU4LIfbA8RRn6Y9yrFGcoNEBEo9WSoMR0xnukpqGpOAVcPgKZ6Otw72A9zzKUBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mL0wYE2d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mL0wYE2d"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6vswQ020322
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wOyEzaoN+qW
	t6Jznp1azFKuIlaKA4mByl9VN5wTmOWM=; b=mL0wYE2dcg3zdMHZJBAlTA5hiNW
	WInhjP9s87NGQ1G5Tt2JpEJ93atbSoKMrUh/hm+FdnmewN75ZajdVAMStWEp9fN8
	h/EqX/W54xH0Ynk2DWQvb1L04F+XCwIdtFb/I71I/KfdtWzy3Qauyjre8V4zcOju
	Ae6JzHitP2u9k0SOCjaF0uNbmtU9idsukrZG7vygW0jesgxMLzAKFnimUSeweHGL
	H2cOiv63Hfn8O/K2scPzCmjF3UwEXCFWMG59cNvmQ5up9oGjXZtKlr0D4PNH2Pzo
	Uyaq3N4LaV+PHd7YKx2Yxk+bNUkqPoKDuNoQSl0a1vzHAcNS44/CaNixVcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pr8jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 10:26:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e8adba545aso19025621cf.1
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 03:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215162; x=1761819962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOyEzaoN+qWt6Jznp1azFKuIlaKA4mByl9VN5wTmOWM=;
        b=svXRWREYidk5po92ajx0C3R9P4qy9eXtyodbkrQsMNymb9Z/3loc7fTCsB8c1C6H0l
         hNwhJ+rTii5IZgPITxJ7e6D2y3q58HCC9PJ8+OHHZOfNeiXXQ8R4Pf6qoLFvFqwv8ZUK
         wObLybTc0EBW+LAqrAUHiVXcCQldT0deNzLYHHesobTs7K0GnB8xIeMBtSfOpTR9zP9P
         4sBd1estGzsIq/7pIGx0cAHmsq+wEmkRMb+cyjvZLCZ6pgnatasJ9jtcEox0KejGbKtS
         jkjmMsa97QUFEPrGn3ZlFuZANPDUWzZPiEpm8vlMbm/dz3MXnIC0AJbmAbHlMsbScbCJ
         v/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUUt2SkFFALrOFdiaxByE/h05KgEEPDORmvZV/cOc7FvvsGT9IwoLm42e6JVf5LVjPJucAmgxjaV1/ldw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNhCFFgZGsvM9VN+HJs5tJK+ZDF/sTjtYy10onxUc6d/JfUIhW
	UEDMS+7nJrq0PKYsgGsMk95u6gNZzqX0FtCA3nZODfj5G80cOAGA2VAeAwRlujV9+TwGG7hMz5E
	A3CSKwlf7GvA84ezJ5AyISRjVz8xsDAzQ0T+994FPcyIXzkvm0p/clOLsjubx0gNvaw==
X-Gm-Gg: ASbGncs0OTxtp3qYtL4aBCMn09ikUJRwHbYyMJjZVCMTtIRAvDtIktMlRhOQjRazAXL
	nokuHY/JRJTo2543djWSgkKdSx2WlhDuImtb6CSMCNy7hJZ4/OJVKOrY/dMCrSGOLDXsb8R11fy
	5IH8tCiBs1jZ4OJch14dYxjLfYsKBcrhbFGym42G0wkX9mwvp9Oatzn14TNU9Mt81/c9ySjcASX
	RbMsF5tOUM8/S1VxYxkthIqHOh39lseYYubkXPj5rTH7UXSUTqZv3GXLGQ2TPpyYiUiao4QHahw
	CLGab3szf/znRXnAR3eIsZmZmSgF2ON/Cj0fXFBsALifgLWghfydcrY4u8JBoKXyG4Ej1BNY3yj
	ov/xtux92NfbD
X-Received: by 2002:ac8:5a88:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4e89d1f1d58mr292503531cf.17.1761215161945;
        Thu, 23 Oct 2025 03:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUSOijjLnGfv14M5wyZrvWbp/YZECNCLSsoRITcid+nA4Im70rZl0l1Vk5yeIEAGTdk6BjIQ==
X-Received: by 2002:ac8:5a88:0:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4e89d1f1d58mr292503311cf.17.1761215161436;
        Thu, 23 Oct 2025 03:26:01 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 05/20] ASoC: qcom: q6asm: handle the responses after closing
Date: Thu, 23 Oct 2025 11:24:29 +0100
Message-ID: <20251023102444.88158-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX+3iQ91l52S4U
 qMx34jbeRix4jhQG5LTXzmwV01UWVtO3DghYC9/VC6Zj4xk1rww/mM2uvG3rxeXNMU5UlA6kelh
 gEItBQmkvNYFlXFVudyq5Dm/Xj3bFu/RRe8luiiROrUEH8HapP94Je8llZnobJLWEMkplTX3DKq
 y6vMILxpJVCzCr1t0SWQSGiK9OxYZgYAfOrjnfsZ9X+KVCBoCWrRkgMlrVgdigOcJxAKM2knGei
 QSvPuCzhGhGV1yeiS7r4n2D+MuaTyJBtRvlnvVekeCJWzdNYVksf+kSNoSi7EftdeTS89AOa3Zd
 nJrH0d0WnAvtmf4M/BfaOwyC9uruWsczcIrVUyx02vT8hAQBed7WBvhNoV4nc+0hSkH+xEePYhr
 KGgry9gJ6E8oAvvTHpsjuoxBisTAyw==
X-Proofpoint-GUID: z36LipFEaS_qOqP1aGf79FERltuhXREm
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68fa02ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yqanLTD2VdNSX0FXSJEA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: z36LipFEaS_qOqP1aGf79FERltuhXREm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000

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
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 67e9ca18883c..4c3315d4e27d 100644
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

