Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2738F250
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849428; cv=none; b=HXJXKDz4+qVSRQr+4uTDql0xhivrWZFdL4r4lx2q/m3f2BB6jwOLm4BFdxLi7HPXg3r1n9rUCLRnbSsZFV1jQCk8knz3AJn7NKcg9udDGdlNkmCsbWYJ2MOIfyy8ccu+UvfO3dIdlZCjiv8Qe9Ez2GQNPNLv4l371kz+1TU1SqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849428; c=relaxed/simple;
	bh=lARc/goga3WxAbuvumLeJVnNOmElAcf2/GpBXHeuFKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G6y9AQwA6/fX2bJyvNFhhbsv2IHCVO5ohFC1l2iQ+faCaO7ehnR4grw0TvayolG7OGdOWuf1OitoWEitZ2yzMeWXYC/72I7f1V2H4htT2DmpK9FT6B9UYxc7m3tovMOrq5pocKdILJysO0QDy5OG02fZ/lGsVLdVS2BKJD2fmHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kOzjtwJ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JORg1soD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kOzjtwJ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JORg1soD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M3201479002
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 06:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4tHatCXe2oaN/qEuufOocukAtMlM1llSw+L
	YvX7luHY=; b=kOzjtwJ/E9uBXAJ2JUa8Ri7JRb6VQZcYzviTzw+/wdZYJMWea5d
	gl0N+fRlF85LODCxrezZ7bnAPFAP364M/cj9QRM4h79wJuBqTxV5JAKAIFQMvlUn
	rFxd8wDN9i1RXqYxOVg+3wD33LSsUoytDktLHZPTjUQjprezOsEVGS/bvczZl2JG
	pD1oZpqKy9eERyEgrwSsO++WEMSFYbBI4v19nZfnjP7wAhR8rx842za2SCfQSXk2
	IoOIKNs8szq48BsV8kSOKuM8+4KwbkFcz1zcN6kJt7tBi79/3zWE48c9q2l//66o
	zQ28mNWFXogFCcNChoHp9lBFtXUTCPf8i7g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjghmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 06:37:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso52044691cf.2
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 23:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788849424; x=1789454224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4tHatCXe2oaN/qEuufOocukAtMlM1llSw+LYvX7luHY=;
        b=JORg1soDPHWloVIF+EuxzMKxo2lsqglCQvly/GXvF0ZbVlCjoAyeTA4nRM3qFvvZxk
         DnIZqVzwWhTXJpDMioygpBMkMdlW1Xq65YkCdeBWsg6jUxtc3dI39sxpzv2XtvyIPTgf
         +UpqUSoBsj0rkRbCGr0tuTSQqVB/uPk4UjT1Ps3MRvh3vXysWGbfc0HXNyYeNQ+tLCa6
         70qeNUEvds+Qdg7iyKEXs7Zv1ocBY9ZZnfHImjOOGgKv5i88lnmr13CXDSnBEbpvcxwb
         2SosNnKf1gPQ0IOZ6Cs+3ajS8GFVXzpLU2u9XNmwZR/mgYjgxNj72fB4TFztFHqGhqYJ
         BTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849424; x=1789454224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4tHatCXe2oaN/qEuufOocukAtMlM1llSw+LYvX7luHY=;
        b=aLrJgoEaNTsRcApePSi3Ys9YABsamAv8KpGxzqSv4vV7crBUY1la3p2kpIZaze2JDL
         CUFZ4sncYuMup4/NKJ+7sbN3EPE1DZFVZn6VriMpZv6diDRqO7JYq0Ec7miaDRhQqKPG
         o6g2jM73q2CV0W9+ZtsKVyJOr8Pjgw0Hd2kTywJXAfEwF5twDarBauhtIAHqpNR+anPF
         0I4O1yddALPNC7CPx0eB7kSjaLQTShqkTPlZh9I/nufUt310p3APGWozCzgLFlCyDC0N
         r6YXWKwFHJZzQeWklImEHq2RE2BY9TGdLRS0RddX9cJdy/HKaalMtzm5zVhyNBS4XbV3
         lUag==
X-Forwarded-Encrypted: i=1; AKwUvBxgDLRcHzVLJ0PqvudKttQ9ZLftgWe8nhKMiTFoIfrBxJihoTosurAIkBom8P0OqaaaUVPXY5CXnaW+/Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nOvdVw6EhpZvKXQwwGogGy805kibiBFd/dcNw3mkf2wpSL2ECj
	NK0HO7gNsWteXKwt9tNfMn4nIpBFKJ/IaS7/IVaTNkT7yftrg787fKzfp/2M84Vyw2McCCxwIxV
	v7VZ4/SzludgysZvVYyoi1jojJpivTPqtMnq5PHVQfj7wjqltNR24iAvaM0jt19MjcA==
X-Gm-Gg: AYBFou05uINi8Hi8/+C9w/RfRKSks7H1X9RrQwGeCne6JR+IkWz9X1PqhS0YGFayLys
	KAh4Stbtym/NEr23YFIw1xMfPe0N6pNLDR1zDmekcLVIRMcyPacmLy/5hOgid4MK65tSkP8EIen
	ElUiKMeEOVE5HMm4kftSQMBUv5Y/d5klEHNdl7iFFDOUQhHBww+6Kp30dZ72VD0R5tYUk9s0WHb
	jFAY6HMVWCbzeJvSgEEPrbuQTuY8KDkTvop0qqqt5d/WVKJNDcA4c5y2mb1U+Pg0oHjoRsDiQvE
	XZHAwD4dBnanSyEphnj727BKNqerN+7yzM3W8yIUyxUR2jP116elJ1VH1X1MewZJWkIxYjZdKcN
	Rzao+v7ih10GdEg==
X-Received: by 2002:a05:620a:2983:b0:939:78ab:3c5f with SMTP id af79cd13be357-9398032452dmr2502819685a.9.1788849424342;
        Mon, 07 Sep 2026 23:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2983:b0:939:78ab:3c5f with SMTP id af79cd13be357-9398032452dmr2502816485a.9.1788849423835;
        Mon, 07 Sep 2026 23:37:03 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm277799675e9.13.2026.09.07.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:37:03 -0700 (PDT)
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
Subject: [PATCH 0/2] ASoC: SDCA: SimpleJack support and small cleanup
Date: Tue,  8 Sep 2026 07:36:42 +0100
Message-ID: <20260908063644.463819-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX7mTTLJEtepaW
 0ftbJCNXut8JLb0Dr+uFoX9cizb39quXUCvq3A+4oXL/8gLiNyG0sLQYjGQG3KtYYrnWXxSS4EG
 li95Ay7xd9+rB+pA7id5L/nNjU+6D1Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OSBTYWx0ZWRfX65CM155AW+fE
 mGi3kKoRO8O1+GsNFS3sSeeiI2LlkN2eiqm4pYBG+Rp+ecB3VY/AtpAb8z8/rngrZxFifeMS/Uu
 +qMwIVpItpEx0HktViJi9qKx6hKcu1IgO6stjij8fhGhmNxwNuaNqPfvgoTgcBO4sOBU2iuLitj
 JONkq9SvrbMj2BQfnWQ9TFzU/qkhaosbINiAWwnpcaIU5Su2EIS6iZhjSV8ER0b5gy9PJ1zTDQR
 mnO5GAVYJS5RRwFsH3SkhWcXM9IvvcA+hSJh6Q/K4kR1YtbqmI73227VT/FrZZso2C9/q2M/M7y
 tQJPaf83S2rV2FfEC3hpSLiU0ZnqgmOJjyBjO6vwyPbo1BACgh2T09UpkB2zIFz4qbtuyMIsZWZ
 Ynf5fgkLpATDx6ONXHb98aftdGRqgrag5i4lfDYSWj29eJhupz+1D4RKOfjNvt8o2WGvwqD+BoQ
 +hrexgInAKxkoBZCchA==
X-Proofpoint-ORIG-GUID: Ab6qN6A5vt3RjT0c7dRG4kyDG96ZGy-Y
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9fad11 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=q17wUVZQUpDMiA404scA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Ab6qN6A5vt3RjT0c7dRG4kyDG96ZGy-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080069

These two patches were originally part of

  https://lore.kernel.org/all/20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com/

As Suggested by Charles and Pierre am sending them as independent
of the rest of that series and can be picked up on their own.

Patch 1 adds SDCA_FUNCTION_TYPE_SIMPLE_JACK to the class function
driver's auxiliary id table so a SimpleJack auxdev is bound and
enumerated as an ASoC component, and wires set_jack for this
function type so the machine driver can register an ASoC jack
against it.

Patch 2 is a small cleanup: find_sdca_control_reset() only ever
returns 0, so convert it to void and drop the dead error check in
the caller. No functional change.

Both patches already carry Reviewed-by tags from Charles and
Pierre-Louis from the original posting.

Srinivas Kandagatla (2):
  ASoC: SDCA: register SDCA_FUNCTION_TYPE_SIMPLE_JACK in class function
    driver
  ASoC: SDCA: make find_sdca_control_reset() return void

 sound/soc/sdca/sdca_class_function.c |  5 +++++
 sound/soc/sdca/sdca_functions.c      | 12 +++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

--
2.53.0

