Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34F4405C58
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724428; cv=none; b=AfjGylFO7iI3M9VNU8mnI9d4E63vfYjHt6fFM+gKIGTyUFUb3PabQDuWopH6+3s7nitK/TLzxcMEJxv2uMdEd0AmA4m93oHMDKHyLifquQpcALGea0OXvmIvT2BF1HeHWz1nVPEJHdqdasIhAjZHYVWcR3wkH39V5ok3/+cFTnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724428; c=relaxed/simple;
	bh=y0PJDyn5BtOol8KVSo5zceqlnjltVLUQGrxeuNwB+wE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hzo3y8TRHmtCRyEONAWub/QRTUeE0sAWdAhZaKaEkqs1b6GCrhWzCWdTIB+UGGGWzoLwvIA7W6cWyYDAtLuijQ1UBV5aOqFQksfDQpKUyDJhKjVfBQ1z9c5mjjGuNOWx+jSqUeHB4Woh5E1SinJEfZslNXlG7iJkykVjrid06yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cejr7DNW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SzkTMnSF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cejr7DNW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SzkTMnSF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91QW52400938
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=; b=cejr7DNWhZEH0b4b
	znkSo96hIsO6dDYQWfJ8576Gf7MAwEr/pqbsotQIRB8AFrf4Mxh9BT8gkaAkdUD5
	dpvW+UEbT0ACo//EVQ3r6K1qH5JQZfEcEXBTHzPGKUMxO/12ItZmXxDEP2Vc1wM0
	vkdRhJlb3sbgETbu+C7irkyQehfu/fQgz9AzLdbU/rwcY0r8FnAuf+yWmzmMHXhT
	Fd1yVRYlEkw+OrGBVfRZXEg/DVE+38M4YVZ6Rp7k1FfsFqxwcxVHEtTwn3cffnyx
	PK6GfFuDR97gVlODkbnBdzMUTK0oudEiqK528VXPciKcOdMa5ndkl62VTdcv5iou
	gaKnsA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq881tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 09:13:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so666782785a.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 02:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724425; x=1783329225; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=;
        b=SzkTMnSFOiLu9zc2/FNJD4ff1zS2nvyqlUCjcSJVacwYOkDSyEYABuJEnH2V31ryVZ
         NQM1sMiG+EqliY+DRgwpJ8w7+9Qmqr0iBrS1DbSvP2250ngrP9kGjCaawTx76HlsVJ+u
         iulaPNNMT9KOo8rhbmc/iGmL0Zc/6WpIlBY+YBicYGjTlDxrWY7G4yaMKBliM+8JJhgT
         1zXWi/Wt2EDlzGqiyPHOLkV244LuuUyrEx9LWJEPsVmc5Go90couhAY8PLcuPVD3sk57
         82IHLtmSp4ynOmUkmJ9K13BH2RdpKwM+OOdAmWc0AdKtBxxT1yzTjBZvWXRTU5v1I5/q
         EsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724425; x=1783329225;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/bwPG08eA+O+tY0emjmLQ5tYr9hdOkJorHPeq+vKX9o=;
        b=qMDkcBuFlOuGt3+BeYi3c08x/zWwMQrbhBrAQYljiYZqaZ2OZKxGlpGjuD3WbA4r82
         WgiUZtDLS+Mpyc7p5KQCFVGZlPI2PPSsgA2Dn759Xw494OVd8cpZrwSm5fuuHvke8unw
         qVKQfeJSf/SGSrQKCaydC7mTiH9siuuMaEMqnd8YV78gZimWmpQ4nX6vtPrLyjcCj+yd
         P2j/0AXnw+5nbjlFMajN7mO2QKsIJx1YZBpogbHDhLueLsmHf402FN6U4wo7Fr8vSzFp
         81XgnER1uRQNEEHnLzkMC+S+QlxFieNCHIqFYT76u31YTNZKIsk1mOktLUGO3VN2CXtx
         pyMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Dzh6X5GmpKfofclD0v0yEhsNpPAvaKvTdKFdYzm7NIpUKypNzplgqv5FDHSQ3pRpwC/yBAfgM3yk15Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyudOkQmU1DeB1ndVGDS5o7iJkfEpEpH33HEHcDiLGuVFOOdP5z
	oGYbASv9mMCCdFPoITQw/wM2sHzwN/qBf7AnxzagRd5kiYKzGiv4N33AK9FE+llscFB2AqvyET+
	/+4L2w9WsnUISu2ET4NXV8mhyeQzluvg3x7iBYgCXFPjmhKORWiF2TqmlDdUlAWKmwg==
X-Gm-Gg: AfdE7ckvp3/jYTqQpjKm40dwH+NoKA+DGvmiZS+D4d64ww78kYEJDXM48G5Fyk2uCNv
	T31fGBOJJGYEBu+YJEY4JieHepf7Vi3hg0iIWCJPTGNu13QbGH+EIlQJt5ByxLbmjpgAsdAdpSN
	Qy6XdMhRusxJVX2GZ8rD0dkkYAlyw2PzKcom2PZJewMDpQ+pIGGZDIjRtP5x9hm6f2oEIfisyE5
	MSAX0y450DLlPGGjR/eBQHt2hSf3YGgyvmmhmArZ5otfxdkd3xCevlaCwSvwVo1iM8hH6x+H/tq
	Dr1F2Cmvavrq8mx+ViXgkbByTB43XEYT+lq+YQzb+qKk6qLFm7+f+mlWDquL3ZaEXD/V+R1gnZ6
	6HBaY9gjb/qqkT02+TZGfmPV8GXfvDOcpPAzRj1pb
X-Received: by 2002:a05:620a:4142:b0:92e:4927:2002 with SMTP id af79cd13be357-92e492736dbmr624551785a.39.1782724424945;
        Mon, 29 Jun 2026 02:13:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4142:b0:92e:4927:2002 with SMTP id af79cd13be357-92e492736dbmr624546485a.39.1782724424493;
        Mon, 29 Jun 2026 02:13:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:38 +0200
Subject: [PATCH v2 15/19] platform/surface: gpe: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260629-pdev-fwnode-ref-v2-15-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=y0PJDyn5BtOol8KVSo5zceqlnjltVLUQGrxeuNwB+wE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpCNxPIX7sO2Fb0OtIcCoatdP5jodxjCxsQU/1YqFPwbJedd
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqQjcTAAoJEAWdLsv/NoTDHfEP/10Z
 21j+qEaic68CLQuNBgdz4qIRaZIQyRi53HdUwXT8kM6isFULDu5pDNwbBcED/OoC7ALIIyXTpaF
 vEGkyDXAVbzZh5Fpx1BIslvGuXi2wklBdo6eTGN3vz78IUpeb4d6m4VLnRWlfT36IHUS6DT+1h3
 6FUzolZExDbTRa8eUKgTHsZueNoWqtMjRD/6q1ABfXaSpCv5DTIxIqYPnLe/GIZLGFRIV1ivNXX
 hHJYwFz+c9Mz6JzWVJMLuE+fp/iaLBprk8wKW6WLOydKvpF38shDpUBrmdiQsye38mT+aSlL1sE
 Wfr0pqU/u4DS00d6i696v5TbTwWv8mMfteA9JBoEWjLN43gkhGSiRMceHcM27gfGmh4eklHUhni
 BnpeGsmGkYrGhdToZhNobNNjt8LhsrwfY9GQJGpctK8hCY1Eq4RQcHJTuIBLCGFU9PB42Jw7x4K
 XUL4XeOH6TyhaaGfNIVyz/ECTSBWXCOd5Ar0s92Twtl6rjLacXc9B3VPQBabDnNvh9UKshVwjaZ
 kugbHG30Vv/wx4wJXw//jwQ+EdJsZqJkqBZjyrmFdB2yL/M/0/DXU4l9FGFfciBSZGNqtCHNKzc
 d3ts2rLnwq6iYVMApbO94BjIvXf7W4Rpp3GbYF3W/H5y8m4f20s7uAqcwXkMY2RAz16tHXgSG1L
 WCwgE
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: rJYI7WYcH1609hiHG-qEBc1jpAWYQ93G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2WidmPfiECsm
 JSZFXbD8EQoZtJ1z75+HEgI2l44iLMf7hLvS9OLBzli70+jF9VSi21rqCJ+2EPZ9TRW5a9LprZ5
 JW2QurxoQDhepBZy7d1Xxz/g0eF0KB4=
X-Proofpoint-ORIG-GUID: rJYI7WYcH1609hiHG-qEBc1jpAWYQ93G
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a423749 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=PjYnKYjuuXkzxcC25kYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX+2S6JqFx6dOh
 4Z3ff99fUsbqDllp7kaILree34hx7pmYWeFahn61pxcD6il9UD0tXhueKziMJA9L335VCBbvU2q
 1m7cshuE7xVEoq2zpO1nvvSiMuw++b7WHk0XoRrMuPyA2QiBZcERxDnnJWdxNl0wn2lN3U012vg
 3Mv93M2mzD8lIcMXm0DzK6ZigqWv8DDqoOB8xSOW9ejMkoTqV3x4RhWOXLrUwsmOupNZKmhEIq1
 sRJJhrWR5cVye+Zf2XELUnROSn7xCZ4K2UQ9EU6rbsT4CAjHY3r93WJI0/dDEK4flN+qM+nCi8n
 h3QdKiZFsnYUko8+MDz9sFwEVqT7v2X+p0SXW2tEsgX4X8qcyKQTeJosCkVQP8pUYG5vy3cS7bE
 t44RtaRUfhLQOCJRhLkR1KpvRb9xrU561G3tgAC6NfTUJlNRQIw3rxCF1dQ5i+A8jcvBFg4PRNv
 5kEGgY7HI8r4BjFQoTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..40896a8544b0a4da4261ea881b1eaed62d93b32b 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -317,7 +317,7 @@ static int __init surface_gpe_init(void)
 		goto err_alloc;
 	}
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	status = platform_device_add(pdev);
 	if (status)

-- 
2.47.3

