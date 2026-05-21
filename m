Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B813C37AF
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352693; cv=none; b=ee2gJvi4lt5ScH6H9fzNzGCd2Y+JMSuLaRXriGtwiFd3fFMidAi0pvKmkkw/qdfsWvoZ/9yTsBSlc5TgTM9Bg5R4LZFpO11Nl/SztSorFzkH54y2mUIPDta70p88YCpWRqda9TYBPCA78glOzvFQwe44cemf70Zik9gJZS4g3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352693; c=relaxed/simple;
	bh=AwfZgG77y5F6PYl9qwo0/ZCBmtiBmspJvlFnU9x6+ng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXDJ6vpI3Hk+elIfkUZ0mZAvG0+ikzK7BeYe4FwRRpQnzKsBZwa0fcY8MfgK4FaEJoU2O2nI874Ua/DRE4SttiW0qS9JgqHd8e4SVexrH4+oK63i/9+2icqjjEEiuKGsL82efN1PTNaXFQ0N+Q8oBORY88DgEEEVX2VyfVkq7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ID+Jeg6V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UHz+k+HT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ID+Jeg6V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UHz+k+HT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6nOhJ3680282
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=; b=ID+Jeg6VlEGzfzjc
	ABNrWzZHeBx6b0H3uUKq40ilRNX9Lwmp27/eT6p8sqUlI8n7hCN+EsBbS2YzzKop
	JoMypKPL1A0XndiIqoopYstFcCePXRPlk438/kTYwZ0/rhrVjqysUZVUBqa1ZAGS
	sQkLOBN6F40mShMHg9Al1lnYmiEP9xCxd8FE17Vu4IUaTwGuAqmloZcMTCVEjvTC
	4M7WHfnN2yMZri+DObmOK6XPwjjcxgzpYeUcLJAB52rcWBOzxdmg7IVnbtUW3n/D
	dsLaSqGUIY7Ik51Fb/FGLeksa/UgN25CxQ5aBBvosWKNDShAFMB2zveNzJlZhGJq
	Z31BOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j413q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 08:38:01 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so75595191cf.3
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 01:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352681; x=1779957481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=;
        b=UHz+k+HTRJOh/XaBEsPrHkkm71jz2H7BKLcGaZhMFdMeiP8mWJDSHke+UFMAZWfGv4
         Avwrq0z+XtESEC44vVVs+0mvFvMwbxloT0Vy0CwW6aHVw+C29LxZvH8nk0d5jaAboiLO
         tlibqch5qAsf5GGrZCuHoomaa5NpEs4yjRRl0tw0pYNL6pIWtFfDwitqNnkVnbLwkO68
         L86j5gigQ5C91Q53tOrKDhmUrwoq1NxNW+ydXolJnKc7ChMzmh0niNBqA8V4n8QZJxSM
         CXtZ+VwiaEvsuCVIYJTCcKHt2XA0K+N/qk819iYBEuDkf6OKC9YftrDs0ozadKNeQ/DT
         abCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352681; x=1779957481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6nG1Sji42mne2H5wEre1safG9ubwm9+aubw7cimzGYY=;
        b=i6hRtpQ7v2wPdzVgnABuGypWont1X2xBOq6NuYhF5BHmOMYLyxH/Uk9T6Bkod2BCMa
         C+Mxb8K03FYCxUX9p+yn/jAoxck9IpcMWAIXeiNaQFMYOXH8bbTIz2G7KOt8cLw4brN8
         7nkuQgj/xU+0+68GfPkj1XbqDhFpXWuZbT/CLlyqObpRpr4IbJSeYxiRx7vE+ljQcOH1
         D1pLU6T8Zp6T88wt/k0f/bDSj4kLfkjQK6IIgB7PGiy7sEv3+0MiN3N7EWUUT2nZdpix
         C4K0dFgTSU0IcRnR78tR+dYP0AI29MXRr/ZvSsLAuAjbAnmhBIRJsHoxiOZLTZIS4DSg
         JjYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+deaH8NRD8pLUoTZanm0QrEbk3Ku5dfOEbVty0bG0HQ4/0TzZhH1nCIvd3JPBKt1jIPZ0ZlF40e7xwjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0XY6XpqYA44SySRSY7SrtQEBBp+RsBXRTynTawMSFu5lPOzN
	qkMQ/mhsA6WwcN9zYV8EQl+zIWAsXq7sb0NeHOHlw4VQRHZgk5ux5BJ4p/t2qEtyZYEHCKC2wki
	7cAhPffg56Yv7YF/KhJjKIoRZ/q4GJ3xbKbwQ3TgXRkTWKejP+zesGAlR22si8e2yvA==
X-Gm-Gg: Acq92OE67PdYJV40kBEAEL7qGd81fUiccU9BI4Hn1FbjcrGpTDIR6utTMmPHYOvroZu
	G0cHy3Cfh3q20K6iqSqU7nND+zgsih5FF6y/seyTrZa2cd+xvQb/Qyz/4cxnCCEBYH6ket8g+6a
	r/z1MLe5NB6TsIjW10xwK1hmRyef8W/YX1irCD42zWyiExdq/pEI2OmF+RkzmjSH6QyDQLiCpQc
	L2Z6+keIj1dZwRKdzv0ZGXV6LRRIAcbHv9QwhufqFFPH+H0i/DP/vrhyO8fMlXQ6BbYh0PPdNlp
	D2yvznQ+SW/wn/k++ZZZhuFDnIK+d7Jb5JfKVDzVISZKT9uKpOabH6sP9frlxZ8NTdUiybu8eDu
	Hzkxt/qSoTAIZUFsMN4Csi6aqO56zYr0HYAAXXOwwSGt1YtNQ5T4=
X-Received: by 2002:a05:622a:428f:b0:50e:6139:492b with SMTP id d75a77b69052e-516c54d36ffmr25861561cf.23.1779352680580;
        Thu, 21 May 2026 01:38:00 -0700 (PDT)
X-Received: by 2002:a05:622a:428f:b0:50e:6139:492b with SMTP id d75a77b69052e-516c54d36ffmr25860891cf.23.1779352680022;
        Thu, 21 May 2026 01:38:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:41 +0200
Subject: [PATCH 18/23] drm/xe/i2c: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-18-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=AwfZgG77y5F6PYl9qwo0/ZCBmtiBmspJvlFnU9x6+ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQshnSHdAuFYcbx8TH9pg/aRRhueDfp7T805
 pLQ3jVO1maJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELAAKCRAFnS7L/zaE
 w0AcEACkcrfqqJKu08qKaQURCEwjaC0VPahU3S9U3283GXeiErM5IYNu5JJrjea3QZl8MlfmXb5
 SFTYfrLXmYI6JIuyjgl2TQzUA263xOXlZUOeO8SGMopYyTxHYNvv0ONqcLCGyUZySI2ty6bUgNG
 64YtY7WTwOy4+CDzbAma+vOVRDXqdOvNAAPCeIIBTW2y4caXnY98e0qOBSTRtTkck3h89oRImpT
 zDeeYJeFsOuex54YCWKWOplr8Z+ZwwRzreIOMcRxLpmtDDQHcj+SLjNhOsRhyY7oq1RQ6w3odA+
 M4QLbO8O/ZdydOkb2886HADgldVNoch8RXYxlFkPIBNDG7rGsFtgDuiLI6onxjFzFjIzEivvkWd
 avWAoE1QA6es190q5P1u4C/pxi8SEtsUnGt/wQjIuHwT9eyxV4235FPNkaI8ZMSLwxLILuNUADT
 XGLV766TGSDRYeqcHDnHwlX0C425iCJgB7nmpY7EU65lHm6EazqmjATmUWaIolfry29pp2gk9Nm
 rpVpkLIugd0sErp4t0xihwMkR+IuTy/CAtj/yLudnWxJByNNrQrz/qqIhuS7qEoDNxaMKfwKf2K
 y/swBz0CNPMHxovuMxz/G1myVahNG5fM9v2kTWQJ4UOGn3hfxvNb9LgbWFZ4spA/hRyzjmlCapB
 4qJ6Lt9j4lxYQ4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ec469 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: arwY7srKyAoVUU5AYxOmLQHxHXwJE3va
X-Proofpoint-ORIG-GUID: arwY7srKyAoVUU5AYxOmLQHxHXwJE3va
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXw6pEGhtmrTzk
 YE5W42T3ePM4C+OYup+DkFVQo415orNHQr87i9+BhoNrtn150bABJTO3ptvKaEEC8K9Zc7O/OiW
 PyRJ/0qtPrMrKQovN0cB0jjfmXjRowFKkFKUTvj7AAKuTNhtBJJxzH2U/pn2GMYdkNUiGpjTwpT
 UPxhpsE53h+kg/Ily7AF0g6u/NOGkyMVb13nj8bRlDR9kv4AwtQYWpj7BKXxk2X5BktTPfcOsfv
 Gb3lE6uHQxQvWcopG8wnp86ww484HqSry4EmHn/M1awSaqbrDJ9vFmPRi86WpJQgqDmEl+rwBMh
 5j8eWcJxEqd9bYfFe3NBwP5wQRBbkFSIPi0U8w/wgUv52ZrjAshsnYRMd573smQbvLbOlM41s/L
 iIY0Wvt2jxMSH3AnzcJvf4EEk0bTVq5TLgRpv0lf9OsEB0FVJUgcNtFSIUuxKitYBVMUC45BKB6
 HLv5QzbmxyepRC/tZ6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 706783863d07d66b4685005d6649b3cd143ecc3b..af4ebd93ad8e68c95a14cdf99de0959fbe080354 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -123,7 +123,7 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 

-- 
2.47.3

