Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8F14266A8
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097553; cv=none; b=QpTLANKDggX0jN268F3IO7/PfJXWB+uyJkGAImYi0gJ7TpI9LAopEjrQMnESvddYbtmC/DGp1ZeqPkX8GwoYsSfVAjp2C4tLP21FgkZzuOEZ7nzhN6YRMX9qtHRJoTuX8jPiRx+grjNO/fy4sFZhussx6x4hSDK5a8b8wPvr3zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097553; c=relaxed/simple;
	bh=zL69uAdweI4X0y0Z+IAisT4rMg++38nfIAzKDgVfeho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcH4K1ZhlfHDPjsEDbvSsdQkCFmQrvguXp0EpxQc8AryQbFW9C1gUq+ktXCeVp/F6DBCbSIopYh5/dWhHizRRhMl+dwywa5nERiGg+uqLgGQR3ZC+B/zcxzqwHihegIxXUPBfzLeb7MTBPpMnz6WSL0cbcL21JfyZUJ6mCGUbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBfD8/ns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRXwQU+a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBfD8/ns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRXwQU+a"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBluO1297360
	for <linux-sound@vger.kernel.org>; Mon, 9 Mar 2026 23:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PTfKdHxXDsD
	Bf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=lBfD8/nsjfep7uWpNTtXTTH97LP
	adqHrnvrTVmVgz0lWbAL5VcrdHrI4FRTSXkiz+u1QcKmurgn/d88hHz/4iBBAoj+
	SgF0dP66UX7GP3KqmHq4FBR51A54fIi9wNxDZIo/awWFssBbLgEaNe0j8xL0eSu4
	6ohLKXiqBj9NRM3ztv9YLcdyDch7tWK3LyfdOBKXfoqDRIixooDyqouwjHgLJuOl
	Z4pMUTPjrfg3DUOyVZm3GPKNXh9IR5fH1JW8M+0dXX3xAhqbHxUTvP+UD3hMdiGU
	wmJYD7HdlW4rfeiSqQS1ja79m2ZdhWjJOgTQi0iWoF0sex2KenSTQG+ihSQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19nwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 23:05:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7d66afceso1295802685a.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097550; x=1773702350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=LRXwQU+ahVItUcd7XgXpLBKk5T4a+a5v6R6I4NCx63YBkMPsfSObF81oTrOp9iicyx
         EX5IYkV1xt3/rq6xrlSZKL1xf8Wt/x+iM+Aj2DALp1I0Dj+s1gTq0P9teJ6Qv6BiPEjt
         dgDHeQOLJnZIhSpmp2laI7BsJNlEW1f59plbJiL5roVffGTQvRPrb8vo1wkmrVzk2z8v
         RVE1UHlvuz73x7lVpOHZKmMQHJMZ8b/HuoKyWLA0poACviJINMqGokaD9KgCDuhdoQx8
         LFQFG4C9GJTMj1yek+rSh1WcZrZSg/GSn5mqePkPpMAH228P8j4IdekoA1JA4qaNeaPi
         iQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097550; x=1773702350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=G3G0a2Cl2oLjeQoYTwb4aksbOuI0oVFYnPdSyMRK0z+iMBrqMMeUBaxtp6aMdtO5yg
         60NxBEeIqCdgx2a1WmjGTKhsVMhOlxjQsM/lMN7ac1F51KkM5bQX3qH9IPD4mLtn9cMW
         0s5Mmq/wlz5wiWy+t71ZwPVV18VhV/LRA2HLFwnZXWpnBXaR2rNb2lo9VLy5VFjXJn5d
         rBqfyvyVNqH6INgeNxgSUU+3JFxad7bdigDYUKCy2fdRm+fu67fjMA316hC0k5Sdvvb1
         5kKx/jyZ3rQ6wJ3gLr6eeagxZ0RtW2VXNB8GB3GwWB3e71P/SKrmuIfjLfF/iMZOni0N
         yrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiDe/71dECIKn8w4n2MKUw96jSnVuZq4EdRBgVYGQ9ykuCtS20c1/ZQPau2g0+Qjc9P4Kdy3onsz9icA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPzNYJc8URNiJGVXLQycdCIR9hQ1EL/kAEa5dYJV6j04Ngbz2L
	dzVwwttFQsSw8PcxGwZTGcmIa45Hrfbg5aV/HYVnLbdvMSQDrHR2FDiQKKsBAIc4+WyDlMKKLEI
	fKe7B2P9OzSTvuBOrYguD0iLApKuaD3fs7fXCCcfxlnAk8ck2R5kGlAZVXVq3ikYBxg==
X-Gm-Gg: ATEYQzxyJrVZT7dOxYV+xfdLhR/c08welmlmGbVUfdzurmyYWedR8M01inqqXlbluLp
	yJEaar/1xnz/4zxozSOVh6zG8bD0Nil8AwMOA8gqeKkj/nPH9yEmgYT5JeeWxmxQyzlFoUTjL+X
	AGab5kfmuPPVgf/YPyKZQURsN6FCJxQ6wC3OLjRVpJl6mm5CuChq0s+DgdmTfYGNnt+uxr2BMLE
	i5qoGNT1MpkZQYo31FpXWjdlS+Dfvc/4CksWvEAM59oeyhs/YgVnfjFSHBSNoH5xp+52/o8aUms
	8WtMVGeXCqTiboOTceb+DJh7IIWhwdKqayZOjKjasoyaJtqKQDj7yHS81Dpz/GKclK0vykqQg27
	iGkEfPcHt0YHaJFYmE3JUwheB4IrJOFAaoWVrH8TN2UtIRfVtkQ==
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747206385a.30.1773097549759;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747199885a.30.1773097549238;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
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
        linux-sound@vger.kernel.org
Subject: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:31 +0100
Message-ID: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -toOo0fq0wvhF0s4XEdv-U4iOIQD0EM-
X-Proofpoint-ORIG-GUID: -toOo0fq0wvhF0s4XEdv-U4iOIQD0EM-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfXxDtB9Er8alnw
 HAkdOW7qaYi77i7t50mo8kY46ArJLm8FcozpkR6ZtcINA6jW2EJkHyuS3Q54xcn4mM87FND0pqo
 q8Fgq3GXBuADuXKLFnSlIDDAtJLauZWFK5TYrTPQooTOOj6jFlS+JkCWwoBdVOcpim+onyO0nyH
 tVnvo3/WANMIcdO7VRcd7kQPTpVYidQvcioMR/3IIywPZU2eVebiFpJOFUNeGXIjjX6qVv1kTeR
 CWE4hnsgyv+jGkdtoWyShifszZF0wOmoS20lYj4Cm41nZnytbjDc3SRri6TCDk848XRD21A3RVC
 JS3tjwboczp8w5MTG5NdCowXvPTdMK1u64LB2jwc0tSnXEe9vqn9ne/ROyEjaA71vpPEJwQwblo
 dfH1qOtPtm/ISArPxGkYMuV8N13bs9LLnAioP7/EHq2BnexvjBFoL6ZxkSb1CR5ToLcmkNqzdzq
 bKEDPv6DLNMxd88GAfg==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af524e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

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

