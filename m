Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6F63A0B38
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849429; cv=none; b=j2jAJQdEGA2vnUeGNelUTLQWGuLn2+dbbhW9n8L+eRTKXIcnSdA2XuIyOvO+7hQrLAcDd9FuBAj5sxgtZxnFYXwjVns6JwpIYGJWxjGCmfrz7IcRF/vMgVidpT44TwHtjwH0mOZyzrFNOYFDSdLVRDrEla9H/LX50qy/qL62zh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849429; c=relaxed/simple;
	bh=tSoqVBcdjZ9XLsjPwmhaNu7ExTKbisJ9mIS9i8jGyGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cktNNj/6hRaqi+FO4Heor6XF/uW/x3hjnl7dHegu4hwjn0MzcA5s7jyrVR2N49j67Q4vJSgCNG6t+u7mtk8LpQPfMvazazg5V5LNUT6bUEBqzka9Njuc8LVRxFJqBHCuDJrihUFj6yC3BP3mh4OyD45E/W1peU9pnZMWuoKkEIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOHfVmHO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMHSvjcA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOHfVmHO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMHSvjcA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LmrK1477802
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 06:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=laj4QhcQvX9
	No5sXsrWnCaCqvBpIf2UEoUbEBLdV/8I=; b=LOHfVmHO6H7YdNwrITG4BiXs4et
	frpXCT0Vmg3T3rTKNiJAk3PUWwYxWBc39LQNL2yhJu8qgG62iqK4m4Foh0LWcoH3
	Nu14rgO3PLJ53jzXzGZSEr2cRX+6TOqAteaY3nIT6y112VAXIrJDzEAcP7TQzbJC
	tXIhvfVNW1MofcjrZWqvFtWxppkVFrkkyjG5zhmeaB1J0WmvlECg+K7mhNhrB6sv
	ee7Jqx+0eNnjXHAGucnTZgcUgzfrMEnJZyYO2cGVaP62TwX4amiqDu0eTEJuvU75
	dX0cfCij+4LvoxdpKxZ5KqRICpqaK21OYH8w9VHprhwAaSVS10hU5IdQ8nw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjghmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 06:37:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso876178385a.0
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 23:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788849427; x=1789454227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laj4QhcQvX9No5sXsrWnCaCqvBpIf2UEoUbEBLdV/8I=;
        b=bMHSvjcATrn33n2KlBRYIrv5aXApe4sgXqHk8TS/76rYAqlJeuDlkq5i8OJ6A1R7xp
         /Xk7wF7W/GP1Qli0qcHko1UIYSeoqhllIZk7lEdQ0rxfKQ34ORCblsV0WDQYHy4wUUyN
         SdRwWRTcqalT3ksRfWYCxGsZsFGINGtcEj7lG0lYr3CGOB5hTpGwDkRys70VuJkLHxq4
         Alo/B7Hq/d2VrQcK9+r0aqgiX/p/lCJhE/KpdxellxGshOIJ/wrd5sk+kdjxXawFMbm0
         uThLBAddS8nnJfQyFWAmEQrGkmO5vYPLlJGtZrKPTFqYzVZw6kafCCPSq497Cs/rH/+m
         fHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849427; x=1789454227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=laj4QhcQvX9No5sXsrWnCaCqvBpIf2UEoUbEBLdV/8I=;
        b=PW9OJCSXLaUVC70V0w22OgT7OJhRD74NJ+9DKq2Yw4e3wtPcK4bF30HlaGgVk47e3w
         5NYvZgmePztGyIWliZOmBA8PB7Htar4zTRFkqfYCT2r4plZ3kLog/P/xz5C3d2VTSFBD
         JHmrwOrl8YJ6gmo4e1haWTYsADP3pg50pTDo6NUc/J9eYLvbKqQHAON3HHayGIMXfaIp
         WL36KuU+6NzoVvkwaYBvLmi8/9RFXsdOompOADlDSwoLRGB0KNmbUrID+lmkNHWGJ5EE
         oVBxW6ablPImKC8V0PewERFh9CwFrX+/4VZTwxXLp+fkMMZAzyxW/i+u7ENHG8gTBwSu
         aXAA==
X-Forwarded-Encrypted: i=1; AKwUvBx8Y1Dr9ohX9dpJt0umfWBWY8EN0Uo9A2RlKlYnGUoX/IJh1yoyzm8/5ay94P8MXZYmnvmOdCjqAatFqg==@vger.kernel.org
X-Gm-Message-State: AFuF++nkw6El3+zOtwQqcUS9507RwyNiF+ZPT92LsqTdq5GlZFue5rKy
	kM4V0zv8LNwJ5nfQKF9+QQY22yMndS/YT7OFzpp6TsQ2nSOG4azcD1h5a5RcMFJrW3Prdwr9JEQ
	4ibhEIkIm7XW2Hz3inOyrNyDt3KuDzSljsrVDbYsqhAiO4uG3Ywuxwd6W6eTWh0qupQ==
X-Gm-Gg: AYBFou0CERN8nbbg18nPp1/TCxnwGRFumW7tgO40lMeO8tnak8EXZzN9z42rKyIr8A3
	y53T8jD+94YM1l9EGJeaDZDxET5M/VxjoXa3DpZ5F+KSW5/KcpjzpOittnxqRlV+qb/Kx5hTPj0
	E7NKX45zr0oNe5lrmaXqSOiiHUlbPsx9fPSJdUl4Izdrn5sPVBixE4rEJK1WGy0Rel0VIRcBSld
	iSprjzqFNMA3vCcdRfs7mc49asqOyGaKlj5eHxDqoC4tZ54dQoOpBKarYxmozZhJP6GLtXJEOI8
	v9delsQm+F/LdLyMI8MsK4OT9HVXeJrVMjkIJLakvQMCBzaYo0JjtENAue9u1cV4xaG0smUQjLO
	TJHWAdXqvS4H4og==
X-Received: by 2002:a05:620a:7001:b0:939:492:20ce with SMTP id af79cd13be357-9398059a107mr2761047185a.1.1788849426928;
        Mon, 07 Sep 2026 23:37:06 -0700 (PDT)
X-Received: by 2002:a05:620a:7001:b0:939:492:20ce with SMTP id af79cd13be357-9398059a107mr2761043185a.1.1788849426478;
        Mon, 07 Sep 2026 23:37:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm277799675e9.13.2026.09.07.23.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:37:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: SDCA: make find_sdca_control_reset() return void
Date: Tue,  8 Sep 2026 07:36:44 +0100
Message-ID: <20260908063644.463819-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfXyrcxiGPwgByO
 p+S6IHhwIonW8cawrFcWCHmslVVziYJvSP954mqdeTQwqXuLly/HZmiwfI2mkcLVh0CZnQjxr0C
 FQJajEJt5k3Boa/dhUqewCD5Gx7VPYI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfXwpTT69buKXjN
 fh8OpCm5CMKB7997OvfFydY42Ct/8LDqO4HDAbdSFJF1fIeUHzaJ8d7/ephezpY7cYADVWc5T3C
 hMTMgxvw++KZ8feS/u4kLc0RxCZ/eEguUOUxJldV1qoZefQpg9MyR7+Y9PxOxrxMcJ818FcRt80
 IPmLijJtUrJ4R/OJB7R6tIxP2uC4z/ePxO4xMgDn3JJpt2Rnh509k5baywgtG47tFCTFVkVs25n
 mt28mA0efSIxPBpE2O9Km0F1cAa2cXCo31cAK3x25C6uWdKwJGYoMS8Ej3O8ppoNXZO1vi/yfF6
 Q3rxCpql+riKg8jM3ZCa+9g0cEoTW6Ivyzg8ps8eEpBqBK7yfnIFUz8S+ykHk+qg4BSjdh9t5lF
 o4YCRiwqkaZpD+e65d/+onB7cl34NtL69+zvkR4SZh/AnyAyp7ZAz5ev0ziBaBCOm+4K93HROPz
 oA2kDlY2BtJEWaNBPPg==
X-Proofpoint-ORIG-GUID: o4i1-MjGPgkYU5KtGFgsvAhaZBr-NSay
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fad13 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=w1d2syhTAAAA:8
 a=EUspDBNiAAAA:8 a=-Ca9_MJ7E5AnbNBKvfgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: o4i1-MjGPgkYU5KtGFgsvAhaZBr-NSay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080069

find_sdca_control_reset() only ever returns 0 -- it just sets
control->has_reset / control->reset for the framework-known
(entity type, control selector) mappings.  The int return + caller
error check in find_sdca_entity_control() are dead code.

Convert to void and drop the check.  No functional change.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/sdca/sdca_functions.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 30fa0324648a..b55e3ad8ea34 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -920,8 +920,8 @@ static int find_sdca_control_value(struct device *dev, struct sdca_entity *entit
 	return 0;
 }
 
-static int find_sdca_control_reset(const struct sdca_entity *entity,
-				   struct sdca_control *control)
+static void find_sdca_control_reset(const struct sdca_entity *entity,
+				    struct sdca_control *control)
 {
 	switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
 	case SDCA_CTL_TYPE_S(FU, AGC):
@@ -948,8 +948,6 @@ static int find_sdca_control_reset(const struct sdca_entity *entity,
 	default:
 		break;
 	}
-
-	return 0;
 }
 
 static int find_sdca_entity_control(struct device *dev, struct sdca_entity *entity,
@@ -1030,9 +1028,7 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 
 	control->is_volatile = find_sdca_control_volatile(entity, control);
 
-	ret = find_sdca_control_reset(entity, control);
-	if (ret)
-		return ret;
+	find_sdca_control_reset(entity, control);
 
 	ret = find_sdca_control_range(dev, control_node, &control->range);
 	if (ret) {
-- 
2.53.0

