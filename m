Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F12396B73
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782199058; cv=none; b=T1kOBFPtoJOvi2p3JpGkQsv5IuMS/CWGVzSbg1IyDxePiilZueyFKD2sllI8NevMFQt7Br5rD+er0AdUy8ztbtpOLPehZbwHW5bYheJ9EqIqxsI5xfjZizifBWKQvRDE5TagEEIdrC6vdNxc9tuOM2W+ORdmlj0hJ6GIe0XQxCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782199058; c=relaxed/simple;
	bh=thq9wo4DnffvLwfPbwYBFKtMetFuKw6slUjFLdQaF7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CHbIVyVCNhVbANAjKz9AQl6bRdKp60zM/YMT6JE/omjKtWTo0hqW5pQ3Cq2Dy3JN3GNqdZfzvtXestCbrwWmVECp3i5zcXTUsnl4heG/u4DJmO3cLxMg2JfYfZdau2+qo1QBySztoWH9yJH/sHlDrUcmC2lkN2F/G5xnfm+4EGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYje8aOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Di2Dbzyp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYje8aOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Di2Dbzyp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6cbeh2992191
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IK
	Te+H4Ymw=; b=PYje8aOukzKBl//Dqv+xd+5OIdYVDgooBmXnzeT9/AmFHtHMsMv
	6U6H7l+Rd/uQGr1DijnEn0la7Ctkp6ZqWdeq0q05YI5jVOVLDh759ybXNATP1WUP
	QOwC94gp8Vu9s8sZbC6wk+374blmTRz4l/UG1EIN/CtZ13zDg2+Kk0mQf9LdzTRn
	dmh1awv0i5KKrQ8fkSbMi12krUtW5BKwXk3CmMLeQkET5r6urLfniri2sOJVs5oK
	MlsEn1+IuHcu5HAwmKS9BNcyIC5X6l+f2RNVki+5fJJCvhBE7DHhaZZBPLzomUnT
	qYqvhNcB5aGYRL2mY5FhAj8UtZZNdCgSpdA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey729u50m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 07:17:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a20348ceso61510805ad.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 00:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782199055; x=1782803855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=Di2Dbzypsb7vrwGFpHjLFvVu4QxyZavYqhRGaCSHB39m9TZ7C4j48w0fz7XwyXottW
         w9S5sgStwgLwRt9u1nRMwmmboctT0QGP76axPbGejJSHLeyEO+JhGcfW2WunBmyvjuoD
         BnX996ncbQIPvQ8TZQfL+roYRiLONHbv5lfD3sNW4QNNt3fuh6TRxJAW+FZSEX2WZVyC
         4XnQyFYXCcoAWiDh5IPN7G1Pfsp1GOk8TWUMR/js/v8FkwOwWnOp7xNSb7NYM7sFr5xe
         ueQqXuSbnzS5OzCJCdcfA3QqNVrkxm70rWlDJG+2vJ2nlc2IYva3QA7wclYqB4kDJyAQ
         1JKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782199055; x=1782803855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny3IMUpPlVWGWfkNkYBzSUcjD2sWlp5f6IKTe+H4Ymw=;
        b=daXgVJkr8SMw9CeKSwfIc9/pve+AjsZ5WsmCBLhWDT3z1PAOL8nGcDV5s1XXvVTD6r
         HzEGtWLaFjEzei9i5yIpnKTvEtyutKIK4Y9xQsaWhOokuPiC/P/+NNB87DiUse0H1UXb
         DcicUfjuTp09V66whGfBlxsxcYmECXhcdcZ3i9qzx+3zy3puXR2RmFduEo84VD3Mr5g4
         5vsxtjSGLOUYKIWRkR3RaMaDFZaVahjvT2G5YK6EqqWGzXdaonb2H4ay4P1uhjxYNDhy
         8JEOsdOs11Xt81InVFFJZcO/MjZnVJZx5i7vFBimyJi/wSgvAMd5wK5lDHCxg1pLFwuX
         4AkQ==
X-Gm-Message-State: AOJu0YzGmBOWeCaV+nMFfG9ALYSM1b3v7ZzuR8oXRg/0M8OK2TWk65V+
	O6E+hp6w2hXG20bOm9xdVyP5OxwMZthLRvPjGprUmhvJYbj1b3KjUH5Wg7BoUJF0QV2wqBZck5F
	ShGvkIn8NggUs8FtkNif3RDvGEuCBYMT+EoqBSObFavfEnwLGOAuajWYQqo3fnA6/1w==
X-Gm-Gg: AfdE7cno1tDVhWdJz6cBFk6ljykoKacIa0flin2X11KXjYuk4fYQ+Q3GcaSieut4y+h
	RACR5IVXMVb3A+XImcOlH44qwgmoAzkKb9EYJ9+ZXT6ayv3rFCY1S0HxXAIJEUl4uhutVUeiWwZ
	tD6ldSazmhla0VpRiTW99Ro53g6iw61K0GaYGxF2MTuCaqO3eOtiaBibtqt4FX/aep5Q7XVAKGR
	Pwip+yvETZaqW4/mapciVQ61DVGw23jPnj4k8puCgbQeLpxFBDIlCa+mTupSIMS6KhXeYTvhTeG
	c8jya0NDLPwFFEbgSS3AvyB7/10oE83bg9a4X6hMy8dr6eACTJVDFgPxoqB7EK5hAF63stolTqE
	l6kMXMpllNMY/NGvppYYGlGaOXJXxD/JbZ6mMpkc=
X-Received: by 2002:a17:903:22c5:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c718f99a20mr173888715ad.26.1782199055287;
        Tue, 23 Jun 2026 00:17:35 -0700 (PDT)
X-Received: by 2002:a17:903:22c5:b0:2bf:9760:b963 with SMTP id d9443c01a7336-2c718f99a20mr173888515ad.26.1782199054853;
        Tue, 23 Jun 2026 00:17:34 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7437002aesm99673535ad.37.2026.06.23.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:17:34 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 3/3] ASoC: codecs: lpass-wsa-macro: Use devm_clk_hw_register() for MCLK output
Date: Tue, 23 Jun 2026 12:47:08 +0530
Message-Id: <20260623071708.2822269-4-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfX+YKyfBoZgD0A
 yg1vtSfDp7ZqlBHFMISP77RRTXoVT2jpxoAM14nDs5CYyINdapVzbQAaE8KGaa179CGsWdqgSK0
 swZzJb2NxiGBTQW8PxoeuO+s5xutbCU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NiBTYWx0ZWRfXw8rsIRCTwDQs
 4comA78QGMmYGZr7hlLReoCg8yC82BEHbjBrS2BDGc3DIkw5oucg/EXsZF4PJICpbuAGXIRlTBr
 Xi2KFpKxL+aWPLI1gpZXzqQXrD8SIKXxDSsmd+G8nptxt97Y6aAvG09iJNHmjCXGG2lsqXmzEnx
 BJ35qzpt/pEj2OIDnzW8mjA6v/wstbB4aFeu8kPTKLXOeP7tN0WfkEkXlz/m2aPLTdKn4Nlc7da
 xHXvY6StWAh0NI1kjBJVi3ScHaBfuZS1Og8ebF9Dv0lLpeN+Qg/nyqxqh3YvTpLCTZGvwU+GqWr
 kMG1gCJdkYJ0jyGL/gwGEoRsSg25RsPSnKbvqS16QRQ6/s6e4iCcrHqlOepStWc3BWDWDPBvRxM
 xwACPBD7D2yRXmuexJRX8DV+LMuuttQuacRt8c12fx1yVgURvmHOtAjBAES40QeUUuP6tAdqkYs
 HESV40i9PLR+3gM4Jiw==
X-Proofpoint-ORIG-GUID: bQjgt-fDG19IE78qInbWokqM6lBFYKhE
X-Proofpoint-GUID: bQjgt-fDG19IE78qInbWokqM6lBFYKhE
X-Authority-Analysis: v=2.4 cv=eN0jSnp1 c=1 sm=1 tr=0 ts=6a3a330f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3zrE_5izju647JJH3MQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230056

Switch WSA MCLK output registration to devm_clk_hw_register() so the clk
hw is automatically unregistered on probe failure and remove.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 5952bd6638ae..97e917338d58 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2658,7 +2658,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	init.num_parents = 1;
 	wsa->hw.init = &init;
 	hw = &wsa->hw;
-	ret = clk_hw_register(wsa->dev, hw);
+	ret = devm_clk_hw_register(wsa->dev, hw);
 	if (ret)
 		return ret;
 
-- 
2.34.1

