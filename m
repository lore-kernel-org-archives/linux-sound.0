Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683418;
	b=ivy2DTIFx9pSf4fPt7y9vqdHZxcCpTiK+RZrnINGh9BSHovEtTfglEzJpEQrR6Z6pfCf
	 oCLDotngiN2JRDthb8cayfKFRPgYaR3ktCmqmLQFmLmaj3v26FV5XGK8YJ1WmlHG3EfQg
	 Id6XHBO2Tpi07ZxWTqZ+V0iu1EIhTn93sHxuhe+Wiw4GWlK6nWBsDEZQ82P78gSLAYFNQ
	 mX5p7TFkKMsqhdgVebjHQK7levFnlUf02HlYyRupsEYOGGd82L4o3XV0aH+9bCeR3yUqS
	 C2uurGXghw2/GlVeSW+mXtDD/WwG11RCSjw/qKFsQ7j26xwYLAiF758pUo5kMhvS5pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UT7V93BmJFEXCnpajmA/sL54AJXKncbq80dRI3AFe6w=;
	b=J6ymSSN3TtPj91M/OKAVYx4jiB827ahZkPMUmo2Z5ZOkb/y3YzR1fPOOT5zfJhLjdFi/
	 I9K2S+Nf/6qwgUUXBC3f8CvURyF2MZYYUssGLTCVt1sxn9bNP1mlQF87zcTT+7lNjbdb6
	 ojPI77xBT2SKIQb1yBI4ywEdBLNmBtdTM5CXVYp41AYNh9F7IKzichckb2WBB+9/kFkaG
	 MsqgJrKPFDKaI8Pt95P8YTllp33+lwM21GxPy5K7cn/zIsM3vgWPLJJPeOav9ABuzBQvS
	 6wks8fv2L/r+uPUIJ/VQT9+7ixGVP5utzLP9ALxNe42uZtdSxhK5CFmHQmVqSgO37EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPb648b1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JLMvmlX6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5EA606A337
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 08:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5EA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPb648b1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JLMvmlX6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B5K23548364
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 08:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UT7V93BmJFEXCnpajmA/sL
	54AJXKncbq80dRI3AFe6w=; b=SPb648b1SPV/mhrmWjqGSGxPY0mJxEpTEJnesk
	qxr4roL7zxCCXsVq+DaR4DNzjl7/Nuz9Pq95YuPnIYptJ4ZLkzVidkAP1MrW7x+m
	Nb0mOGTFvSGS6mx5hVxhlqRKwO7cfkqyqwfLtWQKZT00SOrPYk1lQ8ZNJ+boyTH2
	77mKuymTYkCHykvN7KuncSU6Gh9hw83QV82kEfkaMorGbHQd2dNo0+A0xhTcU80d
	fpJzTW/NWTVNnWPvzSdgDgXt/tVgeU374kQe5Br6auqmRep5WqNQ9cV4+CXxLHmz
	T7HRKppavfk/Cqqg8V82wHq5Jt/Qbo94Qs7Q282nN35zzAyA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vau4rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 08:56:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so1016448885a.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 00:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795683415; x=1796288215; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UT7V93BmJFEXCnpajmA/sL54AJXKncbq80dRI3AFe6w=;
        b=JLMvmlX6QpQdd0nL51w333ElbPFBdsLeUE3+Pof4iogAVdWIV6q0lQswAvvzaTP1fY
         WJcI7dWgqI5zbx/TIpQ35UTncVKlavjACujBS2wG9EuB2t5QzquuZlLS2S5W1YviOoCa
         lkQrVgk4PFa7MpfZPxu6NqFznTcFyQouCiDAaaWqRVZQEPQQMJ2QEBhvbvVfGMw95SYN
         KhoHf96WmvTaTMSBJ0MWTaPjcYOky6aKf2Ow4e4aFhWiocLThkSaDTeh+f/MeLlb5wgi
         KreGKAO/pV6eH6Z35HTtR9nqKcsIHYY4NU5U7pYDolSzjVo+ScLuqh+UCU7hMY1e8sjS
         IkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683415; x=1796288215;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UT7V93BmJFEXCnpajmA/sL54AJXKncbq80dRI3AFe6w=;
        b=lcXAug7TnHIoBNO+pPDE1AtmwBWRKRikU/GCThTk9nuuVmsIxFJJMGNm7z9BZIMP+X
         2NM1Hd/PF8YNbV5lowTTpIHGQc8O5CfkGk8wwZwiH3MUSePRxEx6OklTBLcvKMw4wzfp
         PeCCRDQ34eIzDTBltvy9MDRlE1aD6Aioir1WZNnVuovby4qfYCbzTPqGFO490uuVsBmH
         X+H+2pvVhjnAUM39DNpr4eUQFRKZ9MYYojO/UMRVI4DBYHtjFbNOxrjDsoPY+fvBb7q0
         RT85GaLd1j8D/hNFVwhw99CbY6yA7krzUt8UVqoTOTf+h5Rd15KKNwpobXlyD5P/sGXh
         tx+w==
X-Forwarded-Encrypted: i=1; AL+hErEou+lW+laU/1jBRfEqiRlKx2Jl5QZmiFbCj/XUgP1pLE9zWGVI+gjzsP26ZJNa/vGF6A6skhGs1Sx1vQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+K6Jrd+Ioa6u35USShXjpYAZtHMKCUNJQiT+iIYFykMfo055Aa
	e4kvI7zz/8XgnhNXyOZ5djUmr3c635CxxxmaV/8l5yKWFajjBnk0MBCn0TKegRESExsYmtiKrgq
	ZgOTmVOpPkbh2AI7yYSzElyY6phnRPiartVo3+lF7duFAOXWYR1RRf6mVTIXj8sKsaQ==
X-Gm-Gg: AZFdTZdTrlxtdvhCLccztjE6VAgCmoq841kLV0hgtnDoikclqW5wwjfprjny5sYaej1
	mbyoRsr5DnpLgegvhMeycRI5yXWAH9Eh/tR5sUA6fNUkuBCWjFFBxyTOqQ4Dk4+HTIz9XVKHINb
	fNOa64z2rkBYyplatmtHx7cEMK2fWV6/1zCf5n6NLNde/q1zccDz8OAMIkm8t3RMUsB8hEP0JFy
	G3cRwDGnBHaTw3orIinWYhBS4SU7uasiIqg1pxuifq222SIT2dLAujNtT8hGpoVS2UQhAeLtN40
	vTe2DQjg32ng3E7KnCm/fhNV3vTvqnnxgnqR0VyaEJtqQTJQZ8VngHPy28SAHCx5I7YDwYkvK1O
	VhxsJjoLgi9KBM3OaTBttP5hqdVhpXVBSzq95mA3bn7A1R+vbwccKVUiLclAbsw==
X-Received: by 2002:a05:620a:29c2:b0:946:c55c:dcfd with SMTP id af79cd13be357-949ba965a4amr3395058285a.14.1795683414853;
        Thu, 26 Nov 2026 00:56:54 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:946:c55c:dcfd with SMTP id af79cd13be357-949ba965a4amr3395056285a.14.1795683414378;
        Thu, 26 Nov 2026 00:56:54 -0800 (PST)
Received: from localhost ([2a00:23c4:e5c9:901:c496:8838:86d0:bc8c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm615440835e9.8.2026.11.26.00.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:56:53 -0800 (PST)
From: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 08:56:45 +0000
Subject: [PATCH v2] soundwire: qcom: Fix off-by-one error in port
 exhaustion check
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v2-1-c424edf85968@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OSw6CMBBAr2K6dgitKOjKexgWbZlKjXSg5SMh3
 N2CN3AzyUvezJuFBfQWA7sdFuZxtMGSiyCOB6Zr6Z4ItorMRCouPOUCJtsCKSV9pSHQ4KrJeoR
 OUwPGfqAl3wMZA2oGcghZrlNZSMP1GVk82nqM2h58lD8Og3qh7rfKZtQ29OTn/aORb97f8ZEDh
 4IbLjN91flJ3imEpBvkO240SRysXNf1C+bVkTgFAQAA
X-Change-ID: 20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-47c0a8af1c5e
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4143;
 i=chris.obbard@oss.qualcomm.com; h=from:subject:message-id;
 bh=QSJ5w2mIIkPrzyPdlMwV2Dpxp0igj2Xpcy45KBhQiGU=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBrB/RPR4AcjQPcBdipmSDZ/SGJhMpqJ0xB4C6wy
 zaY6EET6FOJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCawf0TwAKCRBjTcTwaHBG
 +DBkD/0cG38qB7wvKSJkMqRLTtonxrq7X+E7yUkbLOwE2GWcxr16iparwoe9f0PUbhrHHEHAqey
 LRBgvDnNY14Z7mybu/h2TE6zK3kemGtG3RDA+TxXiBQ/+LqWWs1puRytu0FEaD1soH9nzbUzSVK
 xE+Ii208Zbg9FggPAs5jnF+DT+jNBD1G02yN2WYyA04zIGmMfuMf91qbcrcFu0WtC4sOJte1LTW
 4y3OxVwO/8mHXjJXMu99VzWlxhKpU66inSZcW4Nc1HJEOGYeQzDIw4u2J5RmsdFtDGNZx9qV5xs
 op/X2ZM9cOxom460YamwaIy5YuZC9rUfMyagxWgN05ynbDz6f0TDRkSJBjUqEKmCYq7kJvzarYj
 H2Nf88WXx5FqgRhydFwc+v8pmpMRV8a9eBknxzCtadVHHEznCavV7CTa1K5iOPbAQFGvukSEOyb
 onU9KubPz4Tzn9pviv9Mxw2lMqORKpeQqSCReh3s7GnfSykihOan3Zu9gPzcUeapcUD5vrQOEgT
 75ZIjMEpmBLPZ6swYEfl3kWaP+vZjz+eLqh/RwKSM87zhO/EuL8tCTFwZQhtX+qTiZ7++s6m8vW
 4DTzB3jlpkH1DiJh1YWz/7swNhujPtsp6xmAIFxN3/0UiOlGyQuhAhJyWIz/kWWnJFrLayRvbSc
 6zxyH+fmCHTZp5g==
X-Developer-Key: i=chris.obbard@oss.qualcomm.com; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX/nKGKro181oo
 gQF1bT/HSYk5oYWWVdsnLd2kUrJnFrZHCqpR5Dq5xcg/FCabxOolNxI0V86na8kcIAaY8hupd39
 rSV9EuC3kBkSHPLVf+dNWCiJ3StwfHs=
X-Proofpoint-ORIG-GUID: jLWOWphOjH65VXYmJz5l_aUtt4lpBZeu
X-Proofpoint-GUID: jLWOWphOjH65VXYmJz5l_aUtt4lpBZeu
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07f459 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A2cS_Xtm9gsuIjapY5kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNCBTYWx0ZWRfX3+mi8fvtqd+i
 FUNSbU7+29MDdkYRXOX+v76HB1f3/5A3eFUeAmVYCP5yqFyDjheGtXv7QuK8wF2R8Uf51UgKC+W
 fdopTN3gtxWOmHrwtxsTrtGTN0qapHH0PW+8qGUsEyal686we+K4z0V6RT3CF7kbLMEXzRP5Iw2
 +vPauuo8uNVDbRUa1ER/avZX2rsui+Uq/v6dbQaAyLj3M7sgeIOMsW0+CRj7zNc6SKNQFd2FpQ/
 wr3d4TmvDSrkFMWViFi1EVPuCxPaXPIMKSF8ExaAcxjAMqoZuAXdMWUX45khBJFIsQpBA2BtS25
 n+b3brjuzTHUQcEtM56GRfPA6OH/pFN74EJgETRNtL4iS8LW0TnHKgyC3Fzrc3rPiKrO0YSkydx
 y10E/OZVxpTEB4ZIxgY91zFRGMcjGdtzoQ2LTGcQgQqC8QbzPxKPVXsCzMFi5mE4JpvGPA2HWgD
 NOiAYLhYRi8MhybGRFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260034

Qualcomm SoundWire master ports are indexed from 1, with bit 0 of
port_mask reserved. Valid port numbers therefore range from 1 to
maxport.

Commit 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in
stream_alloc_ports") changed the port exhaustion check from
pn > maxport to pn >= maxport which rejects the last valid port.

On RB3gen2 (QCS6490), two WSA883x speaker amplifiers are connected
to swr2, which has qcom,dout-ports = <6> and qcom,din-ports = <2>
(8 ports). Each amplifier uses one port for playback and another for
voltage and current sensing (VISENSE). The right amplifier's
qcom,port-mapping is <4 5 6 8>, so its VISENSE port is master port 8,
which is rejected by the new check.

Since all ports in a SoundWire stream are allocated together during
hw_params, this causes the stream to fail with:

    qcom-soundwire 3250000.soundwire: All ports busy

The -EBUSY propagates through hw_params, preventing speaker playback.
Disabling VISENSE works around the issue. Speaker protection is not
enabled on this device in upstream, but with AudioReach userspace the
userspace PAL mixer paths enable VISENSE on every speaker stream, so a
mixer change alone does not avoid the failure.

The original fix addressed an exhaustion check that could never
trigger because find_first_zero_bit() returns maxport when all
searched bits are set. Include the reserved bit 0 in the search so
exhaustion returns maxport + 1 and restore the pn > maxport check.

Tested on RB3gen2 with a v7.4-rc3 based kernel and AudioReach
userspace: with the stock PAL mixer paths, which enable VISENSE on
both amplifiers, speaker playback through the PAL speaker sink is
audible and no longer fails with "All ports busy".

Fixes: 6ccec91c3535 ("soundwire: qcom: Fix port exhaustion check in stream_alloc_ports")
Cc: stable@vger.kernel.org
Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
---
Changes in v2:
- Rebase onto soundwire/next.
- soundwire/next now has commit d9ea256ee889 ("soundwire: qcom: Prevent
  pconfig buffer overflow in qcom_swrm_stream_alloc_ports()"), which
  adds an nports >= maxport bound on the pconfig array. That bound is
  separate from the off-by-one fixed here: it keeps pn >= maxport, so
  the last valid master port (maxport) is still rejected and RB3gen2
  speaker playback with VISENSE still fails with "All ports busy". This
  patch is still needed; keep both checks as
  pn > maxport || nports >= maxport.
- Add Cc: stable@vger.kernel.org, as 6ccec91c3535 landed in v7.3 and
  was backported to stable (Srini).
- Drop the claim that disabling VISENSE disables speaker protection;
  speaker protection is not enabled on any upstream device (Srini).
- Give the concrete swr2 port counts and the right WSA883x
  qcom,port-mapping from the RB3gen2 DT.
- Note that the PAL mixer paths enable VISENSE on every speaker
  stream, so a mixer change alone does not work around the issue.
- Add a note about testing on RB3gen2.
- Say the -EBUSY propagates through hw_params rather than naming the
  codec DMA backend.
- Link to v1: https://patch.msgid.link/20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-v1-1-81f1a4c9c73a@oss.qualcomm.com
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 65add9a74ffd9..05311cf639e4c 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1461,9 +1461,9 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				if (m_port)
 					pn = m_port;
 				else
-					pn = find_first_zero_bit(port_mask, maxport);
+					pn = find_first_zero_bit(port_mask, maxport + 1);
 
-				if (pn >= maxport || nports >= maxport) {
+				if (pn > maxport || nports >= maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					*port_mask &= ~allocated;
 					return -EBUSY;

---
base-commit: d9ea256ee889f3db9f0bd07ce5d114ce92e31b4f
change-id: 20261012-wip-obbardc-soundwire-qcom-fix-port-off-by-one-47c0a8af1c5e

Best regards,
--  
Christopher Obbard

