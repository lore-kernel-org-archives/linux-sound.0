Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD444AB97
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772467; cv=none; b=FZGhwA3LA98zRIMNYAvTP7liFK+TeCwylekcAJtD8qZsegQF2W3fy+piWVb1b2wHQ21Yt2KGu2quaJ4eOZHxdz7MBw0HTYItceAk4VtI01VQj+kNIDZT+78gP003GuLy43AgB10nlQJJAEjeF+1BqURdonrSEFjJcQYIo2kIQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772467; c=relaxed/simple;
	bh=NYbmgC2XRLkSt5J1CBdChQlA98CR6LLPtwW8E/RkRc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lGg7xjbf/7nyKGJ2Fos/OGDgjbCTuHuEy9ZKxouH8XIeWQ63mKPp3whTw2U9FJ2IePqVNXnRqHBUU0nB0hD3A7n9p6hga36kyQ3dFWq4TJ5/H5yzqJzj6BUfXy1IrGQmwASVy1tW2TXHh8+t1T5+sEyguWyb8dP6rOqPkYd4V0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu6BhgBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyM19Nm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu6BhgBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyM19Nm6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877osrN3657422
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 09:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wwq1oK15Jr7k+xNkFsQ6GLdQUS9QHbill2N
	kskuia9g=; b=bu6BhgBgp1p4nxAXqnGNwPAM3lZ9SbzeAaKoUrwW6Hqa1+pJfXp
	PGbVGX2d5PT8bL4xoe7lXuZZN3UhG7IuU1Y0FQ/OuZvRwdlZQDUKdFUyjTr8TTza
	c4e7Fywc/dQBjDoPmy6o1FUJWyLeaYidjCw91g099JsQdkt0TTsqAW6JmrnV8Xsy
	OitIxvPL+jYaySqwjxI2FnOn4lwTpjEUx5wMHXsjE/cE19nEAByBKQrLM0QC0D6M
	90UWEr2a8omZaFTC+NA6dwSkk4MaDqtqI+vKdPh3u5NfhYL5dgT5jzfwrMCBDVFC
	44ffETrZVsgjJu6fU+34qmZsH7IoVgxTKog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86rbtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 09:14:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9382f9430deso567947085a.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 02:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788772464; x=1789377264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwq1oK15Jr7k+xNkFsQ6GLdQUS9QHbill2Nkskuia9g=;
        b=VyM19Nm6kcb5d7Keuv3y01H8BodiVoxw9Fvx//gTXwtwK6TYkvHXa2JHT0VV4vRw5K
         yHuSyr4RSB5s7qRNmsThxE4lhkF7KeefBvPaNW+UQM5n2bqDT5pdfTtZm3oYq33gi4tN
         CXyuCIYQHyAZj3rjoLQGBh9/Z/3kitiQesAsbFR/2heyjVf5AK9gvybCNF+4gDRefw08
         GTGm18GPB/awWeMA0qq3FlxdTGE+WfiIuOHff9F5ShE+iEYJkj8Ak4pfCHscMafFyYqu
         kmqk+rgL7ivjOtNNK08vJtUC/Ckvrdqpjpvo6+5CEzT981NZycP917hGNMW+Uz2Rp2iC
         AP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772464; x=1789377264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwq1oK15Jr7k+xNkFsQ6GLdQUS9QHbill2Nkskuia9g=;
        b=pAsfen0NlFV6XOYzxXQ1AlaJ0G25Kb9PPUOxldNboXym2wuFueja5AHyEauKBIlT1h
         e7iAWx3gACzgOKD6bL8zfIuA1OZXRxkkmz9a05xPSg0Oaov6PkVj9xGPj9QVstxa33gn
         Fq3dAYG1OG7gzsmtrTv3ncqJsCc2BSo0WwZA5I4VZEu57XpjNYnIODlFQv3y+qsG8aug
         B/d64+aJPV+W4oYaZPk9fC8L+z5vHJHmk0OD7FiONXkq0nH2CjVvhaCeaGcY/mCl783R
         wmKmd3tqfalPDo7TnZMq4ja0hu3TaQzOnZeFSbuik1ZrAXWFNW76Di9lc6JZ4LpeRATe
         c3Ww==
X-Forwarded-Encrypted: i=1; AKwUvBw6+Cp4l9aZ7w2FLtiKV2B87bUdh59pi3LDbe40kdU6A/FSYyvdiHoOIcpPJZH5LCBcXCVzpa21pb6veQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kkJF5gKc30XhsQE2izP2Wcc9V2xgCLvkOHWsA6MOaN+kDbouHS
	zLumls4Nnf6d9hCWNKI3+/xOs8HUe9cbU3qDHUqYMD+GcZ1uUbxaXJItxjUFDg9VbJg5b5+GXn2
	v1ilXadQ+6j/QWpRrls0goBkfZ+9Ztl8LThxEHiWeiCHxZE8RiwKcpPIP/IJaDUk6MxNGpt29Uw
	==
X-Gm-Gg: AYBFou393ZBWp5URdDjXQ3Pjv+dcj/7KDinqd4Io5kcfMjFUKVDBhAKCGwoHRU7nt57
	H76wiofxRMXYgnl0jhH8LW8LTwCscl8V/cWxawsJRvDrQbQJ3GYNQyMN6wC57xoIxNsW9vpsyLu
	o/V0IapVCzswoQPqdO8hpCv0TILhtqYB64Oppo6mSE0llcejeeVSGu+HUhOgjoY6fKjAsPraqi9
	xKOC6LLa89Ra0uIjsrWqB75vO0V7g5SV6TPhSXcvrqzHM9OHxuYJCu3BYD327S+Zo0yZMotNyP0
	gDmVMuiRR5XQ525cIwEnc+sEkXtHluoAaqCqI/qh3BLvJHOFAEzXlFM+jOaNOJw7zQC5RaxU2zd
	+wVK8OBqP2vlThg==
X-Received: by 2002:a05:620a:aa1b:b0:92e:57ae:3a53 with SMTP id af79cd13be357-939802f824dmr2054857685a.9.1788772463588;
        Mon, 07 Sep 2026 02:14:23 -0700 (PDT)
X-Received: by 2002:a05:620a:aa1b:b0:92e:57ae:3a53 with SMTP id af79cd13be357-939802f824dmr2054854485a.9.1788772463139;
        Mon, 07 Sep 2026 02:14:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm15681665f8f.37.2026.09.07.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:14:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: bus: iterate DT compatibles for class-ID match
Date: Mon,  7 Sep 2026 10:14:21 +0100
Message-ID: <20260907091421.837917-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TcDLn9orrU2LKLY-2-N3TejSqoVfi2H0
X-Proofpoint-ORIG-GUID: TcDLn9orrU2LKLY-2-N3TejSqoVfi2H0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX6h8l/oHlR/CU
 LfFGY6V1WymXs2J/lDcYZBwntsbPDdzTLHcSQNz7ijffVlZGoOP8NZM+egakp+kODPoujtH7Jao
 yNA3G3CprEdykYZ6xYH3Yyt431mCOyI=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e8070 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FnuwY2gGiWojwcxyLPUA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX6La9veu+zVLQ
 pc4ehJi5j15ATqohyyQY194WeNDBhFeFJQJo5d58/QdniMS7x9kyrXiduLsR7lReuqRZzYjjKZo
 o7hTexk4SlT51YBxhqBwQ0VHRFw1sCW3kV9Alen8GuxUN3jqNEJe9v9j3fXMMmS8n3McigTCSe5
 AiEb1i1u039o6kb9GJtg0WN7JgCUBg5CfImyX9zmqw8rRrjG2uddVkOmAVplCq56W1u6V1dOto1
 RxSwTg626SHLZKlJRqxZOjyFHRn8W2ktkHBylsJiQhtCCvqcoXlPc1NPUCSCXKnoVbJshynrudC
 bQncKX/JrddGbtlUf+zYcBCpILia2HdPlPU/q1FOnwjrmkvFsAb4M2Paq2IoTFiYh8QyAcfPeL1
 kcB1rW/gweN+SH9EwDsZKDJti6c11FSane3lw9donlfv/4Y33d3rsOKI3LnXi//T0iAA+XUryW9
 jz7O0TxzSy3JiZIZ84Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070100

sdw_of_find_slaves() reads only the first "compatible" string on a
SoundWire slave DT node and rejects the node if that string does not
parse as sdwVMMMPPPPXX.  This prevents the standard DT convention of
placing a vendor-variant compatible ahead of the SoundWire class-ID
compatible:

    compatible = "vendor,partname", "sdwVMMMPPPPXX";

Iterate every string in the compatible property and accept the first
one that parses as a SoundWire class ID.  The vendor-variant string
remains visible to driver probe callbacks via device_is_compatible()
for mode/variant disambiguation.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/slave.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index e0c49cbcb1ba..a7d2938b031d 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -243,17 +243,27 @@ int sdw_of_find_slaves(struct sdw_bus *bus)
 		const char *compat = NULL;
 		struct sdw_slave_id id;
 		const __be32 *addr;
+		struct property *prop;
+		bool matched = false;
 
-		ret = of_property_read_string(node, "compatible", &compat);
-		if (ret)
-			continue;
-
-		ret = sscanf(compat, "sdw%01x%04hx%04hx%02hhx", &sdw_version,
-			     &id.mfg_id, &id.part_id, &id.class_id);
+		/*
+		 * Iterate the compatible list so DT nodes can carry a
+		 * vendor-variant compatible ahead of the SoundWire class-ID
+		 * compatible (e.g. "vendor,part", "sdwVMMMPPPPXX").
+		 */
+		of_property_for_each_string(node, "compatible", prop, compat) {
+			ret = sscanf(compat, "sdw%01x%04hx%04hx%02hhx",
+				     &sdw_version, &id.mfg_id, &id.part_id,
+				     &id.class_id);
+			if (ret == 4) {
+				matched = true;
+				break;
+			}
+		}
 
-		if (ret != 4) {
-			dev_err(dev, "Invalid compatible string found %s\n",
-				compat);
+		if (!matched) {
+			dev_err(dev, "%pOFn: no SoundWire class-ID compatible\n",
+				node);
 			continue;
 		}
 
-- 
2.53.0

