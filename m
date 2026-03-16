Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A03CF68A
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773681284; cv=none; b=rSVr4OSmYVIwPqboXaAX5plEEePVkYIxgxN23BmmslLm6XgdDEikHvMwX8/ZBGhN8RmMeBCjuk7a3wDSRA8sUjYmPy7DttwtVY/isOIkIE1mpMWKXBWR568YPZZlg2RXhKrs8ePL0r4uXMQWa+wWbebZnFJlALmsNPGV7j6tRBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773681284; c=relaxed/simple;
	bh=vBQ6tTOdMa9PYbW5txamAlvd10vFcBIuxy+lZseqTwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QDaUTOEkIyyZn5fuLhM/VsUvbt3QqdX8kFVuEIgKwLldrW+l2XW7zrt94FP/KjsjroFYNCUxQIMsa15WTijVnItpGUSrCxqkXgoW8/HTdx6FSU+knl9Txc5c8R9gG+rGit1SpHLXdvCBQrpJap3Nez9DDqNT94x7ubtRsJ02p4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DVsSgDcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvDC9HYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DVsSgDcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvDC9HYF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GCXBFB1622327
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JbLYlc4Rhba
	fmIWJaPEz85qHfWanHtwL6D/B5T51hlU=; b=DVsSgDcAKCTmEeR7blNUSxx/K50
	JpPXUhCOYXuK+aOwWkb5J5g+nEO9VT5fBX+8A+kFJiHfFYkae5jwOYz5xd2CDh+W
	zWzlQF6DjO9E+VAB5xGOEffGRrA7NKQsskBhnMhFhHMWdfJuESNFY4Awjhn5BLE5
	Z4zTDfL76Z1zQIRWnvwqMMGyxsEC2N7hYOU/0dATVMbpUIp+jxJiDr9Hd4uYKEmz
	GM1CtzSl9SJFqEuMBjmcv/KQhuJd/ANnR1xDVCrhJZPGDbk/16T3S+JSiMEYhnpN
	l84P19B96VJeN03VrJOLe+/Mz7nd3Yh2LwAN5/yGySj9hWp5vN0XahRUwNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyeh3ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:14:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81c571a5so3070543885a.0
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 10:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773681280; x=1774286080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=cvDC9HYFa9itb9N4t8ZKRqYhyJSuSSQDSGak0uu0Bw8CgK16aoUwpL3tm/PLKtL0dg
         vgeib2Z+fSgrHi10uZoFsCglEc4C+nxuGUzx9W0eikP/poHS4hkDxXJ04qRgS9ShZ9Si
         g8uiT2YNun+E7Xw4ieayY7kdDaupYco3IMY0fMQoTNM9uUOpKdwL5MtWX5m91f0XWAj5
         /bhbZhri3J9D0TQ4MeobXSe/U1r/hjlM12JWm3LLqgxwMbypWjwHGMerZVLzsE7kX7Zl
         mh4ylxrwAM/+EthqFmBmLixkWB5fArz/WILuGeu72MjTpO4c1f+n2K7ylBi+qYeBlUT+
         1y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773681280; x=1774286080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbLYlc4RhbafmIWJaPEz85qHfWanHtwL6D/B5T51hlU=;
        b=PqrUt6SZPQRFvOiQ77cOqYVjnaU7DCj8IS/rS6zXGQtipaJwPMx2li/ee1IoSNOr6g
         7jkActv5dUIL70UV4g8RbSTtF7e65tFbj+P9Zk1z3rr0a8CKiFAiybRsrrs2fSHxurXj
         zQlD3HOCELHeBLdHJtcmyXsZPYUQsYMfJ4Bda1iJY1Rev2paE0BvUy5gFrGTCY2FoWlW
         URdiVObpFY2031/BYXTHlXcfCsTw/6g0MioYNYQur16MqjGa9PXWIsexIBsJpC/XWnIY
         OJ6MhNnj28rJSYuhYwJabgYdb6iWdV1FLqxiGIFXQSp2q2BS9YTc5QnfxMuh6fk2Q+Ng
         3X5A==
X-Forwarded-Encrypted: i=1; AJvYcCWyWN7YdAboClRwun9wJxV75laHwH33Bip6q298ewQGEgqZ704PfIIuj0tIpVmzjKiSnqYsDXhrXfbWpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5dGaERRIMlGyXNnU2Ma0nACum1iHuQqNy/qxHJO39+eFU3xj
	6OgU5K1jXhQQ1HzMqAdev7vBuoCKKNzIcSnxHvTHlXZYth2uR7/pHfrLP32MezDLCuM8VFH17VC
	8aLdUn3a6ZpkVK5ABWrfajcUui9VkIIby2846gv5Wx+ZiiWhchuDcA2snrJxJvKb8oA==
X-Gm-Gg: ATEYQzy9C/UHGdj2QbpMR8M5y2h4pGrPp5DsvHA1tqZU1SNP4KNuvBOjIKls9o09QN3
	RpkjEulj+5LJi96ljn6sMAC9DXP5DBIhiYMBDngWNcZ/Ehp7HSqLDNbwsj9fbiF5Wc4jP1ATMec
	gGL/uxN/RlODhmyN0NEA7o0h7HW/2IJAKrCwPdr90uuhbi7iUkQP6jidemeftmjJX4eAO5rKhrg
	vRIeSQrJSjG+UlbiQ4HayH9o3Ov833KBP6yQvaEQnU7LEJnZ8DUb06yanRJwcsf0cj7LqBRkmsG
	cgh15GLWlLerNERY3X70arDX47GLnwsRo/K1AXdKkxJLzDuMz/zh+9QjqSKl0Tm0G9GDZk+kK/q
	AKfCf8LnDsqfMQtOLMAhv+VnH/nOFR6zpV2TV9slJAtlgj24qqg==
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859177885a.49.1773681279617;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
X-Received: by 2002:a05:620a:470c:b0:8cd:b2cd:10a2 with SMTP id af79cd13be357-8cdb5b4d4ebmr1859171685a.49.1773681279092;
        Mon, 16 Mar 2026 10:14:39 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm43860993f8f.20.2026.03.16.10.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 10:14:38 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Mon, 16 Mar 2026 18:14:11 +0100
Message-ID: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2aEvMRQNCVQ_Oe9atX8JFpaz-tKE6tqA
X-Proofpoint-ORIG-GUID: 2aEvMRQNCVQ_Oe9atX8JFpaz-tKE6tqA
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b83a80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEzMyBTYWx0ZWRfX0/dkqcYWzKD1
 VFjT3Uk3wmMOag2mEN9Tz10xCt6myNz7kS8lhLTkd7XGh6Icy3reomEfmD+KmngFJ7RI4s7S5p8
 6O60W+uGL8AAwJQYEG6GWW3QUt++cMR4F7YLQWMDu4JhZDE+UUv4PaL3AkJlci7U51bSfqk4Fbt
 r/cljRf/L7vnVkOfNAFTtT0HCz+9982DANTK807IWnaLFhCTPiwx6GZkS9n2aDqTMe9CW+KhQZo
 7eEt2IvSS7z6+s8WKW8y+fa9vJBFD9Vx20Ba+kXiTFCqgktodCDA0KWeBgm+pvQfpw7pxyg9hcA
 1T2av7+kmM3Vm7LsMXlDEAxjDqX+Juck+PZ3yu6EUm+cMgBY9oundKZsPmw1d1WPaHRuyJIMhoT
 HnVXtkLD6uQPWgslJ990ZGIctUl77aGYCwvbubsAZbiGpscQ4HpUExB51doALWSS7ChraOVipcq
 Qd11F0s5nZmbDGDyIuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160133

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0

