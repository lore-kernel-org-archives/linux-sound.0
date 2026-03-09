Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094B3624A9
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039106; cv=none; b=YES+DJZE3z0RHLsjY1EqKcFdA3fTWK0VOIVlPU2NNHIROkpzqGna8KJtHo84eIDX5C1LfdccFsvKc5l+D7hBR/rNCQo19YixO+GoV7pJPw1aHG9E9sSCMMoRNr5fV/G/L6UwV7/tWvOHz3rWfKTP8m/DzDfEnJ13DlNynz8ysXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039106; c=relaxed/simple;
	bh=fldykUob5Z2453rW/Bu+WyVup1MSOjtxkIDMh+tQ1tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZyzGApFQ418rgx83mXtRFvLCW4BCXUiftSCaQcNxuUDt4XLsu4Bt7/DWmStHGaCWTxd3APxQjeSSFgscaK+cBsxQGHIKTQKljd51Q+LxDY14joJQjC8pDaQMP0SAY0GdwfrvoA9ztC0u7dfW1akYQBaHQ0O5rC4E5nle2cONpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J7EJA/Gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MfvXRfO3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J7EJA/Gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MfvXRfO3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628NbCRc3089238
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 06:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xEO2oGNAYFh
	ISLn7OT5Tnbx10tCrKXxJuovsEhU565g=; b=J7EJA/GhYJBktUzKojKzKwY++/C
	etPbAUN0zX+9c+khiCB02NGge53Poe7/4Let2AdzSqHetqV+BSacX8LjbCr0BbzL
	DX2NCRvbxMOxKjMrUXNsNKvBWdMBUiA+dhvT9Em2I31EvbJLu7rYz2sJaQfFFq/3
	cBJt0Pdp9DiNn83xWLHw77/Wctbzkm/K0gGsxcoy9afa12jSSyohD0CSROIpK8EV
	TMA0UsRCb9ygjRz7lwJkk22QdFbYg9Wy388dTI1JIuWizn6PMm6r59+nK+eM74+j
	mP1vfZujhUvomuWCBQAE2dXjR47ZHVxyRAs7JCtEhB7PR+08zVmuDuh/iHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxv7y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 06:51:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd84943c76so583885285a.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Mar 2026 23:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039103; x=1773643903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=MfvXRfO3XANsx196vArNFI0PxHSDTf30d1MinX5STGu2wuzYm0/PY3nXh5BjGTX5aH
         ZdH4Zh0AMpiulaJAkNfBdDO/iXqbdgkb7PXfSY+E0wfnEov4v5NsJWr00KQy/cYwm+x9
         2Gl2ZcKr6FyYlCdQ+owPEJrKu0H29BrCDs4mS1YyWdOOhV8sDjBt8ONux+OiaYM7Gir/
         Jxx1QWkGNELITDzMI0yse7Hyfwys7P0yQYdTGS+MSvyk4sysLOE4z8GzFpQeqmQXLWS0
         G5wyGMmGoteb6otOKB6zriYP0O+9WTc8saM99PyxEqw10ugtlsOQJuULgRReF4P/6ANf
         19tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039103; x=1773643903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xEO2oGNAYFhISLn7OT5Tnbx10tCrKXxJuovsEhU565g=;
        b=CWSByCy8pM7WQUdS73SITJgEWMgdW9XQXVjDQQDZDgIckhXswN5kjuMgHAWmum+yf3
         Ds8R6iOa9tRKDAdwR04fk3+9AQA3c2wg6nZNhVFdoOR6/7UQEheo2vaUV421L3kYyTyF
         GyRTAoafBH3A3mrhhy8ejCkbeSEc5ow/tOb/HtEetsqhM2w2/8bpHauMpz13iwIIHD3W
         Krl0tej1lzZmm3xSbc0tDz65fCblngnbje8LkOGdJbYPZvFKJtWfwwqOpuyyANHeUZV5
         nkQyFOHFSjqnof8z9u6vREx3oE43c/So2YJef5tKae73uQ5X5WXkJ/tvXd2198xZuO2b
         Bj5w==
X-Forwarded-Encrypted: i=1; AJvYcCV+zaVn2Jz8hKidLkC4kOZGNrK32AbNr/8LUxSALCVVM5TDOe9sAYiD+0LC790dvW93hkqzve+E57HYbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/WWZJLBDDyqJz4YsxeXbjlbXFbzwbEK0SnuV6yJWFsyaXMbRe
	Ie7PhVaMv/Ol60amQ7wXkJnN/W6XVs8f7ofo1FW/2DV1TwGqEpsENdIHuZuEfYQQF7E3+bFAREL
	qMgjAFn3ZhO4bQnosKDl4y7N/PA6gJ4Tz5a4UsAJR9qu47v5szHHVQPms5tyc0xjhfg==
X-Gm-Gg: ATEYQzwx0G/TRiYLtqGjAWwjAuzg1JL1+hyzvVGZviZgI/0dLVkeBYmxrKkwl2Je/EM
	DWIN+kuosv3cVV4SJzki2fh/9Hp5cL2LTuFku9kwR5b9/o3zY3grsI6tyX1eK9uDKxNxWQdzT45
	lHqXaQFWpf8dRdvzCMPZR4w/u0rbZ37BzFRDeytAe0H8gbO5XoHmD5IsDFoRfXIPHO3zRvCXb9H
	l8SyWIsROYMUlgyO8u6OzsfPudkcN8cMtyBBjjgsjcTbtImTN46LeTsoMMB3nC5aFie/JDL+L1j
	YHWFzXZ/B8mMgNFbLIr4sVXpY2zOBQTeFtkkYtC2Dle3CiwGAKI6xWYjIXQV3JCPG4VQ6YcMFVa
	hEmwZ9J41P5/ksCiOqrHadfoXIKnIJLgsT316aLEenYn/tbhA2I1UmTo=
X-Received: by 2002:a05:620a:1a95:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cd85a1d759mr317508485a.4.1773039103131;
        Sun, 08 Mar 2026 23:51:43 -0700 (PDT)
X-Received: by 2002:a05:620a:1a95:b0:8cd:85a1:d136 with SMTP id af79cd13be357-8cd85a1d759mr317507585a.4.1773039102735;
        Sun, 08 Mar 2026 23:51:42 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v5 02/13] ASoC: qcom: q6apm: remove child devices when apm is removed
Date: Mon,  9 Mar 2026 06:51:26 +0000
Message-ID: <20260309065137.949053-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfXyMhTKYlWJpW7
 Lb8zNx5WDsnQk1OoUDbHQpfRp6w6/clQHC0rP0ku9bsHqh/ODe3zEfBeiw0gSG1UsqXgVPfjOMM
 E+c6XkoP9uQfuHVg/XtN9Z7tsS4a75cajqPyOPvPaeoYtb3nsfFzsAapGs5qQzhhn1EbzWZtsGI
 sPxo/Tar4EdLuNaqhe0cJeUtg61n+cP3kPnbzyfnfuLbBGCF5r0y5C9nW+2M35xYNVogs/XDy8h
 tnt/jp8YO9wySNnBdNxRhQMXeg56MTh1qYwjEerEtVCTH5z+K6NDbCuUT82200+CezKRrn1xthW
 VvNhIrxkHFmp0IsQucySHMRh0Uy7PX9KYxcSmYskb9JkBqILtOy6x676inuo7aauUvAMVpYfCfJ
 JAXYB9a7eCICl3gJovfj5JQCeOXz/5Ac1g46Odi0QdluHncIbRalCWIJU/PalxAlqBDqI0uw8hl
 aQ2wqvLR9gt2r/45Ymw==
X-Proofpoint-ORIG-GUID: hA7sC1IZpYQkJhUI9pclLdTHq66zHGqC
X-Proofpoint-GUID: hA7sC1IZpYQkJhUI9pclLdTHq66zHGqC
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae6dff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WbEMVPVtDBSXEMPt_8MA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090061

looks like q6apm driver does not remove the child driver q6apm-dai and
q6apm-bedais when the this driver is removed.

Fix this by using a manage version of of_platfom_populate.

With this change when the dsp is shutdown all the devices associated with
q6apm will now be removed.

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index a4c662be52e0..ebd5e3ac0366 100644
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

