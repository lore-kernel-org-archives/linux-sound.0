Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481963;
	b=flJhbx+mq87bhH0KuG5Kys++Qx2cw4QTopavxdUnoiExoufgXYZFMGZc+PgmRgxHy+iM
	 MvROf7ehCzOueVI6UlrvCkWlAsrsJzq6lFBvdYwfdXLsQZ2DgNku9iOeq36I6nNzw5eta
	 GrgzVrXKWY+gBj7oVqPlWlX+omzwwshmx42xproS3VvoUW0NswNYciqWpOob3CBCe3XIj
	 flTUZ9RvoNx8qVLTgfdm/IBFBvlwfnKSVstrvHk79zC7NiPnIiYzO7w+2h6mso42wWZBv
	 fAsMcY9d2bkils/r6sHleXZrhhLeRtU01OtuPAsCMDsj0/PqWXdpQ/zwCQ49r0Ea3Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EyaVBfoPjvnSMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=;
	b=ICiAviVyRjpqicHy1et9VXA0UJpvRnAFLgddLdcZjoimeXPpL+cW29Wz3Zzq6bmmerpx
	 M32d52Pco6FudXEbbVthty9gZnRDY/HW0ZXTuLlGQRiadf+jQHKmpfiqdpJztMHamFC0D
	 OZBGjiD532H6q5774cQUOCrZL4m5MCGrMnNrsntT7x5RBWvxHlMZwG396teNrXHclnCdq
	 VCPDLv0EFToWTlX7edUAUKFH6V2QnjPv9Y2GYNSkg9kR+KDcnUbzSZc3QiCeiQztEuVDW
	 UsP+A8kqHZLz8FqA3vBcWWqCV7LLxbZDBwL8YTrYIc7tKjJ+mkMSEYv4Fne73wkzBdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHjw9wPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvmdGS9N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5F760A2602
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F5F760A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHjw9wPk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvmdGS9N
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tOLQ3807210
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EyaVBfoPjvn
	SMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=; b=aHjw9wPkBTJ0aaaTt7OQG4XQbHy
	ihAM7SSwPiPp9jd/PR4jv8AGXcxfeMcJSXSaTf6C/HBgzZlGhb9DHif6AUYHft0g
	bIDvc0vlrlRlOhrVNAM3uh+2o6gDtzfI/w4fZhqDHMv5b+btJWw4LadULgCyr6E5
	PBCWZlvUsXq6zhGS4gDwqgssG57HTYHRjMGdYHEeNDKf/Jiu5f49N1yK7ljpP/2V
	IAKDClWfq6QiASUVdco43Dp0PoCmOOHem0PM5qW/x6yV6VdtWXgSFUFeMZBe50e9
	yyWu5G3u3iRzttQGpXKVvfylxaHzf2Bkn+PssUyK6e4gA659dAoCCbIAAYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9e67-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 07:39:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso577727585a.3
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 00:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481961; x=1793086761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EyaVBfoPjvnSMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=;
        b=JvmdGS9NpB1g9kjTQzsSmjeZqIkXNf01wZGwpjexNip8NjFa1nFdpmpQnNrextELbf
         1Sv6WvKkfx9e+QjsjDONmJJoBQZu+uWEgDMlXS8uIRqqmAjPgvUT9HATlzw3jU5VSY9u
         CMSH6pF7U3XZJ9yF4VuNQsXrkRZrYTjQWrXYcLqGxt0jNf5j6rA6jnC8IPYx4175NpEn
         kZ5aOaPBa3BGMmjEgVc4ENJu2UtP1MwzM22wn9FbyCMX8YDxjApmHw3DtCkUcn+pkVIF
         BBXFLzJbMrsswtdTfVQRMF+Y5kXyPLQPsxTty8WUStEIsdwBdk0Gtu9QlTnlpSfV5DZ+
         Ujiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481961; x=1793086761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EyaVBfoPjvnSMo2Diw9nR7qJvmDk1I5n9dnvXC2rzQM=;
        b=P23m4+88qcsRDwqeXxyAEC5lcA4ZVYk/7omnfr/HsoZ65v3HOHyRwj2oRAsXR/Fi7C
         NMFpFPE1KRuA5Jz2VbU+kIj/Mdjr1aGEgiaPl2RQD8axKmDbDGXF/h0oUN7LRZahpLat
         9nedRELoBu4i/gXSG0OBO9sEE/rOHvHrqEge1DnlSd2WwKnSUwKXl5Ng51RyMhuXGtDG
         jwZKUVDmUNVHAuTCQF02yKQhmgD7CPo59s4xlcFwE+kOKZQX10IvV5yszJZdzui129x2
         HnEEtO709HCjP2D4uTVzTXVzH+cc2P4wdDkmc9diKgoRZtYa+dktZVW36BIW8PlyxrJl
         8YaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3SlCJufy4VZByqlkUnFgQsAXBv7bI1CP6TR1stSa2N2En3Wbcu9FPnLxDYshrukTSTsZrQ3/R3QlRMQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYINsBgeOKq/sDV68Lt9USjX+53h06R9Z48xrJPcVTQpkUTfTzrq
	m9lTjp0fCMwjGIY35bkdTXHchwSWNnrbq4GUUdDPB7OJgz2TdSRedeVqY+V9ARu5sSXxQHJwATq
	ziVdQay4zbZ/HAsVe1juSRQGzCnru+mcsL/s5jzg+yqTh8i3fZDGXAm3afC5qXr33fQ==
X-Gm-Gg: AYBFou0HaA60bWlC5uUH6jahI6F88iunGLMjDbBSJAOWLdIUn4Axj9gI6obvmXQ7yOJ
	AAfNVJ/jxs750vsBqzGe43vAqFnQwJkDpirWnhkg+CD/4V0vAU9KVM+O8Dfew2SVDFydDnse3Qr
	h8an/EleduJ0zQvVvRRIpGpL0V7BpVOJpHftwWHvFDDyvuvkKN2REI4k2PDEiVfI04e1wkwe4C3
	h+bRPW4T4rYJjvIm1wUQMYTFagAtRrnPkydT934jr8W3slOdMnBNeeRyuQbXgX8SXaVf3XB9Fcj
	+QwXw87mf8ME7CWVYRN3k7Hf3vrlcXI4pK/ISjnl9y6QxnERBoRpprfUHyiaVrkUMtqPFYZeXLT
	VxNop09p+BPSf
X-Received: by 2002:a05:620a:2254:10b0:93f:2ba5:170e with SMTP id af79cd13be357-93f2ba51e72mr983925085a.18.1792481956218;
        Tue, 20 Oct 2026 00:39:16 -0700 (PDT)
X-Received: by 2002:a05:620a:2254:10b0:93f:2ba5:170e with SMTP id af79cd13be357-93f2ba51e72mr983913985a.18.1792481950954;
        Tue, 20 Oct 2026 00:39:10 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8208e0sm4566271f8f.36.2026.10.20.00.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:39:10 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: SDCA: drop pm_runtime reference on probe failure path
Date: Tue, 20 Oct 2026 08:38:52 +0100
Message-ID: <20261020073856.1177749-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261020073856.1177749-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: vIWNUwvQZmaebI6L91xmeRSRlZ1kftqa
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad71aaa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7vtXEAv6VZJtN8Rt8ykA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXy3sMvVWZKho+
 PM+qtkAT+lIOkf3TFtH95wQlAXZxPrhG0c3LgDRQeZ0EwfYYWH0sC76Kd8Ay0ECwsYZgCoemP0v
 KZRBVBPTINdTy6e8L7rIM6hW6BDM9SN7cy1ZwBcx+l2lMPQgzUkT6BjCyWQXOpD972EkbR6tlKq
 WmjeR/fT11ljnvGKI1DlQ/q7VH2dT2V7XBlFNnlCbDK+B0vGLVI0d0Iyw6hZJwHGpNaf8E9kea3
 Mvs8EuJCkXSxA2MSXwIcBh0SIkYQg/TxY+SpoxK4XYX/0zp8HxMfzon9kn4LaWwvwX1dE7h4mfH
 ZgMuFgEXDdxrrNfjPpq5LKpPUx6yxg5T9UmK8A9UrJBLB2lZW1vJLzK1G51yABm/7FASM3v3doV
 8IsVWaZ+IiEdIgk2XKA9dLPFGkITB0qp0aj1gd8GwQp3E5BrIVFFMK5oZfjcGGGg/t9vdYoDqQx
 jDGGMvHNEs2qZwYZ5OQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX8FA2WwDGACcZ
 EcuVPJdq89OeVd9W/hvxe5qF2aB714PKCr4NGZv8jlb2yGJ1InSMPO4dHapZAbzKQf8RBFSduTV
 odRNPR/7mEUkuC3KezhUUkxg7MZY7OQ=
X-Proofpoint-ORIG-GUID: vIWNUwvQZmaebI6L91xmeRSRlZ1kftqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200030

sdca_class_probe() takes an extra usage count with
pm_runtime_get_noresume() to keep the device powered on until the
deferred boot work has run. If devm_pm_runtime_enable() then fails,
that reference is never dropped.

Drop it on the error path.

Fixes: 2d877d0659cb ("ASoC: SDCA: Add basic SDCA class driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_class.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
index bcc660aeb739..ca311209c6d1 100644
--- a/sound/soc/sdca/sdca_class.c
+++ b/sound/soc/sdca/sdca_class.c
@@ -197,8 +197,10 @@ int sdca_class_probe(struct sdw_slave *sdw,
 	pm_runtime_get_noresume(dev);
 
 	ret = devm_pm_runtime_enable(dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_sync(dev);
 		return ret;
+	}
 
 	queue_work(system_long_wq, &drv->boot_work);
 
-- 
2.53.0

