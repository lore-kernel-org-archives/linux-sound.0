Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7DE3BF69C
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 21:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777584650; cv=none; b=Hk/hBpzN3mcbDEwtaH6nRCybpdJB4GE7TAnmtVarGgQzH0c9iXkRzzHNCfysAyrZbBYLDvEW4Uq8MphYwuJrNhpv4aV2Mi1f5LTgzW/TyDnLrTO+VeNYBfRxjdsObYRCT1y65E6oY4gqtX/3DD9111f2ZtfXQ5UL5/r3dS22qYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777584650; c=relaxed/simple;
	bh=RHeNGzFsaO5OU7c8ibFy6bhq1ZsmwbrnW3uotbi3WGI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=R0CdXukW4J2559u46o6A1+mMEYnQ7exgXzFCDn4R7JKrOTBrSCaxOf5Mf2jB7v3zmYa9EZ8Rv0iAKOgbYFz9LkU1M/fKW8P7pvSZfN0Jpz0T+B0rCWVceUSQpI4Nnhvb5EhCwZ2rQ9HxwGjp5pkuGPS6qAOxkWcnlPZ/s/CXJRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpcxtflH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emKwAZB2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpcxtflH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emKwAZB2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UHTBib088765
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 21:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=; b=KpcxtflHF1RvLzrm
	x/LpGvQMk5ePecYf541+Lp8GKCTwzWCI3tUaQt31d9/jT861bvBMMi9HGjm5xmoM
	KgIHSG2oqN7Pijvoi2gJCb+peObcavyoRWp2CndyK0uaAYwpNhtOlkjHxFAejEht
	8NK9E/6u2huWO/mo9rv144LFxvyF2M1GpNkhTRvAW1ou6aVLfr2qI5BNc/pdrlFs
	A/TeGctbIaGdNHLBzLb6Fz7sgiQtWqLhS4wsfBB0z7nafe2Iut60Xqaue90XJ7PU
	e2YlB0Y0ESBmg6jXoRvHEfU41E+JJJneP7mdyG2n8GynP9Q1HW05kXmKDl5d6zKI
	0foBKw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2u43uj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 21:30:48 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso2465986eec.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Apr 2026 14:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584648; x=1778189448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=emKwAZB2Q3ocaGmrn3kS31qr7BCaKbWGce8q1hylWtHnx3rGVo6KNp0f0GPKOe0M7w
         Tstm9JjC06CKir06dLt1LcdH1dP98bL399lePCQQ/vtOBpcnIgGB7tla9OVYppnXo9Yh
         sW7AAIJRgQVuUd0z1csOta940peYZcf9PmOqbQjN/yQipQe89eq7R7MrpPhEuFSmDpYs
         fqeK35bY2/xJMWWTzj7RNrk51UST9M11678aRoKYu9+QynM2nvC7zyO27vbnR9x3yZgy
         eyXp+7LiC9QH0IAaKvBriKpZsbsKL6QgZfCjSx3Fz1eii1mzLd+PCEAvOAJTNf3i+3sv
         4Ujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584648; x=1778189448;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uqZlRmb6OJxdMV/7RwJxD3OpNFk/6428iJHVPeZXyao=;
        b=Tt7neSZEBfY3XUp/Pdf70T+GT5WXBuFBWZcVXaucmgGaLGtmNH73Gsm5/YemI58iV6
         QhRRdA1UNAIsGwvGuJVUHQ1DchYKqhwUVCk9Pp7kNbGl2aE0LnWvnYpIl6EWDt+REr4m
         fOJrlCSiiIPbiRihCdFgIoWhX24GkioEzK0hPWsQEnUUkrC59X6Cjyg49oRgk5WoOoOM
         tH2JQjrDhoe00NOlboik8weHXFjSWDvLVzkTeZ4qx2w2dONnQ0jVJ25t44J2sIo81ygD
         1Rz3YYudOzuOFfmvrE6paQ6zNdSsOGcmx2+rfDHM/Nf2TfrOFuNUeYz3Pk+Ce6hClfB1
         Z3LQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SHM9zUqCj1nq+mjHr+0Sifu1cXy/hBoVbqf6nPcslQWCVoU6fPVwK+Q7SwfWPl/DAQkK5ewzLCh20UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpQalLjyvfSkrHeEaZjv7AnLZIzZbv+EL43hdwr7N7NgOHwHCt
	0Llv2SotRNQX7mC7aADZbRN+NsCzZzyvYoUuQUbS+lY91h4oYQR4A2MdjMGibQLf3hJPFRLHr+K
	cdK7hJFIYdMNPGqbiC+t3FMcaQKplnmCdtYc0XMR7bilAuPAKMiLauZQ/PmboE4kfPA==
X-Gm-Gg: AeBDievIS80rxZqF10JM27YYVpKsnPbRMGAU3pi3Wd13bacesttGCKLQBdOc4MRTZt/
	V7EwEo1kucHLk08use501rF99NffQe5TP8uCXBhUJkj0uzy2xsHDr3Enaejw7dE2S3z/0z4dWAB
	hjZLHcYzEOnaB6JouOATPNvtT4wP1fiJkczKM0AXyGtJPY7+JzJwGm/fDk2BdIUaPjc/daJnKIw
	1rLn/BzfUVJ8dwBWmK3KLvfdAhT2KW5MEAtJKDab9vH1mG88WIaPx9OWfwHIQGClOxklmXBAswq
	+mhcyJPwod/7eupedvEeiPvCjDLUPWTUSFfWLXJXT2KV7fDWX0Ow1TgqDUqhmcnoSFnDaQLJJIM
	rK/8rJVxB39890m6mhRvHkt9gv9Gg6gM4t/DeVGxm1L/7OEXdvSJT4wXlweZ4/c+g6Qu94eP4aw
	DtzgnmrLWhiqI=
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181043eec.8.1777584647402;
        Thu, 30 Apr 2026 14:30:47 -0700 (PDT)
X-Received: by 2002:a05:7301:d19:b0:2dd:649d:751d with SMTP id 5a478bee46e88-2ee87680653mr181009eec.8.1777584646856;
        Thu, 30 Apr 2026 14:30:46 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:45 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
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
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Use the QMI service IDs from the QMI
 header
Message-Id: <177758464538.1848985.4937106435944960092.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:45 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Ev/iaycA c=1 sm=1 tr=0 ts=69f3ca08 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pNJNIoqo8oUBudG6fy8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: -Oe1v5T4zYdJpDiDWluOOnow_8cCX-wu
X-Proofpoint-GUID: -Oe1v5T4zYdJpDiDWluOOnow_8cCX-wu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMSBTYWx0ZWRfXyZnr6UFFaKKW
 tuzJz5J0aQzYf1pbj8G7te1IoUZ8pPofNU/hM54LOQuNnwvEG3pze2Le2DUogEby3FjRaAm466g
 QH6H4/gmuCGhM5KYwvAu/Lcp3fepdWYM9lX1TJcRj0nbxE4YH/Xga+rsi01G2Yfd9fQ7kts01qy
 SuXDyP0g6SX8D+DBC5hLKmtQTdNnSiMNctlojw0EgEEJA3QIDa/lvSE+eb40LA5AjO9nQKPPLLX
 Yxw/Zzm0/BSyP7dqz3gV1vqD8GRDKOu8fbJg/yMgBnFGivTLoGvRIumQsrI0dcY5Av5Lnm3uBRK
 hAbsta5c9tHYTmM+GYCrpcgCMDQl6rVM2zHPt6/Ys5mfDhfs7juVQ1nt+wdj0Er+7iMPbDsXt23
 j3VfR+o6m6z+qRaU472xjLYY7IxZ6Z57d9dk1cg28A1z7W8ffYPnUIcqmu3C0hMW8JpsD1y3QGR
 QGnoLi41GNPKSQvEGKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300221


On Mon, 16 Mar 2026 18:14:10 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> The QMI service IDs are defined in the qmi.h header file. Use those
> instead of defining the IDs in the protocol implementation file. It
> will result in unifying and providing a consistent way to represent
> the supported protocols.
> 
> [...]

Applied, thanks!

[2/4] wifi: ath: Use the unified QMI service ID instead of defining it locally
      commit: 0e39eea57626e545c596734c0d250c1735f1a7e5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

