Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1149D316189
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773872; cv=none; b=MDIQm4C0Iq39SsqgLjeEVcJ3o76EcwpaRsYuw3g8IEgeCpWhOTwnJbniudIDJ5T6czbiWxsNJjrfVwYAXNQr2/HnQpBOqNhNnRud3IYGV4eCLCO02zCYfslFiD6vJIt9DYcCZh85likUHPsdtd2FKQEe3FY/jZbUFJJx/vX7h1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773872; c=relaxed/simple;
	bh=57vychfueC0MTVqTPCvkcg0ziquH1M8ssyJCiqhqLBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsiGNkUI3wQ8Pkg7UmbX/RoT96k2xhTgIc+koqIpaYNNPV6EzR6knEkSphdrAQred2Ni0CJ/YZPU0MQUW+fbgbsn6NJtvaxow4zgrbruylezENpG2/N4R1YRe+/O7nfrhV7Fh4/m/nIL7V9t+cQwmuILv6+JZZr3Q2ooJQFb064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IAna9ek6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VJhTNyJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IAna9ek6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VJhTNyJv"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeTn82554532
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I9Hssygm+uY
	xt39VNWVm2uPyzkD0gBQJ33IPewYgkKA=; b=IAna9ek64nCVwcKDgDKo8hL1dwb
	NtlY69Qln9Cccnr8z53KZIMqnOMBgke/rJN+erelGNkVyJZDlRSYsvgYWqcqryqo
	RFVYmNbyomviz+f44SCmE77jk4cy3dEu2pD+IQ7WsD+pOm+ByYkmD773edwd7DgI
	mrkRBhpsbIVQs22PBaFQNN+7VufnIAZHHawrVjuEOatgSbtK3ImT7bCKzQ6XhCeh
	HC5Tz96KVcJCAUGgl4vzhb6Fc4sbFNMUSIue3G0uEFZBWHIlyIV66b5hbcgAiQUl
	amjtALPTML0z4s7DpMoMXfaLwHDDUJhWCFBISghDxj7UR+h/dP1h7qrlplg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5b0bsjgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:51:02 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-636fce7dc8dso2193174137.2
        for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778773862; x=1779378662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9Hssygm+uYxt39VNWVm2uPyzkD0gBQJ33IPewYgkKA=;
        b=VJhTNyJvCSobpyVLNFHOtXOVZoPoNAQl/O8C/6pVwRnJLrLka804kD5oQUjxjEklpd
         3d/l8rqdPJxKBG+M5iDaueyDW6Ys5GsCR1QflImhUbA2B8pzxOwtowpTfLZIHcCA+X4q
         m3W3PMHvmFV81sFJv0y4zZtuYMJFYjD7w4G6JB+48Wn9sRJAXIarLGPkScJsozaOrB74
         lsFVyfbCHIry05MN6fCtIGH0XTeyodsvSeyH6CmsU1AVmmpjMXvp9jPXY+3SP8RLq89H
         dPmmodEFOoP9G0UQEDnJZ1C1hHDBFOvhyAfIECkBkZo67gvonLi5EAzyNBthR/83lC6z
         zr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773862; x=1779378662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I9Hssygm+uYxt39VNWVm2uPyzkD0gBQJ33IPewYgkKA=;
        b=UsvTBz0vsOypGAd9uvFRsFZa4wGHGP/rV8X+1klA4pcjnazxAEVkzpX7r3TKwmiGI2
         Xl1GaodlcsoUkI/HkP4QZzdZXkJfMsKTymlAQgz+HoGhMMCAuwcjLi9kRkIe/C/nc8UO
         HAEU737nlx7Gu/V/gtGetwxyVLihL6R4v1wZIxXDmPPkkc49IjaUc8FBF2fHhDH0NRLY
         mgtF8RkgVWitSculXWxB0RF6vnmasDNvYqmArbwBY3t6EtILpRNr/DG9XoJd2g5cariA
         W2xUnpE2IqwNCyZH3o+q9JZD2Yr5sOp66VWExieDPwVF3QfCWVqUkz1xZHTCbKO9TOAN
         kaEw==
X-Forwarded-Encrypted: i=1; AFNElJ+Lwi/gTdiwkEEfiQ3cItaQMakS01MxYnNkUoPrsERT43PnLvPXiuCby/n5DBDP6KTar+twTDM/puiCBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi9qJEfw/JLaMY+P/RK+mwFb6Bsiu+NXJB05DcGBuM1OmyZfY8
	taGCGSAxcyO3aQr8YN1a9MACmG9SV9ijQEBpx/EIBPjyHNm1NRhcH0mXDNnb5nxxq8LTtjcVTDf
	uAaxKMqKtOKNz4J9mwIpjUzHvI3Ci1L61ZXlNwBW3FQ/CkaQeMRoq4ywxmz8Po0p5Iw==
X-Gm-Gg: Acq92OESUaUgTAlVnGSjUVhpmT7suhyngTKaqF9j/8NMeISEI9qSsGYwI/58CR7Jgke
	FuEe1BDa3YorpicfC7KHYdywZyKpNFrs120y3VH1HyqdkO6PYmuT24MnhoVE2yoXUM39wv2lTxV
	74FuayT9bFu9qSNXGSXeF01ar620x/zwnRE6g/PeGsOFMvOm3q+DDe2htVogqdERy3lQaJWA/h0
	b4st5vL+wO0aH/SAj52tdx6ualMhEGfwrC1zHwlkv4ISZy0DsYtk+/X9K4Wg9zCWS8AvEIJI+w1
	E7FH0pdrj8rRYebFizdabf/wadD+X/LSc0kibgDdmDnn/4/SGtYL7GlnonRaoCVHYeL9q4GnKp5
	xE1sUlwk7ryxQUKm7FehEfL+8O2HIowA88WXoqaxjVxDvxcQcCAJzDrh5pn49TWkcjA==
X-Received: by 2002:a05:6102:c4e:b0:631:d3e4:efcb with SMTP id ada2fe7eead31-637740331e4mr4426041137.23.1778773861789;
        Thu, 14 May 2026 08:51:01 -0700 (PDT)
X-Received: by 2002:a05:6102:c4e:b0:631:d3e4:efcb with SMTP id ada2fe7eead31-637740331e4mr4425802137.23.1778773858665;
        Thu, 14 May 2026 08:50:58 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm6967067f8f.36.2026.05.14.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:50:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/3] soc: qcom: apr: Remove service from IDR before registration failure
Date: Thu, 14 May 2026 15:50:49 +0000
Message-ID: <20260514155051.2593354-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE2MCBTYWx0ZWRfX7I2uBWVJeERg
 /MfqrTnWVylMwiDHG7QHZmIOnBsBaq7Xly0X00LANYMnKk6eYe59ZWJLhFL1VrArnglW2zLTrGA
 Cdu+tzoQFkQIW9spJP6Vv6AKxdS7i3m/E7xHjZUVGEkH6OMGo655GsUabCEmj2oZ0rTlxj3OMFN
 /r1bNQFUZEVmU+H/B+Z2YKkFj+vkaVOlrl2/nRbGfkVOzpkgSOI38+LgmdUNP7zAh7x54B3dJrv
 fXzl5VTmlwNgBpPNLTUCdpDoq2LHIV+iNDhFoyHEm9M+T2paydboZASBnfsgcUGm8jj+JAcr+Fh
 yC/i0xdJlrhNr3Gm36wt9g6jWyONNJISHE3KiMrNM+wBuoGRWcEtlMYFhM6GkTzAOlHc3S+o2vk
 rE9+ZmACy4JyG+4enl5GhKcwKFD6IKROzoT/m5cYn/iw2+yVQT7HRfo9lDaqYHHgmGDNIKiwLpc
 t4gOEYhMB8u1JUZpNDA==
X-Authority-Analysis: v=2.4 cv=b+2CJNGx c=1 sm=1 tr=0 ts=6a05ef66 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fuhSPDijbYtawkcQ4mQA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: WSq-X29usYk275htxnD0Hztc4g1M7EqQ
X-Proofpoint-ORIG-GUID: WSq-X29usYk275htxnD0Hztc4g1M7EqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140160

apr_add_device() may fail before device register, do cleanup of idr from
global apr->svcs_idr list so that we are not leaving any stale id in the
list.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soc/qcom/apr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index ea7f83916d8d..127204c195ea 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -466,6 +466,7 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 					    1, &adev->service_path);
 	if (ret < 0 && ret != -EINVAL) {
 		dev_err(dev, "Failed to read second value of qcom,protection-domain\n");
+		idr_remove(&apr->svcs_idr, svc_id);
 		goto out;
 	}
 
-- 
2.47.3

