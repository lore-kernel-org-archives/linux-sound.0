Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9233B6F8
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870080; cv=none; b=dtjM0anD8qcQZqr6qhB+qULXhyUUXj25nOLcL8vXMGbhtM4qz9+VXeLQIOqZ2FUxP9NWDNPhUEmTFIj88ytuJqIxZ4g5Q7ePfNMjYlxpQBv4gIcbe4c4G1v0KGU6KjkKNIh17wh0VwKTy0q94Ury6vT3m4Dc8fZpRUn3Mm4meQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870080; c=relaxed/simple;
	bh=DFQzZINZtXFqVKS+d/H7Nq3BWvhDSfyQmYunncyvNfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Idp8Qqmni5Mtwr5szeRy6jIXr8qjKAyZsUY+EBLpRdh9xlOJvc1dzWN+Fraq39erndd2Ma2Sv2E9L2+R21oyW40s+OVrkMlyj851CaaUFoY36xM+RIOU8f9A+srbooUZ1b03CCutcj7i/KtTcRlmUs0ecBdXij/n4TiS4Kl5Y2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYrDs6DN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=etjOHkyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYrDs6DN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="etjOHkyZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRn0g1641598
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TNBgtOWdzqa
	N0EAZI+bdR9OoxF9zijtL5mpQAoIQbzw=; b=aYrDs6DNFPNEoEJsTwHNDDk7mHt
	YTg5WGu6MEbBrB07Bcug4w/m1IhfiiHDnPUIamLCYKetrp3eipZamUvHobO2XLNL
	yLUo//y5yyw15TDdV3DoebJPikN0Y8lEnep2YG0j4+eHhVxYcjMdiGiUxZuHumw6
	9phgdA0Sq4OBtQX7ynwM7cY/rnZREtlkbTKpUhCzzTCLzJTOXQQE3Rb5KL/W557y
	9A83GYncnFTSEy70aWK3e5KHjvWQ/WxkPVf6L5ENcPEFvafH4tYdcyVtTlGXOw9P
	kzaI2809gKYmr5cBftaTQofpmQx1teRcQrXZIEoXzYnJlLDGJ+XHCBkDLEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rb37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 18:07:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so3933870985a.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 10:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870078; x=1772474878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNBgtOWdzqaN0EAZI+bdR9OoxF9zijtL5mpQAoIQbzw=;
        b=etjOHkyZEkBNysLBkiaSMUGy1ULxxqy5u+BWXg31yUyrzFQlBCkKTXJsqMpwjYBEzl
         ol8EtuzS5R16Q/+Srio+lnRJhcfJ+YhaXFBzayYpo1xEMYVXHYvGjKNaDYkiV8YYrkiT
         5d7Ix7VBugG+VdK9AeFZMJPiWl3f289kCb1MKyseKS878prnv8z4hXi51RyaTG64jk2Y
         3qPgdBYuGpj4w5jxkgICGGAosRBMfafBLStqQOSZ0g5oQQfeeciToJxrexKpf4+5kab+
         KAuUbV981zd1pkqt8GFH8TU7OKHyb/LycLluTQ2unwbPyuS+bUnKPYx2fsi6BKl2QRzn
         Wuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870078; x=1772474878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TNBgtOWdzqaN0EAZI+bdR9OoxF9zijtL5mpQAoIQbzw=;
        b=n5WnzGlvis6ZlM4XzR5wD10t6wN3mHD1AGX7mmzSGfSIhzO4cPx7H0Y1+4iLHRD+xl
         XPwAglqzEmfLVz85TzmL20Awx0+iKHW623VB6AL168t486/O5TojALk2aOaC5U1xnKRX
         +6OGAC0xZioEejupx6IJy7xOZnlzB89MbQTrkAONyrG9hEAX9MVGoFyJeca0EGNJa5Sr
         TtvuEA3sCNa0BTVedSNa+FsfXkK1BqAtm24Q0rALgAGkhkbU0SfLqT1ChmqHPhoD8L8t
         rr/bQEAi7uE0BurdT8JH7vgDEkg4O1bNSKQg0hcY+WcdReh87y2GTeRPh9yLPRyQEibo
         EPAw==
X-Forwarded-Encrypted: i=1; AJvYcCVWCOqSHbuBAbcSWTmROTxFmaVK6HvOzP4TNP4NYFD2hLx5kybfEk7R8gcnJ282W3O0F3AYrZmPjSHATA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3fnuFigbZa9EswImJHxb2rVtSH9LPM83ZAgTLTPqt5VrwPex
	scuZtkIDM2k8xGXNlQYTCDXEJu7gC8oGMR6cY6wZHqRfVNaN9irqQKClfViKtsT1zzUaWU22YP+
	XDdH0hUYWUPDe0Y4G33gArRhJp1w4m26kjgpmOqztEFdHrehOV+jtI4FPGQ6Sw8Hv4g==
X-Gm-Gg: AZuq6aLGEiXX41motbNM6PGcvo884aknQXVMc6Fu22/UCI9c7k43HmDuU/GaOXJvvvJ
	7JVg1CIVwDs+TnWDH9e9x7Hj6jneNgt9kqzeyRJxqx2jPNpimCElYo/wiyiGDBA2kqMStyV4RA/
	HiNprKEXh7SJ53gjGMKFCOzGDBIaqnn5tpcvC+9ruQ/VJjVCaVSG+pkP5flF/7goKOCXvneWki0
	uHfeFz+JKyd0DsdKIVRiMVhjEByPyvOne0wOwlN4peAfODDPw+r6NaY240ATWJo7UHLS0BMf0I9
	+DG27oOlk4YNqEzxjbQD2mfkuDHVoUu9T+IihsNRcMrTlI2SIAoxknG0OhD90QQJ50mVTK9XoAp
	GZisqho7fcK6VNJeYEqcBdIEs7KcqVn+y1kNVo/tLiRWqKX61kszyOF4=
X-Received: by 2002:a05:620a:191d:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb8ca800d6mr1186629285a.55.1771870078215;
        Mon, 23 Feb 2026 10:07:58 -0800 (PST)
X-Received: by 2002:a05:620a:191d:b0:8c6:a539:55d7 with SMTP id af79cd13be357-8cb8ca800d6mr1186622485a.55.1771870077646;
        Mon, 23 Feb 2026 10:07:57 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 02/14] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon, 23 Feb 2026 18:07:28 +0000
Message-ID: <20260223180740.444311-3-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: dXedos-k0jqJN_Vq2z7PulJBepwpM_K5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX62CTEA3/0yDf
 r209P1fN/bpVkVpUwBvmhvvokQGO1mHdFfwdN6W4wVb7HWKxejZ7DP6o5lCVj0a8YdoUGMSQWwO
 q2OKlX2iMDX9V19wkE9/itXHVyCBYCOPlQ8u1ctzjBnNI5PQMDOlERKXWo8JkdtGxYKX+tDAPeB
 DCYqyhUkCqPa2Af2iofgEGjo2tZ/pTLKTBaxPCnn28VXKuVksOMeTvG83xMgvq6i/IeGMAjB7xG
 wfaYdtvEvRD7YY7/aOQRuN2rizGD5iLhv8Bz2qh/qSVAYbicQSKAdjJkiS1F8Mx1JZeANsuEHGE
 mcLM68peaVGKLnS1epw9GPZxac4Aa+Ot5vXLezJBF3PZ+wWyXJfspl3QQoX+S4MnfBTE3x2hzwL
 v4w+rFYLiouHa4ssGoxRK9Nb4EafnRz1zOZgNDa5rNLDXo8/6Mq9FP2jr5elyq5JF4CO85qSLPx
 ojsuX7Hp1HGDzfHO/+Q==
X-Proofpoint-GUID: dXedos-k0jqJN_Vq2z7PulJBepwpM_K5
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699c977e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vtfATQNByG3yFndO7KsA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230156

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices assocated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 9891e757165b..be8b205d42c4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -752,7 +752,7 @@ static int apm_probe(gpr_device_t *gdev)
 		return ret;
 	}
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	return devm_of_platform_populate(dev);
 }
 
 static void apm_remove(gpr_device_t *gdev)
-- 
2.47.3

