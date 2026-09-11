Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE96944F571
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789114896; cv=none; b=fsQuqoboNlINTq5m5+V6lnUcJkyt7hCsE9c4MgroqIsgHz/y8ch4osRI7i6Z09AE2Eoag6Db96YM//5oh5SbHOlYi/8xyCZwmuzjeyS8urD3i0Zlr+e1yDgM3JFyn9kjVf5ul9GZg7XK21CNSZ3GuZ4P9rKEVgB9Df3eW/afcmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789114896; c=relaxed/simple;
	bh=/uI/IonCsG0gCA+TuNsimYDR40/idqbcuTaTESIrhQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AyANZl26WA12IL3nN38M3uU/UkwBvExYbEMsLASO5dEZb77WIZF9cUV37NUE9Ccec3WiIcA9xR1CGZD0v7/nbEeBIpVY3aWRO9DQ1b3lJTmhLHq1sMHxHQpBtqmgvr1xhZQYfMqNgiBvLgWijRrPcrhIfnjeh25i2PurVyp0aQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtQuau69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmjxr9qr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DtQuau69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmjxr9qr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l1BG2311634
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA
	3vnSIH8c=; b=DtQuau69yqAaTJOLGxdFF/nFB9/w+p6GFDhZz97tD7j3eq/IZgy
	OdEKQK2X0y8/eu6AJB91O40cXxLbud5+nhbJfagMzRbrdqK8gOJqY/RnJKxtkjvW
	9+UFI9xjvSiOYuv7FEwy1muLVHJ0XTbvgEJ5sjf4/5bFMVQrYUCXBcxWsEqOgt1p
	Exq3/zKZzfl7z0QvRktEjDcVM26bs5IZQpFpBon0sGhQ9Wfm8XK+/ueb9fryf+iA
	IYj3c7urwV0pVCG0NmTevH1Q1S9y8ZKxiJ+LMwutlcEx75vi8fjQJQMe/xrDOr73
	Cu4X6rRHiRdcCW95AtdK878K0Ywq5rUBOgw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchfcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 08:21:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so92670685a.2
        for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 01:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789114892; x=1789719692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=gmjxr9qr0T49W3uBMDuaHpwSQUz/7Rhn1icsbhtZAjy1FQ8JJxs8EvBeCClMWoXQ2A
         6fR7IViRmDRmjBmZWQflgpMxZ/73milZYkUwwSE/XtbHApuzjDX503M7xUbniG2skrD7
         nmAPL/Pvu5rQmtLnAom8rMJ7lvw6Stw6kbBZNbLoRfLB37Q2+CwFGgYuTZ+vxS8TRNSs
         uGGBkN1obX2z5LCjLFTcfa+e4ICZDGmEK44eHdOO9UflcLYbU8OTRDsuiukU/qkNisgc
         u56uSqphj/lgMR93AL0nYfsBg3VMDlwnC8x7k/JxEpERS8GQI+P902qLz18S3FC6bU0v
         Goow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789114892; x=1789719692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC//AH8MdM789lRUxzj5I06WPe9fiOoh+LA3vnSIH8c=;
        b=o0TBj4g6YEP3cnKJ7TL9oj9SVX01DFxGMut0IpSD7rIUw/JM+xyz17V3KlBNSNz0mt
         GgJAYKQNFuMr+RGgPpV54ae1VpO6/lEknacoZG18APrGevomxxwvqfThV2oWHVI764fs
         qo9Kr3KlBWZQfomkRyDAHv/avQrMZzMXDuDu5erWb+7QcGWAVFHFeEkLq67VcC4xcWWK
         MHrDQQlb6GA2g9ZjrlqQjsiIXJOXBmoRGLoKSMb4/nLnUjnmqkakUiY43FyKsd3fOsy8
         Czgkty8p/6//wM8ByhFc+dVFzMB6p0HOFXU7GsioTmlDnPbdbcz54gM8yiNqFN2qg4ca
         y6bA==
X-Forwarded-Encrypted: i=1; AKwUvBzDPNYTyAEGdRPthprPo8X2vNzJpFkk3sRCsJVXTszq/41Z/FA+evUp65YRv81f9i5W7yOHoX/aMeD8qQ==@vger.kernel.org
X-Gm-Message-State: AFuF++l2ILim1vMrALArVnhxrJ9HN9CWNc8+m+Iw4///3M+pPDt6saph
	xs1DEAm9C93kIoBw3yjxM3jkAH0u07A3ItNmVPVi4RUsYKBiBZnZmtExA2eNwGzvuobNwUeDS0A
	CsStu/6i4SuEpog+nG2P7Nj8yxNyPgORTgE/8kse+obSFFRXiNY3RJdUG89fzzy4GpQ==
X-Gm-Gg: AYBFou00e/1R0eCYkjy0ypw+Y8EP0zzAmG31QlEW54FpgkudjPc6riWCcSSENDQSEg2
	TzZr1Pr9hHueWJkpW3LjyJ5FIrtQvpBgsPI2Tt3eueANynVw9b0naJVMa3Lgwk5TSvJuq16Uxt+
	NL+mE8r3r0aJE935nzKCRMDO4AZ/PpEa6uywe2WLyuHxT86aIZ9Eo0BRBMG4iOwyffB6q21NM7s
	FiSYyppJ+N7dFjNjilsNZ1OP+TSqL0H2Ero3sTSE4dtQ79u7acWwnT7rp/37YLuXDcnfUoLwrwW
	o50zjruLhvo97hjtCB6aJE80BRUDnvQogF06VX7BCnt2pDYRGig+IFDhFyCA130kvmoeKG7Z0BQ
	ygj8YUzJgAHWx3Q==
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387707385a.11.1789114891883;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
X-Received: by 2002:a05:620a:19a6:b0:930:987d:9cd7 with SMTP id af79cd13be357-939ea0e3700mr387705185a.11.1789114891489;
        Fri, 11 Sep 2026 01:21:31 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm4488880f8f.23.2026.09.11.01.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 01:21:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, vkoul@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org,
        yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        prasad.kumpatla@oss.qualcomm.com, jingyi.wang@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/3] soundwire: qcom: add multi-master support
Date: Fri, 11 Sep 2026 09:21:08 +0100
Message-ID: <cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3ba0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ra76rZe8w0pY-zNsRq0A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfX+7laJt5nHdBV
 /zUTUcPMh+ulKnxRmQoPBCdhyScoUxFItvEa11JLovWOLBkGJslrUmYVCp9j7jYL5L/G9kUlsVH
 rs5dCPMhHHaZVUnQgKcAZ1p1LdDOoagYGv8um2EUSN8HRqcXTbbsFfDL7LfIpDnAJAZgkkLGzS8
 4dk4XuPD9sp8BLsyp7VsJzRgq36HYfbA0RZvSpOM7EUUyxCY07GgRjsalrkP4bEv/1HNp/rh0RY
 l+dl/031t3APeNGdmRmHIDjplF7Y0EcN08DVWTKVHmN1RVU09uyi4TPIgVrUVtoxSWIlNFHQpzy
 PRDTBhAjQB5E3JuOCDWopJK4v51JL1/Zqd0F7oHCE94LuFNWuFWSGNtKfrzfLxFjRuEFRDLTYVL
 LxClDoIP4Ozu4ETXvnG9QvCWsbsPaHjOf1JR0FzJwsaHG/Jcw7BJdOcL4Gw3AB5BHVc3/BF2lF0
 p1PrD3Cxd1VD5EHOPPw==
X-Proofpoint-GUID: YiYNOQqW6DV15ajtDq1yrixvI-_AMsLa
X-Proofpoint-ORIG-GUID: YiYNOQqW6DV15ajtDq1yrixvI-_AMsLa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExNiBTYWx0ZWRfXwWkwfHioEObf
 KX1/EP4pBAe/h0caTRYtYh6hnXEC+1eG8vWcEd0WPsjyprZLTHG4vekItvf3n9L9QbsyyvQ60rx
 ACzzcNEFoN1KSYAz3UBfSZ9FbnxTeYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110116

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

This series adds multi-master support.

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 ++++++++-
 drivers/soundwire/qcom.c                      | 218 ++++++++++++++++--
 2 files changed, 303 insertions(+), 24 deletions(-)

-- 
2.53.0

