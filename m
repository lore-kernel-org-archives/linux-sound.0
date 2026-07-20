Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A63D9DD1
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539561; cv=none; b=h2JZ4xtwo5mcn/WpYxmfoLSZSUmISZ2CF3XupuucAEycjYYV58dEdHPHB9MfDpwkUhd8J8/eyb7yuHwvcZwuDpivJMCR5l6ek3PTW88dp1NTQ9ntIV4lKtsxKJ6JjPCWP5uYRnZJH/YZCn2zbdvoCiHipxa1BZ0/8cp/IZN4Hfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539561; c=relaxed/simple;
	bh=5dZucFiY5F1RZ51PQHBmBTY1Q9tlwcM2jWxPuS3OYck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPhkcpGDDeFTtxFUXayJDSWolgKSrAcxXNrenJyb2CWEhUE4Adb9axZeEF2h8bx+QpT3go87ZaJBjMmaxYrnrUnSN32WiXwOeVi4ue5TwU/xzk+HrdsfCBc9jYZkQtTYR4sXi6rtlBbzymQMRaXGarc8Jn7/3eZVMvCEuBb6l6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQU8ohY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrhUwkBm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQU8ohY7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrhUwkBm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K97FeJ1900993
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=; b=hQU8ohY7JoqMaw2o
	gJQ8ERonvZCbG53rd6f9Hj6Cy0YgpXa0kbaTI5/QqqOon0C02V4LNJ2+EsdouW+d
	TTdw5/a4an0Mxixvb4u7sUgDtxyyaoLg4OGI+V4czR5cPkZVb0VZK2oZ8NKRrKYN
	HaV/bbPfTsJmJJOWjOy0oW6uywW1yCdiBV3uKsuJMdUsS5/OwiAbrrLMkLjl8pCw
	6PkjRX/plQV5ge+glDz88N4CyiChe2nKkBfMigG7FqSutZKY+CKqclYBBWtNiH3n
	aIzeYqIjbaH+v1wG+u5THy8VWCAsa18Pi8ZjeTQ4HFBwVptu8nrxT1cEE4jW/2xB
	ba8Jjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs002k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 09:25:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso108142241cf.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539553; x=1785144353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=;
        b=UrhUwkBm5f+Su9zl3EcgSanD5eNrWk1HOhbtTlH0YOLJSVTbZEujOesupCuAe8sccv
         BWcXThgVEZUGfcwfeu3yeEVMS7yGZwTlfUdgvxMcP5BczhoxkfFzPig+l4G6uMUTk2MS
         SRyztD+cBqI8tn7MPZjC7MiJR7aX2URpQn787Ppah3JISV8MJ6Iy5qT0OSGoo/3I7wPE
         DkWVWiXULcYSgFUJnghldMAUWylwdshErLep9YTikn09C+g+PjEm552NpUUk9a1G81Wo
         5l3yj+UzWnxrcCd7R6lhQjL18OJwKe6wdP4VJjIqwsVx+lzj0BvzAoPMitTT7VH9sPdM
         WEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539553; x=1785144353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=;
        b=pK+RgkUCgK8c/owxGSkhcHsNF4JcZ3j8C7YKB6c3E2add00yB3larDQJ/DXqiJLka6
         FaWsE02l5JsotJQYnS6BxS99lGDf4OPh3gBTBiQFusacznS7wls76tw0N2QxHUghdt3X
         ansVNyQ6QdgXEk6ylLkny9axze+DtgCSY1JzDcPUzM0EVSnUlIn2UuDiD9tzkIfjL7OS
         EdSsFnJa7qTx/uffr/MI5xnJi+1lGxax4vpguXOdStrUHM949E7FonGCFPNoFTcOk9sU
         1ZzX0BUBBytvwNKjAKiFUUoYksrEZVg+XqegjVSvTCSUr+QcLuGo6qETG50ME9FvYy8N
         6FZg==
X-Forwarded-Encrypted: i=1; AHgh+RqL9fylWFmf9MegdTwZgAf9fW6D3rnTKQWN4PYi1bFq7YyVjpcm3SqNYAxqfSg5P04PiKOPUSKdcgm11Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Bf/9852uSro0fjKgfhU2TW0nGi4TDoNqbdjYMLi5F6VemUkj
	c487I4uk21TXufzNIMpzH8Ew/w7pGdsC5Bjval7/g2hMYgnpHaYlb+UGoD4EN2JamldM2U3PtKW
	7YDqvi2vOjixwfoj6sk0e0XtAt2pagz7FOBlyhnybtq71be2JL1f7pzEnf+zt6ajisg==
X-Gm-Gg: AfdE7ckWcqiF+m8PcXDloSKX0PEmNLR9BIodLSa9dGh15uzkdGlEodfthUgpB4HjLEt
	o2k17vSaBqLjOlI/V+1t+3v+xrz70xUK2SnD7Gv+26Uz4+WVzwdIA65ahxPV3QyL7WxLPA4wEf8
	bu/y7yju8XSCG/2fw69cFkb6Ad02AW4nNjbbQMEShPeAw2HANk4aCqv1O6l02+JL+OLY5hbgnBl
	mpY+F+6uuNPU+m72+LfXHdgGBSjPhwRIkm8n1NikeHWFYJhUcJxytzRyCDua1ST6PHPKdytvP4D
	DcKofQNPix6NFsciMBzODoBxaqXM5o+OO0gBLOh+g1oBHVM64SOEL2Ono2g4Wg2S2PFFbvIS5od
	eqhyZ1Rz9l+pojgkBU6Zwkxe5Q3t/Kw==
X-Received: by 2002:ac8:7f83:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-5213daa20eemr117920901cf.51.1784539553333;
        Mon, 20 Jul 2026 02:25:53 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-5213daa20eemr117920471cf.51.1784539552960;
        Mon, 20 Jul 2026 02:25:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:55 +0200
Subject: [PATCH 8/8] slimbus: qcom-ngd-ctrl: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-8-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5dZucFiY5F1RZ51PQHBmBTY1Q9tlwcM2jWxPuS3OYck=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXemASNLxq4W2lq91kA9NcZIXQVZtNYnprewvw
 3yHlCsy3VqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pgAAKCRAFnS7L/zaE
 w2uCD/wOU3cBVw4EUJf0UYoXTg1HPMi8P/ZsqqsWmYAwjo7fxHcTqJbrn0eiqRL4DGI4WMyvG60
 V+0SsJlynCdNE7f5EUlwizOq84HOSgkOFhWcy1qO9QHvA5ZUn3pD4p5P/apWnvlfSjMrCgfW6Cv
 j3f/kuCfwhE3zvoQiwbJKsw3Z5I4ZvzyAAKpuw1L2UnIz0c4PF3F3aM8KSrOJAkVj5uvCqWv1ec
 B/AYzpNDdlNiIKEr5nlz5onmZgVYEc488RYdR8D6I/WNggYPzyNFLoESaH43Vxxig+CyAwrsjzZ
 o8d6pZtIyZAaJbH+7hGLtVAdr8JNHyKtv2MeIkWDsOK5t4odmeepq+uGt4Z+wLL5txrMInQNa9i
 CpwMS1b5MsZ2Zzub7p1c+hjtTrFLAtSCsLnDpuZeM0kspndYPXH+9aJ1ikuDaIY8rYYY45PmfVl
 5IPBo0aXvFJ1cF+N5N/gFPL8eHrOSWBGQ4E+1GkdbYVljaIC1z2a0evNxWVYWUlYGAIygMAktf6
 EdLDOWEg9v5RX8qWkht3mSA1zTTRpZyQ2jiUBxOl5UDbZBOGIvc4w71t3cYV6WAk3qn92NyUB+W
 zTJ+U4R83omht6v8g6JVuiBdRHrh1ZIIR1GZDI77FyHqG14uso7dcBQnQYs2bVz/YkOSo5imubp
 GZ+Ni2cPpMJ3VIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfXwzEcrxr6FwQB
 Iz4vuxNMEG2ifn0zM8BNFFTmR2PjGeULmQ7i31FS9mGsCMPVQYeGzFV+dUbqm2dPDQNs54Cbmsr
 kAv1bQOjsj2TNOH28oQZTBpBEb64O3s=
X-Proofpoint-ORIG-GUID: bFouDPYX7VWlY3vHnnkF2pfEuxJcy7Ez
X-Authority-Analysis: v=2.4 cv=DMS/JSNb c=1 sm=1 tr=0 ts=6a5de9a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Dy7njVIJoQnLZkscNskA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: bFouDPYX7VWlY3vHnnkF2pfEuxJcy7Ez
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX+2jxPc4DWICW
 tUvAvhBh6JigrotgSBXrwH3BXYwGk9qW+VImGJCcDQZXBUP3G57w4zkJ4uzFTtN5Smv1c+Wbqo4
 gGCAZJ3AQOkmyMiz0By+QTHvSmQ5O55HkJAlRTWRRYbz6VQFmsieCE+gYrNB2s3pMXCAQdRnEwf
 iELGl4LXnULwuUP1YwcQjJkntVS/4gyxeNijZn53Q/aqzOCASFFaTRePPrmqO94t7GZapuchyER
 Ks4kTFWTVlyZYoKUCwPNX6Cn4Tx8QlytMiD7BsMFXiaMMuw6WwhkAtD8g9aSZJIq9oyF13bK5IJ
 NAx9LfjPYnQ2KVVcCEGiWgRxpQvrCmGd4FIsnda8o22ZMPheeN6pgWGivY/TE97OnKAq92PGv/3
 EALoawLPNmqpSXAwdAvlvBtqDivgtK1WHcp7W7j0j/YR3yKrMRkfmPc5xxOxCDHVCGqc2+radsQ
 Z4lZshbAN2VVIZnxSvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 934c44c5bc1a92fae98f52bccd12ed849379dca8..bf077f47c9ddd484c11f98b47d2d8d4daf78dcb7 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1538,7 +1538,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		platform_device_set_of_node(ngd->pdev, node);
+		platform_device_set_fwnode(ngd->pdev, of_fwnode_handle(node));
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3

